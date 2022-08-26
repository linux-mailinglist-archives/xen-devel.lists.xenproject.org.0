Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A10025A2802
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 14:52:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393754.632896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYo9-0001gH-SO; Fri, 26 Aug 2022 12:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393754.632896; Fri, 26 Aug 2022 12:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYo9-0001dm-Pg; Fri, 26 Aug 2022 12:51:33 +0000
Received: by outflank-mailman (input) for mailman id 393754;
 Fri, 26 Aug 2022 12:51:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z28m=Y6=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oRYo8-00013M-1N
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 12:51:32 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cecce6e8-253d-11ed-9250-1f966e50362f;
 Fri, 26 Aug 2022 14:51:31 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id y3so3005428ejc.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Aug 2022 05:51:31 -0700 (PDT)
Received: from carlo-ubuntu.. (hipert-gw1.mat.unimo.it. [155.185.5.1])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b006ff0b457cdasm888812ejh.53.2022.08.26.05.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:51:30 -0700 (PDT)
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
X-Inumbo-ID: cecce6e8-253d-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=9CmOaXef3+3nQfZH6p8WWc7HRYLw9F9JZ6/dhzECsOk=;
        b=KFuWujFYJ5dgTKPPCnzmD+VtTxeGNekYvjc0hraXCXgwwHPGOR0lPxIZ/bKLjBSqnz
         YlY6tluzv9kLzG+R5MO1ztwcPjiRsQ0oXTKPAv9TBIrRLOBSExgS8Ne8oBoSWRHuRuuR
         tZCrdZQpmd/U8mgZsUCI/9OgbLVDHJPxDu/YKyf12YKy3hgkqAw/7WNXcVaAYuMMDde1
         qBflC8Tk4J1+nRVd6kiWTVH3BRP2kFdYKJLOZXr+HrwSLdKhhw0BhFE4t4zhxlY4GUVi
         snpo5KGQOu3m3Qa6U+e2sXcc5f6IeHifAKlZLQbaxtM2/qOSGOOHEbYsY+F61O7CnvTv
         7Hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=9CmOaXef3+3nQfZH6p8WWc7HRYLw9F9JZ6/dhzECsOk=;
        b=wJEJbAtCS4r5Oj07y/0xsLpWX2Hwz2PB5fRWpDYW2qYs+fcLtv0jaW65jYwk6U4ZS5
         xptiCDYMBe7+2MXUuO48DE3jn0NOF3Mfu85tZLcX+lMYZWiRFbx1DSzu8LJTe/i0hA8I
         We1ZXp0GqeZfoJ2dPlXxSQ0tiN8cAlV9CgSb7yWX+g3ISONOlSfbQra7fwEo6AdkykZY
         Qr6Oxd6a4Ttohn6/cjR79dhK8rtAPNMs5smXyovDo3O1S7eQB1+vgtEjD0E+mmO6xqY9
         1A9yKwuVKm9dEUaENpV8VmE40qREHrgAScPskA1Sd0k/2So5F8wYx86zphrSgme4YkFI
         Hukg==
X-Gm-Message-State: ACgBeo1vfFEcXiTp88s9VocQg+ra/QHjdhEoGPkkQ/WmxOxjfTlBZx5Y
	Mmf8LOqgipHeToGYxWD4Non0MgNr28Gh/w==
X-Google-Smtp-Source: AA6agR4edpTZbwf/2AWI2wKj6vWtkwXyIccMd+6PdS55TRkhiMGoNOkpBV7wA4W9G9GoWIzDM5IIRA==
X-Received: by 2002:a17:907:7619:b0:73e:28d8:eca9 with SMTP id jx25-20020a170907761900b0073e28d8eca9mr2086999ejc.490.1661518290452;
        Fri, 26 Aug 2022 05:51:30 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	stefano.stabellini@amd.com,
	wl@xen.org,
	marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH 02/12] xen/arm: add cache coloring initialization for domains
