Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E6550A3DA
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 17:19:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310303.527066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhYZE-0005gR-76; Thu, 21 Apr 2022 15:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310303.527066; Thu, 21 Apr 2022 15:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhYZE-0005di-3G; Thu, 21 Apr 2022 15:18:00 +0000
Received: by outflank-mailman (input) for mailman id 310303;
 Thu, 21 Apr 2022 15:17:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckMZ=U7=gmail.com=p4ranlee@srs-se1.protection.inumbo.net>)
 id 1nhYZD-0005dc-4h
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 15:17:59 +0000
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [2607:f8b0:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39469e3c-c186-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 17:17:58 +0200 (CEST)
Received: by mail-pf1-x431.google.com with SMTP id l127so5298590pfl.6
 for <xen-devel@lists.xenproject.org>; Thu, 21 Apr 2022 08:17:58 -0700 (PDT)
Received: from localhost ([118.33.58.98]) by smtp.gmail.com with ESMTPSA id
 p4-20020a637404000000b00375948e63d6sm22914548pgc.91.2022.04.21.08.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:17:56 -0700 (PDT)
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
X-Inumbo-ID: 39469e3c-c186-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=HwkPi7EESKLMHvB+8DbibUoGGrCc2TxwDdNOywmo7kg=;
        b=hK4FvLb45aaO/zXcX3H8e0CpOAQEFa9TXmt9bhMJLAXLaCeN7+3hwazClNZxzxmJyb
         jS1kx7TGn0WAYKme1U/l9ZdibGl2D20g5XMU5aJsz0opMoZectMCnpwcDa5uZrRpRTBV
         Q46+dtrgsXwKbAunlvcDXq+4l+OTRn8bmUQ5p4p0EnswcZfzXtz0uiUHrRK8LkyYiJ9X
         f1TyYn4ojuLoEb+vw743s0ET6fopOzBodWVaNsTSrROhb1Yr+jGjHP3XERZNYj9jldBl
         hB8LWcwb3G9Q56GWseTY2JfLw5ENajJbYCs8E3GRwbb2Q9ZGXnzRxYeOk7jzMFX9pEir
         U9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=HwkPi7EESKLMHvB+8DbibUoGGrCc2TxwDdNOywmo7kg=;
        b=iVtEUNvlSS+PncIduoltsjbVZzi8CQpmnPU1k3Rey+QM5MihMTw5Uab+laQsK1d3ZQ
         JHP2ojgQ5ggzxV7t3t9Q8Z8ktD2S8rt7SRgo6dxVGZoUazC0D055QbZWsGCaIo52NfP+
         REM8tsNpLfdM/d6fbLERXj18ADZtk2plO3okut55tFZNwMWUoks0TsqsMhSRGWIdsJt4
         TsSZZGzPO8j5uFp0c97ho61KFciidp2aExp/ZKu7Zv3qCZLtrGwvWFF7cqhWYwVi0nXN
         eLJBSRZM78EFXlir31eE4uUhT/mFflEO/MpWclsfZVnmJsjBTfFvy3f9UWy942wbvHSo
         Q9KA==
X-Gm-Message-State: AOAM530afZNU8/PdWaJqF1EWhgSTq4EOTkUbTjz+e1ty48oaZ3YXCAuC
	l2W0NBYjYi1BcXbqThEDwEk=
X-Google-Smtp-Source: ABdhPJwsJBv7j6lm1zv+MhgWjiFUztQlpbffeBU4x6GSZ0YG80tXvyuhOJkOwl+F5dh+CIM9G3CG2A==
X-Received: by 2002:a65:638d:0:b0:39d:74ad:ce0b with SMTP id h13-20020a65638d000000b0039d74adce0bmr24761836pgv.103.1650554276683;
        Thu, 21 Apr 2022 08:17:56 -0700 (PDT)
Date: Fri, 22 Apr 2022 00:17:55 +0900
From: Paran Lee <p4ranlee@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: austindh.kim@gmail.com, xen-devel@lists.xenproject.org
Subject: [PATCH] xen/arm: p2m_set_entry duplicate calculation.
Message-ID: <20220421151755.GA4718@DESKTOP-NK4TH6S.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

It doesn't seem necessary to do that calculation of order shift again.

Signed-off-by: Paran Lee <p4ranlee@gmail.com>
---
 xen/arch/arm/p2m.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 1d1059f7d2..533afc830a 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1092,7 +1092,7 @@ int p2m_set_entry(struct p2m_domain *p2m,
     while ( nr )
     {
         unsigned long mask;
-        unsigned long order;
+        unsigned long order, pages;
 
         /*
          * Don't take into account the MFN when removing mapping (i.e
@@ -1118,11 +1118,12 @@ int p2m_set_entry(struct p2m_domain *p2m,
         if ( rc )
             break;
 
-        sgfn = gfn_add(sgfn, (1 << order));
+        pages = 1 << order;
+        sgfn = gfn_add(sgfn, pages);
         if ( !mfn_eq(smfn, INVALID_MFN) )
-           smfn = mfn_add(smfn, (1 << order));
+           smfn = mfn_add(smfn, pages);
 
-        nr -= (1 << order);
+        nr -= pages;
     }
 
     return rc;
-- 
2.25.1


