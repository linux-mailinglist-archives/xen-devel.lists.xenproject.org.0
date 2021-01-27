Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D0D30655A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 21:46:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76423.137906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4rhn-0002iK-Mw; Wed, 27 Jan 2021 20:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76423.137906; Wed, 27 Jan 2021 20:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4rhn-0002hv-J2; Wed, 27 Jan 2021 20:46:23 +0000
Received: by outflank-mailman (input) for mailman id 76423;
 Wed, 27 Jan 2021 20:46:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5d38=G6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l4rhl-0002hq-GN
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 20:46:21 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8937056-5a7b-45e3-b141-21caecb5b5a4;
 Wed, 27 Jan 2021 20:46:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3473764D9A;
 Wed, 27 Jan 2021 20:46:19 +0000 (UTC)
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
X-Inumbo-ID: e8937056-5a7b-45e3-b141-21caecb5b5a4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611780380;
	bh=0RfUf4yerQrha9QyOB+91GWDYT7qOWKxq5wesvhQqSM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MmVdZ+96zpxx0O6Ce/02Htnn9gJiNRpTg6xCdhU4wz75fzXiFm9nbHceien1j6OQs
	 NU9WuPvMrrq0Y8ATVG/OE8YxnGKDC4kCbmfFnbeFeBiW5EnWu2/z3zZHvUsXd0YgTp
	 nwU9Vs8LGRs1k/FOJTX72WyA+8GcDHWxFK9FY7W7dd2dUZYOweUNdEnzhN+1n8VGCB
	 HkQC+chhJuM96OfmcG2HCaMvvBzH/eP8fJ50u8ZZO1lcSQ0sepNaWtYZXFWDLKGNae
	 hviLEthZDzK+Uxpw1R93HMYnhcBEXHjm7jm+OLAkEfkjCwaVMKU76vQsLbqY9j7bZf
	 5+SAN45vC0IFw==
Date: Wed, 27 Jan 2021 12:46:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Julien Grall <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, 
    Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>, 
    Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V5 04/22] xen/ioreq: Make x86's IOREQ feature common
In-Reply-To: <1156e356-5762-a196-ec16-bb6614912394@gmail.com>
Message-ID: <alpine.DEB.2.21.2101271235410.9684@sstabellini-ThinkPad-T480s>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com> <1611601709-28361-5-git-send-email-olekstysh@gmail.com> <CAJ=z9a1c+obN3KW_cMr7OH0112_gHSxnAoEJb9qW6R1J38QgQQ@mail.gmail.com> <20270711-36bc-6d7d-16cb-4572cace47ed@gmail.com>
 <eb03f366-9405-c193-07be-fbeca29fca4c@xen.org> <1156e356-5762-a196-ec16-bb6614912394@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Jan 2021, Oleksandr wrote:
> > > > On Mon, 25 Jan 2021 at 19:09, Oleksandr Tyshchenko <olekstysh@gmail.com>
> > > > wrote:
> > > > > ***
> > > > > Please note, this patch depends on the following which is
> > > > > on review:
> > > > > https://patchwork.kernel.org/patch/11816689/
> > > > > The effort (to get it upstreamed) was paused because of
> > > > > the security issue around that code (XSA-348).
> > > > > ***
> > > > I read this comment as "This series should be applied on top the patch
> > > > X". However, looking at your branch, I can't see the patch. What did I
> > > > miss?
> > > You didn't miss anything. Patch series doesn't contain it. I mentioned
> > > about this patch in order not to forget about it
> > > and draw reviewer's attention. Looks like, the activity (to get it
> > > upstreamed) hasn't been resumed yet and I don't know what we should do
> > > with that dependency
> > > in the context of this series...
> > 
> > I will reply what I wrote on IRC privately :). I think this fine to defer it
> > to after Xen 4.15 because IOREQ will be in tech preview.
> 
> Thank you. I got a request to make a possibility for user to select IOREQ via
> the menuconfig on Arm. Saying tech preview do you mean that I also need to put
> it under CONFIG_EXPERT on Arm?

Normally I would say that unless it actually takes an expert to enable
the feature, it is better to make it depend on CONFIG_UNSUPPORTED [1].

However, in this case, it might actually take an expert :-)
Additional patches are still required to enable the feature at the
toolstack level, and also the user needs to build a userspace ioreq
server. So in this case I am fine either way. I'll leave it up to you
and Julien to pick the best one.

Either way, please add "(EXPERT)" or "(UNSUPPORTED)" in the one-line
kconfig description for ARM if possible.


[1] https://marc.info/?l=xen-devel&m=161168780401884

