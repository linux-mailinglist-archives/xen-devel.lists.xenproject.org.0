Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860FEA6747F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 14:06:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919087.1323627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuWdk-0003yn-RW; Tue, 18 Mar 2025 13:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919087.1323627; Tue, 18 Mar 2025 13:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuWdk-0003x9-Ob; Tue, 18 Mar 2025 13:05:52 +0000
Received: by outflank-mailman (input) for mailman id 919087;
 Tue, 18 Mar 2025 13:05:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZzY=WF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tuWdk-0003x3-1Z
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 13:05:52 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6b6cc09-03f9-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 14:05:49 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5eb5ecf3217so408869a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 06:05:49 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e81692e583sm7587290a12.16.2025.03.18.06.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 06:05:36 -0700 (PDT)
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
X-Inumbo-ID: b6b6cc09-03f9-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742303149; x=1742907949; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19IxMz8lGz4MFP0BpSGs7rafPMeUt0fwG2lzaJTnAW8=;
        b=g7vh/Jc9GJNCbSfQwvg+3mqNbAmrvkLxuIcWKFRZilIO4kiTaHG697x5yI2YAecWpb
         sPLG+w980voavtje1ctP1RJq6h3AptQ4PrOUFhY7md6/lV7dUTZUVT/f1+JOe6NXShIA
         PN0pNi+AG10+5O18tGResyMRbA//AZqzxfPUFtJMwZgjrHXik7O/MQYapdKyfENTlq6W
         PgLYa+3g5yCkvk92v0nQSB/i6lOVNTwYh7Bfxx7xSpV9eocnx94qtTJzYY9Gy2NFGcV8
         UOVtIr+VhSGPBtkNCv3m8QYy1EEsqd6aUkQKj19YxGWVvSVteEFGw0xNmPk4J5s5v3k2
         wItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742303149; x=1742907949;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=19IxMz8lGz4MFP0BpSGs7rafPMeUt0fwG2lzaJTnAW8=;
        b=IuhmhZuAfuY1CoSVmRa3wKVSO2G5iKatXrIoqOhRE/oM7/BPn/Tw64Rvie6DjcHIHf
         AB/Bzld7z3a6154LIA/cmkNvXceruyGFwRbsEmfVcKX6s1cwp2bUHcGAv/B1c7bi2knP
         /prWJskGqmrJPROutpPBsD0qKEPp0y/XokbhhnLpU19+Guj6GKURoTVnDTcoXNMl33oh
         HOEf3Xu2mBO3Qfp7feQpTHTjILpQmYnmzT3nmeL6LwFDHLFwfPBc+y+V1j4IFTinGAj9
         BH2YFucDciTM7z27hsGEeycslUybyIVQasFm0nEfxMCgEgadhbQcgJ4kd1lsVNjtRsfb
         Mprg==
X-Forwarded-Encrypted: i=1; AJvYcCWMFgdT4pNWvQ/p3FY4xipbw2lOjKXP53R9ybSuHyb3U4auhycuuNsivuAza50W0X2JAjwQOlQ0xio=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQU8h0zMBkoomf/Sx6De//sdF+BQB4w4WGVvXjGbpxXBVXSzAT
	qvdOj4LOwGLZJa+QSR2WR20tZRldjzBit4X7YRd9zdWoZveQR6+3
X-Gm-Gg: ASbGncs33DRVvL4XVXUdoHFMOnX2cl65sbA8bibz9yJwPpIKGduvdxvkFUxsylitQXW
	szME85/M16JG17udgmMrr5hW5npFo/Z/zXAFQDEKIpRk3NwBzAyKsC/XHjySMJeWHFksV7HbVsS
	1kO4HKhvaX0jkIGW8W7Fc3EKJc81ZkiidC1CvC9dR2vwzY0fr8nN3DrvodJqWSWX4b78RlfUds4
	sc6bPkIMpAk1P66ted0QRhl8tI9XG1J34rEaWa0/cv1Go7D6NC7dHSAER0oJXZeVcQ2aS/Z0Llo
	S/s/dvFIzsarIE6DrgFN9nxdLgSfjkZPtEngNGR9g90AqKTLPPJaeQ6C8ZDpFctcOH4ZoDy66sW
	lHjUGhB6Xs0WdKx7Ak/mz
