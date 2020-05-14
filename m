Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2521D30CA
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 15:13:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZDfe-0001TE-MG; Thu, 14 May 2020 13:13:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=otfA=64=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZDfc-0001T6-U5
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 13:13:04 +0000
X-Inumbo-ID: a45ea942-95e4-11ea-a488-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a45ea942-95e4-11ea-a488-12813bfff9fa;
 Thu, 14 May 2020 13:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589461984;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=I8mMmrF+qm0DEtB94xHFQ4tMx6KQHhhEyszNspZA9N0=;
 b=PXzq6/gkGe7OP3+E/10MX5CLXDuO3PlcnQD1yRuOcbY0xv+ejQgeCJfO
 hIob3p1jGDSrbrKbslAUUDGYeWdsc61JZjfMKkNbj0YazTWducZlEEmXm
 LSso3emX8yYs2+3Xopzj44njHAGbIMIv5qkI8aFAfcDNgIL0QsQhJp4uc s=;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: AzzTz93Kmq181XKT+Su2ppDGyCP4BXnbJqVuyBja+Jyr7IMp0kYVYanQu7bSfkTqjHszx/x27z
 r518t8q97/2q2v7rQ2yJ5DuwMUa6YWfi7HBB8CpfiIFVI9qHiTPw01ex7iffA5UHw+o8LGKBle
 TVtsfEv3FUSHyDXwjCwK4jnCrd+fRYLendnF9PxeKL8X4lYuEgZskbHh2D730qbBlBUNzzjJze
 //BR5qhLRp1nyKF0AhbNTFRLKm64tGWhVXG6xFQqQ7Jy88naJVitK5tl7ybUS7LhKRtawV0/qK
 9mo=
X-SBRS: 2.7
X-MesageID: 17517364
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,391,1583211600"; d="scan'208";a="17517364"
Date: Thu, 14 May 2020 15:12:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 4/4] x86/APIC: restrict certain messages to BSP
Message-ID: <20200514131255.GC54375@Air-de-Roger>
References: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
 <513e4f93-a8a0-ae72-abcc-aa28531eca97@suse.com>
 <20200514100145.GA54375@Air-de-Roger>
 <c4ac126d-6f37-4c93-7189-35128bcd3e04@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4ac126d-6f37-4c93-7189-35128bcd3e04@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 14, 2020 at 02:31:33PM +0200, Jan Beulich wrote:
> On 14.05.2020 12:01, Roger Pau Monné wrote:
> > On Fri, Mar 13, 2020 at 10:26:47AM +0100, Jan Beulich wrote:
> >> --- a/xen/arch/x86/apic.c
> >> +++ b/xen/arch/x86/apic.c
> >> @@ -499,7 +499,7 @@ static void resume_x2apic(void)
> >>      __enable_x2apic();
> >>  }
> >>  
> >> -void setup_local_APIC(void)
> >> +void setup_local_APIC(bool bsp)
> >>  {
> >>      unsigned long oldvalue, value, maxlvt;
> >>      int i, j;
> >> @@ -598,8 +598,8 @@ void setup_local_APIC(void)
> >>      if ( directed_eoi_enabled )
> >>      {
> >>          value |= APIC_SPIV_DIRECTED_EOI;
> >> -        apic_printk(APIC_VERBOSE, "Suppress EOI broadcast on CPU#%d\n",
> >> -                    smp_processor_id());
> >> +        if ( bsp )
> >> +            apic_printk(APIC_VERBOSE, "Suppressing EOI broadcast\n");
> >>      }
> >>  
> >>      apic_write(APIC_SPIV, value);
> >> @@ -615,21 +615,22 @@ void setup_local_APIC(void)
> >>       * TODO: set up through-local-APIC from through-I/O-APIC? --macro
> >>       */
> >>      value = apic_read(APIC_LVT0) & APIC_LVT_MASKED;
> >> -    if (!smp_processor_id() && (pic_mode || !value)) {
> >> +    if (bsp && (pic_mode || !value)) {
> >>          value = APIC_DM_EXTINT;
> >>          apic_printk(APIC_VERBOSE, "enabled ExtINT on CPU#%d\n",
> >>                      smp_processor_id());
> >>      } else {
> >>          value = APIC_DM_EXTINT | APIC_LVT_MASKED;
> >> -        apic_printk(APIC_VERBOSE, "masked ExtINT on CPU#%d\n",
> >> -                    smp_processor_id());
> >> +        if (bsp)
> >> +            apic_printk(APIC_VERBOSE, "masked ExtINT on CPU#%d\n",
> >> +                        smp_processor_id());
> > 
> > You might want to also drop the CPU#%d from the above messages, since
> > they would only be printed for the BSP.
> 
> I want to specifically keep them, so that once (if ever) we introduce
> hot-unplug support for the BSP, the same or similar messages can be
> used and matched against earlier ones in the log.
> 
> >>      }
> >>      apic_write(APIC_LVT0, value);
> >>  
> >>      /*
> >>       * only the BP should see the LINT1 NMI signal, obviously.
> >>       */
> >> -    if (!smp_processor_id())
> >> +    if (bsp)
> >>          value = APIC_DM_NMI;
> >>      else
> >>          value = APIC_DM_NMI | APIC_LVT_MASKED;
> > 
> > This would be shorter as:
> > 
> > value = APIC_DM_NMI | (bsp ? 0 : APIC_LVT_MASKED);
> 
> Indeed, at the expense of larger code churn. Seems like an at least
> partially unrelated change to me (at risk of obscuring the actual
> purpose of the change here).

FTR, I'm happy with both of the above and my RB stands.

Roger.

