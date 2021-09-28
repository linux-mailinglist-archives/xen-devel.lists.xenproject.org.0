Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E93641A99D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 09:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197634.350798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7Q6-0006mQ-Br; Tue, 28 Sep 2021 07:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197634.350798; Tue, 28 Sep 2021 07:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7Q6-0006kc-8p; Tue, 28 Sep 2021 07:20:54 +0000
Received: by outflank-mailman (input) for mailman id 197634;
 Tue, 28 Sep 2021 07:20:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gf2A=OS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mV7Q4-0006k7-Rg
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 07:20:52 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7da32dc4-e5c0-46c4-b990-a55eae9bf766;
 Tue, 28 Sep 2021 07:20:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16EFF61052;
 Tue, 28 Sep 2021 07:20:51 +0000 (UTC)
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
X-Inumbo-ID: 7da32dc4-e5c0-46c4-b990-a55eae9bf766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632813651;
	bh=3/VYh1cvGM54Pp4563OgiGeaUEdkG80oWPlxS7UbG1g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KyFqPbfhRT40FZ4UGGI7ti7VxzCcWo1IXnC38NU7cP77hd1NiULpyDfTQ+ZjMOYW/
	 sMKQtIGbBb0GAd0iH0rhoZ8smzrw1iA0KxajEdbGXMltPYQqLJ5cav9iYkAbMqELZq
	 InJaJcuOKdO9WcokGEOAhgg7ETfm+SsbcFky1lHZG3UbK8hXUlBnTlC2SwMoMJ4aZq
	 wLfVmZ/0XpdkGtqISy7Ooscg77wMy82sIo041bnL413ES6KbUlAM70FoLRVp8amJGH
	 Un5seG2vdL311sHZQs3MJCnNS5XthXeRkfjXSedJ/N98Mv5fQm6Lx4zbgNVG8AUonk
	 wKkx5PlqCDqyg==
Date: Tue, 28 Sep 2021 00:20:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
cc: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, 
    "julien@xen.org" <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and
 PV
