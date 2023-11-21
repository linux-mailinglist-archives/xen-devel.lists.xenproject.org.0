Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2700C7F2956
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 10:50:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637636.993660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NOg-00023m-34; Tue, 21 Nov 2023 09:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637636.993660; Tue, 21 Nov 2023 09:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NOf-0001zx-Uu; Tue, 21 Nov 2023 09:50:21 +0000
Received: by outflank-mailman (input) for mailman id 637636;
 Tue, 21 Nov 2023 09:50:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AdV8=HC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5NOe-00008u-FJ
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 09:50:20 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6118832b-8853-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 10:50:18 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9DE341F8A8;
 Tue, 21 Nov 2023 09:50:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 72D45138E3;
 Tue, 21 Nov 2023 09:50:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hTaZGlp9XGWINQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Nov 2023 09:50:18 +0000
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
X-Inumbo-ID: 6118832b-8853-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700560218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iyiJvbdzxfjlxXumjIe2Le5NJ94QuV7U0Z18Or31ob0=;
	b=PrGDdahfNfQ3H/Q9PXDL+f81pggJATumNSVFeTSO2T9il7ghf+LrZzKq4DU0RFMi5YzVe0
	/h2Brqh+I+HP1CJPTrmqtZ99DOYWXSdY6QZ0M8WkojzogWFRUUVztFETSrGsT20q6JeLSM
	O+WmoaI6kQew/eh8pSRzO4Upmsnch5Q=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v3 4/5] Mini-OS: fix 9pfs stat receive format
Date: Tue, 21 Nov 2023 10:49:52 +0100
Message-Id: <20231121094953.22430-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231121094953.22430-1-jgross@suse.com>
References: <20231121094953.22430-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-0.00)[41.57%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[ens-lyon.org,xen.org,suse.com,gmail.com];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

The format string of the received data for the 9pfs stat command is
missing the initial 2 byte total length specifier. Add it.

Fixes: 2d1dfccd3aa3 ("Mini-OS: add read and write support to 9pfsfront")
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 9pfront.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/9pfront.c b/9pfront.c
index 5da8a365..43c7409f 100644
--- a/9pfront.c
+++ b/9pfront.c
@@ -711,6 +711,7 @@ static int p9_create(struct dev_9pfs *dev, uint32_t fid, char *path,
 static int p9_stat(struct dev_9pfs *dev, uint32_t fid, struct p9_stat *stat)
 {
     struct req *req = get_free_req(dev);
+    uint16_t total;
     int ret;
 
     if ( !req )
@@ -719,10 +720,10 @@ static int p9_stat(struct dev_9pfs *dev, uint32_t fid, struct p9_stat *stat)
     memset(stat, 0, sizeof(*stat));
     req->cmd = P9_CMD_STAT;
     send_9p(dev, req, "U", fid);
-    rcv_9p(dev, req, "uuUQUUULSSSSSUUU", &stat->size, &stat->type, &stat->dev,
-           stat->qid, &stat->mode, &stat->atime, &stat->mtime, &stat->length,
-           &stat->name, &stat->uid, &stat->gid, &stat->muid, &stat->extension,
-           &stat->n_uid, &stat->n_gid, &stat->n_muid);
+    rcv_9p(dev, req, "uuuUQUUULSSSSSUUU", &total, &stat->size, &stat->type,
+           &stat->dev, stat->qid, &stat->mode, &stat->atime, &stat->mtime,
+           &stat->length, &stat->name, &stat->uid, &stat->gid, &stat->muid,
+           &stat->extension, &stat->n_uid, &stat->n_gid, &stat->n_muid);
 
     ret = req->result;
 
-- 
2.35.3


