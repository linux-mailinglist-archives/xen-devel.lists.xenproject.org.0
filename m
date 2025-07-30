Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C970B1603F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 14:23:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063884.1429634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh5qH-0005pb-WC; Wed, 30 Jul 2025 12:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063884.1429634; Wed, 30 Jul 2025 12:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh5qH-0005mR-Sn; Wed, 30 Jul 2025 12:23:33 +0000
Received: by outflank-mailman (input) for mailman id 1063884;
 Wed, 30 Jul 2025 12:23:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txka=2L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uh5qG-00051g-Db
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 12:23:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00ce4380-6d40-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 14:23:30 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 876A2219D1;
 Wed, 30 Jul 2025 12:23:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 512601388B;
 Wed, 30 Jul 2025 12:23:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 96MrEsIOimikJAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 30 Jul 2025 12:23:30 +0000
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
X-Inumbo-ID: 00ce4380-6d40-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753878210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/WAy7ZfzAdZfOYDos9+uJhuz1NfdLzQ8HaGXK/lMiv8=;
	b=LsWK3jJE0X0+cGux2FRoNhaURTE4HxOC8Ju/X67CEvM/MyHpP1gCEDyaIP3rMJFn+Zolc0
	V3UAdizU7KYS4FYTs8RnTIOQdoevqY3iVYPYSj0Ti3nhwYmufKfp2EnQzL2dWoIuA0/dK9
	xBTnkxNA8CQL02m+5ZMInoWKOCDOzb0=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=LsWK3jJE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753878210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/WAy7ZfzAdZfOYDos9+uJhuz1NfdLzQ8HaGXK/lMiv8=;
	b=LsWK3jJE0X0+cGux2FRoNhaURTE4HxOC8Ju/X67CEvM/MyHpP1gCEDyaIP3rMJFn+Zolc0
	V3UAdizU7KYS4FYTs8RnTIOQdoevqY3iVYPYSj0Ti3nhwYmufKfp2EnQzL2dWoIuA0/dK9
	xBTnkxNA8CQL02m+5ZMInoWKOCDOzb0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v3 4/9] xenstored: don't use xenevtchn_fdopen() in stubdom
Date: Wed, 30 Jul 2025 14:23:00 +0200
Message-ID: <20250730122305.4050-5-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730122305.4050-1-jgross@suse.com>
References: <20250730122305.4050-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 876A2219D1
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01

When running in a stubdom environment xenevtchn_fdopen() won't work,
as any file descriptor state is lost across kexec().

Use a wrapper to replace the call of xenevtchn_fdopen() with the
really needed xenevtchn_open() when running on top of Mini-OS.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xenstored/core.h   | 3 +++
 tools/xenstored/domain.c | 2 +-
 tools/xenstored/minios.c | 5 +++++
 tools/xenstored/posix.c  | 5 +++++
 4 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 1ba9592d16..bef24a688c 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -29,6 +29,7 @@
 #include <stdint.h>
 #include <time.h>
 #include <errno.h>
+#include <xenevtchn.h>
 
 #include "xenstore_lib.h"
 #include "xenstore_state.h"
@@ -405,6 +406,8 @@ void handle_special_fds(void);
 int get_socket_fd(void);
 void set_socket_fd(int fd);
 
+xenevtchn_handle *evtchn_fdopen(int fd);
+
 #ifdef __MINIOS__
 void mount_9pfs(void);
 #endif
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 2362216a7a..6767d29a19 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1396,7 +1396,7 @@ void domain_init(int evtfd)
 	if (evtfd < 0)
 		xce_handle = xenevtchn_open(NULL, XENEVTCHN_NO_CLOEXEC);
 	else
-		xce_handle = xenevtchn_fdopen(NULL, evtfd, 0);
+		xce_handle = evtchn_fdopen(evtfd);
 
 	if (xce_handle == NULL)
 		barf_perror("Failed to open evtchn device");
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index a229954cf4..aa1f03fd6b 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -85,6 +85,11 @@ void set_socket_fd(int fd)
 {
 }
 
+xenevtchn_handle *evtchn_fdopen(int fd)
+{
+	return xenevtchn_open(NULL, XENEVTCHN_NO_CLOEXEC);
+}
+
 static void mount_thread(void *p)
 {
 	xenbus_event_queue events = NULL;
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index 6037d739d0..ebdec82215 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -408,6 +408,11 @@ void set_socket_fd(int fd)
 	sock = fd;
 }
 
+xenevtchn_handle *evtchn_fdopen(int fd)
+{
+	return xenevtchn_fdopen(NULL, fd, 0);
+}
+
 const char *xenstore_rundir(void)
 {
 	return xenstore_daemon_rundir();
-- 
2.43.0


