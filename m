Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0814264EB4C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 13:18:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464575.723101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69eu-0001Pd-UM; Fri, 16 Dec 2022 12:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464575.723101; Fri, 16 Dec 2022 12:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69et-00013S-Tb; Fri, 16 Dec 2022 12:17:47 +0000
Received: by outflank-mailman (input) for mailman id 464575;
 Fri, 16 Dec 2022 12:17:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69ek-0007ME-8w
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 12:17:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69ek-000352-1s; Fri, 16 Dec 2022 12:17:38 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69DF-0004sN-Tm; Fri, 16 Dec 2022 11:49:14 +0000
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
	bh=0Z58+ljccBpyu6+vCHwEkzyLj9W+Yww30i/0Y5Sz5B8=; b=Zd4d/HSmX9uz8oxK0Qhb4IZghT
	JBZ/9u+4SV77VeU8gypa9BTxRue7jjePjDTAdHMsiYEZTVC7eBcRuAztSNx8zYZUfdiG/Cvc1YGIt
	NzlET4hvhXzN/H35oWT2f3uCWF5LomvsdWaDIttUt0F683e3F3OlljrWKZOAhE1099QA=;
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
	Wei Liu <wl@xen.org>
Subject: [PATCH 12/22] xen/arm: fixmap: Rename the fixmap slots to follow the x86 convention
Date: Fri, 16 Dec 2022 11:48:43 +0000
Message-Id: <20221216114853.8227-13-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216114853.8227-1-julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment the fixmap slots are prefixed differently between arm and
x86.

Some of them (e.g. the PMAP slots) are used in common code. So it would
be better if they are named the same way to avoid having to create
aliases.

I have decided to use the x86 naming because they are less change. So
all the Arm fixmap slots will now be prefixed with FIX rather than
FIXMAP.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

    Note that potentially more renaming that could be done to share
    more code in future. I have decided to not do that to avoid going
    down a rabbit hole.
---
 xen/arch/arm/acpi/lib.c                 | 18 +++++++++---------
 xen/arch/arm/include/asm/early_printk.h |  2 +-
 xen/arch/arm/include/asm/fixmap.h       | 16 ++++++++--------
 xen/arch/arm/kernel.c                   |  6 +++---
 xen/common/pmap.c                       |  8 ++++----
 5 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/acpi/lib.c b/xen/arch/arm/acpi/lib.c
index 41d521f720ac..736cf09ecaa8 100644
--- a/xen/arch/arm/acpi/lib.c
+++ b/xen/arch/arm/acpi/lib.c
@@ -40,10 +40,10 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
         return NULL;
 
     offset = phys & (PAGE_SIZE - 1);
-    base = FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) + offset;
+    base = FIXMAP_ADDR(FIX_ACPI_BEGIN) + offset;
 
     /* Check the fixmap is big enough to map the region */
-    if ( (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE - base) < size )
+    if ( (FIXMAP_ADDR(FIX_ACPI_END) + PAGE_SIZE - base) < size )
         return NULL;
 
     /* With the fixmap, we can only map one region at the time */
@@ -54,7 +54,7 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
 
     size += offset;
     mfn = maddr_to_mfn(phys);
