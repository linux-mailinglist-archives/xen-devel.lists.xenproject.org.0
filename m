Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1DB6326D5
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 15:50:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446683.702404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox87o-0001YG-Cw; Mon, 21 Nov 2022 14:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446683.702404; Mon, 21 Nov 2022 14:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox87o-0001VV-8f; Mon, 21 Nov 2022 14:50:20 +0000
Received: by outflank-mailman (input) for mailman id 446683;
 Mon, 21 Nov 2022 14:50:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YUjL=3V=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1ox87m-0001VN-A9
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 14:50:18 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfa995c2-69ab-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 15:50:16 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id n12so29021604eja.11
 for <xen-devel@lists.xenproject.org>; Mon, 21 Nov 2022 06:50:16 -0800 (PST)
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
X-Inumbo-ID: cfa995c2-69ab-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VVRqdWgGLYqrv+2xsWOJNrqRSIn5rptDcdc9kWYSVc8=;
        b=HGYVU4PnAhNtY0kg9DzzLTS5u5onQmKmsEPFjN4u7MMBisxMMvsgGFv4bktmi4eFZJ
         2VVHT1B3ylV3bNDWZYOKIh+iRL8FbMbjbbG8psZaEiEHJsJE2vSlAEb6L76/hWyIoDsr
         f7geCNPqvStnjiYieQaqeN14tZ6Ap69VmFl2IfDx0cz0mUTNOHo1f+mx1in01Fq2kAu9
         ydT66SdKYreqbZTfH2vsSGGB++xsnKi186FpodVxRe5QSXYbJy5fCOlwXH1W7u0kNXNK
         D8tkq9mgJwtkV1GQ9XoE4Fxzq+MJeSu3aLjvfoZHq6er+/k/nPulU5V2HbyzgY+UbCPl
         dHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVRqdWgGLYqrv+2xsWOJNrqRSIn5rptDcdc9kWYSVc8=;
        b=IkaKGIvA7PC1D0jHxzAzH5ISrwqLFPSsrMx54zHle1auEOAHainjHn8fbkZPK9pcJT
         v2/WwOkfApxZv2STzp+bJTDS4viCgXSq0Uq0RU9aAeZTMjHvAxyW4DDZFzSlHwIB5gQS
         j/0kniM/hixM1EK/+uhZgrQZeB37oSHUH8SW/jM7smePPKOzjPUgNR7nFJQyG158P/4W
         kb7vRepx9n3jtm2kwqwMBRI/aWd2Vgk6xtUtVAHc2xpFz7JdMhDkEWP4/0Qe50NEQ+q4
         XpcGhzW8PVQClJUdhWiOP+MDQ/P4VEwbFx8LMlVgJI/XQBVVsYQXXI8cVcaI2RVFL0OK
         g+sQ==
X-Gm-Message-State: ANoB5pnpRoK7bsg4auvvd3HVj4ibkq7qg1Dgy47PyQUbL3lSfT6Ww5a9
	PcKbvXO9jr2RxVjIIpaUfcDPgHNNDqazx0dvAvlISw==
X-Google-Smtp-Source: AA0mqf6pK8MgyTRcFlHdqTuy6OtV8l5qLiOmuaci2Vk1IAz7EyrikBaA1n00ovBknTO9DwnC0lMD5KMWewEER3gL2sA=
X-Received: by 2002:a17:906:2785:b0:78d:98a7:2e7 with SMTP id
 j5-20020a170906278500b0078d98a702e7mr262135ejc.535.1669042215831; Mon, 21 Nov
 2022 06:50:15 -0800 (PST)
MIME-Version: 1.0
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech> <20221022155120.7000-3-carlo.nonato@minervasys.tech>
In-Reply-To: <20221022155120.7000-3-carlo.nonato@minervasys.tech>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 21 Nov 2022 15:50:04 +0100
Message-ID: <CAG+AhRU8zrHaxrNQqyu-c4niB2DWXcQRmvsit_samXtDa2LpfQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] xen/arm: add cache coloring initialization for domains
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: marco.solieri@unimore.it, xen-devel@lists.xenproject.org, 
	andrea.bastoni@minervasys.tech, lucmiccio@gmail.com, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"

