Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF4442FC79
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 21:48:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211047.368101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbTAw-0002VP-8F; Fri, 15 Oct 2021 19:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211047.368101; Fri, 15 Oct 2021 19:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbTAw-0002SX-5B; Fri, 15 Oct 2021 19:47:30 +0000
Received: by outflank-mailman (input) for mailman id 211047;
 Fri, 15 Oct 2021 19:47:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OB3O=PD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mbTAu-0002SR-7e
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 19:47:28 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b97b300c-2df0-11ec-825e-12813bfff9fa;
 Fri, 15 Oct 2021 19:47:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2778F60FE3;
 Fri, 15 Oct 2021 19:47:26 +0000 (UTC)
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
X-Inumbo-ID: b97b300c-2df0-11ec-825e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634327246;
	bh=uxl2T3/DNCg0OiNUwGQ0Golh8prz654MgXPsmWG6Q8s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qxs4lh4aYEpNuVF2Ga+imVXDefYZSCHsnpGG8bNleUm8h94AapspFJUBrBdrt2Xd2
	 rt2k17MfQE2BANrqzv1q235Zau1PMPY519Zcn76dXG1iSr7fGQQmGzMfk3LY444Vvo
	 yGYpYIbGvPQMkDSEhqFXgkEcoD9MzWoW4AttBoElCaTB/lYN5k9UTqmnSyKv/2GD9H
	 ZYSRUXdkS54Q6+BVJHcfL9Lsh0IdG4cRNYYghDqEa8UtHfQMSIyqTkY0g3iCErZSMg
	 eibyLNhjIZG6gluj0wCMNFqf6/OL0FOthWJUHK3LlnRHrPTS2JKo3kQvVDpzNBI9as
	 0l7ayM222jxrA==
Date: Fri, 15 Oct 2021 12:47:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    "iwj@xenproject.org" <iwj@xenproject.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    Rahul Singh <Rahul.Singh@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
In-Reply-To: <a45077dc-e144-4427-9ae2-5815045ecaec@xen.org>
Message-ID: <alpine.DEB.2.21.2110151235100.31303@sstabellini-ThinkPad-T480s>
References: <cover.1634315461.git.bertrand.marquis@arm.com> <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com> <cef8d2a6-91c1-2d4d-2078-98d0a92b067a@xen.org> <F447A1D8-A023-4127-AAC0-7511868DE9C4@arm.com>
 <a45077dc-e144-4427-9ae2-5815045ecaec@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Oct 2021, Julien Grall wrote:
> On 15/10/2021 18:33, Bertrand Marquis wrote:
> > > On 15 Oct 2021, at 18:25, Julien Grall <julien@xen.org> wrote:
> > > 
> > > Hi Bertrand,
> > > 
> > > On 15/10/2021 17:51, Bertrand Marquis wrote:
> > > > diff --git a/xen/drivers/passthrough/pci.c
> > > > b/xen/drivers/passthrough/pci.c
> > > > index 3aa8c3175f..35e0190796 100644
> > > > --- a/xen/drivers/passthrough/pci.c
> > > > +++ b/xen/drivers/passthrough/pci.c
> > > > @@ -756,6 +756,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
> > > >       if ( !pdev->domain )
> > > >       {
> > > >           pdev->domain = hardware_domain;
> > > > +#ifdef CONFIG_ARM
> > > > +        /*
> > > > +         * On ARM PCI devices discovery will be done by Dom0. Add vpci
> > > > handler
> > > > +         * when Dom0 inform XEN to add the PCI devices in XEN.
> > > > +         */
> > > > +        ret = vpci_add_handlers(pdev);
> > > 
> > > I don't seem to find the code to remove __init_hwdom in this series. Are
> > > you intending to fix it separately?
> > 
> > Yes I think it is better to fix that in a new patch as it will require some
> > discussion as it will impact the x86 code if I just remove the flag now.
> For the future patch series, may I ask to keep track of outstanding issues in
> the commit message (if you don't plan to address them before commiting) or
> after --- (if they are meant to be addressed before commiting)?
> 
> In this case, the impact on Arm is this would result to an hypervisor crash if
> called. If we drop __init_hwdom, the impact on x86 is Xen text will slightly
> be bigger after the boot time.
> 
> AFAICT, the code is not reachable on Arm (?). Therefore, one could argue we
> this can wait after the week-end as this is a latent bug. Yet, I am not really
> comfortable to see knowningly buggy code merged.
> 
> Stefano, would you be willing to remove __init_hwdom while committing it? If
> not, can you update the commit message and mention this patch doesn't work as
> intended?

I prefer not to do a change like this on commit as it affects x86.

I added a note in the commit message about it. I also added Roger's ack
that was given to the previous version. FYI this is the only outstanding
TODO as far as I am aware (there are other pending patch series of
course).

After reviewing the whole series again, checking it against all the
reviewers comments, and making it go through gitlab-ci, I committed the
series.

Thank you all for all the efforts that went into this. We made it :-)

