Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0F880DF9A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 00:40:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652555.1018466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCpsH-000777-BD; Mon, 11 Dec 2023 23:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652555.1018466; Mon, 11 Dec 2023 23:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCpsH-00074m-7X; Mon, 11 Dec 2023 23:39:45 +0000
Received: by outflank-mailman (input) for mailman id 652555;
 Mon, 11 Dec 2023 23:39:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aY2h=HW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rCpsE-00074f-WE
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 23:39:43 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cb02483-987e-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 00:39:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AB04ACE0AEE;
 Mon, 11 Dec 2023 23:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C706CC433C8;
 Mon, 11 Dec 2023 23:39:32 +0000 (UTC)
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
X-Inumbo-ID: 8cb02483-987e-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702337973;
	bh=GpcImKuJDj6BvoMb+0+DOmWHt4CYyEqK9ufBWr4Ig5E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G5/365Rs4fFc9XC6G+krnraJwsPTj3D95fLS1eabB/RhW0gVyXt6qqJClbVS4gZOS
	 b8H+wO9k2IL7X03FDm+rysOyKoGMm89ofTrJsGmx3mqFlAUomTWZvoEEvZpsGHkXZU
	 WZ3qADKig5BhjAzXPN7xfp8Y+fOx0AUIDzumxWYaD6PBHeMbo87W2NcTTr3G2TqHog
	 htudmccxHl/93SiGPRVGzwnYsZIMCSzmEtq3VNBmaOj5h5u0FTtHUvpaLigyWCVeuV
	 LAG3YnaEICoGPtbk1MDQVzT+jpG257RhZQOuQJzh7AdSGa8sPds418ikduQcwLuz5M
	 SwcV/G8LE8X7Q==
Date: Mon, 11 Dec 2023 15:39:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayankuma@amd.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, stefano.stabellini@amd.com, 
    bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH] xen/arm: Add emulation of Debug Data Transfer
 Registers
In-Reply-To: <fe06b322-4506-43e8-ac6f-16db49dea45f@amd.com>
Message-ID: <alpine.DEB.2.22.394.2312111534480.1703076@ubuntu-linux-20-04-desktop>
References: <20231201185009.1719183-1-ayan.kumar.halder@amd.com> <0bd65e25-aec2-4294-9a73-1cdaece52242@xen.org> <9ffe5a34-d1f4-4f4a-82eb-77c92f71040c@amd.com> <ca91f71b-9633-495f-9fb2-731bd250a561@xen.org> <8547fc3b-4e77-45d7-8063-1bee869d07db@amd.com>
 <3a9efd72-07cc-4b1d-8814-d4f6df4e6230@xen.org> <73554150-9880-447c-ac2b-e4f3ef0f76be@amd.com> <0d232ffe-1eb1-420b-af2c-70e16088a9b6@xen.org> <03a91b0f-eabe-47bd-b9fb-a9e15bdd121f@amd.com> <7420ada1-cc6c-48cf-9b2d-4c09e236dfdf@amd.com>
 <50372bd4-5e1a-4d38-abd3-19abf8e82591@xen.org> <alpine.DEB.2.22.394.2312051503060.110490@ubuntu-linux-20-04-desktop> <a4c43652-1fa6-4b42-b751-582cfd6324fe@xen.org> <alpine.DEB.2.22.394.2312071341540.1265976@ubuntu-linux-20-04-desktop>
 <797e8621-e12e-4d5e-9c8c-4e3ece08009b@xen.org> <fe06b322-4506-43e8-ac6f-16db49dea45f@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1450920052-1702337874=:1703076"
Content-ID: <alpine.DEB.2.22.394.2312111537570.1703076@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1450920052-1702337874=:1703076
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2312111537571.1703076@ubuntu-linux-20-04-desktop>

