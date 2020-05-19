Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E71D1D9E2E
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 19:49:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb6M4-00069R-6O; Tue, 19 May 2020 17:48:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPOd=7B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jb6M3-00069G-32
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 17:48:39 +0000
X-Inumbo-ID: f7c8ed28-99f8-11ea-b9cf-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7c8ed28-99f8-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 17:48:38 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Kto5CE9hKXDANA3dv6AV+qfGgge3TBQmrrbG0XmUpjg/89DP+YqxeH4ymio+763qd+feXYZuBG
 sTOzD35a1V2G1ShTHilVH2uX6550WljdJUjg+8qrrpvjk87C17Fuu8zUmuXwGPPywqZcS+hc0e
 mrCi3b5gnyEWE9ED6/y/I6+4OakaLs8rT+TjKZ3ARif/rRGJThwHRc8+CF7yIGUCqu2MoKy5Ik
 g2A/eAiEqU3u6zjIxHyqk/3s8T3EoQgsfPlVJh97lTykBCoOFA0XGWUoAUQgjQRkRRH/gKvKJ0
 nzs=
X-SBRS: 2.7
X-MesageID: 18192776
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,410,1583211600"; d="scan'208";a="18192776"
Date: Tue, 19 May 2020 19:48:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2] xen: fix build without pci passthrough
Message-ID: <20200519174830.GH54375@Air-de-Roger>
References: <20200519143101.75330-1-roger.pau@citrix.com>
 <20200519155258.GC2105@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200519155258.GC2105@perard.uk.xensource.com>
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

On Tue, May 19, 2020 at 04:52:58PM +0100, Anthony PERARD wrote:
> On Tue, May 19, 2020 at 04:31:01PM +0200, Roger Pau Monne wrote:
> > has_igd_gfx_passthru is only available when QEMU is built with
> > CONFIG_XEN_PCI_PASSTHROUGH, and hence shouldn't be used in common
> > code without checking if it's available.
> > 
> > Fixes: 46472d82322d0 ('xen: convert "-machine igd-passthru" to an accelerator property')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Anthony Perard <anthony.perard@citrix.com>
> > Cc: Paul Durrant <paul@xen.org>
> > Cc: xen-devel@lists.xenproject.org
> > ---
> > Changes since v1:
> >  - Do not include osdep in header file.
> >  - Always add the setters/getters of igd-passthru, report an error
> >    when attempting to set igd-passthru without built in
> >    pci-passthrough support.
> > ---
> >  hw/xen/xen-common.c | 4 ++++
> >  hw/xen/xen_pt.h     | 6 ++++++
> >  2 files changed, 10 insertions(+)
> > 
> > diff --git a/hw/xen/xen-common.c b/hw/xen/xen-common.c
> > index 70564cc952..d758770da0 100644
> > --- a/hw/xen/xen-common.c
> > +++ b/hw/xen/xen-common.c
> > @@ -134,7 +134,11 @@ static bool xen_get_igd_gfx_passthru(Object *obj, Error **errp)
> >  
> >  static void xen_set_igd_gfx_passthru(Object *obj, bool value, Error **errp)
> >  {
> > +#ifdef CONFIG_XEN_PCI_PASSTHROUGH
> >      has_igd_gfx_passthru = value;
> > +#else
> > +    error_setg(errp, "Xen PCI passthrough support not built in");
> > +#endif
> >  }
> >  
> 
> There's an issue that I haven't thought about before.
> CONFIG_XEN_PCI_PASSTHROUGH is never defined in xen-common.c. So
> xen_set_igd_gfx_passthru will always return an error.
> 
> I'm not sure what to do about that yet, maybe change the way that
> CONFIG_ is defined, or maybe have have the setter/getter in xen_pt.c
> with a stub in stubs/ which would return an error. or maybe some other
> way.

Hm, I think making it available is OK? Would it make sense to set it
in $config_host_mak instead of $config_target_mak?

It's a host property, not a target one AFAICT, as the support in the
host determines whether PCI passthrough is supported or not.

Thanks, Roger.

