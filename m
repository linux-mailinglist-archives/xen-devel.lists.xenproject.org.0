Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDB31FBBBD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 18:31:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlETp-0008Fb-2W; Tue, 16 Jun 2020 16:30:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AL9H=75=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlETo-0008FW-15
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 16:30:32 +0000
X-Inumbo-ID: b1f969a6-afee-11ea-b909-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1f969a6-afee-11ea-b909-12813bfff9fa;
 Tue, 16 Jun 2020 16:30:31 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 8WCRVleYSWyRcKCY1Lu4bEIR4oys2xkvQNC+CyZxHm5KCU2azZfZBJQ/a5LazukssAOrrKsLm9
 ELBe3um5vMK4lYK7G1GkWJvV4HR57RxDV07Q6zYoWriynFeaNpEsgQaTFDul+YnusMz42H/zfG
 8gDc9ebGhepyu+kwS7VpIbTxS/VDdNJ+5GRiqWkw19uZT+hzWVanwu58cy4sxauF+2QORLeYV2
 LeJ+0xn2CjaDytv+wnwVtu5E+4Xz6BqV94HWO8+tBvbvt3ySlqBHLTQNon/gG61xViKapM/P54
 2T4=
X-SBRS: 2.7
X-MesageID: 20418132
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20418132"
Date: Tue, 16 Jun 2020 18:30:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v1 2/7] x86/vmx: add IPT cpu feature
Message-ID: <20200616163022.GR735@Air-de-Roger>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <1672321493.8765712.1592320839082.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1672321493.8765712.1592320839082.JavaMail.zimbra@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 16, 2020 at 05:20:39PM +0200, Michał Leszczyński wrote:
> Check if Intel Processor Trace feature is supported by current
> processor. Define hvm_ipt_supported function.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  xen/arch/x86/hvm/vmx/vmx.c                  | 24 +++++++++++++++++++++
>  xen/include/asm-x86/cpufeature.h            |  1 +
>  xen/include/asm-x86/hvm/hvm.h               |  9 ++++++++
>  xen/include/asm-x86/hvm/vmx/vmcs.h          |  1 +
>  xen/include/public/arch-x86/cpufeatureset.h |  1 +
>  5 files changed, 36 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index ab19d9424e..a91bbdb798 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2484,6 +2484,7 @@ static bool __init has_if_pschange_mc(void)
>  
>  const struct hvm_function_table * __init start_vmx(void)
>  {
> +    u64 _vmx_misc_cap;

Please use uint64_t, and you can drop the leading _vmx prefix, this is
already vmx specific. Also add a newline between variable definition
and code.

>      set_in_cr4(X86_CR4_VMXE);
>  
>      if ( vmx_vmcs_init() )
> @@ -2557,6 +2558,29 @@ const struct hvm_function_table * __init start_vmx(void)
>          vmx_function_table.get_guest_bndcfgs = vmx_get_guest_bndcfgs;
>      }
>  
> +    /* Check whether IPT is supported in VMX operation */
> +    vmx_function_table.ipt_supported = 1;
> +
> +    if ( !cpu_has_ipt )
> +    {
> +        vmx_function_table.ipt_supported = 0;
> +        printk("VMX: Missing support for Intel Processor Trace x86 feature.\n");
> +    }
> +
> +    rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
> +
> +    if ( !( _vmx_misc_cap & VMX_MISC_PT_SUPPORTED ) )
> +    {
> +        vmx_function_table.ipt_supported = 0;
> +        printk("VMX: Missing support for Intel Processor Trace in VMX operation, VMX_MISC caps: %llx\n",
> +               (unsigned long long)_vmx_misc_cap);
> +    }
> +
> +    if (vmx_function_table.ipt_supported)
> +    {
> +        printk("VMX: Intel Processor Trace is SUPPORTED");
> +    }

I think you could simplify this as:

vmx_function_table.ipt_supported = cpu_has_ipt &&
                                   (misc_cap & VMX_MISC_PT_SUPPORTED);

Also the code is too chatty IMO.

Looking at how other VMX features are detected, I think you should
move the checks to vmx_init_vmcs_config and set the relevant bits in
the VM control registers that you can then evaluate in
vmx_display_features in order to print if the feature is supported?

> +
>      lbr_tsx_fixup_check();
>      ler_to_fixup_check();
>  
> diff --git a/xen/include/asm-x86/cpufeature.h b/xen/include/asm-x86/cpufeature.h
> index f790d5c1f8..8d7955dd87 100644
> --- a/xen/include/asm-x86/cpufeature.h
> +++ b/xen/include/asm-x86/cpufeature.h
> @@ -104,6 +104,7 @@
>  #define cpu_has_clwb            boot_cpu_has(X86_FEATURE_CLWB)
>  #define cpu_has_avx512er        boot_cpu_has(X86_FEATURE_AVX512ER)
>  #define cpu_has_avx512cd        boot_cpu_has(X86_FEATURE_AVX512CD)
> +#define cpu_has_ipt             boot_cpu_has(X86_FEATURE_IPT)
>  #define cpu_has_sha             boot_cpu_has(X86_FEATURE_SHA)
>  #define cpu_has_avx512bw        boot_cpu_has(X86_FEATURE_AVX512BW)
>  #define cpu_has_avx512vl        boot_cpu_has(X86_FEATURE_AVX512VL)
> diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
> index 1eb377dd82..48465b6067 100644
> --- a/xen/include/asm-x86/hvm/hvm.h
> +++ b/xen/include/asm-x86/hvm/hvm.h
> @@ -96,6 +96,9 @@ struct hvm_function_table {
>      /* Necessary hardware support for alternate p2m's? */
>      bool altp2m_supported;
>  
> +    /* Hardware support for IPT? */
> +    bool ipt_supported;

We might want to name this pt_supported, since it's possible for other
vendors to also introduce a processor tracing feature in the future?

Thanks, Roger.

