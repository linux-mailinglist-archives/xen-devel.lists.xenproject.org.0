Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF9397A979
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 01:08:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799742.1209741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqKpN-000362-Dd; Mon, 16 Sep 2024 23:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799742.1209741; Mon, 16 Sep 2024 23:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqKpN-00032r-Aw; Mon, 16 Sep 2024 23:08:17 +0000
Received: by outflank-mailman (input) for mailman id 799742;
 Mon, 16 Sep 2024 23:08:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D3gN=QO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sqKpL-00032g-PV
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 23:08:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c06e57c-7480-11ef-99a2-01e77a169b0f;
 Tue, 17 Sep 2024 01:08:13 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2D8305C0F76;
 Mon, 16 Sep 2024 23:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58752C4CEC4;
 Mon, 16 Sep 2024 23:08:10 +0000 (UTC)
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
X-Inumbo-ID: 8c06e57c-7480-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726528091;
	bh=amvWLJA+o0DSGXAqKUY7ic+1vH7g932HpSuehOsxLYg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kUqvZMLBrGn3hiWTq+BBH2N412IvU7w+V1jVEQtgQb3ryuxlpl1PbumfmKXTSm9qw
	 RdDKUSuxGJF0ddqwu3vNNG0+AITESSpQ3p0ylP5ue+nNEiwq6v+w/ZBltxH0K3Xk6O
	 RWlH3USJOTBHkQfB5AfW4HKDK2I7eu206T9BzQPfMIqkGjV/3h9V/S7DCo2z0qZjrJ
	 bWXEmix6DJ58U+AX681QVCiOiq2klWc6CRrOA+qf+zHbXuxIZ7ofjocghQhs3SPZCp
	 dhFDpXOpHNfnCdVz+1s5+eVltkbx5g8r9K7CDC3ADJKy0GredgMgNwwio/8Q5kHT2x
	 +GtmcP2mtGVog==
Date: Mon, 16 Sep 2024 16:08:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "S32@nxp.com" <S32@nxp.com>, Andrei Cherechesu <andrei.cherechesu@nxp.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 3/5] xen/arm: platforms: Add NXP S32CC platform code
In-Reply-To: <35fcbbca-e11f-4b88-8359-09f8da9c17a1@xen.org>
Message-ID: <alpine.DEB.2.22.394.2409161605200.1417852@ubuntu-linux-20-04-desktop>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com> <20240910143411.178704-4-andrei.cherechesu@oss.nxp.com> <f08942b8-3a01-4176-8fad-525ad3261083@xen.org> <alpine.DEB.2.22.394.2409102210310.611587@ubuntu-linux-20-04-desktop>
 <85acbacc-2557-446c-9025-bdc7eac1cdb1@oss.nxp.com> <EA3C41C1-D484-456D-A391-4FB54B51D6CD@arm.com> <alpine.DEB.2.22.394.2409121544350.611587@ubuntu-linux-20-04-desktop> <7da698d1-b4ce-4152-a439-ae755847ed33@xen.org>
 <35fcbbca-e11f-4b88-8359-09f8da9c17a1@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Sep 2024, Julien Grall wrote:
> On 13/09/2024 08:43, Julien Grall wrote:
> > On 12/09/2024 23:44, Stefano Stabellini wrote:
> > > On Thu, 12 Sep 2024, Bertrand Marquis wrote:
> > > > Hi Andrei,
> > > > 
> > > > > On 11 Sep 2024, at 23:05, Andrei Cherechesu
> > > > > <andrei.cherechesu@oss.nxp.com> wrote:
> > > > > 
> > > > > Hi Julien, Stefano,
> > > > > On 11/09/2024 08:19, Stefano Stabellini wrote:
> > > > > > On Tue, 10 Sep 2024, Julien Grall wrote:
> > > > > > 
> > > > > > > Hi,
> > > > > > > 
> > > > > > > On 10/09/2024 15:34, Andrei Cherechesu (OSS) wrote:
> > > > > > > 
> > > > > > > > From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> > > > > > > > 
> > > > > > > > Added support for NXP S32CC platforms (S32G2, S32G3, S32R45),
> > > > > > > > which need SCMI over SMC calls forwarded to the firmware
> > > > > > > > running at EL3 (TF-A). Linux relies on the SCMI Platform
> > > > > > > > for system services such as clocking, reset, etc.
> > > > > > > > 
> > > > > > > Is it SMCI as in the Arm spec? If so, this should not be platform
> > > > > > > specific.
> > > > > Yes, it is SCMI as defined by Arm. I agree it shouldn't be platform
> > > > > specific.
> > > > > > 
> > > > > > > 
> > > > > > > Furthermore, I was under the impression that we can't blindly
> > > > > > > forward
> > > > > > > everything from a domain to the firmware. While it might be
> > > > > > > okayish for dom0,
> > > > > > > you also seem to give access to all the domains on the system is
> > > > > > > it intended?
> > > > > In our case, only Dom0 has access to the SCMI mailbox. Hence, the
> > > > > other unprivileged domains are not aware of SCMI and do not make any
> > > > > SCMI requests to FW.
> > > > > > 
> > > > > > > 
> > > > > > > Anyway, there is a series on the ML to add a mediator for SCMI in
> > > > > > > Xen (see
> > > > > > > [1]). I think it would be preferable to focus on getting it merged
> > > > > > > as it would
> > > > > > > 
> > > > > > > benefit everyone and increase the security posture (we could
> > > > > > > restrict access).
> > > > > I also asked a few months ago on the ML in a virtio related thread if
> > > > > there are any updates regarding
> > > > > SCMI awareness for Xen and guests, then Stefano CCed Bertrand, but he
> > > > > did not comment [0].
> > > > > I'm curious why the SCMI mediator patch series did not progress.
> > > > > [0]
> > > > > https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2401111627360.3675@ubuntu-linux-20-04-desktop/
> > > > 
> > > > Sorry it seems i missed that one.
> > > > 
> > > > There are several initiatives ongoing to investigate the global problem
> > > > of clock handling and more specifically
> > > > SCMI "sharing".
> > > > The SCMI protocol contains some features to have virtual channels and
> > > > the question is how to make a transport
> > > > that is hypervisor agnostic to prevent to require the hypervisors to
> > > > have to "decode" SCMI messages.
> > > > 
> > > > Virtio-scmi is not really used for clock management per say at the
> > > > moment and more specifically I do not
> > > > think it is a good solution to manage clocks of non virtio devices.
> > > > 
> > > > In Soafee and in Linaro people are looking at using FF-A as a tansport
> > > > for SCMI.
> > > > The idea would be that the hypervisor is configuring the virtual SCMI
> > > > channels using FF-A as a transport
> > > > and then VMs are using FF-A to communicate with an SCMI server (probably
> > > > sitting in secure world, at
> > > > least as a proxy). This is an investigation for now.
> > > > 
> > > > Requiring Xen to act as a mediator is also a solution but might require
> > > > a lot of platform specific code
> > > > which i think we should prevent.
> > > > 
> > > > For now having a solution in Xen where SCMI calls through SMC are only
> > > > allowed by Dom0 is the only
> > > > short term solution I think.
> > > 
> > > +1
> > I am open to go this way. But I would like the commit message to contain
> > some details on whether this will always work fine for dom0 (this would tell
> > whether the feature can be supported or needs to be in experimental/tech
> > preview).
> > 
> > At least my main concern is anything to do with RAM. On Matrix, Bertrand
> > suggested that none of the messages should contain addresses. What about the
> > transport? Is it using buffer? If so, are they fixed?
> > 
> > Brief looking at Linux, there are multiple DT compatible. IIUC, we would
> > only support "arm,scmi-smc" with the implementation. If so, maybe we should
> > check the DT.
> 
> Some clarifications as I was asked on Matrix. The issue described in this
> patch is not specific to SCMI. So I think the SCMI trapping & forward should
> be part of common code. If it we are not sure whether it is safe, then it
> should be protected by CONFIG_EXPERT or CONFIG_UNSUPPORTED.
> 
> I hope this clarifies what I would like. Not sure if the others agree though.

I think it is a good idea to make the SCMI trapping and forwarding in
common code. I am fine with that. I think it is OK to enable it by
default without CONFIG_EXPERT. I am OK with or without using
CONFIG_UNSUPPORTED. I am happy either way. Thanks Julien, good
suggestion.

