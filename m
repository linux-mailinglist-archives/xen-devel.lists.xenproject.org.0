Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D830A90E05
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 23:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956662.1350004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Aei-0002Uo-O1; Wed, 16 Apr 2025 21:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956662.1350004; Wed, 16 Apr 2025 21:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Aei-0002TP-Kg; Wed, 16 Apr 2025 21:50:52 +0000
Received: by outflank-mailman (input) for mailman id 956662;
 Wed, 16 Apr 2025 21:50:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcVf=XC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u5Aeh-0002TJ-BO
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 21:50:51 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc083395-1b0c-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 23:50:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A47C8A4A6F3;
 Wed, 16 Apr 2025 21:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760ABC4CEE2;
 Wed, 16 Apr 2025 21:50:47 +0000 (UTC)
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
X-Inumbo-ID: dc083395-1b0c-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744840248;
	bh=2liWwNsaTVyZTAW59evsyTMsEYRAwmieKiUxo45PhuY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NheN/er2A3qpNvEZl1dVGMTuvVXKBSJUBLEVHEpooAkmy4KSZ2a0PvQHS9Mw7vuSb
	 RoCyZiVcHzaHvFNPmYbDybqS1CxBhQzD/ynJc9f0VTOI2wO/jH3qh5DS6bWBjTPb4+
	 d54sAB/EfddG6GOXZRZl/x4UN89qd56FHYoEBodwmS+72txFdbnu5pnFWRxNsxB8nk
	 u7jzgn6AWAUqCHHA1gTet5bLDKOgO+BDOSVt3kkRJ2uIpQeJBfIkvx7QXqYryRH/3p
	 Den2B64hDWndZP4+YKz+tcmrQ8co7GyKFCQp/nowentZgCsGbp0F/3SjM4T0eikAE8
	 bROEzZPLifhxw==
Date: Wed, 16 Apr 2025 14:50:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Mykyta Poturai <Mykyta_Poturai@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH v2 0/2] Add support for MSI injection on Arm
In-Reply-To: <d64011fc-84bc-40fb-a98e-aa85eb2574c3@xen.org>
Message-ID: <alpine.DEB.2.22.394.2504161450400.8008@ubuntu-linux-20-04-desktop>
References: <cover.1744621166.git.mykyta_poturai@epam.com> <98feb427-7da5-47ff-831c-2b4bcb26c4b9@xen.org> <alpine.DEB.2.22.394.2504151536240.8008@ubuntu-linux-20-04-desktop> <15938705-ae5e-43c9-826f-d7a8c7425baa@epam.com>
 <d64011fc-84bc-40fb-a98e-aa85eb2574c3@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Apr 2025, Julien Grall wrote:
> (+ Rahul)
> 
> On 16/04/2025 17:37, Mykyta Poturai wrote:
> > On 16.04.25 01:40, Stefano Stabellini wrote:
> > > On Mon, 14 Apr 2025, Julien Grall wrote:
> > > > Hi Mykyta,
> > > > 
> > > > On 14/04/2025 18:51, Mykyta Poturai wrote:
> > > > > This series adds the base support for MSI injection on Arm. This is
> > > > > needed to streamline virtio-pci interrupt triggering.
> > > > > 
> > > > > With this patches, MSIs can be triggered in guests by issuing the new
> > > > > DM op, inject_msi2. This op is similar to inject_msi, but it allows
> > > > > to specify the source id of the MSI.
> > > > > 
> > > > > We chose the approach of adding a new DM op instead of using the pad
> > > > > field of inject_msi because we have no clear way of distinguishing
> > > > > between set and unset pad fields. New implementations also adds flags
> > > > > field to clearly specify if the SBDF is set.
> > > > > 
> > > > > Patches were tested on QEMU with
> > > > 
> > > > [...]
> > > > 
> > > > > patches for ITS support for DomUs applied.
> > > > 
> > > > This means this series is unusable without external patches. Given this
> > > > is
> > > > adding a new DM operations, I think it would be more sensible to have
> > > > the vITS
> > > > support merged first. Then we can look at merging this series.
> > > 
> > > Hi Mykyta, just checking explicitly with you whether this series
> > > requires vgic-v3-its.c for DomUs?
> > > 
> > > If yes, how far are you from sending the relevant patches to xen-devel?
> > > How many are they?
> > 
> > Hi Stefano,
> > Yes, I am planning to send them together with VPCI MSI support after
> > SMMU patches are merged.
> > 
> > Although the DomU vits itself is only two patches.
> 
> I am assuming this is work in progress patches rather than the one you plan to
> send, correct?
> 
> Asking, because currently there are a few ASSERT(is_hardware_domain(its->d))
> to indicate where changes are likely for the guests. You seem to remove them
> without explaining why or any associated code.
> 
> While I will not ask to have a security support guest vITS from the start. I
> would like some confidence that we are going in the right direction. IOW, I
> would like to see a design document that would explain how we can achieve it.
> Some of the part to consider:
>   * Command queue
>   * LPIs
>   * 1:1 pITS <-> vITS vs one vITS to many pITS
>   * The page-tables are shared between the device and CPU. Are we ok to keep
> the doorbell writable by the CPU?
> 
> There was some discussion in the past about it (I have added Rahul because
> IIRC he was driving the discussion). So most likely, we would need the design
> to be respinned and agreed first.
> 
> Lastly, I see you seem to go down the route of exposing one vITS only. But I
> don't think your patch is sufficient to support multiple pITS (the guest
> doorbell will be mapped to a different host doorbell depending on the guest).

To add to what Julien wrote, one thing is enabling a component with some
limitations, such as lacking a given feature. That might be OK.

A different thing is lack of isolation between VMs, or introducing a new
vehicle for interference, e.g. one VM using vITS causing troubles to
another VM using vITS.

Lack of isolation and interference are not OK. We need to be very
careful and be very aware if there any constraints or limitations we are
hitting against (e.g. size of the command queue) where one VM could
cause a denial of service to another VM because it is exhausting a given
physical resource.

