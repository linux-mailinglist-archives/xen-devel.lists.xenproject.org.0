Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F57320F693
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 16:00:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqGnI-0007Mn-1M; Tue, 30 Jun 2020 13:59:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJnf=AL=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jqGnG-0007Mi-Nl
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 13:59:26 +0000
X-Inumbo-ID: e7e30e3c-bad9-11ea-bca7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7e30e3c-bad9-11ea-bca7-bc764e2007e4;
 Tue, 30 Jun 2020 13:59:25 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: CdQDhhe/vltse0IAgZlqTjOb33oITBRQkWwnnAUWMqaDjQkGRd6MqEuQLO/+CTqMXjFgNhUWqB
 JQBFCCHtm1puW3hrPoIjtPK8ernonrSNiXM8VsGkdgzqFokXl+t43w61LqIv1NHI3ZZfZpWHuk
 9VboYHAo/oukmhdxNbvsIf3tRDtl7Z1SClc12+m0i4kYRHmiUl5tuHkqDpnMmSSkMBySYTQjdy
 MTaGqtKs2CeNWNR+ARHaGj9+wIe/TIJbhnbzg+H/fCR14M0LRAER+lU6hYaKtoACQVCCA34/r4
 0sE=
X-SBRS: 2.7
X-MesageID: 21272894
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,297,1589256000"; d="scan'208";a="21272894"
Date: Tue, 30 Jun 2020 14:59:21 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] xen: Fix xen-legacy-backend qdev types
Message-ID: <20200630135921.GB2030@perard.uk.xensource.com>
References: <20200624121939.10282-1-jandryuk@gmail.com>
 <000a01d64a23$4a595e90$df0c1bb0$@xen.org>
 <CAKf6xpuiRj_b+M+E0wBzPhraLxdebL6xr_1dMGc-jnzhWb0mhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAKf6xpuiRj_b+M+E0wBzPhraLxdebL6xr_1dMGc-jnzhWb0mhg@mail.gmail.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, QEMU <qemu-devel@nongnu.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 24, 2020 at 08:52:44AM -0400, Jason Andryuk wrote:
> On Wed, Jun 24, 2020 at 8:30 AM Paul Durrant <xadimgnik@gmail.com> wrote:
> >
> > > -----Original Message-----
> > > From: Jason Andryuk <jandryuk@gmail.com>
> > > Sent: 24 June 2020 13:20
> > > To: Stefano Stabellini <sstabellini@kernel.org>; Anthony Perard <anthony.perard@citrix.com>; Paul
> > > Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> > > Cc: Jason Andryuk <jandryuk@gmail.com>; qemu-devel@nongnu.org
> > > Subject: [PATCH] xen: Fix xen-legacy-backend qdev types
> > >
> > > xen-sysdev is a TYPE_SYS_BUS_DEVICE.  bus_type should not be changed so
> > > that it can plug into the System bus.  Otherwise this assert triggers:
> > > qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
> > > `dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
> > > failed.
> > >
> > > TYPE_XENBACKEND attaches to TYPE_XENSYSBUS, so its class_init needs to
> > > be set accordingly to attach the qdev.  Otherwise the following assert
> > > triggers:
> > > qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
> > > `dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
> > > failed.
> > >
> > > TYPE_XENBACKEND is not a subclass of XEN_XENSYSDEV, so it's parent
> > > is just TYPE_DEVICE.  Change that.
> > >
> > > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> >
> > Clearly we raced. This patch and my patch #1 are identical so I'm happy to give my ack to this.
> 
> Yeah, looks like you beat me by a hair :)
> 
> Either way it gets fixed is fine by me.

Since there's a choice to make, I think I'll take this patch, but I will
add:
Fixes: 81cb05732efb ("qdev: Assert devices are plugged into a bus that can take them")

Thanks,

-- 
Anthony PERARD

