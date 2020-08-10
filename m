Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF1A2413DE
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 01:34:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5HJX-0005Bl-3S; Mon, 10 Aug 2020 23:34:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcVj=BU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k5HJV-0005BU-9d
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 23:34:45 +0000
X-Inumbo-ID: 4a739c9c-53b9-4d4d-9c1b-a74747a7275b
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a739c9c-53b9-4d4d-9c1b-a74747a7275b;
 Mon, 10 Aug 2020 23:34:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6641C206DA;
 Mon, 10 Aug 2020 23:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597102484;
 bh=aAcQyU5g0zrcYfx/4ZmXuH+wo4uNDaDrQKM52vHMFmc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=l4P/2mr17zKPaWYyx5GSq1eSVeLV8zRyqumDkFneWk5sdHFJFLSJkE3R772/1WAQH
 9EmdHqPsQb2nu/TQytziZuZiALAAEr03tUa3zPWF+DIkukOqdGn9n0LWtkvE3Jus5J
 y0/iHC9XounscuHTzaTXXUHh1ItIbzSfFXts0TR8=
Date: Mon, 10 Aug 2020 16:34:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature
 common
In-Reply-To: <598e2f35-e70e-36a7-1e5d-259ebb2e3cde@xen.org>
Message-ID: <alpine.DEB.2.21.2008101433050.16004@sstabellini-ThinkPad-T480s>
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
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2138485484-1597095280=:16004"
Content-ID: <alpine.DEB.2.21.2008101435020.16004@sstabellini-ThinkPad-T480s>
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
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Wei Liu' <wl@xen.org>, paul@xen.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 Oleksandr <olekstysh@gmail.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Julien Grall' <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2138485484-1597095280=:16004
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2008101435021.16004@sstabellini-ThinkPad-T480s>

