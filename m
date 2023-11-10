Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364E57E7DB1
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:18:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630551.983504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UCp-00028b-Ax; Fri, 10 Nov 2023 16:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630551.983504; Fri, 10 Nov 2023 16:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UCp-00025F-7M; Fri, 10 Nov 2023 16:18:03 +0000
Received: by outflank-mailman (input) for mailman id 630551;
 Fri, 10 Nov 2023 16:18:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1U58-0004cS-6w
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:10:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9be5011b-7fe3-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:10:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6490D219B4;
 Fri, 10 Nov 2023 16:10:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 34DB813398;
 Fri, 10 Nov 2023 16:10:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2kyUC9xVTmVVCQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 16:10:04 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 9be5011b-7fe3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699632604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xXrI1g3Tvz8/s3KD+jk6UgdILP23SjhAZanYf4v0CdE=;
	b=EUKZTg0W+7XorSEy1L1YhxkUCzrrBiMgIauLfCY1hfNf0HLs55rTlEAlJVPfH8ey1ARC7L
	2tjNKt2sPStZB/lRJBFVrVGJODWY49v8L8tOwR17JEvI7SGNQV9zGJ82Q/mlAawRrLzhEY
	YvVFKZQQlCSU8a5r6+MukxmCzG+UtgY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v2 21/29] tools/xenstored: add early_init() function
Date: Fri, 10 Nov 2023 17:07:56 +0100
Message-Id: <20231110160804.29021-22-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110160804.29021-1-jgross@suse.com>
References: <20231110160804.29021-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some xenstored initialization needs to be done in the daemon case only,
so split it out into a new early_init() function being a stub in the
stubdom case.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
V2:
- rename function
- move patch earlier in the series
---
 tools/xenstored/core.c   |  6 +-----
 tools/xenstored/core.h   |  3 +++
 tools/xenstored/minios.c |  3 +++
 tools/xenstored/posix.c  | 11 +++++++++++
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index edd07711db..0c14823fb0 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2933,11 +2933,7 @@ int main(int argc, char *argv[])
 	if (optind != argc)
 		barf("%s: No arguments desired", argv[0]);
 
-	reopen_log();
-
-	/* Make sure xenstored directory exists. */
-	/* Errors ignored here, will be reported when we open files */
-	mkdir(xenstore_daemon_rundir(), 0755);
+	early_init();
 
 	if (dofork) {
 		openlog("xenstored", 0, LOG_DAEMON);
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 480b0f5f7b..d0ac587f8f 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -35,6 +35,8 @@
 #include "list.h"
 #include "hashtable.h"
 
+#define XENSTORE_LIB_DIR	XEN_LIB_DIR "/xenstore"
+
 #ifndef O_CLOEXEC
 #define O_CLOEXEC 0
 /* O_CLOEXEC support is needed for Live Update in the daemon case. */
@@ -384,6 +386,7 @@ static inline bool domain_is_unprivileged(const struct connection *conn)
 
 /* Return the event channel used by xenbus. */
 evtchn_port_t get_xenbus_evtchn(void);
+void early_init(void);
 
 /* Write out the pidfile */
 void write_pidfile(const char *pidfile);
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index 0779efbf91..0cdec3ae51 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -54,3 +54,6 @@ void unmap_xenbus(void *interface)
 	xengnttab_unmap(*xgt_handle, interface, 1);
 }
 
+void early_init(void)
+{
+}
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index 7e03dd982d..fcb7791bd7 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -22,6 +22,7 @@
 #include <fcntl.h>
 #include <stdlib.h>
 #include <sys/mman.h>
+#include <xen-tools/xenstore-common.h>
 
 #include "utils.h"
 #include "core.h"
@@ -157,3 +158,13 @@ void *xenbus_map(void)
 
 	return addr;
 }
+
+void early_init(void)
+{
+	reopen_log();
+
+	/* Make sure xenstored directories exist. */
+	/* Errors ignored here, will be reported when we open files */
+	mkdir(xenstore_daemon_rundir(), 0755);
+	mkdir(XENSTORE_LIB_DIR, 0755);
+}
-- 
2.35.3


