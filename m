Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C204F1F9D99
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 18:38:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jks7T-0006YC-88; Mon, 15 Jun 2020 16:37:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jks7S-0006Y7-7d
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 16:37:58 +0000
X-Inumbo-ID: 90c46562-af26-11ea-b81a-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90c46562-af26-11ea-b81a-12813bfff9fa;
 Mon, 15 Jun 2020 16:37:56 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 6wL7nnxTvCEzHhOOw6QoD49jx/5X8vooQFJqq3Iy9SnIu0qPZvqdGjKnUwO4fh9ifYa0jwfKPI
 +SKh+c0682Ca/ZvSws2LEA7ruxZlGdX8DdUCGR/yC2tG7XqLkQNq50RBNNvKv0GrO58/IYQBKJ
 kX6W6gDupjOBByO4a0EJyhszykZ0d/GfnDFjF4LmuTLJ9rkKJ/6mlahamC8tgbqQavftbirzG+
 s4fnhnPvEEDSyYGi47kZIGMRx4gESOGDrJs/VO2Lq8y2DyYiEFw1DA3+Nq5n32mXJzXdoRv7EC
 faI=
X-SBRS: 2.7
X-MesageID: 20856669
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,515,1583211600"; d="scan'208";a="20856669"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.41945.883230.966002@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 17:37:45 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] libxl: tooling expects wrong errno
In-Reply-To: <20200615155646.GI735@Air-de-Roger>
References: <ebdcefb5ab4b9053dee7c090b4e6562e597b3474.1592151144.git.gorbak25@gmail.com>
 <24295.36070.945693.791220@mariner.uk.xensource.com>
 <20200615155646.GI735@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, "jakub@bartmin.ski" <jakub@bartmin.ski>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Grzegorz Uriasz <gorbak25@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "j.nowak26@student.uw.edu.pl" <j.nowak26@student.uw.edu.pl>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "contact@puzio.waw.pl" <contact@puzio.waw.pl>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Roger Pau Monne writes ("Re: [PATCH] libxl: tooling expects wrong errno"):
> On Mon, Jun 15, 2020 at 03:59:50PM +0100, Ian Jackson wrote:
> > Grzegorz Uriasz writes ("[PATCH] libxl: tooling expects wrong errno"):
> > > When iommu is not enabled for a given domain then pci passthrough
> > > hypercalls such as xc_test_assign_device return EOPNOTSUPP.
> > > The code responsible for this is in "iommu_do_domctl" inside
> > > xen/drivers/passthrough/iommu.c
> > > This patch fixes the error message reported by libxl when assigning
> > > pci devices to domains without iommu.
> > > 
> > > Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
> > > Tested-by: Grzegorz Uriasz <gorbak25@gmail.com>
> > > ---
> > >  tools/libxl/libxl_pci.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
> > > index 957ff5c8e9..bc5843b137 100644
> > > --- a/tools/libxl/libxl_pci.c
> > > +++ b/tools/libxl/libxl_pci.c
> > > @@ -1561,7 +1561,7 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
> > >              LOGD(ERROR, domid,
> > >                   "PCI device %04x:%02x:%02x.%u %s?",
> > >                   pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func,
> > > -                 errno == ENOSYS ? "cannot be assigned - no IOMMU"
> > > +                 errno == EOPNOTSUPP ? "cannot be assigned - no IOMMU"
> > >                   : "already assigned to a different guest");
> > >              goto out;
> > >          }
> > 
> > Thanks.  I have addressed some Xen IOMMU maintainers.  Can you confirm
> > whether this is right ?
> 
> Not an IOMMU maintainer myself, but I've taken a look at the code and
> I think Grzegorz is right. iommu_do_domctl will return -EOPNOTSUPP if
> the IOMMU is not enabled for the domain. Another option would be to
> check for EBUSY (which will certainly be returned when the device is
> busy) and log the error code with a message when it's different than
> EBUSY?
> 
> There are many possible error here, for example the device itself
> might not be behind an IOMMU, in which case Xen will return -ENODEV at
> least on the Intel case.

Thanks for the analysis.  So:

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

This would seem to be a backport candidate.  AFAICT check has been
there, looking for ENOSYS, since this code was introduced in
   826eb17271d3c647516d9944c47b0779afedea25
   libxl: suppress device assignment to HVM guest when there is no IOMMU
?

But that commit has a Tested-by.  Maybe Xen changed its error return
at some point ?

Ian.

