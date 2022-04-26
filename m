Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D81851022A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 17:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314033.531904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njNRA-0004iX-0W; Tue, 26 Apr 2022 15:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314033.531904; Tue, 26 Apr 2022 15:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njNR9-0004fh-T5; Tue, 26 Apr 2022 15:49:11 +0000
Received: by outflank-mailman (input) for mailman id 314033;
 Tue, 26 Apr 2022 15:49:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckxI=VE=gmail.com=p4ranlee@srs-se1.protection.inumbo.net>)
 id 1njNR8-0004fb-If
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 15:49:10 +0000
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68b76703-c578-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 17:49:09 +0200 (CEST)
Received: by mail-pj1-x1030.google.com with SMTP id iq10so5402519pjb.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Apr 2022 08:49:09 -0700 (PDT)
Received: from localhost ([118.33.58.98]) by smtp.gmail.com with ESMTPSA id
 p1-20020a056a000a0100b0050ac9c31b7esm17145655pfh.180.2022.04.26.08.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 08:49:07 -0700 (PDT)
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
X-Inumbo-ID: 68b76703-c578-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=tPv0CVXqU70KWoKIiR1mvzTdX3vbXAGSStsF5ep6zGY=;
        b=aB1kcoPYNJrsemdnI8inT9YidIrM/5nIdL44JDIQccNsFCbrNEWYaIyRrG5mSJhnN9
         m4mXbD5Zzqw8LeGt1WPhu5c5VFHR2Xkpgq2QABh5onREUcNyHmz8g463XzQty8vqnQiw
         xSCyxM9dzK+Cc0LjuThOinbSXcCneNFxccq4DbmGxm23yNoKpr4npFgBAEPPA/qXL9vB
         CoOi7CNa5q+8+RLdY9Epv8h48IcR+0FNoFbz4OryDAQlEQcPfgxq8D7ivwZ/aJ455iWY
         Glfr03/HhRVzJxeFs6cUQQS8RUU3EnsUrMYdHqotqXqHUIbAH9BRQ4Cq2RcPEU0/AGcH
         t/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=tPv0CVXqU70KWoKIiR1mvzTdX3vbXAGSStsF5ep6zGY=;
        b=egZ6qOknP4/mzcksaaBVQAJm0PGeVprjifgleEVz3LqA4aP/TpuWPG2Q5uo9SzlHgb
         SzeoAS10qDX3LqHsBLnFGj28jm3zjjr+IjxPs8sR6+hszFZZ0h8l+AgVOjTeW3xUi6JK
         zWVtdcnjOpwC+hd+LjY4n2H1sjZjBpsM3aXMl6b26GgD5eCx6AqqU19B8QGIypBamexG
         p6gdWL7Hdarq1qJyaxCDqbEeeLR8+kgm7Lk41wX6teddGRQUxxHZAEWMPzQ99P8C1Dfw
         qEvzHfqTy8uMC0yq2YBD/neSX/o/qJAUOUKmnsyTOAPDOayTA844kXvszDmQh6a8NKfN
         pkBQ==
X-Gm-Message-State: AOAM530jHdLUPtR0trusiunGQfyJVP8PrDgTtzTxNvSMpRYNS8eNf1+1
	E8FbAUct1/YMurG9+6K2p24=
X-Google-Smtp-Source: ABdhPJzJxmrVBJ8YNTOD/sZSY5ZT08VM8ql6hEsaUNdgvvYURMQnFOU3ghmv7F3FPWzOlLJpzlff5w==
X-Received: by 2002:a17:902:da85:b0:15d:3a9a:aad1 with SMTP id j5-20020a170902da8500b0015d3a9aaad1mr2928463plx.113.1650988147963;
        Tue, 26 Apr 2022 08:49:07 -0700 (PDT)
Date: Wed, 27 Apr 2022 00:49:04 +0900
From: Paran Lee <p4ranlee@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: austindh.kim@gmail.com, xen-devel@lists.xenproject.org
Subject: [PATCH v2] xen/arm: p2m_set_entry reuse mask variables
Message-ID: <20220426154904.GA11482@DESKTOP-NK4TH6S.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reuse mask variables on order shift duplicated calculation.

Signed-off-by: Paran Lee <p4ranlee@gmail.com>
---
 xen/arch/arm/p2m.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 1d1059f7d2..cdb3b56aa1 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1118,11 +1118,12 @@ int p2m_set_entry(struct p2m_domain *p2m,
         if ( rc )
             break;
 
-        sgfn = gfn_add(sgfn, (1 << order));
+        mask = 1UL << order;
+        sgfn = gfn_add(sgfn, mask);
         if ( !mfn_eq(smfn, INVALID_MFN) )
-           smfn = mfn_add(smfn, (1 << order));
+           smfn = mfn_add(smfn, mask);
 
-        nr -= (1 << order);
+        nr -= mask;
     }
 
     return rc;
-- 
2.25.1


