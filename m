Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 306399A0531
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 11:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819724.1233169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t108W-0005eT-OX; Wed, 16 Oct 2024 09:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819724.1233169; Wed, 16 Oct 2024 09:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t108W-0005bD-IK; Wed, 16 Oct 2024 09:16:08 +0000
Received: by outflank-mailman (input) for mailman id 819724;
 Wed, 16 Oct 2024 09:16:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8GJ6=RM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t108U-0005Dr-K1
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 09:16:06 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 458c7379-8b9f-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 11:16:05 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-539f76a6f0dso2882761e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 02:16:05 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a000129eesm391451e87.259.2024.10.16.02.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 02:16:03 -0700 (PDT)
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
X-Inumbo-ID: 458c7379-8b9f-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729070165; x=1729674965; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGuFYCXwauYG/Y17jk3tmaCDchtBJlytkAwIlTZfzko=;
        b=Wbrq0EcMkiODkwUFRkqGJwOY180q+enFGkXV7OzyML3HclgAY5NGw1kCm74rZIqTau
         3Grqu61S0+I3JJD9JiW0LWQroJ7hYJOQDVWA1QiTEQ/sZ0ZccPnpy+Um6+jckrQHyM2n
         oep4MykeDfgaioDDDb66TvYr4TbbI2mwXHfQEqIQgZek47Q7pV2eXvtq0PnU9SgyPqsE
         FsigDQ8CoUdMExA1GhoBnmXQONOTxhCgx0Ub/kTsUircqdz6F0NRcbyxxI++lx3TAumr
         7nsKNCurpCYdZgKVPedhkG259QpUqV0J4mlb2Msth9I4o4YRYl1XyyhZptmIe6gNtDM3
         yKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070165; x=1729674965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGuFYCXwauYG/Y17jk3tmaCDchtBJlytkAwIlTZfzko=;
        b=isMRpWokANn5nQRtSPzry1+/x94aBQhT5C0FsGmBjdp6upqIdEdLETvU0tCOz8RAyQ
         coTfqDJ+/Jpx5dfYrFeMzgqgoyvU1l1/MnM406uRt+Gkxs7DK4OEwq3X1cDSwL0+JZhl
         5uSqjEXZTMngtKNfWh+m2eGZB5sLAFkCcuBGCH1rURnGdz9KO1xPLshLnYmsuu383h2U
         j54Sd9g9/RPJuAfNPFWjKYOm2GpoYHEbBZPquaNBdm6likpnORUanftWFknDXbm2JwAZ
         zr1WN25IQ8IYogV5daXCiC3HmLmrarLonOv6TllWcpiTU2dxkJVoo5F1N4EcAzz8JRX9
         6iWg==
X-Gm-Message-State: AOJu0YxvRilVtNzj0q5QEKGQWbhTVj3L0evMxo4MfEFr1vP0IDUURAs/
	9gcxUiHI4QKuO0kJxh+fUcsyoRVkmRCWGkK/RS1BpLiy4qdNONIE4WIAOQ==
X-Google-Smtp-Source: AGHT+IHZkUCj21Y7l52VIWLe416ZSMs2Ro+dERhPbC13frSrZPSSU46sMhzh1iRQsImnvC/Xb+KtPg==
X-Received: by 2002:a05:6512:e9c:b0:539:f807:ad93 with SMTP id 2adb3069b0e04-539f807caf1mr5086745e87.38.1729070164430;
        Wed, 16 Oct 2024 02:16:04 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 3/5] xen/riscv: introduce setup_mm()
Date: Wed, 16 Oct 2024 11:15:55 +0200
Message-ID: <300a4a5911766d42ec01c3fcaee664d72b484296.1729068334.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729068334.git.oleksii.kurochko@gmail.com>
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the implementation of setup_mm(), which includes:
1. Adding all free regions to the boot allocator, as memory is needed
   to allocate page tables used for frame table mapping.
2. Calculating RAM size and the RAM end address.
3. Setting up direct map mappings from the PFN of physical address 0
   to the PFN of RAM end.
4. Setting up frame table mappings from physical address 0 to ram_end.
5. Setting up total_pages and max_page.
6. Establishing `directmap_virt_end`, which is not currently used but is
   intended for future use in virt_to_page() to ensure that virtual
   addresses do not exceed directmap_virt_end.

In the case of RISC-V 64, which has a large virtual address space
(the minimum supported MMU mode is Sv39, providing TB of VA space),
the direct map and frame table are mapped starting from physical address
0. This simplifies the calculations and thereby improves performance for
page_to_mfn(), mfn_to_page(), and maddr_to_virt(), as there is no
need to account for {directmap, frametable}_base_pdx.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/mm.h    |  2 +
 xen/arch/riscv/include/asm/setup.h |  2 +
 xen/arch/riscv/mm.c                | 93 ++++++++++++++++++++++++++++++
 xen/arch/riscv/setup.c             |  3 +
 4 files changed, 100 insertions(+)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 0396e66f47..7b472220e5 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -12,6 +12,8 @@
 
 #include <asm/page-bits.h>
 
