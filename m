Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4EC41294C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 01:17:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191234.341174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSSWI-0002V9-4Y; Mon, 20 Sep 2021 23:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191234.341174; Mon, 20 Sep 2021 23:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSSWI-0002TC-0i; Mon, 20 Sep 2021 23:16:18 +0000
Received: by outflank-mailman (input) for mailman id 191234;
 Mon, 20 Sep 2021 23:16:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I4IA=OK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mSSWG-0002T6-Uu
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 23:16:16 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a795e827-7cfa-45a1-82af-2d2fb623ec1a;
 Mon, 20 Sep 2021 23:16:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07D2961211;
 Mon, 20 Sep 2021 23:16:13 +0000 (UTC)
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
X-Inumbo-ID: a795e827-7cfa-45a1-82af-2d2fb623ec1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632179774;
	bh=lWL8fnGNKTXM4Bi+yAVp1+gpNMDcF8Ek0Z+rLqzdBB8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YEnp5FBXjtQsJausdghHKuLJItlSCUlpC2G+ai9iRGx9pGdDBniFNbpSBrobhC0Cz
	 udviL2kOafQidCQaV1xpH53ha4GYfV8xaqKhTHHg3aM/g28kQEiFmht2+HiBCq5nFB
	 GgqQa2vfu0+UORnW/8LvucewzMCrF3iKcRVzst9Jn+OHtBs8+6XhhDJtYnupvsaYhP
	 CveIWnFLn9iU64Jv8J+Z3MLhIpBwWNSgNH2rkTgxkZYjz0PtV91H2V2cvyvvQoWGEm
	 XBA5u+LZ0fERDYZguxuCh5HEbxpt2axAUFxdc7bj27chIwpKeS7uCQCUqleJgSI1CS
	 dNpWHWgV3/m6g==
Date: Mon, 20 Sep 2021 16:16:06 -0700 (PDT)
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
In-Reply-To: <7f873e38-0362-1f60-7347-a490c9dc8572@epam.com>
Message-ID: <alpine.DEB.2.21.2109201444040.17979@sstabellini-ThinkPad-T480s>
References: <20210917130123.1764493-1-andr2000@gmail.com> <alpine.DEB.2.21.2109171442070.21985@sstabellini-ThinkPad-T480s> <d81486bc-9a2b-8675-ba4d-828d3adc75fc@epam.com> <35e2e36a-bade-d801-faa1-c9953678bb9d@suse.com>
 <7f873e38-0362-1f60-7347-a490c9dc8572@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1040504615-1632174404=:17979"
Content-ID: <alpine.DEB.2.21.2109201454550.17979@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1040504615-1632174404=:17979
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109201454551.17979@sstabellini-ThinkPad-T480s>

