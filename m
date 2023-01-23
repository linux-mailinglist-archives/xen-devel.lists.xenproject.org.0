Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CA467806C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 16:49:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483025.748934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3V-0000wF-D8; Mon, 23 Jan 2023 15:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483025.748934; Mon, 23 Jan 2023 15:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3V-0000qx-4v; Mon, 23 Jan 2023 15:48:21 +0000
Received: by outflank-mailman (input) for mailman id 483025;
 Mon, 23 Jan 2023 15:48:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kihy=5U=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pJz3T-0000MU-Ag
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 15:48:19 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55591b41-9b35-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 16:48:08 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id bk15so31563027ejb.9
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 07:48:17 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 r2-20020a17090609c200b007bd28b50305sm22170978eje.200.2023.01.23.07.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:48:16 -0800 (PST)
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
X-Inumbo-ID: 55591b41-9b35-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mg6oHA/uZutZbHyBN28TLCcwMCTT4JS4VhjaLKbCk4w=;
        b=rwaw/EoMIwvKsSF0VdKtWC+duAM2m+fq1KiDi7bOg39f9KkOutt5hyyjrp2UzI1rY6
         f4sdubtROnGpfPDInDIOHuoAnD4PgyzSrGvzvSE9GpGLbyL4tI7nx8ekLEXCPeM/HqOP
         hwRQ7jhqPD76FdnKpXNDwdar3C3cYfJdSKjFhd0NlveSsdfR+gmIBs8rCWawANDfEYKE
         rUZzF3jt2gABHL96ATfqkrw3oqLbjUa/+vMjDklpC30sykImFJZ6wEPzUx+vITc9RBkZ
         4f3dqz2kFKv2x1RQBpe/XRxOh8wdUBc1G83FLoaKrr8fTvN0X8falrCB8C7JkBwWH8jF
         z4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mg6oHA/uZutZbHyBN28TLCcwMCTT4JS4VhjaLKbCk4w=;
        b=futxcvZXrWY+RMbyTZIbIv4SE55Y1KOzCEYjJ78bYcrdiDqwYuroUjj2cdcaYQzgvq
         PF5p9iFNnZguMLkBpJY/Ih7lzxue6kdT2GbteLZtHYT3dqJRU37Zsq7EX9CYUW9mOMB0
         NLa8PFT1j1rRA/HCG3TrtJj1CbJJWZ76IzKGethK5szc/eXmcPY35szi4MUqI81YiAqF
         VptmzHWCHmf0OBAtj0yb3v9024in0lYerOUTcd7EuHWNVo8WtEUC1zOXgv0uGqz+9UFd
         BazCb/gJLKd0LAR3lcnPdo3kLxUoVOlBoxFnfsnRoC3S8ASLWTNcKX6MSiS06K55rQyE
         1BFQ==
X-Gm-Message-State: AFqh2kok6+Rf3FcfToR4FEuXAPOt1hTyKALmYi1fpPZixdo9WMyU2TSq
	sA3XVM1tM6/dn5CkQzUrtm2Jdc+0HoNLHgAf
X-Google-Smtp-Source: AMrXdXuiG1hSBZNw6I84oDkopBiZAdDBhYmFeQRRxj/Pl96Jr5YleKLE44TpRZLUSpCAzQVLzRNVlw==
X-Received: by 2002:a17:906:37c4:b0:871:91ec:edae with SMTP id o4-20020a17090637c400b0087191ecedaemr25653113ejc.75.1674488896790;
        Mon, 23 Jan 2023 07:48:16 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>,
	Carlo Nonato <carlo.nonato@minervasys.tech>
Subject: [PATCH v4 03/11] xen/arm: add Dom0 cache coloring support
Date: Mon, 23 Jan 2023 16:47:27 +0100
Message-Id: <20230123154735.74832-4-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

This commit allows the user to set the cache coloring configuration for
Dom0 via a command line parameter.
Since cache coloring and static memory are incompatible, direct mapping
Dom0 isn't possible when coloring is enabled.

Here is also introduced a common configuration syntax for cache colors.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
v4:
- dom0 colors are dynamically allocated as for any other domain
  (colors are duplicated in dom0_colors and in the new array, but logic
  is simpler)
---
 docs/misc/arm/cache-coloring.rst        | 32 ++++++++++++++++++++++---
 xen/arch/arm/domain_build.c             | 17 +++++++++++--
 xen/arch/arm/include/asm/llc_coloring.h |  4 ++++
 xen/arch/arm/llc_coloring.c             | 14 +++++++++++
 4 files changed, 62 insertions(+), 5 deletions(-)

diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
index 0244d2f606..c2e0e87426 100644
--- a/docs/misc/arm/cache-coloring.rst
+++ b/docs/misc/arm/cache-coloring.rst
@@ -83,12 +83,38 @@ manually set the way size it's left for the user to overcome failing situations
 or for debugging/testing purposes. See `Coloring parameters and domain
 configurations`_ section for more information on that.
 
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
+ - no spaces are allowed between values.
+ - no overlapping ranges or duplicated colors are allowed.
+ - values must be written in ascending order.
+
+Examples:
+
++---------------------+-----------------------------------+
+|**Configuration**    |**Actual selection**               |
++---------------------+-----------------------------------+
+|  1-2,5-8            | [1, 2, 5, 6, 7, 8]                |
++---------------------+-----------------------------------+
+|  4-8,10,11,12       | [4, 5, 6, 7, 8, 10, 11, 12]       |
++---------------------+-----------------------------------+
+|  0                  | [0]                               |
++---------------------+-----------------------------------+
+
 Coloring parameters and domain configurations
 *********************************************
 
-LLC way size (as previously discussed) can be set using the appropriate command
-line parameter. See the relevant documentation in
-"docs/misc/xen-command-line.pandoc".
+LLC way size (as previously discussed) and Dom0 colors can be set using the
+appropriate command line parameters. See the relevant documentation
+in "docs/misc/xen-command-line.pandoc".
 
 **Note:** If no color configuration is provided for a domain, the default one,
 which corresponds to all available colors, is used instead.
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f35f4d2456..093d4ad6f6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2,6 +2,7 @@
 #include <xen/init.h>
 #include <xen/compile.h>
 #include <xen/lib.h>
+#include <xen/llc_coloring.h>
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/domain_page.h>
@@ -4014,7 +4015,10 @@ static int __init construct_dom0(struct domain *d)
     /* type must be set before allocate_memory */
     d->arch.type = kinfo.type;
 #endif
-    allocate_memory_11(d, &kinfo);
+    if ( is_domain_llc_colored(d) )
+        allocate_memory(d, &kinfo);
+    else
+        allocate_memory_11(d, &kinfo);
     find_gnttab_region(d, &kinfo);
 
 #ifdef CONFIG_STATIC_SHM
@@ -4060,6 +4064,8 @@ void __init create_dom0(void)
         .max_maptrack_frames = -1,
         .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
+    unsigned int *llc_colors = NULL;
+    unsigned int num_llc_colors = 0, flags = CDF_privileged;
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
     dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
@@ -4076,7 +4082,14 @@ void __init create_dom0(void)
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
-    dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
+    if ( llc_coloring_enabled )
+        llc_colors = dom0_llc_colors(&num_llc_colors);
+    else
+        flags |= CDF_directmap;
+
+    dom0 = domain_create_llc_colored(0, &dom0_cfg, flags, llc_colors,
+                                     num_llc_colors);
+
     if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
         panic("Error creating domain 0\n");
 
diff --git a/xen/arch/arm/include/asm/llc_coloring.h b/xen/arch/arm/include/asm/llc_coloring.h
index c7985c8fd0..382ff7de47 100644
--- a/xen/arch/arm/include/asm/llc_coloring.h
+++ b/xen/arch/arm/include/asm/llc_coloring.h
@@ -17,9 +17,13 @@
 
 bool __init llc_coloring_init(void);
 
+unsigned int *dom0_llc_colors(unsigned int *num_colors);
+
 #else /* !CONFIG_LLC_COLORING */
 
 static inline bool __init llc_coloring_init(void) { return true; }
+static inline unsigned int *dom0_llc_colors(
+    unsigned int *num_colors) { return NULL; }
 
 #endif /* CONFIG_LLC_COLORING */
 
diff --git a/xen/arch/arm/llc_coloring.c b/xen/arch/arm/llc_coloring.c
index 44b601915e..51f057d7c9 100644
--- a/xen/arch/arm/llc_coloring.c
+++ b/xen/arch/arm/llc_coloring.c
@@ -261,6 +261,20 @@ void domain_dump_llc_colors(struct domain *d)
     print_colors(d->llc_colors, d->num_llc_colors);
 }
 
+unsigned int *dom0_llc_colors(unsigned int *num_colors)
+{
+    unsigned int *colors;
+
+    if ( !dom0_num_colors )
+        return NULL;
+
+    colors = alloc_colors(dom0_num_colors);
+    memcpy(colors, dom0_colors, sizeof(unsigned int) * dom0_num_colors);
+    *num_colors = dom0_num_colors;
+
+    return colors;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


