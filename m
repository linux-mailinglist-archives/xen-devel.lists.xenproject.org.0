Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B85211DC7
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 10:11:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jquIj-0002Rr-S3; Thu, 02 Jul 2020 08:10:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJZC=AN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jquIi-0002Rm-S8
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 08:10:32 +0000
X-Inumbo-ID: 7f471784-bc3b-11ea-8496-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f471784-bc3b-11ea-8496-bc764e2007e4;
 Thu, 02 Jul 2020 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1593677432;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nS9CkHDvm9Fd6ZbiOp3GcRc8ExkVZjAsRFvovRVDDE8=;
 b=h8gwMFfKAb3TYkH2G2MF+P+PJKeepu0YpQ7Az7IEwy6U6eXebJlGFHhh
 Qsqua77/rJ215hnW/0P3JhfkSR8NGEFctUWKzOcUlBRlXOgwF5hiP2MkK
 Jpn6sC5G+8tuuFj/CKCv4sWWJm3EAu8vN6brlpG52+11iiB/VAdkRS5Fy Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 8IEfGUwlmj4dBqs+N+FL6caDZBkh0i6YEWCC/Zkbo6ZYTNxtuM7+zPewuWwSuJNsU87AeWfKTz
 ipTegCxhYT/v1Iv/Rm3trXIRO8PgABHJh0FeO3f+QHW/Ekm4hanH/9SBz4FVgYSy6FZOQXek/a
 iQ+gA2nqJBJV8iFlyZ+DXNb5uug0ZQWCRHdB7B/s9hgHpLdY8VsI8VXpWjiQODjqwqBwYU7Orv
 YPh7wOUWhXgfP01dNatS2jDLVg5oPf3p00rykf6jd3lNce03rMjD0Vziwj0stwTGzq6fNHCxrj
 t5o=
X-SBRS: 2.7
X-MesageID: 21458305
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,303,1589256000"; d="scan'208";a="21458305"
Date: Thu, 2 Jul 2020 10:10:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 02/10] x86/vmx: add IPT cpu feature
Message-ID: <20200702081020.GW735@Air-de-Roger>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <7302dbfcd07dfaad9e50bb772673e588fcc4de67.1593519420.git.michal.leszczynski@cert.pl>
 <f935f7f0-30e4-4ba2-588f-a8368a7b93b1@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f935f7f0-30e4-4ba2-588f-a8368a7b93b1@citrix.com>
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
Cc: Julien Grall <julien@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano
 Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 01, 2020 at 10:42:55PM +0100, Andrew Cooper wrote:
> On 30/06/2020 13:33, Michał Leszczyński wrote:
> > diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> > index ca94c2bedc..b73d824357 100644
> > --- a/xen/arch/x86/hvm/vmx/vmcs.c
> > +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> > @@ -291,6 +291,12 @@ static int vmx_init_vmcs_config(void)
> >          _vmx_cpu_based_exec_control &=
> >              ~(CPU_BASED_CR8_LOAD_EXITING | CPU_BASED_CR8_STORE_EXITING);
> >  
> > +    rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
> > +
> > +    /* Check whether IPT is supported in VMX operation. */
> > +    vmtrace_supported = cpu_has_ipt &&
> > +                        (_vmx_misc_cap & VMX_MISC_PT_SUPPORTED);
> 
> There is a subtle corner case here.  vmx_init_vmcs_config() is called on
> all CPUs, and is supposed to level things down safely if we find any
> asymmetry.
> 
> If instead you go with something like this:
> 
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index b73d824357..6960109183 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -294,8 +294,8 @@ static int vmx_init_vmcs_config(void)
>      rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
>  
>      /* Check whether IPT is supported in VMX operation. */
> -    vmtrace_supported = cpu_has_ipt &&
> -                        (_vmx_misc_cap & VMX_MISC_PT_SUPPORTED);
> +    if ( !(_vmx_misc_cap & VMX_MISC_PT_SUPPORTED) )
> +        vmtrace_supported = false;

This is also used during hotplug, so I'm not sure it's safe to turn
vmtrace_supported off during runtime, where VMs might be already using
it. IMO it would be easier to just set it on the BSP, and then refuse
to bring up any AP that doesn't have the feature. TBH I don't think we
are likely to find any system with such configuration, but seems more
robust than changing vmtrace_supported at runtime.

Roger.

