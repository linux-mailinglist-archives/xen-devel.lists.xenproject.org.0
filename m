Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C366BDCCD
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 00:20:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510840.789296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcwt3-0008El-CV; Thu, 16 Mar 2023 23:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510840.789296; Thu, 16 Mar 2023 23:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcwt3-0008D3-9f; Thu, 16 Mar 2023 23:19:57 +0000
Received: by outflank-mailman (input) for mailman id 510840;
 Thu, 16 Mar 2023 23:19:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oCnM=7I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pcwt2-0008Cv-5I
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 23:19:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d902a20-c451-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 00:19:52 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF99462159;
 Thu, 16 Mar 2023 23:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B881DC433EF;
 Thu, 16 Mar 2023 23:19:48 +0000 (UTC)
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
X-Inumbo-ID: 0d902a20-c451-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679008790;
	bh=0Ui+QFNbO4bXSW38TRMdv5wxuQnQ6ojk72/vfky1yRQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T4MliAvQikyssleoqrLDNxKmApq/pL1gylOsBwb5q3IZysFSfTr1eaQmUql5eVJ0h
	 eFkEuxS2YQs8ewKPfw4GAKmkmjn1MnVCM4sEHfBs4RpqXH23mSFKbMqBqiy2BTnomD
	 agP3oZqGkuyYE+F251fKEz5H7YjTj241PCAZK45U0dS962/Caoj37LEoG0oX2j4bLC
	 LU25Mg1FoS/byMv3V6H9SgrQiG+DJkY0AmcWdwH+yOfi4Bji08g7E3SUh8sG70KPSd
	 6nMhyLfCqf5WBSaRr7JoBBQSk43prGSDNRagWKiV2VZQ7ibDmdk1nez8Z7+FuCyKFF
	 K/o7aqd2KRKDg==
Date: Thu, 16 Mar 2023 16:19:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Huang Rui <ray.huang@amd.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
    Alex Deucher <alexander.deucher@amd.com>, 
    =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Xenia Ragiadakou <burzalodowa@gmail.com>, 
    Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, 
    Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH 6/6] tools/libs/light: pci: translate irq to
 gsi
In-Reply-To: <df607690-0bfb-94a3-fac6-5e20f183dc20@suse.com>
Message-ID: <alpine.DEB.2.22.394.2303161611220.3359@ubuntu-linux-20-04-desktop>
References: <20230312075455.450187-1-ray.huang@amd.com> <20230312075455.450187-7-ray.huang@amd.com> <ZBHz7PpUbKM69Xxe@Air-de-Roger> <alpine.DEB.2.22.394.2303151729590.3462@ubuntu-linux-20-04-desktop> <e8843d7a-eecc-373c-a6b3-6a893bc0eb2a@suse.com>
 <ZBLg8WB8HCoZvwz5@Air-de-Roger> <df607690-0bfb-94a3-fac6-5e20f183dc20@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2083778631-1679008300=:3359"
Content-ID: <alpine.DEB.2.22.394.2303161612221.3359@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2083778631-1679008300=:3359
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2303161612222.3359@ubuntu-linux-20-04-desktop>

