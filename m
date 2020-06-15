Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D331F9C69
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 17:57:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkrTl-0002JU-KO; Mon, 15 Jun 2020 15:56:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+Ae=74=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jkrTj-0002JP-KS
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 15:56:55 +0000
X-Inumbo-ID: d5616110-af20-11ea-bb8b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5616110-af20-11ea-bb8b-bc764e2007e4;
 Mon, 15 Jun 2020 15:56:54 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: PaKzGeflOyUZvWh7dPfg4jaobUpOte0pvtGcAENGUQZDs3YHglDQxQ+9IC8xZrGr3YetE1TPbm
 MkQsGNDaW3c2Wh0s3tipEij0JcOVRMaAjJamxTgjft7xH5s6a1X9VMAYOo4iuJT6M7a+mJaLlh
 eo82oJzB9ILlzUTogivMgAgAjhpduUNoiSehNz4NKfGjb6jZykkeKwarDx5wr37R74UTo+w/cn
 YpZ/Ttfds8hPLYiv9QSaY+OQkbM4CU6K2NibHMJkxBWtSjKI4wQgIj+l8YOV6by9l/5ozhMI5D
 ZQI=
X-SBRS: 2.7
X-MesageID: 20422282
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,515,1583211600"; d="scan'208";a="20422282"
Date: Mon, 15 Jun 2020 17:56:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] libxl: tooling expects wrong errno
Message-ID: <20200615155646.GI735@Air-de-Roger>
References: <ebdcefb5ab4b9053dee7c090b4e6562e597b3474.1592151144.git.gorbak25@gmail.com>
 <24295.36070.945693.791220@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <24295.36070.945693.791220@mariner.uk.xensource.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, "jakub@bartmin.ski" <jakub@bartmin.ski>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Grzegorz Uriasz <gorbak25@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "j.nowak26@student.uw.edu.pl" <j.nowak26@student.uw.edu.pl>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "contact@puzio.waw.pl" <contact@puzio.waw.pl>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 15, 2020 at 03:59:50PM +0100, Ian Jackson wrote:
> Grzegorz Uriasz writes ("[PATCH] libxl: tooling expects wrong errno"):
> > When iommu is not enabled for a given domain then pci passthrough
> > hypercalls such as xc_test_assign_device return EOPNOTSUPP.
> > The code responsible for this is in "iommu_do_domctl" inside
> > xen/drivers/passthrough/iommu.c
> > This patch fixes the error message reported by libxl when assigning
> > pci devices to domains without iommu.
> > 
> > Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
> > Tested-by: Grzegorz Uriasz <gorbak25@gmail.com>
> > ---
> >  tools/libxl/libxl_pci.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
> > index 957ff5c8e9..bc5843b137 100644
> > --- a/tools/libxl/libxl_pci.c
> > +++ b/tools/libxl/libxl_pci.c
> > @@ -1561,7 +1561,7 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
> >              LOGD(ERROR, domid,
> >                   "PCI device %04x:%02x:%02x.%u %s?",
> >                   pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func,
> > -                 errno == ENOSYS ? "cannot be assigned - no IOMMU"
> > +                 errno == EOPNOTSUPP ? "cannot be assigned - no IOMMU"
> >                   : "already assigned to a different guest");
> >              goto out;
> >          }
> 
> Thanks.  I have addressed some Xen IOMMU maintainers.  Can you confirm
> whether this is right ?

Not an IOMMU maintainer myself, but I've taken a look at the code and
I think Grzegorz is right. iommu_do_domctl will return -EOPNOTSUPP if
the IOMMU is not enabled for the domain. Another option would be to
check for EBUSY (which will certainly be returned when the device is
busy) and log the error code with a message when it's different than
EBUSY?

There are many possible error here, for example the device itself
might not be behind an IOMMU, in which case Xen will return -ENODEV at
least on the Intel case.

Thanks, Roger.

