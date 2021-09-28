Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BB241A663
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 06:18:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197397.350428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV4ZH-00016x-Mh; Tue, 28 Sep 2021 04:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197397.350428; Tue, 28 Sep 2021 04:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV4ZH-00015A-JK; Tue, 28 Sep 2021 04:18:11 +0000
Received: by outflank-mailman (input) for mailman id 197397;
 Tue, 28 Sep 2021 04:18:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gf2A=OS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mV4ZF-00014r-UD
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 04:18:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1464b718-2013-11ec-bc64-12813bfff9fa;
 Tue, 28 Sep 2021 04:18:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A102A60FE3;
 Tue, 28 Sep 2021 04:18:05 +0000 (UTC)
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
X-Inumbo-ID: 1464b718-2013-11ec-bc64-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632802685;
	bh=yBitKBKAgLE4ulPlX3HMhKhMpQBqvjuOFFQmaCDT27E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZieJGm77q2ZvHLTHIlXZGwAVukchy3yejCqF3WMo5XFGGCxGIjbRnWBMwIjGSoDIE
	 7zBgCCSaROEieFZC9PMVVbFQSpoipWxxMwyX5lJ4LYCwNCkfX5sfi/OFMFkD7oWfB0
	 uYrF9N8Y+5cJGORwctit8HXbG2ZI8/2CqbDhdcCAErrajFtNsCYjG+m09O1hpTYcns
	 2dpzZDWH43Qyy8AgPSbCFhitvn32pN0nS5NNZgQgFRs5jV2n24s8uhCmcWz30TKix6
	 eCYu42ghyYZ2ja47EwCMs8jGg/d1fbsW+zHYazxzpBOYIKkIGDP6nbk2qpVq3ClN7e
	 smWR0a5Wa25Hw==
Date: Mon, 27 Sep 2021 21:18:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Juergen Gross <jgross@suse.com>
cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Oleksandr Andrushchenko <andr2000@gmail.com>, 
    "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, 
    "julien@xen.org" <julien@xen.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and
 PV
In-Reply-To: <1cf5fbf3-6453-e258-3940-8b5bb96117b6@suse.com>
Message-ID: <alpine.DEB.2.21.2109272112150.5022@sstabellini-ThinkPad-T480s>
References: <20210927065822.350973-1-andr2000@gmail.com> <e472468a-625e-6c4d-a9c2-85594e2ff908@suse.com> <accd0220-a9d7-145b-6632-9dee085ffc65@epam.com> <1cf5fbf3-6453-e258-3940-8b5bb96117b6@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 Sep 2021, Juergen Gross wrote:
> On 27.09.21 09:35, Oleksandr Andrushchenko wrote:
> > 
> > On 27.09.21 10:26, Jan Beulich wrote:
> > > On 27.09.2021 08:58, Oleksandr Andrushchenko wrote:
> > > > From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > > > 
> > > > Currently PCI backend implements multiple functionalities at a time.
> > > > To name a few:
> > > > 1. It is used as a database for assignable PCI devices, e.g. xl
> > > >      pci-assignable-{add|remove|list} manipulates that list. So,
> > > > whenever
> > > >      the toolstack needs to know which PCI devices can be passed through
> > > >      it reads that from the relevant sysfs entries of the pciback.
> > > > 2. It is used to hold the unbound PCI devices list, e.g. when passing
> > > >      through a PCI device it needs to be unbound from the relevant
> > > > device
> > > >      driver and bound to pciback (strictly speaking it is not required
> > > >      that the device is bound to pciback, but pciback is again used as a
> > > >      database of the passed through PCI devices, so we can re-bind the
> > > >      devices back to their original drivers when guest domain shuts
> > > > down)
> > > > 3. Device reset for the devices being passed through
> > > > 4. Para-virtualised use-cases support
> > > > 
> > > > The para-virtualised part of the driver is not always needed as some
> > > > architectures, e.g. Arm or x86 PVH Dom0, are not using backend-frontend
> > > > model for PCI device passthrough. For such use-cases make the very
> > > > first step in splitting the xen-pciback driver into two parts: Xen
> > > > PCI stub and PCI PV backend drivers.
> > > > 
> > > > Signed-off-by: Oleksandr Andrushchenko
> > > > <oleksandr_andrushchenko@epam.com>
> > > > 
> > > > ---
> > > > Changes since v3:
> > > > - Move CONFIG_XEN_PCIDEV_STUB to the second patch
> > > I'm afraid this wasn't fully done:
> > > 
> > > > --- a/drivers/xen/xen-pciback/Makefile
> > > > +++ b/drivers/xen/xen-pciback/Makefile
> > > > @@ -1,5 +1,6 @@
> > > >    # SPDX-License-Identifier: GPL-2.0
> > > >    obj-$(CONFIG_XEN_PCIDEV_BACKEND) += xen-pciback.o
> > > > +obj-$(CONFIG_XEN_PCIDEV_STUB) += xen-pciback.o
> > > While benign when added here, this addition still doesn't seem to
> > > belong here.
> > 
> > My bad. So, it seems without CONFIG_XEN_PCIDEV_STUB the change seems
> > 
> > to be non-functional. With CONFIG_XEN_PCIDEV_STUB we fail to build on 32-bit
> > 
> > architectures...
> > 
> > What would be the preference here? Stefano suggested that we still define
> > 
> > CONFIG_XEN_PCIDEV_STUB, but in disabled state, e.g. we add tristate to it
> > 
> > in the second patch
> > 
> > Another option is just to squash the two patches.
> 
> Squashing would be fine for me.
 
It is fine for me to squash the two patches.

But in any case, wouldn't it be better to modify that specific change to:

diff --git a/drivers/xen/xen-pciback/Makefile b/drivers/xen/xen-pciback/Makefile
index e2cb376444a6..e23c758b85ae 100644
--- a/drivers/xen/xen-pciback/Makefile
+++ b/drivers/xen/xen-pciback/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_XEN_PCIDEV_BACKEND) += xen-pciback.o
-obj-$(CONFIG_XEN_PCIDEV_STUB) += xen-pciback.o
+obj-$(CONFIG_XEN_PCI_STUB) += xen-pciback.o
 
 xen-pciback-y := pci_stub.o pciback_ops.o xenbus.o
 xen-pciback-y += conf_space.o conf_space_header.o \


instead?

