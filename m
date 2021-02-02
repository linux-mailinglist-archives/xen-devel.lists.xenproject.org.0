Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B117930C9BC
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 19:28:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80687.147771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l70OY-0005En-A1; Tue, 02 Feb 2021 18:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80687.147771; Tue, 02 Feb 2021 18:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l70OY-0005EP-6O; Tue, 02 Feb 2021 18:27:22 +0000
Received: by outflank-mailman (input) for mailman id 80687;
 Tue, 02 Feb 2021 18:27:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gsWk=HE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l70OX-0005EC-2L
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 18:27:21 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7c15d5a-4cdd-4df8-b5d2-8bafc3c15eb9;
 Tue, 02 Feb 2021 18:27:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D97764F68;
 Tue,  2 Feb 2021 18:27:19 +0000 (UTC)
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
X-Inumbo-ID: d7c15d5a-4cdd-4df8-b5d2-8bafc3c15eb9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612290439;
	bh=4VmhOap821i5h0fmMi7LKFBaQp9enkkSEshesdaVjw4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GjsBHYrXgmuyvYBZ31Qa2c5eK7vTmgmh/COeMQ4EKJD8wTOxCGlRMjB0ld0pOxaQR
	 Oz4uBrpORvjB724Msm0/b1dHUDNXree3STn90miBzIW1ZDmI665k1/mjBUq+YJq76G
	 ikXUHq9SNmgf8R4pSNN59j+5zmGUONCMFq0iCjm8AXv/f+cNv65Gn7SZTwKUjRx46r
	 +PdorPizufaj5b5BBoz9456ebavm8gqOhcoO/VUbZ7uh8nmo2ACjnGaqbTbX/801jR
	 EmCmFjYybML8Yynezqn33Rv6GKbTk8MuM8GH/eXZjxpByQQryaMvlLpFyh3MrjRv1W
	 SChmSh/kvM/Pw==
Date: Tue, 2 Feb 2021 10:27:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Rahul Singh <Rahul.Singh@arm.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
    "brian.woods@xilinx.com" <brian.woods@xilinx.com>
Subject: Re: [PATCH v3 0/3] Generic SMMU Bindings
In-Reply-To: <7ddc6e1b-41ce-37ae-f86e-39893f53a0ec@xen.org>
Message-ID: <alpine.DEB.2.21.2102021024100.29047@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s> <C094E054-885F-4363-ABF3-E0FB4DDD7A2A@arm.com> <alpine.DEB.2.21.2102020937480.29047@sstabellini-ThinkPad-T480s> <7ddc6e1b-41ce-37ae-f86e-39893f53a0ec@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 Feb 2021, Julien Grall wrote:
> On 02/02/2021 17:44, Stefano Stabellini wrote:
> > On Tue, 2 Feb 2021, Rahul Singh wrote:
> > > Hello Stefano,
> > > 
> > > > On 26 Jan 2021, at 10:58 pm, Stefano Stabellini <sstabellini@kernel.org>
> > > > wrote:
> > > > 
> > > > Hi all,
> > > > 
> > > > This series introduces support for the generic SMMU bindings to
> > > > xen/drivers/passthrough/arm/smmu.c.
> > > > 
> > > > The last version of the series was
> > > > https://marc.info/?l=xen-devel&m=159539053406643
> > > > 
> > > > I realize that it is late for 4.15 -- I think it is OK if this series
> > > > goes in afterwards.
> > > 
> > > I tested the series on the Juno board it is woking fine.
> > > I found one issue in SMMU driver while testing this series that is not
> > > related to this series but already existing issue in SMMU driver.
> > > 
> > > If there are more than one device behind SMMU and they share the same
> > > Stream-Id, SMMU driver is creating the new SMR entry without checking the
> > > already configured SMR entry if SMR entry correspond to stream-id is
> > > already configured.  Because of this I observed the stream match conflicts
> > > on Juno board.
> > > 
> > > (XEN) smmu: /iommu@7fb30000: Unexpected global fault, this could be
> > > serious
> > > (XEN) smmu: /iommu@7fb30000: 	GFSR 0x00000004, GFSYNR0 0x00000006,
> > > GFSYNR1 0x00000000, GFSYNR2 0x00000000
> > > 
> > > 
> > > Below two patches is required to be ported to Xen to fix the issue from
> > > Linux driver.
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/iommu/arm-smmu.c?h=linux-5.8.y&id=1f3d5ca43019bff1105838712d55be087d93c0da
> > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/iommu/arm-smmu.c?h=linux-5.8.y&id=21174240e4f4439bb8ed6c116cdbdc03eba2126e
> > 
> > 
> > Good catch and thanks for the pointers! Do you have any interest in
> > backporting these two patches or should I put them on my TODO list?
> > 
> > Unrelated to who does the job, we should discuss if it makes sense to
> > try to fix the bug for 4.15. The patches don't seem trivial so I am
> > tempted to say that it might be best to leave the bug unfixed for 4.15
> > and fix it later.
> 
> SMMU support on Juno is not that interesting because IIRC the stream-ID is the
> same for all the devices. So it is all or nothing passthrough.
> 
> For other HW, this may be a useful feature. Yet we would need a way to group
> the devices for passthrough.
> 
> In this context, I would consider it more a feature than a bug because the
> SMMU driver never remotely work on such HW.

I see. To be honest I wasn't thinking of Juno (I wasn't aware of its
limitations) but of potential genuine situations where stream-ids are
the same for 2 devices. I know it can happen with PCI devices for
instance, although I am aware we don't have PCI passthrough yet. I don't
know if it is possible for it to happen with non-PCI devices but I
wouldn't be surprised if it can.

