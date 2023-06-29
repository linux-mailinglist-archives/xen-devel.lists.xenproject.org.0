Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D4B742E2D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 22:11:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557074.870139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExzP-0006Tx-B0; Thu, 29 Jun 2023 20:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557074.870139; Thu, 29 Jun 2023 20:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExzP-0006LF-6e; Thu, 29 Jun 2023 20:11:39 +0000
Received: by outflank-mailman (input) for mailman id 557074;
 Thu, 29 Jun 2023 20:11:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qExzO-000686-4o
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 20:11:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qExzO-0006la-0K; Thu, 29 Jun 2023 20:11:38 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qExzN-0000KI-Ot; Thu, 29 Jun 2023 20:11:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=/jdx3egdYMGcVcThBa+BLos4+OXw1gDLyp5YfV1/oUM=; b=xaAZRgPF3+z/GpC7TjxSIseKlC
	7t9Kd8yXMSvBP3u8WLx8NeQQI8KyIDSAgzdTFSUd2ioCwLszDafJ7ExldM7+wGTYYk/xIVUiIkTuf
	0Dhc9EGq7wI6qh201tJc9addkPMXLKXACyUlbEfpLbzkKD97X+pErfe0ZtqlaC6ObmEc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>
Subject: [v2 4/4] xen/arm: Allow the user to build Xen with UBSAN
Date: Thu, 29 Jun 2023 21:11:29 +0100
Message-Id: <20230629201129.12934-5-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230629201129.12934-1-julien@xen.org>
References: <20230629201129.12934-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

UBSAN has been enabled a few years ago on x86 but was never
enabled on Arm because the final binary is bigger than 2MB (
the maximum we can currently handled).

With the recent rework, it is now possible to grow Xen over 2MB.
So there is no more roadblock to enable Xen other than increasing
the reserved area.

On my setup, for arm32, the final binaray was very close to 4MB.
Furthermore, one may want to enable UBSAN and GCOV which would put
the binary well-over 4MB (both features require for some space).
Therefore, increase the size to 8MB which should us some margin.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

The drawback with this approach is that we are adding 6 new
page-table (3 for boot and 3 for runtime) that are statically
allocated. So the final Xen binary will be 24KB bigger when
neither UBSAN nor GCOV.

If this is not considered acceptable, then we could make the
size of configurable in the Kconfig and decide it based on the
features enabled.

    Changes in v2:
        - Fix typoes
        - Add Michal's reviewed-by tag
        - Add Henry's  reviewed-by tag
        - Add a comment regarding the reserved size for Xen
---
 xen/arch/arm/Kconfig              |  1 +
 xen/arch/arm/include/asm/config.h | 22 +++++++++++++---------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 61e581b8c2b0..06b5ff755c95 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -17,6 +17,7 @@ config ARM
 	select HAS_PASSTHROUGH
 	select HAS_PDX
 	select HAS_PMAP
+	select HAS_UBSAN
 	select IOMMU_FORCE_PT_SHARE
 
 config ARCH_DEFCONFIG
diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 6d246ab23c48..cc32802ad0e9 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -74,10 +74,10 @@
 /*
  * ARM32 layout:
  *   0  -   2M   Unmapped
- *   2M -   4M   Xen text, data, bss
- *   4M -   6M   Fixmap: special-purpose 4K mapping slots
- *   6M -  10M   Early boot mapping of FDT
- *   10M - 12M   Livepatch vmap (if compiled in)
+ *   2M -  10M   Xen text, data, bss
+ *  10M -  12M   Fixmap: special-purpose 4K mapping slots
+ *  12M -  16M   Early boot mapping of FDT
+ *  16M -  18M   Livepatch vmap (if compiled in)
  *
  *  32M - 128M   Frametable: 32 bytes per page for 12GB of RAM
  * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
@@ -94,10 +94,10 @@
  * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4])
  *  (Relative offsets)
  *   0  -   2M   Unmapped
- *   2M -   4M   Xen text, data, bss
- *   4M -   6M   Fixmap: special-purpose 4K mapping slots
- *   6M -  10M   Early boot mapping of FDT
- *  10M -  12M   Livepatch vmap (if compiled in)
+ *   2M -  10M   Xen text, data, bss
+ *  10M -  12M   Fixmap: special-purpose 4K mapping slots
+ *  12M -  16M   Early boot mapping of FDT
+ *  16M -  18M   Livepatch vmap (if compiled in)
  *
  *   1G -   2G   VMAP: ioremap and early_ioremap
  *
@@ -124,7 +124,11 @@
 #define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
 #endif
 
-#define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
+/*
+ * Reserve enough space so both UBSAN and GCOV can be enabled together
+ * plus some slack for future growth.
+ */
+#define XEN_VIRT_SIZE           _AT(vaddr_t, MB(8))
 #define XEN_NR_ENTRIES(lvl)     (XEN_VIRT_SIZE / XEN_PT_LEVEL_SIZE(lvl))
 
 #define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
-- 
2.40.1


