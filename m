Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4E4192E53
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 17:38:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH8zj-0003PN-2Y; Wed, 25 Mar 2020 16:35:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OrPJ=5K=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jH8zh-0003PI-5t
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 16:35:05 +0000
X-Inumbo-ID: 93b635f6-6eb6-11ea-b34e-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93b635f6-6eb6-11ea-b34e-bc764e2007e4;
 Wed, 25 Mar 2020 16:35:03 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id z65so3240006ede.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 09:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xbYcs/2iekoi6JBSSKvceuNM1l6W+03b4pwqeDx2nX0=;
 b=ai1HBplPLY3eZjmIjs9NC0asuf4K83Im5CdT6ftNY2fEmZBhGsPUt+eDVY6Iz3DQvf
 7zd+o8hRT2Au/tP+oQIPqIytgXPnADDdRU/1NEpEjQOwGRTirPrztmKqOBcgH8Jee0aD
 BQbOXWLenvnbHk9UCzVdq21ClAUYN5mKDuQH2dhqNSEfaui95X0oT6BLT40p6nDIdc5C
 GuFcEk2H1/2qL1nPcZ+uRB1MGbU3l2EL89YAFlTdpaA5GyxIa7R5MF/e9x5Y//salOQp
 SD8iyBD0DMm1ru1PhoGfOrehwqwek5t1P/qqKIVMEPfuJTf8gDH3ESxAcpfIbNBLn4hE
 yDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xbYcs/2iekoi6JBSSKvceuNM1l6W+03b4pwqeDx2nX0=;
 b=n9vWq6u795InVLLJnj2m0U0c8ePFczyiYAbtckEfGUsjuN4RRQemR4o3ljNk34UvAJ
 UJkqfMjti6DmshNdVP8mu858+6OrvS/ZoJgEAFW1RsGyhGlYpzxxjCNN9mfdq8nzCgWZ
 HuH1Q7k1xQnZjvQ5AE3/x6GIkklkYMxN9fufpj4H+WwSDIBW8e9AfhZ2FPI3hCx0sqhX
 PcJhVXdInFp7ziIaDc6ixFuOYSuoZ3BGAZNsqaLf1Yhq1fhD6Dauvk0SH47w8osXhEQB
 xZjDwT+d+JtzdaKJjI0np3OWEjoSIc0XSuD1fsg+KU4XwxorHdw3zabIM8iqTNfxe2ZI
 +zXQ==
X-Gm-Message-State: ANhLgQ3LLeIcH0ncBbUCkMn76++CwNWHfOlh82HYGHOgS0074/rI/XAz
 eWg5+JB6pJ90va37urzzm06riHrUHMI=
X-Google-Smtp-Source: ADFU+vsTLgmhk088sp0VAZ6HpZybra8F1Pg0AeRcatfv5orxwT1xZgQNdbadQeQjddOVV8pySGFR9A==
X-Received: by 2002:a17:906:784c:: with SMTP id
 p12mr3936297ejm.296.1585154101609; 
 Wed, 25 Mar 2020 09:35:01 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41])
 by smtp.gmail.com with ESMTPSA id qx15sm119397ejb.11.2020.03.25.09.34.59
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 09:35:00 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id a81so3466215wmf.5
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 09:34:59 -0700 (PDT)
X-Received: by 2002:a7b:c842:: with SMTP id c2mr4450642wml.154.1585154099298; 
 Wed, 25 Mar 2020 09:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
 <20200325154702.GD28601@Air-de-Roger>
