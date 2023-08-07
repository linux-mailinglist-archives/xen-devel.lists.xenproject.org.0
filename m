Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AD5772D43
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 19:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578765.906429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT4L5-00045z-P4; Mon, 07 Aug 2023 17:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578765.906429; Mon, 07 Aug 2023 17:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT4L5-00044J-LM; Mon, 07 Aug 2023 17:48:19 +0000
Received: by outflank-mailman (input) for mailman id 578765;
 Mon, 07 Aug 2023 17:48:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qT4L3-00044D-RZ
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 17:48:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qT4L2-0006BZ-0D; Mon, 07 Aug 2023 17:48:16 +0000
Received: from [54.239.6.189] (helo=[192.168.12.178])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qT4L1-0001Hg-PP; Mon, 07 Aug 2023 17:48:15 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=4mhyzpQg4k7lygPAEO6SHdHU7c/LBQh23TewNpjKVWU=; b=VSY0tj/hNdRir45NmYKW44F/m9
	U0D0b9xttQjBDw+/rkpRBNhf+2XT8yeOX68tVT+dADdjErUKN02P0J1focSgq/I6AyJMKEQQ6kzx/
	ZBGAc7siUlTG3dSlG/qwI33KPYZsDFTpf4D4iLWBZ2RlNG4bik924Aho6mpoYf8dpeIY=;
Message-ID: <5bd0894b-6114-48dd-8c7f-2d1fe142c9d8@xen.org>
Date: Mon, 7 Aug 2023 18:48:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] pdx: Add CONFIG_HAS_PDX_COMPRESSION as a common
 Kconfig option
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-6-alejandro.vallejo@cloud.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230728075903.7838-6-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alex,

One more remark in the title. s/HAS// as you renamed the Kconfig.