Date: Fri, 26 Aug 2022 14:51:01 +0200
Message-Id: <20220826125111.152261-3-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds array pointers to domains as well as to the hypercall
and configuration structure employed in domain creation. The latter is used
both by the toolstack and by Xen itself to pass configuration data to the
domain creation function, so the XEN_GUEST_HANDLE macro must be adopted to be
able to access guest memory in the first case. This implies special care for
the copy of the configuration data into the domain data, meaning that a
discrimination variable for the two possible code paths (coming from Xen or
from the toolstack) is needed.

The initialization and free functions for colored domains are also added.
The former is responsible for allocating and populating the color array
of the domain and it also checks for configuration issues. One of those
issues is enabling both coloring and directmap for the domain because they
contradicts one another. Since that, Dom0 must not be created with the
directmap flag.
The latter instead frees allocated memory.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 docs/misc/arm/cache-coloring.rst    |  7 ++--
 xen/arch/arm/coloring.c             | 56 +++++++++++++++++++++++++++++
 xen/arch/arm/domain.c               | 11 ++++++
 xen/arch/arm/domain_build.c         | 13 +++++--
 xen/arch/arm/include/asm/coloring.h |  7 ++++
 xen/arch/arm/include/asm/domain.h   |  4 +++
 xen/include/public/arch-arm.h       |  8 +++++
 7 files changed, 102 insertions(+), 4 deletions(-)

diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
index c7adcb0f1f..345d97cb56 100644
--- a/docs/misc/arm/cache-coloring.rst
+++ b/docs/misc/arm/cache-coloring.rst
@@ -13,7 +13,7 @@ In order to enable and use it, few steps are needed.
   (refer to menuconfig help for value meaning and when it should be changed).
 
         CONFIG_MAX_CACHE_COLORS=<n>
-- Assign colors to Dom0 using the `Color selection format`_ (see
+- Assign colors to domains using the `Color selection format`_ (see
   `Coloring parameters`_ for more documentation pointers).
 
 Background
@@ -109,4 +109,7 @@ Coloring parameters
 
 LLC way size (as previously discussed) and Dom0 colors can be set using the
 appropriate command line parameters. See the relevant documentation in
-"docs/misc/xen-command-line.pandoc".
\ No newline at end of file
+"docs/misc/xen-command-line.pandoc".
+
+Note that if no color configuration is provided for domains, they fallback to
+the default one, which corresponds simply to all available colors.
\ No newline at end of file
diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index c010ebc01b..2b37cda067 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -22,6 +22,7 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 #include <xen/errno.h>
+#include <xen/guest_access.h>
 #include <xen/keyhandler.h>
 #include <xen/param.h>
 #include <xen/types.h>
@@ -211,6 +212,61 @@ bool __init coloring_init(void)
     return true;
 }
 
