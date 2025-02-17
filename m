Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA209A38019
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:28:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890178.1299218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyM5-0002vg-IE; Mon, 17 Feb 2025 10:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890178.1299218; Mon, 17 Feb 2025 10:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyM5-0002uH-BH; Mon, 17 Feb 2025 10:28:01 +0000
Received: by outflank-mailman (input) for mailman id 890178;
 Mon, 17 Feb 2025 10:27:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bV9=VI=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tjyM3-0001n7-TH
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:27:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d6790e30-ed19-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 11:27:50 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01A762444;
 Mon, 17 Feb 2025 02:28:09 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B98933F6A8;
 Mon, 17 Feb 2025 02:27:48 -0800 (PST)
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
X-Inumbo-ID: d6790e30-ed19-11ef-9896-31a8f345e629
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/2] xen/arm: Restrict Kconfig configuration for LLC coloring
Date: Mon, 17 Feb 2025 10:27:32 +0000
Message-Id: <20250217102732.2343729-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217102732.2343729-1-luca.fancellu@arm.com>
References: <20250217102732.2343729-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LLC coloring can be used only on MMU system, move the code
that selects it from ARM_64 to MMU and add the ARM_64
dependency.

While there, add a clarification comment in the startup
code related to the LLC coloring, because boot_fdt_info()
is required to be called before llc_coloring_init(), because
it parses the memory banks from the DT, but to discover that
the developer needs to dig into the function.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2 changes:
 - dropped part of the v1 code, now this one is simpler, I will
   discuss better how to design a common boot flow for MPU and
   implement on another patch.

---
---
 xen/arch/arm/Kconfig | 2 +-
 xen/arch/arm/setup.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a26d3e11827c..ffdff1f0a36c 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -8,7 +8,6 @@ config ARM_64
 	depends on !ARM_32
 	select 64BIT
 	select HAS_FAST_MULTIPLY
-	select HAS_LLC_COLORING if !NUMA
 
 config ARM
 	def_bool y
@@ -76,6 +75,7 @@ choice
 
 config MMU
 	bool "MMU"
+	select HAS_LLC_COLORING if !NUMA && ARM_64
 	select HAS_PMAP
 	select HAS_VMAP
 	select HAS_PASSTHROUGH
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index c1f2d1b89d43..91fa579e73e5 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -328,6 +328,7 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
                              (paddr_t)(uintptr_t)(_end - _start), false);
     BUG_ON(!xen_bootmodule);
 
+    /* This parses memory banks needed for LLC coloring */
     fdt_size = boot_fdt_info(device_tree_flattened, fdt_paddr);
 
     cmdline = boot_fdt_cmdline(device_tree_flattened);
-- 
2.34.1


