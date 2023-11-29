Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2597FD0F3
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 09:34:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643733.1004191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8G0r-0005Ff-1b; Wed, 29 Nov 2023 08:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643733.1004191; Wed, 29 Nov 2023 08:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8G0q-0005Dn-VE; Wed, 29 Nov 2023 08:33:40 +0000
Received: by outflank-mailman (input) for mailman id 643733;
 Wed, 29 Nov 2023 08:33:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cdkt=HK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8G0p-0005Dh-Ca
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 08:33:39 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd8fd991-8e91-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 09:33:37 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5094cb3a036so8956598e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Nov 2023 00:33:37 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 f15-20020a05600c154f00b0040839fcb217sm1347500wmg.8.2023.11.29.00.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 00:33:36 -0800 (PST)
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
X-Inumbo-ID: fd8fd991-8e91-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701246816; x=1701851616; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rt+DX5bkiiUKtWGEjFn1G8zUFbW/79sGbOspaQsJ/TM=;
        b=C9UKVKYZvtXAE6Y6eJ3z3h9y3yOVa8cn297Mb3SG4vcsCs5pKorcoZLy+2fbaoKnvk
         VrqsvU4Lej7HJ3I84nSIH39qZ3ntnscUCAIlHWYBN4ePn42QvPNSLyMWnTmB17/Wvrbe
         02BeDJDj1jEk9GqhWoDlYdTk9yhVim5J3DMoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701246816; x=1701851616;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rt+DX5bkiiUKtWGEjFn1G8zUFbW/79sGbOspaQsJ/TM=;
        b=kqeAjE++xWAcPS53d9oJUsB93NyyaK/HzFO6JMd/nH0z3AQErMd2K/YBfeV0rPI7Yz
         YHY6omrjimugE2WeWDldEAtuEi8yAcNMasbiqTN0go5Ke+yXmm74t/lgsE6goiWc+kCG
         XMZV9ICn1SaYFN9/1UxsMtAzAjeOb0fps6yNJC8mVSPig7wxAH9nxsIhR/eDHnndmguZ
         xkjj/BKZS5u3tqp+PCbWyaCthYZA/IbHIg9/vB7aOKmObZHjesfLg6yIvxqhxfGFYR59
         ygC4XEpyjgfM258H8V0ceWwUFT5WPy0fOMfXOUE9iAMuq42UztmQ9yf2nrTqXi1S/OLH
         lrFw==
X-Gm-Message-State: AOJu0Yyk5seMfQYav+OMy+CX/6+POAjf4aQvN7U8FMu7U5LYbnADHePO
	FMUbPuNgQz+zqU0aenTpiD6xCg==
X-Google-Smtp-Source: AGHT+IHWRkQ8Jz+2x3pr4LQJPBlQhQpPkkYIP34zQlZXe+ZpN1VvIqkVzKMpbThMJAkYZcED0B62cg==
X-Received: by 2002:ac2:5475:0:b0:50b:a816:cc09 with SMTP id e21-20020ac25475000000b0050ba816cc09mr7494822lfn.34.1701246816617;
        Wed, 29 Nov 2023 00:33:36 -0800 (PST)
Date: Wed, 29 Nov 2023 09:33:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
Message-ID: <ZWb3XyxOCzXtiZhG@macbook>
References: <8734x43zxi.fsf@epam.com>
 <alpine.DEB.2.22.394.2311171339010.773207@ubuntu-linux-20-04-desktop>
 <87edgo2f6j.fsf@epam.com>
 <alpine.DEB.2.22.394.2311171633190.773207@ubuntu-linux-20-04-desktop>
 <87ttpg0wdx.fsf@epam.com>
 <alpine.DEB.2.22.394.2311211712090.2053963@ubuntu-linux-20-04-desktop>
 <ZV3r1uc3av1wQu4W@macbook>
 <alpine.DEB.2.22.394.2311221306060.2053963@ubuntu-linux-20-04-desktop>
 <ZV8NhPohwTDWXOTk@macbook>
 <87a5qxtpb6.fsf@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a5qxtpb6.fsf@epam.com>

