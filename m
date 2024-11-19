Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 245F89D27D3
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:13:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840126.1255944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOz9-0000FG-JZ; Tue, 19 Nov 2024 14:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840126.1255944; Tue, 19 Nov 2024 14:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOz9-00005t-D9; Tue, 19 Nov 2024 14:13:43 +0000
Received: by outflank-mailman (input) for mailman id 840126;
 Tue, 19 Nov 2024 14:13:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDt+=SO=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tDOz7-0007nd-Ab
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:13:41 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 776cfafe-a680-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 15:13:36 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa4cb5fcc06so134601766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:13:36 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df4e7bfsm655228166b.42.2024.11.19.06.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 06:13:35 -0800 (PST)
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
X-Inumbo-ID: 776cfafe-a680-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmIiLCJoZWxvIjoibWFpbC1lajEteDYyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc3NmNmYWZlLWE2ODAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDI1NjE2LjMyOTM2NSwic2VuZGVyIjoiY2FybG8ubm9uYXRvQG1pbmVydmFzeXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1732025615; x=1732630415; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShqeUeLuURvoXpfFD6047wJmCbE0pSqdks3ivWaczJ8=;
        b=ao8vplhfrrJTMv8s1+CHh2TTuSbu/AV6Mirt4IUmdF/U+f0Ku3+EiBhx6AdjBkrm6n
         BFtTtiHlrAKHUgRvkdz+NkLBsOCRQeQXkBs+RvjniXQu2tWQknS5C0awmBhJ8dPogNLE
         bHwba9WhS7RIJ1GX1rKIbhlKVBXzF70XRf6+/8Gl0XYSKbtHhavbWBqUIZURT7IsX4CN
         gQd/rvua2jz4PCSW9AS4TOW87xv4UNru+vBC8lsiB28BscxaFmd5uQ1BxS38vV50rGp+
         YhTwazqc+XdTwOBDcGwYx67O0QqxtGKDiLQ7UxqP9sSkfOxGchaHU08KIoXnhTdMgndb
         +Tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732025615; x=1732630415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShqeUeLuURvoXpfFD6047wJmCbE0pSqdks3ivWaczJ8=;
        b=lgyTlwxY8fFDHRYPg2B4gc0o4YOUTikLD+GN1BVCJ69qIZ/vCEOiP4whLQosYXZ86V
         9qZiI+oHsB4zAwU9cDH0Y+p4rhKP0M0MB9GwQDQvcWqbPBpDFAtO0ulTStnVWNjTQh3X
         4RW3eNPS8cPLGOJ15EOmmzE6xztmTrhwl1Plr6ytfdyRDLOyC0pJivhzCXlgG5OY9zBZ
         w/aKX3VGfKw0TNWY3vcG/r5zuVXZ+/5ESFn2rb2odHRv3PutAove7NMJsqMTSvLPXJeT
         k+nZX9507IqGm1GIBkSc4LFduMGvH5ZfN9BizPc0h1UVnyoSexqZ9ifjNP2q1hiNfuy5
         wRJw==
X-Gm-Message-State: AOJu0YzdbXUC36xMpGoGnqI/ptlWCRsBegWF6KZh4OfewwmPTnJcrJ/1
	oaKbZbobzaWG+zjRYq75zKeEqrWoyyL8AauLRiSiz584Jw8Cd2NKhMCu9x/a3YhFkKRwN6Peg3e
	P
X-Google-Smtp-Source: AGHT+IG1wuHNdM1zdKEM1V9FwFqHMCAcni3q2IzwxVE1Q59FJRUsbTkKx/Ajwfcz8BYDORPIzKDWXg==
X-Received: by 2002:a17:907:3e0c:b0:a9a:154e:dd86 with SMTP id a640c23a62f3a-aa483487a67mr1551749966b.28.1732025615515;
        Tue, 19 Nov 2024 06:13:35 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v10 03/12] xen/arm: permit non direct-mapped Dom0 construction
Date: Tue, 19 Nov 2024 15:13:20 +0100
Message-ID: <20241119141329.44221-4-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cache coloring requires Dom0 not to be direct-mapped because of its non
contiguous mapping nature, so allocate_memory() is needed in this case.
8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a separate module")
moved allocate_memory() in dom0less_build.c. In order to use it
in Dom0 construction bring it back to domain_build.c and declare it in
domain_build.h.

Take the opportunity to adapt the implementation of allocate_memory() so
that it uses the host layout when called on the hwdom, via
find_unallocated_memory().

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
v10:
- fixed a compilation bug that happened when dom0less support was disabled
v9:
- no changes
v8:
- patch adapted to new changes to allocate_memory()
v7:
- allocate_memory() now uses the host layout when called on the hwdom
v6:
- new patch
---
 xen/arch/arm/dom0less-build.c           | 44 ------------
 xen/arch/arm/domain_build.c             | 96 +++++++++++++++++++++++--
 xen/arch/arm/include/asm/domain_build.h |  1 +
 3 files changed, 93 insertions(+), 48 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index d93a85434e..67b1503647 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -49,50 +49,6 @@ bool __init is_dom0less_mode(void)
     return ( !dom0found && domUfound );
 }
 
