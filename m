Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF63774F65
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 01:38:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580588.908920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTWHa-0002bw-Au; Tue, 08 Aug 2023 23:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580588.908920; Tue, 08 Aug 2023 23:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTWHa-0002Z7-84; Tue, 08 Aug 2023 23:38:34 +0000
Received: by outflank-mailman (input) for mailman id 580588;
 Tue, 08 Aug 2023 23:38:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiCO=DZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTWHY-0002Z1-Eu
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 23:38:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad8ee705-3644-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 01:38:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C57CD62E3F;
 Tue,  8 Aug 2023 23:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D15C433C8;
 Tue,  8 Aug 2023 23:38:26 +0000 (UTC)
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
X-Inumbo-ID: ad8ee705-3644-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691537908;
	bh=6l3NUxE3JGV6lK+c4EEgpFscVvTK57T9LWR6Dzjlivs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d+sY75+Uevl7oJLRi/mhMHdNw+u3jkduiccm21t9fTQ7zmUcAEk8eMxZsl0afnelg
	 TRqztNZuTKel4FUJAAC5d7aWGJ/SpC6HBWwqr4zs+Qibo1F0x0f9ekOPdLrvy34IKq
	 lKcJKHCzMTQS/lme279m7Jwb6Fw7Krx+kgAYashcLAXQ5TffuG0qZcIkJ1jvBkMFPo
	 bpmCivmgD+Ao+RAQv+JZoAjh4Qgv6ln9kdKHetJXms1n5IaRh+POD2jq7VZHjpRCOD
	 04FeiWXou+EJIOyw/zkXMtI8+8nzf54GRKbUkmR4Z/1XTTQBc4ikXa+khkiPecNOh4
	 x4aaNc2RwHbZQ==
Date: Tue, 8 Aug 2023 16:38:25 -0700 (PDT)
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
In-Reply-To: <119710f3-82b1-2066-5fa0-164bd293836e@apertussolutions.com>
Message-ID: <alpine.DEB.2.22.394.2308081629220.2127516@ubuntu-linux-20-04-desktop>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com> <20230801202006.20322-3-dpsmith@apertussolutions.com> <alpine.DEB.2.22.394.2308011726170.2127516@ubuntu-linux-20-04-desktop> <c747c66c-a08d-ce0c-5d1c-25b594ac5f5e@apertussolutions.com>
 <alpine.DEB.2.22.394.2308031247430.2127516@ubuntu-linux-20-04-desktop> <119710f3-82b1-2066-5fa0-164bd293836e@apertussolutions.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Aug 2023, Daniel P. Smith wrote:
