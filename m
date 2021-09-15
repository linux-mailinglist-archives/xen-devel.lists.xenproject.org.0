Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3E240BCB3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 02:36:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187113.335853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQIuE-0000K5-S0; Wed, 15 Sep 2021 00:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187113.335853; Wed, 15 Sep 2021 00:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQIuE-0000Hb-P5; Wed, 15 Sep 2021 00:36:06 +0000
Received: by outflank-mailman (input) for mailman id 187113;
 Wed, 15 Sep 2021 00:36:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+tO=OF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mQIuD-0000HU-9s
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 00:36:05 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0b6d54e-1a06-44f3-8ea1-cee554687c5c;
 Wed, 15 Sep 2021 00:36:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C5666121E;
 Wed, 15 Sep 2021 00:36:03 +0000 (UTC)
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
X-Inumbo-ID: a0b6d54e-1a06-44f3-8ea1-cee554687c5c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631666163;
	bh=5/ccFTamaZvBXeAJx3CTBWIVIcgIHELyJe4Bn2xdoXI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EOK6KsAXGxYQPMs1jmFZJ/ZQeOI533u1tKLhSWaucgYJZ8dqY25vHr2fNrk7/WwT3
	 W9U5+3ZXyVAu/8BcIie5sb+FriMs2rshFIR2z1KBr3Kn6Up7XzF9w/HQzhe6inmOA+
	 Bs1mQXaOwX7kLPUYG3vOkjLIBst+72dovIjz7HvpuH46qiBvf+/dA1YZUCfwKjx9sH
	 TRPp7/xoWoQqU+A0soPlMpPEkaan5EhPvWmB1nrD+4Trxaf/hBcUalTwuIj/gJ67VP
	 ogv2NIPVeDELT9mJSXdPFTsOI3F3y61UaMH2hAtk+O98/Of+pPr7yBLJO0kQJCWIpr
	 HmpuXmmjV9zfQ==
Date: Tue, 14 Sep 2021 17:36:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
cc: Julien Grall <julien.grall.oss@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Andrushchenko <andr2000@gmail.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Artem Mygaiev <Artem_Mygaiev@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
In-Reply-To: <1e71ebba-b2d3-1201-05ac-e035f182226f@epam.com>
Message-ID: <alpine.DEB.2.21.2109141731410.21985@sstabellini-ThinkPad-T480s>
References: <20210903083347.131786-1-andr2000@gmail.com> <20210903083347.131786-11-andr2000@gmail.com> <35f7faf6-db90-f279-8ed1-fa4ba96812fb@xen.org> <468a868c-1183-e05f-0c92-3cba172cecb3@epam.com> <9ec2c22c-b834-1c87-71af-236e13538c4a@xen.org>
 <15a930ff-77d5-b962-b346-c586a2769009@epam.com> <684b3534-40eb-add7-f46e-c6258904757b@xen.org> <alpine.DEB.2.21.2109101325110.10523@sstabellini-ThinkPad-T480s> <CAJ=z9a1pSoLpesjqNTiG3-t4+pvju3EetYzcFpuNzMdRWi1GYg@mail.gmail.com> <3ecfc742-b720-0381-dbd8-7147615494c8@epam.com>
 <1e71ebba-b2d3-1201-05ac-e035f182226f@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-250997749-1631666163=:21985"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-250997749-1631666163=:21985
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 14 Sep 2021, Oleksandr Andrushchenko wrote:
> With the patch above I have the following log in Domain-0:
> 
> generic-armv8-xt-dom0 login: root
> root@generic-armv8-xt-dom0:~# (XEN) *** Serial input to Xen (type 'CTRL-a' three times to switch input)
> (XEN) ==== PCI devices ====
> (XEN) ==== segment 0000 ====
> (XEN) 0000:03:00.0 - d0 - node -1
> (XEN) 0000:02:02.0 - d0 - node -1
> (XEN) 0000:02:01.0 - d0 - node -1
> (XEN) 0000:02:00.0 - d0 - node -1
> (XEN) 0000:01:00.0 - d0 - node -1
> (XEN) 0000:00:00.0 - d0 - node -1
> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
> 
> root@generic-armv8-xt-dom0:~# modprobe e1000e
> [   46.104729] e1000e: Intel(R) PRO/1000 Network Driver
> [   46.105479] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> [   46.107297] e1000e 0000:03:00.0: enabling device (0000 -> 0002)
> (XEN) map [e0000, e001f] -> 0xe0000 for d0
> (XEN) map [e0020, e003f] -> 0xe0020 for d0
> [   46.178513] e1000e 0000:03:00.0: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
> [   46.189668] pci_msi_setup_msi_irqs
> [   46.191016] nwl_compose_msi_msg msg at fe440000
> (XEN) traps.c:2014:d0v0 HSR=0x00000093810047 pc=0xffff8000104b4b00 gva=0xffff800010fa5000 gpa=0x000000e0040000
> [   46.200455] Unhandled fault at 0xffff800010fa5000
> 
> [snip]
> 
> [   46.233079] Call trace:
> [   46.233559]  __pci_write_msi_msg+0x70/0x180
> [   46.234149]  pci_msi_domain_write_msg+0x28/0x30
> [   46.234869]  msi_domain_activate+0x5c/0x88
> 
>  From the above you can see that BARs are mapped for Domain-0 now
> 
> only when an assigned PCI device gets enabled in Domain-0.
> 
> Another thing to note is that we crash on MSI-X access as BARs are mapped
> 
> to the domain while enabling memory decoding in the COMMAND register,
> 
> but MSI-X are handled differently, e.g. we have MSI-X holes in the mappings.
> 
> This is because before this change the whole PCI aperture was mapped into
> 
> Domain-0 and it is not. Thus, MSI-X holes are left unmapped now and there
> 
> was no need to do so, e.g. they were always mapped into Domain-0 and
> 
> emulated for guests.
> 
> Please note that one cannot use xl pci-attach in this case to attach the PCI device
> 
> in question to Domain-0 as (please see the log) that device is already attached.
> 
> Neither it can be detached and re-attached. So, without mapping MSI-X holes for
> 
> Domain-0 the device becomes unusable in Domain-0. At the same time the device
> 
> can be successfully passed to DomU.
> 
> 
> Julien, Stefano! Please let me know how can we proceed with this.

What was the plan for MSI-X in Dom0?

Given that Dom0 interacts with a virtual-ITS and virtual-GIC rather than
a physical-ITS and physical-GIC, I imagine that it wasn't correct for
Dom0 to write to the real MSI-X table directly?

Shouldn't Dom0 get emulated MSI-X tables like any DomU?

Otherwise, if Dom0 is expected to have the real MSI-X tables mapped, then
I would suggest to map them at the same time as the BARs. But I am
thinking that Dom0 should get emulated MSI-X tables, not physical MSI-X
tables.
--8323329-250997749-1631666163=:21985--

