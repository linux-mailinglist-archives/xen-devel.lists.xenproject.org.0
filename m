Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB3675140F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 01:03:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562874.879627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJirg-0000wo-4r; Wed, 12 Jul 2023 23:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562874.879627; Wed, 12 Jul 2023 23:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJirg-0000uM-1b; Wed, 12 Jul 2023 23:03:20 +0000
Received: by outflank-mailman (input) for mailman id 562874;
 Wed, 12 Jul 2023 23:03:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eU4r=C6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qJirf-0000uG-5K
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 23:03:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 492418b4-2108-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 01:03:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E2916198A;
 Wed, 12 Jul 2023 23:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E243FC433C7;
 Wed, 12 Jul 2023 23:03:13 +0000 (UTC)
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
X-Inumbo-ID: 492418b4-2108-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689202995;
	bh=s7UpWwfEAKw7LnHMf0U++pkdvy2QbsIG0grpKwXNRmo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G9zl0kumBz56bV49DihZwU2XQUCikxETwHW04qo3Xz6JP/IIbIry5rS7OoDiMvJrK
	 d/vLfC7mj9S9IFQBiql6dKTybBaAhSGZXJWads/iOMuNBVqzA7ssYt2TjUe9ElC1Zr
	 xxOYj4s2QlaRlnUhiieig0e/pQIbvabolw/dFNxWVNhOh/N0K2OG9UC4vgs/FIh428
	 Vl33x2zWg6V9gJ31iQeaBWZbq2tyGibkyltoiy8IYSXt4FhcKkxyIhqCy9sIjWLjyH
	 jbH70y8NHqQB+9FHjW7b2EmUTu0PNoV1dbzHBu08/OupmoOeWkHEDqyAMT7nJ+nap8
	 XSjizafuJjhEQ==
Date: Wed, 12 Jul 2023 16:03:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH v3 12/15] xen/x86: fix violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <78717a3ccee0517eab915156fc474394ae1dcf81.1689152719.git.gianluca.luparini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307121554040.761183@ubuntu-linux-20-04-desktop>
References: <cover.1689152719.git.gianluca.luparini@bugseng.com> <78717a3ccee0517eab915156fc474394ae1dcf81.1689152719.git.gianluca.luparini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Jul 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type.
> 
> For the sake of uniformity, the following changes are made:
> - add the 'U' suffix to all first macro's arguments in 'mce-apei.c'
> - add the 'U' suffix to switch cases in 'cpuid.c'
> - add 'U' suffixes to 'mask16' in 'stdvga.c'
> - add the 'U' suffix to macros in 'pci.h'
> 
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

The checked the patch and everything looks correct.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


Two minor comments below that could or could not be addressed on commit.
It is fine either way for me.


> diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
> index c3771c2e39..0e8694c188 100644
> --- a/xen/arch/x86/extable.c
> +++ b/xen/arch/x86/extable.c
> @@ -141,7 +141,7 @@ static int __init cf_check stub_selftest(void)
>            .rax = 0x0123456789abcdef,
>            .res.fields.trapnr = X86_EXC_GP },
>          { .opc = { endbr64, 0x02, 0x04, 0x04, 0xc3 }, /* add (%rsp,%rax),%al */
> -          .rax = 0xfedcba9876543210,
> +          .rax = 0xfedcba9876543210UL,
>            .res.fields.trapnr = X86_EXC_SS },
>          { .opc = { endbr64, 0xcc, 0xc3, 0xc3, 0xc3 }, /* int3 */
>            .res.fields.trapnr = X86_EXC_BP },

I wonder if it would be easier to be consistent cross-arch and just use
ULL everywhere a 64-bit value is present.

I know it is not required on x86, so this is just an optional
comment, I'll leave it to the maintainers.