X-Google-Smtp-Source: AGHT+IFJdjNURFEaUqHZBxFczEqK2o079ppwJQxFenARXxik9AblSukSnb82sD2X3autl/DVsMjMiA==
X-Received: by 2002:a05:6402:50d4:b0:5dc:7f96:6263 with SMTP id 4fb4d7f45d1cf-5e89fa4c881mr16605840a12.15.1742303143737;
        Tue, 18 Mar 2025 06:05:43 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------fMkIWatqs0dlE00Y0Q8J1x0g"
Message-ID: <85ba02a9-f9f9-4141-85be-a9a2d431e450@gmail.com>
Date: Tue, 18 Mar 2025 14:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] xen: introduce Kconfig ARCH_PAGING_MEMPOOL
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Wei Chen <wei.chen@arm.com>
References: <20250317200727.798696-1-luca.fancellu@arm.com>
 <20250317200727.798696-7-luca.fancellu@arm.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250317200727.798696-7-luca.fancellu@arm.com>

This is a multi-part message in MIME format.
--------------fMkIWatqs0dlE00Y0Q8J1x0g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/17/25 9:07 PM, Luca Fancellu wrote:
> From: Penny Zheng<Penny.Zheng@arm.com>
>
> ARM MPU system doesn't need to use paging memory pool, as MPU memory
> mapping table at most takes only one 4KB page, which is enough to
> manage the maximum 255 MPU memory regions, for all EL2 stage 1
> translation and EL1 stage 2 translation.
>
> Introduce ARCH_PAGING_MEMPOOL Kconfig common symbol, selected for Arm
> MMU systems, x86 and RISC-V.
>
> Wrap the code inside 'construct_domU' that deal with p2m paging
> allocation in a new function 'domain_p2m_set_allocation', protected
> by ARCH_PAGING_MEMPOOL, this is done in this way to prevent polluting
> the former function with #ifdefs and improve readability
>
> Introduce arch_{get,set}_paging_mempool_size stubs for architecture
> with !ARCH_PAGING_MEMPOOL.
>
> Remove 'struct paging_domain' from Arm 'struct arch_domain' when the
> field is not required.
>
> Signed-off-by: Penny Zheng<penny.zheng@arm.com>
> Signed-off-by: Wei Chen<wei.chen@arm.com>
> Signed-off-by: Luca Fancellu<luca.fancellu@arm.com>
> ---
> v3 changes:
>   - Introduced ARCH_PAGING_MEMPOOL instead of HAS_PAGING_MEMPOOL
> v2 changes:
>   - make Kconfig HAS_PAGING_MEMPOOL common
>   - protect also "xen,domain-p2m-mem-mb" reading with HAS_PAGING_MEMPOOL
>   - do not define p2m_teardown{_allocation} in this patch
>   - change commit message
> ---
>   xen/arch/arm/Kconfig              |  1 +
>   xen/arch/arm/dom0less-build.c     | 74 ++++++++++++++++++++-----------
>   xen/arch/arm/include/asm/domain.h |  2 +
>   xen/arch/riscv/Kconfig            |  1 +
>   xen/arch/x86/Kconfig              |  1 +
>   xen/common/Kconfig                |  3 ++
>   xen/include/xen/domain.h          | 17 +++++++
>   7 files changed, 73 insertions(+), 26 deletions(-)

For RISC-V:
  Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 5ac6ec0212d2..a4af0b85f158 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -75,6 +75,7 @@ choice
