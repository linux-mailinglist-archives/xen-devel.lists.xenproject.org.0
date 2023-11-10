Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9E87E7BE1
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 12:35:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630218.982947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Pn0-0000zI-1n; Fri, 10 Nov 2023 11:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630218.982947; Fri, 10 Nov 2023 11:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Pmz-0000ts-UI; Fri, 10 Nov 2023 11:35:05 +0000
Received: by outflank-mailman (input) for mailman id 630218;
 Fri, 10 Nov 2023 11:35:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1Pmy-0007he-DA
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 11:35:04 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ed45b4b-7fbd-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 12:35:00 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7FB3A1F8BB;
 Fri, 10 Nov 2023 11:35:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 454E613398;
 Fri, 10 Nov 2023 11:35:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aoa7D2QVTmUJBAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 11:35:00 +0000
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
X-Inumbo-ID: 2ed45b4b-7fbd-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699616100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iyiJvbdzxfjlxXumjIe2Le5NJ94QuV7U0Z18Or31ob0=;
	b=lXQ/tq5ePTKElZQM2cBlSIKbW004yTsXKydCqgdKUBQFJrzrswpHjd9+7NaTI0I9do4B4f
	pKop2gWJifnXuPOvU98XvCwT0+UJ2pyelDL5f4UjaB6yfibWJQBmzcgOuQH+xtZZOtPqoE
	BcdJmeRTcmFuPCQuQ5cmoYOjDNJBZSk=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v2 4/5] Mini-OS: fix 9pfs stat receive format
Date: Fri, 10 Nov 2023 12:34:34 +0100
Message-Id: <20231110113435.22609-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110113435.22609-1-jgross@suse.com>
References: <20231110113435.22609-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


