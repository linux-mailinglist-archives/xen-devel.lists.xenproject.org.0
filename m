Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8438882F553
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:27:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668094.1040098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp5F-0007PF-QB; Tue, 16 Jan 2024 19:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668094.1040098; Tue, 16 Jan 2024 19:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp5F-0007CZ-F3; Tue, 16 Jan 2024 19:26:49 +0000
Received: by outflank-mailman (input) for mailman id 668094;
 Tue, 16 Jan 2024 19:26:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp5C-0002iI-6d
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:26:46 +0000
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d8e4dfc-b4a5-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 20:26:44 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2b-m6i4x-f253a3a3.us-west-2.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-9102.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:26:35 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
 by email-inbound-relay-pdx-2b-m6i4x-f253a3a3.us-west-2.amazon.com (Postfix)
 with ESMTPS id B30BC8A2C3; Tue, 16 Jan 2024 19:26:34 +0000 (UTC)
Received: from EX19MTAUEB001.ant.amazon.com [10.0.44.209:55964]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.15.248:2525]
 with esmtp (Farcaster)
 id f65ba36b-25b8-4d05-94e6-4f35e33c5e6c; Tue, 16 Jan 2024 19:26:34 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:33 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:33 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 19:26:32 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2d8e4dfc-b4a5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705433204; x=1736969204;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wuXlYkg7+aoOLvwI5g/1GuKiK7EGIYHkmtLupKWUrjI=;
  b=b2J504VdoICtkKKbRBdd/H22G7IwiUjt37SvIJBC/W1XQa0c2k8l++zp
   fiLEWcsDWqFtLxB8JNzN6qKgey+qMtxcvrUI1mOQqjud8WYdfcuXc/Foc
   44HcKRaQIXLTu4fEwK4G6Ne6dGodrXlfMR1N2K6z5xhyEcqTDCQr1vC+Q
   o=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="390211249"
X-Farcaster-Flow-ID: f65ba36b-25b8-4d05-94e6-4f35e33c5e6c
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Elias El Yandouzi
	<eliasely@amazon.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v2 (resend) 14/27] xen/arm: fixmap: Rename the fixmap slots to follow the x86 convention
Date: Tue, 16 Jan 2024 19:25:58 +0000
Message-ID: <20240116192611.41112-15-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
References: <20240116192611.41112-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

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
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

----

    Note that potentially more renaming that could be done to share
    more code in future. I have decided to not do that to avoid going
    down a rabbit hole.

diff --git a/xen/arch/arm/acpi/lib.c b/xen/arch/arm/acpi/lib.c
index 41d521f720..736cf09eca 100644
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
index c1e84f8b00..f444e89a86 100644
--- a/xen/arch/arm/include/asm/early_printk.h
+++ b/xen/arch/arm/include/asm/early_printk.h
@@ -17,7 +17,7 @@
 
 /* need to add the uart address offset in page to the fixmap address */
 #define EARLY_UART_VIRTUAL_ADDRESS \
-    (FIXMAP_ADDR(FIXMAP_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
+    (FIXMAP_ADDR(FIX_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
 
 #define TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS \
     (TEMPORARY_FIXMAP_ADDR(FIXMAP_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
index 734eb9b1d4..a823456ecb 100644
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
 
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 72725840b6..57f1b46499 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -351,7 +351,7 @@ void free_init_memory(void)
  */
 void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
 {
-    void *src = (void *)FIXMAP_ADDR(FIXMAP_MISC);
+    void *src = (void *)FIXMAP_ADDR(FIX_MISC);
 
     while (len) {
         unsigned long l, s;
@@ -359,10 +359,10 @@ void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
         s = paddr & (PAGE_SIZE - 1);
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
index 14517198aa..6e3ba9298d 100644
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
2.40.1


