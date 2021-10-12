Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4429F42AF16
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 23:37:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207667.363556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maPSg-0006FX-HI; Tue, 12 Oct 2021 21:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207667.363556; Tue, 12 Oct 2021 21:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maPSg-0006CT-E1; Tue, 12 Oct 2021 21:37:26 +0000
Received: by outflank-mailman (input) for mailman id 207667;
 Tue, 12 Oct 2021 21:37:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SIAI=PA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1maPSe-0006CN-QB
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 21:37:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95f499fb-2ba4-11ec-8154-12813bfff9fa;
 Tue, 12 Oct 2021 21:37:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52AE060EDF;
 Tue, 12 Oct 2021 21:37:22 +0000 (UTC)
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
X-Inumbo-ID: 95f499fb-2ba4-11ec-8154-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634074642;
	bh=/EYO8lfpC9uYZlP5GQ6hEiDvFhQ1zEIM5ARiVdRZMRw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ld1Niw+JYbMj4g66ZHLy5Iy1NMiJZBrqbHyzhkuMT97NGAW+g3vA8L5j93UbupWNW
	 6pvBSn5FJS6lrX1aFq4eekJbe0gtcS30hr5eSR74XHDTbobHeFt1CTD9x45K7PlfWD
	 YtaBTTa977sQ/eNX3Yt02IIHAwJmunpMCaQHl6Lmn6WnqUQvVJtUs7gesKMdbW6+fR
	 zzjPPqYiEKd8i+JzYYsUde1BeSTrt5ZqnLA5VLEAetyY6MdigSW/FPtbsiEze2Vakd
	 kLgILB1Nicw5bJ9dX2QGmrPeSZIEOr6IJP0Bc9NQlU2jESo9BFIbv87cfGs/hVBuco
	 ldS3SmPCFpbVw==
Date: Tue, 12 Oct 2021 14:37:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Rahul Singh <Rahul.Singh@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
In-Reply-To: <2fa4d2e2-7daf-6d52-ff4c-38a482af1fb9@suse.com>
Message-ID: <alpine.DEB.2.21.2110121436020.9408@sstabellini-ThinkPad-T480s>
References: <cover.1633540842.git.rahul.singh@arm.com> <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com> <6752f2d3-171b-37f5-c809-82995a8f3f36@suse.com> <CEF7FFB0-779A-4F46-8667-6BCD9BA5CB6C@arm.com> <b735c2d3-1dbb-ce0a-c2fa-160d4c6938d3@suse.com>
 <A8DEBD07-FB45-4E4E-A2C3-7AF8B393B032@arm.com> <59c9e102-c710-64d3-2a1a-cc8dcbcceead@suse.com> <alpine.DEB.2.21.2110111105180.25528@sstabellini-ThinkPad-T480s> <2fa4d2e2-7daf-6d52-ff4c-38a482af1fb9@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Oct 2021, Jan Beulich wrote:
> On 11.10.2021 20:18, Stefano Stabellini wrote:
> > On Mon, 11 Oct 2021, Jan Beulich wrote:
> >> On 11.10.2021 15:34, Bertrand Marquis wrote:
> >>>> On 11 Oct 2021, at 14:09, Jan Beulich <jbeulich@suse.com> wrote:
> >>>> On 11.10.2021 14:41, Bertrand Marquis wrote:
> >>>>> But digging deeper into this, I would have 2 questions:
> >>>>>
> >>>>> - msi_cleanup was done there after a request from Stefano, but is not
> >>>>> done in case or iommu error, is there an issue to solve here ?
> >>>>
> >>>> Maybe, but I'm not sure. This very much depends on what a domain
> >>>> could in principle do with a partly set-up device. Plus let's
> >>>> not forget that we're talking of only Dom0 here (for now at least,
> >>>> i.e. not considering the dom0less case).
> >>>>
> >>>> But I'd also like to further defer to Stefano.
> >>>
> >>> Ok, I must admit I do not really see at that stage why doing an MSI cleanup
> >>> could be needed so I will wait for Stefano to know if I need to keep this when
> >>> moving the block up (at the end it is theoretical right now as this is empty).
> > 
> > I know that MSIs are not supported yet on ARM (pci_cleanup_msi does
> > nothing). But I wanted to make sure that the pci_cleanup_msi() calls are
> > present anywhere necessary, especially on the error paths. So that once
> > we add MSI support, we don't need to search through the code to find all
> > the error paths missing a pci_cleanup_msi() call.
> > 
> > To answer your first question: you are right, we are also missing a
> > pci_cleanup_msi() call in the case of IOMMU error. So it might be better
> > to move the call to pci_cleanup_msi() under the "out" label so that we
> > can do it once for both cases.
> > 
> > To answer your second point about whether it is necessary at all: if
> > MSIs and MSI-Xs cannot be already setup at this point at all (not even
> > the enable bit), then we don't need any call to pci_cleanup_msi() in
> > pci_add_device.
> 
> Well, at the very least MSI can't be set up ahead of the traps getting
> put in place. Whether partial success of putting traps in place may
> allow a cunning guest to set up MSI may depend on further aspects.

Good point about MSIs not being setup before the traps. We should remove
the call to pci_cleanup_msi() in the error path then.

