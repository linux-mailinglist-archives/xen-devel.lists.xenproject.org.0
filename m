Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C015D1CDD57
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 16:35:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY9Wa-0002BA-Mz; Mon, 11 May 2020 14:35:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AmMB=6Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jY9WZ-0002B4-3J
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 14:35:19 +0000
X-Inumbo-ID: a1a37b14-9394-11ea-a218-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1a37b14-9394-11ea-a218-12813bfff9fa;
 Mon, 11 May 2020 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589207718;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+fKZx7eXtkts7N/PkZvF7HfM4waLmeva/WULtQOP5y8=;
 b=faK28273DUpRww7yYYgbNr/k9aQ2+/WroQN0DIbikWRXoqlSthJfFGmE
 mJFNF/P/33vND3gz2WKx69Um21YBgmfiL67ciRmgSSR+GO3dzO1McGLLv
 jR0liPsPK+ssPKMSdPoLb+lyQ/NgHTP2XCYQvpGpwE8pdlkTtWS7y4zi4 g=;
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: T2QMMqIcwm5uMqzbkmhQ3DJWln281zDUnA8XRzlJXT0DCx0es705OFG9GjZE9Rhqxvatcs5Ljw
 h+xDQ0/Zoa7XwIuP8OamI8v3GkqtMhaZJtalFdLnljOLJnRKUEPu+DWRupVJ3LRIxypTCVi9/S
 JEPu1HhI/BkFReWiBWlpl1n7X3+w9PN5MWWB1vbp/xXBMVTTP2xexoVLmLP4HU+rkQqkcK34bC
 zYjwZpbl7iR8PWzzvt7xXR9/Idr25ue7nplfbJymqeQFTWKHVIegXL4e+idoXvNa0muZdf6fGI
 Sno=
X-SBRS: 2.7
X-MesageID: 17595735
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,380,1583211600"; d="scan'208";a="17595735"
Date: Mon, 11 May 2020 16:35:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/PVH: PHYSDEVOP_pci_mmcfg_reserved should not blindly
 register a region
