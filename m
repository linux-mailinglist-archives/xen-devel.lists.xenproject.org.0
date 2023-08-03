Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1480176F3F7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 22:20:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576597.902909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRenc-0002uG-5Z; Thu, 03 Aug 2023 20:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576597.902909; Thu, 03 Aug 2023 20:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRenc-0002rW-2t; Thu, 03 Aug 2023 20:19:56 +0000
Received: by outflank-mailman (input) for mailman id 576597;
 Thu, 03 Aug 2023 20:19:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVX3=DU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRena-0002rQ-T2
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 20:19:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a017a79-323b-11ee-b269-6b7b168915f2;
 Thu, 03 Aug 2023 22:19:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3EB2E61DC5;
 Thu,  3 Aug 2023 20:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F36C433C9;
 Thu,  3 Aug 2023 20:19:49 +0000 (UTC)
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
X-Inumbo-ID: 1a017a79-323b-11ee-b269-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691093990;
	bh=EBRDH3RTt6p1VCNkOrlD14ML+NHZpUaq1EDCelSZ6X4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tlJESTrA9Tzt/Edm6O21eU71ELqESLx6dY9aq+AK6+ZR4OQsC88mXFRnE/TYRnvQW
	 FOtyGx/NFQGal+vy54p5gsozvJF7oCIVs+3+MzQOrlTew2A4BYN9Dax0TkvhMNJuSb
	 198NO01n5SKCPD11223fkUPoTKL1gw8ghKsCXnNhHSmSqtCbKXVomsvh04wkigJmKJ
	 zYSoAyPBbHxK90DEk9abicLx2IIdL4qT27yTlICuz8Qz7PC+/32OIhWH+tkij/4uKz
	 w1xnDqhVyh2owvJS+LuAMuPNVqrUlqdakdEZjOJSyHvEqzsBdre0EL1W4z8XIQ2zrn
	 FMqkauTrCjPIA==
Date: Thu, 3 Aug 2023 13:19:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [RFC 2/6] roles: provide abstraction for the possible domain
 roles
In-Reply-To: <c747c66c-a08d-ce0c-5d1c-25b594ac5f5e@apertussolutions.com>
Message-ID: <alpine.DEB.2.22.394.2308031247430.2127516@ubuntu-linux-20-04-desktop>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com> <20230801202006.20322-3-dpsmith@apertussolutions.com> <alpine.DEB.2.22.394.2308011726170.2127516@ubuntu-linux-20-04-desktop> <c747c66c-a08d-ce0c-5d1c-25b594ac5f5e@apertussolutions.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Aug 2023, Daniel P. Smith wrote:
> On 8/1/23 20:54, Stefano Stabellini wrote:
> > On Tue, 1 Aug 2023, Daniel P. Smith wrote:
> > > The existing concepts such as unbounded domain, ie. all powerful, control
> > > domain and hardware domain are, effectively, roles the domains provide for
> > > the
> > > system. Currently, these are represented with booleans within `struct
> > > domain`
> > > or global domid variables that are compared against. This patch begins to
> > > formalize these roles by replacing the `is_control` and `is_console`,
> > > along
> > > with expanding the check against the global `hardware_domain` with a
> > > single
> > > encapsulating role attribute in `struct domain`.
> > > 
> > > Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> > 
> > This is definitely heading in the right direction
> 
> Thank you, it is good to know there is some agreement here.
> 
> > > ---
> > >   xen/arch/arm/domain_build.c |  2 ++
> > >   xen/arch/x86/setup.c        |  2 ++
> > >   xen/common/domain.c         | 14 +++++++++++++-
> > >   xen/include/xen/sched.h     | 16 +++++++++-------
> > >   xen/include/xsm/dummy.h     |  4 ++--
> > >   xen/xsm/flask/hooks.c       | 12 ++++++------
> > >   6 files changed, 34 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > > index 39b4ee03a5..51b4daefe1 100644
> > > --- a/xen/arch/arm/domain_build.c
> > > +++ b/xen/arch/arm/domain_build.c
> > > @@ -4201,6 +4201,8 @@ void __init create_dom0(void)
> > >       if ( IS_ERR(dom0) )
> > >           panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
> > >   +    dom0->role |= ROLE_UNBOUNDED_DOMAIN;
> > 
> > I am not a fan of "UNBOUNDED". Maybe "PRIMARY"? "PRIVILEGED"? "SUPER"?
> > "ROOT"?
> > 
> > I also recognize I am not good at naming things so I'll stop here and
> > let other provide better feedback :-)
> 
> In first version of hyperlaunch and in the early roles work, I was working to
> move toward eliminating this concept entirely. The reality is this is a model
> that has existed for over 20 years and there are those who accept and embrace
> the model. Introducing the name UNBOUNDED was to at least break the idea that
> the all powerful domain necessarily is the first/initial domain to run. With
> hyperlaunch, there are still security-based scenarios where you might want to
> run a DomB before starting an all privileged domain. I spent quite some time,
> probably more than I should have, to find a good name that expresses what this
> role is. Considering a comment below and a comment by Jan, I am starting to
> think a better way to view it is a domain that assumes all roles in the
> system. So your suggestions of SUPER or ROOT might be more fitting. I
> considered ROLE_ALL, but something about it doesn't sit right with me. With
> that said I welcome the yak shaving of naming to begin. ( ^_^)
> 
> > Also, do we actually need unbounded given that it gets replaced with
> > control_domain pretty soon?
> 
> Yes, because as mentioned above, this is meant to express a domain that has
> been assigned all roles, for which later the domain may decided to delegate
> the role to another domain.
> 
> > I am asking because I think that at least from a safety perspective it
> > would be a problem to run a domain as "unbounded". In a safety system,
> > we wouldn't want anything to be unbounded, not even temporarily at boot.
> > If "unbounded" is removed before running dom0, then of course it is no
> > problem because actually dom0 never gets to run with "unbounded" set.
> 
> I think this is were the name UNBOUNDED may have been a bad choice. The
> UNBOUNDED role is dom0. It is the control domain, the hardware domain, the
> Xenstore domain, and the crash domain (if that were to be solidified).
> 
> > (I am currently thinking of solving the privilege issue by using XSM and
> > removing most privileges from Dom0.)
> 
> I obviously would be a huge advocate of that approach. ( ^_^)

