Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA19C1EE7C9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 17:31:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgrqE-0005WJ-G8; Thu, 04 Jun 2020 15:31:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m3HA=7R=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jgrqC-0005WE-MJ
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 15:31:36 +0000
X-Inumbo-ID: 79acae2a-a678-11ea-9dbe-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79acae2a-a678-11ea-9dbe-bc764e2007e4;
 Thu, 04 Jun 2020 15:31:35 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0AFB5207D8;
 Thu,  4 Jun 2020 15:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591284695;
 bh=Vte9wiWyZgKhi4h1DiODPR1O5zkDeEOTtH15miC2eEA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=YZcuohFD4IgHhCkqUnaBEHvLn/6M+XcjeeMkWd8W4CdGLgip1TptCHZPzs90WArn0
 CELGX1ghA8ntSPOKO48U0GfxpJ1hzYtTTdh7xEh/3jkQE34g5G+arp2JwAU4+dVwmW
 IKoE8zb7RdX3pFTE/s9mHo7P7xr4c6wv9K6oj54M=
Date: Thu, 4 Jun 2020 08:31:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: UEFI support in ARM DomUs
In-Reply-To: <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
Message-ID: <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Roman Shaposhnik <roman@zededa.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 4 Jun 2020, Oleksandr Andrushchenko wrote:
> On 6/4/20 4:57 AM, Peng Fan wrote:
> > Grall <julien@xen.org>;
> >> Nataliya Korovkina <malus.brandywine@gmail.com>
> >> Subject: UEFI support in ARM DomUs
> > We have made U-Boot run inside XEN DomU, but just only PV console part,
> > not implement other frontend drivers currently. Would this help for your
> > case if enable EFI in U-Boot?
> 
> Well, we have a working PV block implementation on top of that on iMX8
> 
> platform, mostly ported from mini-os. Currently we are finalizing the work
> 
> and cleaning up (it's going to take a week or so hopefully). Then, we we'll post
> 
> it on our public github. We are also thinking about upstreaming the work, but it may
> 
> take quite some time if the whole idea fits u-boot's view on such an extension at all.

Yes please to both of you! :-)

In the meantime, while we wait for those changes to go upstream in
uboot, could you please post a branch on github and a link on this email
thread?

Maybe we should have a wikipage on wiki.xenproject.org about
work-in-progress uboot items.




> > Regards,
> > Peng.
> >
> >> Hi!
> >>
> >> with a lot of help from Stefano, we're getting RPi4 support in Project EVE
> >> pretty much on par between KVM and Xen.
> >>
> >> One big area that still remains is supporting UEFI boot sequence for DomUs.
> >> With KVM, given the qemu virt device model this is as simple as using either
> >> stock UEFI build for arm or even U-Boot EFI emulation environment and
> >> passing it via -bios option.
> >>
> >> Obviously with Xen on ARM we don't have the device model so my
> >> understanding is that the easiest way we can support it would be to port
> >> UEFI's OvmfPkg/OvmfXen target to ARM (it seems to be currently exclusively
> >> X64).
> >>
> >> So here's my first question: if there's anybody on this list who had a hand in
> >> implementing OvmfPkg/OvmfXen can you please share your thoughts on how
> >> much work that port may be (or whether it is even feasible -- I may totally be
> >> missing something really obvious here).
> >>
> >> And as long as I've got your attention: two more questions:
> >>     1.. compared to the above, would porting pvgrub to ARM be any
> >>     easier or more difficult?
> >>
> >>     2. same question for teaching u-boot about PV calls.
> >>
> >> Thanks,
> >> Roman.
> >>
> >> P.S. Oh and I guess between:
> >>     0. OvmfPkg/OvmfXen on ARM64
> >>     1. pvgrub on ARM64
> >>     2. u-boot/EFI emulation with PV calls backend I didn't miss any other
> >> obvious way of making UEFI-aware VM images to boot on Xen ARM64 DomU,
> >> right?

