Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70F6A6A0B8
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 08:49:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921379.1325244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvAel-0005Lx-MU; Thu, 20 Mar 2025 07:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921379.1325244; Thu, 20 Mar 2025 07:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvAel-0005JO-Gy; Thu, 20 Mar 2025 07:49:35 +0000
Received: by outflank-mailman (input) for mailman id 921379;
 Thu, 20 Mar 2025 07:49:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=496r=WH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tvAej-00052I-Rq
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 07:49:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc256bd6-055f-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 08:49:32 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E666D1F7A4;
 Thu, 20 Mar 2025 07:49:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC97613757;
 Thu, 20 Mar 2025 07:49:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +vWkLIvI22d/VQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 20 Mar 2025 07:49:31 +0000
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
X-Inumbo-ID: dc256bd6-055f-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742456972; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ahePrHvNMDs6aD+rN+hONCSWm/iDVIpc4u83RYfjI/k=;
	b=MQ06itfdQQyg9+b+6Qpp1+FMjL8f8uBPBj5G+Ly40TdqLLMSV4MXbNeLxKutPyABVlATRT
	KBetoxsWE7fzNgad77X70fy2mLFpNbFErodfXTETUWDoq2pJNpe7RaoK2f46v3LRNaXiDY
	MMcs5H1BawswjgO28DtmEdnQCNtUS4o=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=qIJOu2Lw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742456971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ahePrHvNMDs6aD+rN+hONCSWm/iDVIpc4u83RYfjI/k=;
	b=qIJOu2LwNeUJyADKREUs4uDzRXLn6AZdH5UnmUBRvqUjq/nY/2c2g8Q3FfZpcjGypmm0Km
	vPXURdsoJUGRbSlNfHx8VBYFfJkRRVpbqsa4IuBrKbHLxi9aE20h8jzDJmncEZFN4dgafG
	dOAVbjhO6qBl2dqo5OaTfjd8tsLWtKM=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 1/2] 9pfs: add fstat file operation hook
Date: Thu, 20 Mar 2025 08:49:23 +0100
Message-ID: <20250320074924.8080-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320074924.8080-1-jgross@suse.com>
References: <20250320074924.8080-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E666D1F7A4
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Add a file operations fstat hook to the 9pfs frontend.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 9pfront.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/9pfront.c b/9pfront.c
index 1741d600..a65fe26d 100644
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
+    buf->st_mode = stat.mode & 0777;
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


