Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A4F975DE7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 02:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796904.1206607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soXW1-0002aa-W5; Thu, 12 Sep 2024 00:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796904.1206607; Thu, 12 Sep 2024 00:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soXW1-0002YA-TH; Thu, 12 Sep 2024 00:16:53 +0000
Received: by outflank-mailman (input) for mailman id 796904;
 Thu, 12 Sep 2024 00:16:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9bO=QK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1soXW0-0002Y4-GN
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 00:16:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d8dc1b4-709c-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 02:16:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B70DD5C0561;
 Thu, 12 Sep 2024 00:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EA6C4CEC0;
 Thu, 12 Sep 2024 00:16:46 +0000 (UTC)
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
X-Inumbo-ID: 4d8dc1b4-709c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726100208;
	bh=gI3HKvPH2uMAzN5tZiA0VdoS1QqpTLaE5YgezBXOoKM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WibvLWOdJqZuOEYYmm6zVweztEgNX1DReHTrBmAusEdwvPCDqrp6YxRVOwxQJBVkT
	 zg/xLJSjogAMQivuPFhI/zRC2SuYyyKZaop3Q8UfyjTQ67f8rzi244fH07JoBhGYOi
	 NxV6SwDZ8vOvulyyeColEVgqx2HXX3h7+vWD7OKP7jBpr2zph1Gn8NjvAZTdD84t6W
	 /skr6U3WhC3xDmABhQG6SiP+skD9sAM7SxaZvyaTaqbmug1F5/nSbKc2gRyFu8bOq7
	 mIoWJmYqu8bHV6ne2TA92A5nsbkG70DeIuYszTSo+9n5/gO5Ceoo5P/8l4v9DP2A+g
	 ODMmFDmH47l8Q==
Date: Wed, 11 Sep 2024 17:16:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, S32@nxp.com, 
    Andrei Cherechesu <andrei.cherechesu@nxp.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 3/5] xen/arm: platforms: Add NXP S32CC platform code
In-Reply-To: <85acbacc-2557-446c-9025-bdc7eac1cdb1@oss.nxp.com>
Message-ID: <alpine.DEB.2.22.394.2409111716170.611587@ubuntu-linux-20-04-desktop>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com> <20240910143411.178704-4-andrei.cherechesu@oss.nxp.com> <f08942b8-3a01-4176-8fad-525ad3261083@xen.org> <alpine.DEB.2.22.394.2409102210310.611587@ubuntu-linux-20-04-desktop>
 <85acbacc-2557-446c-9025-bdc7eac1cdb1@oss.nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 11 Sep 2024, Andrei Cherechesu wrote:
> Hi Julien, Stefano,
> On 11/09/2024 08:19, Stefano Stabellini wrote:
> 
> On Tue, 10 Sep 2024, Julien Grall wrote:
> 
> Hi,
> 
> On 10/09/2024 15:34, Andrei Cherechesu (OSS) wrote:
> 
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Added support for NXP S32CC platforms (S32G2, S32G3, S32R45),
> which need SCMI over SMC calls forwarded to the firmware
> running at EL3 (TF-A). Linux relies on the SCMI Platform
> for system services such as clocking, reset, etc.
> 
> Is it SMCI as in the Arm spec? If so, this should not be platform specific.
> 
> Yes, it is SCMI as defined by Arm. I agree it shouldn't be platform specific.
> 
> 
> Furthermore, I was under the impression that we can't blindly forward
> everything from a domain to the firmware. While it might be okayish for dom0,
> you also seem to give access to all the domains on the system is it intended?
> 
> In our case, only Dom0 has access to the SCMI mailbox. Hence, the other unprivileged domains are not aware of SCMI and do not make any SCMI
> requests to FW.
> 
> 
> Anyway, there is a series on the ML to add a mediator for SCMI in Xen (see
> [1]). I think it would be preferable to focus on getting it merged as it would
>             benefit everyone and increase the security posture (we could restrict access).
> 
> I also asked a few months ago on the ML in a virtio related thread if there are any updates regarding
> SCMI awareness for Xen and guests, then Stefano CCed Bertrand, but he did not comment [0].
> I'm curious why the SCMI mediator patch series did not progress.
> [0] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2401111627360.3675@ubuntu-linux-20-04-desktop/
> 
> 
> Hi Andrei, Julien,
> 
> SCMI is very flexible and can be configured in a number of ways. In
> general, Julien has a point that typically forwarding to firmware all
> SCMI requests from Xen domains is not the desired behavior.
> 
> An an example, imagine the case where device1 is assigned to domain1 and
> device2 is assigned to domain2. Now imagine that they both share a
> clock. Domain1 and domain2 could fight over the clock frequency settings
> using SCMI to change it, without being aware of each other activities.
> It is likely that the system would malfunction.
> 
> I completely agree and we are aware of the possible resource contention. Another (simpler?) scenario where access control is needed,
> besides the one you described, is when Domain1 would directly try to perform some requests for some resources that affect Device2 (owned by
> Domain2). If Domain1 knows the clock IDs used by Device2, for example, without any access control it could perform a SCMI clock request
> affecting Device2's clocks, which should be out of his control.
> 
> 
> If this kind of situations can happen on NXP S32CC platforms, then this
> patch might not be a good idea. As Julien suggested, you might want to
> have a look at Oleksii's approach. We could probably allow Dom0 to make
> all SCMI calls. If you think that is OK, you need to add a
> (is_hardware_domain(d)) check.
> 
> On the other hand, if your SCMI server implementation has a way to
> prevent possible harmful activities from happening, or maybe all clocks
> are fixed-clocks so there are actually no SCMI operations to control the
> clocks, then it could be possible that this patch might be fine. I admit
> it is unlikely because there is a number of ways SCMI could be used by
> one domain to hurt another domain.
> 
> Can you please give us a brief overview on how SCMI is expected to work
> on NXP S32CC?
> 
> Well, we normally rely on most SCMI protocols to access system-level resources from agents: Base, Power Domain, System Power, Performance
> Domain, Clock, Reset Domain. Linux jumps to EL3 via SMC carrying an SCMI message, and FW running at EL3 decides how to handle it.
> Basically, Linux cannot directly control most system-level resources.
> 
> With Xen, we currently don't allow unprivileged Domains to do SCMI requests. The SMCs are of course trapped at EL2 and that's why we
> enabled forwarding to EL3 without any access control, knowing it shouldn't break anything, and to let everything function as normal. In
> some passthrough scenarios the unprivileged domains rely on settings already made by firmware (for clocks, pins, etc) that their assigned
> devices require, and in DT we replace them with e.g. fixed-clock for clocks.
> 
> An "is_hardware_domain(d)" check should be enough for the moment to harden the code, but I agree that this should not be something
> platform-specific in the future, and the handling must be done in a generic way.
> So I would proceed with this approach for this patch series, if that's ok for you, and I will also take a look at Oleksii's approach.

I know how hard is to solve this properly and it might take months. I
wouldn't want to stop Xen from working on NXP S32CC until a proper SCMI
solution is found. For now, I would say to add the
"is_hardware_domain(d)" check.

Julien, do you also agree?