Hi x86 devs,

I want to ask you some questions about this patch because in the previous
version me and Julien have discussed how cache colors should be passed in
domain creation. You should be able to read that discussion, anyway here is
a link to it

https://marc.info/?l=xen-devel&m=166151802002263

In short, using struct xen_arch_domainconfig works fine only when domctl
hypercall is issued. That struct contains a XEN_GUEST_HANDLE so it
should point to guest memory and must not be used when creating a domain
from Xen itself (i.e. dom0 or dom0less domains). The easy way to go is then
changing the domain_create() signature to require also a color array and its
length to be passed in for these latter cases.
Are you ok with that? See below for more comments.

Another question is then if xen_arch_domainconfig is the right place where to
put the coloring fields for domctl hypercall value passing.
See below for more comments.

I know that these two questions are very specific so let me know if something
is unclear.

On Sat, Oct 22, 2022 at 5:51 PM Carlo Nonato
<carlo.nonato@minervasys.tech> wrote:
>
> This commit adds array pointers to domains as well as to the hypercall
> and configuration structure employed in domain creation. The latter is used
> both by the toolstack and by Xen itself to pass configuration data to the
> domain creation function, so the XEN_GUEST_HANDLE macro must be adopted to
> be able to access guest memory in the first case. This implies special care
> for the copy of the configuration data into the domain data, meaning that a
> discrimination variable for the two possible code paths (coming from Xen or
> from the toolstack) is needed.
>
> The initialization and free functions for colored domains are also added.
> The former is responsible for allocating and populating the color array
> of the domain and it also checks for configuration issues. One of those
> issues is enabling both coloring and directmap for the domain because they
> contradicts one another. Since that, Dom0 must not be created with the
> directmap flag.
> The latter instead frees allocated memory.
>
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
>
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
> v3:
> - xfree() for colors array in case of errors in domain_coloring_init()
> ---
>  docs/misc/arm/cache-coloring.rst    | 14 ++++++-
>  xen/arch/arm/coloring.c             | 57 +++++++++++++++++++++++++++++
>  xen/arch/arm/domain.c               |  7 ++++
>  xen/arch/arm/domain_build.c         | 13 ++++++-
>  xen/arch/arm/include/asm/coloring.h | 10 +++++
>  xen/arch/arm/include/asm/domain.h   |  4 ++
>  xen/include/public/arch-arm.h       |  8 ++++
>  7 files changed, 110 insertions(+), 3 deletions(-)
>
> diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
> index b0f9a2e917..e8ee8fafde 100644
> --- a/docs/misc/arm/cache-coloring.rst
> +++ b/docs/misc/arm/cache-coloring.rst
> @@ -16,7 +16,7 @@ In order to enable and use it, few steps are needed.
>    (refer to menuconfig help for value meaning and when it should be changed).
>
>          CONFIG_MAX_CACHE_COLORS=<n>
> -- Assign colors to Dom0 using the `Color selection format`_ (see
> +- Assign colors to domains using the `Color selection format`_ (see
>    `Coloring parameters`_ for more documentation pointers).
>
>  Background
> @@ -114,6 +114,9 @@ LLC way size (as previously discussed) and Dom0 colors can be set using the
>  appropriate command line parameters. See the relevant documentation in
>  "docs/misc/xen-command-line.pandoc".
>
> +Note that if no color configuration is provided for domains, they fallback to
> +the default one, which corresponds simply to all available colors.
> +
>  Known issues and limitations
>  ****************************
>
> @@ -133,3 +136,12 @@ too) is set to 2^15 = 32768 colors because of some limitation on the domain
>  configuration structure size used in domain creation. "uint16_t" is the biggest
>  integer type that fit the constraint and 2^15 is the biggest power of 2 it can
>  easily represent. This value is big enough for the generic case, though.
> +
> +
> +"xen,static-mem" isn't supported when coloring is enabled
> +#########################################################
> +
> +In the domain configuration, "xen,static-mem" allows memory to be statically
> +allocated to the domain. This isn't possibile when cache coloring is enabled,
> +because that memory can't be guaranteed to be of the same colors assigned to
> +that domain.
> diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
> index 36eea2d6c0..a7b59f5aba 100644
> --- a/xen/arch/arm/coloring.c
> +++ b/xen/arch/arm/coloring.c
> @@ -23,6 +23,7 @@
>   */
>  #include <xen/bitops.h>
>  #include <xen/errno.h>
> +#include <xen/guest_access.h>
>  #include <xen/keyhandler.h>
>  #include <xen/param.h>
>  #include <xen/types.h>
> @@ -232,6 +233,62 @@ bool __init coloring_init(void)
>      return true;
>  }
>
> +int domain_coloring_init(struct domain *d,
> +                         const struct xen_arch_domainconfig *config)
> +{
> +    if ( is_domain_direct_mapped(d) )
> +    {
> +        printk(XENLOG_ERR
> +               "Can't enable coloring and directmap at the same time for %pd\n",
> +               d);
> +        return -EINVAL;
> +    }
> +
> +    if ( is_hardware_domain(d) )
> +    {
> +        d->arch.colors = dom0_colors;
> +        d->arch.num_colors = dom0_num_colors;
> +    }
> +    else if ( config->num_colors == 0 )
> +    {
> +        printk(XENLOG_WARNING
> +               "Color config not found for %pd. Using default\n", d);
> +        d->arch.colors = xzalloc_array(unsigned int, max_colors);
> +        d->arch.num_colors = set_default_domain_colors(d->arch.colors);
> +    }
> +    else
> +    {
> +        d->arch.colors = xzalloc_array(unsigned int, config->num_colors);
> +        d->arch.num_colors = config->num_colors;
> +        if ( config->from_guest )
> +            copy_from_guest(d->arch.colors, config->colors, config->num_colors);
> +        else
> +            memcpy(d->arch.colors, config->colors.p,
> +                   sizeof(unsigned int) * config->num_colors);
> +    }

Question 1:
Here is the current hacky solution in action: using config->from_guest to
decide whether to call copy_from_guest() or memcpy(). This is a no go for
Julien (and also for me right now). In my current work, I tried to get rid
of this field simply by calling copy_from_guest() only in domctl.c, but this
solution still isn't easy to maintain because the config->colors.p field can
either be a guest pointer or a Xen one and mixing the two semantics can be
problematic.

> +
> +    if ( !d->arch.colors )
> +    {
> +        printk(XENLOG_ERR "Colors allocation failed for %pd\n", d);
> +        return -ENOMEM;
> +    }
> +
> +    if ( !check_colors(d->arch.colors, d->arch.num_colors) )
> +    {
> +        printk(XENLOG_ERR "Bad color config for %pd\n", d);
> +        domain_coloring_free(d);
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +void domain_coloring_free(struct domain *d)
> +{
> +    if ( !is_hardware_domain(d) )
> +        xfree(d->arch.colors);
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 2d6253181a..b4dd64dff4 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -23,6 +23,7 @@
>  #include <xen/wait.h>
>
>  #include <asm/alternative.h>
> +#include <asm/coloring.h>
>  #include <asm/cpuerrata.h>
>  #include <asm/cpufeature.h>
>  #include <asm/current.h>
> @@ -712,6 +713,10 @@ int arch_domain_create(struct domain *d,
>      ioreq_domain_init(d);
>  #endif
>
> +    if ( IS_ENABLED(CONFIG_CACHE_COLORING) &&
> +        (rc = domain_coloring_init(d, &config->arch)) )
> +        goto fail;
> +
>      /* p2m_init relies on some value initialized by the IOMMU subsystem */
>      if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
>          goto fail;
> @@ -807,6 +812,8 @@ void arch_domain_destroy(struct domain *d)
>                         get_order_from_bytes(d->arch.efi_acpi_len));
>  #endif
>      domain_io_free(d);
> +    if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
> +        domain_coloring_free(d);
>  }
>
>  void arch_domain_shutdown(struct domain *d)
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 40e3c2e119..97f2060007 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -35,6 +35,12 @@
>
>  #define STATIC_EVTCHN_NODE_SIZE_CELLS 2
>
> +#ifdef CONFIG_CACHE_COLORING
> +#define XEN_DOM0_CREATE_FLAGS CDF_privileged
> +#else
> +#define XEN_DOM0_CREATE_FLAGS CDF_privileged | CDF_directmap
> +#endif
> +
>  static unsigned int __initdata opt_dom0_max_vcpus;
>  integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
>
> @@ -3963,7 +3969,10 @@ static int __init construct_dom0(struct domain *d)
>      /* type must be set before allocate_memory */
>      d->arch.type = kinfo.type;
>  #endif
> -    allocate_memory_11(d, &kinfo);
> +    if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
> +        allocate_memory(d, &kinfo);
> +    else
> +        allocate_memory_11(d, &kinfo);
>      find_gnttab_region(d, &kinfo);
>
>  #ifdef CONFIG_STATIC_SHM
> @@ -4025,7 +4034,7 @@ void __init create_dom0(void)
>      if ( iommu_enabled )
>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>
> -    dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
> +    dom0 = domain_create(0, &dom0_cfg, XEN_DOM0_CREATE_FLAGS);
>      if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
>          panic("Error creating domain 0\n");
>
> diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
> index 3b563d3b90..0d2dfada10 100644
> --- a/xen/arch/arm/include/asm/coloring.h
> +++ b/xen/arch/arm/include/asm/coloring.h
> @@ -27,12 +27,22 @@
>  #ifdef CONFIG_CACHE_COLORING
>
>  #include <xen/init.h>
> +#include <xen/sched.h>
> +
> +#include <public/arch-arm.h>
>
>  bool __init coloring_init(void);
>
> +int domain_coloring_init(struct domain *d,
> +                         const struct xen_arch_domainconfig *config);
> +void domain_coloring_free(struct domain *d);
> +
>  #else /* !CONFIG_CACHE_COLORING */
>
>  static inline bool __init coloring_init(void) { return true; }
> +static inline int domain_coloring_init(
> +    struct domain *d, const struct xen_arch_domainconfig *config) { return 0; }
> +static inline void domain_coloring_free(struct domain *d) {}
>
>  #endif /* CONFIG_CACHE_COLORING */
>  #endif /* __ASM_ARM_COLORING_H__ */
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 26a8348eed..291f7c375d 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -58,6 +58,10 @@ struct arch_domain
>  #ifdef CONFIG_ARM_64
>      enum domain_type type;
>  #endif
> +#ifdef CONFIG_CACHE_COLORING
> +    unsigned int *colors;
> +    unsigned int num_colors;
> +#endif
>
>      /* Virtual MMU */
>      struct p2m_domain p2m;
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index c8b6058d3a..adf843a7a1 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -314,6 +314,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>  #define XEN_DOMCTL_CONFIG_TEE_NONE      0
>  #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
>
> +__DEFINE_XEN_GUEST_HANDLE(color_t, unsigned int);

Question 2:
This color_t definition is employed because the guest handle for
"unsigned int" (uint) is defined later (public/xen.h) and (citing Julien):

> Hmmm... And I guess we can't define "unsigned int" earlier because they
> rely on macro defined in arch-arm.h?

So the solution could be to move everything up a level in
xen_domctl_createdomain, where using uint wouldn't be a problem.
If this goes to common code then should it be guarded with some #ifdef
or not?

> +
>  struct xen_arch_domainconfig {
>      /* IN/OUT */
>      uint8_t gic_version;
> @@ -335,6 +337,12 @@ struct xen_arch_domainconfig {
>       *
>       */
>      uint32_t clock_frequency;
> +    /* IN */
> +    uint8_t from_guest;
> +    /* IN */
> +    uint16_t num_colors;
> +    /* IN */
> +    XEN_GUEST_HANDLE(color_t) colors;
>  };
>  #endif /* __XEN__ || __XEN_TOOLS__ */
>
> --
> 2.34.1
>

Thanks.


- Carlo Nonato

