Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7238A413BAC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 22:45:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191903.342056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSmce-0008RJ-31; Tue, 21 Sep 2021 20:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191903.342056; Tue, 21 Sep 2021 20:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSmcd-0008Ok-W6; Tue, 21 Sep 2021 20:44:11 +0000
Received: by outflank-mailman (input) for mailman id 191903;
 Tue, 21 Sep 2021 20:44:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AvEq=OL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mSmcc-0008OO-Me
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 20:44:11 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa50cbf1-1b1c-11ec-b92d-12813bfff9fa;
 Tue, 21 Sep 2021 20:44:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EA8E61156;
 Tue, 21 Sep 2021 20:44:07 +0000 (UTC)
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
X-Inumbo-ID: aa50cbf1-1b1c-11ec-b92d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632257048;
	bh=Ck7yVJFIXzTFvAFx0p96/tMpeKNlfNntmCEPNWDueOg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fvCrNTLnkeVpEZENUSbcIL3JRM/o/OG+6d9GKn5LIoXiDA6Gf8ZSe4X222Vfl1kRf
	 BsfiSEbG24XluNMRo9/FWlVjdeP8umRwX8wCowvRDbkAdUp/irjqBrW/EMhjmYLxQa
	 /gjOh8GquvqcaUfiGi6uMUikfkcgpi01u7o5AuLopaY7CNjLOiorGSMCrSXTJB73rT
	 qxUs6EBdM/vNyglAZ+/LRS7pIJ6KLTmMFfWJwjuzADzOco2JOJ8PbY4Ne5balbfLO1
	 AYFMFZpcI/ugwREgOLPHqTq0NFEHcyMcxvelcmVNVVjLHyD6Hc7oqUbA0Es/0WDyPW
	 mdCNQdNpDBBHQ==
Date: Tue, 21 Sep 2021 13:44:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, 
    "julien@xen.org" <julien@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>, 
    Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>, 
    Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
