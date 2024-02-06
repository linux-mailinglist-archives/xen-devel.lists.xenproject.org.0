Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A72F184BDF4
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 20:11:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677089.1053507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXQr2-0005lv-9g; Tue, 06 Feb 2024 19:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677089.1053507; Tue, 06 Feb 2024 19:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXQr2-0005ir-6d; Tue, 06 Feb 2024 19:11:36 +0000
Received: by outflank-mailman (input) for mailman id 677089;
 Tue, 06 Feb 2024 19:11:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z75a=JP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rXQr0-0005iR-R9
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 19:11:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 890635d0-c523-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 20:11:31 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6629C1F38E;
 Tue,  6 Feb 2024 19:11:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 22C49139D8;
 Tue,  6 Feb 2024 19:11:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id W+45O2CEwmXSHQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 06 Feb 2024 19:11:28 +0000
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
X-Inumbo-ID: 890635d0-c523-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707246690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v3tdZNE3CtH/sw9mKXkbSutXzAO/0g8n6ykGpI2lzis=;
	b=EZbfd8XCXsYGmQoQxJeGsrmeM4xhPDzP40waWElzCWaAkcw+lNPc4zYMQmVVQAFWE5r70t
	IpFlAejVodVeLVOkdgytNKGHpoO0jFABQZq1FU6iChOzh6Z2Q+o40g6jsNIR8J4JE4tok6
	q6+qVl/Flny/RuutjA5IjLKXgapYWDE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707246690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v3tdZNE3CtH/sw9mKXkbSutXzAO/0g8n6ykGpI2lzis=;
	b=EZbfd8XCXsYGmQoQxJeGsrmeM4xhPDzP40waWElzCWaAkcw+lNPc4zYMQmVVQAFWE5r70t
	IpFlAejVodVeLVOkdgytNKGHpoO0jFABQZq1FU6iChOzh6Z2Q+o40g6jsNIR8J4JE4tok6
	q6+qVl/Flny/RuutjA5IjLKXgapYWDE=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	julien@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] Mini-OS: fix 9pfs frontend error path
Date: Tue,  6 Feb 2024 20:11:25 +0100
Message-Id: <20240206191125.13065-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [4.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

The early error exit in p9_stat() returns without zeroing the p9_stat
buffer, resulting in free() being called with an uninitialized pointer.

Fix that by calling free_stat() in p9_stat() in case of returning an
error and potentially having allocated strings.

Reported-by: Julien Grall <julien@xen.org>
Fixes: 2d1dfccd3aa3 ("Mini-OS: add read and write support to 9pfsfront")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- call free_stat() in p9_stat() in case of returning an error
  (Samuel Thibault)
---
 9pfront.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/9pfront.c b/9pfront.c
index 315089bc..042879a7 100644
--- a/9pfront.c
+++ b/9pfront.c
@@ -728,6 +728,8 @@ static int p9_stat(struct dev_9pfs *dev, uint32_t fid, struct p9_stat *stat)
            &stat->extension, &stat->n_uid, &stat->n_gid, &stat->n_muid);
 
     ret = req->result;
+    if ( ret )
+        free_stat(&stat);
 
     put_free_req(dev, req);
 
@@ -932,13 +934,13 @@ static int write_9pfs(struct file *file, const void *buf, size_t nbytes)
     if ( f9pfs->append )
     {
         ret = p9_stat(f9pfs->dev, f9pfs->fid, &stat);
-        free_stat(&stat);
         if ( ret )
         {
             errno = EIO;
             return -1;
         }
         file->offset = stat.length;
+        free_stat(&stat);
     }
 
     ret = p9_write(f9pfs->dev, f9pfs->fid, file->offset, buf, nbytes);
-- 
2.35.3


