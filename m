Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A5E62CF3A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 00:57:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444434.699645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovSGw-0001up-4F; Wed, 16 Nov 2022 23:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444434.699645; Wed, 16 Nov 2022 23:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovSGw-0001sI-0q; Wed, 16 Nov 2022 23:56:50 +0000
Received: by outflank-mailman (input) for mailman id 444434;
 Wed, 16 Nov 2022 23:56:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CGj7=3Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ovSGu-0001sC-5Z
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 23:56:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 544fc8e6-660a-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 00:56:46 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C86DB81F0B;
 Wed, 16 Nov 2022 23:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9170AC433B5;
 Wed, 16 Nov 2022 23:56:43 +0000 (UTC)
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
X-Inumbo-ID: 544fc8e6-660a-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668643005;
	bh=Xf8T652sVPj0jAYuKh8bXfXq7wUmyp3rwTJL7Q86wms=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NNzknhzHjOardbDEACaWSMf/2Dg9eFeHUqG/A9KFhCHB4c4ZKZqKKIocKoPqmPNpU
	 Kt7AvyF0qPsciDJalIHUgS6yb3YMO3zjdUx1KH84Epvx368Sg0gPpflasIc9ZY0H+J
	 vf2mUYsUw87enHR2t2K77oFNtEIPyC0/UzJvAfzIFM99hetDcO5z5azUNzVc7qQ3f1
	 JGXekwJaygVmQUm0+S8lOKnbXXKy774thxULxekpOjwo9IRsSGYAbuZ21TYvWuX2nk
	 CgSpgSYWHbkHbarhgjJ1UL9cdgcW5xxI69U6wYemXAM2siog8vUA38+4+U8d869FXp
	 VVkor+0aWtyEg==
Date: Wed, 16 Nov 2022 15:56:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Xen Security Team <security@xen.org>, 
    Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Henry Wang <Henry.Wang@arm.com>, 
    Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 3/4] xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use
 p2m mempool hypercalls
In-Reply-To: <da6dc775-3055-3b22-e991-43b6da40a89e@xen.org>
Message-ID: <alpine.DEB.2.22.394.2211161556070.4020@ubuntu-linux-20-04-desktop>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com> <20221026102018.4144-4-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2211151724320.4020@ubuntu-linux-20-04-desktop> <c0ba7b0f-d91f-74f2-be4a-3cb944392c95@citrix.com>
 <alpine.DEB.2.22.394.2211151759480.4020@ubuntu-linux-20-04-desktop> <ddb3dd9b-8697-1fe8-2dcc-2b5b859d18f6@suse.com> <269f4e70-07c2-5cf6-f42e-6f98e2ce70dd@citrix.com> <alpine.DEB.2.22.394.2211161543350.4020@ubuntu-linux-20-04-desktop>
 <da6dc775-3055-3b22-e991-43b6da40a89e@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1621048945-1668643005=:4020"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1621048945-1668643005=:4020
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 16 Nov 2022, Julien Grall wrote:
> On 16/11/2022 23:44, Stefano Stabellini wrote:
> > On Wed, 16 Nov 2022, Andrew Cooper wrote:
> > > On 16/11/2022 08:30, Jan Beulich wrote:
> > > > On 16.11.2022 03:00, Stefano Stabellini wrote:
> > > > > On Wed, 16 Nov 2022, Andrew Cooper wrote:
> > > > > > On 16/11/2022 01:37, Stefano Stabellini wrote:
> > > > > > > On Wed, 26 Oct 2022, Andrew Cooper wrote:
> > > > > > > > This reverts most of commit
> > > > > > > > cf2a68d2ffbc3ce95e01449d46180bddb10d24a0, and bits
> > > > > > > > of cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7.
> > > > > > > > 
> > > > > > > > First of all, with ARM borrowing x86's implementation, the logic
> > > > > > > > to set the
> > > > > > > > pool size should have been common, not duplicated.  Introduce
> > > > > > > > libxl__domain_set_p2m_pool_size() as a shared implementation,
> > > > > > > > and use it from
> > > > > > > > the ARM and x86 paths.  It is left as an exercise to the reader
> > > > > > > > to judge how
> > > > > > > > libxl/xl can reasonably function without the ability to query
> > > > > > > > the pool size...
> > > > > > > > 
> > > > > > > > Remove ARM's p2m_domctl() infrastructure now the functioanlity
> > > > > > > > has been
> > > > > > > > replaced with a working and unit tested interface.
> > > > > > > > 
> > > > > > > > This is part of XSA-409 / CVE-2022-33747.
> > > > > > > Genuine question: I can see this patch removes the implementation
> > > > > > > of
> > > > > > > XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION on ARM. It also switches libxl
> > > > > > > (both
> > > > > > > ARM and x86) to the new hypercall.
> > > > > > > 
> > > > > > > Why keep the old hypercall (XEN_DOMCTL_shadow_op and
> > > > > > > XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION) implementation on x86 (not on
> > > > > > > ARM)?
> > > > > > > 
> > > > > > > Is that because it was only recently implemented? And not actually
> > > > > > > present in any past Xen release?
> > > > > > > 
> > > > > > > If so, please add a note about this in the commit message. Also,
> > > > > > > if that
> > > > > > > is the case, I think this patch series should go in 4.17. If it is
> > > > > > > too
> > > > > > > late to get it in before the release, then we should backport it
> > > > > > > to 4.17
> > > > > > > as soon as possible. That's because ideally we want to keep the
> > > > > > > hypercall interface changes down to a minimum.
> > > > > > On ARM, the hypercall has existed for a little over 4 weeks, and
> > > > > > isn't
> > > > > > in any released version of Xen (yet).
> > > > > > 
> > > > > > On x86, the hypercall has existed for more than a decade, and has
> > > > > > known
> > > > > > out-of-tree users.  It needs to be deprecated properly, which in
> > > > > > this
> > > > > > case means "phased out in the 4.18 cycle once known callers have
> > > > > > been
> > > > > > adapted to the new hypercall".
> > > > > Understoon. Then I am in favor of getting all 4 patches in 4.17,
> > > > > either
> > > > > before the release or via backports.
> > > > Removing something from the domctl interface generally requires bumping
> > > > the interface version, so some extra care may need applying if such an
> > > > interface change was to be backported to any stable branch.
> > > 
> > > To be clear, I have no plans to remove the x86 "older" interface in this
> > > patch series.  It will definitely break out of tree users.
> > > 
> > > In the 4.18 timeframe, we can see about retiring the older hypercalls,
> > > but as a non-backportable change.
> > 
> > For ARM, given that XEN_DOMCTL_shadow_op has not been enabled for long,
> > maybe we can get away without bumping the interface version?
> 
> IMHO how long it was out doesn't matter. Once we do a release, we should avoid
> changing the interface in minor version.
> 
> This is because a user may start to rely on it and we don't want to break them
> for minor releases.

We haven't released 4.17 yet, so I take you are referring to a stable
minor release, right?
--8323329-1621048945-1668643005=:4020--

