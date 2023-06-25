Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6567873D437
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jun 2023 22:50:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554880.866366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDWfn-0004jf-7w; Sun, 25 Jun 2023 20:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554880.866366; Sun, 25 Jun 2023 20:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDWfn-0004gk-0D; Sun, 25 Jun 2023 20:49:27 +0000
Received: by outflank-mailman (input) for mailman id 554880;
 Sun, 25 Jun 2023 20:49:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDWfm-0004Sx-1W
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 20:49:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDWfl-0003O0-Rk; Sun, 25 Jun 2023 20:49:25 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDWfl-00021M-KD; Sun, 25 Jun 2023 20:49:25 +0000
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
	bh=eAiFR9Z75adT3afecve41CD/1YrEKTUVp4d/ZLD9OoM=; b=4W0vSFoPDDHqErzNGySTz6h8Jv
	JqYRViLF8SPwgIwLVedJ358uQtJ+hqaB1eiSYfiHArgGMUF/LhSrHjhsvtBTJcyV82+JwgNn2a82X
	1vb4dZGj8oRKgssx7usH/om0pK3m999c76x9bA3tjewmM0TBH9MhxFPzf0loV0woqpHY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 8/9] xen/arm: Allow the user to build Xen with USBAN
Date: Sun, 25 Jun 2023 21:49:06 +0100
Message-Id: <20230625204907.57291-9-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230625204907.57291-1-julien@xen.org>
References: <20230625204907.57291-1-julien@xen.org>
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
Furthermore, one may want to enable USBAN and GCOV which would put
the binary well-over 4MB (both features require for some space).
Therefore, increase the size to 8MB which should us some margin.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

The drawback with this approach is that we are adding 6 new
page-table (3 for boot and 3 for runtime) that are statically
allocated. So the final Xen binary will be 24KB bigger when
neither UBSAN nor GCOV.

If this is not considered acceptable, then we could make the
size of configurable in the Kconfig and decide it based on the
features enabled.
---
 xen/arch/arm/Kconfig              |  1 +
 xen/arch/arm/include/asm/config.h | 18 +++++++++---------
 2 files changed, 10 insertions(+), 9 deletions(-)

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
index 6d246ab23c48..1bbf4cc9958d 100644
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
@@ -124,7 +124,7 @@
 #define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
 #endif
 
-#define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
+#define XEN_VIRT_SIZE           _AT(vaddr_t, MB(8))
 #define XEN_NR_ENTRIES(lvl)     (XEN_VIRT_SIZE / XEN_PT_LEVEL_SIZE(lvl))
 
 #define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
-- 
2.40.1


