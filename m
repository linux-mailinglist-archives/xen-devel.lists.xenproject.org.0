Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD0A2485A9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 15:08:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k81Lu-0004Qh-Mw; Tue, 18 Aug 2020 13:08:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SD0B=B4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k81Lt-0004Qa-4i
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 13:08:33 +0000
X-Inumbo-ID: e703b686-897c-4224-8030-c16672f9da22
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e703b686-897c-4224-8030-c16672f9da22;
 Tue, 18 Aug 2020 13:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597756113;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BJ/0nxcmUSnSgxC7wB7bbUbywmwMXj/W0lMIWlXiOKo=;
 b=AhvG9sBy0+p82PIfnB1HUp28vVs2ADWQuqwIb63uVfzZFbomalhN1q4L
 Cl5SfUIdjFk6CD6SYNwwriAFBh2qtnO9xNwonAbV9xi24Kzxk5Px3urXY
 UH8KwMa0AGkvH0P81PycozlfHirBvbCo4vQX9j69lVaLczf6Xe+0Ymm18 k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ZiW0sGyIgft7siE2qHgi+ljMSNJjuM41aahUjTvYJQy8wqtimGKRICAOrBVA/5C9GaP3jtFzsd
 IYXtYnwh8+gmUiIgUdu9VXegvVnV2VY01hCyuwlwxFbh9yJh0W7qOxc8acrKCmeJ6HooHlkX/1
 pI8pYdhjsNT4doiSRBDy1ErDjrdkiDTW8b7/V4cF/s1+/v3iJTtEVu6AI21L26laMyTF5WD1YQ
 Zon9GahwN3vZeQGK5RKVly3dhBZ9lb8lB8EW1pAtTbNeUiYw5JM8LOzsnjQZ1hV4O7huSsd//7
 oiA=
X-SBRS: 2.7
X-MesageID: 24780770
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="24780770"
Date: Tue, 18 Aug 2020 15:08:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@citrix.com>, "Julien
 Grall" <julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>
Subject: Re: [PATCH v2 7/7] x86: don't include domctl and alike in
 shim-exclusive builds
Message-ID: <20200818130824.GM828@Air-de-Roger>
References: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
 <be0dbe7b-3feb-1a5b-b523-2293a7442707@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be0dbe7b-3feb-1a5b-b523-2293a7442707@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Aug 07, 2020 at 01:35:08PM +0200, Jan Beulich wrote:
> There is no need for platform-wide, system-wide, or per-domain control
> in this case. Hence avoid including this dead code in the build.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

One comment below.

> 
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -23,7 +23,6 @@ obj-$(CONFIG_GDBSX) += debug.o
>  obj-y += delay.o
>  obj-y += desc.o
>  obj-bin-y += dmi_scan.init.o
> -obj-y += domctl.o
>  obj-y += domain.o
>  obj-bin-y += dom0_build.init.o
>  obj-y += domain_page.o
> @@ -51,7 +50,6 @@ obj-y += numa.o
>  obj-y += pci.o
>  obj-y += percpu.o
>  obj-y += physdev.o x86_64/physdev.o
> -obj-y += platform_hypercall.o x86_64/platform_hypercall.o
>  obj-y += psr.o
>  obj-y += setup.o
>  obj-y += shutdown.o
> @@ -60,7 +58,6 @@ obj-y += smpboot.o
>  obj-y += spec_ctrl.o
>  obj-y += srat.o
>  obj-y += string.o
> -obj-y += sysctl.o
>  obj-y += time.o
>  obj-y += trace.o
>  obj-y += traps.o
> @@ -71,6 +68,13 @@ obj-$(CONFIG_TBOOT) += tboot.o
>  obj-y += hpet.o
>  obj-y += vm_event.o
>  obj-y += xstate.o
> +
> +ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
> +obj-y += domctl.o
> +obj-y += platform_hypercall.o x86_64/platform_hypercall.o
> +obj-y += sysctl.o
> +endif
> +
>  extra-y += asm-macros.i
>  
>  ifneq ($(CONFIG_HVM),y)
> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -47,6 +47,8 @@
>  /* Per-CPU variable for enforcing the lock ordering */
>  DEFINE_PER_CPU(int, mm_lock_level);
>  
> +#ifndef CONFIG_PV_SHIM_EXCLUSIVE
> +
>  /************************************************/
>  /*              LOG DIRTY SUPPORT               */
>  /************************************************/
> @@ -628,6 +630,8 @@ void paging_log_dirty_init(struct domain
>      d->arch.paging.log_dirty.ops = ops;
>  }
>  
> +#endif /* CONFIG_PV_SHIM_EXCLUSIVE */
> +
>  /************************************************/
>  /*           CODE FOR PAGING SUPPORT            */
>  /************************************************/
> @@ -667,7 +671,7 @@ void paging_vcpu_init(struct vcpu *v)
>          shadow_vcpu_init(v);
>  }
>  
> -
> +#ifndef CONFIG_PV_SHIM_EXCLUSIVE
>  int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
>                    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl,
>                    bool_t resuming)
> @@ -788,6 +792,7 @@ long paging_domctl_continuation(XEN_GUES
>  
>      return ret;
>  }
> +#endif /* CONFIG_PV_SHIM_EXCLUSIVE */
>  
>  /* Call when destroying a domain */
>  int paging_teardown(struct domain *d)
> @@ -803,10 +808,12 @@ int paging_teardown(struct domain *d)
>      if ( preempted )
>          return -ERESTART;
>  
> +#ifndef CONFIG_PV_SHIM_EXCLUSIVE
>      /* clean up log dirty resources. */
>      rc = paging_free_log_dirty_bitmap(d, 0);
>      if ( rc == -ERESTART )
>          return rc;
> +#endif

Adding all this ifndefs make the code worse IMO, is it really that much
of a win in terms of size?

TBH I'm not sure it's worth it.

Thanks, Roger.

