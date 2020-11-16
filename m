Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDDB2B5429
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 23:15:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28657.57712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kemmD-0001mX-Hl; Mon, 16 Nov 2020 22:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28657.57712; Mon, 16 Nov 2020 22:15:09 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kemmD-0001m8-Em; Mon, 16 Nov 2020 22:15:09 +0000
Received: by outflank-mailman (input) for mailman id 28657;
 Mon, 16 Nov 2020 22:15:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DwRh=EW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kemmB-0001m3-91
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 22:15:07 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b6ba5e9-bbaf-4a94-8d56-2f53f41c1f9b;
 Mon, 16 Nov 2020 22:15:06 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9DCC2224B;
 Mon, 16 Nov 2020 22:15:04 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DwRh=EW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kemmB-0001m3-91
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 22:15:07 +0000
X-Inumbo-ID: 6b6ba5e9-bbaf-4a94-8d56-2f53f41c1f9b
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6b6ba5e9-bbaf-4a94-8d56-2f53f41c1f9b;
	Mon, 16 Nov 2020 22:15:06 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E9DCC2224B;
	Mon, 16 Nov 2020 22:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605564905;
	bh=oPKNVtxxK245+Q42be0r+QqSCBzguDwheQthAdmtAKM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=n3nAiMMLHOUiiv1iSyaDKLCTtQBWpgrqM2ILl2BpO3wdfeZ7QthaK7zWb2Ow4sFQr
	 BNuwqJTQL9JnHwbu13Zx5FPVEQIA2j9+1ggH2ORM42esIRQDkbvNYv3vVGCxodV5jS
	 BEiRY6YNf0cprbFowwpRuQGM61KLQvMc8bRy7qXM=
Date: Mon, 16 Nov 2020 14:15:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Michal Orzel <michal.orzel@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
Subject: Re: [PATCH v2] xen/arm: Add workaround for Cortex-A76/Neoverse-N1
 erratum #1286807
