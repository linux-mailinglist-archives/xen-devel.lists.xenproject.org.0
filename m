Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF1D2D3835
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 02:20:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47936.84800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmo8e-0002rQ-R5; Wed, 09 Dec 2020 01:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47936.84800; Wed, 09 Dec 2020 01:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmo8e-0002r1-Nm; Wed, 09 Dec 2020 01:19:28 +0000
Received: by outflank-mailman (input) for mailman id 47936;
 Wed, 09 Dec 2020 01:19:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kmo8d-0002qw-3L
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 01:19:27 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5fed6afa-7833-4ba8-855b-fa9b03d22efb;
 Wed, 09 Dec 2020 01:19:26 +0000 (UTC)
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
X-Inumbo-ID: 5fed6afa-7833-4ba8-855b-fa9b03d22efb
Date: Tue, 8 Dec 2020 17:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607476765;
	bh=Fjihoz9+YwDs0vShIH14xIbJJ1ip4q0T1Wec3Amls/g=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=MMCiQYExvgYS56RTBarL4bL5hXSO2mhEuCSnaw/DILTtzS2pyn6vVlALgEqnxvL9z
	 +QqKCgXoJDqvnNOIUzKu39IgztyTGY5cU0b4rhu6nIJZJAtNsvP+Pn8TatpQynC9mD
	 7WiEWDqKaR0b+CFglPuTR8nuhkukVkeDUKMpfmdojEo1WxQAkrswpdGk7sWWwenGA7
	 X4nPhvsvG0kUAcuJK/qKCcmpjDD+qUbdHmEP1FQXCvYCAmhLxQCMvyPCAcAORU3n/M
	 DwqURWZagRlSGKp/whmhg8/porJsxpLDRJ1JkANvqSlrPaDdLlAj/A5X09NSKyNtju
	 mS2omuXzq7zWQ==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Rahul Singh <Rahul.Singh@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Paul Durrant <paul@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 8/8] xen/arm: Add support for SMMUv3 driver
In-Reply-To: <156ab0f5-e46d-6b96-7ff1-28ad3a748950@xen.org>
Message-ID: <alpine.DEB.2.21.2012081711200.20986@sstabellini-ThinkPad-T480s>
References: <cover.1606406359.git.rahul.singh@arm.com> <de2101687020d18172a2b153f8977a5116d0cd66.1606406359.git.rahul.singh@arm.com> <a67bb114-a4a9-651a-338b-123b350ac4b3@xen.org> <9C890E87-D438-4232-8647-8EC64FF32C42@arm.com> <bb6a710e-4a7a-5db2-fece-b5845e06d092@xen.org>
 <9F9A955B-815C-4771-9EC0-073E9CF3E995@arm.com> <156ab0f5-e46d-6b96-7ff1-28ad3a748950@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Dec 2020, Julien Grall wrote:
> On 07/12/2020 18:42, Rahul Singh wrote:
> > > On 7 Dec 2020, at 5:39 pm, Julien Grall <julien@xen.org> wrote:
> > > On 07/12/2020 12:12, Rahul Singh wrote:
> > > > > > +typedef paddr_t dma_addr_t;
> > > > > > +typedef unsigned int gfp_t;
> > > > > > +
> > > > > > +#define platform_device device
> > > > > > +
> > > > > > +#define GFP_KERNEL 0
> > > > > > +
> > > > > > +/* Alias to Xen device tree helpers */
> > > > > > +#define device_node dt_device_node
> > > > > > +#define of_phandle_args dt_phandle_args
> > > > > > +#define of_device_id dt_device_match
> > > > > > +#define of_match_node dt_match_node
> > > > > > +#define of_property_read_u32(np, pname, out)
> > > > > > (!dt_property_read_u32(np, pname, out))
> > > > > > +#define of_property_read_bool dt_property_read_bool
> > > > > > +#define of_parse_phandle_with_args dt_parse_phandle_with_args
> > > > > > +
> > > > > > +/* Alias to Xen lock functions */
> > > > > > +#define mutex spinlock
> > > > > > +#define mutex_init spin_lock_init
> > > > > > +#define mutex_lock spin_lock
> > > > > > +#define mutex_unlock spin_unlock
> > > > > 
> > > > > Hmm... mutex are not spinlock. Can you explain why this is fine to
> > > > > switch to spinlock?
> > > > Yes mutex are not spinlock. As mutex is not implemented in XEN I thought
> > > > of using spinlock in place of mutex as this is the only locking
> > > > mechanism available in XEN.
> > > > Let me know if there is another blocking lock available in XEN. I will
> > > > check if we can use that.
> > > 
> > > There are no blocking lock available in Xen so far. However, if Linux were
> > > using mutex instead of spinlock, then it likely means they operations in
> > > the critical section can be long running.
> > 
> > Yes you are right Linux is using mutex when attaching a device to the SMMU
> > as this operation might take longer time.
> > > 
> > > How did you came to the conclusion that using spinlock in the SMMU driver
> > > would be fine?
> > 
> > Mutex is replaced by spinlock  in the SMMU driver when there is a request to
> > assign a device to the guest. As we are in user context at that time its ok
> > to use spinlock.
> 
> I am not sure to understand what you mean by "user context" here. Can you
> clarify it?
> 
> > As per my understanding there is one scenario when CPU will spin when there
> > is a request from the user at the same time to assign another device to the
> > SMMU and I think that is very rare.
> 
> What "user" are you referring to?
> 
> > 
> > Please suggest how we can proceed on this.
> 
> I am guessing that what you are saying is the request to assign/de-assign
> device will be issued by the toolstack and therefore they should be trusted.
> 
> My concern here is not about someone waiting on the lock to be released. It is
> more the fact that using a mutex() is an insight that the operation protected
> can be long. Depending on the length, this may result to unwanted side effect
> (e.g. other vCPU not scheduled, RCU stall in dom0, watchdog hit...).
> 
> I recall a discussion from a couple of years ago mentioning that STE
> programming operations can take quite a long time. So I would like to
> understand how long the operation is meant to last.
> 
> For a tech preview, this is probably OK to replace the mutex with an spinlock.
> But I would not want this to go past the tech preview stage without a proper
> analysis.
> 
> Stefano, what do you think?

In short, I agree.


We need to be very careful replacing mutexes with spinlocks. We need to
look closely at the ways the spinlocks could introduce unwanted
latencies. Concurrent assign_device operations are possible but rare
and, more importantly, they are user-driven so they could be mitigated.
I am more worried about other possible scenarios, e.g. STE or other
operations.

Rahul clearly put a lot of work into this series already and I think it
is better to take this incrementally, which will allow us to do better
testing and also move faster overall. So I am fine to take the series as
is now, pending an investigation on the spinlocks later.