> On 8/3/23 16:19, Stefano Stabellini wrote:
> > On Thu, 3 Aug 2023, Daniel P. Smith wrote:
> > > On 8/1/23 20:54, Stefano Stabellini wrote:
> > > > On Tue, 1 Aug 2023, Daniel P. Smith wrote:
> > > > > The existing concepts such as unbounded domain, ie. all powerful,
> > > > > control
> > > > > domain and hardware domain are, effectively, roles the domains provide
> > > > > for
> > > > > the
> > > > > system. Currently, these are represented with booleans within `struct
> > > > > domain`
> > > > > or global domid variables that are compared against. This patch begins
> > > > > to
> > > > > formalize these roles by replacing the `is_control` and `is_console`,
> > > > > along
> > > > > with expanding the check against the global `hardware_domain` with a
> > > > > single
> > > > > encapsulating role attribute in `struct domain`.
> > > > > 
> > > > > Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> > > > 
> > > > This is definitely heading in the right direction
> > > 
> > > Thank you, it is good to know there is some agreement here.
> > > 
> > > > > ---
> > > > >    xen/arch/arm/domain_build.c |  2 ++
> > > > >    xen/arch/x86/setup.c        |  2 ++
> > > > >    xen/common/domain.c         | 14 +++++++++++++-
> > > > >    xen/include/xen/sched.h     | 16 +++++++++-------
> > > > >    xen/include/xsm/dummy.h     |  4 ++--
> > > > >    xen/xsm/flask/hooks.c       | 12 ++++++------
> > > > >    6 files changed, 34 insertions(+), 16 deletions(-)
> > > > > 
> > > > > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > > > > index 39b4ee03a5..51b4daefe1 100644
> > > > > --- a/xen/arch/arm/domain_build.c
> > > > > +++ b/xen/arch/arm/domain_build.c
> > > > > @@ -4201,6 +4201,8 @@ void __init create_dom0(void)
> > > > >        if ( IS_ERR(dom0) )
> > > > >            panic("Error creating domain 0 (rc = %ld)\n",
> > > > > PTR_ERR(dom0));
> > > > >    +    dom0->role |= ROLE_UNBOUNDED_DOMAIN;
> > > > 
> > > > I am not a fan of "UNBOUNDED". Maybe "PRIMARY"? "PRIVILEGED"? "SUPER"?
> > > > "ROOT"?
> > > > 
> > > > I also recognize I am not good at naming things so I'll stop here and
> > > > let other provide better feedback :-)
> > > 
> > > In first version of hyperlaunch and in the early roles work, I was working
> > > to
> > > move toward eliminating this concept entirely. The reality is this is a
> > > model
> > > that has existed for over 20 years and there are those who accept and
> > > embrace
> > > the model. Introducing the name UNBOUNDED was to at least break the idea
> > > that
> > > the all powerful domain necessarily is the first/initial domain to run.
> > > With
> > > hyperlaunch, there are still security-based scenarios where you might want
> > > to
> > > run a DomB before starting an all privileged domain. I spent quite some
> > > time,
> > > probably more than I should have, to find a good name that expresses what
> > > this
> > > role is. Considering a comment below and a comment by Jan, I am starting
> > > to
> > > think a better way to view it is a domain that assumes all roles in the
> > > system. So your suggestions of SUPER or ROOT might be more fitting. I
> > > considered ROLE_ALL, but something about it doesn't sit right with me.
> > > With
> > > that said I welcome the yak shaving of naming to begin. ( ^_^)
> > > 
> > > > Also, do we actually need unbounded given that it gets replaced with
> > > > control_domain pretty soon?
> > > 
> > > Yes, because as mentioned above, this is meant to express a domain that
> > > has
> > > been assigned all roles, for which later the domain may decided to
> > > delegate
> > > the role to another domain.
> > > 
> > > > I am asking because I think that at least from a safety perspective it
> > > > would be a problem to run a domain as "unbounded". In a safety system,
> > > > we wouldn't want anything to be unbounded, not even temporarily at boot.
> > > > If "unbounded" is removed before running dom0, then of course it is no
> > > > problem because actually dom0 never gets to run with "unbounded" set.
> > > 
> > > I think this is were the name UNBOUNDED may have been a bad choice. The
> > > UNBOUNDED role is dom0. It is the control domain, the hardware domain, the
> > > Xenstore domain, and the crash domain (if that were to be solidified).
> > > 
> > > > (I am currently thinking of solving the privilege issue by using XSM and
> > > > removing most privileges from Dom0.)
> > > 
> > > I obviously would be a huge advocate of that approach. ( ^_^)
> > 
> > Thanks for the history, that helps. I was asking because I would like to
> > make sure that all the options below are possible and easy to achieve:
> > 
> > 1) traditional dom0 + some traditional domUs booted in a dom0less fashion
> > 2) only traditional domUs booted in a dom0less fashion (no dom0 at all)
> > 3) not-godlike-but-still-super dom0 + some traditional domUs booted in a
> > dom0less fashion
> > 4) domB booting
> > 
> > This ROLE_ALL domain would be dom0 in 1) and would be domB in 4).
> > In 2), there is no dom0 so there should also be no ROLE_ALL domain. All
> > good so far.
> 
> You are correct that constructing a traditional dom0 would be accomplished by
> assigning this role. As mentioned over in the hyperlaunch devicetree series
> that by a domain be a traditional dom0 would not be about ensuring it was give
> domid 0, but that it was assigned this role.
> 
> As for domB, no, it would not get the ROLE_ALL. It's purpose is assist the
> hyperlaunch domain builder with functions that just should not be done inside
> the hypervisor. A less-than-ideal analogy, is domB is like an initrd for
> Linux. Like an initrd is an environment that runs in user-space with
> controlled kernel interfaces to interact with system, domB provides the
> concept of a domain role that has restricted access to hypervisor interfaces
> to those needed to configure/setup the domains constructed by the hypervisor.
> In the roles case, a course-grained common base set of capabilities will need
> to be determined, but those using FLASK will be able to do fine grained access
> assignment for more rigid/stringent use cases.
> 
> Yes, in scenario 2 you provided, no domain would get assigned ROLE_ALL.
> 
> > In 3), it looked to me that we would be creating a ROLE_ALL domain, then
> > taking away some of the ROLEs. It doesn't sound right? Let's say that we
> > want to have a hardware_domain (in the sense of default recipient of
> > hardware, not necessarily privileged) with dm_ops access, but no domctl
> > access. How would you go about it?
> 
> With what is there today for dom0less, you have to go down the path that when
> dom0less constructs the hwdom, this will trigger dom0 to be demoted to the
> control domain role before either of them get unpaused.
> 
> Moving forward to a when hyperlaunch appears, then you would just assign the
> control domain role to "dom0" and the hardware domain role to "hwdom" and
> nothing would ever be assigned ROLE_ALL.

