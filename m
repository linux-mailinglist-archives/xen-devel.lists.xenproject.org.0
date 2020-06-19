Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3AD200A8A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 15:45:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmHKI-0002s2-CH; Fri, 19 Jun 2020 13:45:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z6Go=AA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jmHKG-0002rx-LW
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 13:45:00 +0000
X-Inumbo-ID: 117e380c-b233-11ea-bb81-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 117e380c-b233-11ea-bb81-12813bfff9fa;
 Fri, 19 Jun 2020 13:44:59 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: KCqsDXjhRe6xidaxQhUBWEa+7/hyWKSHLXgGmWKv2u7PUEIfdUZJxINcBRV6PgS8bmtqfUaJVi
 fGmahqMyCXLslVSlUpfgFLoTHWM8fPrK1vvMiQ7xisRkL2AQ3Ec3KPuYPsaVu021ixaGYqv/7c
 bsl/biUGzJeJfcVwMxRL6w6cGsfBHnHST6JR71z56ReYz8wmEn6ks9+yulrh3wbh5lGmB4daGh
 EB4niZ7Zb68WNHYcFHPgTBXiZIcLSV2pcMyJaeKI2KdSmZARHTW/Rg/sMH4HcrQXP/sDngoX1z
 6qM=
X-SBRS: 2.7
X-MesageID: 20696736
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,255,1589256000"; d="scan'208";a="20696736"
Date: Fri, 19 Jun 2020 15:44:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v2 3/7] x86/vmx: add IPT cpu feature
Message-ID: <20200619134452.GA735@Air-de-Roger>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <626789888.9820937.1592523621821.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <626789888.9820937.1592523621821.JavaMail.zimbra@cert.pl>
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
Cc: Kevin Tian <kevin.tian@intel.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 19, 2020 at 01:40:21AM +0200, Michał Leszczyński wrote:
> Check if Intel Processor Trace feature is supported by current
> processor. Define hvm_ipt_supported function.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---

We usually keep a shirt list of the changes between versions, so it's
easier for the reviewers to know what changed. As an example:

https://lore.kernel.org/xen-devel/20200613184132.11880-1-julien@xen.org/

>  xen/arch/x86/hvm/vmx/vmcs.c                 | 4 ++++
>  xen/include/asm-x86/cpufeature.h            | 1 +
>  xen/include/asm-x86/hvm/hvm.h               | 9 +++++++++
>  xen/include/asm-x86/hvm/vmx/vmcs.h          | 1 +
>  xen/include/public/arch-x86/cpufeatureset.h | 1 +
>  5 files changed, 16 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index ca94c2bedc..8466ccb912 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -315,6 +315,10 @@ static int vmx_init_vmcs_config(void)
>          if ( opt_ept_pml )
>              opt |= SECONDARY_EXEC_ENABLE_PML;
>  
> +        /* Check whether IPT is supported in VMX operation */
> +        hvm_funcs.pt_supported = cpu_has_ipt &&
> +            ( _vmx_misc_cap & VMX_MISC_PT_SUPPORTED );

By the placement of this chunk you are tying IPT support to the
secondary exec availability, but I don't think that's required?

Ie: You should move the read of misc_cap to the top-level of the
function and perform the VMX_MISC_PT_SUPPORTED check there also.

Note that space inside parentheses is only required for conditions of
'if', 'for' and those kind of statements, here it's not required, so
this should be:

    hvm_funcs.pt_supported = cpu_has_ipt &&
                             (_vmx_misc_cap & VMX_MISC_PT_SUPPORTED);

I also think this should look like:

    if ( !smp_processor_id() )
    	hvm_funcs.pt_supported = cpu_has_ipt &&
                                 (_vmx_misc_cap & VMX_MISC_PT_SUPPORTED);
    else if ( hvm_funcs.pt_supported &&
              !(_vmx_misc_cap & VMX_MISC_PT_SUPPORTED) )
    {
        printk("VMX: IPT capabilities fatally differ between CPU%u and CPU0\n",
               smp_processor_id());
        return -EINVAL;
    }


So that you can detect mismatches between CPUs.

Thanks, Roger.

