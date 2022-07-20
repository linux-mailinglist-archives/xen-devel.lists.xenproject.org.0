Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E92A657BDFF
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 20:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372156.604036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEh4-0004HW-8Z; Wed, 20 Jul 2022 18:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372156.604036; Wed, 20 Jul 2022 18:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEh4-0004Dr-0I; Wed, 20 Jul 2022 18:45:10 +0000
Received: by outflank-mailman (input) for mailman id 372156;
 Wed, 20 Jul 2022 18:45:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oEEh2-0003ri-Ey
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 18:45:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oEEh2-00077p-1r; Wed, 20 Jul 2022 18:45:08 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oEEh1-000309-QO; Wed, 20 Jul 2022 18:45:08 +0000
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
	bh=ZCcbJJZ0Rn+Gw3fU5XlJ9t1HEWrkwplqjvNtiYujb+U=; b=mgfkhn8HmiKixAUJGLH7LNTgmO
	mU+d2SWubeDXGLatCRQ1GhcpZh2cssgZarwNFrKkFR1D/XCixHhi2h5IClQUi/YidmJDEg8v5pRBK
	SfALmDJCWtenAHbvJjZZoq0C7cQFnJ6hZ8FPS2OFi4Xp4fYfoPNjyyxFGmi5OmF9qnlw=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/5] xen: Rename CONFIG_DOMAIN_PAGE to CONFIG_ARCH_MAP_DOMAIN_PAGE and...
Date: Wed, 20 Jul 2022 19:44:57 +0100
Message-Id: <20220720184459.51582-4-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220720184459.51582-1-julien@xen.org>
References: <20220720184459.51582-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

move it to Kconfig.

The define CONFIG_DOMAIN_PAGE indicates whether the architecture provide
helpers to map/unmap a domain page. Rename it to the define to
CONFIG_ARCH_MAP_DOMAIN_PAGE so it is clearer that this will not remove
support for domain page (this is not a concept that Xen can't get
away with).

Take the opportunity to move CONFIG_MAP_DOMAIN_PAGE to Kconfig as this
will soon be necessary to use it in the Makefile.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----
    Changes in v2:
        - New patch
---
 xen/arch/arm/Kconfig              | 1 +
 xen/arch/arm/include/asm/config.h | 1 -
 xen/arch/arm/mm.c                 | 2 +-
 xen/arch/x86/Kconfig              | 1 +
 xen/arch/x86/include/asm/config.h | 1 -
 xen/common/Kconfig                | 3 +++
 xen/include/xen/domain_page.h     | 6 +++---
 7 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index be9eff014120..33e004d702bf 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -1,6 +1,7 @@
 config ARM_32
 	def_bool y
 	depends on "$(ARCH)" = "arm32"
+	select ARCH_MAP_DOMAIN_PAGE
 
 config ARM_64
 	def_bool y
diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 66db618b34e7..2fafb9f2283c 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -122,7 +122,6 @@
 
 #ifdef CONFIG_ARM_32
 
-#define CONFIG_DOMAIN_PAGE 1
 #define CONFIG_SEPARATE_XENHEAP 1
 
 #define FRAMETABLE_VIRT_START  _AT(vaddr_t,0x02000000)
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 9311f3530066..7a722d6c86c6 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -371,7 +371,7 @@ void clear_fixmap(unsigned int map)
     BUG_ON(res != 0);
 }
 
-#ifdef CONFIG_DOMAIN_PAGE
+#ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
 /*
  * Prepare the area that will be used to map domheap pages. They are
  * mapped in 2MB chunks, so we need to allocate the page-tables up to
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 6bed72b79141..6a7825f4ba3c 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -8,6 +8,7 @@ config X86
 	select ACPI_LEGACY_TABLES_LOOKUP
 	select ACPI_NUMA
 	select ALTERNATIVE_CALL
+	select ARCH_MAP_DOMAIN_PAGE
 	select ARCH_SUPPORTS_INT128
 	select CORE_PARKING
 	select HAS_ALTERNATIVE
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index 07bcd158314b..fbc4bb3416bd 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -22,7 +22,6 @@
 #define CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS 1
 #define CONFIG_DISCONTIGMEM 1
 #define CONFIG_NUMA_EMU 1
-#define CONFIG_DOMAIN_PAGE 1
 
 #define CONFIG_PAGEALLOC_MAX_ORDER (2 * PAGETABLE_ORDER)
 #define CONFIG_DOMU_MAX_ORDER      PAGETABLE_ORDER
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 41a67891bcc8..f1ea3199c8eb 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -25,6 +25,9 @@ config GRANT_TABLE
 config ALTERNATIVE_CALL
 	bool
 
+config ARCH_MAP_DOMAIN_PAGE
+	bool
+
 config HAS_ALTERNATIVE
 	bool
 
diff --git a/xen/include/xen/domain_page.h b/xen/include/xen/domain_page.h
index a182d33b6701..149b217b9619 100644
--- a/xen/include/xen/domain_page.h
+++ b/xen/include/xen/domain_page.h
@@ -17,7 +17,7 @@
 void clear_domain_page(mfn_t mfn);
 void copy_domain_page(mfn_t dst, const mfn_t src);
 
-#ifdef CONFIG_DOMAIN_PAGE
+#ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
 
 /*
  * Map a given page frame, returning the mapped virtual address. The page is
@@ -51,7 +51,7 @@ static inline void *__map_domain_page_global(const struct page_info *pg)
     return map_domain_page_global(page_to_mfn(pg));
 }
 
-#else /* !CONFIG_DOMAIN_PAGE */
+#else /* !CONFIG_ARCH_MAP_DOMAIN_PAGE */
 
 #define map_domain_page(mfn)                __mfn_to_virt(mfn_x(mfn))
 #define __map_domain_page(pg)               page_to_virt(pg)
@@ -70,7 +70,7 @@ static inline void *__map_domain_page_global(const struct page_info *pg)
 
 static inline void unmap_domain_page_global(const void *va) {};
 
-#endif /* !CONFIG_DOMAIN_PAGE */
+#endif /* !CONFIG_ARCH_MAP_DOMAIN_PAGE */
 
 #define UNMAP_DOMAIN_PAGE(p) do {   \
     unmap_domain_page(p);           \
-- 
2.32.0