OK


> > Would it be required to go through the ROLE_ALL stage? How does it
> > compare to the way it would work today without this patch applied?
> > Today, does XSM kick in after is_privileged is set, effectively being
> > the same thing as XSM kicking in later and removing some ROLEs after
> > ROLE_ALL is already set? So, basically nothing is changing?
> 
> Until hyperlaunch, yes you would have to go through ROLE_ALL, but in dom0less
> case, as long as the hwdom is one of the domains it constructs, dom0 would
> never run with that role.

OK, I think we are on the same page. For extra clarity I want to add
that in scenario 3) there is no control domain at all. There is only
hardware_domain with a few control powers (not many).


> Your next question is a bit tricky. XSM is effective fairly early in
> start_xen() and begins enforcing its policy. The tricky part is that there is
> functionality and hypervisor behaviors that are not protected behind an XSM
> hook but where is_privileged, checked via is_control_domain(), is used to
> controls how they work. There are other places in the code where one would say
> that DAC is enforced before MAC, specifically one of the
> is_{control,hardware,xenstore}_domain() is enforced before the fine grained
> XSM check is made. In most cases this is not an issue, the role can just be
> given to the domain and the FLASK policy can be relied upon to restrict down.
> But there are some esoteric cases that could be constructed where this
> behavior would break the security model.

OK. I understand there are corner cases, but I am also understanding
that "nothing is changing" in terms of order of XSM enforcement and
deprivilege execution with this patch series? It is not getting "worse"
the window of time where Dom0 has ROLE_ALL/is_privileged?


