Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A15628DF24
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 12:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6525.17407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSeEi-0003xT-QH; Wed, 14 Oct 2020 10:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6525.17407; Wed, 14 Oct 2020 10:42:24 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSeEi-0003x4-NC; Wed, 14 Oct 2020 10:42:24 +0000
Received: by outflank-mailman (input) for mailman id 6525;
 Wed, 14 Oct 2020 10:42:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JG+m=DV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kSeEh-0003wz-Jy
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 10:42:23 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3613910b-71e1-4446-9ad1-422dd94331a1;
 Wed, 14 Oct 2020 10:42:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C46541FB;
 Wed, 14 Oct 2020 03:42:22 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.198.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F7643F73C;
 Wed, 14 Oct 2020 03:42:22 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JG+m=DV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kSeEh-0003wz-Jy
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 10:42:23 +0000
X-Inumbo-ID: 3613910b-71e1-4446-9ad1-422dd94331a1
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 3613910b-71e1-4446-9ad1-422dd94331a1;
	Wed, 14 Oct 2020 10:42:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C46541FB;
	Wed, 14 Oct 2020 03:42:22 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.198.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F7643F73C;
	Wed, 14 Oct 2020 03:42:22 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Warn user on cpu errata 832075
Date: Wed, 14 Oct 2020 11:41:51 +0100
Message-Id: <f11fe960a111530501fd0c20893bec4e32edf3cb.1602671985.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

When a Cortex A57 processor is affected by CPU errata 832075, a guest
not implementing the workaround for it could deadlock the system.
Add a warning during boot informing the user that only trusted guests
should be executed on the system.
An equivalent warning is already given to the user by KVM on cores
affected by this errata.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/cpuerrata.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 6c09017515..8f9ab6dde1 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -240,6 +240,26 @@ static int enable_ic_inv_hardening(void *data)
 
 #endif
 
+#ifdef CONFIG_ARM64_ERRATUM_832075
+
+static int warn_device_load_acquire_errata(void *data)
+{
+    static bool warned = false;
+
+    if ( !warned )
+    {
+        warning_add("This CPU is affected by the errata 832075.\n"
+                    "Guests without required CPU erratum workarounds\n"
+                    "can deadlock the system!\n"
+                    "Only trusted guests should be used on this system.\n");
+        warned = true;
+    }
+
+    return 0;
+}
+
+#endif
+
 #ifdef CONFIG_ARM_SSBD
 
 enum ssbd_state ssbd_state = ARM_SSBD_RUNTIME;
@@ -419,6 +439,7 @@ static const struct arm_cpu_capabilities arm_errata[] = {
         .capability = ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE,
         MIDR_RANGE(MIDR_CORTEX_A57, 0x00,
                    (1 << MIDR_VARIANT_SHIFT) | 2),
+        .enable = warn_device_load_acquire_errata,
     },
 #endif
 #ifdef CONFIG_ARM64_ERRATUM_834220
-- 
2.17.1