>   
>   config MMU
>   	bool "MMU"
> +	select ARCH_PAGING_MEMPOOL
>   	select HAS_LLC_COLORING if !NUMA && ARM_64
>   	select HAS_PMAP
>   	select HAS_VMAP
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 573b0d25ae41..6eef6ba91444 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -673,21 +673,6 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>       return -EINVAL;
>   }
>   
> -static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
> -                                             unsigned int smp_cpus)
> -{
> -    /*
> -     * Keep in sync with libxl__get_required_paging_memory().
> -     * 256 pages (1MB) per vcpu, plus 1 page per MiB of RAM for the P2M map,
> -     * plus 128 pages to cover extended regions.
> -     */
> -    unsigned long memkb = 4 * (256 * smp_cpus + (maxmem_kb / 1024) + 128);
> -
> -    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
> -
> -    return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
> -}
> -
>   static int __init alloc_xenstore_evtchn(struct domain *d)
>   {
>       evtchn_alloc_unbound_t alloc;
> @@ -841,6 +826,53 @@ static void __init domain_vcpu_affinity(struct domain *d,
>       }
>   }
>   
> +#ifdef CONFIG_ARCH_PAGING_MEMPOOL
> +
> +static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
> +                                             unsigned int smp_cpus)
> +{
> +    /*
> +     * Keep in sync with libxl__get_required_paging_memory().
> +     * 256 pages (1MB) per vcpu, plus 1 page per MiB of RAM for the P2M map,
> +     * plus 128 pages to cover extended regions.
> +     */
> +    unsigned long memkb = 4 * (256 * smp_cpus + (maxmem_kb / 1024) + 128);
> +
> +    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
> +
> +    return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
> +}
> +
> +static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
> +                                            const struct dt_device_node *node)
> +{
> +    unsigned long p2m_pages;
> +    uint32_t p2m_mem_mb;
> +    int rc;
> +
> +    rc = dt_property_read_u32(node, "xen,domain-p2m-mem-mb", &p2m_mem_mb);
> +    /* If xen,domain-p2m-mem-mb is not specified, use the default value. */
> +    p2m_pages = rc ?
> +                p2m_mem_mb << (20 - PAGE_SHIFT) :
> +                domain_p2m_pages(mem, d->max_vcpus);
> +
> +    spin_lock(&d->arch.paging.lock);
> +    rc = p2m_set_allocation(d, p2m_pages, NULL);
> +    spin_unlock(&d->arch.paging.lock);
> +
> +    return rc;
> +}
> +
> +#else /* !CONFIG_ARCH_PAGING_MEMPOOL */
> +
> +static inline int domain_p2m_set_allocation(struct domain *d, uint64_t mem,
> +                                            const struct dt_device_node *node)
> +{
> +    return 0;
> +}
> +
> +#endif /* CONFIG_ARCH_PAGING_MEMPOOL */
> +
>   static int __init construct_domU(struct domain *d,
>                                    const struct dt_device_node *node)
>   {
> @@ -848,8 +880,6 @@ static int __init construct_domU(struct domain *d,
>       const char *dom0less_enhanced;
>       int rc;
>       u64 mem;
> -    u32 p2m_mem_mb;
> -    unsigned long p2m_pages;
>   
>       rc = dt_property_read_u64(node, "memory", &mem);
>       if ( !rc )
> @@ -859,15 +889,7 @@ static int __init construct_domU(struct domain *d,
>       }
>       kinfo.unassigned_mem = (paddr_t)mem * SZ_1K;
>   
> -    rc = dt_property_read_u32(node, "xen,domain-p2m-mem-mb", &p2m_mem_mb);
> -    /* If xen,domain-p2m-mem-mb is not specified, use the default value. */
> -    p2m_pages = rc ?
> -                p2m_mem_mb << (20 - PAGE_SHIFT) :
> -                domain_p2m_pages(mem, d->max_vcpus);
> -
> -    spin_lock(&d->arch.paging.lock);
> -    rc = p2m_set_allocation(d, p2m_pages, NULL);
> -    spin_unlock(&d->arch.paging.lock);
> +    rc = domain_p2m_set_allocation(d, mem, node);
>       if ( rc != 0 )
>           return rc;
>   
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 50b6a4b00982..a3487ca71303 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -75,7 +75,9 @@ struct arch_domain
>   
>       struct hvm_domain hvm;
>   
> +#ifdef CONFIG_ARCH_PAGING_MEMPOOL
>       struct paging_domain paging;
> +#endif
>   
>       struct vmmio vmmio;
>   
> diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
> index d882e0a0598d..1bd8ae16dc65 100644
> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -1,5 +1,6 @@
>   config RISCV
>   	def_bool y
> +	select ARCH_PAGING_MEMPOOL
>   	select FUNCTION_ALIGNMENT_16B
>   	select GENERIC_BUG_FRAME
>   	select HAS_DEVICE_TREE
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index f08679959440..f6aa892661b4 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -9,6 +9,7 @@ config X86
>   	select ACPI_NUMA
>   	select ALTERNATIVE_CALL
>   	select ARCH_MAP_DOMAIN_PAGE
> +	select ARCH_PAGING_MEMPOOL
>   	select ARCH_SUPPORTS_INT128
>   	imply CORE_PARKING
>   	select FUNCTION_ALIGNMENT_16B
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index a6aa2c5c1456..218357d593b7 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -44,6 +44,9 @@ config ALTERNATIVE_CALL
>   config ARCH_MAP_DOMAIN_PAGE
>   	bool
>   
> +config ARCH_PAGING_MEMPOOL
> +	bool
> +
>   config GENERIC_BUG_FRAME
>   	bool
>   
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 83069de50118..a34daa7d10ab 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -2,6 +2,7 @@
>   #ifndef __XEN_DOMAIN_H__
>   #define __XEN_DOMAIN_H__
>   
> +#include <xen/errno.h>
>   #include <xen/numa.h>
>   #include <xen/types.h>
>   
> @@ -114,9 +115,25 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c);
>   int arch_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
>   int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
>   
> +#ifdef CONFIG_ARCH_PAGING_MEMPOOL
> +
>   int arch_get_paging_mempool_size(struct domain *d, uint64_t *size /* bytes */);
>   int arch_set_paging_mempool_size(struct domain *d, uint64_t size /* bytes */);
>   
> +#else /* !CONFIG_ARCH_PAGING_MEMPOOL */
> +
> +static inline int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +static inline int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +#endif /* CONFIG_ARCH_PAGING_MEMPOOL */
> +
>   bool update_runstate_area(struct vcpu *v);
>   
>   int domain_relinquish_resources(struct domain *d);
--------------fMkIWatqs0dlE00Y0Q8J1x0g
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/17/25 9:07 PM, Luca Fancellu
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250317200727.798696-7-luca.fancellu@arm.com">
      <pre wrap="" class="moz-quote-pre">From: Penny Zheng <a class="moz-txt-link-rfc2396E" href="mailto:Penny.Zheng@arm.com">&lt;Penny.Zheng@arm.com&gt;</a>

ARM MPU system doesn't need to use paging memory pool, as MPU memory
mapping table at most takes only one 4KB page, which is enough to
manage the maximum 255 MPU memory regions, for all EL2 stage 1
translation and EL1 stage 2 translation.

Introduce ARCH_PAGING_MEMPOOL Kconfig common symbol, selected for Arm
MMU systems, x86 and RISC-V.

Wrap the code inside 'construct_domU' that deal with p2m paging
allocation in a new function 'domain_p2m_set_allocation', protected
by ARCH_PAGING_MEMPOOL, this is done in this way to prevent polluting
the former function with #ifdefs and improve readability

Introduce arch_{get,set}_paging_mempool_size stubs for architecture
with !ARCH_PAGING_MEMPOOL.

Remove 'struct paging_domain' from Arm 'struct arch_domain' when the
field is not required.

Signed-off-by: Penny Zheng <a class="moz-txt-link-rfc2396E" href="mailto:penny.zheng@arm.com">&lt;penny.zheng@arm.com&gt;</a>
Signed-off-by: Wei Chen <a class="moz-txt-link-rfc2396E" href="mailto:wei.chen@arm.com">&lt;wei.chen@arm.com&gt;</a>
Signed-off-by: Luca Fancellu <a class="moz-txt-link-rfc2396E" href="mailto:luca.fancellu@arm.com">&lt;luca.fancellu@arm.com&gt;</a>
---
v3 changes:
 - Introduced ARCH_PAGING_MEMPOOL instead of HAS_PAGING_MEMPOOL
v2 changes:
 - make Kconfig HAS_PAGING_MEMPOOL common
 - protect also "xen,domain-p2m-mem-mb" reading with HAS_PAGING_MEMPOOL
 - do not define p2m_teardown{_allocation} in this patch
 - change commit message
---
 xen/arch/arm/Kconfig              |  1 +
 xen/arch/arm/dom0less-build.c     | 74 ++++++++++++++++++++-----------
 xen/arch/arm/include/asm/domain.h |  2 +
 xen/arch/riscv/Kconfig            |  1 +
 xen/arch/x86/Kconfig              |  1 +
 xen/common/Kconfig                |  3 ++
 xen/include/xen/domain.h          | 17 +++++++
 7 files changed, 73 insertions(+), 26 deletions(-)</pre>
    </blockquote>
    <pre>For RISC-V:
 Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.</pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250317200727.798696-7-luca.fancellu@arm.com">
      <pre wrap="" class="moz-quote-pre">

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 5ac6ec0212d2..a4af0b85f158 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -75,6 +75,7 @@ choice
 
 config MMU
 	bool "MMU"
+	select ARCH_PAGING_MEMPOOL
 	select HAS_LLC_COLORING if !NUMA &amp;&amp; ARM_64
 	select HAS_PMAP
 	select HAS_VMAP
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 573b0d25ae41..6eef6ba91444 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -673,21 +673,6 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     return -EINVAL;
 }
 
