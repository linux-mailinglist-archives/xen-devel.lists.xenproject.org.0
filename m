Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BF57DDDF2
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:01:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626152.976162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy75j-0006y0-Ip; Wed, 01 Nov 2023 09:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626152.976162; Wed, 01 Nov 2023 09:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy75j-0006uz-EP; Wed, 01 Nov 2023 09:00:47 +0000
Received: by outflank-mailman (input) for mailman id 626152;
 Wed, 01 Nov 2023 09:00:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy75h-0005dE-NO
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:00:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23d72a20-7895-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:00:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0D1D621A58;
 Wed,  1 Nov 2023 09:00:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D407313460;
 Wed,  1 Nov 2023 09:00:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fZEZMrsTQmWqeQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:00:43 +0000
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
X-Inumbo-ID: 23d72a20-7895-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698829244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Or0tPQphNoLGGIqgePeOLJ1T+klAnj6lGdQ0f802gDQ=;
	b=NiwXEXSwOFrCzwRHIGYZEMFP/XfdMwMiudIEejCjpT4hEWFD6FJk1eX4RnZo54pZ9I/ABh
	1twigO1mFwK1zNp5ItPXkelsJmEbBDQ5GB3BGoLsufaYnCJmrpphchSQL/YTrynQczl1pf
	Ov8pdFWbW2zNJ3jw5irqJSA4nFV1uOA=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 3/3] Mini-OS: fix 9pfs stat receive format
Date: Wed,  1 Nov 2023 10:00:24 +0100
Message-Id: <20231101090024.28934-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101090024.28934-1-jgross@suse.com>
References: <20231101090024.28934-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The format string of the received data for the 9pfs stat command is
missing the initial 2 byte total length specifier. Add it.

Fixes: 2d1dfccd3aa3 ("Mini-OS: add read and write support to 9pfsfront")
Signed-off-by: Juergen Gross <jgross@suse.com>
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


