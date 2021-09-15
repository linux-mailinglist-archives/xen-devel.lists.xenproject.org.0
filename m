Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A9540CDD7
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 22:19:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187878.336889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQbNQ-00008S-DQ; Wed, 15 Sep 2021 20:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187878.336889; Wed, 15 Sep 2021 20:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQbNQ-00005v-9w; Wed, 15 Sep 2021 20:19:28 +0000
Received: by outflank-mailman (input) for mailman id 187878;
 Wed, 15 Sep 2021 20:19:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+tO=OF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mQbNO-00005k-Oj
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 20:19:26 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a984686d-afd3-4eac-9718-63a830fc61cd;
 Wed, 15 Sep 2021 20:19:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 728D760E54;
 Wed, 15 Sep 2021 20:19:24 +0000 (UTC)
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
X-Inumbo-ID: a984686d-afd3-4eac-9718-63a830fc61cd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631737164;
	bh=iWfR+zpCXMOPRdW7D7sOhNO3mxAgwU5oc04Siu35BA4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Tgoa/QURVp+MAHy5GI/5U8Duszv1wB3UYpWR1chwDGRkZ0qWSkJQKk9lt29N5vXMv
	 JoEPhE7O4Klc3BZqtcT5dG/QGPpVO5rRnRN76aArJptjNkishPJm0MxRiE8wpdbjKl
	 hlM992GR1wXw7TK45gac1H7IdvEGPA6ASTLEQIu2uuz3N0aupHQoN4OoVL/O1e5KVs
	 DucxOqBKkx0HsqitH9M4lMqvWFdN0dFYzRj4zx4/+99NDwj8SUdh8Sfd6baF39BqXZ
	 ie04oQJwqd11OU3pvzqyckV/dEBvCqi9hPD2r/D6XjFv8UCEKpQwSn1g6R1HK5ycAu
	 JBFjjXIXgvHvA==
Date: Wed, 15 Sep 2021 13:19:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Rahul Singh <rahul.singh@arm.com>, 
    Julien Grall <julien.grall.oss@gmail.com>, 
    Oleksandr Andrushchenko <andr2000@gmail.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Artem Mygaiev <Artem_Mygaiev@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
