Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD5F3899C8
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 01:26:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130515.244448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljVZY-0003FX-6J; Wed, 19 May 2021 23:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130515.244448; Wed, 19 May 2021 23:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljVZY-0003DJ-3A; Wed, 19 May 2021 23:25:52 +0000
Received: by outflank-mailman (input) for mailman id 130515;
 Wed, 19 May 2021 23:25:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+fN8=KO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ljVZW-0003DD-FH
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 23:25:50 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e94c275-4a81-4b8e-b87b-c313bc3f2397;
 Wed, 19 May 2021 23:25:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE45D611AD;
 Wed, 19 May 2021 23:25:48 +0000 (UTC)
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
X-Inumbo-ID: 0e94c275-4a81-4b8e-b87b-c313bc3f2397
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621466749;
	bh=H4hqy0CIONNcsO7xABco8gJwT2V3piA9EG/FYUE9IWQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=anTIj30D6wsaa1VVWWnarvCF6yL9FeTXQ1NsTM4MTG/7Hpp1zMwkFemXSOk8QcMqB
	 meUcJ/7DwYvMww54pDDSzfcKWOatvdPP3jgT52aS6J3qNHTkEKuNtDgdlS6Ph0gBBd
	 P/Lc+pt75lXySgsdKW80rjhMIVuZMVBmQEFMmp0QKZyKVth4gJfTprQwZnYqdmejFX
	 M3dqkNvOdcNi/xFp1/kq4BF6hkH4bzgZC2hM2KTjyFD/fVbUFwZ4V9P3W0N6Fz6Tbp
	 WVmr0RFka8n1wgUqVEGPoiQK3VEGxLuP63vGvlK1TyJFOuOWBlz70Jl0T+Ne08o7Ck
	 6xLYaTF+6+4tA==
Date: Wed, 19 May 2021 16:25:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org, 
    Roger Pau Monn?? <royger@freebsd.org>, Mitchell Horne <mhorne@freebsd.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Uses of /hypervisor memory range (was: FreeBSD/Xen/ARM issues)
In-Reply-To: <f7360dac-5d83-733b-7ec5-c73d4dc0350d@xen.org>
Message-ID: <alpine.DEB.2.21.2105191611540.14426@sstabellini-ThinkPad-T480s>
References: <YIptpndhk6MOJFod@Air-de-Roger> <YItwHirnih6iUtRS@mattapan.m5p.com> <YIu80FNQHKS3+jVN@Air-de-Roger> <YJDcDjjgCsQUdsZ7@mattapan.m5p.com> <YJURGaqAVBSYnMRf@Air-de-Roger> <YJYem5CW/97k/e5A@mattapan.m5p.com> <YJs/YAgB8molh7e5@mattapan.m5p.com>
 <54427968-9b13-36e6-0001-27fb49f85635@xen.org> <YJ3jlGSxs60Io+dp@mattapan.m5p.com> <93936406-574f-7fd0-53bf-3bafaa4b1947@xen.org> <YJ8hTE/JbJygtVAL@mattapan.m5p.com> <f7360dac-5d83-733b-7ec5-c73d4dc0350d@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 15 May 2021, Julien Grall wrote:
> (+ Andrew, + Stefano)
> 
> On 15/05/2021 02:18, Elliott Mitchell wrote:
> > On Fri, May 14, 2021 at 09:32:10AM +0100, Julien Grall wrote:
> > > On 14/05/2021 03:42, Elliott Mitchell wrote:
> > > > 
> > > > Issue is what is the intended use of the memory range allocated to
> > > > /hypervisor in the device-tree on ARM?  What do the Xen developers plan
> > > > for?  What is expected?
> > > 
> > >   From docs/misc/arm/device-tree/guest.txt:
> > > 
> > > "
> > > - reg: specifies the base physical address and size of a region in
> > >     memory where the grant table should be mapped to, using an
> > >     HYPERVISOR_memory_op hypercall. The memory region is large enough to
> > > map
> > >     the whole grant table (it is larger or equal to
> > > gnttab_max_grant_frames()).
> > >     This property is unnecessary when booting Dom0 using ACPI.
> > > "
> > > 
> > > Effectively, this is a known space in memory that is unallocated. Not
> > > all the guests will use it if they have a better way to find unallocated
> > > space.
> > 
> > The use of "should" is generally considered strong encouragement to do
> > so.  A warning $something is lurking here and you may regret it if you
> > recklessly disobey this without knowning what is going on behind the
> > scenes.
> 
> I thought a bit more over night. The potential trouble I can think of for a
> domU is the magic pages are not described in the DT.
> 
> I think every other regions should be discoverable from the DT (at least for a
> domU).
> 
> > Whereas your language here suggests "can" is a better word since it is
> > simply a random unused address range.
> > 
> > 
> > > > Was the /hypervisor range intended *strictly* for mapping grant-tables?
> > > 
> > > It was introduced to tell the OS a place where the grant-table could be
> > > conveniently mapped.
> > 
> > Yet this is strange.  If any $random unused address range is acceptable,
> > why bother suggesting a particular one?  If this is really purely the
> > OS's choice, why is Xen bothering to suggest a range at all?
> 
> I have added Stefano who may have more historical context than what I wrote in
> my previous e-mail.