> @@ -325,83 +325,83 @@
>  
>  /* K7/K8 MSRs. Not complete. See the architecture manual for a more
>     complete list. */
> -#define MSR_K7_EVNTSEL0			0xc0010000
> -#define MSR_K7_PERFCTR0			0xc0010004
> -#define MSR_K7_EVNTSEL1			0xc0010001
> -#define MSR_K7_PERFCTR1			0xc0010005
> -#define MSR_K7_EVNTSEL2			0xc0010002
> -#define MSR_K7_PERFCTR2			0xc0010006
> -#define MSR_K7_EVNTSEL3			0xc0010003
> -#define MSR_K7_PERFCTR3			0xc0010007
> -#define MSR_K8_TOP_MEM1			0xc001001a
> -#define MSR_K7_CLK_CTL			0xc001001b
> -#define MSR_K8_TOP_MEM2			0xc001001d
> -
> -#define MSR_K8_HWCR			0xc0010015
> +#define MSR_K7_EVNTSEL0			0xc0010000U
> +#define MSR_K7_PERFCTR0			0xc0010004U
> +#define MSR_K7_EVNTSEL1			0xc0010001U
> +#define MSR_K7_PERFCTR1			0xc0010005U
> +#define MSR_K7_EVNTSEL2			0xc0010002U
> +#define MSR_K7_PERFCTR2			0xc0010006U
> +#define MSR_K7_EVNTSEL3			0xc0010003U
> +#define MSR_K7_PERFCTR3			0xc0010007U
> +#define MSR_K8_TOP_MEM1			0xc001001aU
> +#define MSR_K7_CLK_CTL			0xc001001bU
> +#define MSR_K8_TOP_MEM2			0xc001001dU
> +
> +#define MSR_K8_HWCR			0xc0010015U
>  #define K8_HWCR_TSC_FREQ_SEL		(1ULL << 24)
>  #define K8_HWCR_CPUID_USER_DIS		(1ULL << 35)
>  
> -#define MSR_K7_FID_VID_CTL		0xc0010041
> -#define MSR_K7_FID_VID_STATUS		0xc0010042
> -#define MSR_K8_PSTATE_LIMIT		0xc0010061
> -#define MSR_K8_PSTATE_CTRL		0xc0010062
> -#define MSR_K8_PSTATE_STATUS		0xc0010063
> -#define MSR_K8_PSTATE0			0xc0010064
> -#define MSR_K8_PSTATE1			0xc0010065
> -#define MSR_K8_PSTATE2			0xc0010066
> -#define MSR_K8_PSTATE3			0xc0010067
> -#define MSR_K8_PSTATE4			0xc0010068
> -#define MSR_K8_PSTATE5			0xc0010069
> -#define MSR_K8_PSTATE6			0xc001006A
> -#define MSR_K8_PSTATE7			0xc001006B
> -#define MSR_K8_ENABLE_C1E		0xc0010055
> -#define MSR_K8_VM_HSAVE_PA		0xc0010117
> -
> -#define MSR_AMD_FAM15H_EVNTSEL0		0xc0010200
> -#define MSR_AMD_FAM15H_PERFCTR0		0xc0010201
> -#define MSR_AMD_FAM15H_EVNTSEL1		0xc0010202
> -#define MSR_AMD_FAM15H_PERFCTR1		0xc0010203
> -#define MSR_AMD_FAM15H_EVNTSEL2		0xc0010204
> -#define MSR_AMD_FAM15H_PERFCTR2		0xc0010205
> -#define MSR_AMD_FAM15H_EVNTSEL3		0xc0010206
> -#define MSR_AMD_FAM15H_PERFCTR3		0xc0010207
> -#define MSR_AMD_FAM15H_EVNTSEL4		0xc0010208
> -#define MSR_AMD_FAM15H_PERFCTR4		0xc0010209
> -#define MSR_AMD_FAM15H_EVNTSEL5		0xc001020a
> -#define MSR_AMD_FAM15H_PERFCTR5		0xc001020b
> -
> -#define MSR_AMD_L7S0_FEATURE_MASK	0xc0011002
> -#define MSR_AMD_THRM_FEATURE_MASK	0xc0011003
> -#define MSR_K8_FEATURE_MASK		0xc0011004
> -#define MSR_K8_EXT_FEATURE_MASK		0xc0011005
> +#define MSR_K7_FID_VID_CTL		0xc0010041U
> +#define MSR_K7_FID_VID_STATUS		0xc0010042U
> +#define MSR_K8_PSTATE_LIMIT		0xc0010061U
> +#define MSR_K8_PSTATE_CTRL		0xc0010062U
> +#define MSR_K8_PSTATE_STATUS		0xc0010063U
> +#define MSR_K8_PSTATE0			0xc0010064U
> +#define MSR_K8_PSTATE1			0xc0010065U
> +#define MSR_K8_PSTATE2			0xc0010066U
> +#define MSR_K8_PSTATE3			0xc0010067U
> +#define MSR_K8_PSTATE4			0xc0010068U
> +#define MSR_K8_PSTATE5			0xc0010069U
> +#define MSR_K8_PSTATE6			0xc001006AU
> +#define MSR_K8_PSTATE7			0xc001006BU
> +#define MSR_K8_ENABLE_C1E		0xc0010055U
> +#define MSR_K8_VM_HSAVE_PA		0xc0010117U
> +
> +#define MSR_AMD_FAM15H_EVNTSEL0		0xc0010200U
> +#define MSR_AMD_FAM15H_PERFCTR0		0xc0010201U
> +#define MSR_AMD_FAM15H_EVNTSEL1		0xc0010202U
> +#define MSR_AMD_FAM15H_PERFCTR1		0xc0010203U
> +#define MSR_AMD_FAM15H_EVNTSEL2		0xc0010204U
> +#define MSR_AMD_FAM15H_PERFCTR2		0xc0010205U
> +#define MSR_AMD_FAM15H_EVNTSEL3		0xc0010206U
> +#define MSR_AMD_FAM15H_PERFCTR3		0xc0010207U
> +#define MSR_AMD_FAM15H_EVNTSEL4		0xc0010208U
> +#define MSR_AMD_FAM15H_PERFCTR4		0xc0010209U
> +#define MSR_AMD_FAM15H_EVNTSEL5		0xc001020aU
> +#define MSR_AMD_FAM15H_PERFCTR5		0xc001020bU
> +
> +#define MSR_AMD_L7S0_FEATURE_MASK	0xc0011002U
> +#define MSR_AMD_THRM_FEATURE_MASK	0xc0011003U
> +#define MSR_K8_FEATURE_MASK			0xc0011004U
> +#define MSR_K8_EXT_FEATURE_MASK		0xc0011005U

