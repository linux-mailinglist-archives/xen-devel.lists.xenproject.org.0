Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF82229F5D6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 21:06:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14666.36250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYEBk-0005vO-SK; Thu, 29 Oct 2020 20:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14666.36250; Thu, 29 Oct 2020 20:06:24 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYEBk-0005uz-Om; Thu, 29 Oct 2020 20:06:24 +0000
Received: by outflank-mailman (input) for mailman id 14666;
 Thu, 29 Oct 2020 20:06:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IgEN=EE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kYEBi-0005ut-LR
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:06:22 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea6105d8-8990-4d89-bfe6-4c6948464954;
 Thu, 29 Oct 2020 20:06:21 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C45C20809;
 Thu, 29 Oct 2020 20:06:20 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IgEN=EE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kYEBi-0005ut-LR
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:06:22 +0000
X-Inumbo-ID: ea6105d8-8990-4d89-bfe6-4c6948464954
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ea6105d8-8990-4d89-bfe6-4c6948464954;
	Thu, 29 Oct 2020 20:06:21 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7C45C20809;
	Thu, 29 Oct 2020 20:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604001980;
	bh=VOSYn4cuThyPXUrnBOG7B7CxuW7hIMMa8BtTwBj8j2c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fK+1qk29v4U5OIyQXWTjnJ7dUEmsn48J0M2JBDuPAlyaAjCgzLt6wAtCW3wNS5O4B
	 vJHbCcmpM4P4SH2+Hf5KFm12yVCeb2AVRSuGEUoCdgbXhSqM2eRIKr1mVJk17oeium
	 UHachG/QUS/9OhpB2rHHLYLFQXdoEu4SFfzusFL4=
Date: Thu, 29 Oct 2020 13:06:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, 
    xen-devel@lists.xenproject.org, 
    Masami Hiramatsu <masami.hiramatsu@linaro.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] meson.build: fix building of Xen support for aarch64
In-Reply-To: <87d011mjuw.fsf@linaro.org>
Message-ID: <alpine.DEB.2.21.2010291300440.12247@sstabellini-ThinkPad-T480s>
References: <20201028174406.23424-1-alex.bennee@linaro.org> <alpine.DEB.2.21.2010281406080.12247@sstabellini-ThinkPad-T480s> <87d011mjuw.fsf@linaro.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1821319659-1604001980=:12247"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1821319659-1604001980=:12247
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 29 Oct 2020, Alex Bennée wrote:
> > On Wed, 28 Oct 2020, Alex Bennée wrote:
> >> Xen is supported on aarch64 although weirdly using the i386-softmmu
> >> model. Checking based on the host CPU meant we never enabled Xen
> >> support. It would be nice to enable CONFIG_XEN for aarch64-softmmu to
> >> make it not seem weird but that will require further build surgery.
> >> 
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>
> >> Cc: Stefano Stabellini <sstabellini@kernel.org>
> >> Cc: Anthony Perard <anthony.perard@citrix.com>
> >> Cc: Paul Durrant <paul@xen.org>
> >> Fixes: 8a19980e3f ("configure: move accelerator logic to meson")
> >> ---
> >>  meson.build | 2 ++
> >>  1 file changed, 2 insertions(+)
> >> 
> >> diff --git a/meson.build b/meson.build
> >> index 835424999d..f1fcbfed4c 100644
> >> --- a/meson.build
> >> +++ b/meson.build
> >> @@ -81,6 +81,8 @@ if cpu in ['x86', 'x86_64']
> >>      'CONFIG_HVF': ['x86_64-softmmu'],
> >>      'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
> >>    }
> >> +elif cpu in [ 'arm', 'aarch64' ]
> >> +  accelerator_targets += { 'CONFIG_XEN': ['i386-softmmu'] }
> >>  endif
> >
> > This looks very reasonable -- the patch makes sense.
> >
> >
> > However I have two questions, mostly for my own understanding. I tried
> > to repro the aarch64 build problem but it works at my end, even without
> > this patch.
> 
> Building on a x86 host or with cross compiler?

native build (qemu-user)


