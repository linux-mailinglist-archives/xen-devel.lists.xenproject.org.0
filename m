Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B873F840EE4
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 18:20:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673064.1047249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI3-0006ex-R0; Mon, 29 Jan 2024 17:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673064.1047249; Mon, 29 Jan 2024 17:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI3-0006cl-NB; Mon, 29 Jan 2024 17:19:23 +0000
Received: by outflank-mailman (input) for mailman id 673064;
 Mon, 29 Jan 2024 17:19:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vh+I=JH=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rUVI2-0005vY-2o
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 17:19:22 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89dc4d19-beca-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 18:19:20 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-558f523c072so3313737a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 09:19:20 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 eo15-20020a056402530f00b005598ec568dbsm3970494edb.59.2024.01.29.09.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 09:19:19 -0800 (PST)
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
X-Inumbo-ID: 89dc4d19-beca-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706548759; x=1707153559; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7L8IWQ2YLMp5Yv8zv1GVRcHauldwszXKWY+GEdg7KM=;
        b=PCxKwyjTV68nj3qghZOdmF5l/6qONRcfNgGWOD8Kmpcpc7RsVMmAk9+CuIUYOjkWId
         ybaxL3MEP+Ku+BT2exaPAfIH3Me2TGvLT9ErmCbn2OUx2YprEjOFLEdp2yGb4W91AdoU
         QiOlPJ1X8dS3BppuTexoOlhLsySw5FZcjYs1R6Z/KqMy1PKl3K3S8KT2fDrF9VE/twll
         mqzCIQPlq76upMAfc+gsCYQWCRAqssMjff8sxOKAN6YPqrYc7Lxc9reNOAtDCWty0eTf
         HjQsp7+BnoN5HxBzkseih4Iidqdf/MiApKzRz9XhXylt4cKwGJx03BIZpQUNHO+EJON4
         SVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548759; x=1707153559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7L8IWQ2YLMp5Yv8zv1GVRcHauldwszXKWY+GEdg7KM=;
        b=IloEje06Pqv1PdLd4NPGmdI1HmToePoX6j3uha6APLJ1fw/lL1TOjc4/dBG483F0cu
         QsSM3YVd8OFDSVP0qwQyazWNGCGRnKRuw8TWGbDDhvn3tBB9ckH2/3PLhafnZa9jHws0
         0++53Ppa1u6+yqXs/pNjuP9V2aOKW0Pdm+F9x7i86Kz80AlP6kPidyopQ77+dQDVGEuN
         hpPOxQ/F7rRgwNtLzEjrFwxbhEwE0vyCsIC504AiQgrgGHL22UkPglAtGOD3jqWzkvHT
         Oz2Zp9l5Nx87iwX6STPy4mQfVp7yIlwzyXqn/ZzEZ0IK2BI78NERglabYy7dkxACyHiO
         hf8A==
X-Gm-Message-State: AOJu0YwkSWQMrQ+mIkll16pUQTAVEMCpczBgZpZFjluiZLaJJY4Mm6j0
	Y3RjkTok9fUNQC6nb8wQF61Bg4CNfzh/JYEDuTpirFayZ4CX9ZAP7GrZYskY5pmdi23U8oNUp0n
	jGVQ=
X-Google-Smtp-Source: AGHT+IHc6SGBI13PCY9sFTXFAMu8+NtauaSDaSehtuJBHrYcFAt8bSCual35VaQSkMR/T1CIofLTcw==
X-Received: by 2002:a05:6402:40d4:b0:55d:3b94:a1c6 with SMTP id z20-20020a05640240d400b0055d3b94a1c6mr4683564edb.0.1706548759204;
        Mon, 29 Jan 2024 09:19:19 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 03/15] xen/arm: permit non direct-mapped Dom0 construction