In-Reply-To: <20200325154702.GD28601@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 25 Mar 2020 10:34:23 -0600
X-Gmail-Original-Message-ID: <CABfawhnQ_LTG8oses9EWatJ63bEZFctp7uARBjN==twV7c4xqw@mail.gmail.com>
Message-ID: <CABfawhnQ_LTG8oses9EWatJ63bEZFctp7uARBjN==twV7c4xqw@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v12 1/3] xen/mem_sharing: VM forking
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Mar 25, 2020 at 9:47 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> Sorry it has taken me a while to get to this.
>
> On Mon, Mar 23, 2020 at 10:04:35AM -0700, Tamas K Lengyel wrote:
> > VM forking is the process of creating a domain with an empty memory spa=
ce and a
> > parent domain specified from which to populate the memory when necessar=
y. For
> > the new domain to be functional the VM state is copied over as part of =
the fork
> > operation (HVM params, hap allocation, etc).
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > ---
> > v12: Minor style adjustments Jan pointed out
> >      Convert mem_sharing_is_fork to inline function
> > v11: Fully copy vcpu_info pages
> >      Setup vcpu_runstate for forks
> >      Added TODO note for PV timers
> >      Copy shared_info page
> >      Add copy_settings function, to be shared with fork_reset in the ne=
xt patch
> > ---
> >  xen/arch/x86/domain.c             |  11 +
> >  xen/arch/x86/hvm/hvm.c            |   4 +-
> >  xen/arch/x86/mm/hap/hap.c         |   3 +-
> >  xen/arch/x86/mm/mem_sharing.c     | 368 ++++++++++++++++++++++++++++++
> >  xen/arch/x86/mm/p2m.c             |   9 +-
> >  xen/common/domain.c               |   3 +
> >  xen/include/asm-x86/hap.h         |   1 +
> >  xen/include/asm-x86/hvm/hvm.h     |   2 +
> >  xen/include/asm-x86/mem_sharing.h |  18 ++
> >  xen/include/public/memory.h       |   5 +
> >  xen/include/xen/sched.h           |   5 +
> >  11 files changed, 424 insertions(+), 5 deletions(-)
> >
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index caf2ecad7e..11d3c2216e 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -2202,6 +2202,17 @@ int domain_relinquish_resources(struct domain *d=
)
> >              ret =3D relinquish_shared_pages(d);
> >              if ( ret )
> >                  return ret;
> > +
> > +            /*
> > +             * If the domain is forked, decrement the parent's pause c=
ount
> > +             * and release the domain.
> > +             */
> > +            if ( mem_sharing_is_fork(d) )
> > +            {
> > +                domain_unpause(d->parent);
> > +                put_domain(d->parent);
> > +                d->parent =3D NULL;
> > +            }
> >          }
> >  #endif
> >
> > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > index a3d115b650..304b3d1562 100644
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -1917,7 +1917,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsign=
ed long gla,
> >      }
> >  #endif
> >
> > -    /* Spurious fault? PoD and log-dirty also take this path. */
> > +    /* Spurious fault? PoD, log-dirty and VM forking also take this pa=
th. */
> >      if ( p2m_is_ram(p2mt) )
> >      {
> >          rc =3D 1;
> > @@ -4377,7 +4377,7 @@ static int hvm_allow_get_param(struct domain *d,
> >      return rc;
> >  }
> >
> > -static int hvm_get_param(struct domain *d, uint32_t index, uint64_t *v=
alue)
> > +int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value)
> >  {
> >      int rc;
> >
> > diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
> > index a6d5e39b02..814d0c3253 100644
> > --- a/xen/arch/x86/mm/hap/hap.c
> > +++ b/xen/arch/x86/mm/hap/hap.c
> > @@ -321,8 +321,7 @@ static void hap_free_p2m_page(struct domain *d, str=
uct page_info *pg)
> >  }
> >
> >  /* Return the size of the pool, rounded up to the nearest MB */
> > -static unsigned int
> > -hap_get_allocation(struct domain *d)
> > +unsigned int hap_get_allocation(struct domain *d)
> >  {
> >      unsigned int pg =3D d->arch.paging.hap.total_pages
> >          + d->arch.paging.hap.p2m_pages;
> > diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharin=
g.c
> > index 3835bc928f..23deeddff2 100644
> > --- a/xen/arch/x86/mm/mem_sharing.c
> > +++ b/xen/arch/x86/mm/mem_sharing.c
> > @@ -22,6 +22,7 @@
> >
> >  #include <xen/types.h>
> >  #include <xen/domain_page.h>
> > +#include <xen/event.h>
> >  #include <xen/spinlock.h>
> >  #include <xen/rwlock.h>
> >  #include <xen/mm.h>
> > @@ -36,6 +37,8 @@
> >  #include <asm/altp2m.h>
> >  #include <asm/atomic.h>
> >  #include <asm/event.h>
> > +#include <asm/hap.h>
> > +#include <asm/hvm/hvm.h>
> >  #include <xsm/xsm.h>
> >
> >  #include "mm-locks.h"
> > @@ -1444,6 +1447,334 @@ static inline int mem_sharing_control(struct do=
main *d, bool enable)
> >      return 0;
> >  }
> >
> > +/*
> > + * Forking a page only gets called when the VM faults due to no entry =
being
> > + * in the EPT for the access. Depending on the type of access we eithe=
r
> > + * populate the physmap with a shared entry for read-only access or
> > + * fork the page if its a write access.
> > + *
> > + * The client p2m is already locked so we only need to lock
> > + * the parent's here.
> > + */
> > +int mem_sharing_fork_page(struct domain *d, gfn_t gfn, bool unsharing)
> > +{
> > +    int rc =3D -ENOENT;
> > +    shr_handle_t handle;
> > +    struct domain *parent =3D d->parent;
> > +    struct p2m_domain *p2m;
> > +    unsigned long gfn_l =3D gfn_x(gfn);
> > +    mfn_t mfn, new_mfn;
> > +    p2m_type_t p2mt;
> > +    struct page_info *page;
> > +
> > +    if ( !mem_sharing_is_fork(d) )
> > +        return -ENOENT;
> > +
> > +    if ( !unsharing )
> > +    {
> > +        /* For read-only accesses we just add a shared entry to the ph=
ysmap */
> > +        while ( parent )
> > +        {
> > +            if ( !(rc =3D nominate_page(parent, gfn, 0, &handle)) )
> > +                break;
> > +
> > +            parent =3D parent->parent;
> > +        }
> > +
> > +        if ( !rc )
> > +        {
> > +            /* The client's p2m is already locked */
> > +            struct p2m_domain *pp2m =3D p2m_get_hostp2m(parent);
>
> Nit: I think you could just use the existing p2m local variable.
>
> > +            p2m_lock(pp2m);
> > +            rc =3D add_to_physmap(parent, gfn_l, handle, d, gfn_l, fal=
se);
> > +            p2m_unlock(pp2m);
> > +
> > +            if ( !rc )
> > +                return 0;
> > +        }
> > +    }
> > +
> > +    /*
> > +     * If it's a write access (ie. unsharing) or if adding a shared en=
try to
> > +     * the physmap failed we'll fork the page directly.
> > +     */
> > +    p2m =3D p2m_get_hostp2m(d);
> > +    parent =3D d->parent;
> > +
> > +    while ( parent )
> > +    {
> > +        mfn =3D get_gfn_query(parent, gfn_l, &p2mt);
> > +
> > +        /*
> > +         * We can't fork grant memory from the parent, only regular ra=
m.
> > +         */
>
> Nit: single line comments should use /* ... */ (here and below).
>
> > +        if ( mfn_valid(mfn) && p2m_is_ram(p2mt) )
> > +            break;
> > +
> > +        put_gfn(parent, gfn_l);
> > +        parent =3D parent->parent;
> > +    }
> > +
> > +    if ( !parent )
> > +        return -ENOENT;
> > +
> > +    if ( !(page =3D alloc_domheap_page(d, 0)) )
> > +    {
> > +        put_gfn(parent, gfn_l);
> > +        return -ENOMEM;
> > +    }
> > +
> > +    new_mfn =3D page_to_mfn(page);
> > +    copy_domain_page(new_mfn, mfn);
> > +    set_gpfn_from_mfn(mfn_x(new_mfn), gfn_l);
> > +
> > +    put_gfn(parent, gfn_l);
> > +
> > +    return p2m->set_entry(p2m, gfn, new_mfn, PAGE_ORDER_4K, p2m_ram_rw=
,
> > +                          p2m->default_access, -1);
> > +}
> > +
> > +static int bring_up_vcpus(struct domain *cd, struct domain *d)
> > +{
> > +    unsigned int i;
> > +    int ret =3D -EINVAL;
>
> Nit: you can get rid of ret...
>
> > +
> > +    if ( d->max_vcpus !=3D cd->max_vcpus ||
> > +        (ret =3D cpupool_move_domain(cd, d->cpupool)) )
> > +        return ret;
>
> ...and just return -EINVAL here. Seeing as it's not used anywhere
> else.
>
> > +
> > +    for ( i =3D 0; i < cd->max_vcpus; i++ )
> > +    {
> > +        if ( !d->vcpu[i] || cd->vcpu[i] )
> > +            continue;
> > +
> > +        if ( !vcpu_create(cd, i) )
> > +            return -EINVAL;
> > +    }
> > +
> > +    domain_update_node_affinity(cd);
> > +    return 0;
> > +}
> > +
> > +static int copy_vcpu_settings(struct domain *cd, struct domain *d)
> > +{
> > +    unsigned int i;
> > +    struct p2m_domain *p2m =3D p2m_get_hostp2m(cd);
> > +    int ret =3D -EINVAL;
> > +
> > +    for ( i =3D 0; i < cd->max_vcpus; i++ )
> > +    {
> > +        const struct vcpu *d_vcpu =3D d->vcpu[i];
> > +        struct vcpu *cd_vcpu =3D cd->vcpu[i];
> > +        struct vcpu_runstate_info runstate;
> > +        mfn_t vcpu_info_mfn;
> > +
> > +        if ( !d_vcpu || !cd_vcpu )
> > +            continue;
> > +
> > +        /*
> > +         * Copy & map in the vcpu_info page if the guest uses one
> > +         */
> > +        vcpu_info_mfn =3D d_vcpu->vcpu_info_mfn;
> > +        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
> > +        {
> > +            mfn_t new_vcpu_info_mfn =3D cd_vcpu->vcpu_info_mfn;
> > +
> > +            /*
> > +             * Allocate & map the page for it if it hasn't been alread=
y
> > +             */
> > +            if ( mfn_eq(new_vcpu_info_mfn, INVALID_MFN) )
> > +            {
> > +                gfn_t gfn =3D mfn_to_gfn(d, vcpu_info_mfn);
> > +                unsigned long gfn_l =3D gfn_x(gfn);
> > +                struct page_info *page;
> > +
> > +                if ( !(page =3D alloc_domheap_page(cd, 0)) )
> > +                    return -ENOMEM;
> > +
> > +                new_vcpu_info_mfn =3D page_to_mfn(page);
> > +                set_gpfn_from_mfn(mfn_x(new_vcpu_info_mfn), gfn_l);
> > +
> > +                ret =3D p2m->set_entry(p2m, gfn, new_vcpu_info_mfn, PA=
GE_ORDER_4K,
> > +                                     p2m_ram_rw, p2m->default_access, =
-1);
> > +                if ( ret )
> > +                    return ret;
> > +
> > +                ret =3D map_vcpu_info(cd_vcpu, gfn_l,
> > +                                    d_vcpu->vcpu_info_offset);
> > +                if ( ret )
> > +                    return ret;
> > +            }
> > +
> > +            copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
> > +        }
> > +
> > +        /*
> > +         * Setup the vCPU runstate area
> > +         */
> > +        if ( guest_handle_is_null(runstate_guest(cd_vcpu)) )
>
> Maybe I'm confused, but isn't this the other way around and you need
> to check? If the parent runstate is not null copy it to the fork,
> ie:
>
> if ( !guest_handle_is_null(runstate_guest(d_vcpu)) )
> {
>     ...
>
> > +        {
> > +            runstate_guest(cd_vcpu) =3D runstate_guest(d_vcpu);
> > +            vcpu_runstate_get(cd_vcpu, &runstate);
> > +            __copy_to_guest(runstate_guest(cd_vcpu), &runstate, 1);
>
> You should check the return code I think.
>
> > +        }
> > +
> > +        /*
> > +         * TODO: to support VMs with PV interfaces copy additional
> > +         * settings here, such as PV timers.
> > +         */
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int fork_hap_allocation(struct domain *cd, struct domain *d)
> > +{
> > +    int rc;
> > +    bool preempted;
> > +    unsigned long mb =3D hap_get_allocation(d);
> > +
> > +    if ( mb =3D=3D hap_get_allocation(cd) )
> > +        return 0;
> > +
> > +    paging_lock(cd);
> > +    rc =3D hap_set_allocation(cd, mb << (20 - PAGE_SHIFT), &preempted)=
;
> > +    paging_unlock(cd);
> > +
> > +    return preempted ? -ERESTART : rc;
> > +}
> > +
> > +static void copy_tsc(struct domain *cd, struct domain *d)
> > +{
> > +    uint32_t tsc_mode;
> > +    uint32_t gtsc_khz;
> > +    uint32_t incarnation;
> > +    uint64_t elapsed_nsec;
> > +
> > +    tsc_get_info(d, &tsc_mode, &elapsed_nsec, &gtsc_khz, &incarnation)=
;
> > +    /* Don't bump incarnation on set */
> > +    tsc_set_info(cd, tsc_mode, elapsed_nsec, gtsc_khz, incarnation - 1=
);
> > +}
> > +
> > +static int copy_special_pages(struct domain *cd, struct domain *d)
> > +{
> > +    mfn_t new_mfn, old_mfn;
> > +    struct p2m_domain *p2m =3D p2m_get_hostp2m(cd);
> > +    static const unsigned int params[] =3D
> > +    {
> > +        HVM_PARAM_STORE_PFN,
> > +        HVM_PARAM_IOREQ_PFN,
> > +        HVM_PARAM_BUFIOREQ_PFN,
> > +        HVM_PARAM_CONSOLE_PFN
> > +    };
> > +    unsigned int i;
> > +    int rc;
> > +
> > +    for ( i =3D 0; i < 4; i++ )
>
> Please use ARRAY_SIZE instead of hard coding 4.
>
> > diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> > index 9f51370327..1ed7d13084 100644
> > --- a/xen/arch/x86/mm/p2m.c
> > +++ b/xen/arch/x86/mm/p2m.c
> > @@ -509,6 +509,12 @@ mfn_t __get_gfn_type_access(struct p2m_domain *p2m=
, unsigned long gfn_l,
> >
> >      mfn =3D p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
> >
> > +    /* Check if we need to fork the page */
> > +    if ( (q & P2M_ALLOC) && p2m_is_hole(*t) &&
> > +         !mem_sharing_fork_page(p2m->domain, gfn, q & P2M_UNSHARE) )
> > +        mfn =3D p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
> > +
> > +    /* Check if we need to unshare the page */
> >      if ( (q & P2M_UNSHARE) && p2m_is_shared(*t) )
> >      {
> >          ASSERT(p2m_is_hostp2m(p2m));
> > @@ -588,7 +594,8 @@ struct page_info *p2m_get_page_from_gfn(
> >              return page;
> >
> >          /* Error path: not a suitable GFN at all */
> > -        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) =
)
> > +        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) =
&&
> > +             !mem_sharing_is_fork(p2m->domain) )
> >              return NULL;
> >      }
> >
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index b4eb476a9c..62aed53a16 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1270,6 +1270,9 @@ int map_vcpu_info(struct vcpu *v, unsigned long g=
fn, unsigned offset)
> >
> >      v->vcpu_info =3D new_info;
> >      v->vcpu_info_mfn =3D page_to_mfn(page);
> > +#ifdef CONFIG_MEM_SHARING
> > +    v->vcpu_info_offset =3D offset;
>
> There's no need to introduce this field, you can just use v->vcpu_info
> & ~PAGE_MASK AFAICT.

Just doing what you suggest above results in:

mem_sharing.c:1603:55: error: invalid operands to binary & (have
=E2=80=98vcpu_info_t * const=E2=80=99 {aka =E2=80=98union <anonymous> * con=
st=E2=80=99} and =E2=80=98long
int=E2=80=99)
                                     d_vcpu->vcpu_info & ~PAGE_MASK);

I can of course cast the vcpu_info pointer to (long int), it's just a
bit ugly. Thoughts?

Tamas