In-Reply-To: <20201116121140.26763-1-michal.orzel@arm.com>
Message-ID: <alpine.DEB.2.21.2011161414280.20906@sstabellini-ThinkPad-T480s>
References: <20201116121140.26763-1-michal.orzel@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Nov 2020, Michal Orzel wrote:
> On the affected Cortex-A76/Neoverse-N1 cores (r0p0 to r3p0),
> if a virtual address for a cacheable mapping of a location is being
> accessed by a core while another core is remapping the virtual
> address to a new physical page using the recommended break-before-make
> sequence, then under very rare circumstances TLBI+DSB completes before
> a read using the translation being invalidated has been observed by
> other observers. The workaround repeats the TLBI+DSB operation
> for all the TLB flush operations on purpose.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Looks good and it looks like you addressed all Julien's comments, so:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  docs/misc/arm/silicon-errata.txt     |  2 ++
>  xen/arch/arm/Kconfig                 | 23 +++++++++++++++++++++
>  xen/arch/arm/cpuerrata.c             | 14 +++++++++++++
>  xen/include/asm-arm/arm64/flushtlb.h | 30 +++++++++++++++++++---------
>  xen/include/asm-arm/cpufeature.h     |  3 ++-
>  5 files changed, 62 insertions(+), 10 deletions(-)
> 
> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
> index 552c4151d3..d183ba543f 100644
> --- a/docs/misc/arm/silicon-errata.txt
> +++ b/docs/misc/arm/silicon-errata.txt
> @@ -53,5 +53,7 @@ stable hypervisors.
>  | ARM            | Cortex-A72      | #853709         | N/A                     |
>  | ARM            | Cortex-A73      | #858921         | ARM_ERRATUM_858921      |
>  | ARM            | Cortex-A76      | #1165522        | N/A                     |
> +| ARM            | Cortex-A76      | #1286807        | ARM64_ERRATUM_1286807   |
>  | ARM            | Neoverse-N1     | #1165522        | N/A
> +| ARM            | Neoverse-N1     | #1286807        | ARM64_ERRATUM_1286807   |
>  | ARM            | MMU-500         | #842869         | N/A                     |
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index f938dd21bd..8171b8d04a 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -244,6 +244,29 @@ config ARM_ERRATUM_858921
>  
>  	  If unsure, say Y.
>  
> +config ARM64_WORKAROUND_REPEAT_TLBI
> +	bool
> +
> +config ARM64_ERRATUM_1286807
> +	bool "Cortex-A76/Neoverse-N1: 1286807: Modification of the translation table for a virtual address might lead to read-after-read ordering violation"
> +	default y
> +	select ARM64_WORKAROUND_REPEAT_TLBI
> +	depends on ARM_64
> +	help
> +	  This option adds a workaround for ARM Cortex-A76/Neoverse-N1 erratum 1286807.
> +
> +	  On the affected Cortex-A76/Neoverse-N1 cores (r0p0 to r3p0), if a virtual
> +	  address for a cacheable mapping of a location is being
> +	  accessed by a core while another core is remapping the virtual
> +	  address to a new physical page using the recommended
> +	  break-before-make sequence, then under very rare circumstances
> +	  TLBI+DSB completes before a read using the translation being
> +	  invalidated has been observed by other observers. The
> +	  workaround repeats the TLBI+DSB operation for all the TLB flush
> +	  operations on purpose.
> +
> +	  If unsure, say Y.
> +
>  endmenu
>  
>  config ARM64_HARDEN_BRANCH_PREDICTOR
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index 567911d380..cb4795beec 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -424,6 +424,20 @@ static const struct arm_cpu_capabilities arm_errata[] = {
>                     (1 << MIDR_VARIANT_SHIFT) | 2),
>      },
>  #endif
> +#ifdef CONFIG_ARM64_ERRATUM_1286807
> +    {
> +        /* Cortex-A76 r0p0 - r3p0 */
> +        .desc = "ARM erratum 1286807",
> +        .capability = ARM64_WORKAROUND_REPEAT_TLBI,
> +        MIDR_RANGE(MIDR_CORTEX_A76, 0, 3 << MIDR_VARIANT_SHIFT),
> +    },
> +    {
> +        /* Neoverse-N1 r0p0 - r3p0 */
> +        .desc = "ARM erratum 1286807",
> +        .capability = ARM64_WORKAROUND_REPEAT_TLBI,
> +        MIDR_RANGE(MIDR_NEOVERSE_N1, 0, 3 << MIDR_VARIANT_SHIFT),
> +    },
> +#endif
>  #ifdef CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR
>      {
>          .capability = ARM_HARDEN_BRANCH_PREDICTOR,
> diff --git a/xen/include/asm-arm/arm64/flushtlb.h b/xen/include/asm-arm/arm64/flushtlb.h
> index ceec59542e..8f2abfaf1d 100644
> --- a/xen/include/asm-arm/arm64/flushtlb.h
> +++ b/xen/include/asm-arm/arm64/flushtlb.h
> @@ -9,6 +9,12 @@
>   * DSB ISH          // Ensure the TLB invalidation has completed
>   * ISB              // See explanation below
>   *
> + * ARM64_WORKAROUND_REPEAT_TLBI:
> + * Modification of the translation table for a virtual address might lead to
> + * read-after-read ordering violation.
> + * The workaround repeats TLBI+DSB operation for all the TLB flush operations
> + * on purpose.
> + *
>   * For Xen page-tables the ISB will discard any instructions fetched
>   * from the old mappings.
>   *
> @@ -16,15 +22,21 @@
>   * (and therefore the TLB invalidation) before continuing. So we know
>   * the TLBs cannot contain an entry for a mapping we may have removed.
>   */
> -#define TLB_HELPER(name, tlbop) \
> -static inline void name(void)   \
> -{                               \
> -    asm volatile(               \
> -        "dsb  ishst;"           \
> -        "tlbi "  # tlbop  ";"   \
> -        "dsb  ish;"             \
> -        "isb;"                  \
> -        : : : "memory");        \
> +#define TLB_HELPER(name, tlbop)                  \
> +static inline void name(void)                    \
> +{                                                \
> +    asm volatile(                                \
> +        "dsb  ishst;"                            \
> +        "tlbi "  # tlbop  ";"                    \
> +        ALTERNATIVE(                             \
> +            "nop; nop;",                         \
> +            "dsb  ish;"                          \
> +            "tlbi "  # tlbop  ";",               \
> +            ARM64_WORKAROUND_REPEAT_TLBI,        \
> +            CONFIG_ARM64_WORKAROUND_REPEAT_TLBI) \
> +        "dsb  ish;"                              \
> +        "isb;"                                   \
> +        : : : "memory");                         \
>  }
>  
>  /* Flush local TLBs, current VMID only. */
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index 016a9fe203..c7b5052992 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -46,8 +46,9 @@
>  #define ARM_SMCCC_1_1 8
>  #define ARM64_WORKAROUND_AT_SPECULATE 9
>  #define ARM_WORKAROUND_858921 10
> +#define ARM64_WORKAROUND_REPEAT_TLBI 11
>  
> -#define ARM_NCAPS           11
> +#define ARM_NCAPS           12
>  
>  #ifndef __ASSEMBLY__
>  
> -- 
> 2.28.0
> 

