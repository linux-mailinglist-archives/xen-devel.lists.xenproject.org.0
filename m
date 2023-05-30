Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595FC7170D4
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 00:39:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541508.844342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q47zc-0000dN-Rs; Tue, 30 May 2023 22:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541508.844342; Tue, 30 May 2023 22:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q47zc-0000b8-Ox; Tue, 30 May 2023 22:39:04 +0000
Received: by outflank-mailman (input) for mailman id 541508;
 Tue, 30 May 2023 22:39:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FU5e=BT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q47zb-0000b2-BZ
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 22:39:03 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5248311-ff3a-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 00:39:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 899D360AF0;
 Tue, 30 May 2023 22:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5628CC433D2;
 Tue, 30 May 2023 22:38:58 +0000 (UTC)
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
X-Inumbo-ID: c5248311-ff3a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685486339;
	bh=3LyBTta425MQh6JueAG5J87JEcwJLyC6WrZDt8GPvu8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SSRW4iIOfg49EXgx0UeQXWuQ7BmMuoPkUEwYq/xqKnnxT+NdhtoWCKF35E92eJ0F2
	 w2O1zlhATqWYe7X5tUT/QymdNEtpRl+HWoan8U4X2MiLvFbSqlvAiXq+ILKxfz6bfk
	 TpXrcZ+qk0ewJhTxT9k1WfIZFnovfpVA67MqJPt13hOn9G2NaZ+kp5lQAj4dCGbyLG
	 1YWvachOIIPMbCKLMrOXn+KLWobuvo/pcS+1LnVtnQBppmufRRmdEAAesoG8hpRUMs
	 WAdOdVyVtykXAeJAYuxiCH7+Uwz44nXwOVvmFJyw9EBcGI/h9cDAp8z5ghHuBV47B1
	 d+7HseXw5iAcA==
Date: Tue, 30 May 2023 15:38:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
In-Reply-To: <22f1e765-891d-ef2d-01b5-e9dfe6ca895b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2305301529090.44000@ubuntu-linux-20-04-desktop>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com> <ZG4dmJuzNVUE5UIY@Air-de-Roger> <614c5bf4-b273-7439-caf7-f6df0d90bf87@suse.com> <alpine.DEB.2.22.394.2305241627290.44000@ubuntu-linux-20-04-desktop> <8956af09-9ba4-11bf-a272-25f508bbbb3c@suse.com>
 <alpine.DEB.2.22.394.2305251224070.44000@ubuntu-linux-20-04-desktop> <22f1e765-891d-ef2d-01b5-e9dfe6ca895b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 May 2023, Jan Beulich wrote:
> On 25.05.2023 21:24, Stefano Stabellini wrote:
> > On Thu, 25 May 2023, Jan Beulich wrote:
> >> On 25.05.2023 01:37, Stefano Stabellini wrote:
> >>> On Wed, 24 May 2023, Jan Beulich wrote:
> >>>>>> RFC: _setup_hwdom_pci_devices()' loop may want splitting: For
> >>>>>>      modify_bars() to consistently respect BARs of hidden devices while
> >>>>>>      setting up "normal" ones (i.e. to avoid as much as possible the
> >>>>>>      "continue" path introduced here), setting up of the former may want
> >>>>>>      doing first.
> >>>>>
> >>>>> But BARs of hidden devices should be mapped into dom0 physmap?
> >>>>
> >>>> Yes.
> >>>
> >>> The BARs would be mapped read-only (not read-write), right? Otherwise we
> >>> let dom0 access devices that belong to Xen, which doesn't seem like a
> >>> good idea.
> >>>
> >>> But even if we map the BARs read-only, what is the benefit of mapping
> >>> them to Dom0? If Dom0 loads a driver for it and the driver wants to
> >>> initialize the device, the driver will crash because the MMIO region is
> >>> read-only instead of read-write, right?
> >>>
> >>> How does this device hiding work for dom0? How does dom0 know not to
> >>> access a device that is present on the PCI bus but is used by Xen?
> >>
> >> None of these are new questions - this has all been this way for PV Dom0,
> >> and so far we've limped along quite okay. That's not to say that we
> >> shouldn't improve things if we can, but that first requires ideas as to
> >> how.
> > 
> > For PV, that was OK because PV requires extensive guest modifications
> > anyway. We only run Linux and few BSDs as Dom0. So, making the interface
> > cleaner and reducing guest changes is nice-to-have but not critical.
> > 
> > For PVH, this is different. One of the top reasons for AMD to work on
> > PVH is to enable arbitrary non-Linux OSes as Dom0 (when paired with
> > dom0less/hyperlaunch). It could be anything from Zephyr to a
> > proprietary RTOS like VxWorks. Minimal guest changes for advanced
> > features (e.g. Dom0 S3) might be OK but in general I think we should aim
> > at (almost) zero guest changes. On ARM, it is already the case (with some
> > non-upstream patches for dom0less PCI.)
> > 
> > For this specific patch, which is necessary to enable PVH on AMD x86 in
> > gitlab-ci, we can do anything we want to make it move faster. But
> > medium/long term I think we should try to make non-Xen-aware PVH Dom0
> > possible.
> 
> I don't think Linux could boot as PVH Dom0 without any awareness. Hence
> I guess it's not easy to see how other OSes might. What you're after
> looks rather like a HVM Dom0 to me, with it being unclear where the
> external emulator then would run (in a stubdom maybe, which might be
> possible to arrange for via the dom0less way of creating boot time
> DomU-s) and how it would get any necessary xenstore based information.

I know that Linux has lots of Xen awareness scattered everywhere so it
is difficult to tell what's what. Leaving the PVH entry point aside for
this discussion, what else is really needed for a Linux without
CONFIG_XEN to boot as PVH Dom0?

Same question from a different angle: let's say that we boot Zephyr or
another RTOS as HVM Dom0, what is really required for the emulator to
emulate? I am hoping that the answer is "nothing" except for maybe a
UART.

It comes down to how much legacy stuff the guest OS expects to find.
Legacy stuff that would normally be emulated by QEMU. I am counting on
the fact that a modern OS doesn't expect any of the legacy stuff (e.g.
PIIX3/Q35/E1000) if it is not advertised in the firmware tables. If
there is no need for QEMU, I don't know if I would call it PVH or HVM
but either way we are good. 

Same for xenstore: there should be no need for xenstore without
CONFIG_XEN.

