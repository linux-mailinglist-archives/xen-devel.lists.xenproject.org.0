Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C17ED24C961
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 02:54:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8vIs-0006HI-UU; Fri, 21 Aug 2020 00:53:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0g3v=B7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k8vIr-0006HD-4J
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 00:53:09 +0000
X-Inumbo-ID: c5a9570c-d70a-4170-a8a8-226b9a23eb52
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5a9570c-d70a-4170-a8a8-226b9a23eb52;
 Fri, 21 Aug 2020 00:53:08 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DCFE720702;
 Fri, 21 Aug 2020 00:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597971187;
 bh=Qzxz/OvGselXFRwu7XEv2h11Q3eqN6KDPy0We+WH4Pg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Q2a4hybKcCnJGZsYZWw1Ox/dnisBj1Us3FPPs+CRv/kzKwOUDrrMnmqZwixYkB/zK
 g5yE7WAksyDCJYOi3RKFFH8xkn5/SDmxBMArEmsdlJyb43JwovVXU0sD1QTcPDNQf/
 TH9KGiTth0OLr4nZ5vVC0LM9hLuvn6EAgWutz0FM=
Date: Thu, 20 Aug 2020 17:53:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 paul@xen.org, xen-devel@lists.xenproject.org, 
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>, 
 'Jan Beulich' <jbeulich@suse.com>, 
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>, 
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>, 
 'George Dunlap' <george.dunlap@citrix.com>, 
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 
 'Jun Nakajima' <jun.nakajima@intel.com>, 
 'Kevin Tian' <kevin.tian@intel.com>, 'Tim Deegan' <tim@xen.org>, 
 'Julien Grall' <julien.grall@arm.com>
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature
 common
In-Reply-To: <30bf5755-8324-7612-9392-1a25a361e69f@gmail.com>
Message-ID: <alpine.DEB.2.21.2008201620360.6005@sstabellini-ThinkPad-T480s>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
 <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
 <alpine.DEB.2.21.2008041105510.5748@sstabellini-ThinkPad-T480s>
 <5df97055-67f9-16cc-a274-864672d67164@xen.org>
 <alpine.DEB.2.21.2008051121580.5748@sstabellini-ThinkPad-T480s>
 <1afb9ffd-088c-ef4e-131a-0f2b62142405@xen.org>
 <alpine.DEB.2.21.2008061352141.16004@sstabellini-ThinkPad-T480s>
 <598e2f35-e70e-36a7-1e5d-259ebb2e3cde@xen.org>
 <alpine.DEB.2.21.2008101433050.16004@sstabellini-ThinkPad-T480s>
 <3e9c1820-5a75-49d7-0a97-4c24b20986c3@xen.org>
 <alpine.DEB.2.21.2008111446500.15669@sstabellini-ThinkPad-T480s>
 <19d27a9a-ca14-cb86-52a1-6441bd24933a@xen.org>
 <30bf5755-8324-7612-9392-1a25a361e69f@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 20 Aug 2020, Oleksandr wrote:
> > On 11/08/2020 23:48, Stefano Stabellini wrote:
> > > > I have the impression that we disagree in what the Device Emulator is
> > > > meant to
> > > > do. IHMO, the goal of the device emulator is to emulate a device in an
> > > > arch-agnostic way.
> > > 
> > > That would be great in theory but I am not sure it is achievable: if we
> > > use an existing emulator like QEMU, even a single device has to fit
> > > into QEMU's view of the world, which makes assumptions about host
> > > bridges and apertures. It is impossible today to build QEMU in an
> > > arch-agnostic way, it has to be tied to an architecture.
> > 
> > AFAICT, the only reason QEMU cannot build be in an arch-agnostic way is
> > because of TCG. If this wasn't built then you could easily write a machine
> > that doesn't depend on the instruction set.
> > 
> > The proof is, today, we are using QEMU x86 to serve Arm64 guest. Although
> > this is only for PV drivers.
> > 
> > > 
> > > I realize we are not building this interface for QEMU specifically, but
> > > even if we try to make the interface arch-agnostic, in reality the
> > > emulators won't be arch-agnostic.
> > 
> > This depends on your goal. If your goal is to write a standalone emulator
> > for a single device, then it is entirely possible to make it arch-agnostic.
> > 
> > Per above, this would even be possible if you were emulating a set of
> > devices.
> > 
> > What I want to avoid is requiring all the emulators to contain arch-specific
> > code just because it is easier to get QEMU working on Xen on Arm.
> > 
> > > If we send a port-mapped I/O request
> > > to qemu-system-aarch64 who knows what is going to happen: it is a code
> > > path that it is not explicitly tested.
> > 
> > Maybe, maybe not. To me this is mostly software issues that can easily be
> > mitigated if we do proper testing...
> 
> Could we please find a common ground on whether the PIO handling needs to be
> implemented on Arm or not? At least for the current patch series.

Can you do a test on QEMU to verify which address space the PIO BARs are
using on ARM? I don't know if there is an easy way to test it but it
would be very useful for this conversation.


> Below my thoughts:
> From one side I agree that emulator shouldn't contain any arch-specific code,
> yes it is hypervisor specific but it should be arch agnostic if possible. So
> PIO case should be handled.
> From other side I tend to think that it might be possible to skip PIO handling
> for the current patch series (leave it x86 specific for now as we do with
> handle_realmode_completion()).
> I think nothing will prevent us from adding PIO handling later on if there is
> a real need (use-case) for that. Please correct me if I am wrong.
> 
> I would be absolutely OK with any options.
> 
> What do you think?

I agree that PIO handling is not the most critical thing right now given
that we have quite a few other important TODOs in the series. I'd be
fine reviewing another version of the series with this issue still
pending.


Of course, PIO needs to be handled. The key to me is that QEMU (or other
emulator) should *not* emulate in/out instructions on ARM. PIO ioreq
requests should not be satisfied by using address_space_io directly (the
PIO address space that requires special instructions to access it). In
QEMU the PIO reads/writes should be done via address_space_memory (the
normal memory mapped address space).

So either way of the following approaches should be OK:

1) Xen sends out PIO addresses as memory mapped addresses, QEMU simply
   reads/writes on them
2) Xen sends out PIO addresses as address_space_io, QEMU finds the
   mapping to address_space_memory, then reads/writes on
   address_space_memory

From an interface and implementation perspective, 1) means that
IOREQ_TYPE_PIO is unused on ARM, while 2) means that IOREQ_TYPE_PIO is
still used as part of the ioreq interface, even if QEMU doesn't directly
operate on those addresses.

My preference is 1) because it leads to a simpler solution.