> > > > >        if ( alloc_dom0_vcpu0(dom0) == NULL )
> > > > >            panic("Error creating domain 0 vcpu0\n");
> > > > >    diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > > > > index 2dbe9857aa..4e20edc3bf 100644
> > > > > --- a/xen/arch/x86/setup.c
> > > > > +++ b/xen/arch/x86/setup.c
> > > > > @@ -905,6 +905,8 @@ static struct domain *__init create_dom0(const
> > > > > module_t *image,
> > > > >        if ( IS_ERR(d) )
> > > > >            panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
> > > > >    +    d->role |= ROLE_UNBOUNDED_DOMAIN;
> > > > > +
> > > > >        init_dom0_cpuid_policy(d);
> > > > >          if ( alloc_dom0_vcpu0(d) == NULL )
> > > > > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > > > > index 8fb3c052f5..0ff1d52e3d 100644
> > > > > --- a/xen/common/domain.c
> > > > > +++ b/xen/common/domain.c
> > > > > @@ -340,6 +340,14 @@ static int late_hwdom_init(struct domain *d)
> > > > >        setup_io_bitmap(dom0);
> > > > >    #endif
> > > > >    +    /*
> > > > > +     * "dom0" may have been created under the unbounded role, demote
> > > > > it
> > > > > from
> > > > > +     * that role, reducing it to the control domain role and any
> > > > > other
> > > > > roles it
> > > > > +     * may have been given.
> > > > > +     */
> > > > > +    dom0->role &= ~(ROLE_UNBOUNDED_DOMAIN & ROLE_HARDWARE_DOMAIN);
> > > > > +    dom0->role |= ROLE_CONTROL_DOMAIN;
> > > > 
> > > > I think we need a better definition of the three roles to understand
> > > > what this mean.
> > > 
> > > Definition and as highlighted, a better name.
> > > 
> > > > >        rcu_unlock_domain(dom0);
> > > > >          iommu_hwdom_init(d);
> > > > > @@ -609,7 +617,10 @@ struct domain *domain_create(domid_t domid,
> > > > >        }
> > > > >          /* Sort out our idea of is_control_domain(). */
> > > > > -    d->is_privileged = flags & CDF_privileged;
> > > > > +    if ( flags & CDF_privileged )
> > > > > +        d->role |= ROLE_CONTROL_DOMAIN;
> > > > > +    else
> > > > > +        d->role &= ~ROLE_CONTROL_DOMAIN; /*ensure not set */
> > > > >          /* Sort out our idea of is_hardware_domain(). */
> > > > >        if ( is_initial_domain(d) || domid == hardware_domid )
> > > > > @@ -619,6 +630,7 @@ struct domain *domain_create(domid_t domid,
> > > > >              old_hwdom = hardware_domain;
> > > > >            hardware_domain = d;
> > > > > +        d->role |= ROLE_HARDWARE_DOMAIN;
> > > > >        }
> > > > >          TRACE_1D(TRC_DOM0_DOM_ADD, d->domain_id);
> > > > > diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> > > > > index a9276a7bed..695f240326 100644
> > > > > --- a/xen/include/xen/sched.h
> > > > > +++ b/xen/include/xen/sched.h
> > > > > @@ -467,8 +467,10 @@ struct domain
> > > > >    #endif
> > > > >        /* is node-affinity automatically computed? */
> > > > >        bool             auto_node_affinity;
> > > > > -    /* Is this guest fully privileged (aka dom0)? */
> > > > > -    bool             is_privileged;
> > > > > +#define ROLE_UNBOUNDED_DOMAIN  (1U<<0)
> > > > > +#define ROLE_CONTROL_DOMAIN    (1U<<1)
> > > > > +#define ROLE_HARDWARE_DOMAIN   (1U<<2)
> > > > 
> > > > This is a great step in the right direction but I think at least a short
> > > > in-code comment to explain the difference between the three
> > > 
> > > Ack.
> > > 
> > > > > +    uint8_t          role;
> > > > >        /* Can this guest access the Xen console? */
> > > > >        bool             is_console;
> > > > >        /* Is this guest being debugged by dom0? */
> > > > > @@ -1060,9 +1062,7 @@ void watchdog_domain_destroy(struct domain *d);
> > > > >      static always_inline bool is_initial_domain(const struct domain
> > > > > *d)
> > > > >    {
> > > > > -    static int init_domain_id = 0;
> > > > > -
> > > > > -    return d->domain_id == init_domain_id;
> > > > > +    return d->role & ROLE_UNBOUNDED_DOMAIN;
> > > > >    }
> > > > 
> > > > As far as I can tell this is the only functional change in this patch:
> > > > given that dom0 loses unbounded soon after boot, the "is_initial_domain"
> > > > checks will start to fail?
> > > 
> > > Today, dom0 should not lose any of its roles at boot unless dom0less were
> > > to
> > > create a hardware domain.
> > 
> > I don't understand this sentence. To me, hardware_domain means "default
> > recipient of hardware devices". It also happens to be traditionally
> > associated with Dom0, so many privilege checks are hardware_domain
> > check, although they should be instead control_domain checks.
> 
> What I am saying is that with this patch, dom0 will retain ROLE_ALL unless a
> separate hardware domain is constructed. If a separate hardware domain, aka
> late hardware domain, is created, then dom0 will loose ROLE_ALL and be
> demoted/limited to only ROLE_CONTROL_DOMAIN and the new late hardware domain
> will be give ROLE_HARDWARE_DOMAIN.
> 
> > So if you say "dom0 should not lose any of its roles at boot unless
> > dom0less were to create a hardware domain", I read it as:
> > 
> > "dom0 (all powerful) would not lose any of its powers at boot unless we
> > created dom0 (hardware domain, all powerful) with other domUs at boot
> > using dom0less."
> 
> Let's say dom0less set the xen command line parameter hardware_dom=1, and it
> has a configuration that constructs dom0 and 3 domU. The the first domU
> constructed would result in dom0 get limited to ROLE_CONTROL_DOMAIN and dom1
> would be given ROLE_HARDWARE_DOMAIN. What I would advise against, as I think
> it would end up crashing Xen, is if you gave dom0less a configuration with
> command line parameter hardware_dom=1, no dom0 and 3 domU. This would trigger
> the late_hwdom_init() which would it ASSERT(dom0 != NULL) and crash the
> hypervisor.

Thanks for the example, it is finally clear!

I don't think we should add hardware_dom=1 to the command line (I don't
know if it was just an example to make it easier to understand for me).
Instead it should a property on device tree. hardware_dom=1 is not great
because it is tied to the order of domain construction. Instead it
should be a device tree property under the specific domain. That way you
can clearly specify which one is tradition dom0, or which is
hardware_domain and which is control_domain.


> > which I don't understand
> 
> Did the above help?

A lot, thanks!


> > > Upon reflection, I am thinking this check might want renaming to align
> > > with
> > > the rename of this role.
> > > 
> > > > We have a few of them in the code and I couldn't rule out that at least
> > > > these 3 could happen at runtime:
> > > > 
> > > > xen/common/sched/core.c:    else if ( is_initial_domain(d) &&
> > > > opt_dom0_vcpus_pin )
> > > > xen/common/sched/core.c:    else if ( is_initial_domain(d) )
> > > > xen/common/sched/arinc653.c:    if ( is_initial_domain(unit->domain) )
> > > > 
> > > > Maybe they need to be changed to control_domain checks?
> > > 
> > > Perhaps, I would want to study them a bit before switching them over.
> > 
> > +1
> 