On Mon, 11 Dec 2023, Ayan Kumar Halder wrote:
> On 11/12/2023 09:33, Julien Grall wrote:
> > Hi,
> 
> Hi Julien/Stefano/Bertrand/Michal,
> 
> It is a great discussion, thanks for your suggestions.
> 
> I think we have an agreement. :-)
> 
> > 
> > On 07/12/2023 21:41, Stefano Stabellini wrote:
> > > On Thu, 7 Dec 2023, Julien Grall wrote:
> > > > Hi Stefano,
> > > > 
> > > > On 05/12/2023 23:21, Stefano Stabellini wrote:
> > > > > On Tue, 5 Dec 2023, Julien Grall wrote:
> > > > > > I agree that crashing a guest is bad, but is lying to the domain
> > > > > > really
> > > > > > better? The consequence here is not that bad and hopefully it would
> > > > > > be
> > > > > > fairly
> > > > > > easy to find. But this is not always the case. So I definitely would
> > > > > > place
> > > > > > a
> > > > > > half-backed emulation more severe than a guest crash.
> > > > > 
> > > > > 
> > > > > I see where Julien is coming from, but I would go with option two:
> > > > > "emulate DCC the same way as KVM". That's because I don't think we can
> > > > > get away with crashing the guest in all cases. Although the issue came
> > > > > up with a Linux guest, it could have been triggered by a proprietary
> > > > > operating system that we cannot change, and I think Xen should support
> > > > > running unmodified operating systems.
> > > > > 
> > > > > If we go with a "half-backed emulation" solution, as Julien wrote,
> > > > > then
> > > > > it is better to be more similar to other hypervisors, that's why I
> > > > > chose
> > > > > option two instead of option three.
> > > > > 
> > > > > But at the same time I recognize the validity of Julien's words and it
> > > > > makes me wonder if we should have a KCONFIG option or command line
> > > > > option to switch the Xen behavior. We could use it to gate all the
> > > > > "half-backed emulation" we do for compatibility.  Something like:
> > > > > 
> > > > > config PARTIAL_EMULATION
> > > > >       bool "Partial Emulation"
> > > > >       ---help---
> > > > >             Enables partial, not spec compliant, emulation of certain
> > > > > register
> > > > >       interfaces (e.g DCC UART) for guest compatibility. If you
> > > > > disable
> > > > >       this option, Xen will crash the guest if the guest tries to
> > > > > access
> > > > >       interfaces not fully emulated or virtualized.
> > > > > 
> > > > >       If you enable this option, the guest might misbehave due to
> > > > > non-spec
> > > > >       compliant emulation done by Xen.
> > > > 
> > > > As I wrote to Ayan on Matrix today, I am not in favor of the emulation.
> > > > Yet, I
> > > > am not going to oppose (as in Nack it) if the other maintainers agree
> > > > with it.
> > > 
> > > Thanks for being flexible
> > > 
> > > 
> > > > The KConfig would be nice, the question is whether we want to (security)
> > > > support such configuration? E.g. could this potentially introduce a
> > > > security
> > > > issue in the guest?
> > > 
> > > The important question is whether it could introduce a security issue in
> > > Xen. If we think it wouldn't increase the attack surface significantly
> > > then I would security support it otherwise not.
> > 
> > For this specific emulation, it is unlikely. But I can't make a generic
> > statement here. So we would need to do a case by case basis.
> > 
> > Furthermore, our security statement is also covering a guest userspace
> > attacking a guest OS. We would issue an XSA if this is feasible because of
> > an issue in the hypervisor.
> > 
> > With half-backed emulation, it becomes more difficult to know whether we are
> > not opening a hole and replacing a guest crashes at boot by something worse.
> > 
> > Again unlikely here. But those kind of bugs are no unheard. So this is
> > something to take into account when you want to claim security support for
> > half-backed emulation.
> 
> For this specific emulation, I think we all agree that there is no security
> risk. So we need not add any security support for this.

Rather than "no security risk" I would say "unlikely" as Julien wrote
(one never knows...) Also you wrote "we need not add any security
support" but I think you probably meant the opposite: we could add
security support for it.


> With regards to partial emulation, we all agree that there is no perfect
> solution.
> 
> 
> However, the approach on which we all seem to have consensus :-
> 
> 1. Emulate DCC with TXfull set to 1 (no crash, DCC driver in Linux/Uboot
> returns -ENODEV/-EAGAIN).
> 
> 2. Introduce a Kconfig (say "CONFIG_PARTIAL_EMULATION") option to surround
> this code which will be specific for Arm and enabled by default. This should
> be turned off by a vendor who does not want to provide any form of partial
> emulation.
> 
> 3. Introduce a hypervisor command line option ("partial_emulation" , disabled
> by default) so that this cen be enabled at run time using Imagebuilder/uboot
> scripts.
> 
> The #2 and #3 can be extended in future to cover all forms of partial
> emulation.
> 
> I will send out a patch implementing this approach.

Yes, sounds good
--8323329-1450920052-1702337874=:1703076--