On Tue, Nov 28, 2023 at 11:45:34PM +0000, Volodymyr Babchuk wrote:
> Hi Roger,
> 
> Roger Pau Monné <roger.pau@citrix.com> writes:
> 
> > On Wed, Nov 22, 2023 at 01:18:32PM -0800, Stefano Stabellini wrote:
> >> On Wed, 22 Nov 2023, Roger Pau Monné wrote:
> >> > On Tue, Nov 21, 2023 at 05:12:15PM -0800, Stefano Stabellini wrote:
> >> > > Let me expand on this. Like I wrote above, I think it is important that
> >> > > Xen vPCI is the only in-use PCI Root Complex emulator. If it makes the
> >> > > QEMU implementation easier, it is OK if QEMU emulates an unneeded and
> >> > > unused PCI Root Complex. From Xen point of view, it doesn't exist.
> >> > > 
> >> > > In terms if ioreq registration, QEMU calls
> >> > > xendevicemodel_map_pcidev_to_ioreq_server for each PCI BDF it wants to
> >> > > emulate. That way, Xen vPCI knows exactly what PCI config space
> >> > > reads/writes to forward to QEMU.
> >> > > 
> >> > > Let's say that:
> >> > > - 00:02.0 is PCI passthrough device
> >> > > - 00:03.0 is a PCI emulated device
> >> > > 
> >> > > QEMU would register 00:03.0 and vPCI would know to forward anything
> >> > > related to 00:03.0 to QEMU, but not 00:02.0.
> >> > 
> >> > I think there's some work here so that we have a proper hierarchy
> >> > inside of Xen.  Right now both ioreq and vpci expect to decode the
> >> > accesses to the PCI config space, and setup (MM)IO handlers to trap
> >> > ECAM, see vpci_ecam_{read,write}().
> >> > 
> >> > I think we want to move to a model where vPCI doesn't setup MMIO traps
> >> > itself, and instead relies on ioreq to do the decoding and forwarding
> >> > of accesses.  We need some work in order to represent an internal
> >> > ioreq handler, but that shouldn't be too complicated.  IOW: vpci
> >> > should register devices it's handling with ioreq, much like QEMU does.
> >> 
> >> I think this could be a good idea.
> >> 
> >> This would be the very first IOREQ handler implemented in Xen itself,
> >> rather than outside of Xen. Some code refactoring might be required,
> >> which worries me given that vPCI is at v10 and has been pending for
> >> years. I think it could make sense as a follow-up series, not v11.
> >
> > That's perfectly fine for me, most of the series here just deal with
> > the logic to intercept guest access to the config space and is
> > completely agnostic as to how the accesses are intercepted.
> >
> >> I think this idea would be beneficial if, in the example above, vPCI
> >> doesn't really need to know about device 00:03.0. vPCI registers via
> >> IOREQ the PCI Root Complex and device 00:02.0 only, QEMU registers
> >> 00:03.0, and everything works. vPCI is not involved at all in PCI config
> >> space reads and writes for 00:03.0. If this is the case, then moving
> >> vPCI to IOREQ could be good.
> >
> > Given your description above, with the root complex implemented in
> > vPCI, we would need to mandate vPCI together with ioreqs even if no
> > passthrough devices are using vPCI itself (just for the emulation of
> > the root complex).  Which is fine, just wanted to mention the
> > dependency.
> >
> >> On the other hand if vPCI actually needs to know that 00:03.0 exists,
> >> perhaps because it changes something in the PCI Root Complex emulation
> >> or vPCI needs to take some action when PCI config space registers of
> >> 00:03.0 are written to, then I think this model doesn't work well. If
> >> this is the case, then I think it would be best to keep vPCI as MMIO
> >> handler and let vPCI forward to IOREQ when appropriate.
> >
> > At first approximation I don't think we would have such interactions,
> > otherwise the whole premise of ioreq being able to register individual
> > PCI devices would be broken.
> >
> > XenSever already has scenarios with two different user-space emulators
> > (ie: two different ioreq servers) handling accesses to different
> > devices in the same PCI bus, and there's no interaction with the root
> > complex required.
> >
> 
> Out of curiosity: how legacy PCI interrupts are handled in this case? In
> my understanding, it is Root Complex's responsibility to propagate
> correct IRQ levels to an interrupt controller?

I'm unsure whether my understanding of the question is correct, so my
reply might not be what you are asking for, sorry.

Legacy IRQs (GSI on x86) are setup directly by the toolstack when the
device is assigned to the guest, using PHYSDEVOP_map_pirq +
XEN_DOMCTL_bind_pt_irq.  Those hypercalls bind together a host IO-APIC
pin to a guest IO-APIC pin, so that interrupts originating from that
host IO-APIC pin are always forwarded to the guest an injected as
originating from the guest IO-APIC pin.

Note that the device will always use the same IO-APIC pin, this is not
configured by the OS.

Thanks, Roger.

