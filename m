Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6259851813B
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 11:39:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319343.539584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlozU-00064H-TB; Tue, 03 May 2022 09:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319343.539584; Tue, 03 May 2022 09:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlozU-00062T-Pb; Tue, 03 May 2022 09:38:44 +0000
Received: by outflank-mailman (input) for mailman id 319343;
 Tue, 03 May 2022 09:38:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1P+g=VL=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1nlozT-0005X9-5l
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 09:38:43 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d159bfae-cac4-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 11:38:41 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4534E13D5;
 Tue,  3 May 2022 02:38:41 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D5373F73D;
 Tue,  3 May 2022 02:38:40 -0700 (PDT)
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
X-Inumbo-ID: d159bfae-cac4-11ec-8fc4-03012f2f19d4
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/3] xen/arm: Advertise workaround 1 if we apply 3
Date: Tue,  3 May 2022 10:38:30 +0100
Message-Id: <8119538cce93516f1e78d37d578996a195686f89.1651570561.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651570561.git.bertrand.marquis@arm.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SMCC_WORKAROUND_3 is handling both Spectre v2 and spectre BHB.
So when a guest is asking if we support workaround 1, tell yes if we
apply workaround 3 on exception entry as it handles it.

This will allow guests not supporting Spectre BHB but impacted by
spectre v2 to still handle it correctly.
The modified behaviour is coherent with what the Linux kernel does in
KVM for guests.

While there use ARM_SMCCC_SUCCESS instead of 0 for the return code value
for workaround detection to be coherent with Workaround 2 handling.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/vsmc.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index b633ff2fe8..676740ef15 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -104,8 +104,13 @@ static bool handle_arch(struct cpu_user_regs *regs)
         switch ( arch_func_id )
         {
         case ARM_SMCCC_ARCH_WORKAROUND_1_FID:
-            if ( cpus_have_cap(ARM_HARDEN_BRANCH_PREDICTOR) )
-                ret = 0;
+            /*
+             * Workaround 3 is also mitigating spectre v2 so advertise that we
+             * support Workaround 1 if we do Workaround 3 on exception entry.
+             */
+            if ( cpus_have_cap(ARM_HARDEN_BRANCH_PREDICTOR) ||
+                 cpus_have_cap(ARM_WORKAROUND_BHB_SMCC_3) )
+                ret = ARM_SMCCC_SUCCESS;
             break;
         case ARM_SMCCC_ARCH_WORKAROUND_2_FID:
             switch ( get_ssbd_state() )
@@ -126,7 +131,7 @@ static bool handle_arch(struct cpu_user_regs *regs)
             break;
         case ARM_SMCCC_ARCH_WORKAROUND_3_FID:
             if ( cpus_have_cap(ARM_WORKAROUND_BHB_SMCC_3) )
-                ret = 0;
+                ret = ARM_SMCCC_SUCCESS;
             break;
         }
 
-- 
2.25.1


