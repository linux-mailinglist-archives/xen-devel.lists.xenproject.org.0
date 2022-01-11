Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4F148B078
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 16:09:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255844.438666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ImO-0007a6-Ur; Tue, 11 Jan 2022 15:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255844.438666; Tue, 11 Jan 2022 15:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ImO-0007Xi-P1; Tue, 11 Jan 2022 15:09:44 +0000
Received: by outflank-mailman (input) for mailman id 255844;
 Tue, 11 Jan 2022 15:09:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Ibg-0002Oa-ED
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 14:58:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec3e09a2-72ee-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 15:58:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DAF8921639;
 Tue, 11 Jan 2022 14:58:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B2F4A13DDD;
 Tue, 11 Jan 2022 14:58:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SEeCKg6b3WH9eQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 14:58:22 +0000
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
X-Inumbo-ID: ec3e09a2-72ee-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C9AyKNzGKENy2BPxgLKGB+hFKK51Mm2oD341mOYK6aA=;
	b=R0GKkNi+dhG4W5lbRM9+2Frk+rVnQIdIdPOS8v8+F5cg1HTIkgQ6Y2/3UjnpFCRPAvzP5m
	B9FDuzQpDzsnvybo9xP0Yqg7Jru3vd1W3D73Ff6vapQ7YP1JmJxUeMmNHTjZs94re/0DP5
	8Q+Wk/oJuwX3UQnpVGwHfiG/VouWXf8=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 15/18] mini-os: introduce get_file_from_fd()
Date: Tue, 11 Jan 2022 15:58:14 +0100
Message-Id: <20220111145817.22170-16-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111145817.22170-1-jgross@suse.com>
References: <20220111145817.22170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exporting the files[] array especially for components outside the
mini-os source tree is limiting the ability to change any file handling
in mini-os.

Introduce a new function get_file_from_fd() to return the struct file
pointer (or NULL) for a given file descriptor.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
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