-    idx = FIXMAP_ACPI_BEGIN;
+    idx = FIX_ACPI_BEGIN;
 
     do {
         set_fixmap(idx, mfn, PAGE_HYPERVISOR);
@@ -72,8 +72,8 @@ bool __acpi_unmap_table(const void *ptr, unsigned long size)
     unsigned int idx;
 
     /* We are only handling fixmap address in the arch code */
-    if ( (vaddr < FIXMAP_ADDR(FIXMAP_ACPI_BEGIN)) ||
-         (vaddr >= (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE)) )
+    if ( (vaddr < FIXMAP_ADDR(FIX_ACPI_BEGIN)) ||
+         (vaddr >= (FIXMAP_ADDR(FIX_ACPI_END) + PAGE_SIZE)) )
         return false;
 
     /*
@@ -81,16 +81,16 @@ bool __acpi_unmap_table(const void *ptr, unsigned long size)
      * for the ACPI fixmap region. The caller is expected to free with
      * the same address.
      */
-    ASSERT((vaddr & PAGE_MASK) == FIXMAP_ADDR(FIXMAP_ACPI_BEGIN));
+    ASSERT((vaddr & PAGE_MASK) == FIXMAP_ADDR(FIX_ACPI_BEGIN));
 
     /* The region allocated fit in the ACPI fixmap region. */
-    ASSERT(size < (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE - vaddr));
+    ASSERT(size < (FIXMAP_ADDR(FIX_ACPI_END) + PAGE_SIZE - vaddr));
     ASSERT(fixmap_inuse);
 
     fixmap_inuse = false;
 
-    size += vaddr - FIXMAP_ADDR(FIXMAP_ACPI_BEGIN);
-    idx = FIXMAP_ACPI_BEGIN;
+    size += vaddr - FIXMAP_ADDR(FIX_ACPI_BEGIN);
+    idx = FIX_ACPI_BEGIN;
 
     do
     {
diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
index c5149b2976da..a5f48801f476 100644
--- a/xen/arch/arm/include/asm/early_printk.h
+++ b/xen/arch/arm/include/asm/early_printk.h
@@ -17,7 +17,7 @@
 
 /* need to add the uart address offset in page to the fixmap address */
 #define EARLY_UART_VIRTUAL_ADDRESS \
-    (FIXMAP_ADDR(FIXMAP_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
+    (FIXMAP_ADDR(FIX_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
 
 #endif /* !CONFIG_EARLY_PRINTK */
 
diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
index d0c9a52c8c28..154db85686c2 100644
--- a/xen/arch/arm/include/asm/fixmap.h
+++ b/xen/arch/arm/include/asm/fixmap.h
@@ -8,17 +8,17 @@
 #include <xen/pmap.h>
 
 /* Fixmap slots */
-#define FIXMAP_CONSOLE  0  /* The primary UART */
-#define FIXMAP_MISC     1  /* Ephemeral mappings of hardware */
-#define FIXMAP_ACPI_BEGIN  2  /* Start mappings of ACPI tables */
-#define FIXMAP_ACPI_END    (FIXMAP_ACPI_BEGIN + NUM_FIXMAP_ACPI_PAGES - 1)  /* End mappings of ACPI tables */
-#define FIXMAP_PMAP_BEGIN (FIXMAP_ACPI_END + 1) /* Start of PMAP */
-#define FIXMAP_PMAP_END (FIXMAP_PMAP_BEGIN + NUM_FIX_PMAP - 1) /* End of PMAP */
+#define FIX_CONSOLE  0  /* The primary UART */
+#define FIX_MISC     1  /* Ephemeral mappings of hardware */
+#define FIX_ACPI_BEGIN  2  /* Start mappings of ACPI tables */
+#define FIX_ACPI_END    (FIX_ACPI_BEGIN + NUM_FIXMAP_ACPI_PAGES - 1)  /* End mappings of ACPI tables */
+#define FIX_PMAP_BEGIN (FIX_ACPI_END + 1) /* Start of PMAP */
+#define FIX_PMAP_END (FIX_PMAP_BEGIN + NUM_FIX_PMAP - 1) /* End of PMAP */
 
-#define FIXMAP_LAST FIXMAP_PMAP_END
+#define FIX_LAST FIX_PMAP_END
 
 #define FIXADDR_START FIXMAP_ADDR(0)
-#define FIXADDR_TOP FIXMAP_ADDR(FIXMAP_LAST)
+#define FIXADDR_TOP FIXMAP_ADDR(FIX_LAST)
 
 #ifndef __ASSEMBLY__
 
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 23b840ea9ea8..56800750fd9c 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -49,7 +49,7 @@ struct minimal_dtb_header {
  */
 void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
 {
-    void *src = (void *)FIXMAP_ADDR(FIXMAP_MISC);
+    void *src = (void *)FIXMAP_ADDR(FIX_MISC);
 
     while (len) {
         unsigned long l, s;
@@ -57,10 +57,10 @@ void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
         s = paddr & (PAGE_SIZE-1);
         l = min(PAGE_SIZE - s, len);
 
-        set_fixmap(FIXMAP_MISC, maddr_to_mfn(paddr), PAGE_HYPERVISOR_WC);
+        set_fixmap(FIX_MISC, maddr_to_mfn(paddr), PAGE_HYPERVISOR_WC);
         memcpy(dst, src + s, l);
         clean_dcache_va_range(dst, l);
-        clear_fixmap(FIXMAP_MISC);
+        clear_fixmap(FIX_MISC);
 
         paddr += l;
         dst += l;
diff --git a/xen/common/pmap.c b/xen/common/pmap.c
index 14517198aae3..6e3ba9298df4 100644
--- a/xen/common/pmap.c
+++ b/xen/common/pmap.c
@@ -32,8 +32,8 @@ void *__init pmap_map(mfn_t mfn)
 
     __set_bit(idx, inuse);
 
-    slot = idx + FIXMAP_PMAP_BEGIN;
-    ASSERT(slot >= FIXMAP_PMAP_BEGIN && slot <= FIXMAP_PMAP_END);
+    slot = idx + FIX_PMAP_BEGIN;
+    ASSERT(slot >= FIX_PMAP_BEGIN && slot <= FIX_PMAP_END);
 
     /*
      * We cannot use set_fixmap() here. We use PMAP when the domain map
@@ -53,10 +53,10 @@ void __init pmap_unmap(const void *p)
     unsigned int slot = virt_to_fix((unsigned long)p);
 
     ASSERT(system_state < SYS_STATE_smp_boot);
-    ASSERT(slot >= FIXMAP_PMAP_BEGIN && slot <= FIXMAP_PMAP_END);
+    ASSERT(slot >= FIX_PMAP_BEGIN && slot <= FIX_PMAP_END);
     ASSERT(!in_irq());
 
-    idx = slot - FIXMAP_PMAP_BEGIN;
+    idx = slot - FIX_PMAP_BEGIN;
 
     __clear_bit(idx, inuse);
     arch_pmap_unmap(slot);
-- 
2.38.1


