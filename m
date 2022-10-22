Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F3C608E4A
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 17:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428407.678487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGmk-0002Mq-0v; Sat, 22 Oct 2022 15:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428407.678487; Sat, 22 Oct 2022 15:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGmj-0002JD-SD; Sat, 22 Oct 2022 15:51:41 +0000
Received: by outflank-mailman (input) for mailman id 428407;
 Sat, 22 Oct 2022 15:51:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U686=2X=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1omGmi-000237-89
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 15:51:40 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a68df66-5221-11ed-8fd0-01056ac49cbb;
 Sat, 22 Oct 2022 17:51:39 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id l22so16367212edj.5
 for <xen-devel@lists.xenproject.org>; Sat, 22 Oct 2022 08:51:39 -0700 (PDT)
Received: from carlo-ubuntu.home (62-11-205-162.dialup.tiscali.it.
 [62.11.205.162]) by smtp.gmail.com with ESMTPSA id
 z61-20020a509e43000000b00461816beef9sm894623ede.14.2022.10.22.08.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:51:38 -0700 (PDT)
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
X-Inumbo-ID: 6a68df66-5221-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YEp+6/JGCHy6EQ4ajZKOuOH14rgPIjfh8TnzifmQQA=;
        b=aKRNEZiMt7Y8LQT/O0c2wMlSjtTVslJIVI1ImdR18eAIy+Uj7tqQa34aNe83fGjTyn
         csZ1x51Um/ctWKOnVibYdBe+iPNrPr/W2Vqspcq0C5w40HFspJuJIu0TT85iqatb2zau
         FtMn2i50MyyFtCbn4mc0bNXogRomJfORGErHJQJAg3A/8zY5EfWxaA/sg2TlqK5Q+0j5
         bKbpPcpFDwYxMMq2eVDJZOLfDYpdqGlbD8PSICLXUTxRKXMHuS2bn9IF7t/wvj0TVLa3
         Qcn/vIkgJZTHILWRlYgMtQZZ6rkG4f1QO7wQlL4nCh46L1OGMB19k3bis8N87fGqyuNG
         rmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YEp+6/JGCHy6EQ4ajZKOuOH14rgPIjfh8TnzifmQQA=;
        b=UH3eNWhgUqQCgnW5tmVUPllKT6gkW6hf436nH3+hjy7gZlp6UDTkjgH3AV/VwnQ9kI
         QizF9Nz/Lh6WkZApP+zb+jfZ/hxBK1N+nCsdr52EvL6XSTvi+uUgAK8XC02K8gyIfuQ1
         qQQxKtdrtpZfopKDl2nJLJBNYAXnaOYqkP2gmZu0ooJaUB+NjJMUGETszDoIJ4Z6w6aq
         PNchfr4EVB7lOnzpKMlz9538XMQME4jFOE/9Dzom4x70auwuYfwVQNbUk4wvBJ3am/mD
         zDkPHMgJ2UnjNznT9hTLvhvZ4ZVZXV3bzw0rM9KNMBAsCEwKrEWF4XI1zvM1UEWBKWqM
         e/hA==
X-Gm-Message-State: ACrzQf069DQlJNFpSwEj87yNr81uHzOsyCTGfy8Sb7lpVkguAjPa7+Uu
	bsY96w7MN1XW1g7s7/tnd0hmzbdOycKwgQ==
X-Google-Smtp-Source: AMsMyM5V1jeTHV4nPjXGbtPqbhd2eNZm97l6V2GYwTsKhRtC/q9iij/cI9UK2L8Wi96OH/ZtqnEjSg==
X-Received: by 2002:a17:906:db0d:b0:77b:a7cd:8396 with SMTP id xj13-20020a170906db0d00b0077ba7cd8396mr21339403ejb.264.1666453898534;
        Sat, 22 Oct 2022 08:51:38 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v3 2/9] xen/arm: add cache coloring initialization for domains
Date: Sat, 22 Oct 2022 17:51:13 +0200
Message-Id: <20221022155120.7000-3-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds array pointers to domains as well as to the hypercall
and configuration structure employed in domain creation. The latter is used
both by the toolstack and by Xen itself to pass configuration data to the
domain creation function, so the XEN_GUEST_HANDLE macro must be adopted to
be able to access guest memory in the first case. This implies special care
for the copy of the configuration data into the domain data, meaning that a
discrimination variable for the two possible code paths (coming from Xen or
from the toolstack) is needed.

The initialization and free functions for colored domains are also added.
The former is responsible for allocating and populating the color array
of the domain and it also checks for configuration issues. One of those
issues is enabling both coloring and directmap for the domain because they
contradicts one another. Since that, Dom0 must not be created with the
directmap flag.
The latter instead frees allocated memory.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v3:
- xfree() for colors array in case of errors in domain_coloring_init()
---
 docs/misc/arm/cache-coloring.rst    | 14 ++++++-
 xen/arch/arm/coloring.c             | 57 +++++++++++++++++++++++++++++
 xen/arch/arm/domain.c               |  7 ++++
 xen/arch/arm/domain_build.c         | 13 ++++++-
 xen/arch/arm/include/asm/coloring.h | 10 +++++
 xen/arch/arm/include/asm/domain.h   |  4 ++
 xen/include/public/arch-arm.h       |  8 ++++
 7 files changed, 110 insertions(+), 3 deletions(-)

diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
index b0f9a2e917..e8ee8fafde 100644
--- a/docs/misc/arm/cache-coloring.rst
+++ b/docs/misc/arm/cache-coloring.rst
@@ -16,7 +16,7 @@ In order to enable and use it, few steps are needed.
   (refer to menuconfig help for value meaning and when it should be changed).
 
         CONFIG_MAX_CACHE_COLORS=<n>
-- Assign colors to Dom0 using the `Color selection format`_ (see
+- Assign colors to domains using the `Color selection format`_ (see
   `Coloring parameters`_ for more documentation pointers).
 
 Background
@@ -114,6 +114,9 @@ LLC way size (as previously discussed) and Dom0 colors can be set using the
 appropriate command line parameters. See the relevant documentation in
 "docs/misc/xen-command-line.pandoc".
 
+Note that if no color configuration is provided for domains, they fallback to
+the default one, which corresponds simply to all available colors.
+
 Known issues and limitations
 ****************************
 
@@ -133,3 +136,12 @@ too) is set to 2^15 = 32768 colors because of some limitation on the domain
 configuration structure size used in domain creation. "uint16_t" is the biggest
 integer type that fit the constraint and 2^15 is the biggest power of 2 it can
 easily represent. This value is big enough for the generic case, though.
+
+
+"xen,static-mem" isn't supported when coloring is enabled
+#########################################################
+
+In the domain configuration, "xen,static-mem" allows memory to be statically
+allocated to the domain. This isn't possibile when cache coloring is enabled,
+because that memory can't be guaranteed to be of the same colors assigned to
+that domain.
diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index 36eea2d6c0..a7b59f5aba 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -23,6 +23,7 @@
  */
 #include <xen/bitops.h>
 #include <xen/errno.h>
+#include <xen/guest_access.h>
 #include <xen/keyhandler.h>
 #include <xen/param.h>
 #include <xen/types.h>
@@ -232,6 +233,62 @@ bool __init coloring_init(void)
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
+        domain_coloring_free(d);
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
index 2d6253181a..b4dd64dff4 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -23,6 +23,7 @@
 #include <xen/wait.h>
 
 #include <asm/alternative.h>
+#include <asm/coloring.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
 #include <asm/current.h>
@@ -712,6 +713,10 @@ int arch_domain_create(struct domain *d,
     ioreq_domain_init(d);
 #endif
 
+    if ( IS_ENABLED(CONFIG_CACHE_COLORING) &&
+        (rc = domain_coloring_init(d, &config->arch)) )
+        goto fail;
+
     /* p2m_init relies on some value initialized by the IOMMU subsystem */
     if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
         goto fail;
@@ -807,6 +812,8 @@ void arch_domain_destroy(struct domain *d)
                        get_order_from_bytes(d->arch.efi_acpi_len));
 #endif
     domain_io_free(d);
+    if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
+        domain_coloring_free(d);
 }
 
 void arch_domain_shutdown(struct domain *d)
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 40e3c2e119..97f2060007 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -35,6 +35,12 @@
 
 #define STATIC_EVTCHN_NODE_SIZE_CELLS 2
 
+#ifdef CONFIG_CACHE_COLORING
+#define XEN_DOM0_CREATE_FLAGS CDF_privileged
+#else
+#define XEN_DOM0_CREATE_FLAGS CDF_privileged | CDF_directmap
+#endif
+
 static unsigned int __initdata opt_dom0_max_vcpus;
 integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
 
@@ -3963,7 +3969,10 @@ static int __init construct_dom0(struct domain *d)
     /* type must be set before allocate_memory */
     d->arch.type = kinfo.type;
 #endif
-    allocate_memory_11(d, &kinfo);
+    if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
+        allocate_memory(d, &kinfo);
+    else
+        allocate_memory_11(d, &kinfo);
     find_gnttab_region(d, &kinfo);
 
 #ifdef CONFIG_STATIC_SHM
@@ -4025,7 +4034,7 @@ void __init create_dom0(void)
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
-    dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
+    dom0 = domain_create(0, &dom0_cfg, XEN_DOM0_CREATE_FLAGS);
     if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
         panic("Error creating domain 0\n");
 
diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
index 3b563d3b90..0d2dfada10 100644
--- a/xen/arch/arm/include/asm/coloring.h
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -27,12 +27,22 @@
 #ifdef CONFIG_CACHE_COLORING
 
 #include <xen/init.h>
+#include <xen/sched.h>
+
+#include <public/arch-arm.h>
 
 bool __init coloring_init(void);
 
+int domain_coloring_init(struct domain *d,
+                         const struct xen_arch_domainconfig *config);
+void domain_coloring_free(struct domain *d);
+
 #else /* !CONFIG_CACHE_COLORING */
 
 static inline bool __init coloring_init(void) { return true; }
+static inline int domain_coloring_init(
+    struct domain *d, const struct xen_arch_domainconfig *config) { return 0; }
+static inline void domain_coloring_free(struct domain *d) {}
 
 #endif /* CONFIG_CACHE_COLORING */
 #endif /* __ASM_ARM_COLORING_H__ */
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