Message-ID: <20200511143510.GC35422@Air-de-Roger>
References: <2ee1a3cb-3b40-6e6d-5308-1cdf9f6c521e@suse.com>
 <20200508150312.GJ1353@Air-de-Roger>
 <70c8b4f4-b690-c031-3b90-1776d872d171@suse.com>
 <20200508160851.GK1353@Air-de-Roger>
 <d1248c00-ae0b-e2aa-be41-e27d27dce379@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1248c00-ae0b-e2aa-be41-e27d27dce379@suse.com>
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
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 11, 2020 at 03:46:38PM +0200, Jan Beulich wrote:
> On 08.05.2020 18:08, Roger Pau Monné wrote:
> > On Fri, May 08, 2020 at 05:11:35PM +0200, Jan Beulich wrote:
> >> On 08.05.2020 17:03, Roger Pau Monné wrote:
> >>> On Fri, May 08, 2020 at 02:43:38PM +0200, Jan Beulich wrote:
> >>>> --- a/xen/arch/x86/hvm/io.c
> >>>> +++ b/xen/arch/x86/hvm/io.c
> >>>> @@ -558,6 +558,47 @@ int register_vpci_mmcfg_handler(struct d
> >>>>      return 0;
> >>>>  }
> >>>>  
> >>>> +int unregister_vpci_mmcfg_handler(struct domain *d, paddr_t addr,
> >>>> +                                  unsigned int start_bus, unsigned int end_bus,
> >>>> +                                  unsigned int seg)
> >>>> +{
> >>>> +    struct hvm_mmcfg *mmcfg;
> >>>> +    int rc = -ENOENT;
> >>>> +
> >>>> +    ASSERT(is_hardware_domain(d));
> >>>> +
> >>>> +    if ( start_bus > end_bus )
> >>>> +        return -EINVAL;
> >>>> +
> >>>> +    write_lock(&d->arch.hvm.mmcfg_lock);
> >>>> +
> >>>> +    list_for_each_entry ( mmcfg, &d->arch.hvm.mmcfg_regions, next )
> >>>> +        if ( mmcfg->addr == addr + (start_bus << 20) &&
> >>>> +             mmcfg->segment == seg &&
> >>>> +             mmcfg->start_bus == start_bus &&
> >>>> +             mmcfg->size == ((end_bus - start_bus + 1) << 20) )
> >>>> +        {
> >>>> +            list_del(&mmcfg->next);
> >>>> +            if ( !list_empty(&d->arch.hvm.mmcfg_regions) )
> >>>> +                xfree(mmcfg);
> >>>> +            else
> >>>> +            {
> >>>> +                /*
> >>>> +                 * Cannot unregister the MMIO handler - leave a fake entry
> >>>> +                 * on the list.
> >>>> +                 */
> >>>> +                memset(mmcfg, 0, sizeof(*mmcfg));
> >>>> +                list_add(&mmcfg->next, &d->arch.hvm.mmcfg_regions);
> >>>
> >>> Instead of leaving this zombie entry around maybe we could add a
> >>> static bool in register_vpci_mmcfg_handler to signal whether the MMIO
> >>> intercept has been registered?
> >>
> >> That was my initial plan indeed, but registration is per-domain.
> > 
> > Indeed, this would work now because it's only used by the hardware
> > domain, but it's not a good move long term.
> > 
> > What about splitting the registration into a
> > register_vpci_mmio_handler and call it from hvm_domain_initialise
> > like it's done for register_vpci_portio_handler?
> 
> No, the goal is to not register unneeded handlers. But see below -
> I'll likely ditch the function anyway.
> 
> >>>> --- a/xen/arch/x86/physdev.c
> >>>> +++ b/xen/arch/x86/physdev.c
> >>>> @@ -559,12 +559,18 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
> >>>>          if ( !ret && has_vpci(currd) )
> >>>>          {
> >>>>              /*
> >>>> -             * For HVM (PVH) domains try to add the newly found MMCFG to the
> >>>> -             * domain.
> >>>> +             * For HVM (PVH) domains try to add/remove the reported MMCFG
> >>>> +             * to/from the domain.
> >>>>               */
> >>>> -            ret = register_vpci_mmcfg_handler(currd, info.address,
> >>>> -                                              info.start_bus, info.end_bus,
> >>>> -                                              info.segment);
> >>>> +            if ( info.flags & XEN_PCI_MMCFG_RESERVED )
> >>>
> >>> Do you think you could also add a small note in physdev.h regarding
> >>> the fact that XEN_PCI_MMCFG_RESERVED is used to register a MMCFG
> >>> region, and not setting it would imply an unregister request?
> >>>
> >>> It's not obvious to me from the name of the flag.
> >>
> >> The main purpose of the flag is to identify whether a region can be
> >> used (because of having been found marked suitably reserved by
> >> firmware). The flag not set effectively means "region is not marked
> >> reserved".
> > 
> > Looking at pci_mmcfg_arch_disable, should the region then also be
> > removed from mmio_ro_ranges? (kind of tangential to this patch)
> 
> If it's truly unregistration - yes. But ...
> 
> >> You pointing this out makes me wonder whether instead I
> >> should simply expand the if() in context, without making it behave
> >> like unregistration. Then again we'd have no way to unregister a
> >> region, and hence (ab)using this function for this purpose seems to
> >> makes sense (and, afaict, not require any code changes elsewhere).
> > 
> > Right now the only user I know of PHYSDEVOP_pci_mmcfg_reserved is
> > Linux, and AFAICT it always sets the XEN_PCI_MMCFG_RESERVED flag (at
> > least upstream).
> 
> ... I've looked at our forward port, where this was first introduced.
> There we made the call in all cases, with the flag indicating what is
> wanted. Therefore I don't think we want to assign the flag being
> clear the meaning of "unregistration". I'll therefore switch to the
> simpler change of just expanding the if().

I'm not opposed to this. Leaving the vpci MMIO handlers for disabled
regions is fine, writes will be ignored and reads will return ~0.

This will prevent a PVH hardware domain from accessing those broken
MMCFG regions if it really wants to, but I think it's similar to how a
classic PV dom0 would behave (with the exception that in that case the
domain would be allowed to read from the MMCFG area).

Thanks, Roger.

