Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AED743051
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 00:18:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557167.870270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEzy2-0001ML-2X; Thu, 29 Jun 2023 22:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557167.870270; Thu, 29 Jun 2023 22:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEzy1-0001K1-W4; Thu, 29 Jun 2023 22:18:21 +0000
Received: by outflank-mailman (input) for mailman id 557167;
 Thu, 29 Jun 2023 22:18:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8DWp=CR=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qEzy0-0001Jv-S1
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 22:18:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d8f06f69-16ca-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 00:18:18 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BA8FC14;
 Thu, 29 Jun 2023 15:19:00 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A7B393F64C;
 Thu, 29 Jun 2023 15:18:14 -0700 (PDT)
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
X-Inumbo-ID: d8f06f69-16ca-11ee-8611-37d641c3527e
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: vgic: Add missing 'U' in VGIC_ICFG_MASK for shifted constant
Date: Fri, 30 Jun 2023 06:18:00 +0800
Message-Id: <20230629221800.1478182-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With UBSAN on some arm64 platforms, e.g. FVP_Base_RevC-2xAEMvA, the
following splat will be printed while Dom0 is booting:
```
(XEN) ==================================================================
(XEN) UBSAN: Undefined behaviour in arch/arm/vgic.c:372:15
(XEN) left shift of 1 by 31 places cannot be represented in type 'int'
(XEN) Xen WARN at common/ubsan/ubsan.c:172
(XEN) ----[ Xen-4.18-unstable  arm64  debug=y ubsan=y  Not tainted ]----
```

This is because there is a device node in the device tree with 0xf
as the interrupts property. Example of the device tree node is shown
below:
```
ethernet@202000000 {
    compatible = "smsc,lan91c111";
    reg = <0x2 0x2000000 0x10000>;
    interrupts = <0xf>;
};
```
and this value is passed to vgic_get_virq_type() as "index" then "intr"
in VGIC_ICFG_MASK.

Add the missing 'U' in VGIC_ICFG_MASK as a fix, and this should also
addressing MISRA Rule 7.2:

    A "u" or "U" suffix shall be applied to all integer constants that
    are represented in an unsigned type

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
This patch should be based on top of Julien's series
"xen/arm: Enable UBSAN support" to test.
---
 xen/arch/arm/vgic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index c61c68870c..97d6f61066 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -358,7 +358,7 @@ void vgic_disable_irqs(struct vcpu *v, uint32_t r, int n)
     }
 }
 
-#define VGIC_ICFG_MASK(intr) (1 << ((2 * ((intr) % 16)) + 1))
+#define VGIC_ICFG_MASK(intr) (1U << ((2 * ((intr) % 16)) + 1))
 
 /* The function should be called with the rank lock taken */
 static inline unsigned int vgic_get_virq_type(struct vcpu *v, int n, int index)
-- 
2.25.1