On 28/07/2023 08:59, Alejandro Vallejo wrote:
> Adds a new compile-time flag to allow disabling pdx compression and
> compiles out compression-related code/data. It also shorts the pdx<->pfn
> conversion macros and creates stubs for masking fucntions.
> 
> While at it, removes the old arch-defined CONFIG_HAS_PDX flag, as it was
> not removable in practice.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v2:
>    * Merged v1/patch2: Removal of CONFIG_HAS_PDX here (Jan)
> ---
>   xen/arch/arm/Kconfig  |  1 -
>   xen/arch/x86/Kconfig  |  1 -
>   xen/arch/x86/domain.c | 19 +++++++++++++------
>   xen/common/Kconfig    | 13 ++++++++++---
>   xen/common/Makefile   |  2 +-
>   xen/common/pdx.c      | 15 +++++++++++----
>   xen/include/xen/pdx.h | 37 ++++++++++++++++++++++++++++++++++---
>   7 files changed, 69 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 439cc94f33..ea1949fbaa 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -14,7 +14,6 @@ config ARM
>   	select HAS_ALTERNATIVE
>   	select HAS_DEVICE_TREE
>   	select HAS_PASSTHROUGH
> -	select HAS_PDX
>   	select HAS_PMAP
>   	select HAS_UBSAN
>   	select IOMMU_FORCE_PT_SHARE
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 92f3a627da..30df085d96 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -24,7 +24,6 @@ config X86
>   	select HAS_PASSTHROUGH
>   	select HAS_PCI
>   	select HAS_PCI_MSI
> -	select HAS_PDX
>   	select HAS_SCHED_GRANULARITY
>   	select HAS_UBSAN
>   	select HAS_VPCI if HVM
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 5f66c2ae33..ee2830aad7 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -458,7 +458,7 @@ void domain_cpu_policy_changed(struct domain *d)
>       }
>   }
>   
> -#ifndef CONFIG_BIGMEM
> +#if !defined(CONFIG_BIGMEM) && defined(CONFIG_PDX_COMPRESSION)
>   /*
>    * The hole may be at or above the 44-bit boundary, so we need to determine
>    * the total bit count until reaching 32 significant (not squashed out) bits
> @@ -485,13 +485,20 @@ static unsigned int __init noinline _domain_struct_bits(void)
>   struct domain *alloc_domain_struct(void)
>   {
>       struct domain *d;
> -#ifdef CONFIG_BIGMEM
> -    const unsigned int bits = 0;
> -#else
> +
>       /*
> -     * We pack the PDX of the domain structure into a 32-bit field within
> -     * the page_info structure. Hence the MEMF_bits() restriction.
> +     * Without CONFIG_BIGMEM, we pack the PDX of the domain structure into
> +     * a 32-bit field within the page_info structure. Hence the MEMF_bits()
> +     * restriction. With PDX compression in place the number of bits must
> +     * be calculated at runtime, but it's fixed otherwise.
> +     *
> +     * On systems with CONFIG_BIGMEM there's no packing, and so there's no
> +     * such restriction.
>        */
> +#if defined(CONFIG_BIGMEM) || !defined(CONFIG_PDX_COMPRESSION)
> +    const unsigned int bits = IS_ENABLED(CONFIG_BIGMEM) ? 0 :
> +                                                          32 + PAGE_SHIFT;
> +#else
>       static unsigned int __read_mostly bits;
>   
>       if ( unlikely(!bits) )
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index dd8d7c3f1c..3a0afd8e83 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -23,6 +23,16 @@ config GRANT_TABLE
>   
>   	  If unsure, say Y.
>   
> +config PDX_COMPRESSION
> +	bool "PDX (Page inDeX) compression support"
> +	default ARM
> +	help
> +	  PDX compression is a technique that allows the hypervisor to
> +	  represent physical addresses in a very space-efficient manner.
> +	  This is very helpful reducing memory wastage in systems with
> +	  memory banks with base addresses far from each other, but carrier
> +	  a performance cost.
> +
>   config ALTERNATIVE_CALL
>   	bool
>   
> @@ -53,9 +63,6 @@ config HAS_IOPORTS
>   config HAS_KEXEC
>   	bool
>   
> -config HAS_PDX
> -	bool
> -
>   config HAS_PMAP
>   	bool
>   
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 46049eac35..0020cafb8a 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -29,7 +29,7 @@ obj-y += multicall.o
>   obj-y += notifier.o
>   obj-$(CONFIG_NUMA) += numa.o
>   obj-y += page_alloc.o
> -obj-$(CONFIG_HAS_PDX) += pdx.o
> +obj-y += pdx.o
>   obj-$(CONFIG_PERF_COUNTERS) += perfc.o
>   obj-bin-$(CONFIG_HAS_PMAP) += pmap.init.o
>   obj-y += preempt.o
> diff --git a/xen/common/pdx.c b/xen/common/pdx.c
> index d3d38965bd..a3b1ba9fbb 100644
> --- a/xen/common/pdx.c
> +++ b/xen/common/pdx.c
> @@ -31,11 +31,15 @@ unsigned long __read_mostly pdx_group_valid[BITS_TO_LONGS(
>   
>   bool __mfn_valid(unsigned long mfn)
>   {
> -    if ( unlikely(evaluate_nospec(mfn >= max_page)) )
> +    bool invalid = mfn >= max_page;
> +#ifdef CONFIG_PDX_COMPRESSION
> +    invalid |= mfn & pfn_hole_mask;
> +#endif
> +
> +    if ( unlikely(evaluate_nospec(invalid)) )
>           return false;
> -    return likely(!(mfn & pfn_hole_mask)) &&
> -           likely(test_bit(pfn_to_pdx(mfn) / PDX_GROUP_COUNT,
> -                           pdx_group_valid));
> +
> +    return test_bit(pfn_to_pdx(mfn) / PDX_GROUP_COUNT, pdx_group_valid);
>   }
>   
>   void set_pdx_range(unsigned long smfn, unsigned long emfn)
> @@ -49,6 +53,8 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn)
>           __set_bit(idx, pdx_group_valid);
>   }
>   
> +#ifdef CONFIG_PDX_COMPRESSION
> +
>   /*
>    * Diagram to make sense of the following variables. The masks and shifts
>    * are done on mfn values in order to convert to/from pdx:
> @@ -175,6 +181,7 @@ void __init pfn_pdx_hole_setup(unsigned long mask)
>       pfn_top_mask        = ~(pfn_pdx_bottom_mask | pfn_hole_mask);
>       ma_top_mask         = pfn_top_mask << PAGE_SHIFT;
>   }
> +#endif /* CONFIG_PDX_COMPRESSION */
>   
>   
>   /*
> diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
> index 5a82b6bde2..dfb475c8dc 100644
> --- a/xen/include/xen/pdx.h
> +++ b/xen/include/xen/pdx.h
> @@ -67,8 +67,6 @@
>    * region involved.
>    */
>   
> -#ifdef CONFIG_HAS_PDX
> -
>   extern unsigned long max_pdx;
>   
>   #define PDX_GROUP_COUNT ((1 << PDX_GROUP_SHIFT) / \
> @@ -100,6 +98,8 @@ bool __mfn_valid(unsigned long mfn);
>   #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
>   #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
>   
> +#ifdef CONFIG_PDX_COMPRESSION
> +
>   extern unsigned long pfn_pdx_bottom_mask, ma_va_bottom_mask;
>   extern unsigned int pfn_pdx_hole_shift;
>   extern unsigned long pfn_hole_mask;
> @@ -205,8 +205,39 @@ static inline uint64_t directmapoff_to_maddr(unsigned long offset)
>    *             position marks a potentially compressible bit.
>    */
>   void pfn_pdx_hole_setup(unsigned long mask);
> +#else /* CONFIG_PDX_COMPRESSION */
> +
> +/* Without PDX compression we can skip some computations */
> +
> +/* pdx<->pfn == identity */
> +#define pdx_to_pfn(x) (x)
> +#define pfn_to_pdx(x) (x)
> +
> +/* directmap is indexed by by maddr */
> +#define maddr_to_directmapoff(x) (x)
> +#define directmapoff_to_maddr(x) (x)
> +
> +static inline bool pdx_is_region_compressible(unsigned long smfn,
> +                                              unsigned long emfn)
> +{
> +    return true;
> +}
> +
> +static inline uint64_t pdx_init_mask(uint64_t base_addr)
> +{
> +    return 0;
> +}
> +
> +static inline uint64_t pdx_region_mask(uint64_t base, uint64_t len)
> +{
> +    return 0;
> +}
> +
> +static inline void pfn_pdx_hole_setup(unsigned long mask)
> +{
> +}
>   
> -#endif /* HAS_PDX */
> +#endif /* CONFIG_PDX_COMPRESSION */
>   #endif /* __XEN_PDX_H__ */
>   
>   /*

-- 
Julien Grall

