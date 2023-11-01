Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 941337DDEB0
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:50:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626309.976472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7rK-0001TM-Hz; Wed, 01 Nov 2023 09:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626309.976472; Wed, 01 Nov 2023 09:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7rK-0001Rh-EB; Wed, 01 Nov 2023 09:49:58 +0000
Received: by outflank-mailman (input) for mailman id 626309;
 Wed, 01 Nov 2023 09:49:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7dn-0005E0-Vi
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:35:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10a643c7-789a-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:35:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4FE9621846;
 Wed,  1 Nov 2023 09:35:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 22A6013460;
 Wed,  1 Nov 2023 09:35:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XNstB/8bQmWxCQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:35:59 +0000
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
X-Inumbo-ID: 10a643c7-789a-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvPBJlyg+rtDKl5QJN43vNqPqvgJfq1ZXkp/nXSGa04=;
	b=BPZ84pRdrc1OTDb05gU7LEVcyGAmzcXl35NBc2rld6cmfAo8qOcXvu9IoOfzQYy2Y7cIIj
	xPop956+noIIGOQs7fqybUOzNc+2B8tJ060n4uzrxGMIq7suBgwLGs7zVH7nDjEOLU7KJK
	BKhHIv3pr94aYyDubRwop3JjZaKDmJI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 27/29] tools/xenstored: add daemon_init() function
Date: Wed,  1 Nov 2023 10:33:23 +0100
Message-Id: <20231101093325.30302-28-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some xenstored initialization needs to be done in the daemon case only,
so split it out into a new daemon_init() function being a stub in the
stubdom case.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.c   |  6 +-----
 tools/xenstored/core.h   |  1 +
 tools/xenstored/minios.c |  4 ++++
 tools/xenstored/posix.c  | 10 ++++++++++
 4 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 9f48d91027..204b932ca9 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2949,11 +2949,7 @@ int main(int argc, char *argv[])
 	if (optind != argc)
 		barf("%s: No arguments desired", argv[0]);
 
-	reopen_log();
-
-	/* Make sure xenstored directory exists. */
-	/* Errors ignored here, will be reported when we open files */
-	mkdir(xenstore_daemon_rundir(), 0755);
+	daemon_init();
 
 	if (dofork) {
 		openlog("xenstored", 0, LOG_DAEMON);
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index d3cd4a4c8a..a15d5b0d67 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -391,6 +391,7 @@ evtchn_port_t get_xenbus_evtchn(void);
 void mount_9pfs(void);
 #endif
 
+void daemon_init(void);
 const char *xenstore_rundir(void);
 char *absolute_filename(const void *ctx, const char *filename);
 
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index 104f37587b..cd6e288f2a 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -62,6 +62,10 @@ void unmap_xenbus(void *interface)
 	xengnttab_unmap(*xgt_handle, interface, 1);
 }
 
+void daemon_init(void)
+{
+}
+
 static void mount_thread(void *p)
 {
 	xenbus_event_queue events = NULL;
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index d02d0e446f..c84e7ef3a8 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -163,3 +163,13 @@ const char *xenstore_rundir(void)
 {
 	return xenstore_daemon_rundir();
 }
+
+void daemon_init(void)
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


