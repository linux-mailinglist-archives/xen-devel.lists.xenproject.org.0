Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F881197999
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 12:46:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIrta-00025T-9g; Mon, 30 Mar 2020 10:43:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vI0s=5P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jIrtZ-00025O-C7
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 10:43:53 +0000
X-Inumbo-ID: 584925bc-7273-11ea-b58d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 584925bc-7273-11ea-b58d-bc764e2007e4;
 Mon, 30 Mar 2020 10:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585565033;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6aYjMOdrYW8oCum7uOCGjsVjZbIlgiUEektrtNjKxRw=;
 b=bE1FOhpr62Pts6x8AVP3+xKzrZg0ybVZ2K5tZ+FBbdTP+sk7lNcgC3Tl
 BvnVrydjWlS2Qnh+wOKUOV9rJLt5RP81wLpmiFQS+iPukOZQU9o4PmxdH
 CbQQJ6fuD41yUVPHwGQ6qNNTIshjKXDSrH+/xyUWaUAGYGekrxHc7fhqS Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nDksem36UWibo90xN1isF+pdYNMooZ8+gpMoQZ2pj9hthXiQN43JGywm5znI7zdA4+065vt1Zo
 O7fJiDTZaYP4IsTqqpwAxnAUQfZ7uLNulOO3M/J4GfvpOJe8b+gTX5MCvnHWuzs+UaCR3g+pNT
 1yp13Qk7pQm4JaS1UNrG7EGpAjTc5qL1Z8LlFEecxQ7EkIx74Z4cLeYDH2AFj9D6rFOSitcSA1
 j5P5txDYZnZOJw6WGd+CymKotdHjiMgR0IU5xrEytLU0N7QDyf/rEYChc5j2LYXr7n+kE4CA3J
 MLs=
X-SBRS: 2.7
X-MesageID: 15068125
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,324,1580792400"; d="scan'208";a="15068125"
Date: Mon, 30 Mar 2020 12:43:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200330104344.GR28601@Air-de-Roger>
References: <20200327190546.21580-1-julien@xen.org>
 <20200327190546.21580-4-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200327190546.21580-4-julien@xen.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/3] xen/x86: ioapic: Simplify ioapic_init()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, Wei
 Liu <wl@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Mar 27, 2020 at 07:05:46PM +0000, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Since commit 9facd54a45 "x86/ioapic: Add register level checks to detect
> bogus io-apic entries", Xen is able to cope with IO APICs not mapped in
> the fixmap.
> 
> Therefore the whole logic to allocate a fake page for some IO APICs is
> unnecessary.
> 
> With the logic removed, the code can be simplified a lot as we don't
> need to go through all the IO APIC if SMP has not been detected or a
> bogus zero IO-APIC address has been detected.
> 
> To avoid another level of tabulation, the simplification is now moved in
> its own function.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/x86/io_apic.c | 63 ++++++++++++++++++++----------------------
>  1 file changed, 30 insertions(+), 33 deletions(-)
> 
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index 9a11ee8342..3d52e4daf1 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -2537,34 +2537,25 @@ static __init bool bad_ioapic_register(unsigned int idx)
>      return false;
>  }
>  
> -void __init init_ioapic(void)
> +static void __init init_ioapic_mappings(void)

Likewise my comment in 2/3 I would name this ioapic_init_mappings.

>  {
> -    unsigned long ioapic_phys;
>      unsigned int i, idx = FIX_IO_APIC_BASE_0;
> -    union IO_APIC_reg_01 reg_01;
>  
> -    if ( smp_found_config )
> -        nr_irqs_gsi = 0;
>      for ( i = 0; i < nr_ioapics; i++ )
>      {
> -        if ( smp_found_config )
> -        {
> -            ioapic_phys = mp_ioapics[i].mpc_apicaddr;
> -            if ( !ioapic_phys )
> -            {
> -                printk(KERN_ERR "WARNING: bogus zero IO-APIC address "
> -                       "found in MPTABLE, disabling IO/APIC support!\n");
> -                smp_found_config = false;
> -                skip_ioapic_setup = true;
> -                goto fake_ioapic_page;
> -            }
> -        }
> -        else
> +        union IO_APIC_reg_01 reg_01;
> +        unsigned long ioapic_phys = mp_ioapics[i].mpc_apicaddr;

Nit: paddr_t might be better here.

Thanks, Roger.

