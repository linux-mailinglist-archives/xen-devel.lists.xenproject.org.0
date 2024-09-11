Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 272649749AF
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 07:21:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796164.1205636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soFlo-0002QC-1u; Wed, 11 Sep 2024 05:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796164.1205636; Wed, 11 Sep 2024 05:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soFln-0002O4-Ui; Wed, 11 Sep 2024 05:19:59 +0000
Received: by outflank-mailman (input) for mailman id 796164;
 Wed, 11 Sep 2024 05:19:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+cX=QJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1soFlm-0002Nw-TS
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 05:19:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b1da200-6ffd-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 07:19:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 499F05C03EF;
 Wed, 11 Sep 2024 05:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D650C4CEC5;
 Wed, 11 Sep 2024 05:19:53 +0000 (UTC)
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
X-Inumbo-ID: 7b1da200-6ffd-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726031994;
	bh=MUyqI2D661yzJJL6cSSB9xM7P4wVIqUwkLjC69fE/bA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uhS/VJRTL6vZAvZM2hqKOnUEuHfmlToBw+wruwfMzgUqFgn5oeN083YwD5cHWJIoj
	 La9Q+OkKBIyMZixtBD4KZlxD3nKO6j+maBVoe2+0OGnQ+GdaSheuW3zpap9g7jTcfI
	 kcB7HV0uBhpQegpLtScaSsIJXbIovcMTvzEOeouZrC05uYhmyWNSkLXBYk092hTD+w
	 KWsUYkhC672eaxRZsKDXQ4B+tXK3JLQpYmf/oLGRgCEn3qqN+Zng92ydujyp2hCLxr
	 3dxh8/sMqzVeGSCCoz6b9spHiT/Bu43hUkjSB330KbXRaCaiUkBwP3PXT6sKNfIANa
	 VCpVV4MF3K0gw==
Date: Tue, 10 Sep 2024 22:19:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>, 
    xen-devel@lists.xenproject.org, S32@nxp.com, 
    Andrei Cherechesu <andrei.cherechesu@nxp.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 3/5] xen/arm: platforms: Add NXP S32CC platform code
In-Reply-To: <f08942b8-3a01-4176-8fad-525ad3261083@xen.org>
Message-ID: <alpine.DEB.2.22.394.2409102210310.611587@ubuntu-linux-20-04-desktop>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com> <20240910143411.178704-4-andrei.cherechesu@oss.nxp.com> <f08942b8-3a01-4176-8fad-525ad3261083@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Sep 2024, Julien Grall wrote:
> Hi,
> 
> On 10/09/2024 15:34, Andrei Cherechesu (OSS) wrote:
> > From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> > 
> > Added support for NXP S32CC platforms (S32G2, S32G3, S32R45),
> > which need SCMI over SMC calls forwarded to the firmware
> > running at EL3 (TF-A). Linux relies on the SCMI Platform
> > for system services such as clocking, reset, etc.
> 
> Is it SMCI as in the Arm spec? If so, this should not be platform specific.
> 
> Furthermore, I was under the impression that we can't blindly forward
> everything from a domain to the firmware. While it might be okayish for dom0,
> you also seem to give access to all the domains on the system is it intended?
> 
> Anyway, there is a series on the ML to add a mediator for SCMI in Xen (see
> [1]). I think it would be preferable to focus on getting it merged as it would
> benefit everyone and increase the security posture (we could restrict access).


Hi Andrei, Julien,

SCMI is very flexible and can be configured in a number of ways. In
general, Julien has a point that typically forwarding to firmware all
SCMI requests from Xen domains is not the desired behavior.

An an example, imagine the case where device1 is assigned to domain1 and
device2 is assigned to domain2. Now imagine that they both share a
clock. Domain1 and domain2 could fight over the clock frequency settings
using SCMI to change it, without being aware of each other activities.
It is likely that the system would malfunction.

If this kind of situations can happen on NXP S32CC platforms, then this
patch might not be a good idea. As Julien suggested, you might want to
have a look at Oleksii's approach. We could probably allow Dom0 to make
all SCMI calls. If you think that is OK, you need to add a
(is_hardware_domain(d)) check.

On the other hand, if your SCMI server implementation has a way to
prevent possible harmful activities from happening, or maybe all clocks
are fixed-clocks so there are actually no SCMI operations to control the
clocks, then it could be possible that this patch might be fine. I admit
it is unlikely because there is a number of ways SCMI could be used by
one domain to hurt another domain.

Can you please give us a brief overview on how SCMI is expected to work
on NXP S32CC?