At the time when the binding was introduced, there was a long history of
issues in finding a "safe" place where to map the grant table. Consider
that on x86 not all "empty" regions are really empty, there can be
hidden MMIO regions and with PV guests there is not even a stage2
address translation to protect you.

To stay on the safe side, we wanted to have a way to provide a range
known to be safe so that Linux wouldn't have to worry about it.


> > > > Was it intended for /hypervisor to grow over the
> > > > years as hardware got cheaper?
> > > I don't understand this question.
> > 
> > Going to the trouble of suggesting a range points to something going on.
> > I'm looking for an explanation since strange choices might hint at
> > something unpleasant lurking below and I should watch where I step.
> > 
> > 
> > > > Might it be better to deprecate the /hypervisor range and have domains
> > > > allocate any available address space for foreign mappings?
> > > 
> > > It may be easy for FreeBSD to find available address space but so far
> > > this has not been the case in Linux (I haven't checked the latest
> > > version though).
> > > 
> > > To be clear, an OS is free to not use the range provided in /hypervisor
> > > (maybe this is not clear enough in the spec?). This was mostly
> > > introduced to overcome some issues we saw in Linux when Xen on Arm was
> > > introduced.
> > 
> > Mind if I paraphrase this?
> > 
> > "this is a bring-up hack for Linux which hangs around since we haven't
> > felt any pressure to fix the underlying Linux issue"
> > 
> > Is that reasonable?
> 
> Yes. I have revisited the problem a few times and every time I got stuck
> because not all the I/O regions where reported to Linux. So Linux would not be
> able to find a safe unallocated space.

Exactly!



> > > > Should the FreeBSD implementation be treating grant tables as distinct
> > > > from other foreign mappings?
> > > 
> > > Both require unallocated addres space to work. IIRC FreeBSD is able to
> > > find unallocated space easily, so I would recommend to use it.
> > 
> > That is supposed to be, but it appears there is presently a bug which has
> > broken the functionality on ARM.  
> 
> Do you mind share some details?
> 
> > As such, as a proper lazy developer if
> > I can abuse the /hypervisor address range for all foreign mappings, I
> > will.
> 
> Are you aiming to support dom0 now?

I guess it is not quite an abuse. This was meant to be a safe address
range to do special mappings, primarily for the grant table. Maybe it
could be used for other things too.

I would be open to the idea of extending the device tree description to
say that it can be used for other mappings as well.



> > My feeling is one of two things should happen with the /hypervisor
> > address range:
> > 
> > 1>  OSes could be encouraged to use it for all foreign mappings.  The
> > range should be dynamic in some fashion.  There could be a handy way to
> > allow configuring the amount of address space thus reserved.
> 
> In the context of XSA-300 and virtio on Xen on Arm, we discussed about
> providing a revion for foreign mapping. The main trouble here is figuring out
> of the size, if you mess it up then you may break all the PV drivers.
> 
> If the problem is finding space, then I would like to suggest a different
> approach (I think I may have discussed it with Andrew). Xen is in maintaining
> the P2M for the guest and therefore now where are the unallocated space. How
> about introducing a new hypercall to ask for "unallocated space"?
> 
> This would not work for older hypervisor but you could use the RAM instead (as
> Linux does). This is has drawbacks (e.g. shattering superpage, reducing the
> amount of memory usuable...), but for 1> you would also need a hack for older
> Xen.

I am starting to wonder if it would make sense to add a new device tree
binding to describe larger free region for foreign mapping rather then a
hypercall. It could be several GBs or even TBs in size. I like the idea
of having it device tree because after all this is static information.
I can see that a hypercall would also work and I am open to it but if
possible I think it would be better not to extend the hypercall
interface when there is a good alternative.


> > 2>  The range should be declared deprecated.  Everyone should be put on
> > the same page that this was a quick hack for bringing up Xen/ARM/Linux,
> > and really it shouldn't have escaped.
> 
> How about relaxing the wording instead?

Yes, I agree!