+extern vaddr_t directmap_virt_end;
+
 #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
 #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
 
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index c0214a9bf2..844a2f0ef1 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -5,6 +5,8 @@
 
 #define max_init_domid (0)
 
+void setup_mm(void);
+
 #endif /* ASM__RISCV__SETUP_H */
 
 /*
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 27026d803b..53b7483f75 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -8,6 +8,7 @@
 #include <xen/libfdt/libfdt.h>
 #include <xen/macros.h>
 #include <xen/mm.h>
+#include <xen/pdx.h>
 #include <xen/pfn.h>
 #include <xen/sections.h>
 #include <xen/sizes.h>
@@ -423,3 +424,95 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
 
     return fdt_virt;
 }
+
+#ifndef CONFIG_RISCV_32
+/* Map the region in the directmap area. */
+static void __init setup_directmap_mappings(unsigned long nr_mfns)
+{
+    if ( nr_mfns > PFN_DOWN(DIRECTMAP_SIZE) )
+        panic("The directmap cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
+              0UL, nr_mfns << PAGE_SHIFT);
+
+    if ( map_pages_to_xen((vaddr_t)mfn_to_virt(0),
+                          _mfn(0), nr_mfns,
+                          PAGE_HYPERVISOR_RW) )
+        panic("Unable to setup the directmap mappings.\n");
+}
+
+/* Map a frame table to cover physical addresses ps through pe */
+static void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
+{
+    unsigned long nr_mfns = mfn_x(mfn_add(maddr_to_mfn(pe), -1)) -
+                            mfn_x(maddr_to_mfn(ps)) + 1;
+    unsigned long frametable_size = nr_mfns * sizeof(struct page_info);
+    mfn_t base_mfn;
+
+    if ( frametable_size > FRAMETABLE_SIZE )
+        panic("The frametable cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
+              ps, pe);
+
+    frametable_size = ROUNDUP(frametable_size, MB(2));
+    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 2<<(20-12));
+
+    if ( map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
+                          frametable_size >> PAGE_SHIFT,
+                          PAGE_HYPERVISOR_RW) )
+        panic("Unable to setup the frametable mappings.\n");
+
+    memset(&frame_table[0], 0, nr_mfns * sizeof(struct page_info));
+    memset(&frame_table[nr_mfns], -1,
+           frametable_size - (nr_mfns * sizeof(struct page_info)));
+}
+
+vaddr_t directmap_virt_end __read_mostly;
+
+/*
+ * Setup memory management
+ *
+ * RISC-V 64 has a large virtual address space (the minimum supported
+ * MMU mode is Sv39, which provides TBs of VA space).
+ * In the case of RISC-V 64, the directmap and frametable are mapped
+ * starting from physical address 0 to simplify the page_to_mfn(),
+ * mfn_to_page(), and maddr_to_virt() calculations, as there is no need
+ * to account for {directmap, frametable}_base_pdx in this setup.
+ */
+void __init setup_mm(void)
+{
+    const struct membanks *banks = bootinfo_get_mem();
+    paddr_t ram_end = 0;
+    paddr_t ram_size = 0;
+    unsigned int i;
+
+    /*
+     * We need some memory to allocate the page-tables used for the directmap
+     * mappings. But some regions may contain memory already allocated
+     * for other uses (e.g. modules, reserved-memory...).
+     *
+     * For simplicity, add all the free regions in the boot allocator.
+     */
+    populate_boot_allocator();
+
+    total_pages = 0;
+
+    for ( i = 0; i < banks->nr_banks; i++ )
+    {
+        const struct membank *bank = &banks->bank[i];
+        paddr_t bank_end = bank->start + bank->size;
+
+        ram_size = ram_size + bank->size;
+        ram_end = max(ram_end, bank_end);
+    }
+
+    setup_directmap_mappings(PFN_DOWN(ram_end));
+
+    total_pages = PFN_DOWN(ram_size);
+
+    directmap_virt_end = DIRECTMAP_VIRT_START + ram_end;
+
+    setup_frametable_mappings(0, ram_end);
+    max_page = PFN_DOWN(ram_end);
+}
+
+#else /* CONFIG_RISCV_32 */
+#error setup_mm(), setup_{directmap,frametable}_mapping() should be implemented for RV_32
+#endif
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index e29bd75d7c..2887a18c0c 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -12,6 +12,7 @@
 
 #include <asm/early_printk.h>
 #include <asm/sbi.h>
+#include <asm/setup.h>
 #include <asm/smp.h>
 #include <asm/traps.h>
 
@@ -59,6 +60,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
     printk("Command line: %s\n", cmdline);
     cmdline_parse(cmdline);
 
+    setup_mm();
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.47.0