> > I wonder why. I suspect it works thanks to these lines in
> > meson.build:
> >
> >   if not get_option('xen').disabled() and 'CONFIG_XEN_BACKEND' in config_host
> >     accelerators += 'CONFIG_XEN'
> >     have_xen_pci_passthrough = not get_option('xen_pci_passthrough').disabled() and targetos == 'linux'
> >   else
> >     have_xen_pci_passthrough = false
> >   endif
> >
> > But I am not entirely sure who is adding CONFIG_XEN_BACKEND to
> > config_host.
> 
> The is part of the top level configure check - which basically checks
> for --enable-xen or autodetects the presence of the userspace libraries.
> I'm not sure if we have a slight over proliferation of symbols for Xen
> support (although I'm about to add more).
> 
> > The other question is: does it make sense to print the value of
> > CONFIG_XEN as part of the summary? Something like:
> >
> > diff --git a/meson.build b/meson.build
> > index 47e32e1fcb..c6e7832dc9 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -2070,6 +2070,7 @@ summary_info += {'KVM support':       config_all.has_key('CONFIG_KVM')}
> >  summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
> >  summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
> >  summary_info += {'WHPX support':      config_all.has_key('CONFIG_WHPX')}
> > +summary_info += {'XEN support':      config_all.has_key('CONFIG_XEN')}
> >  summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
> >  if config_all.has_key('CONFIG_TCG')
> >    summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
> >
> >
> > But I realize there is already:
> >
> > summary_info += {'xen support':       config_host.has_key('CONFIG_XEN_BACKEND')}
> >
> > so it would be a bit of a duplicate
> 
> Hmm so what we have is:
> 
>   CONFIG_XEN_BACKEND
>     - ensures that appropriate compiler flags are added
>     - pegs RAM_ADDR_MAX at UINT64_MAX (instead of UINTPTR_MAX)
>   CONFIG_XEN
>     - which controls a bunch of build objects, some of which may be i386 only?
>     ./accel/meson.build:15:specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
>     ./accel/stubs/meson.build:2:specific_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
>     ./accel/xen/meson.build:1:specific_ss.add(when: 'CONFIG_XEN', if_true: files('xen-all.c'))
>     ./hw/9pfs/meson.build:17:fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
>     ./hw/block/dataplane/meson.build:2:specific_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
>     ./hw/block/meson.build:14:softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
>     ./hw/char/meson.build:23:softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen_console.c'))
>     ./hw/display/meson.build:18:softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xenfb.c'))
>     ./hw/i386/xen/meson.build:1:i386_ss.add(when: 'CONFIG_XEN', if_true: files('xen-hvm.c',
>                                                                                'xen-mapcache.c',
>                                                                                'xen_apic.c',
>                                                                                'xen_platform.c',
>                                                                                'xen_pvdevice.c')
>     ./hw/net/meson.build:2:softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen_nic.c'))
>     ./hw/usb/meson.build:76:softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_XEN', libusb], if_true: files('xen-usb.c'))
>     ./hw/xen/meson.build:1:softmmu_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
>     ./hw/xen/meson.build:20:specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
>     ./hw/xenpv/meson.build:3:xenpv_ss.add(when: 'CONFIG_XEN', if_true: files('xen_machine_pv.c'))
>     - there are also some stubbed inline functions controlled by it
>   CONFIG_XEN_IGD_PASSTHROUGH
>     - specific x86 PC only feature via Kconfig rule
>   CONFIG_XEN_PCI_PASSTHROUGH
>     - control Linux specific specific feature (via meson rule)
> 
> 
> First obvious question - is everything in hw/i386/xen actually i386
> only? APIC seems pretty PC orientated but what about xen_platform and
> pvdevice? There seem to be some dependancies on xen-mapcache across the
> code.

All files under hw/i386/xen are only used on x86 today, because they are
either x86 specific, or ioreq specific (required to handle ioreqs.)
Given that today ioreqs are not used on ARM, they are not used. In the
near future when we are going to handle ioreqs on ARM, they'll become
useful.


xen_apic.c:
x86 specific

xen-hvm.c:
There are some x86 things there, but mostly it is about handling ioreqs
which is going to be used on ARM soon as part of the virtio enablement

xen-mapcache.c:
The mapcache is used when ioreqs are used, it will get useful

xen_platform.c:
x86 specific

xen_pvdevice.c:
x86 specific
--8323329-1821319659-1604001980=:12247--