Thanks for the history, that helps. I was asking because I would like to
make sure that all the options below are possible and easy to achieve:

1) traditional dom0 + some traditional domUs booted in a dom0less fashion
2) only traditional domUs booted in a dom0less fashion (no dom0 at all)
3) not-godlike-but-still-super dom0 + some traditional domUs booted in a dom0less fashion
4) domB booting

This ROLE_ALL domain would be dom0 in 1) and would be domB in 4).
In 2), there is no dom0 so there should also be no ROLE_ALL domain. All
good so far.


In 3), it looked to me that we would be creating a ROLE_ALL domain, then
taking away some of the ROLEs. It doesn't sound right? Let's say that we
want to have a hardware_domain (in the sense of default recipient of
hardware, not necessarily privileged) with dm_ops access, but no domctl
access. How would you go about it?

Would it be required to go through the ROLE_ALL stage? How does it
compare to the way it would work today without this patch applied?
Today, does XSM kick in after is_privileged is set, effectively being
the same thing as XSM kicking in later and removing some ROLEs after
ROLE_ALL is already set? So, basically nothing is changing?



> > >       if ( alloc_dom0_vcpu0(dom0) == NULL )
> > >           panic("Error creating domain 0 vcpu0\n");
> > >   diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > > index 2dbe9857aa..4e20edc3bf 100644
> > > --- a/xen/arch/x86/setup.c
> > > +++ b/xen/arch/x86/setup.c
> > > @@ -905,6 +905,8 @@ static struct domain *__init create_dom0(const
> > > module_t *image,
> > >       if ( IS_ERR(d) )
> > >           panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
> > >   +    d->role |= ROLE_UNBOUNDED_DOMAIN;
> > > +
> > >       init_dom0_cpuid_policy(d);
> > >         if ( alloc_dom0_vcpu0(d) == NULL )
> > > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > > index 8fb3c052f5..0ff1d52e3d 100644
> > > --- a/xen/common/domain.c
> > > +++ b/xen/common/domain.c
> > > @@ -340,6 +340,14 @@ static int late_hwdom_init(struct domain *d)
> > >       setup_io_bitmap(dom0);
> > >   #endif
> > >   +    /*
> > > +     * "dom0" may have been created under the unbounded role, demote it
> > > from
> > > +     * that role, reducing it to the control domain role and any other
> > > roles it
> > > +     * may have been given.
> > > +     */
> > > +    dom0->role &= ~(ROLE_UNBOUNDED_DOMAIN & ROLE_HARDWARE_DOMAIN);
> > > +    dom0->role |= ROLE_CONTROL_DOMAIN;
> > 
> > I think we need a better definition of the three roles to understand
> > what this mean.
> 
> Definition and as highlighted, a better name.
> 
> > >       rcu_unlock_domain(dom0);
> > >         iommu_hwdom_init(d);
> > > @@ -609,7 +617,10 @@ struct domain *domain_create(domid_t domid,
> > >       }
> > >         /* Sort out our idea of is_control_domain(). */
> > > -    d->is_privileged = flags & CDF_privileged;
> > > +    if ( flags & CDF_privileged )
> > > +        d->role |= ROLE_CONTROL_DOMAIN;
> > > +    else
> > > +        d->role &= ~ROLE_CONTROL_DOMAIN; /*ensure not set */
> > >         /* Sort out our idea of is_hardware_domain(). */
> > >       if ( is_initial_domain(d) || domid == hardware_domid )
> > > @@ -619,6 +630,7 @@ struct domain *domain_create(domid_t domid,
> > >             old_hwdom = hardware_domain;
> > >           hardware_domain = d;
> > > +        d->role |= ROLE_HARDWARE_DOMAIN;
> > >       }
> > >         TRACE_1D(TRC_DOM0_DOM_ADD, d->domain_id);
> > > diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> > > index a9276a7bed..695f240326 100644
> > > --- a/xen/include/xen/sched.h
> > > +++ b/xen/include/xen/sched.h
> > > @@ -467,8 +467,10 @@ struct domain
> > >   #endif
> > >       /* is node-affinity automatically computed? */
> > >       bool             auto_node_affinity;
> > > -    /* Is this guest fully privileged (aka dom0)? */
> > > -    bool             is_privileged;
> > > +#define ROLE_UNBOUNDED_DOMAIN  (1U<<0)
> > > +#define ROLE_CONTROL_DOMAIN    (1U<<1)
> > > +#define ROLE_HARDWARE_DOMAIN   (1U<<2)
> > 
> > This is a great step in the right direction but I think at least a short
> > in-code comment to explain the difference between the three
> 
> Ack.
> 
> > > +    uint8_t          role;
> > >       /* Can this guest access the Xen console? */
> > >       bool             is_console;
> > >       /* Is this guest being debugged by dom0? */
> > > @@ -1060,9 +1062,7 @@ void watchdog_domain_destroy(struct domain *d);
> > >     static always_inline bool is_initial_domain(const struct domain *d)
> > >   {
> > > -    static int init_domain_id = 0;
> > > -
> > > -    return d->domain_id == init_domain_id;
> > > +    return d->role & ROLE_UNBOUNDED_DOMAIN;
> > >   }
> > 
> > As far as I can tell this is the only functional change in this patch:
> > given that dom0 loses unbounded soon after boot, the "is_initial_domain"
> > checks will start to fail?
> 
> Today, dom0 should not lose any of its roles at boot unless dom0less were to
> create a hardware domain.

I don't understand this sentence. To me, hardware_domain means "default
recipient of hardware devices". It also happens to be traditionally
associated with Dom0, so many privilege checks are hardware_domain
check, although they should be instead control_domain checks.

So if you say "dom0 should not lose any of its roles at boot unless
dom0less were to create a hardware domain", I read it as:

"dom0 (all powerful) would not lose any of its powers at boot unless we
created dom0 (hardware domain, all powerful) with other domUs at boot
using dom0less."

which I don't understand



> Upon reflection, I am thinking this check might want renaming to align with
> the rename of this role.
> 
> > We have a few of them in the code and I couldn't rule out that at least
> > these 3 could happen at runtime:
> > 
> > xen/common/sched/core.c:    else if ( is_initial_domain(d) &&
> > opt_dom0_vcpus_pin )
> > xen/common/sched/core.c:    else if ( is_initial_domain(d) )
> > xen/common/sched/arinc653.c:    if ( is_initial_domain(unit->domain) )
> > 
> > Maybe they need to be changed to control_domain checks?
> 
> Perhaps, I would want to study them a bit before switching them over.

+1