In-Reply-To: <48a2ef20-02ad-99e4-a8f5-fa144692aadc@epam.com>
Message-ID: <alpine.DEB.2.21.2109211340470.17979@sstabellini-ThinkPad-T480s>
References: <20210917130123.1764493-1-andr2000@gmail.com> <alpine.DEB.2.21.2109171442070.21985@sstabellini-ThinkPad-T480s> <d81486bc-9a2b-8675-ba4d-828d3adc75fc@epam.com> <35e2e36a-bade-d801-faa1-c9953678bb9d@suse.com> <7f873e38-0362-1f60-7347-a490c9dc8572@epam.com>
 <alpine.DEB.2.21.2109201444040.17979@sstabellini-ThinkPad-T480s> <0f31a1bf-62b1-1aef-7b0f-34a1f6985fdb@suse.com> <82e55df9-74d3-6365-ab29-2bdfc4b74a1f@epam.com> <9b4962de-61ef-44dc-ffca-c54dd7990c6a@suse.com> <a9b98bc4-4c8a-2e7e-6abf-3a68025059c4@epam.com>
 <bb9fa2a8-9cc2-d83c-3659-c66b37781470@suse.com> <0b83aa77-aef0-0d98-cc0b-cf5f9c7599bd@epam.com> <111389e7-855d-0023-092c-f3e8bc57f4af@suse.com> <48a2ef20-02ad-99e4-a8f5-fa144692aadc@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-722727834-1632257047=:17979"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-722727834-1632257047=:17979
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 21 Sep 2021, Oleksandr Andrushchenko wrote:
> On 21.09.21 10:09, Juergen Gross wrote:
> > On 21.09.21 09:00, Oleksandr Andrushchenko wrote:
> >>
> >> On 21.09.21 09:49, Juergen Gross wrote:
> >>> On 21.09.21 08:38, Oleksandr Andrushchenko wrote:
> >>>>
> >>>> On 21.09.21 09:07, Juergen Gross wrote:
> >>>>> On 21.09.21 07:51, Oleksandr Andrushchenko wrote:
> >>>>>>
> >>>>>> On 21.09.21 08:20, Juergen Gross wrote:
> >>>>>>> On 21.09.21 01:16, Stefano Stabellini wrote:
> >>>>>>>> On Mon, 20 Sep 2021, Oleksandr Andrushchenko wrote:
> >>>>>>>>> On 20.09.21 14:30, Juergen Gross wrote:
> >>>>>>>>>> On 20.09.21 07:23, Oleksandr Andrushchenko wrote:
> >>>>>>>>>>> Hello, Stefano!
> >>>>>>>>>>>
> >>>>>>>>>>> On 18.09.21 00:45, Stefano Stabellini wrote:
> >>>>>>>>>>>> Hi Oleksandr,
> >>>>>>>>>>>>
> >>>>>>>>>>>> Why do you want to enable pciback on ARM? Is it only to "disable" a PCI
> >>>>>>>>>>>> device in Dom0 so that it can be safely assigned to a DomU?
> >>>>>>>>>>> Not only that
> >>>>>>>>>>>>
> >>>>>>>>>>>> I am asking because actually I don't think we want to enable the PV PCI
> >>>>>>>>>>>> backend feature of pciback on ARM, right? That would clash with the PCI
> >>>>>>>>>>>> assignment work you have been doing in Xen. They couldn't both work at
> >>>>>>>>>>>> the same time.
> >>>>>>>>>>> Correct, it is not used
> >>>>>>>>>>>>
> >>>>>>>>>>>> If we only need pciback to "park" a device in Dom0, wouldn't it be
> >>>>>>>>>>>> possible and better to use pci-stub instead?
> >>>>>>>>>>>
> >>>>>>>>>>> Not only that, so pci-stub is not enough
> >>>>>>>>>>>
> >>>>>>>>>>> The functionality which is implemented by the pciback and the toolstack
> >>>>>>>>>>> and which is relevant/missing/needed for ARM:
> >>>>>>>>>>>
> >>>>>>>>>>> 1. pciback is used as a database for assignable PCI devices, e.g. xl
> >>>>>>>>>>>          pci-assignable-{add|remove|list} manipulates that list. So, whenever the
> >>>>>>>>>>>          toolstack needs to know which PCI devices can be passed through it reads
> >>>>>>>>>>>          that from the relevant sysfs entries of the pciback.
> >>>>>>>>>>>
> >>>>>>>>>>> 2. pciback is used to hold the unbound PCI devices, e.g. when passing through
> >>>>>>>>>>>          a PCI device it needs to be unbound from the relevant device driver and bound
> >>>>>>>>>>>          to pciback (strictly speaking it is not required that the device is bound to
> >>>>>>>>>>>          pciback, but pciback is again used as a database of the passed through PCI
> >>>>>>>>>>>          devices, so we can re-bind the devices back to their original drivers when
> >>>>>>>>>>>          guest domain shuts down)
> >>>>>>>>>>>
> >>>>>>>>>>> 3. Device reset
> >>>>>>>>>>>
> >>>>>>>>>>> We have previously discussed on xen-devel ML possible solutions to that as from the
> >>>>>>>>>>> above we see that pciback functionality is going to be only partially used on Arm.
> >>>>>>>>>>>
> >>>>>>>>>>> Please see [1] and [2]:
> >>>>>>>>>>>
> >>>>>>>>>>> 1. It is not acceptable to manage the assignable list in Xen itself
> >>>>>>>>>>>
> >>>>>>>>>>> 2. pciback can be split into two parts: PCI assignable/bind/reset handling and
> >>>>>>>>>>> the rest like vPCI etc.
> >>>>>>>>>>>
> >>>>>>>>>>> 3. pcifront is not used on Arm
> >>>>>>>>>>
> >>>>>>>>>> It is neither in x86 PVH/HVM guests.
> >>>>>>>>> Didn't know that, thank you for pointing
> >>>>>>>>>>
> >>>>>>>>>>> So, limited use of the pciback is one of the bricks used to enable PCI passthrough
> >>>>>>>>>>> on Arm. It was enough to just re-structure the driver and have it run on Arm to achieve
> >>>>>>>>>>> all the goals above.
> >>>>>>>>>>>
> >>>>>>>>>>> If we still think it is desirable to break the pciback driver into "common" and "pcifront specific"
> >>>>>>>>>>> parts then it can be done, yet the patch is going to be the very first brick in that building.
> >>>>>>>>>>
> >>>>>>>>>> Doing this split should be done, as the pcifront specific part could be
> >>>>>>>>>> omitted on x86, too, in case no PV guests using PCI passthrough have to
> >>>>>>>>>> be supported.
> >>>>>>>>> Agree, that the final solution should have the driver split
> >>>>>>>>>>
> >>>>>>>>>>> So, I think this patch is still going to be needed besides which direction we take.
> >>>>>>>>>>
> >>>>>>>>>> Some kind of this patch, yes. It might look different in case the split
> >>>>>>>>>> is done first.
> >>>>>>>>>>
> >>>>>>>>>> I don't mind doing it in either sequence.
> >>>>>>>>>>
> >>>>>>>>> With this patch we have Arm on the same page as the above mentioned x86 guests,
> >>>>>>>>>
> >>>>>>>>> e.g. the driver has unused code, but yet allows Arm to function now.
> >>>>>>>>>
> >>>>>>>>> At this stage of PCI passthrough on Arm it is yet enough. Long term, when
> >>>>>>>>>
> >>>>>>>>> the driver gets split, Arm will benefit from that split too, but unfortunately I do not
> >>>>>>>>>
> >>>>>>>>> have enough bandwidth for that piece of work at the moment.
> >>>>>>>>
> >>>>>>>> That's fair and I don't want to scope-creep this simple patch asking for
> >>>>>>>> an enormous rework. At the same time I don't think we should enable the
> >>>>>>>> whole of pciback on ARM because it would be erroneous and confusing.
> >>>>>>
> >>>>>> As the first stage before the driver is split or ifdef's used - can we take the patch
> >>>>>> as is now? In either way we chose this needs to be done, e.g. enable compiling
> >>>>>> for other architectures and common code move.
> >>>>>
> >>>>> Fine with me in principle. I need to take a more thorough look
> >>>>> at the patch, though.
> >>>> Of course
> >>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>>> I am wonder if there is a simple:
> >>>>>>>>
> >>>>>>>> if (!xen_pv_domain())
> >>>>>>>>         return;
> >>>>>>>>
> >>>>>>>> That we could add in a couple of places in pciback to stop it from
> >>>>>>>> initializing the parts we don't care about. Something along these lines
> >>>>>>>> (untested and probably incomplete).
> >>>>>>>>
> >>>>>>>> What do you guys think?
> >>>>>>>
> >>>>>>> Uh no, not in this way, please. This will kill pci passthrough on x86
> >>>>>>> with dom0 running as PVH. I don't think this is working right now, but
> >>>>>>> adding more code making it even harder to work should be avoided.
> >>>>>>>
> >>>>>>>> diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
> >>>>>>>> index da34ce85dc88..991ba0a9b359 100644
> >>>>>>>> --- a/drivers/xen/xen-pciback/xenbus.c
> >>>>>>>> +++ b/drivers/xen/xen-pciback/xenbus.c
> >>>>>>>> @@ -15,6 +15,7 @@
> >>>>>>>>      #include <xen/xenbus.h>
> >>>>>>>>      #include <xen/events.h>
> >>>>>>>>      #include <xen/pci.h>
> >>>>>>>> +#include <xen/xen.h>
> >>>>>>>>      #include "pciback.h"
> >>>>>>>>        #define INVALID_EVTCHN_IRQ  (-1)
> >>>>>>>> @@ -685,8 +686,12 @@ static int xen_pcibk_xenbus_probe(struct xenbus_device *dev,
> >>>>>>>>                      const struct xenbus_device_id *id)
> >>>>>>>>      {
> >>>>>>>>          int err = 0;
> >>>>>>>> -    struct xen_pcibk_device *pdev = alloc_pdev(dev);
> >>>>>>>> +    struct xen_pcibk_device *pdev;
> >>>>>>>> +
> >>>>>>>> +    if (!xen_pv_domain())
> >>>>>>>> +        return 0;
> >>>>>>>>      +    pdev = alloc_pdev(dev);
> >>>>>>>
> >>>>>>> This hunk isn't needed, as with bailing out of xen_pcibk_xenbus_register
> >>>>>>> early will result in xen_pcibk_xenbus_probe never being called.
> >>>>>>>
> >>>>>>>>          if (pdev == NULL) {
> >>>>>>>>              err = -ENOMEM;
> >>>>>>>>              xenbus_dev_fatal(dev, err,
> >>>>>>>> @@ -743,6 +748,9 @@ const struct xen_pcibk_backend *__read_mostly xen_pcibk_backend;
> >>>>>>>>        int __init xen_pcibk_xenbus_register(void)
> >>>>>>>>      {
> >>>>>>>> +    if (!xen_pv_domain())
> >>>>>>>> +        return 0;
> >>>>>>>> +
> >>>>>>>
> >>>>>>> Use #ifdef CONFIG_X86 instead.
> >>>>>>
> >>>>>> The title of this patch says that we want to allow this driver for other archs
> >>>>>> and now we want to introduce "#ifdef CONFIG_X86" which doesn't sound
> >>>>>> right with that respect. Instead, we may want having something like a
> >>>>>> dedicated gate for this, e.g. "#ifdef CONFIG_XEN_PCIDEV_BACKEND_SUPP_PV"
> >>>>>> or something which is architecture agnostic.
> >>>>>
> >>>>> Something like that, yes. But I'd rather use CONFIG_XEN_PCIDEV_BACKEND
> >>>>> acting as this gate and introduce CONFIG_XEN_PCI_STUB for the stub
> >>>>> functionality needed on Arm. XEN_PCIDEV_BACKEND would depend on X86 and
> >>>>> select XEN_PCI_STUB, while on Arm XEN_PCI_STUB could be configured if
> >>>>> wanted. The splitting of the driver can still be done later.
> >>>>
> >>>> Hm, pciback is now compiled when CONFIG_XEN_PCIDEV_BACKEND is enabled
> >>>> and we want to skip some parts of its code when CONFIG_XEN_PCI_STUB is set.
> >>>> So, I imagine that for x86 we just enable CONFIG_XEN_PCIDEV_BACKEND and the
> >>>> driver compiles in its current state. For Arm we enable both CONFIG_XEN_PCIDEV_BACKEND
> >>>> and CONFIG_XEN_PCI_STUB, so part of the driver is not compiled.
> >>>
> >>> No, I'd rather switch to compiling xen-pciback when CONFIG_XEN_PCI_STUB
> >>> is set and compile only parts of it when CONFIG_XEN_PCIDEV_BACKEND is
> >>> not set (this will be the case on Arm).
> >>
> >> But this will require that the existing kernel configurations out there have to additionally define CONFIG_XEN_PCI_STUB to get what they had before with simply enabling CONFIG_XEN_PCIDEV_BACKEND. My point was that it is probably desirable not to break
> >> the things while doing the split/re-work.
> >
> > By letting XEN_PCIDEV_BACKEND select XEN_PCI_STUB this won't happen.
> Indeed
> >
> >> I also thought that "compile only parts of it when CONFIG_XEN_PCIDEV_BACKEND is not set"
> >> may have more code gated rather than with gating unwanted code with CONFIG_XEN_PCI_STUB.
> >> I am not quite sure about this though.
> >
> > This would be a very weird semantics of XEN_PCI_STUB, as the stub part
> > is needed on X86 and on Arm.
> >
> > Gating could even be done with Stefano's patch just by replacing his
> > "!xen_pv_domain()" tests with "!IS_ENABLED(CONFIG_XEN_PCIDEV_BACKEND)".
> 
> Makes sense.
> 
> Another question if we do not want the code to be compiled or not executed?
> 
> If the later then we can define something like:
> 
> bool need_pv_part(void)
> 
> {
> 
>      return IS_ENABLED(CONFIG_XEN_PCIDEV_BACKEND);
> 
> }
> 
> and then just use need_pv_part() for the checks where it is needed.
> 
> This allows avoiding multiple ifdef's through the code

This is even better.

For my clarity, Oleksandr, are you OK with adding a few need_pv_part()
checks through the code as part of this series so that the PV PCI
backend is not initialized?

I don't have a good test environment ready for this, so I cannot really
volunteer myself.

I would prefer if we made this change as part of this series so that the
PV PCI backend features doesn't get enabled on ARM, not even temporarily.
--8323329-722727834-1632257047=:17979--

