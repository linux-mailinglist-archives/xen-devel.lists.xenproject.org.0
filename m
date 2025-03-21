Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D56AA6B7C2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:41:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923691.1327147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYsL-0001mj-DJ; Fri, 21 Mar 2025 09:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923691.1327147; Fri, 21 Mar 2025 09:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYsL-0001kD-AY; Fri, 21 Mar 2025 09:41:13 +0000
Received: by outflank-mailman (input) for mailman id 923691;
 Fri, 21 Mar 2025 09:41:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wue=WI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tvYjM-00033C-2R
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:31:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 539eff68-0637-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 10:31:54 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2E21D21C59;
 Fri, 21 Mar 2025 09:31:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F3949139AA;
 Fri, 21 Mar 2025 09:31:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CuQCOgky3WdaGwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 21 Mar 2025 09:31:53 +0000
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
X-Inumbo-ID: 539eff68-0637-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w41cQJdYbcNGHG3cF8bDLMo1yZi7in/akXd7iDnt7OY=;
	b=BovOjo2YehkiVA2nJhh3+0LzxX51+jeHs44jv7sSuOuo1ch7kOdYpouLds5CA7wssg3IbD
	UEjuIbBRwX5ajG/4OUMUBLXbe6pvdbwMqzFwgiYMkd6VZ9qcqPA/cDZ8XxkErXVFf4UdDX
	ra4yX7rhwg7wqPx+LWH1d5wj4w1W7PM=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w41cQJdYbcNGHG3cF8bDLMo1yZi7in/akXd7iDnt7OY=;
	b=BovOjo2YehkiVA2nJhh3+0LzxX51+jeHs44jv7sSuOuo1ch7kOdYpouLds5CA7wssg3IbD
	UEjuIbBRwX5ajG/4OUMUBLXbe6pvdbwMqzFwgiYMkd6VZ9qcqPA/cDZ8XxkErXVFf4UdDX
	ra4yX7rhwg7wqPx+LWH1d5wj4w1W7PM=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [MINI-OS PATCH v2 1/2] 9pfs: add fstat file operation hook
Date: Fri, 21 Mar 2025 10:31:44 +0100
Message-ID: <20250321093145.17882-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321093145.17882-1-jgross@suse.com>
References: <20250321093145.17882-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Add a file operations fstat hook to the 9pfs frontend.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
V2:
- or file access mode into st_mode (Jason Andryuk)
---
 9pfront.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/9pfront.c b/9pfront.c
index 1741d600..7257a07e 100644
--- a/9pfront.c
+++ b/9pfront.c
@@ -85,6 +85,8 @@ struct file_9pfs {
 
 #define P9_QID_SIZE    13
 
+#define QID_TYPE_DIR   0x80     /* Applies to qid[0]. */
+
 struct p9_header {
     uint32_t size;
     uint8_t cmd;
@@ -950,6 +952,32 @@ static int write_9pfs(struct file *file, const void *buf, size_t nbytes)
     return ret;
 }
 
+static int fstat_9pfs(struct file *file, struct stat *buf)
+{
+    struct file_9pfs *f9pfs = file->filedata;
+    struct p9_stat stat;
+    int ret;
+
+    ret = p9_stat(f9pfs->dev, f9pfs->fid, &stat);
+    if ( ret )
+    {
+        errno = EIO;
+        return -1;
+    }
+
+    buf->st_mode = (stat.qid[0] == QID_TYPE_DIR) ? S_IFDIR : S_IFREG;
+    buf->st_mode |= stat.mode & 0777;
+    buf->st_atime = stat.atime;
+    buf->st_mtime = stat.mtime;
+    buf->st_size = stat.length;
+    buf->st_uid = stat.n_uid;
+    buf->st_gid = stat.n_gid;
+
+    free_stat(&stat);
+
+    return 0;
+}
+
 static int close_9pfs(struct file *file)
 {
     struct file_9pfs *f9pfs = file->filedata;
@@ -1296,6 +1324,7 @@ static const struct file_ops ops_9pfs = {
     .read = read_9pfs,
     .write = write_9pfs,
     .close = close_9pfs,
+    .fstat = fstat_9pfs,
 };
 
 __attribute__((constructor))
-- 
2.43.0


