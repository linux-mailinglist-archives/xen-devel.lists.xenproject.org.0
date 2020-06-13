Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F671F7FE7
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2020 02:25:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjtyJ-0000LV-Qj; Sat, 13 Jun 2020 00:24:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5F9=72=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jjtyI-0000LQ-H1
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2020 00:24:30 +0000
X-Inumbo-ID: 3f0e6386-ad0c-11ea-b62a-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f0e6386-ad0c-11ea-b62a-12813bfff9fa;
 Sat, 13 Jun 2020 00:24:30 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1265220739;
 Sat, 13 Jun 2020 00:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592007869;
 bh=hhAXpZ9T/WtwESP/EZN2wTcknQmo1c2sAeZm+M29/gI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=GVUruxbBC8ODbFP2uQ33+k4D0fUwsvJwHfChTLs92dBToyemjrSdxZknhYax0lLcW
 gbPzzqtWJEwWNMiXd6JiNa9EDtBex+lbcu3BAWOn9kklkrLYIvrwx791mk7ugLJ61G
 +iv5Dk+FcdwJZllilXbL0IGTBD0WmtdeEK3ahJUo=
Date: Fri, 12 Jun 2020 17:24:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
In-Reply-To: <48F66B8F-3AEF-4E54-A572-C246F5A7C117@arm.com>
Message-ID: <alpine.DEB.2.21.2006120944460.2815@sstabellini-ThinkPad-T480s>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2006111055360.2815@sstabellini-ThinkPad-T480s>
 <CAJ=z9a3u7ztgSmJbhjVATrfJEBBVkHbZei6ydBQeV8nzdDFA3Q@mail.gmail.com>
 <alpine.DEB.2.21.2006111143530.2815@sstabellini-ThinkPad-T480s>
 <74475748-e884-1e6e-633d-bf67d5ed32fe@xen.org>
 <alpine.DEB.2.21.2006111250180.2815@sstabellini-ThinkPad-T480s>
 <48F66B8F-3AEF-4E54-A572-C246F5A7C117@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-993750421-1591980292=:2815"
Content-ID: <alpine.DEB.2.21.2006120945070.2815@sstabellini-ThinkPad-T480s>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-993750421-1591980292=:2815
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2006120945071.2815@sstabellini-ThinkPad-T480s>

On Fri, 12 Jun 2020, Bertrand Marquis wrote:
> > On 12 Jun 2020, at 02:09, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Thu, 11 Jun 2020, Julien Grall wrote:
> >> Hi Stefano,
> >> 
> >> On 11/06/2020 19:50, Stefano Stabellini wrote:
> >>> On Thu, 11 Jun 2020, Julien Grall wrote:
> >>>>>> +        return -EINVAL;
> >>>>>>      }
> >>>>>> 
> >>>>>> -    __copy_to_guest(runstate_guest(v), &runstate, 1);
> >>>>>> +    v->arch.runstate_guest.page = page;
> >>>>>> +    v->arch.runstate_guest.offset = offset;
> >>>>>> +
> >>>>>> +    spin_unlock(&v->arch.runstate_guest.lock);
> >>>>>> +
> >>>>>> +    return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>> +
> >>>>>> +/* Update per-VCPU guest runstate shared memory area (if registered).
> >>>>>> */
> >>>>>> +static void update_runstate_area(struct vcpu *v)
> >>>>>> +{
> >>>>>> +    struct vcpu_runstate_info *guest_runstate;
> >>>>>> +    void *p;
> >>>>>> +
> >>>>>> +    spin_lock(&v->arch.runstate_guest.lock);
> >>>>>> 
> >>>>>> -    if ( guest_handle )
> >>>>>> +    if ( v->arch.runstate_guest.page )
> >>>>>>      {
> >>>>>> -        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> >>>>>> +        p = __map_domain_page(v->arch.runstate_guest.page);
> >>>>>> +        guest_runstate = p + v->arch.runstate_guest.offset;
> >>>>>> +
> >>>>>> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
> >>>>>> +        {
> >>>>>> +            v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> >>>>>> +            guest_runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
> >>>>> 
> >>>>> I think that this write to guest_runstate should use write_atomic or
> >>>>> another atomic write operation.
> >>>> 
> >>>> I thought about suggesting the same, but  guest_copy_* helpers may not
> >>>> do a single memory write to state_entry_time.
> >>>> What are you trying to prevent with the write_atomic()?
> >>> 
> >>> I am thinking that without using an atomic write, it would be (at least
> >>> theoretically) possible for a guest to see a partial write to
> >>> state_entry_time, which is not good. 
> >> 
> >> It is already the case with existing implementation as Xen may write byte by
> >> byte. So are you suggesting the existing code is also buggy?
> > 
> > Writing byte by byte is a different case. That is OK. In that case, the
> > guest could see the state after 3 bytes written and it would be fine and
> > consistent. If this hadn't been the case, then yes, the existing code
> > would also be buggy.
> > 
> > So if we did the write with a memcpy, it would be fine, no need for
> > atomics:
> > 
> >  memcpy(&guest_runstate->state_entry_time,
> >         &v->runstate.state_entry_time,
> >         XXX);
> > 
> > 
> > The |= case is different: GCC could implement it in any way it likes,
> > including going through a zero-write to any of the bytes in the word, or
> > doing an addition then a subtraction. GCC doesn't make any guarantees.
> > If we want guarantees we need to use atomics.
> 
> Wouldn’t that require all accesses to state_entry_time to use also atomic operations ?
> In this case we could not propagate the changes to a guest without changing the interface itself.
> 
> As the copy time needs to be protected, the write barriers are there to make sure that during the copy the bit is set and that when we unset it, the copy is done.
> I added for this purpose a barrier after the memcpy to make sure that when/if we unset the bit the copy has already been done.

As you say, we have a flag to mark a transitiong period, the flag is
XEN_RUNSTATE_UPDATE. So, I think it is OK if we don't use atomics during
the transitioning period. But we need to make sure to use atomics for the
update of the XEN_RUNSTATE_UPDATE flag itself.

Does it make sense? Or maybe I misunderstood some of the things you
wrote?
--8323329-993750421-1591980292=:2815--