On Thu, 16 Mar 2023, Jan Beulich wrote:
> On 16.03.2023 10:27, Roger Pau Monné wrote:
> > On Thu, Mar 16, 2023 at 09:55:03AM +0100, Jan Beulich wrote:
> >> On 16.03.2023 01:44, Stefano Stabellini wrote:
> >>> On Wed, 15 Mar 2023, Roger Pau Monné wrote:
> >>>> On Sun, Mar 12, 2023 at 03:54:55PM +0800, Huang Rui wrote:
> >>>>> From: Chen Jiqian <Jiqian.Chen@amd.com>
> >>>>>
> >>>>> Use new xc_physdev_gsi_from_irq to get the GSI number
> >>>>>
> >>>>> Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
> >>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >>>>> ---
> >>>>>  tools/libs/light/libxl_pci.c | 1 +
> >>>>>  1 file changed, 1 insertion(+)
> >>>>>
> >>>>> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> >>>>> index f4c4f17545..47cf2799bf 100644
> >>>>> --- a/tools/libs/light/libxl_pci.c
> >>>>> +++ b/tools/libs/light/libxl_pci.c
> >>>>> @@ -1486,6 +1486,7 @@ static void pci_add_dm_done(libxl__egc *egc,
> >>>>>          goto out_no_irq;
> >>>>>      }
> >>>>>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
> >>>>> +        irq = xc_physdev_gsi_from_irq(ctx->xch, irq);
> >>>>
> >>>> This is just a shot in the dark, because I don't really have enough
> >>>> context to understand what's going on here, but see below.
> >>>>
> >>>> I've taken a look at this on my box, and it seems like on
> >>>> dom0 the value returned by /sys/bus/pci/devices/SBDF/irq is not
> >>>> very consistent.
> >>>>
> >>>> If devices are in use by a driver the irq sysfs node reports either
> >>>> the GSI irq or the MSI IRQ (in case a single MSI interrupt is
> >>>> setup).
> >>>>
> >>>> It seems like pciback in Linux does something to report the correct
> >>>> value:
> >>>>
> >>>> root@lcy2-dt107:~# cat /sys/bus/pci/devices/0000\:00\:14.0/irq
> >>>> 74
> >>>> root@lcy2-dt107:~# xl pci-assignable-add 00:14.0
> >>>> root@lcy2-dt107:~# cat /sys/bus/pci/devices/0000\:00\:14.0/irq
> >>>> 16
> >>>>
> >>>> As you can see, making the device assignable changed the value
> >>>> reported by the irq node to be the GSI instead of the MSI IRQ, I would
> >>>> think you are missing something similar in the PVH setup (some pciback
> >>>> magic)?
> >>>>
> >>>> Albeit I have no idea why you would need to translate from IRQ to GSI
> >>>> in the way you do in this and related patches, because I'm missing the
> >>>> context.
> >>>
> >>> As I mention in another email, also keep in mind that we need QEMU to
> >>> work and QEMU calls:
> >>> 1) xc_physdev_map_pirq (this is also called from libxl)
> >>> 2) xc_domain_bind_pt_pci_irq
> >>>
> >>>
> >>> In this case IRQ != GSI (IRQ == 112, GSI == 28). Sysfs returns the IRQ
> >>> in Linux (112), but actually xc_physdev_map_pirq expects the GSI, not
> >>> the IRQ. If you look at the implementation of xc_physdev_map_pirq,
> >>> you'll the type is "MAP_PIRQ_TYPE_GSI" and also see the check in Xen
> >>> xen/arch/x86/irq.c:allocate_and_map_gsi_pirq:
> >>>
> >>>     if ( index < 0 || index >= nr_irqs_gsi )
> >>>     {
> >>>         dprintk(XENLOG_G_ERR, "dom%d: map invalid irq %d\n", d->domain_id,
> >>>                 index);
> >>>         return -EINVAL;
> >>>     }
> >>>
> >>> nr_irqs_gsi < 112, and the check will fail.
> >>>
> >>> So we need to pass the GSI to xc_physdev_map_pirq. To do that, we need
> >>> to discover the GSI number corresponding to the IRQ number.
> >>
> >> That's one possible approach. Another could be (making a lot of assumptions)
> >> that a PVH Dom0 would pass in the IRQ it knows for this interrupt and Xen
> >> then translates that to GSI, knowing that PVH doesn't have (host) GSIs
> >> exposed to it.
> > 
> > I don't think Xen can translate a Linux IRQ to a GSI, as that's a
> > Linux abstraction Xen has no part in.
> 
> Well, I was talking about whatever Dom0 and Xen use to communicate. I.e.
> if at all I might have meant pIRQ, but now that you mention ...
> 
> > The GSIs exposed to a PVH dom0 are the native (host) ones, as we
> > create an emulated IO-APIC topology that mimics the physical one.
> > 
> > Question here is why Linux ends up with a IRQ != GSI, as it's my
> > understanding on Linux GSIs will always be identity mapped to IRQs, and
> > the IRQ space up to the last possible GSI is explicitly reserved for
> > this purpose.
> 
> ... this I guess pIRQ was a PV-only concept, and it really ought to be
> GSI in the PVH case. So yes, it then all boils down to that Linux-
> internal question.

Excellent question but we'll have to wait for Ray as he is the one with
access to the hardware. But I have this data I can share in the
meantime:

[    1.260378] IRQ to pin mappings:
[    1.260387] IRQ1 -> 0:1
[    1.260395] IRQ2 -> 0:2
[    1.260403] IRQ3 -> 0:3
[    1.260410] IRQ4 -> 0:4
[    1.260418] IRQ5 -> 0:5
[    1.260425] IRQ6 -> 0:6
[    1.260432] IRQ7 -> 0:7
[    1.260440] IRQ8 -> 0:8
[    1.260447] IRQ9 -> 0:9
[    1.260455] IRQ10 -> 0:10
[    1.260462] IRQ11 -> 0:11
[    1.260470] IRQ12 -> 0:12
[    1.260478] IRQ13 -> 0:13
[    1.260485] IRQ14 -> 0:14
[    1.260493] IRQ15 -> 0:15
[    1.260505] IRQ106 -> 1:8
[    1.260513] IRQ112 -> 1:4
[    1.260521] IRQ116 -> 1:13
[    1.260529] IRQ117 -> 1:14
[    1.260537] IRQ118 -> 1:15
[    1.260544] .................................... done.


And I think Ray traced the point in Linux where Linux gives us an IRQ ==
112 (which is the one causing issues):

__acpi_register_gsi->
        acpi_register_gsi_ioapic->
                mp_map_gsi_to_irq->
                        mp_map_pin_to_irq->
                                __irq_resolve_mapping()

        if (likely(data)) {
                desc = irq_data_to_desc(data);
                if (irq)
                        *irq = data->irq;
                /* this IRQ is 112, IO-APIC-34 domain */
        }
--8323329-2083778631-1679008300=:3359--

