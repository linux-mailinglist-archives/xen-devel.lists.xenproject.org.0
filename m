Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B10C210893
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 11:50:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqZNC-0006TH-Fl; Wed, 01 Jul 2020 09:49:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4aC=AM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jqZNB-0006TC-FE
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 09:49:45 +0000
X-Inumbo-ID: 30e13f90-bb80-11ea-b7bb-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30e13f90-bb80-11ea-b7bb-bc764e2007e4;
 Wed, 01 Jul 2020 09:49:44 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 8NjfsZi9mpxIgJgtsrk9zDhCrFEyJe8Ljy5xso3uZS9HpODYUo1U9AlaoS3FgRi6gFPUO52Q6V
 IJ1UQwZg3ENv/ss6jlLgmJ1ovuu3RwZ5IyMikQ84n+LO6xb33IjSjsJncBVhvLWhr3V090XViI
 XErI8005NLcLSD2pBq8lDsP9Vl8jqOLGPMufwrdpW06Dd9QfI6OutmVceEf9zk7arrSg9pcu1v
 YsEuPd8yVbmYTkO4UQ3Y1ahH2pJswdjSMdQLqsqeIXyU2RB48/A8s8HIaqNv+rABHgd346JClF
 FCM=
X-SBRS: 2.7
X-MesageID: 21688457
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,299,1589256000"; d="scan'208";a="21688457"
Date: Wed, 1 Jul 2020 11:49:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v4 02/10] x86/vmx: add IPT cpu feature
Message-ID: <20200701094935.GO735@Air-de-Roger>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <7302dbfcd07dfaad9e50bb772673e588fcc4de67.1593519420.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7302dbfcd07dfaad9e50bb772673e588fcc4de67.1593519420.git.michal.leszczynski@cert.pl>
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
Cc: Julien Grall <julien@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 30, 2020 at 02:33:45PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Check if Intel Processor Trace feature is supported by current
> processor. Define vmtrace_supported global variable.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  xen/arch/x86/hvm/vmx/vmcs.c                 | 7 ++++++-
>  xen/common/domain.c                         | 2 ++
>  xen/include/asm-x86/cpufeature.h            | 1 +
>  xen/include/asm-x86/hvm/vmx/vmcs.h          | 1 +
>  xen/include/public/arch-x86/cpufeatureset.h | 1 +
>  xen/include/xen/domain.h                    | 2 ++
>  6 files changed, 13 insertions(+), 1 deletion(-)
> 
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

This function gets called for every CPU that's brought up, so you need
to set it on the BSP, and then check that the APs also support the
feature or else fail to bring them up AFAICT. If not you could end up
with a non working system.

I agree it's very unlikely to boot on a system with such differences
between CPUs, but better be safe than sorry.

> +
>      if ( _vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS )
>      {
>          min = 0;
> @@ -305,7 +311,6 @@ static int vmx_init_vmcs_config(void)
>                 SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS |
>                 SECONDARY_EXEC_XSAVES |
>                 SECONDARY_EXEC_TSC_SCALING);
> -        rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
>          if ( _vmx_misc_cap & VMX_MISC_VMWRITE_ALL )
>              opt |= SECONDARY_EXEC_ENABLE_VMCS_SHADOWING;
>          if ( opt_vpid_enabled )
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 7cc9526139..0a33e0dfd6 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -82,6 +82,8 @@ struct vcpu *idle_vcpu[NR_CPUS] __read_mostly;
>  
>  vcpu_info_t dummy_vcpu_info;
>  
> +bool_t vmtrace_supported;

Plain bool, and I think it wants to be __read_mostly.

I'm also unsure whether this is the best place to put such variable,
since there are no users introduced on this patch it's hard to tell.

Thanks, Roger.