On Mon, 10 Aug 2020, Julien Grall wrote:
> On 07/08/2020 00:48, Stefano Stabellini wrote:
> > On Thu, 6 Aug 2020, Julien Grall wrote:
> > > On 06/08/2020 01:37, Stefano Stabellini wrote:
> > > > On Wed, 5 Aug 2020, Julien Grall wrote:
> > > > > On 04/08/2020 20:11, Stefano Stabellini wrote:
> > > > > > On Tue, 4 Aug 2020, Julien Grall wrote:
> > > > > > > On 04/08/2020 12:10, Oleksandr wrote:
> > > > > > > > On 04.08.20 10:45, Paul Durrant wrote:
> > > > > > > > > > +static inline bool hvm_ioreq_needs_completion(const ioreq_t
> > > > > > > > > > *ioreq)
> > > > > > > > > > +{
> > > > > > > > > > +    return ioreq->state == STATE_IOREQ_READY &&
> > > > > > > > > > +           !ioreq->data_is_ptr &&
> > > > > > > > > > +           (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir !=
> > > > > > > > > > IOREQ_WRITE);
> > > > > > > > > > +}
> > > > > > > > > I don't think having this in common code is correct. The
> > > > > > > > > short-cut
> > > > > > > > > of
> > > > > > > > > not
> > > > > > > > > completing PIO reads seems somewhat x86 specific.
> > > > > > > 
> > > > > > > Hmmm, looking at the code, I think it doesn't wait for PIO writes
> > > > > > > to
> > > > > > > complete
> > > > > > > (not read). Did I miss anything?
> > > > > > > 
> > > > > > > > Does ARM even
> > > > > > > > > have the concept of PIO?
> > > > > > > > 
> > > > > > > > I am not 100% sure here, but it seems that doesn't have.
> > > > > > > 
> > > > > > > Technically, the PIOs exist on Arm, however they are accessed the
> > > > > > > same
> > > > > > > way
> > > > > > > as
> > > > > > > MMIO and will have a dedicated area defined by the HW.
> > > > > > > 
> > > > > > > AFAICT, on Arm64, they are only used for PCI IO Bar.
> > > > > > > 
> > > > > > > Now the question is whether we want to expose them to the Device
> > > > > > > Emulator
> > > > > > > as
> > > > > > > PIO or MMIO access. From a generic PoV, a DM shouldn't have to
> > > > > > > care
> > > > > > > about
> > > > > > > the
> > > > > > > architecture used. It should just be able to request a given
> > > > > > > IOport
> > > > > > > region.
> > > > > > > 
> > > > > > > So it may make sense to differentiate them in the common ioreq
> > > > > > > code as
> > > > > > > well.
> > > > > > > 
> > > > > > > I had a quick look at QEMU and wasn't able to tell if PIOs and
> > > > > > > MMIOs
> > > > > > > address
> > > > > > > space are different on Arm as well. Paul, Stefano, do you know
> > > > > > > what
> > > > > > > they
> > > > > > > are
> > > > > > > doing?
> > > > > > 
> > > > > > On the QEMU side, it looks like PIO (address_space_io) is used in
> > > > > > connection with the emulation of the "in" or "out" instructions, see
> > > > > > ioport.c:cpu_inb for instance. Some parts of PCI on QEMU emulate PIO
> > > > > > space regardless of the architecture, such as
> > > > > > hw/pci/pci_bridge.c:pci_bridge_initfn.
> > > > > > 
> > > > > > However, because there is no "in" and "out" on ARM, I don't think
> > > > > > address_space_io can be accessed. Specifically, there is no
> > > > > > equivalent
> > > > > > for target/i386/misc_helper.c:helper_inb on ARM.
> > > > > 
> > > > > So how PCI I/O BAR are accessed? Surely, they could be used on Arm,
> > > > > right?
> > > > 
> > > > PIO is also memory mapped on ARM and it seems to have its own MMIO
> > > > address window.
> > > This part is already well-understood :). However, this only tell us how an
> > > OS
> > > is accessing a PIO.
> > > 
> > > What I am trying to figure out is how the hardware (or QEMU) is meant to
> > > work.
> > > 
> > >  From my understanding, the MMIO access will be received by the hostbridge
> > > and
> > > then forwarded to the appropriate PCI device. The two questions I am
> > > trying to
> > > answer is: How the I/O BARs are configured? Will it contain an MMIO
> > > address or
> > > an offset?
> > > 
> > > If the answer is the latter, then we will need PIO because a DM will never
> > > see
> > > the MMIO address (the hostbridge will be emulated in Xen).
> > 
> > Now I understand the question :-)
> > 
> > This is the way I understand it works. Let's say that the PIO aperture
> > is 0x1000-0x2000 which is aliased to 0x3eff0000-0x3eff1000.
> > 0x1000-0x2000 are addresses that cannot be accessed directly.
> > 0x3eff0000-0x3eff1000 is the range that works.
> > 
> > A PCI device PIO BAR will have an address in the 0x1000-0x2000 range,
> > for instance 0x1100.
> > 
> > However, when the operating system access 0x1100, it will issue a read
> > to 0x3eff0100.
> > 
> > Xen will trap the read to 0x3eff0100 and send it to QEMU.
> > 
> > QEMU has to know that 0x3eff0000-0x3eff1000 is the alias to the PIO
> > aperture and that 0x3eff0100 correspond to PCI device foobar. Similarly,
> > QEMU has also to know the address range of the MMIO aperture and its
> > remappings, if any (it is possible to have address remapping for MMIO
> > addresses too.)
> > 
> > I think today this information is "built-in" QEMU, not configurable. It
> > works fine because *I think* the PCI aperture is pretty much the same on
> > x86 boards, at least the one supported by QEMU for Xen.
> 
> Well on x86, the OS will access PIO using inb/outb. So the address received by
> Xen is 0x1000-0x2000 and then forwarded to the DM using the PIO type.
> 
> > On ARM, I think we should explicitly declare the PCI MMIO aperture and
> > its alias/address-remapping. When we do that, we can also declare the
> > PIO aperture and its alias/address-remapping.
> 
> Well yes, we need to define PCI MMIO and PCI I/O region because the guest OS
> needs to know them.

[1]
(see below)


> However, I am unsure how this would help us to solve the question whether
> access to the PCI I/O aperture should be sent as a PIO or MMIO.
> 
> Per what you wrote, the PCI I/O Bar would be configured with the range
> 0x1000-0x2000. So a device emulator (this may not be QEMU and only emulate one
> PCI device!!) will only see that range.
> 
> How does the device-emulator then know that it needs to watch the region
> 0x3eff0000-0x3eff1000?

It would know because the PCI PIO aperture, together with the alias, are
specified [1].


> It feels to me that it would be easier/make more sense if the DM only say "I
> want to watch the PIO range 0x1000-0x2000". So Xen would be in charge to do
> the translation between the OS view and the DM view.
> 
> This also means a DM would be completely arch-agnostic. This would follow the
> HW where you can plug your PCI card on any HW.

As you know, PIO access is actually not modelled by QEMU for ARM
targets. I worry about the long term stability of it, given that it is
untested.  I.e. qemu-system-aarch64 could have a broken PIO emulation
and nobody would find out except for us when we send ioreqs to it.

Thinking from a Xen/Emulator interface on ARM, is it wise to rely on an
access-type that doesn't exist on the architecture?
--8323329-2138485484-1597095280=:16004--