+int domain_coloring_init(struct domain *d,
+                         const struct xen_arch_domainconfig *config)
+{
+    if ( is_domain_direct_mapped(d) )
+    {
+        printk(XENLOG_ERR
+               "Can't enable coloring and directmap at the same time for %pd\n",
+               d);
+        return -EINVAL;
+    }
+
+    if ( is_hardware_domain(d) )
+    {
+        d->arch.colors = dom0_colors;
+        d->arch.num_colors = dom0_num_colors;
+    }
+    else if ( config->num_colors == 0 )
+    {
+        printk(XENLOG_WARNING
+               "Color config not found for %pd. Using default\n", d);
+        d->arch.colors = xzalloc_array(unsigned int, max_colors);
+        d->arch.num_colors = set_default_domain_colors(d->arch.colors);
+    }
+    else
+    {
+        d->arch.colors = xzalloc_array(unsigned int, config->num_colors);
+        d->arch.num_colors = config->num_colors;
+        if ( config->from_guest )
+            copy_from_guest(d->arch.colors, config->colors, config->num_colors);
+        else
+            memcpy(d->arch.colors, config->colors.p,
+                   sizeof(unsigned int) * config->num_colors);
+    }
+
+    if ( !d->arch.colors )
+    {
+        printk(XENLOG_ERR "Colors allocation failed for %pd\n", d);
+        return -ENOMEM;
+    }
+
+    if ( !check_colors(d->arch.colors, d->arch.num_colors) )
+    {
+        printk(XENLOG_ERR "Bad color config for %pd\n", d);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+void domain_coloring_free(struct domain *d)
+{
+    if ( !is_hardware_domain(d) )
+        xfree(d->arch.colors);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 2d6253181a..c6fa8adc99 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -23,6 +23,9 @@
 #include <xen/wait.h>
 
 #include <asm/alternative.h>
+#ifdef CONFIG_CACHE_COLORING
+#include <asm/coloring.h>
+#endif
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
 #include <asm/current.h>
@@ -712,6 +715,11 @@ int arch_domain_create(struct domain *d,
     ioreq_domain_init(d);
 #endif
 
+#ifdef CONFIG_CACHE_COLORING
+    if ( (rc = domain_coloring_init(d, &config->arch)) )
+        goto fail;
+#endif
+
     /* p2m_init relies on some value initialized by the IOMMU subsystem */
     if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
         goto fail;
@@ -807,6 +815,9 @@ void arch_domain_destroy(struct domain *d)
                        get_order_from_bytes(d->arch.efi_acpi_len));
 #endif
     domain_io_free(d);
+#ifdef CONFIG_CACHE_COLORING
+    domain_coloring_free(d);
+#endif
 }
 
 void arch_domain_shutdown(struct domain *d)
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3fd1186b53..4d4cb692fc 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -33,6 +33,12 @@
 #include <xen/grant_table.h>
 #include <xen/serial.h>
 
+#ifdef CONFIG_CACHE_COLORING
+#define XEN_DOM0_CREATE_FLAGS CDF_privileged
+#else
+#define XEN_DOM0_CREATE_FLAGS CDF_privileged | CDF_directmap
+#endif
+
 static unsigned int __initdata opt_dom0_max_vcpus;
 integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
 
@@ -3399,7 +3405,10 @@ static int __init construct_dom0(struct domain *d)
     /* type must be set before allocate_memory */
     d->arch.type = kinfo.type;
 #endif
-    allocate_memory_11(d, &kinfo);
+    if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
+        allocate_memory(d, &kinfo);
+    else
+        allocate_memory_11(d, &kinfo);
     find_gnttab_region(d, &kinfo);
 
     /* Map extra GIC MMIO, irqs and other hw stuffs to dom0. */
@@ -3455,7 +3464,7 @@ void __init create_dom0(void)
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
-    dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
+    dom0 = domain_create(0, &dom0_cfg, XEN_DOM0_CREATE_FLAGS);
     if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
         panic("Error creating domain 0\n");
 
diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
index dd7eff5f07..60c8b1f079 100644
--- a/xen/arch/arm/include/asm/coloring.h
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -25,7 +25,14 @@
 #define __ASM_ARM_COLORING_H__
 
 #include <xen/init.h>
+#include <xen/sched.h>
+
+#include <public/arch-arm.h>
 
 bool __init coloring_init(void);
 
+int domain_coloring_init(struct domain *d,
+                         const struct xen_arch_domainconfig *config);
+void domain_coloring_free(struct domain *d);
+
 #endif /* !__ASM_ARM_COLORING_H__ */
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 26a8348eed..291f7c375d 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -58,6 +58,10 @@ struct arch_domain
 #ifdef CONFIG_ARM_64
     enum domain_type type;
 #endif
+#ifdef CONFIG_CACHE_COLORING
+    unsigned int *colors;
+    unsigned int num_colors;
+#endif
 
     /* Virtual MMU */
     struct p2m_domain p2m;
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index c8b6058d3a..adf843a7a1 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -314,6 +314,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_NONE      0
 #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
 
+__DEFINE_XEN_GUEST_HANDLE(color_t, unsigned int);
+
 struct xen_arch_domainconfig {
     /* IN/OUT */
     uint8_t gic_version;
@@ -335,6 +337,12 @@ struct xen_arch_domainconfig {
      *
      */
     uint32_t clock_frequency;
+    /* IN */
+    uint8_t from_guest;
+    /* IN */
+    uint16_t num_colors;
+    /* IN */
+    XEN_GUEST_HANDLE(color_t) colors;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
 
-- 
2.34.1


