Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BACB511471
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314687.532936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeJF-0002R6-CC; Wed, 27 Apr 2022 09:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314687.532936; Wed, 27 Apr 2022 09:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeJF-0002Nw-6f; Wed, 27 Apr 2022 09:50:09 +0000
Received: by outflank-mailman (input) for mailman id 314687;
 Wed, 27 Apr 2022 09:50:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTRx=VF=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1njeJC-00085x-Og
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:50:06 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6aa984d6-c60f-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 11:50:06 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 754AF1480;
 Wed, 27 Apr 2022 02:50:05 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.13.174])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC4BC3F7D8;
 Wed, 27 Apr 2022 02:50:03 -0700 (PDT)
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
X-Inumbo-ID: 6aa984d6-c60f-11ec-a405-831a346695d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 7/8] platforms/omap: Remove unused-but-set variable
Date: Wed, 27 Apr 2022 11:49:40 +0200
Message-Id: <20220427094941.291554-8-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427094941.291554-1-michal.orzel@arm.com>
References: <20220427094941.291554-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function omap5_init_time defines and sets a variable den but does not
make use of it. Remove this variable.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/platforms/omap5.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/arm/platforms/omap5.c b/xen/arch/arm/platforms/omap5.c
index aee24e4d28..5cf424a23e 100644
--- a/xen/arch/arm/platforms/omap5.c
+++ b/xen/arch/arm/platforms/omap5.c
@@ -48,7 +48,7 @@ static int omap5_init_time(void)
     void __iomem *ckgen_prm_base;
     void __iomem *rt_ct_base;
     unsigned int sys_clksel;
-    unsigned int num, den, frac1, frac2;
+    unsigned int num, frac1, frac2;
 
     ckgen_prm_base = ioremap_nocache(OMAP5_CKGEN_PRM_BASE, 0x20);
     if ( !ckgen_prm_base )
@@ -78,7 +78,6 @@ static int omap5_init_time(void)
     }
 
     frac2 = readl(rt_ct_base + INCREMENTER_DENUMERATOR_RELOAD_OFFSET);
-    den = frac2 & ~NUMERATOR_DENUMERATOR_MASK;
     if ( num_den[sys_clksel][1] != num )
     {
         frac2 &= NUMERATOR_DENUMERATOR_MASK;
-- 
2.25.1


