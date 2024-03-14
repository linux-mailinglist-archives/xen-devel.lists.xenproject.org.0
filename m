Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126BE87BDB1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 14:29:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693225.1081050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkl8j-0001cL-2g; Thu, 14 Mar 2024 13:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693225.1081050; Thu, 14 Mar 2024 13:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkl8i-0001Ze-W4; Thu, 14 Mar 2024 13:28:56 +0000
Received: by outflank-mailman (input) for mailman id 693225;
 Thu, 14 Mar 2024 13:28:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fwP0=KU=gmail.com=flyingpenghao@srs-se1.protection.inumbo.net>)
 id 1rkl8h-00012g-Bm
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 13:28:55 +0000
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [2607:f8b0:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccd9c761-e206-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 14:28:53 +0100 (CET)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6e6eb891db9so428467b3a.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 06:28:53 -0700 (PDT)
Received: from FLYINGPENG-MB1.tencent.com ([103.7.29.30])
 by smtp.gmail.com with ESMTPSA id
 ff13-20020a056a002f4d00b006e6c4b8a5bdsm1480882pfb.96.2024.03.14.06.28.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 14 Mar 2024 06:28:51 -0700 (PDT)
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
X-Inumbo-ID: ccd9c761-e206-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710422932; x=1711027732; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yXgAyG/c2dF1nEwW+SvC94ycXPYiD8dQ1lT7fqQcXNE=;
        b=gALMkjfMdPs+ZUGwNaoFF39DbADumbdf5dCJiXsHHTLF8fl+MHUE4QGkFv/Y3WbPQ2
         yETeIaQZ7f+ZRj5mDpbGbsRkpo8uwezCZ8ovCqr7folNKf0vW7rTgTq6z3lFan7Kf/sy
         WmlITtJ+ST1F9kW2klwJX7Nv4XB9rmGjmy/gYKiIBf6sMq6FzrMfUtEp2BpfgRrqBl/7
         CCRzb/7IMkrPs1qnqGf+raSW53RG+CKDjBMkQ/v160IXobIw7PuKM6PF44Ia82nDCfCD
         e0V7hxuRnmdmmYj2uZ0KdpKFmT3jxajXdNT5qXLb2FYVRjMQ9NKM9H5aR0AFpOsuqhO1
         sYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710422932; x=1711027732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXgAyG/c2dF1nEwW+SvC94ycXPYiD8dQ1lT7fqQcXNE=;
        b=IMBSioQ+pj5tar2j3Jr7gvukcWs8iwEM7OHG08cvR6TkA8anEu8V+xk/bhZ1kFFEJi
         H8wJKpI9fd1vq1mNim16IdqU1AkIM5n5uvDOAXhnQgCinf6zd2kGF6KpxrjcCeHucjtN
         2kDqREwYMrgfa29AU8JJ8vY6MRaGCwbwaV+vgM+8IhgakwyvAhsEgNIFhNXjyfeSlkLP
         f78Ux2Om7GlMQMoiVBayPoQM+b5H9FnzAqY7daQ/xvXaRJz4xXhR3OE11zbCSymTROl1
         LaqSjEyG15fwdGTfiShEZwKd9yQ9DzPbrfN+wfx2daJNlGbsVu9Wpnk1oUpWuMefq9CC
         L/FQ==
X-Gm-Message-State: AOJu0Yx0t+UUzFo5CcAgmchrCPJQOVB8OqvRLPbBlk0cq8UNm21rv2u2
	9b9qEj7QfDb/cC/BfbP8AnX7lIw7uv518IKv22OMa4ZJLs2EQmZt
X-Google-Smtp-Source: AGHT+IHr12UprP31HY2RN33rSwNjYFuYH5Y6I5fH+HcdqptwWyyY5drbZqk1rODFPsGlW9w92GBtYA==
X-Received: by 2002:a05:6a20:3407:b0:1a1:47c6:a495 with SMTP id i7-20020a056a20340700b001a147c6a495mr1620985pzd.43.1710422932105;
        Thu, 14 Mar 2024 06:28:52 -0700 (PDT)
From: flyingpenghao@gmail.com
X-Google-Original-From: flyingpeng@tencent.com
To: roger.pau@citrix.com
Cc: xen-devel@lists.xenproject.org,
	Peng Hao <flyingpeng@tencent.com>
Subject: [PATCH v2] xen/blkback: use kmap_local_page()
Date: Thu, 14 Mar 2024 21:28:43 +0800
Message-Id: <20240314132843.24069-1-flyingpeng@tencent.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peng Hao <flyingpeng@tencent.com>

Use kmap_local_page() instead of kmap_atomic() which has been
deprecated.

Signed-off-by: Peng Hao <flyingpeng@tencent.com>
---
 drivers/block/xen-blkback/blkback.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index 4defd7f387c7..09503e269842 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -937,8 +937,8 @@ static int xen_blkbk_parse_indirect(struct blkif_request *req,
 		if ((n % SEGS_PER_INDIRECT_FRAME) == 0) {
 			/* Map indirect segments */
 			if (segments)
-				kunmap_atomic(segments);
-			segments = kmap_atomic(pages[n/SEGS_PER_INDIRECT_FRAME]->page);
+				kunmap_local(segments);
+			segments = kmap_local_page(pages[n/SEGS_PER_INDIRECT_FRAME]->page);
 		}
 		i = n % SEGS_PER_INDIRECT_FRAME;
 
@@ -958,7 +958,7 @@ static int xen_blkbk_parse_indirect(struct blkif_request *req,
 
 unmap:
 	if (segments)
-		kunmap_atomic(segments);
+		kunmap_local(segments);
 	xen_blkbk_unmap(ring, pages, indirect_grefs);
 	return rc;
 }
-- 
2.31.1


