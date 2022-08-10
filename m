Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A5C58EA5A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 12:16:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383517.618696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLilF-0002cO-PS; Wed, 10 Aug 2022 10:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383517.618696; Wed, 10 Aug 2022 10:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLilF-0002Zw-LZ; Wed, 10 Aug 2022 10:16:25 +0000
Received: by outflank-mailman (input) for mailman id 383517;
 Wed, 10 Aug 2022 10:16:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bIAv=YO=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oLilF-0002Zq-4P
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 10:16:25 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c8fe349-1895-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 12:16:24 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id b96so18524689edf.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 03:16:24 -0700 (PDT)
Received: from uni.. ([2a02:587:ac16:4a00:2259:7543:2ea6:3f52])
 by smtp.googlemail.com with ESMTPSA id
 k5-20020aa7d8c5000000b0043cc7a3ff7fsm7445525eds.33.2022.08.10.03.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 03:16:22 -0700 (PDT)
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
X-Inumbo-ID: 7c8fe349-1895-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=8UFRtIN5yyc4XYM3pDicSCNtA4jZV+k/XX0izJawMPM=;
        b=B3UOtolh9oWwWJ1lt7WoK/wKmulYDyERDHQ1pYdR49oSDmr+gJJ1X7M29J0yp1DfFF
         liYAZWYJreiGPBY0kDWYH1xdQhxaR62JqcCDUgkWmjURU9TowmTb2dI/N6D4sSSvnMjc
         CVWyri1G0xGeQcjD2kR6eUtSmi//gO6oszfcH4xttRGU0vDmOJ2GS3YHgUKBNt5KiMuA
         QJrdfN0sl+/LIuxLGLeAFDanA2nH2+twVtlNXhKWllV+Z5uEIc/AHFionNk7QttOGR1X
         FH8QCWGqbuV9D+3HiuWwKLPge1bCLDZ1C5e59xhq+/Vsp/TPefCEsDun8vvC/w001ic5
         crMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=8UFRtIN5yyc4XYM3pDicSCNtA4jZV+k/XX0izJawMPM=;
        b=O/CJRR8oVS02Nev1czX0SAFhIv67gvhLWYrVcm91LrHkLRnVojl0D6r1lPC6SlN6Nm
         9DhRsRDH/Pep1RMWIt7sRCI1d3rLSM7N3kvJUMNaXDmI5GzHFDynC9nnExVOPbNmwdlC
         JwOtd+gUkoIUxYMjLyxsgbnJ9fbGvopW4BRtQffyxda9fFtk/bLgorWIQBkCH92q8tye
         8GHaRweFNGe98JnIYmrfMrGdFt5ItU506Eb3myrkHpzH3FjaPx9gaKQit5gpCbPofJ0B
         rIB47tFDJSGupP9Z+ctgAZYZ1SJQWkTXyfBJvAuJLLWJj71rU2K+NLJ+3XX8lKjg/p8b
         5KjQ==
X-Gm-Message-State: ACgBeo1j8XTpWEC4K4VvOdpKvRlkniiABTbGf6/OubBLxVRWQg2gK7QN
	RGh1ofNryEjYf1ZBT9MVByAG6jAehto=
X-Google-Smtp-Source: AA6agR5GoZL18Xe9Zft28yYtBUdHpsgn6S85S97c6Z+nPpIsta+pjgo3Zjkn1nTYOUes+hvve3K14Q==
X-Received: by 2002:a05:6402:51cb:b0:43e:8f40:858d with SMTP id r11-20020a05640251cb00b0043e8f40858dmr24699104edd.391.1660126583209;
        Wed, 10 Aug 2022 03:16:23 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: gic: Fix MISRA C 2012 Rule 20.7 violation
Date: Wed, 10 Aug 2022 13:15:39 +0300
Message-Id: <20220810101539.1909143-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In GIC_PRI_TO_GUEST(), add parentheses around the macro parameter 'pri' to
prevent against unintended expansions and realign comment.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/arm/include/asm/gic.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index b3c6c67933..3692fae393 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -152,8 +152,8 @@
 #define GIC_PRI_IPI_ALL    ((GIC_PRI_IPI << 24) | (GIC_PRI_IPI << 16) |\
                             (GIC_PRI_IPI << 8) | GIC_PRI_IPI)
 
-#define GIC_PRI_TO_GUEST(pri) (pri >> 3) /* GICH_LR and GICH_VMCR only support
-                                            5 bits for guest irq priority */
+#define GIC_PRI_TO_GUEST(pri) ((pri) >> 3) /* GICH_LR and GICH_VMCR only support
+                                              5 bits for guest irq priority */
 
 #define GICH_LR_PENDING         1
 #define GICH_LR_ACTIVE          2
-- 
2.34.1


