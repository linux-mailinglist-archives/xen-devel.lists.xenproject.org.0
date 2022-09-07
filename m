Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50C45B10AE
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 01:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402370.644293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW4uY-0003nb-Vk; Wed, 07 Sep 2022 23:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402370.644293; Wed, 07 Sep 2022 23:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW4uY-0003ld-T5; Wed, 07 Sep 2022 23:56:50 +0000
Received: by outflank-mailman (input) for mailman id 402370;
 Wed, 07 Sep 2022 23:56:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9Or=ZK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oW4uX-0003lX-25
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 23:56:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id badbe239-2f08-11ed-a016-b9edf5238543;
 Thu, 08 Sep 2022 01:56:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 856CA61AF9;
 Wed,  7 Sep 2022 23:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1104C433C1;
 Wed,  7 Sep 2022 23:56:43 +0000 (UTC)
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
X-Inumbo-ID: badbe239-2f08-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662595004;
	bh=36fenpx6NiCJovDMTugfUZeR5Kmo3TDy9zjC/oYAs8Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lmerQM9dy+FwTTcvvrGo2KPy5K3H1K1PLfy/zZqhxl6rcECx1QbvbHMklIk31tlY9
	 niAsTu/VClEqLTE8Zq/V/69V1Kk6gdM0CdXory61k5+Ht2f/NRrJWxjvXa3BTRZgZ3
	 f5ySggWfVEbAsQubcAGyEpbvjwYPw+rOT6HQ0DB9apYZDbnFOokwirP73mTHSP2KkP
	 QNCzItGu7/RbXzzdpDttjXqF+ZHAmBtRRLbz3uULzwMsYpfbpXD999U9d/RrdX4Fgw
	 7fycPSf1MWQtpp3znvH/14oJSD2y3//c2UH83r15sRHC2L9y/cQaBNBkJo9AE6HX9e
	 6rIVrhvCRyLiw==
Date: Wed, 7 Sep 2022 16:56:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Henry Wang <Henry.Wang@arm.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
In-Reply-To: <39862a75-ed08-1289-0a0d-a2580f27fdf1@xen.org>
Message-ID: <alpine.DEB.2.22.394.2209071646210.157835@ubuntu-linux-20-04-desktop>
References: <20220907083643.20152-1-Henry.Wang@arm.com> <20220907083643.20152-3-Henry.Wang@arm.com> <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org> <9a66b6df-bc37-d836-8175-3b98be07c696@amd.com> <e5e9a62d-6072-463e-6c4c-8d94aa29589b@xen.org>
 <a29a07fd-40ad-602f-9a79-a36783ada947@amd.com> <e8bf68b1-0217-c8cd-4864-ea7fe415fb0a@xen.org> <b0b85a1c-ff00-ea06-a960-e49799d507eb@amd.com> <ED046919-0B75-48C6-900F-44F3295553B7@arm.com> <7997786c-78ff-47df-12de-d1fe38e5624d@amd.com>
 <4B69D9F9-04AC-4042-AF74-F51630816208@arm.com> <eed26206-9684-4010-278c-14ed3602582b@amd.com> <759E29A4-AADA-4678-A88B-E96C5C15A462@arm.com> <AS8PR08MB79916A5189182179F6BEB29192419@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <39862a75-ed08-1289-0a0d-a2580f27fdf1@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Sep 2022, Julien Grall wrote:
> On 07/09/2022 14:49, Henry Wang wrote:
> > > -----Original Message-----
> > > From: Bertrand Marquis <Bertrand.Marquis@arm.com>
> > > > > > > But in any case we should only add one pair here for sure, as you
> > > > > > > say
> > > the
> > > > > > > only implication is to add a couple of 0 in the worst case.
> > > > > > I agree. The only drawback is the need to modify the already
> > > > > > introduced
> > > properties
> > > > > > to be coherent.
> > > > > 
> > > > > Agree, someone will need to do a pass on the whole doc which might be
> > > easier with all things in.
> > > > > 
> > > > Well, not only docs. If we decide to use a single pair of #address-cells
> > > > and
> > > #size-cells, then
> > > > we need to modify the code that expects different properties e.g.
> > > xen,static-mem-{address/size}-cells.
> > > 
> > > Right I forgot that some parts are already in.
> > > So we will need an extra patch to handle those.
> > 
> > I think I've addressed all comments from Julien regarding my series,
> 
> If it is not too late for you would you be able to resend your series without
> the 'address-cells'/'size-cells' change? This will give me the opportunity to
> have an other review today.
> 
> > so I think I've got some bandwidth to do the clean-up patch tomorrow
> > after the agreement, unless someone would like to do it himself?
> 
> Renaming "xen,static-mem-..." is a bit tricky because they have been defined
> in Xen 4.16.
> 
> I couldn't find any support statement specific to the static memory feature.
> So it would technically fall under the "dom0less" section which is security
> supported.
> 
> That said, I don't think we can consider that the static memory feature is
> even supported because, until yesterday, the code wasn't properly handling
> request to balloon in/out. So I would view this is a tech preview (Could
> someone send a patch to clarify SUPPORT.MD)?
> 
> This would mean that would be that we could consider the binding unstable and
> we could do a straight renaming. That said, I can understand this may be
> undesirable.
> 
> If that's the case then we would need to keep the current binding as-is. So we
> would have two options:
>   1) Provide a new compatible so #address-cells #size-cells can be used. The
> current binding can be deprecated
>   2) Leave as-is and accept the difference
> 
> I don't have a strong opinion on which way to go. Whichever, it would be good
> to write down the rationale in the commit message of the "future" patch.
> 
> I would not block this series on the renaming for existing property (what
> matter is the new ones are consistent with the discussion). The renaming could
> be done afterwards. I would even say post the feature freeze on Friday because
> this could be considered as a bug fix (assuming you agree as the release
> manager :)).

I very much agree that we should be consistent. Consistency aside, I
would prefer *not* to introduce #xen,static-heap-address-cells and
#xen,static-heap-size-cells and instead reuse the regular #address-cells
and #size-cells. I think there is no reason why we shouldn't.

I was about to write something about it a couple of days ago but then I
noticed that we had already introduced #xen,static-mem-address-cells and
#xen,static-mem-size-cells. In order to be consistent I didn't say
anything and gave my ack.

But actually I think it is better to get rid of them all. I think we
should:

1) do not introduce #xen,static-heap-address-cells and
#xen,static-heap-size-cells in this series, instead rely on
#address-cells and #size-cells. Please write in the binding that the
number of address cells and size cells of xen,static-heap is determined
by the parent #address-cells and #size-cells. (It has to be the parent
because that is how #address-cells and #size-cells are defined.)

2) Also remove "#xen,static-mem-address-cells" and
"#xen,static-mem-size-cells", and also use #address-cells and
#size-cells for xen,static-mem as well. I think we should do that in
this release for consistency. Any volunteers? :-)

It is not going to break anything because, not only static-mem is tech
preview, but also it is very likely that if someone was using
#xen,static-heap-address-cells it would be setting it to the same value
as #address-cells. So in the vast majority of cases it would continue to
work as expected (not that we couldn't change it anyway, given that it
is a tech preview.)

So I am aligned with Julien on this.