Here MSR_K8_FEATURE_MASK has one more tab compared to the original code.
The code style might need adjusting, it can be done on commit.


>  /* AMD64 MSRs */
> -#define MSR_AMD64_NB_CFG		0xc001001f
> +#define MSR_AMD64_NB_CFG		0xc001001fU
>  #define AMD64_NB_CFG_CF8_EXT_ENABLE_BIT	46
> -#define MSR_AMD64_LS_CFG		0xc0011020
> -#define MSR_AMD64_IC_CFG		0xc0011021
> -#define MSR_AMD64_DC_CFG		0xc0011022
> -#define MSR_AMD64_DE_CFG		0xc0011029
> +#define MSR_AMD64_LS_CFG		0xc0011020U
> +#define MSR_AMD64_IC_CFG		0xc0011021U
> +#define MSR_AMD64_DC_CFG		0xc0011022U
> +#define MSR_AMD64_DE_CFG		0xc0011029U
>  #define AMD64_DE_CFG_LFENCE_SERIALISE	(_AC(1, ULL) << 1)
> -#define MSR_AMD64_EX_CFG		0xc001102c
> -#define MSR_AMD64_DE_CFG2		0xc00110e3
> +#define MSR_AMD64_EX_CFG		0xc001102cU
> +#define MSR_AMD64_DE_CFG2		0xc00110e3U
>  
> -#define MSR_AMD64_DR0_ADDRESS_MASK	0xc0011027
> -#define MSR_AMD64_DR1_ADDRESS_MASK	0xc0011019
> -#define MSR_AMD64_DR2_ADDRESS_MASK	0xc001101a
> -#define MSR_AMD64_DR3_ADDRESS_MASK	0xc001101b
> +#define MSR_AMD64_DR0_ADDRESS_MASK	0xc0011027U
> +#define MSR_AMD64_DR1_ADDRESS_MASK	0xc0011019U
> +#define MSR_AMD64_DR2_ADDRESS_MASK	0xc001101aU
> +#define MSR_AMD64_DR3_ADDRESS_MASK	0xc001101bU
>  
>  /* AMD Family10h machine check MSRs */
> -#define MSR_F10_MC4_MISC1		0xc0000408
> -#define MSR_F10_MC4_MISC2		0xc0000409
> -#define MSR_F10_MC4_MISC3		0xc000040A
> +#define MSR_F10_MC4_MISC1		0xc0000408U
> +#define MSR_F10_MC4_MISC2		0xc0000409U
> +#define MSR_F10_MC4_MISC3		0xc000040AU
>  
>  /* AMD Family10h Bus Unit MSRs */
> -#define MSR_F10_BU_CFG 		0xc0011023
> -#define MSR_F10_BU_CFG2		0xc001102a
> +#define MSR_F10_BU_CFG 		0xc0011023U
> +#define MSR_F10_BU_CFG2		0xc001102aU
>  
>  /* Other AMD Fam10h MSRs */
> -#define MSR_FAM10H_MMIO_CONF_BASE	0xc0010058
> +#define MSR_FAM10H_MMIO_CONF_BASE	0xc0010058U
>  #define FAM10H_MMIO_CONF_ENABLE         (1<<0)
>  #define FAM10H_MMIO_CONF_BUSRANGE_MASK	0xf
>  #define FAM10H_MMIO_CONF_BUSRANGE_SHIFT 2
> @@ -410,31 +410,31 @@
>  
>  /* AMD Microcode MSRs */
>  #define MSR_AMD_PATCHLEVEL		0x0000008b
> -#define MSR_AMD_PATCHLOADER		0xc0010020
> +#define MSR_AMD_PATCHLOADER		0xc0010020U
>  
>  /* AMD TSC RATE MSR */
> -#define MSR_AMD64_TSC_RATIO		0xc0000104
> +#define MSR_AMD64_TSC_RATIO		0xc0000104U
>  
>  /* AMD Lightweight Profiling MSRs */
> -#define MSR_AMD64_LWP_CFG		0xc0000105
> -#define MSR_AMD64_LWP_CBADDR		0xc0000106
> +#define MSR_AMD64_LWP_CFG		0xc0000105U
> +#define MSR_AMD64_LWP_CBADDR		0xc0000106U
>  
>  /* AMD OS Visible Workaround MSRs */
> -#define MSR_AMD_OSVW_ID_LENGTH          0xc0010140
> -#define MSR_AMD_OSVW_STATUS             0xc0010141
> +#define MSR_AMD_OSVW_ID_LENGTH          0xc0010140U
> +#define MSR_AMD_OSVW_STATUS             0xc0010141U
>  
>  /* AMD Protected Processor Inventory Number */
> -#define MSR_AMD_PPIN_CTL                0xc00102f0
> -#define MSR_AMD_PPIN                    0xc00102f1
> +#define MSR_AMD_PPIN_CTL                0xc00102f0U
> +#define MSR_AMD_PPIN                    0xc00102f1U
>  
>  /* K6 MSRs */
> -#define MSR_K6_EFER			0xc0000080
> -#define MSR_K6_STAR			0xc0000081
> -#define MSR_K6_WHCR			0xc0000082
> -#define MSR_K6_UWCCR			0xc0000085
> -#define MSR_K6_EPMR			0xc0000086
> -#define MSR_K6_PSOR			0xc0000087
> -#define MSR_K6_PFIR			0xc0000088
> +#define MSR_K6_EFER			0xc0000080U
> +#define MSR_K6_STAR			0xc0000081U
> +#define MSR_K6_WHCR			0xc0000082U
> +#define MSR_K6_UWCCR			0xc0000085U
> +#define MSR_K6_EPMR			0xc0000086U
> +#define MSR_K6_PSOR			0xc0000087U
> +#define MSR_K6_PFIR			0xc0000088U
>  
>  /* Centaur-Hauls/IDT defined MSRs. */
>  #define MSR_IDT_FCR1			0x00000107
> @@ -459,10 +459,10 @@
>  #define MSR_VIA_BCR2			0x00001147
>  
>  /* Transmeta defined MSRs */
> -#define MSR_TMTA_LONGRUN_CTRL		0x80868010
> -#define MSR_TMTA_LONGRUN_FLAGS		0x80868011
> -#define MSR_TMTA_LRTI_READOUT		0x80868018
> -#define MSR_TMTA_LRTI_VOLT_MHZ		0x8086801a
> +#define MSR_TMTA_LONGRUN_CTRL		0x80868010U
> +#define MSR_TMTA_LONGRUN_FLAGS		0x80868011U
> +#define MSR_TMTA_LRTI_READOUT		0x80868018U
> +#define MSR_TMTA_LRTI_VOLT_MHZ		0x8086801aU
>  
>  /* Intel defined MSRs. */
>  #define MSR_IA32_P5_MC_ADDR		0x00000000

[...]

> diff --git a/xen/arch/x86/percpu.c b/xen/arch/x86/percpu.c
> index 288050cdba..1ebeb65ad6 100644
> --- a/xen/arch/x86/percpu.c
> +++ b/xen/arch/x86/percpu.c
> @@ -12,7 +12,7 @@ unsigned long __per_cpu_offset[NR_CPUS];
>   * possible #PF at (NULL + a little) which has security implications in the
>   * context of PV guests.
>   */
> -#define INVALID_PERCPU_AREA (0x8000000000000000L - (long)__per_cpu_start)
> +#define INVALID_PERCPU_AREA (0x8000000000000000UL - (long)__per_cpu_start)
>  #define PERCPU_ORDER get_order_from_bytes(__per_cpu_data_end - __per_cpu_start)
>  
>  void __init percpu_init_areas(void)

Also here about 64-bit values