In-Reply-To: <alpine.DEB.2.21.2109151246450.21985@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2109151311480.21985@sstabellini-ThinkPad-T480s>
References: <20210903083347.131786-1-andr2000@gmail.com> <20210903083347.131786-11-andr2000@gmail.com> <35f7faf6-db90-f279-8ed1-fa4ba96812fb@xen.org> <468a868c-1183-e05f-0c92-3cba172cecb3@epam.com> <9ec2c22c-b834-1c87-71af-236e13538c4a@xen.org>
 <15a930ff-77d5-b962-b346-c586a2769009@epam.com> <684b3534-40eb-add7-f46e-c6258904757b@xen.org> <alpine.DEB.2.21.2109101325110.10523@sstabellini-ThinkPad-T480s> <CAJ=z9a1pSoLpesjqNTiG3-t4+pvju3EetYzcFpuNzMdRWi1GYg@mail.gmail.com> <3ecfc742-b720-0381-dbd8-7147615494c8@epam.com>
 <1e71ebba-b2d3-1201-05ac-e035f182226f@epam.com> <alpine.DEB.2.21.2109141731410.21985@sstabellini-ThinkPad-T480s> <ee38bc53-c590-24d2-9061-3d4fd33f58bd@epam.com> <alpine.DEB.2.21.2109151246450.21985@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-269449723-1631737164=:21985"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-269449723-1631737164=:21985
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 15 Sep 2021, Stefano Stabellini wrote:
> On Wed, 15 Sep 2021, Oleksandr Andrushchenko wrote:
> > On 15.09.21 03:36, Stefano Stabellini wrote:
> > > On Tue, 14 Sep 2021, Oleksandr Andrushchenko wrote:
> > >> With the patch above I have the following log in Domain-0:
> > >>
> > >> generic-armv8-xt-dom0 login: root
> > >> root@generic-armv8-xt-dom0:~# (XEN) *** Serial input to Xen (type 'CTRL-a' three times to switch input)
> > >> (XEN) ==== PCI devices ====
> > >> (XEN) ==== segment 0000 ====
> > >> (XEN) 0000:03:00.0 - d0 - node -1
> > >> (XEN) 0000:02:02.0 - d0 - node -1
> > >> (XEN) 0000:02:01.0 - d0 - node -1
> > >> (XEN) 0000:02:00.0 - d0 - node -1
> > >> (XEN) 0000:01:00.0 - d0 - node -1
> > >> (XEN) 0000:00:00.0 - d0 - node -1
> > >> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
> > >>
> > >> root@generic-armv8-xt-dom0:~# modprobe e1000e
> > >> [   46.104729] e1000e: Intel(R) PRO/1000 Network Driver
> > >> [   46.105479] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> > >> [   46.107297] e1000e 0000:03:00.0: enabling device (0000 -> 0002)
> > >> (XEN) map [e0000, e001f] -> 0xe0000 for d0
> > >> (XEN) map [e0020, e003f] -> 0xe0020 for d0
> > >> [   46.178513] e1000e 0000:03:00.0: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
> > >> [   46.189668] pci_msi_setup_msi_irqs
> > >> [   46.191016] nwl_compose_msi_msg msg at fe440000
> > >> (XEN) traps.c:2014:d0v0 HSR=0x00000093810047 pc=0xffff8000104b4b00 gva=0xffff800010fa5000 gpa=0x000000e0040000
> > >> [   46.200455] Unhandled fault at 0xffff800010fa5000
> > >>
> > >> [snip]
> > >>
> > >> [   46.233079] Call trace:
> > >> [   46.233559]  __pci_write_msi_msg+0x70/0x180
> > >> [   46.234149]  pci_msi_domain_write_msg+0x28/0x30
> > >> [   46.234869]  msi_domain_activate+0x5c/0x88
> > >>
> > >>   From the above you can see that BARs are mapped for Domain-0 now
> > >>
> > >> only when an assigned PCI device gets enabled in Domain-0.
> > >>
> > >> Another thing to note is that we crash on MSI-X access as BARs are mapped
> > >>
> > >> to the domain while enabling memory decoding in the COMMAND register,
> > >>
> > >> but MSI-X are handled differently, e.g. we have MSI-X holes in the mappings.
> > >>
> > >> This is because before this change the whole PCI aperture was mapped into
> > >>
> > >> Domain-0 and it is not. Thus, MSI-X holes are left unmapped now and there
> > >>
> > >> was no need to do so, e.g. they were always mapped into Domain-0 and
> > >>
> > >> emulated for guests.
> > >>
> > >> Please note that one cannot use xl pci-attach in this case to attach the PCI device
> > >>
> > >> in question to Domain-0 as (please see the log) that device is already attached.
> > >>
> > >> Neither it can be detached and re-attached. So, without mapping MSI-X holes for
> > >>
> > >> Domain-0 the device becomes unusable in Domain-0. At the same time the device
> > >>
> > >> can be successfully passed to DomU.
> > >>
> > >>
> > >> Julien, Stefano! Please let me know how can we proceed with this.
> > > What was the plan for MSI-X in Dom0?
> > It just worked because we mapped everything
> > >
> > > Given that Dom0 interacts with a virtual-ITS and virtual-GIC rather than
> > > a physical-ITS and physical-GIC, I imagine that it wasn't correct for
> > > Dom0 to write to the real MSI-X table directly?
> > >
> > > Shouldn't Dom0 get emulated MSI-X tables like any DomU?
> > >
> > > Otherwise, if Dom0 is expected to have the real MSI-X tables mapped, then
> > > I would suggest to map them at the same time as the BARs. But I am
> > > thinking that Dom0 should get emulated MSI-X tables, not physical MSI-X
> > > tables.
> > 
> > Yes, it seems more than reasonable to enable emulation for Domain-0
> > 
> > as well. Other than that, Stefano, do you think we are good to go with
> > 
> > the changes I did in order to unmap everything for Domain-0?
> 
> 
> It might be better to resend the series with the patch in it, because it
> is difficult to review the patch like this. Nonetheless I tried, but I
> might have missed something.
> 
> Previously the whole PCIe bridge aperture was mapped to Dom0, and
> it was done by map_range_to_domain, is that correct?
> 
> Now this patch, to avoid mapping the entire aperture to Dom0, is
> skipping any operations for PCIe devices in map_range_to_domain by
> setting need_mapping = false.
> 
> The idea is that instead, we'll only map things when needed and not the
> whole aperture. However, looking at the changes to
> pci_host_bridge_mappings (formerly known as
> pci_host_bridge_need_p2m_mapping), it is still going through the full
> list of address ranges of the PCIe bridge and map each range one by one
> using map_range_to_domain. Also, pci_host_bridge_mappings is still
> called unconditionally at boot for Dom0.
> 
> So I am missing the part where the aperture is actually *not* mapped to
> Dom0. What's the difference between the loop in
> pci_host_bridge_mappings:
> 
>   for ( i = 0; i < dt_number_of_address(dev); i++ )
>     map_range_to_domain...
> 
> and the previous code in map_range_to_domain? I think I am missing
> something but as mentioned it is difficult to review the patch like this
> out of order.
> 
> Also, and this is minor, even if currently unused, it might be good to
> keep a length parameter to pci_host_bridge_need_p2m_mapping.

It looks like the filtering is done based on:

return cfg->phys_addr != addr

in pci_ecam_need_p2m_mapping that is expected to filter out the address
ranges we don't want to map because it comes from
xen/arch/arm/pci/pci-host-common.c:gen_pci_init:

    /* Parse our PCI ecam register address*/
    err = dt_device_get_address(dev, ecam_reg_idx, &addr, &size);
    if ( err )
        goto err_exit;

In pci_host_bridge_mappings, instead of parsing device tree again, can't
we just fetch the address and length we need to map straight from
bridge->sysdata->phys_addr/size ?

At the point when pci_host_bridge_mappings is called in your new patch,
we have already initialized all the PCIe-related data structures. It
seems a bit useless to have to go via device tree again.
--8323329-269449723-1631737164=:21985--