On Mon, 20 Sep 2021, Oleksandr Andrushchenko wrote:
> On 20.09.21 14:30, Juergen Gross wrote:
> > On 20.09.21 07:23, Oleksandr Andrushchenko wrote:
> >> Hello, Stefano!
> >>
> >> On 18.09.21 00:45, Stefano Stabellini wrote:
> >>> Hi Oleksandr,
> >>>
> >>> Why do you want to enable pciback on ARM? Is it only to "disable" a PCI
> >>> device in Dom0 so that it can be safely assigned to a DomU?
> >> Not only that
> >>>
> >>> I am asking because actually I don't think we want to enable the PV PCI
> >>> backend feature of pciback on ARM, right? That would clash with the PCI
> >>> assignment work you have been doing in Xen. They couldn't both work at
> >>> the same time.
> >> Correct, it is not used
> >>>
> >>> If we only need pciback to "park" a device in Dom0, wouldn't it be
> >>> possible and better to use pci-stub instead?
> >>
> >> Not only that, so pci-stub is not enough
> >>
> >> The functionality which is implemented by the pciback and the toolstack
> >> and which is relevant/missing/needed for ARM:
> >>
> >> 1. pciback is used as a database for assignable PCI devices, e.g. xl
> >>      pci-assignable-{add|remove|list} manipulates that list. So, whenever the
> >>      toolstack needs to know which PCI devices can be passed through it reads
> >>      that from the relevant sysfs entries of the pciback.
> >>
> >> 2. pciback is used to hold the unbound PCI devices, e.g. when passing through
> >>      a PCI device it needs to be unbound from the relevant device driver and bound
> >>      to pciback (strictly speaking it is not required that the device is bound to
> >>      pciback, but pciback is again used as a database of the passed through PCI
> >>      devices, so we can re-bind the devices back to their original drivers when
> >>      guest domain shuts down)
> >>
> >> 3. Device reset
> >>
> >> We have previously discussed on xen-devel ML possible solutions to that as from the
> >> above we see that pciback functionality is going to be only partially used on Arm.
> >>
> >> Please see [1] and [2]:
> >>
> >> 1. It is not acceptable to manage the assignable list in Xen itself
> >>
> >> 2. pciback can be split into two parts: PCI assignable/bind/reset handling and
> >> the rest like vPCI etc.
> >>
> >> 3. pcifront is not used on Arm
> >
> > It is neither in x86 PVH/HVM guests.
> Didn't know that, thank you for pointing
> >
> >> So, limited use of the pciback is one of the bricks used to enable PCI passthrough
> >> on Arm. It was enough to just re-structure the driver and have it run on Arm to achieve
> >> all the goals above.
> >>
> >> If we still think it is desirable to break the pciback driver into "common" and "pcifront specific"
> >> parts then it can be done, yet the patch is going to be the very first brick in that building.
> >
> > Doing this split should be done, as the pcifront specific part could be
> > omitted on x86, too, in case no PV guests using PCI passthrough have to
> > be supported.
> Agree, that the final solution should have the driver split
> >
> >> So, I think this patch is still going to be needed besides which direction we take.
> >
> > Some kind of this patch, yes. It might look different in case the split
> > is done first.
> >
> > I don't mind doing it in either sequence.
> >
> With this patch we have Arm on the same page as the above mentioned x86 guests,
> 
> e.g. the driver has unused code, but yet allows Arm to function now.
> 
> At this stage of PCI passthrough on Arm it is yet enough. Long term, when
> 
> the driver gets split, Arm will benefit from that split too, but unfortunately I do not
> 
> have enough bandwidth for that piece of work at the moment.

That's fair and I don't want to scope-creep this simple patch asking for
an enormous rework. At the same time I don't think we should enable the
whole of pciback on ARM because it would be erroneous and confusing.

I am wonder if there is a simple:

if (!xen_pv_domain())
    return;

That we could add in a couple of places in pciback to stop it from
initializing the parts we don't care about. Something along these lines
(untested and probably incomplete).

What do you guys think?


diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
index da34ce85dc88..991ba0a9b359 100644
--- a/drivers/xen/xen-pciback/xenbus.c
+++ b/drivers/xen/xen-pciback/xenbus.c
@@ -15,6 +15,7 @@
 #include <xen/xenbus.h>
 #include <xen/events.h>
 #include <xen/pci.h>
+#include <xen/xen.h>
 #include "pciback.h"
 
 #define INVALID_EVTCHN_IRQ  (-1)
@@ -685,8 +686,12 @@ static int xen_pcibk_xenbus_probe(struct xenbus_device *dev,
 				const struct xenbus_device_id *id)
 {
 	int err = 0;
-	struct xen_pcibk_device *pdev = alloc_pdev(dev);
+	struct xen_pcibk_device *pdev;
+
+	if (!xen_pv_domain())
+		return 0;
 
+	pdev = alloc_pdev(dev);
 	if (pdev == NULL) {
 		err = -ENOMEM;
 		xenbus_dev_fatal(dev, err,
@@ -743,6 +748,9 @@ const struct xen_pcibk_backend *__read_mostly xen_pcibk_backend;
 
 int __init xen_pcibk_xenbus_register(void)
 {
+	if (!xen_pv_domain())
+		return 0;
+
 	xen_pcibk_backend = &xen_pcibk_vpci_backend;
 	if (passthrough)
 		xen_pcibk_backend = &xen_pcibk_passthrough_backend;
@@ -752,5 +760,7 @@ int __init xen_pcibk_xenbus_register(void)
 
 void __exit xen_pcibk_xenbus_unregister(void)
 {
+	if (!xen_pv_domain())
+		return;
 	xenbus_unregister_driver(&xen_pcibk_driver);
 }
--8323329-1040504615-1632174404=:17979--

