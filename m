Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE0FAD0A38
	for <lists+xen-devel@lfdr.de>; Sat,  7 Jun 2025 01:28:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008970.1388104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNgU1-00034C-Jr; Fri, 06 Jun 2025 23:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008970.1388104; Fri, 06 Jun 2025 23:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNgU1-00031c-HC; Fri, 06 Jun 2025 23:28:21 +0000
Received: by outflank-mailman (input) for mailman id 1008970;
 Fri, 06 Jun 2025 23:28:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRk0=YV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uNgTz-00031W-I7
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 23:28:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebe22f9a-432d-11f0-a303-13f23c93f187;
 Sat, 07 Jun 2025 01:28:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ECBCB5C5D46;
 Fri,  6 Jun 2025 23:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1AAC4CEEB;
 Fri,  6 Jun 2025 23:28:13 +0000 (UTC)
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
X-Inumbo-ID: ebe22f9a-432d-11f0-a303-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749252495;
	bh=qeSnsN3zYcNKQLmQMewBuJH7juTCHiyv2r+0SZjrPnI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GJCZRkUNnfsea98SvoiZLnfKkxrHbYJsq35cifW3EFlePyy7JIxSKoS7G4WQdV45/
	 NthlaO0QSli141iLh8RobfKy6B8jzx+0f2SoubaCbN/haZRPgXG1y0Gc9XZN4TTBx7
	 yF8UgF9V/968XEMQ1cZGisUBsat4OswM6Bizkcon/SsKhu/pcj/qMwerAovnnmWOXx
	 4uX9RYIJybCDlp9/f/a+tAx7LDF3ngCGa3UR3ODXzk0SMH0k1M1H/xNnazW6+CJPYP
	 P7ytPKPqDEj5M4U7hFU2cMjEo5UwdSpaYbb5QqWJEVohGVYWjneMc3yPd9ANmbrOvd
	 F196bgB+PgkXA==
