Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFBE82191F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 10:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660564.1030088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbRC-0007Hr-Ff; Tue, 02 Jan 2024 09:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660564.1030088; Tue, 02 Jan 2024 09:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbRC-0007EK-8V; Tue, 02 Jan 2024 09:51:54 +0000
Received: by outflank-mailman (input) for mailman id 660564;
 Tue, 02 Jan 2024 09:51:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mpFB=IM=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rKbRA-0006VR-CN
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 09:51:52 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bb78e21-a954-11ee-98ef-6d05b1d4d9a1;
 Tue, 02 Jan 2024 10:51:50 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a279ce3aab9so292230966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 01:51:48 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 s4-20020a1709066c8400b00a1f7ab65d3fsm11541845ejr.131.2024.01.02.01.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 01:51:46 -0800 (PST)
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
X-Inumbo-ID: 8bb78e21-a954-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704189107; x=1704793907; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cdVnvQoUyPRwYMQxfZ9u1dR3w5GTzbkoxvk1ADPypg=;
        b=b6mljZsd/lUWLDdVY9R6HALCm+npOIbXFwIGPXCQ65QGr+HyTEt9Wy6WgClz2NeyIl
         dNOF+qWEKou6Dd5NjraGVo49rLFizwENmO/wWILXqBMPcvpYTC598+8zmsZFKELloZzn
         yZgij2bCxsT3unYfVConMGS7WonKPkh1Q94r2Q8Wd9vQa+r8F9h36BkApEttaQsk3RKm
         EHFvPmrWhkjSxxpn6Vv5BRyk7qfkqqeWSNp8KwJWb4hfafkfZPEbCWR+aVIvf5v/+aym
         FaMJ7Ht4PIopm8CPLNCxuvRsZFBFHJcIIJ6DLVDgDYgZaVVjleGlhnAFbKuItJQhHJeZ
         CFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704189107; x=1704793907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cdVnvQoUyPRwYMQxfZ9u1dR3w5GTzbkoxvk1ADPypg=;
        b=lr4Hf0geRxOG724eiKGFAYzaFdb7Efibz0M8YCz15P4/Bo1qzIPeJy/JOuoW+xgBAU
         YJ3DxrjVvd95DIycJWkD35+cnwsPOV0P31VYqsHL8jeLmD//Dl96ji1FaXvvNzwl92uD
         SezlExDHYGgCSV5veG9fMuyqz5nzYLP8gK8sBE5YuDfCe4q1eykXLiET9I9u0u+fxYft
         +nNPRKsie1GkijWWMqH2NZIy0ZzkZdgIEDhaY04yRKW8lOAoCR4P6WL4DkeJweVoltC0
         BXMJvzPRg4FnC40zMZ/IYh/G0ENCXJ080SWL3aXdcjLrkAY/D0IXIN8q46PpUgUxzBH8
         eD6g==
X-Gm-Message-State: AOJu0Yxcw5+0mQpB1/FvfGEwqN/y3Boo4lz8PhDOpyagSKweUyzTm26M
	R9lTcCGPvAilPwd9TO7g078dgtx/T587Kow3nJDbQxIj5Ys=
X-Google-Smtp-Source: AGHT+IHbUsHvCnMCDXcDi1ikGMVPplEsFaGr+NqMxS47lMqoodPrke//UqsHnlyBsUxdi/oWUpVCqw==
X-Received: by 2002:a17:906:f109:b0:a1d:8351:a00e with SMTP id gv9-20020a170906f10900b00a1d8351a00emr3902124ejb.121.1704189107184;
        Tue, 02 Jan 2024 01:51:47 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v5 03/13] xen/arm: add Dom0 cache coloring support
Date: Tue,  2 Jan 2024 10:51:28 +0100
Message-Id: <20240102095138.17933-4-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit allows the user to set the cache coloring configuration for
Dom0 via a command line parameter.
Since cache coloring and static memory are incompatible, direct mapping
Dom0 isn't possible when coloring is enabled.

A common configuration syntax for cache colors is also introduced.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v5:
- Carlo Nonato as the new author
- moved dom0 colors parsing (parse_colors()) in this patch
- added dom0_set_llc_colors() to set dom0 colors after creation
- moved color allocation and checking in this patch
- error handling when allocating color arrays
- FIXME: copy pasted allocate_memory() cause it got moved
v4:
- dom0 colors are dynamically allocated as for any other domain
  (colors are duplicated in dom0_colors and in the new array, but logic
  is simpler)
---
 docs/misc/arm/cache-coloring.rst        |  29 ++++++
 docs/misc/xen-command-line.pandoc       |   9 ++
 xen/arch/arm/domain_build.c             |  60 ++++++++++-
 xen/arch/arm/include/asm/llc-coloring.h |   1 +
 xen/arch/arm/llc-coloring.c             | 128 ++++++++++++++++++++++++
 5 files changed, 224 insertions(+), 3 deletions(-)

diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
index eabf8f5d1b..acf82c3df8 100644
--- a/docs/misc/arm/cache-coloring.rst
+++ b/docs/misc/arm/cache-coloring.rst
@@ -84,6 +84,35 @@ More specific documentation is available at `docs/misc/xen-command-line.pandoc`.
 +----------------------+-------------------------------+
 | ``llc-way-size``     | set the LLC way size          |
 +----------------------+-------------------------------+
+| ``dom0-llc-colors``  | Dom0 color configuration      |
++----------------------+-------------------------------+
+
+Colors selection format
+***********************
+
+Regardless of the memory pool that has to be colored (Xen, Dom0/DomUs),
+the color selection can be expressed using the same syntax. In particular a
+comma-separated list of colors or ranges of colors is used.
+Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive on both
+sides.
+
+Note that:
+
+- no spaces are allowed between values.
+- no overlapping ranges or duplicated colors are allowed.
+- values must be written in ascending order.
+
+Examples:
+
++-------------------+-----------------------------+
+| **Configuration** | **Actual selection**        |
++-------------------+-----------------------------+
+| 1-2,5-8           | [1, 2, 5, 6, 7, 8]          |
++-------------------+-----------------------------+
+| 4-8,10,11,12      | [4, 5, 6, 7, 8, 10, 11, 12] |
++-------------------+-----------------------------+
+| 0                 | [0]                         |
++-------------------+-----------------------------+
 
 Known issues and limitations
 ****************************
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 22d2d5b6cf..51f6adf035 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
 
 Specify a list of IO ports to be excluded from dom0 access.
 
