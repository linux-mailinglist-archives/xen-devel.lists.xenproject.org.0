Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3244F1F7198
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 03:10:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjYCB-0003zY-IB; Fri, 12 Jun 2020 01:09:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wpuV=7Z=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jjYCA-0003zT-I7
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 01:09:22 +0000
X-Inumbo-ID: 592958c0-ac49-11ea-8496-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 592958c0-ac49-11ea-8496-bc764e2007e4;
 Fri, 12 Jun 2020 01:09:22 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF12120878;
 Fri, 12 Jun 2020 01:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591924161;
 bh=ZFPRQ8xNw0/VOBd25JGbtR6KBrp91C0nmDUDG2Ufln4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=1v0f8GACW0fvlQwzdzKM1qEDRDklbwON9JH1pl1FMM6mEpMZB32sxKeknRBQ0ySYX
 f9HuYKjg8tShpXU/Zi7ped0Oj41v7mqOYX0xj2u0JWSTgLDuX1GOs0rCyOANi/hHfd
 SmqYeT6E/3NyGciATEFtoXXtH7ENHjxJGJJ2s8Qw=
Date: Thu, 11 Jun 2020 18:09:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
In-Reply-To: <74475748-e884-1e6e-633d-bf67d5ed32fe@xen.org>
Message-ID: <alpine.DEB.2.21.2006111250180.2815@sstabellini-ThinkPad-T480s>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2006111055360.2815@sstabellini-ThinkPad-T480s>
 <CAJ=z9a3u7ztgSmJbhjVATrfJEBBVkHbZei6ydBQeV8nzdDFA3Q@mail.gmail.com>
 <alpine.DEB.2.21.2006111143530.2815@sstabellini-ThinkPad-T480s>
 <74475748-e884-1e6e-633d-bf67d5ed32fe@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 11 Jun 2020, Julien Grall wrote:
> Hi Stefano,
> 
> On 11/06/2020 19:50, Stefano Stabellini wrote:
> > On Thu, 11 Jun 2020, Julien Grall wrote:
> > > > > +        return -EINVAL;
> > > > >       }
> > > > > 
> > > > > -    __copy_to_guest(runstate_guest(v), &runstate, 1);
> > > > > +    v->arch.runstate_guest.page = page;
> > > > > +    v->arch.runstate_guest.offset = offset;
> > > > > +
> > > > > +    spin_unlock(&v->arch.runstate_guest.lock);
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +
> > > > > +/* Update per-VCPU guest runstate shared memory area (if registered).
> > > > > */
> > > > > +static void update_runstate_area(struct vcpu *v)
> > > > > +{
> > > > > +    struct vcpu_runstate_info *guest_runstate;
> > > > > +    void *p;
> > > > > +
> > > > > +    spin_lock(&v->arch.runstate_guest.lock);
> > > > > 
> > > > > -    if ( guest_handle )
> > > > > +    if ( v->arch.runstate_guest.page )
> > > > >       {
> > > > > -        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> > > > > +        p = __map_domain_page(v->arch.runstate_guest.page);
> > > > > +        guest_runstate = p + v->arch.runstate_guest.offset;
> > > > > +
> > > > > +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
> > > > > +        {
> > > > > +            v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> > > > > +            guest_runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
> > > > 
> > > > I think that this write to guest_runstate should use write_atomic or
> > > > another atomic write operation.
> > > 
> > > I thought about suggesting the same, but  guest_copy_* helpers may not
> > > do a single memory write to state_entry_time.
> > > What are you trying to prevent with the write_atomic()?
> > 
> > I am thinking that without using an atomic write, it would be (at least
> > theoretically) possible for a guest to see a partial write to
> > state_entry_time, which is not good. 
> 
> It is already the case with existing implementation as Xen may write byte by
> byte. So are you suggesting the existing code is also buggy?

Writing byte by byte is a different case. That is OK. In that case, the
guest could see the state after 3 bytes written and it would be fine and
consistent. If this hadn't been the case, then yes, the existing code
would also be buggy.

So if we did the write with a memcpy, it would be fine, no need for
atomics:

  memcpy(&guest_runstate->state_entry_time,
         &v->runstate.state_entry_time,
         XXX);


The |= case is different: GCC could implement it in any way it likes,
including going through a zero-write to any of the bytes in the word, or
doing an addition then a subtraction. GCC doesn't make any guarantees.
If we want guarantees we need to use atomics.

