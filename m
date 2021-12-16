Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47247477DC7
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 21:44:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248223.428180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxxb3-0003c6-1D; Thu, 16 Dec 2021 20:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248223.428180; Thu, 16 Dec 2021 20:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxxb2-0003aL-Ts; Thu, 16 Dec 2021 20:43:24 +0000
Received: by outflank-mailman (input) for mailman id 248223;
 Thu, 16 Dec 2021 20:43:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyNJ=RB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mxxb1-0003aF-8l
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 20:43:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce15fc83-5eb0-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 21:43:21 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2769761F01;
 Thu, 16 Dec 2021 20:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02EA7C36AE2;
 Thu, 16 Dec 2021 20:43:18 +0000 (UTC)
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
X-Inumbo-ID: ce15fc83-5eb0-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639687399;
	bh=wswyCZLNWyM9Qop/hW0Z+bnxMrXenkcm3O3d0sXA/u8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aJgSfgnJYUGx+ua/YmngOMLexKa34GLcrwUhHelQHuJAKIq+vxoxQy6fUU3NSm+DT
	 GBWsrl8oRw7Kr+4wc3lX0zp7nDMXFiykoj9YaIAKgJGMpUziizVpkuyjhqb4wYiP5K
	 t3htL04eALCTpkHmIzv3yPj/GHW6QLH/OFvyAI8dmxJawDkXR5GChy1PRe0+kDAAUk
	 shA9ek74omvRVGTW5a/mkBPmqxKt3T2X+KL0Ee0epBDzAajvG1owytW+JiMhP1QVGc
	 Zgzih0GfvPH2Z7TnoSxm/mNRoFm1847YMIkRfY7gAkHLh39nuhp/MKdj6agI+vxHSG
	 LID7naSZTLAGw==
Date: Thu, 16 Dec 2021 12:43:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
In-Reply-To: <c650062f-948e-569d-d4fa-e5333867854e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2112161232310.3376@ubuntu-linux-20-04-desktop>
References: <20211208155606.20029-1-jgross@suse.com> <20211208155606.20029-3-jgross@suse.com> <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org> <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com> <alpine.DEB.2.22.394.2112151757410.3376@ubuntu-linux-20-04-desktop>
 <c650062f-948e-569d-d4fa-e5333867854e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Dec 2021, Juergen Gross wrote:
> On 16.12.21 03:10, Stefano Stabellini wrote:
> > On Wed, 15 Dec 2021, Juergen Gross wrote:
> > > On 14.12.21 18:36, Julien Grall wrote:
> > > > Hi,
> > > > 
> > > > On 08/12/2021 15:55, Juergen Gross wrote:
> > > > > Today most hypercall handlers have a return type of long, while the
> > > > > compat ones return an int. There are a few exceptions from that rule,
> > > > > however.
> > > > 
> > > > So on Arm64, I don't think you can make use of the full 64-bit because a
> > > > 32-bit domain would not be able to see the top 32-bit.
> > > > 
> > > > In fact, this could potentially cause us some trouble (see [1]) in Xen.
> > > > So it feels like the hypercalls should always return a 32-bit signed
> > > > value
> > > > on Arm.
> > > 
> > > This would break hypercalls like XENMEM_maximum_ram_page which are able
> > > to return larger values, right?
> > > 
> > > > The other advantage is it would be clear that the top 32-bit are not
> > > > usuable. Stefano, what do you think?
> > > 
> > > Wouldn't it make more sense to check the return value to be a sign
> > > extended 32-bit value for 32-bit guests in do_trap_hypercall() instead?
> > > 
> > > The question is what to return if this is not the case. -EDOM?
> > 
> > 
> > I can see where Julien is coming from: we have been trying to keep the
> > arm32 and arm64 ABIs identical since the beginning of the project. So,
> > like Julien, my preference would be to always return 32-bit on ARM, both
> > aarch32 and aarch64. It would make things simple.
> > 
> > The case of XENMEM_maximum_ram_page is interesting but it is not a
> > problem in reality because the max physical address size is only 40-bit
> > for aarch32 guests, so 32-bit are always enough to return the highest
> > page in memory for 32-bit guests.
> 
> You are aware that this isn't the guest's max page, but the host's?
> 
> And all of this is about a 32-bit guest on a 64-bit host.

Yes, I am following, and it is always difficult to get the right
information out of the ARM Reference Manual, but from my search
ARMv8/aarch32 (which is 32-bit mode on 64-bit capable hardware) supports
max 40 bits.

From G5.1.3 (ARM DDI 0487G.a):

---
For execution in AArch32 state, the Armv8 architecture supports:

- A VA space of up to 32 bits. The actual width is IMPLEMENTATION DEFINED .

- An IPA space of up to 40 bits. The translation tables and associated System registers define the width of the
implemented address space.
---

Julien, Bertrand, am I reading this right?