+### dom0-llc-colors (arm64)
+> `= List of [ <integer> | <integer>-<integer> ]`
+
+> Default: `All available LLC colors`
+
+Specify dom0 LLC color configuration. This options is available only when
+`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all available
+colors are chosen and the user is warned on Xen serial console.
+
 ### dom0_max_vcpus
 
 Either:
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6945b9755d..482c059bfa 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2,6 +2,7 @@
 #include <xen/init.h>
 #include <xen/compile.h>
 #include <xen/lib.h>
+#include <xen/llc-coloring.h>
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/domain_page.h>
@@ -414,7 +415,7 @@ static void __init allocate_memory_11(struct domain *d,
     }
 }
 
-#ifdef CONFIG_DOM0LESS_BOOT
+#if defined(CONFIG_DOM0LESS_BOOT) || defined(CONFIG_LLC_COLORING)
 bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
                                  gfn_t sgfn, paddr_t tot_size)
 {
@@ -478,6 +479,49 @@ bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
 }
 #endif
 
+static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
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
+
 /*
  * When PCI passthrough is available we want to keep the
  * "linux,pci-domain" in sync for every host bridge.
@@ -2072,7 +2116,10 @@ static int __init construct_dom0(struct domain *d)
     /* type must be set before allocate_memory */
     d->arch.type = kinfo.type;
 #endif
-    allocate_memory_11(d, &kinfo);
+    if ( is_domain_llc_colored(d) )
+        allocate_memory(d, &kinfo);
+    else
+        allocate_memory_11(d, &kinfo);
     find_gnttab_region(d, &kinfo);
 
     rc = process_shm_chosen(d, &kinfo);
@@ -2116,6 +2163,7 @@ void __init create_dom0(void)
         .max_maptrack_frames = -1,
         .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
+    unsigned int flags = CDF_privileged;
     int rc;
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
@@ -2143,10 +2191,16 @@ void __init create_dom0(void)
             panic("SVE vector length error\n");
     }
 
-    dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
+    if ( !llc_coloring_enabled )
+        flags |= CDF_directmap;
+
+    dom0 = domain_create(0, &dom0_cfg, flags);
     if ( IS_ERR(dom0) )
         panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
 
+    if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
+        panic("Error initializing LLC coloring for domain 0 (rc = %d)", rc);
+
     if ( alloc_dom0_vcpu0(dom0) == NULL )
         panic("Error creating domain 0 vcpu0\n");
 
diff --git a/xen/arch/arm/include/asm/llc-coloring.h b/xen/arch/arm/include/asm/llc-coloring.h
index 7885e9e3f5..ee5551e3cc 100644
--- a/xen/arch/arm/include/asm/llc-coloring.h
+++ b/xen/arch/arm/include/asm/llc-coloring.h
@@ -14,6 +14,7 @@
 #include <xen/init.h>
 
 bool __init llc_coloring_init(void);
+int dom0_set_llc_colors(struct domain *d);
 
 #endif /* __ASM_ARM_COLORING_H__ */
 
diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
index 37d647f038..5ce58aba70 100644
--- a/xen/arch/arm/llc-coloring.c
+++ b/xen/arch/arm/llc-coloring.c
@@ -26,6 +26,63 @@ size_param("llc-way-size", llc_way_size);
 /* Number of colors available in the LLC */
 static unsigned int __ro_after_init nr_colors = CONFIG_NR_LLC_COLORS;
 
+static unsigned int __ro_after_init dom0_colors[CONFIG_NR_LLC_COLORS];
+static unsigned int __ro_after_init dom0_num_colors;
+
+/*
+ * Parse the coloring configuration given in the buf string, following the
+ * syntax below.
+ *
+ * COLOR_CONFIGURATION ::= COLOR | RANGE,...,COLOR | RANGE
+ * RANGE               ::= COLOR-COLOR
+ *
+ * Example: "0,2-6,15-16" represents the set of colors: 0,2,3,4,5,6,15,16.
+ */
+static int parse_color_config(const char *buf, unsigned int *colors,
+                              unsigned int *num_colors)
+{
+    const char *s = buf;
+
+    if ( !colors || !num_colors )
+        return -EINVAL;
+
+    *num_colors = 0;
+
+    while ( *s != '\0' )
+    {
+        if ( *s != ',' )
+        {
+            unsigned int color, start, end;
+
+            start = simple_strtoul(s, &s, 0);
+
+            if ( *s == '-' )    /* Range */
+            {
+                s++;
+                end = simple_strtoul(s, &s, 0);
+            }
+            else                /* Single value */
+                end = start;
+
+            if ( start > end || (end - start) > UINT_MAX - *num_colors ||
+                 *num_colors + (end - start) >= nr_colors )
+                return -EINVAL;
+            for ( color = start; color <= end; color++ )
+                colors[(*num_colors)++] = color;
+        }
+        else
+            s++;
+    }
+
+    return *s ? -EINVAL : 0;
+}
+
+static int __init parse_dom0_colors(const char *s)
+{
+    return parse_color_config(s, dom0_colors, &dom0_num_colors);
+}
+custom_param("dom0-llc-colors", parse_dom0_colors);
+
 /* Return the LLC way size by probing the hardware */
 static unsigned int __init get_llc_way_size(void)
 {
@@ -102,6 +159,28 @@ static void dump_coloring_info(unsigned char key)
     printk("Number of LLC colors supported: %u\n", nr_colors);
 }
 
+static bool check_colors(unsigned int *colors, unsigned int num_colors)
+{
+    unsigned int i;
+
+    if ( num_colors > nr_colors )
+    {
+        printk(XENLOG_ERR "Number of LLC colors requested > %u\n", nr_colors);
+        return false;
+    }
+
+    for ( i = 0; i < num_colors; i++ )
+    {
+        if ( colors[i] >= nr_colors )
+        {
+            printk(XENLOG_ERR "LLC color %u >= %u\n", colors[i], nr_colors);
+            return false;
+        }
+    }
+
+    return true;
+}
+
 bool __init llc_coloring_init(void)
 {
     if ( !llc_way_size && !(llc_way_size = get_llc_way_size()) )
@@ -150,6 +229,55 @@ void domain_dump_llc_colors(struct domain *d)
     print_colors(d->llc_colors, d->num_llc_colors);
 }
 
+static int domain_alloc_colors(struct domain *d, unsigned int num_colors)
+{
+    d->num_llc_colors = num_colors;
+
+    if ( !num_colors )
+        return 0;
+
+    d->llc_colors = xmalloc_array(unsigned int, num_colors);
+    if ( !d->llc_colors )
+    {
+        printk("Can't allocate LLC colors for domain %pd\n", d);
+        return -1;
+    }
+
+    return 0;
+}
+
+static int domain_check_colors(struct domain *d)
+{
+    unsigned int i;
+
+    if ( !d->num_llc_colors )
+    {
+        printk(XENLOG_WARNING
+               "LLC color config not found for %pd. Using default\n", d);
+        if ( domain_alloc_colors(d, nr_colors) )
+            return -ENOMEM;
+        for ( i = 0; i < nr_colors; i++ )
+            d->llc_colors[i] = i;
+    }
+    else if ( !check_colors(d->llc_colors, d->num_llc_colors) )
+    {
+        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+int dom0_set_llc_colors(struct domain *d)
+{
+    if ( domain_alloc_colors(d, dom0_num_colors) )
+        return -ENOMEM;
+
+    memcpy(d->llc_colors, dom0_colors, sizeof(unsigned int) * dom0_num_colors);
+
+    return domain_check_colors(d);
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