Date: Mon, 29 Jan 2024 18:17:59 +0100
Message-Id: <20240129171811.21382-4-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cache coloring requires Dom0 not to be direct-mapped because of its non
contiguous mapping nature, so allocate_memory() is needed in this case.
8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a separate module")
moved allocate_memory() in dom0less_build.c. In order to use it
in Dom0 construction bring it back to domain_build.c and declare it in
domain_build.h.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
v6:
- new patch
---
 xen/arch/arm/dom0less-build.c           | 43 ---------------------
 xen/arch/arm/domain_build.c             | 50 +++++++++++++++++++++++--
 xen/arch/arm/include/asm/domain_build.h |  1 +
 3 files changed, 48 insertions(+), 46 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 1142f7f74a..992080e61a 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -49,49 +49,6 @@ bool __init is_dom0less_mode(void)
     return ( !dom0found && domUfound );
 }
 
-static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
-{
-    unsigned int i;
-    paddr_t bank_size;
-
-    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
-           /* Don't want format this as PRIpaddr (16 digit hex) */
-           (unsigned long)(kinfo->unassigned_mem >> 20), d);
-
-    kinfo->mem.nr_banks = 0;
-    bank_size = MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
-    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
-                               bank_size) )
-        goto fail;
-
-    bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
-    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
-                               bank_size) )
-        goto fail;
-
-    if ( kinfo->unassigned_mem )
-        goto fail;
-
-    for( i = 0; i < kinfo->mem.nr_banks; i++ )
-    {
-        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
-               d,
-               i,
-               kinfo->mem.bank[i].start,
-               kinfo->mem.bank[i].start + kinfo->mem.bank[i].size,
-               /* Don't want format this as PRIpaddr (16 digit hex) */
-               (unsigned long)(kinfo->mem.bank[i].size >> 20));
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
index 46161848dc..a9e5310aff 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -415,7 +415,6 @@ static void __init allocate_memory_11(struct domain *d,
     }
 }
 
-#ifdef CONFIG_DOM0LESS_BOOT
 bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
                                  gfn_t sgfn, paddr_t tot_size)
 {
@@ -477,7 +476,49 @@ bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
 
     return true;
 }
-#endif
+
+void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
+{
+    unsigned int i;
+    paddr_t bank_size;
+
+    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
+           /* Don't want format this as PRIpaddr (16 digit hex) */
+           (unsigned long)(kinfo->unassigned_mem >> 20), d);
+
+    kinfo->mem.nr_banks = 0;
+    bank_size = MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
+    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
+                               bank_size) )
+        goto fail;
+
+    bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
+    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
+                               bank_size) )
+        goto fail;
+
+    if ( kinfo->unassigned_mem )
+        goto fail;
+
+    for( i = 0; i < kinfo->mem.nr_banks; i++ )
+    {
+        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
+               d,
+               i,
+               kinfo->mem.bank[i].start,
+               kinfo->mem.bank[i].start + kinfo->mem.bank[i].size,
+               /* Don't want format this as PRIpaddr (16 digit hex) */
+               (unsigned long)(kinfo->mem.bank[i].size >> 20));
+    }
+
+    return;
+
+fail:
+    panic("Failed to allocate requested domain memory."
+          /* Don't want format this as PRIpaddr (16 digit hex) */
+          " %ldKB unallocated. Fix the VMs configurations.\n",
+          (unsigned long)kinfo->unassigned_mem >> 10);
+}
 
 /*
  * When PCI passthrough is available we want to keep the
@@ -2073,7 +2114,10 @@ static int __init construct_dom0(struct domain *d)
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
index da9e6025f3..b8e171e5cc 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -8,6 +8,7 @@ typedef __be32 gic_interrupt_t[3];
 
 bool allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
                           gfn_t sgfn, paddr_t tot_size);
+void allocate_memory(struct domain *d, struct kernel_info *kinfo);
 int construct_domain(struct domain *d, struct kernel_info *kinfo);
 int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
 int make_chosen_node(const struct kernel_info *kinfo);
-- 
2.34.1


