Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 802675856A8
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 23:51:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377862.611146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHXt2-0000mc-St; Fri, 29 Jul 2022 21:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377862.611146; Fri, 29 Jul 2022 21:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHXt2-0000jp-Pb; Fri, 29 Jul 2022 21:51:12 +0000
Received: by outflank-mailman (input) for mailman id 377862;
 Fri, 29 Jul 2022 21:51:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HszZ=YC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oHXt2-0000jh-0I
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 21:51:12 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e59736b-0f88-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 23:51:10 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5C8D6B829BD;
 Fri, 29 Jul 2022 21:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB80C433C1;
 Fri, 29 Jul 2022 21:51:07 +0000 (UTC)
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
X-Inumbo-ID: 8e59736b-0f88-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659131468;
	bh=uXj1dutMGgKN6p36vmGkamno7p685JlvjZgVhe4jxoY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fcjtE7u8nYtj2sCQKPSJJI7JiYkchFL/sDw/RstV/5bXq4PpwdRg6UvO0MDVGk8Fu
	 oE6P1axDXpIfX3/cBZ977kSpZW7TvyUt/ETh8vXxgow5HptPsounK5aZgo66gMeLA/
	 VB9IjXp5ODBJBYwEArvoHehENfAKJyyWw95J9MBuh4F06eRp0/FJ/7qPMk2KIShzw7
	 9fn5DWnTowSkKnw6sNuCxgKjuET6H92BIIBCboCAuguCRLqQe0V8+74F/hZt6KRTc5
	 VCekTk57mcCX2HHZ1y3rmsxBQd+jbDohI1wDz/JHj1NEm0BN7qpNkwhFbRrdZRdCbz
	 y+2kAkGos8vXA==
Date: Fri, 29 Jul 2022 14:51:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Boyoun Park <boyoun.park@samsung.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>, 
    "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, 
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    Chungwoo Park <cww.park@samsung.com>, Gang Li <gang30.li@samsung.com>, 
    Lei Wang <lei19.wang@samsung.com>, SoungKwan Kimn <sk.kimn@samsung.com>, 
    DongJin PARK <djpax.park@samsung.com>, 
    Joonjae Lee <joonjae7.lee@samsung.com>
Subject: Re: [PATCH v1] xen: add late init call in start_xen
In-Reply-To: <20220729110313epcms2p5f9b24d5a65b98c220a6e99675298560f@epcms2p5>
Message-ID: <alpine.DEB.2.22.394.2207291447080.4648@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2207281251160.4648@ubuntu-linux-20-04-desktop> <97499212.9948800.1659000157467@mail-kr2-3> <88025800-66e2-4fb4-facf-5989e75ba08f@suse.com> <CGME20220728092237epcms2p53821bba31388763f45b5204d56520c20@epcms2p5>
 <20220729110313epcms2p5f9b24d5a65b98c220a6e99675298560f@epcms2p5>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2013376029-1659131467=:4648"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2013376029-1659131467=:4648
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 29 Jul 2022, Boyoun Park wrote:
> I really appreciate all the comments and reviews.
> I understand that it is hard to add this patch without any usage.
> 
> On Fri, 29 Jul 2022, Stefano Stabellini:
> > On Thu, 28 Jul 2022, Jan Beulich wrote:
> > > On 28.07.2022 11:22, Boyoun Park wrote:
> > > > Hello,
> > > > 
> > > > This patch added late_initcall to deal with
> > > > 
> > > > some init functions which should be called
> > > > 
> > > > after other init functions in start_xen.
> > > > 
> > > > If this patch is added,
> > > > 
> > > > then the original initcall in xen will be treated
> > > > 
> > > > as early_initcall and the late_initcall
> > > > 
> > > > which is added by this patch will be
> > > > 
> > > > called sequentially.
> > > > 
> > > > I cannot send patches through git send-email
> > > > 
> > > > due to some security issues in my work.
> > > > 
> > > > So intead, I just send the patches manually.
> > > 
> > > Which is fine, but you want to configure your mail client such that it
> > > doesn't mangle the patch. Albeit I see that to cover for that at least
> > > you've also attached both the patch and a cover letter. For a single
> > > patch a cover letter can normally be omitted, but if you don't then
> > > even if you're sending without "git send-email" you will want to send
> > > both as separate mails, with the patch being a reply to the cover
> > > letter thread root.
> > 
> > Yeah. Boyoun, if you only have a couple of patches then it is fine to
> > send them manually. Otherwise, if you have many patches, you can send
> > them in attachment as tarball and I'll send them all to xen-devel using
> > git-send-email for you (of course keeping you as original author and
> > retaining all Signed-off-bys).
> 
> You're awesome. Thanks you so much. I'm still requesting approvals to use git send-email.
> I'll let you know if I have to send many patches wihout git send-email.
> 
> > > > Subject: [PATCH v1] xen: add late init call in start_xen
> > > > 
> > > > This patch added late_initcall section in init.data.
> > > > 
> > > > The late initcall would be called after initcall
> > > > 
> > > > in the start_xen function.
> > > > 
> > > > Some initializing works on priority should be run
> > > > 
> > > > in do_initcalls and other non-prioritized works
> > > > 
> > > > would be run in do_late_initcalls.
> > > > 
> > > > To call some functions by late_initcall,
> > > > 
> > > > then it is possible by using
> > > > 
> > > > __late_initcall(/*Function Name*/);
> > > > 
> > > > Signed-off-by: Boyoun Park <boyoun.park@samsung.com>
> > > 
> > > So I could imagine this patch to be in a series where a subsequent
> > > patch then adds an actual use of the new functionality. Without
> > > that what you're proposing is to add dead code.
> > 
> > Yeah, I think it would be cool to have late initcalls but it makes sense
> > to add them if we have someone that makes use of them.
> 
> I totally agree with your comments. Some drivers that I'm developing now and use this function are specific to my hardware environment.
> Thus, it seems difficult to arrange them in the near future.
> I will update patches if I can suggest an actual use.

I totally understand custom setups and non-upstreamable configurations
and I have certainly some of them myself.

However, I just wanted to let you know that we are fine with accepting
platform specific drivers in Xen where it makes sense, for instance:

- Renesas IPMMU-VMSA found in R-Car Gen3/Gen4 SoCs (an IOMMU driver)
xen/drivers/passthrough/arm/ipmmu-vmsa.c

- Xilinx EEMI firmware interface "mediator" in Xen (power management)
xen/arch/arm/platforms/xilinx-zynqmp-eemi.c

Cheers,

Stefano
--8323329-2013376029-1659131467=:4648--

