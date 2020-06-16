Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836161FBD67
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 19:59:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlFry-0007V7-Rz; Tue, 16 Jun 2020 17:59:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QOm8=75=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jlFry-0007Ta-0c
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 17:59:34 +0000
X-Inumbo-ID: 1d8b603c-affb-11ea-b923-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d8b603c-affb-11ea-b923-12813bfff9fa;
 Tue, 16 Jun 2020 17:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=12y0VkXW+AgZVDIaCYlRD6wnppSAnpuFa9zY5Bz1Ye8=; b=0VaU6bUclTEw9ILq+fnMYdWFTN
 eHShCyoKH1HTBGkqadzPFyTgqYX3XBLsPKf/vY+9GDYKw8muoszOea5YkWDy488ILUqCDji90THrx
 zzgDX90mGPotO49+WpRL+y3wI/eq0xRHm6RQ1efh+OXM5E5MT1BR3+xjBbForhrLZcMs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jlFrl-0003ki-0g; Tue, 16 Jun 2020 17:59:21 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jlFrk-00036w-NU; Tue, 16 Jun 2020 17:59:20 +0000
From: Julien Grall <julien@xen.org>
To: security@xenproject.org
Subject: [PATCH 2/2] xen/arm: Mitigate straight-line speculation for SMC call
Date: Tue, 16 Jun 2020 18:59:13 +0100
Message-Id: <20200616175913.7368-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616175913.7368-1-julien@xen.org>
References: <20200616175913.7368-1-julien@xen.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: sstabellini@kernel.org, paul@xen.org, Andre.Przywara@arm.com,
 Julien Grall <jgrall@amazon.com>, Bertrand.Marquis@arm.com,
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

SMC call will update some of registers (typically only x0) depending on
the arguments provided.

Some CPUs can speculate past a SMC instruction and potentially perform
speculative access to emrmoy using the pre-call values before executing
the SMC.

There is no known gadget available after the SMC call today. However
some of the registers may contain values from the guest and are expected
to be updated by the SMC call.

In order to harden the code, it would be better to prevent straight-line
speculation from an SMC. Architecturally executing the speculation
barrier after every SMC can be rather expensive (particularly on core
not SB). Therefore we want to mitigate it diferrently:

    * For arm_smccc_1_0_smc, we can avoid a speculation barrier right
    after the SMC instruction and instead rely on the one after eret.
    * For arm_smccc_1_1_smc, we can place a B instruction after the SMC
    instruction to skip the barrier.

Note that arm_smccc_1_0_smc version on arm32 is just an alias to
arm_smccc_1_1_smc.

Note that no speculation barrier has been added after the SMC
instruction in arm64/entry.S. This is fine because the call is not
expected to modify any registers. So straight-line speculation doesn't
matter.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Note this hasn't been vetted by Arm but they are using the same
sort of mitigation for blr. So I am quite confident this could do the
trick.
---
 xen/arch/arm/arm64/smc.S     |  1 +
 xen/include/asm-arm/smccc.h  | 13 +++++++++++++
 xen/include/asm-arm/system.h |  8 ++++++++
 3 files changed, 22 insertions(+)

diff --git a/xen/arch/arm/arm64/smc.S b/xen/arch/arm/arm64/smc.S
index b0752be57e8f..e0a3106dd7ec 100644
--- a/xen/arch/arm/arm64/smc.S
+++ b/xen/arch/arm/arm64/smc.S
@@ -30,3 +30,4 @@ ENTRY(__arm_smccc_1_0_smc)
         stp     x2, x3, [x4, #SMCCC_RES_a2]
 1:
         ret
+        sb
diff --git a/xen/include/asm-arm/smccc.h b/xen/include/asm-arm/smccc.h
index 9d94beb3df2d..8650224923b1 100644
--- a/xen/include/asm-arm/smccc.h
+++ b/xen/include/asm-arm/smccc.h
@@ -200,11 +200,24 @@ struct arm_smccc_res {
  * We have an output list that is not necessarily used, and GCC feels
  * entitled to optimise the whole sequence away. "volatile" is what
  * makes it stick.
+ *
+ * Some of the SMC callers are passing directly values that are
+ * controlled by the guest. To mitigate against straight-line
+ * speculation, a speculation barrier is required. As it may be
+ * expensive to architecturally execute the speculation barrier, we are
+ * using a B instruction to architecturally skip it.
+ *
+ * Note that the speculation barrier is technically not necessary as the
+ * B instruction should already block straight-line speculation. But
+ * better be safe than sorry ;).
  */
 #define arm_smccc_1_1_smc(...)                                  \
     do {                                                        \
         __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         asm volatile("smc #0\n"                                 \
+                     "b 1f\n"                                   \
+                     ASM_SB                                     \
+                     "1:\n"                                     \
                      __constraints(__count_args(__VA_ARGS__))); \
         if ( ___res )                                           \
         *___res = (typeof(*___res)){r0, r1, r2, r3};            \
diff --git a/xen/include/asm-arm/system.h b/xen/include/asm-arm/system.h
index 65d5c8e423d7..e33ff4e0fc39 100644
--- a/xen/include/asm-arm/system.h
+++ b/xen/include/asm-arm/system.h
@@ -33,6 +33,14 @@
 #define smp_mb__before_atomic()    smp_mb()
 #define smp_mb__after_atomic()     smp_mb()
 
+/*
+ * Speculative barrier
+ * XXX: Add support for the 'sb' instruction
+ */
+#define ASM_SB "dsb nsh \n isb \n"
+
+#define sb()    asm volatile(ASM_SB)
+
 /*
  * This is used to ensure the compiler did actually allocate the register we
  * asked it for some inline assembly sequences.  Apparently we can't trust
-- 
2.17.1


