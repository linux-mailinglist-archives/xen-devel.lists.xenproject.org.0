Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 336B582F4AC
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 19:52:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667963.1039764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPoXo-0006N0-GQ; Tue, 16 Jan 2024 18:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667963.1039764; Tue, 16 Jan 2024 18:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPoXo-0006JV-C4; Tue, 16 Jan 2024 18:52:16 +0000
Received: by outflank-mailman (input) for mailman id 667963;
 Tue, 16 Jan 2024 18:52:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPoXm-0003xp-9U
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 18:52:14 +0000
Received: from smtp-fw-52002.amazon.com (smtp-fw-52002.amazon.com
 [52.119.213.150]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b94df11-b4a0-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 19:52:12 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1e-m6i4x-6e7a78d7.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-52002.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 18:52:11 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan2.iad.amazon.com [10.32.235.34])
 by email-inbound-relay-iad-1e-m6i4x-6e7a78d7.us-east-1.amazon.com (Postfix)
 with ESMTPS id 1DA768032A; Tue, 16 Jan 2024 18:52:08 +0000 (UTC)
Received: from EX19MTAUEC002.ant.amazon.com [10.0.29.78:60336]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.3.20:2525] with
 esmtp (Farcaster)
 id 1934339f-4f50-41ac-9c8d-421e1f1e4d14; Tue, 16 Jan 2024 18:52:07 +0000 (UTC)
Received: from EX19D008UEC004.ant.amazon.com (10.252.135.170) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:52:01 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEC004.ant.amazon.com (10.252.135.170) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:52:01 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 18:51:59 +0000
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
X-Inumbo-ID: 5b94df11-b4a0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705431132; x=1736967132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wuXlYkg7+aoOLvwI5g/1GuKiK7EGIYHkmtLupKWUrjI=;
  b=W7CUbFJ6CCFHWZuY1IP7Fq1UMNjuk8qPubp2rzcbn8T/apnpTWMpwaWS
   hf72r5vC2sbe4eBfZ32yjLwJNrPctFynEBSf3uhRaBxQn/UKMEZ4HMRmA
   le3fCQskCdR/d+q7FBUq4BJ3vZjU8Ca+hkfOtPecdIVIHSDXNXEEPMedI
   0=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="606811514"
X-Farcaster-Flow-ID: 1934339f-4f50-41ac-9c8d-421e1f1e4d14
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Elias El Yandouzi
	<eliasely@amazon.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v2] xen/arm: fixmap: Rename the fixmap slots to follow the x86 convention
Date: Tue, 16 Jan 2024 18:50:43 +0000
Message-ID: <20240116185056.15000-15-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116185056.15000-1-eliasely@amazon.com>
References: <20240116185056.15000-1-eliasely@amazon.com>
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


