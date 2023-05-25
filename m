Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6371E71176B
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 21:32:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539845.841119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Gh5-0004gO-7x; Thu, 25 May 2023 19:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539845.841119; Thu, 25 May 2023 19:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Gh5-0004e2-57; Thu, 25 May 2023 19:32:15 +0000
Received: by outflank-mailman (input) for mailman id 539845;
 Thu, 25 May 2023 19:32:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWh=BO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q2Gh3-0004du-M0
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 19:32:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7aca304-fb32-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 21:32:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D04BB647FF;
 Thu, 25 May 2023 19:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A14C433EF;
 Thu, 25 May 2023 19:32:08 +0000 (UTC)
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
X-Inumbo-ID: d7aca304-fb32-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685043129;
	bh=B/epPnjiNeekW5xaMeN0DF1Jyj5h1HNXt8wfDIEGktw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LWQiGzcNDuf3V7YhqmPNoDrMrpJZBP80LKiF8/klUWlALyPFr5ptcfmFb62Z9etJC
	 F7tdZ2Fah2avfrinoZv4tHKTc/iU3mSOs8uTwGZEXyk13vlaz8htx00LMcl42yRvMA
	 YroCASo8pgDvOkecqE3ArH2RBpb5dLCo0SUs8QzUgAxqIIZZbYv8KYnsOXF4S8GEpr
	 N6iiMnh/D6Ol8qIfrOUkIGLhhyCKG+6maD1/e3kVOuEp5cojOJqhHU/BY0tsjb6npW
	 0TuiBtyat9NtVoTcomnuTFZ1ifm8JfSAfTRgGjwJ9E2+Kalcnz8+eIxFR9myhldb4F
	 abrbuX6G6vVLw==
Date: Thu, 25 May 2023 12:32:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
In-Reply-To: <alpine.DEB.2.22.394.2305251224070.44000@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2305251226000.44000@ubuntu-linux-20-04-desktop>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com> <ZG4dmJuzNVUE5UIY@Air-de-Roger> <614c5bf4-b273-7439-caf7-f6df0d90bf87@suse.com> <alpine.DEB.2.22.394.2305241627290.44000@ubuntu-linux-20-04-desktop> <8956af09-9ba4-11bf-a272-25f508bbbb3c@suse.com>
 <alpine.DEB.2.22.394.2305251224070.44000@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 May 2023, Stefano Stabellini wrote:
> On Thu, 25 May 2023, Jan Beulich wrote:
> > On 25.05.2023 01:37, Stefano Stabellini wrote:
> > > On Wed, 24 May 2023, Jan Beulich wrote:
> > >>>> RFC: _setup_hwdom_pci_devices()' loop may want splitting: For
> > >>>>      modify_bars() to consistently respect BARs of hidden devices while
> > >>>>      setting up "normal" ones (i.e. to avoid as much as possible the
> > >>>>      "continue" path introduced here), setting up of the former may want
> > >>>>      doing first.
> > >>>
> > >>> But BARs of hidden devices should be mapped into dom0 physmap?
> > >>
> > >> Yes.
> > > 
> > > The BARs would be mapped read-only (not read-write), right? Otherwise we
> > > let dom0 access devices that belong to Xen, which doesn't seem like a
> > > good idea.
> > > 
> > > But even if we map the BARs read-only, what is the benefit of mapping
> > > them to Dom0? If Dom0 loads a driver for it and the driver wants to
> > > initialize the device, the driver will crash because the MMIO region is
> > > read-only instead of read-write, right?
> > > 
> > > How does this device hiding work for dom0? How does dom0 know not to
> > > access a device that is present on the PCI bus but is used by Xen?
> > 
> > None of these are new questions - this has all been this way for PV Dom0,
> > and so far we've limped along quite okay. That's not to say that we
> > shouldn't improve things if we can, but that first requires ideas as to
> > how.
> 
> For PV, that was OK because PV requires extensive guest modifications
> anyway. We only run Linux and few BSDs as Dom0. So, making the interface
> cleaner and reducing guest changes is nice-to-have but not critical.
> 
> For PVH, this is different. One of the top reasons for AMD to work on
> PVH is to enable arbitrary non-Linux OSes as Dom0 (when paired with
> dom0less/hyperlaunch). It could be anything from Zephyr to a
> proprietary RTOS like VxWorks. Minimal guest changes for advanced
> features (e.g. Dom0 S3) might be OK but in general I think we should aim
> at (almost) zero guest changes. On ARM, it is already the case (with some
> non-upstream patches for dom0less PCI.)
> 
> For this specific patch, which is necessary to enable PVH on AMD x86 in
> gitlab-ci, we can do anything we want to make it move faster. But
> medium/long term I think we should try to make non-Xen-aware PVH Dom0
> possible.

Like I wrote, personally I am happy with whatever gets us to have the PVH
test in gitlab-ci faster.

However, on the specific problem of PCI devices used by Xen and how to
deal with them for Dom0 PVH, I think they should be completely hidden.
Hidden in the sense that they don't appear on the Dom0 PCI bus. If the
hidden device is a function of a multi-function PCI device, then the
entire multi-function PCI device should be hidden.

I don't think this case is very important because devices used by Xen
are timers, IOMMUs, UARTs, all devices that typically are not
multi-function, so it is OK to be extra careful and remove the entire
device from Dom0 in the odd case that the device is both multi-function
and only partially used by Xen. This is what I would do for Xen on ARM
too.

