Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E78D872E98
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 07:11:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688957.1073787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhkTV-0008Dn-V9; Wed, 06 Mar 2024 06:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688957.1073787; Wed, 06 Mar 2024 06:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhkTV-0008Bo-Rs; Wed, 06 Mar 2024 06:09:57 +0000
Received: by outflank-mailman (input) for mailman id 688957;
 Wed, 06 Mar 2024 05:16:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5ba8=KM=gmail.com=flyingpenghao@srs-se1.protection.inumbo.net>)
 id 1rhjdI-0001qR-VI
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 05:16:01 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ce52d48-db78-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 06:15:58 +0100 (CET)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6e62c65865cso442371b3a.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 21:15:58 -0800 (PST)
Received: from FLYINGPENG-MB1.tencent.com ([103.7.29.30])
 by smtp.gmail.com with ESMTPSA id
 sh14-20020a17090b524e00b0029a7951c4a3sm12873809pjb.41.2024.03.05.21.15.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Mar 2024 21:15:55 -0800 (PST)
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
X-Inumbo-ID: 9ce52d48-db78-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709702156; x=1710306956; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dYBvsZ67CiVZB3bSb45jpPKBS2zsFhtXBG4EnbIe+mI=;
        b=fUsKLL+ywLtDYpCy7YIaK/vMFXRd0871D/zCN+sTCYNS0UGJeAQJvu6Ap6Wl12EdRS
         XwdsCT1I+iuv1fIJtZsP7pBipDF5PWnB2sFVQXVMUxx2S3U20NebyYErMVnuwfz5qH18
         UnWZyDWdZx33O1pC82W+GUv5Pn/dCt959WLJBzygxnuHFyWr83rchWXMKg8cOqbBbRij
         2l9DeXHXKASfCJ3topGpre35M5tZa9fkvxvUmuNzICJE/73blGSZs3H2asscFKfFvTfh
         gJb6xXRQsX6HDi8v16+MWCcsYYqFyu45Y87/+zQuVfy+rPeldlinJDWcII+AjOfFoCFA
         7Z9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709702156; x=1710306956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYBvsZ67CiVZB3bSb45jpPKBS2zsFhtXBG4EnbIe+mI=;
        b=DeMuVBA4rKxBbm4fFhZTg/nU02hTFnLwdgjxgFcOLTVLO+GupQktNV7uRSSwM/cjTU
         nLRUfZNhvbJ03/1YqYmVH0OKrT9a6TRku/V1AvUJVxeCecemfQ+y9Vbe97hjBfmNlPS+
         QDIbDF/brwEXDZDx7MKHnFpvCJB+uIcjZvMv6x0quKTIu5LUqOesEN7iZOdSnD8koFd1
         U+tvVcaDfbwtbuNFd8Y0Ev9O+fFjKQ/5qqk+cNtOizfR93cOLGU4WdbTFGkxyNROq3Vk
         RXZ0v9685QxKDiWMvwQfmdoe8XHd9pM9ArprmZ2y/VIQrKlrPuxhMzyC6fvX47XVUJr9
         qTBQ==
X-Gm-Message-State: AOJu0YwvFF9pm53LuMNfoI1B5n/CrDtjTly+PtonvwSJddTPStUPDwV/
	xu9UNl7KjurQ3rnbj3Db8sKT4g3YRJmqLsV7693I1q7jiVFv2t0t
X-Google-Smtp-Source: AGHT+IEK+PqX3TVEP58pvrMY+azSjMdcESbNoY3Ftl0I8D/KGELEGWy2O6l0HBbkW4aA5JihnOog6g==
X-Received: by 2002:a05:6a20:3d82:b0:1a1:216e:bdf8 with SMTP id s2-20020a056a203d8200b001a1216ebdf8mr3995682pzi.14.1709702156292;
        Tue, 05 Mar 2024 21:15:56 -0800 (PST)
From: flyingpenghao@gmail.com
X-Google-Original-From: flyingpeng@tencent.com
To: roger.pau@citrix.com
Cc: xen-devel@lists.xenproject.org,
	Peng Hao <flyingpeng@tencent.com>
Subject: [PATCH]  xen/blkback: use kmap_local_page()
Date: Wed,  6 Mar 2024 13:15:48 +0800
Message-Id: <20240306051548.90954-1-flyingpeng@tencent.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peng Hao <flyingpeng@tencent.com>

From: Peng Hao <flyingpeng@tencent.com>

Use kmap_local_page() instead of kmap_atomic() which has been
deprecated.

Signed-off-by: Peng Hao <flyingpeng@tencent.com>
---
 drivers/block/xen-blkback/blkback.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index 4defd7f387c7..cce534f43292 100644
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
 
-- 
2.31.1