-static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
-                                             unsigned int smp_cpus)
-{
-    /*
-     * Keep in sync with libxl__get_required_paging_memory().
-     * 256 pages (1MB) per vcpu, plus 1 page per MiB of RAM for the P2M map,
-     * plus 128 pages to cover extended regions.
-     */
-    unsigned long memkb = 4 * (256 * smp_cpus + (maxmem_kb / 1024) + 128);
-
-    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
-
-    return DIV_ROUND_UP(memkb, 1024) &lt;&lt; (20 - PAGE_SHIFT);
-}
-
 static int __init alloc_xenstore_evtchn(struct domain *d)
 {
     evtchn_alloc_unbound_t alloc;
@@ -841,6 +826,53 @@ static void __init domain_vcpu_affinity(struct domain *d,
     }
 }
 
+#ifdef CONFIG_ARCH_PAGING_MEMPOOL
+
+static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
+                                             unsigned int smp_cpus)
+{
+    /*
+     * Keep in sync with libxl__get_required_paging_memory().
+     * 256 pages (1MB) per vcpu, plus 1 page per MiB of RAM for the P2M map,
+     * plus 128 pages to cover extended regions.
+     */
+    unsigned long memkb = 4 * (256 * smp_cpus + (maxmem_kb / 1024) + 128);
+
+    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
+
+    return DIV_ROUND_UP(memkb, 1024) &lt;&lt; (20 - PAGE_SHIFT);
+}
+
+static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
+                                            const struct dt_device_node *node)
+{
+    unsigned long p2m_pages;
+    uint32_t p2m_mem_mb;
+    int rc;
+
+    rc = dt_property_read_u32(node, "xen,domain-p2m-mem-mb", &amp;p2m_mem_mb);
+    /* If xen,domain-p2m-mem-mb is not specified, use the default value. */
+    p2m_pages = rc ?
+                p2m_mem_mb &lt;&lt; (20 - PAGE_SHIFT) :
+                domain_p2m_pages(mem, d-&gt;max_vcpus);
+
+    spin_lock(&amp;d-&gt;arch.paging.lock);
+    rc = p2m_set_allocation(d, p2m_pages, NULL);
+    spin_unlock(&amp;d-&gt;arch.paging.lock);
+
+    return rc;
+}
+
+#else /* !CONFIG_ARCH_PAGING_MEMPOOL */
+
+static inline int domain_p2m_set_allocation(struct domain *d, uint64_t mem,
+                                            const struct dt_device_node *node)
+{
+    return 0;
+}
+
+#endif /* CONFIG_ARCH_PAGING_MEMPOOL */
+
 static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
