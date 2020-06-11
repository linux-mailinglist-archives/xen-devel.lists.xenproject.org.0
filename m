Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B7E1F6DA0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 20:51:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjSHL-0004cm-QK; Thu, 11 Jun 2020 18:50:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mIhq=7Y=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jjSHK-0004ch-01
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 18:50:18 +0000
X-Inumbo-ID: 6460bd08-ac14-11ea-b563-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6460bd08-ac14-11ea-b563-12813bfff9fa;
 Thu, 11 Jun 2020 18:50:17 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 712CE206DC;
 Thu, 11 Jun 2020 18:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591901416;
 bh=uDvsfQxTchtiWuXxTrpFglDfyW0ucaFH3zwefEaGOCU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ID9oGR3To+f3esIgWD6KOPOgYomj9Ga1r9j5EN0P1td5ztwGbE3uHM66cFQ+lq/Xs
 6WvKpdW0qTaQVXNixLVCCN3dTiIq7ahBoLN17mJuhc57gp0v3ZZibk+ve47jVyBCYr
 iC9ztC7suIaJLl1kvADTFp/NO3/HrOFBQkBiJlbo=
Date: Thu, 11 Jun 2020 11:50:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall.oss@gmail.com>
Subject: Re: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
In-Reply-To: <CAJ=z9a3u7ztgSmJbhjVATrfJEBBVkHbZei6ydBQeV8nzdDFA3Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2006111143530.2815@sstabellini-ThinkPad-T480s>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2006111055360.2815@sstabellini-ThinkPad-T480s>
 <CAJ=z9a3u7ztgSmJbhjVATrfJEBBVkHbZei6ydBQeV8nzdDFA3Q@mail.gmail.com>
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
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 11 Jun 2020, Julien Grall wrote:
> > > +        return -EINVAL;
> > >      }
> > >
> > > -    __copy_to_guest(runstate_guest(v), &runstate, 1);
> > > +    v->arch.runstate_guest.page = page;
> > > +    v->arch.runstate_guest.offset = offset;
> > > +
> > > +    spin_unlock(&v->arch.runstate_guest.lock);
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +
> > > +/* Update per-VCPU guest runstate shared memory area (if registered). */
> > > +static void update_runstate_area(struct vcpu *v)
> > > +{
> > > +    struct vcpu_runstate_info *guest_runstate;
> > > +    void *p;
> > > +
> > > +    spin_lock(&v->arch.runstate_guest.lock);
> > >
> > > -    if ( guest_handle )
> > > +    if ( v->arch.runstate_guest.page )
> > >      {
> > > -        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> > > +        p = __map_domain_page(v->arch.runstate_guest.page);
> > > +        guest_runstate = p + v->arch.runstate_guest.offset;
> > > +
> > > +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
> > > +        {
> > > +            v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> > > +            guest_runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
> >
> > I think that this write to guest_runstate should use write_atomic or
> > another atomic write operation.
> 
> I thought about suggesting the same, but  guest_copy_* helpers may not
> do a single memory write to state_entry_time.
> What are you trying to prevent with the write_atomic()?

I am thinking that without using an atomic write, it would be (at least
theoretically) possible for a guest to see a partial write to
state_entry_time, which is not good. In theory, the set of assembly
instructions generated by the compiler could go through an intermediate
state that we don't want the guest to see. In practice, I doubt that any
possible combination of assembly instructions generated by the compiler
could lead to something harmful.

