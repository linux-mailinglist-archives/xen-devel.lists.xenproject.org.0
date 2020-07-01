Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0161E211543
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 23:43:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqkVi-0004Pw-76; Wed, 01 Jul 2020 21:43:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xe6U=AM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jqkVg-0004Pr-UW
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 21:43:16 +0000
X-Inumbo-ID: de9b5ba8-bbe3-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de9b5ba8-bbe3-11ea-bb8b-bc764e2007e4;
 Wed, 01 Jul 2020 21:43:16 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: xvQpnHoUKgxp7zPk6oTWRD8nXqjtMm8m3ejkiJXVQ5jCQmiYJLmjpvOptimV8ebvooDOn0KEdV
 UT8S6vdflilJ9d3ueBWmJJsVsI5J5RAcgBwvtmj0i7afgtJkCFEikz6IL9t9TDVh1T/+RQ6dIu
 POWHUBSA3PvJaa9PFZwdxatVp0sAGEEPT5znYJhxPavPFNTI1biKUsmoZryvVuJtjhQx1rZuoq
 c07MFEdH+HinR1C0FmVnf7B/2qqDUiqkWsUmiUY69GBm4zDDc0ic6DxeUTq7d0HVGHp9HbP8sy
 l5A=
X-SBRS: 2.7
X-MesageID: 21431194
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,301,1589256000"; d="scan'208";a="21431194"
Subject: Re: [PATCH v4 02/10] x86/vmx: add IPT cpu feature
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 <xen-devel@lists.xenproject.org>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <7302dbfcd07dfaad9e50bb772673e588fcc4de67.1593519420.git.michal.leszczynski@cert.pl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f935f7f0-30e4-4ba2-588f-a8368a7b93b1@citrix.com>
Date: Wed, 1 Jul 2020 22:42:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7302dbfcd07dfaad9e50bb772673e588fcc4de67.1593519420.git.michal.leszczynski@cert.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Julien Grall <julien@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano
 Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 luwei.kang@intel.com, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30/06/2020 13:33, Michał Leszczyński wrote:
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index ca94c2bedc..b73d824357 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -291,6 +291,12 @@ static int vmx_init_vmcs_config(void)
>          _vmx_cpu_based_exec_control &=
>              ~(CPU_BASED_CR8_LOAD_EXITING | CPU_BASED_CR8_STORE_EXITING);
>  
> +    rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
> +
> +    /* Check whether IPT is supported in VMX operation. */
> +    vmtrace_supported = cpu_has_ipt &&
> +                        (_vmx_misc_cap & VMX_MISC_PT_SUPPORTED);

There is a subtle corner case here.  vmx_init_vmcs_config() is called on
all CPUs, and is supposed to level things down safely if we find any
asymmetry.

If instead you go with something like this:

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index b73d824357..6960109183 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -294,8 +294,8 @@ static int vmx_init_vmcs_config(void)
     rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
 
     /* Check whether IPT is supported in VMX operation. */
-    vmtrace_supported = cpu_has_ipt &&
-                        (_vmx_misc_cap & VMX_MISC_PT_SUPPORTED);
+    if ( !(_vmx_misc_cap & VMX_MISC_PT_SUPPORTED) )
+        vmtrace_supported = false;
 
     if ( _vmx_cpu_based_exec_control &
CPU_BASED_ACTIVATE_SECONDARY_CONTROLS )
     {
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index c9b6af826d..9d7822e006 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1092,6 +1092,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 #endif
     }
 
+    /* Set a default for VMTrace before HVM setup occurs. */
+    vmtrace_supported = cpu_has_ipt;
+
     /* Sanitise the raw E820 map to produce a final clean version. */
     max_page = raw_max_page = init_e820(memmap_type, &e820_raw);
 

Then you'll also get a vmtrace_supported=true which works correctly in
the Broadwell and no-VT-x case as well.


> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 7cc9526139..0a33e0dfd6 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -82,6 +82,8 @@ struct vcpu *idle_vcpu[NR_CPUS] __read_mostly;
>  
>  vcpu_info_t dummy_vcpu_info;
>  
> +bool_t vmtrace_supported;

bool please.  We're in the process of converting over to C99 bools, and
objection was taken to a tree-wide cleanup.

> +
>  static void __domain_finalise_shutdown(struct domain *d)
>  {
>      struct vcpu *v;
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
> diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h b/xen/include/asm-x86/hvm/vmx/vmcs.h
> index 906810592f..0e9a0b8de6 100644
> --- a/xen/include/asm-x86/hvm/vmx/vmcs.h
> +++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
> @@ -283,6 +283,7 @@ extern u32 vmx_secondary_exec_control;
>  #define VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 0x80000000000ULL
>  extern u64 vmx_ept_vpid_cap;
>  
> +#define VMX_MISC_PT_SUPPORTED                   0x00004000

VMX_MISC_PROC_TRACE, and ...

>  #define VMX_MISC_CR3_TARGET                     0x01ff0000
>  #define VMX_MISC_VMWRITE_ALL                    0x20000000
>  
> diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
> index 5ca35d9d97..0d3f15f628 100644
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -217,6 +217,7 @@ XEN_CPUFEATURE(SMAP,          5*32+20) /*S  Supervisor Mode Access Prevention */
>  XEN_CPUFEATURE(AVX512_IFMA,   5*32+21) /*A  AVX-512 Integer Fused Multiply Add */
>  XEN_CPUFEATURE(CLFLUSHOPT,    5*32+23) /*A  CLFLUSHOPT instruction */
>  XEN_CPUFEATURE(CLWB,          5*32+24) /*A  CLWB instruction */
> +XEN_CPUFEATURE(IPT,           5*32+25) /*   Intel Processor Trace */

.. any chance we can spell this out as PROC_TRACE?  The "Intel" part
won't be true if any of the other vendors choose to implement this
interface to the spec.

Otherwise, LGTM.

~Andrew