Date: Fri, 6 Jun 2025 16:28:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 07/15] x86: Replace boot_domain with bootdomain
In-Reply-To: <20250605194810.2782031-8-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506061623500.2495561@ubuntu-linux-20-04-desktop>
References: <20250605194810.2782031-1-agarciav@amd.com> <20250605194810.2782031-8-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Jun 2025, Alejandro Vallejo wrote:
> No functional change intended.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> v2:
>   * Replaces the previous patch in which kernel_info replaced boot_domain
> ---
>  xen/arch/x86/dom0_build.c              |  2 +-
>  xen/arch/x86/hvm/dom0_build.c          |  6 ++---
>  xen/arch/x86/include/asm/boot-domain.h | 33 --------------------------
>  xen/arch/x86/include/asm/bootfdt.h     |  7 ++++++
>  xen/arch/x86/include/asm/bootinfo.h    |  3 +--
>  xen/arch/x86/include/asm/dom0_build.h  |  6 ++---
>  xen/arch/x86/include/asm/setup.h       |  4 ++--
>  xen/arch/x86/pv/dom0_build.c           |  6 ++---
>  xen/arch/x86/setup.c                   | 16 +++++++------
>  xen/include/xen/bootfdt.h              |  4 ++++
>  10 files changed, 33 insertions(+), 54 deletions(-)
>  delete mode 100644 xen/arch/x86/include/asm/boot-domain.h
> 
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 0b467fd4a4..1c8c5140a3 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -615,7 +615,7 @@ int __init dom0_setup_permissions(struct domain *d)
>      return rc;
>  }
>  
> -int __init construct_dom0(const struct boot_domain *bd)
> +int __init construct_dom0(const struct bootdomain *bd)
>  {
>      int rc;
>      const struct domain *d = bd->d;
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index 96410344a8..85c000b259 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -644,11 +644,11 @@ static bool __init check_and_adjust_load_address(
>  }
>  
>  static int __init pvh_load_kernel(
> -    const struct boot_domain *bd, paddr_t *entry, paddr_t *start_info_addr)
> +    const struct bootdomain *bd, paddr_t *entry, paddr_t *start_info_addr)
>  {
>      struct domain *d = bd->d;
>      struct bootmodule *image = bd->kernel;
> -    struct bootmodule *initrd = bd->module;
> +    struct bootmodule *initrd = bd->initrd;
>      void *image_base = bootstrap_map_bm(image);
>      void *image_start = image_base + image->arch.headroom;
>      unsigned long image_len = image->size;
> @@ -1329,7 +1329,7 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
>      }
>  }
>  
> -int __init dom0_construct_pvh(const struct boot_domain *bd)
> +int __init dom0_construct_pvh(const struct bootdomain *bd)
>  {
>      paddr_t entry, start_info;
>      struct domain *d = bd->d;
> diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
> deleted file mode 100644
> index 242e9c9c2b..0000000000
> --- a/xen/arch/x86/include/asm/boot-domain.h
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*
> - * Copyright (c) 2024 Apertus Solutions, LLC
> - * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
> - * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
> - */
> -
> -#ifndef __XEN_X86_BOOTDOMAIN_H__
> -#define __XEN_X86_BOOTDOMAIN_H__
> -
> -#include <public/xen.h>
> -
> -struct boot_domain {
> -    domid_t domid;
> -
> -    struct bootmodule *kernel;
> -    struct bootmodule *module;
> -    const char *cmdline;
> -
> -    struct domain *d;
> -};
> -
> -#endif
> -
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * tab-width: 4
> - * indent-tabs-mode: nil
> - * End:
> - */
> diff --git a/xen/arch/x86/include/asm/bootfdt.h b/xen/arch/x86/include/asm/bootfdt.h
> index 2fc705a1cd..b30132381e 100644
> --- a/xen/arch/x86/include/asm/bootfdt.h
> +++ b/xen/arch/x86/include/asm/bootfdt.h
> @@ -4,6 +4,13 @@
>  
>  #include <xen/types.h>
>  
> +#include <public/xen.h>
> +
> +struct arch_bootdomain
> +{
> +    domid_t domid;
> +};
> +
>  struct arch_bootmodule
>  {
>      /*
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> index f3210b7d6a..b8280ba357 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -12,7 +12,6 @@
>  #include <xen/init.h>
>  #include <xen/multiboot.h>
>  #include <xen/types.h>
> -#include <asm/boot-domain.h>
>  
>  /* Max number of boot modules a bootloader can provide in addition to Xen */
>  #define MAX_NR_BOOTMODS 63
> @@ -34,7 +33,7 @@ struct boot_info {
>  
>      unsigned int nr_modules;
>      struct bootmodule mods[MAX_NR_BOOTMODS + 1];
> -    struct boot_domain domains[MAX_NR_BOOTDOMS];
> +    struct bootdomain  domains[MAX_NR_BOOTDOMS];
>  };
>  
>  /*
> diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
> index ff021c24af..df03189870 100644
> --- a/xen/arch/x86/include/asm/dom0_build.h
> +++ b/xen/arch/x86/include/asm/dom0_build.h
> @@ -13,9 +13,9 @@ unsigned long dom0_compute_nr_pages(struct domain *d,
>                                      unsigned long initrd_len);
>  int dom0_setup_permissions(struct domain *d);
>  
> -struct boot_domain;
> -int dom0_construct_pv(const struct boot_domain *bd);
> -int dom0_construct_pvh(const struct boot_domain *bd);
> +struct bootdomain;
> +int dom0_construct_pv(const struct bootdomain *bd);
> +int dom0_construct_pvh(const struct bootdomain *bd);
>  
>  unsigned long dom0_paging_pages(const struct domain *d,
>                                  unsigned long nr_pages);
> diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
> index c7deaba109..a8647f0fdf 100644
> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -26,8 +26,8 @@ void subarch_init_memory(void);
>  
>  void init_IRQ(void);
>  
> -struct boot_domain;
> -int construct_dom0(const struct boot_domain *bd);
> +struct bootdomain;
> +int construct_dom0(const struct bootdomain *bd);
>  
>  void setup_io_bitmap(struct domain *d);
>  
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index e6c77413f5..a6f212fe0a 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -355,7 +355,7 @@ static struct page_info * __init alloc_chunk(struct domain *d,
>      return page;
>  }
>  
> -static int __init dom0_construct(const struct boot_domain *bd)
> +static int __init dom0_construct(const struct bootdomain *bd)
>  {
>      unsigned int i;
>      int rc, order, machine;
> @@ -375,7 +375,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
>      struct vcpu *v = d->vcpu[0];
>  
>      struct bootmodule *image = bd->kernel;
> -    struct bootmodule *initrd = bd->module;
> +    struct bootmodule *initrd = bd->initrd;
>      void *image_base;
>      unsigned long image_len;
>      void *image_start;
> @@ -1070,7 +1070,7 @@ out:
>      return rc;
>  }
>  
> -int __init dom0_construct_pv(const struct boot_domain *bd)
> +int __init dom0_construct_pv(const struct bootdomain *bd)
>  {
>      unsigned long cr4 = read_cr4();
>      int rc;
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index e9a70c2c2b..726adad0e5 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -297,7 +297,9 @@ static const char *cmdline_cook(const char *p, const char *loader_name);
>  struct boot_info __initdata xen_boot_info = {
>      .loader = "unknown",
>      .cmdline = "",
> -    .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = { .domid = DOMID_INVALID } },
> +    .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = {
> +        .arch.domid = DOMID_INVALID
> +    }},
>      /*
>       * There's a MAX_NR_BOOTMODS-th entry in the array. It's not off by one.
>       *
> @@ -987,7 +989,7 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
>  }
>  
>  static size_t __init domain_cmdline_size(const struct boot_info *bi,
> -                                         const struct boot_domain *bd)
> +                                         const struct bootdomain *bd)
>  {
>      size_t s = bi->kextra ? strlen(bi->kextra) : 0;
>      const struct arch_bootmodule *abm = &bd->kernel->arch;
> @@ -1022,7 +1024,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>              .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
>          },
>      };
> -    struct boot_domain *bd = &bi->domains[0];
> +    struct bootdomain *bd = &bi->domains[0];
>      struct domain *d;
>  
>      if ( opt_dom0_pvh )
> @@ -1039,11 +1041,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>  
>      /* Create initial domain.  Not d0 for pvshim. */
> -    bd->domid = get_initial_domain_id();
> -    d = domain_create(bd->domid, &dom0_cfg,
> +    bd->arch.domid = get_initial_domain_id();
> +    d = domain_create(bd->arch.domid, &dom0_cfg,
>                        pv_shim ? 0 : CDF_privileged | CDF_hardware);
>      if ( IS_ERR(d) )
> -        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
> +        panic("Error creating d%u: %ld\n", bd->arch.domid, PTR_ERR(d));
>  
>      init_dom0_cpuid_policy(d);
>  
> @@ -2162,7 +2164,7 @@ void asmlinkage __init noreturn __start_xen(void)
>      if ( initrdidx < MAX_NR_BOOTMODS )
>      {
>          bi->mods[initrdidx].kind = BOOTMOD_RAMDISK;
> -        bi->domains[0].module = &bi->mods[initrdidx];
> +        bi->domains[0].initrd = &bi->mods[initrdidx];
>          if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
>              printk(XENLOG_WARNING
>                     "Multiple initrd candidates, picking module #%u\n",
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index e6d52a599f..19d2ff0f0c 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -108,6 +108,10 @@ struct bootdomain {
>      struct bootmodule *initrd;
>  
>      const char* cmdline;
> +
> +#if __has_include(<asm/bootfdt.h>)
> +    struct arch_bootdomain arch;
> +#endif
>  };

One suggestion for improvement:

diff --git a/xen/arch/x86/include/asm/bootfdt.h b/xen/arch/x86/include/asm/bootfdt.h
index b30132381e..892a0e2373 100644
--- a/xen/arch/x86/include/asm/bootfdt.h
+++ b/xen/arch/x86/include/asm/bootfdt.h
@@ -6,11 +6,6 @@
 
 #include <public/xen.h>
 
-struct arch_bootdomain
-{
-    domid_t domid;
-};
-
 struct arch_bootmodule
 {
     /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 726adad0e5..39f294b88b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -297,9 +297,6 @@ static const char *cmdline_cook(const char *p, const char *loader_name);
 struct boot_info __initdata xen_boot_info = {
     .loader = "unknown",
     .cmdline = "",
-    .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = {
-        .arch.domid = DOMID_INVALID
-    }},
     /*
      * There's a MAX_NR_BOOTMODS-th entry in the array. It's not off by one.
      *
@@ -1026,6 +1023,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     };
     struct bootdomain *bd = &bi->domains[0];
     struct domain *d;
+    domid_t domid;
 
     if ( opt_dom0_pvh )
     {
@@ -1041,11 +1039,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
     /* Create initial domain.  Not d0 for pvshim. */
-    bd->arch.domid = get_initial_domain_id();
-    d = domain_create(bd->arch.domid, &dom0_cfg,
+    domid = get_initial_domain_id();
+    d = domain_create(domid, &dom0_cfg,
                       pv_shim ? 0 : CDF_privileged | CDF_hardware);
     if ( IS_ERR(d) )
-        panic("Error creating d%u: %ld\n", bd->arch.domid, PTR_ERR(d));
+        panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
 
     init_dom0_cpuid_policy(d);
 
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 19d2ff0f0c..e6d52a599f 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -108,10 +108,6 @@ struct bootdomain {
     struct bootmodule *initrd;
 
     const char* cmdline;
-
-#if __has_include(<asm/bootfdt.h>)
-    struct arch_bootdomain arch;
-#endif
 };
 
 /*

