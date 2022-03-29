Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937AD4EB18C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 18:12:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295885.503676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZERS-0007ze-Sd; Tue, 29 Mar 2022 16:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295885.503676; Tue, 29 Mar 2022 16:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZERS-0007xp-P2; Tue, 29 Mar 2022 16:11:34 +0000
Received: by outflank-mailman (input) for mailman id 295885;
 Tue, 29 Mar 2022 16:11:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hz1j=UI=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nZERR-0007xj-Hj
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 16:11:33 +0000
Received: from MTA-07-4.privateemail.com (mta-07-4.privateemail.com
 [68.65.122.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4a8d566-af7a-11ec-a405-831a346695d4;
 Tue, 29 Mar 2022 18:11:31 +0200 (CEST)
Received: from mta-07.privateemail.com (localhost [127.0.0.1])
 by mta-07.privateemail.com (Postfix) with ESMTP id 29C4818000B1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Mar 2022 12:11:29 -0400 (EDT)
Received: from mail-oa1-f47.google.com (unknown [10.20.151.171])
 by mta-07.privateemail.com (Postfix) with ESMTPA id 046BD18000AF
 for <xen-devel@lists.xenproject.org>; Tue, 29 Mar 2022 12:11:28 -0400 (EDT)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-dacc470e03so19218983fac.5
 for <xen-devel@lists.xenproject.org>; Tue, 29 Mar 2022 09:11:28 -0700 (PDT)
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
X-Inumbo-ID: e4a8d566-af7a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648570289;
	bh=dAoGSuvjXBvhNJh0Fzkgadj2m08FXuiMaHIpTSVTDt0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MVZ+US9zF1/6mrPCCNt8dkuQHd8kuN7KWVL2bxZ8IFpS/HPsWeNmoM3cLOXIL+BKr
	 KPMvjyHy/R2DlfGCAk1bGmsvB+/BnocZpuM3ZhtDz1aMP/KFtlFjNTue9lnl1YExdt
	 biITmbZy2rjdgH23KqlotHY7uvhbBAvK1zeVFpCNMFYb7O8BPRGqwb7UAv1uKfAN6I
	 7a8NeZEBiPl+0xhnKt/i97NyFRLrEqDP/oCyt53+XQq4JKWg1ajmqrp1wbVcHDYIpH
	 +x8Du0vZW7GE22C6XhG8oOTqVJztiydm7X05FKQyzwFk56bg6tq3I93vry+RrrxHPZ
	 apy622RBXpvcA==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648570289;
	bh=dAoGSuvjXBvhNJh0Fzkgadj2m08FXuiMaHIpTSVTDt0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MVZ+US9zF1/6mrPCCNt8dkuQHd8kuN7KWVL2bxZ8IFpS/HPsWeNmoM3cLOXIL+BKr
	 KPMvjyHy/R2DlfGCAk1bGmsvB+/BnocZpuM3ZhtDz1aMP/KFtlFjNTue9lnl1YExdt
	 biITmbZy2rjdgH23KqlotHY7uvhbBAvK1zeVFpCNMFYb7O8BPRGqwb7UAv1uKfAN6I
	 7a8NeZEBiPl+0xhnKt/i97NyFRLrEqDP/oCyt53+XQq4JKWg1ajmqrp1wbVcHDYIpH
	 +x8Du0vZW7GE22C6XhG8oOTqVJztiydm7X05FKQyzwFk56bg6tq3I93vry+RrrxHPZ
	 apy622RBXpvcA==
X-Gm-Message-State: AOAM532BEpdVdazHs1MJdKi425k9oiiFAHmkcOax7r6p4zEVg+xKHzIN
	9z+esMNPuqaqFyAPWpu7Hm+E7ZEZ6STd5E3y0o0=
X-Google-Smtp-Source: ABdhPJyu3vAaFTQdTs7vV1Y6r4B0zcBb0Z0FZwr4iDznPlh1ygpEKzlk0fh2Ub3dcRNFYIUd+G0S/evWYeFotEohu38=
X-Received: by 2002:a05:6870:ea81:b0:db:3e68:7ae0 with SMTP id
 s1-20020a056870ea8100b000db3e687ae0mr220970oap.9.1648570284366; Tue, 29 Mar
 2022 09:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <ab6bb88e90e5649c60e08a1680b3a2390441031b.1648561546.git.tamas.lengyel@intel.com>
 <04459197-458b-8d10-2692-981495c0e243@suse.com>
In-Reply-To: <04459197-458b-8d10-2692-981495c0e243@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 29 Mar 2022 12:10:48 -0400
X-Gmail-Original-Message-ID: <CABfawhnKL_7iBiOAHLjtKhH6sCDRfrLcNS_kr3YSLr=XdQdUGg@mail.gmail.com>
Message-ID: <CABfawhnKL_7iBiOAHLjtKhH6sCDRfrLcNS_kr3YSLr=XdQdUGg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] x86/mem_sharing: option to enforce fork starting
 with empty p2m
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <JGross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Mar 29, 2022 at 11:42 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 29.03.2022 16:03, Tamas K Lengyel wrote:
> > Add option to the fork memop to enforce a start with an empty p2m.
> > Pre-populating special pages to the fork tend to be necessary only when setting
> > up forks to be fully functional with a toolstack or if the fork makes use of
> > them in some way. For short-lived forks these pages are optional and starting
> > with an empty p2m has advantages both in terms of reset performance as well as
> > easier reasoning about the state of the fork after creation.
>
> I'm afraid I don't consider this enough of an explanation: Why would these
> page be optional? Where does the apriori knowledge come from that the guest
> wouldn't manage to access the vCPU info pages or the APIC access one?

By knowing what code you are fuzzing. The code you are fuzzing is
clearly marked by harnesses and that's the only code you execute while
fuzzing. If you know the code doesn't use them, no need to map them
in. They haven't been needed in any of the fuzzing setups we had so
far so I'm planning to be this the default when fuzzing.

> > --- a/xen/arch/x86/include/asm/hvm/domain.h
> > +++ b/xen/arch/x86/include/asm/hvm/domain.h
> > @@ -31,7 +31,9 @@
> >  #ifdef CONFIG_MEM_SHARING
> >  struct mem_sharing_domain
> >  {
> > -    bool enabled, block_interrupts;
> > +    bool enabled;
> > +    bool block_interrupts;
> > +    bool empty_p2m;
>
> While the name of the field is perhaps fine as is, it would be helpful to
> have a comment here clarifying that this is only about the guest's initial
> and reset state; this specifically does not indicate the p2m has to remain
> empty (aiui).

Sure.

>
> > @@ -1856,7 +1860,13 @@ static int fork(struct domain *cd, struct domain *d)
> >      if ( (rc = bring_up_vcpus(cd, d)) )
> >          goto done;
> >
> > -    rc = copy_settings(cd, d);
> > +    if ( !(rc = copy_settings(cd, d, empty_p2m)) )
> > +    {
> > +        cd->arch.hvm.mem_sharing.block_interrupts = block_interrupts;
> > +
> > +        if ( (cd->arch.hvm.mem_sharing.empty_p2m = empty_p2m) )
>
> Is there a reason you don't do the assignment earlier, thus avoiding the
> need to pass around the extra function argument?

Yes, I prefer only setting these values when the fork is complete, to
avoid having these be dangling in case the fork failed. It's
ultimately not a requirement since if the fork failed we just destroy
the domain that was destined to be the fork from the toolstack. If the
fork failed half-way through all bets are off anyway since we don't do
any "unfork" to roll back the changes that were already applied, so
having these also set early wouldn't make things worse then it already
is. But still, I prefer not adding more things that would need to be
cleaned up if I don't have to.

>
> > --- a/xen/include/public/memory.h
> > +++ b/xen/include/public/memory.h
> > @@ -543,10 +543,10 @@ struct xen_mem_sharing_op {
> >          } debug;
> >          struct mem_sharing_op_fork {      /* OP_FORK */
> >              domid_t parent_domain;        /* IN: parent's domain id */
> > -/* Only makes sense for short-lived forks */
> > +/* These flags only makes sense for short-lived forks */
>
> Nit: s/makes/make/.

Ack.

Tamas

