Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E47871D992C
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 16:15:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb31X-0001sE-IR; Tue, 19 May 2020 14:15:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPOd=7B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jb31W-0001s8-UQ
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 14:15:14 +0000
X-Inumbo-ID: 27e46618-99db-11ea-a91d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27e46618-99db-11ea-a91d-12813bfff9fa;
 Tue, 19 May 2020 14:15:13 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: co/52IONfVfY3pD0MBtpGnSbgSNqPj6wROJ39RkFZOsMWttiRHMLfFhEoh2VKpSiTQwBXDMnd0
 fViTxHl1iFXQE8bseAtq4QAmQbDffPEW60yj5pvjfCIR3Wg73tPi17muqUYWCDv8QA3+0ceaCZ
 fvkSMY6GpGcMq1oQvMdgOjPVGwAQ12fy2JOtunh0yf04e+JzFnNczo8lkp/Flo9WDBJhJ3Owt7
 FG5g+6p44b/DokCsHgO+dUOF+d0foZVx7i64X47mJGANiWMegq1YnUpGJ4zBhGNi6ArEZxwkYP
 1vQ=
X-SBRS: 2.7
X-MesageID: 18250272
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,410,1583211600"; d="scan'208";a="18250272"
Date: Tue, 19 May 2020 16:15:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] xen: fix build without pci passthrough
Message-ID: <20200519141500.GG54375@Air-de-Roger>
References: <20200504101443.3165-1-roger.pau@citrix.com>
 <20200511134043.GH2116@perard.uk.xensource.com>
 <20200519112806.GF54375@Air-de-Roger>
 <CAFEAcA-RWR_6OQV1EgeYj0WmE89FDKqcywTpgfrMyr8FrELN+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-RWR_6OQV1EgeYj0WmE89FDKqcywTpgfrMyr8FrELN+Q@mail.gmail.com>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 19, 2020 at 01:20:51PM +0100, Peter Maydell wrote:
> On Tue, 19 May 2020 at 12:28, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Mon, May 11, 2020 at 02:40:43PM +0100, Anthony PERARD wrote:
> > > On Mon, May 04, 2020 at 12:14:43PM +0200, Roger Pau Monne wrote:
> > > > diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
> > > > index 179775db7b..660dd8a008 100644
> > > > --- a/hw/xen/xen_pt.h
> > > > +++ b/hw/xen/xen_pt.h
> > > > @@ -1,6 +1,7 @@
> > > >  #ifndef XEN_PT_H
> > > >  #define XEN_PT_H
> > > >
> > > > +#include "qemu/osdep.h"
> > >
> > > Why do you need osdep?
> >
> > For CONFIG_XEN_PCI_PASSTHROUGH IIRC.
> 
> All .c files should always include osdep as the first include
> in the file, and .h files should never include osdep (we note
> this in CODING_STYLE.rst).
> 
> If you added this #include to fix a compile issue that would
> suggest that there's a .c file somewhere that's missing the
> mandatory osdep include. I did a quick eyeball of all the files
> that include xen_pt.h, though, and none of them are missing the
> osdep include. So I think you should be able to simply drop the
> osdep include here. If that produces an error, let us know what
> fails and we can work out what's gone wrong.

My bad, didn't know about this rule and just looked up where
CONFIG_XEN_PCI_PASSTHROUGH was defined in order to include it. Will
remove in v2.

Thanks, Roger.

