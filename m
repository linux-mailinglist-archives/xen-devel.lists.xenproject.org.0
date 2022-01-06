Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D85486413
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 13:00:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253963.435421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RRc-0006pB-Re; Thu, 06 Jan 2022 12:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253963.435421; Thu, 06 Jan 2022 12:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RRc-0006mR-NY; Thu, 06 Jan 2022 12:00:36 +0000
Received: by outflank-mailman (input) for mailman id 253963;
 Thu, 06 Jan 2022 12:00:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5RPO-0005UX-Vf
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 11:58:18 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3e64e6f-6ee7-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 12:57:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 188541F3A2;
 Thu,  6 Jan 2022 11:57:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E4F1D13C0D;
 Thu,  6 Jan 2022 11:57:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OCy1NkXZ1mHnJgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Jan 2022 11:57:57 +0000
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
X-Inumbo-ID: e3e64e6f-6ee7-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641470278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+GsFFIwit/Rt80w572ZQFBg1V74eYMuV1hjsub3Nyy0=;
	b=j/mDeu9UoOTfcQ/Pp6xXG3woMs+R3iP731Yk+OmKxmC5o4xgv83dcLoIqnL4xgZF/KUkzW
	9lsqeKRBzTMviC0ajrCi4mO4MNc7tXWd9ZTMAMT9Wf38zyCnpyKxYdTNxs/ipBsp+j4eWv
	gMX/kIuCenCimRfwWjVkagf1Wrk9yHo=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 15/15] mini-os: introduce get_file_from_fd()
Date: Thu,  6 Jan 2022 12:57:41 +0100
Message-Id: <20220106115741.3219-16-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220106115741.3219-1-jgross@suse.com>
References: <20220106115741.3219-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exporting the files[] array especially for components outside the
mini-os source tree is limiting the ability to change any file handling
in mini-os.

Introduce a new function get_file_from_fd() to return the struct file
pointer (or NULL) for a given file descriptor.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/lib.h | 1 +
 lib/sys.c     | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/lib.h b/include/lib.h
index 91364ba..7a0546b 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -198,6 +198,7 @@ struct file {
 
 extern struct file files[];
 
+struct file *get_file_from_fd(int fd);
 int alloc_fd(enum fd_type type);
 void close_all_files(void);
 extern struct thread *main_thread;
diff --git a/lib/sys.c b/lib/sys.c
index 6f2b026..0e6fe5d 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -98,6 +98,14 @@ struct file files[NOFILE] = {
     { .type = FTYPE_CONSOLE }, /* stderr */
 };
 
+struct file *get_file_from_fd(int fd)
+{
+    if ( fd < 0 || fd >= NOFILE )
+        return NULL;
+
+    return (files[fd].type == FTYPE_NONE) ? NULL : files + fd;
+}
+
 DECLARE_WAIT_QUEUE_HEAD(event_queue);
 
 int alloc_fd(enum fd_type type)
-- 
2.26.2


