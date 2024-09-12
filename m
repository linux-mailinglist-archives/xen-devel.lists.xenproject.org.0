Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E3097747F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 00:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797844.1207909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sosYY-0000TW-T8; Thu, 12 Sep 2024 22:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797844.1207909; Thu, 12 Sep 2024 22:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sosYY-0000Rx-QV; Thu, 12 Sep 2024 22:44:54 +0000
Received: by outflank-mailman (input) for mailman id 797844;
 Thu, 12 Sep 2024 22:44:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9bO=QK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sosYX-0008M5-Sz
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 22:44:53 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fea737d-7158-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 00:44:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A0FAEA458B0;
 Thu, 12 Sep 2024 22:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DB6C4CEC3;
 Thu, 12 Sep 2024 22:44:50 +0000 (UTC)
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
X-Inumbo-ID: 9fea737d-7158-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726181092;
	bh=S6TskvlaJKwdN7CEmsIR3brl1DHSiI+ybZceTjVIzDs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=n+r2oHGkJdq/cmBfxtK2Y8AxVa8w1t8l2Qg0q5JR9N4XimVkAexMSk07fHggnUu6b
	 3AlNV05LUmH2D+p6fqygkFiumHAAVEyuBGyaqiNDscrXJY4zSLUaXCQFVqd/6aCfO8
	 +mRFaDKsb/7kVIa9vZVVmTdErCNDdxosbi2L3friG3j8Wi7GT7Ok+V91RJzmH0kKnj
	 sTPHiI6mSJ1fP0byNaZ+2p8P9/ovm5z1Pd+rtu7uFX9PuG+AHz712MfMl9/zSOE4TG
	 JpWDCRwnDcSGzXPqtab1sGNaCwyvLogszZ427eHqbtzQ7Os70iE1fb89G1TOF4H3B1
	 hH7DpvZyQJkjA==
Date: Thu, 12 Sep 2024 15:44:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "S32@nxp.com" <S32@nxp.com>, Andrei Cherechesu <andrei.cherechesu@nxp.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 3/5] xen/arm: platforms: Add NXP S32CC platform code
In-Reply-To: <EA3C41C1-D484-456D-A391-4FB54B51D6CD@arm.com>
Message-ID: <alpine.DEB.2.22.394.2409121544350.611587@ubuntu-linux-20-04-desktop>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com> <20240910143411.178704-4-andrei.cherechesu@oss.nxp.com> <f08942b8-3a01-4176-8fad-525ad3261083@xen.org> <alpine.DEB.2.22.394.2409102210310.611587@ubuntu-linux-20-04-desktop>
 <85acbacc-2557-446c-9025-bdc7eac1cdb1@oss.nxp.com> <EA3C41C1-D484-456D-A391-4FB54B51D6CD@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Sep 2024, Bertrand Marquis wrote:
> Hi Andrei,
> 
> > On 11 Sep 2024, at 23:05, Andrei Cherechesu <andrei.cherechesu@oss.nxp.com> wrote:
> > 
> > Hi Julien, Stefano, 
> > On 11/09/2024 08:19, Stefano Stabellini wrote:
> >> On Tue, 10 Sep 2024, Julien Grall wrote:
> >> 
> >>> Hi,
> >>> 
> >>> On 10/09/2024 15:34, Andrei Cherechesu (OSS) wrote:
> >>> 
> >>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> >>>> 
> >>>> Added support for NXP S32CC platforms (S32G2, S32G3, S32R45),
> >>>> which need SCMI over SMC calls forwarded to the firmware
> >>>> running at EL3 (TF-A). Linux relies on the SCMI Platform
> >>>> for system services such as clocking, reset, etc.
> >>>> 
> >>> Is it SMCI as in the Arm spec? If so, this should not be platform specific.
> > Yes, it is SCMI as defined by Arm. I agree it shouldn't be platform specific.
> >> 
> >>> 
> >>> Furthermore, I was under the impression that we can't blindly forward
> >>> everything from a domain to the firmware. While it might be okayish for dom0,
> >>> you also seem to give access to all the domains on the system is it intended?
> > In our case, only Dom0 has access to the SCMI mailbox. Hence, the other unprivileged domains are not aware of SCMI and do not make any SCMI requests to FW.
> >> 
> >>> 
> >>> Anyway, there is a series on the ML to add a mediator for SCMI in Xen (see
> >>> [1]). I think it would be preferable to focus on getting it merged as it would
> >>> 
> >>> benefit everyone and increase the security posture (we could restrict access).
> > I also asked a few months ago on the ML in a virtio related thread if there are any updates regarding 
> > SCMI awareness for Xen and guests, then Stefano CCed Bertrand, but he did not comment [0].
> > I'm curious why the SCMI mediator patch series did not progress.
> > [0] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2401111627360.3675@ubuntu-linux-20-04-desktop/
> 
> Sorry it seems i missed that one.
> 
> There are several initiatives ongoing to investigate the global problem of clock handling and more specifically
> SCMI "sharing".
> The SCMI protocol contains some features to have virtual channels and the question is how to make a transport
> that is hypervisor agnostic to prevent to require the hypervisors to have to "decode" SCMI messages.
> 
> Virtio-scmi is not really used for clock management per say at the moment and more specifically I do not
> think it is a good solution to manage clocks of non virtio devices.
> 
> In Soafee and in Linaro people are looking at using FF-A as a tansport for SCMI.
> The idea would be that the hypervisor is configuring the virtual SCMI channels using FF-A as a transport
> and then VMs are using FF-A to communicate with an SCMI server (probably sitting in secure world, at
> least as a proxy). This is an investigation for now.
> 
> Requiring Xen to act as a mediator is also a solution but might require a lot of platform specific code
> which i think we should prevent.
> 
> For now having a solution in Xen where SCMI calls through SMC are only allowed by Dom0 is the only
> short term solution I think.

+1

