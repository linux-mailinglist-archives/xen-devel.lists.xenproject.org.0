Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2FB48FB38
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 07:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257775.443050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8zIF-0000At-Uw; Sun, 16 Jan 2022 06:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257775.443050; Sun, 16 Jan 2022 06:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8zIF-00005S-Nl; Sun, 16 Jan 2022 06:45:35 +0000
Received: by outflank-mailman (input) for mailman id 257775;
 Sun, 16 Jan 2022 06:45:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n8zIE-0008SI-9T
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 06:45:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e55a6a37-7697-11ec-9bbc-9dff3e4ee8c5;
 Sun, 16 Jan 2022 07:45:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F02511F3AF;
 Sun, 16 Jan 2022 06:45:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA9E013ABD;
 Sun, 16 Jan 2022 06:45:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gKtILAm/42H0eQAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 16 Jan 2022 06:45:29 +0000
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
X-Inumbo-ID: e55a6a37-7697-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642315529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3GoDjpDXFuZrudyOquKeoDi2JAufp1li+iMTg9O8+0U=;
	b=LOLd7RxCvyVRaao+x4dTavf06lBa9kyEh5im5XCdUCSuA+4oMDHyguqmMrkp+9SoR7N1ny
	EgXotHgErhIXkGwLLlK6Bf66WGUiAbXKimysZhqnLadPjC/9te7GatmnAuW2clV8LHOfQ+
	inm1PXlURZyxTEfMN3BUJki/amJ8Ur4=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINIOS PATCH v3 1/5] introduce get_file_from_fd()
Date: Sun, 16 Jan 2022 07:45:23 +0100
Message-Id: <20220116064527.23519-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116064527.23519-1-jgross@suse.com>
References: <20220116064527.23519-1-jgross@suse.com>
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
V3:
- use ARRAY_SIZE() for boundary check (Andrew Cooper)
---
 include/lib.h | 1 +
 lib/sys.c     | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/lib.h b/include/lib.h
index 91364ba7..7a0546bd 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -198,6 +198,7 @@ struct file {
 
 extern struct file files[];
 
+struct file *get_file_from_fd(int fd);
 int alloc_fd(enum fd_type type);
 void close_all_files(void);
 extern struct thread *main_thread;
diff --git a/lib/sys.c b/lib/sys.c
index 6f2b026d..9a03875c 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -98,6 +98,14 @@ struct file files[NOFILE] = {
     { .type = FTYPE_CONSOLE }, /* stderr */
 };
 
+struct file *get_file_from_fd(int fd)
+{
+    if ( fd < 0 || fd >= ARRAY_SIZE(files) )
+        return NULL;
+
+    return (files[fd].type == FTYPE_NONE) ? NULL : files + fd;
+}
+
 DECLARE_WAIT_QUEUE_HEAD(event_queue);
 
 int alloc_fd(enum fd_type type)
-- 
2.26.2


