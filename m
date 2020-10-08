Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADC42870E2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 10:44:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4361.11556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQRWA-0006Ym-Gf; Thu, 08 Oct 2020 08:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4361.11556; Thu, 08 Oct 2020 08:43:18 +0000
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
	id 1kQRWA-0006YQ-DN; Thu, 08 Oct 2020 08:43:18 +0000
Received: by outflank-mailman (input) for mailman id 4361;
 Thu, 08 Oct 2020 08:43:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uUpI=DP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kQRW9-0006YK-E6
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 08:43:17 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa018b75-b839-4962-849f-ef07e73e739a;
 Thu, 08 Oct 2020 08:43:14 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uUpI=DP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kQRW9-0006YK-E6
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 08:43:17 +0000
X-Inumbo-ID: aa018b75-b839-4962-849f-ef07e73e739a
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id aa018b75-b839-4962-849f-ef07e73e739a;
	Thu, 08 Oct 2020 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602146595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hmfaHDqcevzm6TqwFYb1N7ROXvDqhIsFeaUBR+owTgQ=;
  b=Lcgljvm0EehTjS+UgyJWGwCcCnhe3Qk/Am/VjWDXJWkE/Q1UMYJXDHUj
   20atrpLqqeS1BU7k5hiSBA7CGkdKOab0zfrFaAOHTspZJ2sFwWRBWg2WQ
   Sx78JPrFryxDj9FgOMdaeBURgurHcj4h9su949yMF3Hmax+6WfIYkNv+N
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: T00na4NxHkPyH2ebQCtGS8s6trKNpm+AH5Ip44klzrTCr1jYCODX9BhpN80rTcAPeE8rVKFtJd
 LGoOPZzk7VoFShWFTNYzMWGpYjvdnJXIei2/+jHjU36PCI5GiNnWfFbCOA1rkzHwraBlMqXMkh
 2nKCVqmjLV2YGuy479FWHuMNqfS0slh0ydCepFFLXHQI+34ZGJOi5ubUYwej2D6vCFkHjxZFH9
 4LnPPTVUeAK3BEr3Cv3FreH8hjIzwOb1qBLU79cGUg3GC+uJPV5Yhii0875hN0Noc1fMhGqqlZ
 gHw=
X-SBRS: None
X-MesageID: 28888532
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,350,1596513600"; 
   d="scan'208";a="28888532"
Date: Thu, 8 Oct 2020 10:43:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/2] xen/x86: add nmi continuation framework
Message-ID: <20201008084306.GJ19254@Air-de-Roger>
References: <20201007133011.18871-1-jgross@suse.com>
 <20201007133011.18871-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20201007133011.18871-2-jgross@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Oct 07, 2020 at 03:30:10PM +0200, Juergen Gross wrote:
> Actions in NMI context are rather limited as e.g. locking is rather
> fragile.
> 
> Add a generic framework to continue processing in softirq context after
> leaving NMI processing. This is working for NMIs happening in guest
> context as NMI exit handling will issue an IPI to itself in case a
> softirq is pending, resulting in the continuation running before the
> guest gets control again.

There's already kind of a nmi callback framework using nmi_callback.
I assume that moving this existing callback code to be executed in
softirq context is not suitable because that would be past the
execution of an iret instruction?

Might be worth mentioning in the commit message.

> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  xen/arch/x86/traps.c      | 37 +++++++++++++++++++++++++++++++++++++
>  xen/include/asm-x86/nmi.h |  8 +++++++-
>  xen/include/xen/softirq.h |  5 ++++-
>  3 files changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index bc5b8f8ea3..f433fe5acb 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1799,6 +1799,42 @@ void unset_nmi_callback(void)
>      nmi_callback = dummy_nmi_callback;
>  }
>  
> +static DEFINE_PER_CPU(void (*)(void *), nmi_cont_func);
> +static DEFINE_PER_CPU(void *, nmi_cont_par);
> +
> +static void nmi_cont_softirq(void)
> +{
> +    unsigned int cpu = smp_processor_id();
> +    void (*func)(void *par) = per_cpu(nmi_cont_func, cpu);
> +    void *par = per_cpu(nmi_cont_par, cpu);

I think you can use this_cpu here and below, and avoid having to worry
about the processor id at all? Also less likely to mess up and assign
a NMI callback to a wrong CPU.

> +
> +    /* Reads must be done before following write (local cpu ordering only). */
> +    barrier();

Is this added because of the usage of RELOC_HIDE by per_cpu?

> +
> +    per_cpu(nmi_cont_func, cpu) = NULL;

Since we are using RELOC_HIDE, doesn't it imply that the compiler
cannot reorder this, since it has no idea what variable we are
accessing?

> +
> +    if ( func )
> +        func(par);
> +}
> +
> +int set_nmi_continuation(void (*func)(void *par), void *par)
> +{
> +    unsigned int cpu = smp_processor_id();
> +
> +    if ( per_cpu(nmi_cont_func, cpu) )
> +    {
> +        printk("Trying to set NMI continuation while still one active!\n");
> +        return -EBUSY;
> +    }
> +
> +    per_cpu(nmi_cont_func, cpu) = func;
> +    per_cpu(nmi_cont_par, cpu) = par;
> +
> +    raise_softirq(NMI_CONT_SOFTIRQ);
> +
> +    return 0;
> +}
> +
>  void do_device_not_available(struct cpu_user_regs *regs)
>  {
>  #ifdef CONFIG_PV
> @@ -2132,6 +2168,7 @@ void __init trap_init(void)
>  
>      cpu_init();
>  
> +    open_softirq(NMI_CONT_SOFTIRQ, nmi_cont_softirq);
>      open_softirq(PCI_SERR_SOFTIRQ, pci_serr_softirq);
>  }
>  
> diff --git a/xen/include/asm-x86/nmi.h b/xen/include/asm-x86/nmi.h
> index a288f02a50..da40fb6599 100644
> --- a/xen/include/asm-x86/nmi.h
> +++ b/xen/include/asm-x86/nmi.h
> @@ -33,5 +33,11 @@ nmi_callback_t *set_nmi_callback(nmi_callback_t *callback);
>  void unset_nmi_callback(void);
>  
>  DECLARE_PER_CPU(unsigned int, nmi_count);
> - 
> +
> +/**
> + * set_nmi_continuation
> + *
> + * Schedule a function to be started in softirq context after NMI handling.
> + */
> +int set_nmi_continuation(void (*func)(void *par), void *par);

I would introduce a type for the nmi callback, as I think it's easier
than having to retype the prototype everywhere:

typedef void nmi_continuation_t(void *);

Thanks, Roger.