@@ -848,8 +880,6 @@ static int __init construct_domU(struct domain *d,
     const char *dom0less_enhanced;
     int rc;
     u64 mem;
-    u32 p2m_mem_mb;
-    unsigned long p2m_pages;
 
     rc = dt_property_read_u64(node, "memory", &amp;mem);
     if ( !rc )
@@ -859,15 +889,7 @@ static int __init construct_domU(struct domain *d,
     }
     kinfo.unassigned_mem = (paddr_t)mem * SZ_1K;
 
-    rc = dt_property_read_u32(node, "xen,domain-p2m-mem-mb", &amp;p2m_mem_mb);
-    /* If xen,domain-p2m-mem-mb is not specified, use the default value. */
-    p2m_pages = rc ?
-                p2m_mem_mb &lt;&lt; (20 - PAGE_SHIFT) :
-                domain_p2m_pages(mem, d-&gt;max_vcpus);
-
-    spin_lock(&amp;d-&gt;arch.paging.lock);
-    rc = p2m_set_allocation(d, p2m_pages, NULL);
-    spin_unlock(&amp;d-&gt;arch.paging.lock);
+    rc = domain_p2m_set_allocation(d, mem, node);
     if ( rc != 0 )
         return rc;
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 50b6a4b00982..a3487ca71303 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -75,7 +75,9 @@ struct arch_domain
 
     struct hvm_domain hvm;
 
+#ifdef CONFIG_ARCH_PAGING_MEMPOOL
     struct paging_domain paging;
+#endif
 
     struct vmmio vmmio;
 
diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index d882e0a0598d..1bd8ae16dc65 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -1,5 +1,6 @@
 config RISCV
 	def_bool y
+	select ARCH_PAGING_MEMPOOL
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
 	select HAS_DEVICE_TREE
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index f08679959440..f6aa892661b4 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -9,6 +9,7 @@ config X86
 	select ACPI_NUMA
 	select ALTERNATIVE_CALL
 	select ARCH_MAP_DOMAIN_PAGE
+	select ARCH_PAGING_MEMPOOL
 	select ARCH_SUPPORTS_INT128
 	imply CORE_PARKING
 	select FUNCTION_ALIGNMENT_16B
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index a6aa2c5c1456..218357d593b7 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -44,6 +44,9 @@ config ALTERNATIVE_CALL
 config ARCH_MAP_DOMAIN_PAGE
 	bool
 
+config ARCH_PAGING_MEMPOOL
+	bool
+
 config GENERIC_BUG_FRAME
 	bool
 
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 83069de50118..a34daa7d10ab 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -2,6 +2,7 @@
 #ifndef __XEN_DOMAIN_H__
 #define __XEN_DOMAIN_H__
 
+#include &lt;xen/errno.h&gt;
 #include &lt;xen/numa.h&gt;
 #include &lt;xen/types.h&gt;
 
@@ -114,9 +115,25 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c);
 int arch_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
 int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
 
+#ifdef CONFIG_ARCH_PAGING_MEMPOOL
+
 int arch_get_paging_mempool_size(struct domain *d, uint64_t *size /* bytes */);
 int arch_set_paging_mempool_size(struct domain *d, uint64_t size /* bytes */);
 
+#else /* !CONFIG_ARCH_PAGING_MEMPOOL */
+
+static inline int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
+{
+    return -EOPNOTSUPP;
+}
+
+static inline int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
+{
+    return -EOPNOTSUPP;
+}
+
+#endif /* CONFIG_ARCH_PAGING_MEMPOOL */
+
 bool update_runstate_area(struct vcpu *v);
 
 int domain_relinquish_resources(struct domain *d);
</pre>
    </blockquote>
  </body>
</html>

--------------fMkIWatqs0dlE00Y0Q8J1x0g--

