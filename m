Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4D71D954A
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 13:29:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb0Pv-00042B-PL; Tue, 19 May 2020 11:28:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPOd=7B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jb0Pu-000426-Ng
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 11:28:14 +0000
X-Inumbo-ID: d33523f9-99c3-11ea-a8f6-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d33523f9-99c3-11ea-a8f6-12813bfff9fa;
 Tue, 19 May 2020 11:28:13 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: k6mOXDwddi60MIyYZcBbG8tvY6FOBiR4VhvoqthRBXYw89Fhix1g0DEwfOdhPT7wYNOYJOvhtN
 Ykg5I65aTj3h8ZPg7nQ7mVVIKUxXyyNElYI39ObkSEtXvRx3/GC6+KwhA+oqilF96belJVDR73
 kA3irFZVw5jVu5VQC2ZwouRLrEEAz+VZuSb6WkrHMT42YDPaapJNVSurGxKiBeE/cR6SOwL7RT
 dEPOmnIvl+MnKjyre7BRycvqDawR+ImknLHOOqOJY3iX1WN8uEaQzJEkYMD/miAHBgV1HWYVju
 8rA=
X-SBRS: 2.7
X-MesageID: 17899145
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,410,1583211600"; d="scan'208";a="17899145"
Date: Tue, 19 May 2020 13:28:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] xen: fix build without pci passthrough
Message-ID: <20200519112806.GF54375@Air-de-Roger>
References: <20200504101443.3165-1-roger.pau@citrix.com>
 <20200511134043.GH2116@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200511134043.GH2116@perard.uk.xensource.com>
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 11, 2020 at 02:40:43PM +0100, Anthony PERARD wrote:
> On Mon, May 04, 2020 at 12:14:43PM +0200, Roger Pau Monne wrote:
> > diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
> > index 179775db7b..660dd8a008 100644
> > --- a/hw/xen/xen_pt.h
> > +++ b/hw/xen/xen_pt.h
> > @@ -1,6 +1,7 @@
> >  #ifndef XEN_PT_H
> >  #define XEN_PT_H
> >  
> > +#include "qemu/osdep.h"
> 
> Why do you need osdep?

For CONFIG_XEN_PCI_PASSTHROUGH IIRC.

> 
> >  #include "hw/xen/xen_common.h"
> >  #include "hw/pci/pci.h"
> >  #include "xen-host-pci-device.h"
> > @@ -322,7 +323,13 @@ extern void *pci_assign_dev_load_option_rom(PCIDevice *dev,
> >                                              unsigned int domain,
> >                                              unsigned int bus, unsigned int slot,
> >                                              unsigned int function);
> > +
> > +#ifdef CONFIG_XEN_PCI_PASSTHROUGH
> >  extern bool has_igd_gfx_passthru;
> > +#else
> > +# define has_igd_gfx_passthru false
> > +#endif
> 
> I don't quite like the use of define here. Could you introduce a
> function that return a bool instead? And defining that function in
> hw/xen/xen.h like xen_enabled() would be fine I think.

But has_igd_gfx_passthru is defined in xen_pt.c which is only compiled
if CONFIG_XEN_PCI_PASSTHROUGH is defined, yet the variable is set from
xen-common.c. I think the former is fine, an any attempt to set
has_igd_gfx_passthru without CONFIG_XEN_PCI_PASSTHROUGH will result in
a compile error which is easier to catch?

Thanks, Roger.