-static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
-{
-    struct membanks *mem = kernel_info_get_mem(kinfo);
-    unsigned int i;
-    paddr_t bank_size;
-
-    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
-           /* Don't want format this as PRIpaddr (16 digit hex) */
-           (unsigned long)(kinfo->unassigned_mem >> 20), d);
-
-    mem->nr_banks = 0;
-    bank_size = MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
-    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
-                               bank_size) )
-        goto fail;
-
-    bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
-    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
-                               bank_size) )
-        goto fail;
-
-    if ( kinfo->unassigned_mem )
-        goto fail;
-
-    for( i = 0; i < mem->nr_banks; i++ )
-    {
-        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
-               d,
-               i,
-               mem->bank[i].start,
-               mem->bank[i].start + mem->bank[i].size,
-               /* Don't want format this as PRIpaddr (16 digit hex) */
-               (unsigned long)(mem->bank[i].size >> 20));
-    }
-
-    return;
-
-fail:
-    panic("Failed to allocate requested domain memory."
-          /* Don't want format this as PRIpaddr (16 digit hex) */
-          " %ldKB unallocated. Fix the VMs configurations.\n",
-          (unsigned long)kinfo->unassigned_mem >> 10);
-}
-
 #ifdef CONFIG_VGICV2
 static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
 {
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 2c30792de8..a95376dcdc 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -416,7 +416,6 @@ static void __init allocate_memory_11(struct domain *d,
     }
 }
 
-#ifdef CONFIG_DOM0LESS_BOOT
 bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
                                     alloc_domheap_mem_cb cb, void *extra)
 {
@@ -508,7 +507,6 @@ bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
 
     return true;
 }
-#endif
 
 /*
  * When PCI passthrough is available we want to keep the
@@ -1003,6 +1001,93 @@ out:
     return res;
 }
 
+void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
+{
+    struct membanks *mem = kernel_info_get_mem(kinfo);
+    unsigned int i, nr_banks = 2;
+    paddr_t bank_start, bank_size;
+    struct membanks *hwdom_ext_regions = NULL;
+
+    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
+           /* Don't want format this as PRIpaddr (16 digit hex) */
+           (unsigned long)(kinfo->unassigned_mem >> 20), d);
+
+    mem->nr_banks = 0;
+    /*
+     * Use host memory layout for hwdom. Only case for this is when LLC coloring
+     * is enabled.
+     */
+    if ( is_hardware_domain(d) )
+    {
+        ASSERT(llc_coloring_enabled);
+
+        hwdom_ext_regions = xzalloc_flex_struct(struct membanks, bank,
+                                                NR_MEM_BANKS);
+        if ( !hwdom_ext_regions )
+            goto fail;
+        hwdom_ext_regions->max_banks = NR_MEM_BANKS;
+
+        if ( find_unallocated_memory(kinfo, hwdom_ext_regions) )
+            goto fail;
+
+        nr_banks = hwdom_ext_regions->nr_banks;
+    }
+
+    for ( i = 0; kinfo->unassigned_mem > 0 && nr_banks > 0; i++, nr_banks-- )
+    {
+        if ( is_hardware_domain(d) )
+        {
+            bank_start = hwdom_ext_regions->bank[i].start;
+            bank_size = hwdom_ext_regions->bank[i].size;
+
+            if ( bank_size < min_t(paddr_t, kinfo->unassigned_mem, MB(128)) )
+                continue;
+        }
+        else
+        {
+            if ( i == 0 )
+            {
+                bank_start = GUEST_RAM0_BASE;
+                bank_size = GUEST_RAM0_SIZE;
+            }
+            else if ( i == 1 )
+            {
+                bank_start = GUEST_RAM1_BASE;
+                bank_size = GUEST_RAM1_SIZE;
+            }
+            else
+                goto fail;
+        }
+
+        bank_size = MIN(bank_size, kinfo->unassigned_mem);
+        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start), bank_size) )
+            goto fail;
+    }
+
+    if ( kinfo->unassigned_mem )
+        goto fail;
+
+    for( i = 0; i < mem->nr_banks; i++ )
+    {
+        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
+               d,
+               i,
+               mem->bank[i].start,
+               mem->bank[i].start + mem->bank[i].size,
+               /* Don't want format this as PRIpaddr (16 digit hex) */
+               (unsigned long)(mem->bank[i].size >> 20));
+    }
+
+    xfree(hwdom_ext_regions);
+    return;
+
+fail:
+    panic("Failed to allocate requested domain memory."
+          /* Don't want format this as PRIpaddr (16 digit hex) */
+          " %ldKB unallocated. Fix the VMs configurations.\n",
+          (unsigned long)kinfo->unassigned_mem >> 10);
+}
+
 static int __init handle_pci_range(const struct dt_device_node *dev,
                                    uint64_t addr, uint64_t len, void *data)
 {
@@ -1223,7 +1308,7 @@ int __init make_hypervisor_node(struct domain *d,
 
         ext_regions->max_banks = NR_MEM_BANKS;
 
-        if ( is_domain_direct_mapped(d) )
+        if ( domain_use_host_layout(d) )
         {
             if ( !is_iommu_enabled(d) )
                 res = find_unallocated_memory(kinfo, ext_regions);
@@ -2152,7 +2237,10 @@ static int __init construct_dom0(struct domain *d)
     /* type must be set before allocate_memory */
     d->arch.type = kinfo.type;
 #endif
-    allocate_memory_11(d, &kinfo);
+    if ( is_domain_direct_mapped(d) )
+        allocate_memory_11(d, &kinfo);
+    else
+        allocate_memory(d, &kinfo);
     find_gnttab_region(d, &kinfo);
 
     rc = process_shm_chosen(d, &kinfo);
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index e712afbc7f..5d77af2e8b 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -11,6 +11,7 @@ bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
                              alloc_domheap_mem_cb cb, void *extra);
 bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
                           paddr_t tot_size);
+void allocate_memory(struct domain *d, struct kernel_info *kinfo);
 int construct_domain(struct domain *d, struct kernel_info *kinfo);
 int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
 int make_chosen_node(const struct kernel_info *kinfo);
-- 
2.43.0