In-Reply-To: <51e38ddc-49df-2e70-d094-71d045297ab1@epam.com>
Message-ID: <alpine.DEB.2.21.2109280020150.5022@sstabellini-ThinkPad-T480s>
References: <20210927065822.350973-1-andr2000@gmail.com> <e472468a-625e-6c4d-a9c2-85594e2ff908@suse.com> <accd0220-a9d7-145b-6632-9dee085ffc65@epam.com> <1cf5fbf3-6453-e258-3940-8b5bb96117b6@suse.com> <alpine.DEB.2.21.2109272112150.5022@sstabellini-ThinkPad-T480s>
 <0b952b8d-0ebd-1c8c-84d4-f02e05bc2a2b@suse.com> <b4c8b964-56d7-c693-98e0-ecb435925eb0@epam.com> <da921aa0-0259-cd2e-5f43-5e2934ad3f82@suse.com> <51e38ddc-49df-2e70-d094-71d045297ab1@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2095034342-1632813651=:5022"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2095034342-1632813651=:5022
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 28 Sep 2021, Oleksandr Andrushchenko wrote:
> On 28.09.21 09:59, Juergen Gross wrote:
> > On 28.09.21 08:56, Oleksandr Andrushchenko wrote:
> >>
> >> On 28.09.21 09:42, Jan Beulich wrote:
> >>> On 28.09.2021 06:18, Stefano Stabellini wrote:
> >>>> On Mon, 27 Sep 2021, Juergen Gross wrote:
> >>>>> On 27.09.21 09:35, Oleksandr Andrushchenko wrote:
> >>>>>> On 27.09.21 10:26, Jan Beulich wrote:
> >>>>>>> On 27.09.2021 08:58, Oleksandr Andrushchenko wrote:
> >>>>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>>>>>>>
> >>>>>>>> Currently PCI backend implements multiple functionalities at a time.
> >>>>>>>> To name a few:
> >>>>>>>> 1. It is used as a database for assignable PCI devices, e.g. xl
> >>>>>>>>        pci-assignable-{add|remove|list} manipulates that list. So,
> >>>>>>>> whenever
> >>>>>>>>        the toolstack needs to know which PCI devices can be passed through
> >>>>>>>>        it reads that from the relevant sysfs entries of the pciback.
> >>>>>>>> 2. It is used to hold the unbound PCI devices list, e.g. when passing
> >>>>>>>>        through a PCI device it needs to be unbound from the relevant
> >>>>>>>> device
> >>>>>>>>        driver and bound to pciback (strictly speaking it is not required
> >>>>>>>>        that the device is bound to pciback, but pciback is again used as a
> >>>>>>>>        database of the passed through PCI devices, so we can re-bind the
> >>>>>>>>        devices back to their original drivers when guest domain shuts
> >>>>>>>> down)
> >>>>>>>> 3. Device reset for the devices being passed through
> >>>>>>>> 4. Para-virtualised use-cases support
> >>>>>>>>
> >>>>>>>> The para-virtualised part of the driver is not always needed as some
> >>>>>>>> architectures, e.g. Arm or x86 PVH Dom0, are not using backend-frontend
> >>>>>>>> model for PCI device passthrough. For such use-cases make the very
> >>>>>>>> first step in splitting the xen-pciback driver into two parts: Xen
> >>>>>>>> PCI stub and PCI PV backend drivers.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Oleksandr Andrushchenko
> >>>>>>>> <oleksandr_andrushchenko@epam.com>
> >>>>>>>>
> >>>>>>>> ---
> >>>>>>>> Changes since v3:
> >>>>>>>> - Move CONFIG_XEN_PCIDEV_STUB to the second patch
> >>>>>>> I'm afraid this wasn't fully done:
> >>>>>>>
> >>>>>>>> --- a/drivers/xen/xen-pciback/Makefile
> >>>>>>>> +++ b/drivers/xen/xen-pciback/Makefile
> >>>>>>>> @@ -1,5 +1,6 @@
> >>>>>>>>      # SPDX-License-Identifier: GPL-2.0
> >>>>>>>>      obj-$(CONFIG_XEN_PCIDEV_BACKEND) += xen-pciback.o
> >>>>>>>> +obj-$(CONFIG_XEN_PCIDEV_STUB) += xen-pciback.o
> >>>>>>> While benign when added here, this addition still doesn't seem to
> >>>>>>> belong here.
> >>>>>> My bad. So, it seems without CONFIG_XEN_PCIDEV_STUB the change seems
> >>>>>>
> >>>>>> to be non-functional. With CONFIG_XEN_PCIDEV_STUB we fail to build on 32-bit
> >>>>>>
> >>>>>> architectures...
> >>>>>>
> >>>>>> What would be the preference here? Stefano suggested that we still define
> >>>>>>
> >>>>>> CONFIG_XEN_PCIDEV_STUB, but in disabled state, e.g. we add tristate to it
> >>>>>>
> >>>>>> in the second patch
> >>>>>>
> >>>>>> Another option is just to squash the two patches.
> >>>>> Squashing would be fine for me.
> >>>>    It is fine for me to squash the two patches.
> >>>>
> >>>> But in any case, wouldn't it be better to modify that specific change to:
> >>>>
> >>>> diff --git a/drivers/xen/xen-pciback/Makefile b/drivers/xen/xen-pciback/Makefile
> >>>> index e2cb376444a6..e23c758b85ae 100644
> >>>> --- a/drivers/xen/xen-pciback/Makefile
> >>>> +++ b/drivers/xen/xen-pciback/Makefile
> >>>> @@ -1,6 +1,5 @@
> >>>>    # SPDX-License-Identifier: GPL-2.0
> >>>> -obj-$(CONFIG_XEN_PCIDEV_BACKEND) += xen-pciback.o
> >>>> -obj-$(CONFIG_XEN_PCIDEV_STUB) += xen-pciback.o
> >>>> +obj-$(CONFIG_XEN_PCI_STUB) += xen-pciback.o
> >>> But that wouldn't allow the driver to be a module anymore, would it?
> >>
> >> Exactly. I forgot that when playing with module/built-in I was not able
> >>
> >> to control that anymore because CONFIG_XEN_PCI_STUB will always be
> >>
> >> in "y" state, thus even if you have CONFIG_XEN_PCIDEV_BACKEND=m
> >>
> >> you won't be able to build it as module. So, I will probably put a comment
> >>
> >> about that in the Makefile explaining the need for
> >>
> >> obj-$(CONFIG_XEN_PCIDEV_BACKEND) += xen-pciback.o
> >> obj-$(CONFIG_XEN_PCIDEV_STUB) += xen-pciback.o
> >
> > In case the real split between both parts of xen-pciback is done this
> > will be needed anyway.
> 
> Yes, it will
> 
> So, I'll put a comment in the Makefile:
> 
> # N.B. This cannot be expressed with a single line using CONFIG_XEN_PCI_STUB
> 
> # as it always remains in "y" state, thus preventing the driver to be built as
> 
> # a module.
> 
> obj-$(CONFIG_XEN_PCIDEV_BACKEND) += xen-pciback.o
> obj-$(CONFIG_XEN_PCIDEV_STUB) += xen-pciback.o
> 
> Will this be ok or needs some re-wording?

I am fine with it and honestly that was the only comment I had so you
can add my

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-2095034342-1632813651=:5022--

