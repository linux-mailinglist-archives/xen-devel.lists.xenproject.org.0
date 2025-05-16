Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 541EAAB97EA
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 10:43:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986569.1372109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFqfM-0007Y8-EI; Fri, 16 May 2025 08:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986569.1372109; Fri, 16 May 2025 08:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFqfM-0007Wd-Bh; Fri, 16 May 2025 08:43:40 +0000
Received: by outflank-mailman (input) for mailman id 986569;
 Fri, 16 May 2025 08:43:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Iio=YA=bounce.vates.tech=bounce-md_30504962.6826fab7.v1-4368014b365942719809a18e32120b24@srs-se1.protection.inumbo.net>)
 id 1uFqfL-0007WX-0e
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 08:43:39 +0000
Received: from mail187-4.suw11.mandrillapp.com
 (mail187-4.suw11.mandrillapp.com [198.2.187.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db09081f-3231-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 10:43:36 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-4.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4ZzLFz1JcTzlfh3C
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 08:43:35 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4368014b365942719809a18e32120b24; Fri, 16 May 2025 08:43:35 +0000
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
X-Inumbo-ID: db09081f-3231-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747385015; x=1747655015;
	bh=QIsCxqSevCNnS3VEX4nPvkof78q3xUbwM+lArj0clCg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DbaqxbdOp4WQnqm+vdCQuiidyyoNJs/S8+nQpeev6gMpELNK9OuepV1DXYa9VzjJr
	 cmFJvR3xd1o5Bdpj2DNp8r8c4pGZP+g+yLYtNyRywWPjSlmX07Qp1oykWJxxsY1rsi
	 R/gv+mgQKxDdRo+jKO6nredQsNk2ksM3ds7ITnt/s4dYICLlTJe+4X9IDqqBdrVJuZ
	 qk++wn4bWwrt3vClirXBCBx0QhmcIaDxr70K3KRArFVJHccOV/nxM6ZiwlJMv6ABVh
	 PdLqBwrg/+w7/q/AM5ip/e8mIXD2g3R2zW3669ccLSZPVupjmbMt9uFu+/TN4nSvYf
	 fvh/ffb4Ts41w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747385015; x=1747645515; i=teddy.astie@vates.tech;
	bh=QIsCxqSevCNnS3VEX4nPvkof78q3xUbwM+lArj0clCg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ffT3F85yufVnk8rYRjBni+gLOH7Zi7Phs7IraH1o/6t8P2q7jONS8JMpAa3V8XfUL
	 ShrNqZhp/zYiSPQhwmxpD5a2poY1XZKmpuYrkdrdM7gNAKqKuATOvrJ7YJYQfs5flT
	 U0CeSDZp3uEbWIOsFAmr+5eMH+EXrXuTnBG8eTnlz8VL+bdqjbftTnfXIXNE8HVERz
	 nUZlHbfdwdRz8my5O9bizgIeUkakvWFEwEf9TQotulRcAJacVfD8sum70oj60E2kGU
	 LSWRUxrFoL2O4rr/rfVhwMTXy7PldXgc1AqAGtxQ3iy5zWl0TtZ6NKKeKHuNLoZkch
	 hlvAOqzjPJP0w==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v6=201/2]=20xen/domain:=20unify=20domain=20ID=20allocation?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747385013610
Message-Id: <3c9f60b3-cedb-4689-a3b4-15ebddcf9f67@vates.tech>
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
References: <20250516020434.1145337-1-dmukhin@ford.com> <20250516020434.1145337-2-dmukhin@ford.com>
In-Reply-To: <20250516020434.1145337-2-dmukhin@ford.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4368014b365942719809a18e32120b24?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 08:43:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 16/05/2025 =C3=A0 04:06, dmkhn@proton.me a =C3=A9crit=C2=A0:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Currently, hypervisor code has two different non-system domain ID allocat=
ion
> implementations:
> 
>    (a) Sequential IDs allocation in dom0less Arm code based on max_init_d=
omid;
> 
>    (b) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not use
>        max_init_domid (both Arm and x86).
> 
> It makes sense to have a common helper code for such task across architec=
tures
> (Arm and x86) and between dom0less / toolstack domU allocation.
> 
> Wrap the domain ID allocation as an arch-independent function domid_alloc=
() in
> common/domain.c based on rangeset.
> 
> Allocation algorithm:
> - If an explicit domain ID is provided, verify its availability and
>    use it if ID is not used;
> - Otherwise, perform an exhaustive search starting from the end of the us=
ed
>    domain ID range. domid_alloc() guarantees that two subsequent calls wi=
ll
>    result in different IDs allocation.
> 
> Initialize the domain IDs rangeset from the new domid_init() which is cal=
led
> from arch setup code.
> 
> Also, remove is_free_domid() helper as it is not needed now.
> 
> No functional change intended.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v5:
> - rebased
> ---
>   xen/arch/arm/domain_build.c             | 17 ++++--
>   xen/arch/arm/setup.c                    |  2 +
>   xen/arch/x86/setup.c                    | 13 +++--
>   xen/common/device-tree/dom0less-build.c | 10 ++--
>   xen/common/domain.c                     | 70 +++++++++++++++++++++++++
>   xen/common/domctl.c                     | 41 ++-------------
>   xen/include/xen/domain.h                |  4 ++
>   7 files changed, 107 insertions(+), 50 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b189a7cfae..e9d563c269 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2010,6 +2010,7 @@ void __init create_dom0(void)
>           .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_version=
),
>       };
>       unsigned int flags =3D CDF_privileged | CDF_hardware;
> +    domid_t domid;
>       int rc;
>   
>       /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> @@ -2034,19 +2035,25 @@ void __init create_dom0(void)
>       if ( !llc_coloring_enabled )
>           flags |=3D CDF_directmap;
>   
> -    dom0 =3D domain_create(0, &dom0_cfg, flags);
> +    domid =3D domid_alloc(0);
> +    if ( domid =3D=3D DOMID_INVALID )
> +        panic("Error allocating domain ID 0\n");
> +
> +    dom0 =3D domain_create(domid, &dom0_cfg, flags);
>       if ( IS_ERR(dom0) )
> -        panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0));
> +        panic("Error creating domain %d (rc =3D %ld)\n", domid, PTR_ERR(=
dom0));
>   
>       if ( llc_coloring_enabled && (rc =3D dom0_set_llc_colors(dom0)) )
> -        panic("Error initializing LLC coloring for domain 0 (rc =3D %d)\=
n", rc);
> +        panic("Error initializing LLC coloring for domain %pd (rc =3D %d=
)\n",
> +              dom0, rc);
>   
>       if ( alloc_dom0_vcpu0(dom0) =3D=3D NULL )
> -        panic("Error creating domain 0 vcpu0\n");
> +        panic("Error creating domain %pdv0\n", dom0);
>   
>       rc =3D construct_dom0(dom0);
>       if ( rc )
> -        panic("Could not set up DOM0 guest OS (rc =3D %d)\n", rc);
> +        panic("Could not set up guest OS for domain %pd (rc =3D %d)\n",
> +              dom0, rc);
>   
>       set_xs_domain(dom0);
>   }
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 10b46d0684..c3959e8d8e 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -418,6 +418,8 @@ void asmlinkage __init start_xen(unsigned long fdt_pa=
ddr)
>   
>       timer_init();
>   
> +    domid_init();
> +
>       init_idle_domain();
>   
>       rcu_init();
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 2518954124..02f665f520 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1030,8 +1030,11 @@ static struct domain *__init create_dom0(struct bo=
ot_info *bi)
>       if ( iommu_enabled )
>           dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>   
> -    /* Create initial domain.  Not d0 for pvshim. */
> -    bd->domid =3D get_initial_domain_id();
> +    /* Allocate initial domain ID. Not d0 for pvshim. */
> +    bd->domid =3D domid_alloc(get_initial_domain_id());
> +    if ( bd->domid =3D=3D DOMID_INVALID )
> +        panic("Error allocating domain ID %d\n", get_initial_domain_id()=
);
> +
>       d =3D domain_create(bd->domid, &dom0_cfg,
>                         pv_shim ? 0 : CDF_privileged | CDF_hardware);
>       if ( IS_ERR(d) )
> @@ -1063,7 +1066,7 @@ static struct domain *__init create_dom0(struct boo=
t_info *bi)
>   
>           if ( (strlen(acpi_param) =3D=3D 0) && acpi_disabled )
>           {
> -            printk("ACPI is disabled, notifying Domain 0 (acpi=3Doff)\n"=
);
> +            printk("ACPI is disabled, notifying domain %pd (acpi=3Doff)\=
n", d);
>               safe_strcpy(acpi_param, "off");
>           }
>   
> @@ -1078,7 +1081,7 @@ static struct domain *__init create_dom0(struct boo=
t_info *bi)
>   
>       bd->d =3D d;
>       if ( construct_dom0(bd) !=3D 0 )
> -        panic("Could not construct domain 0\n");
> +        panic("Could not construct domain %pd\n", d);
>   
>       bd->cmdline =3D NULL;
>       xfree(cmdline);
> @@ -1915,6 +1918,8 @@ void asmlinkage __init noreturn __start_xen(void)
>       mmio_ro_ranges =3D rangeset_new(NULL, "r/o mmio ranges",
>                                     RANGESETF_prettyprint_hex);
>   
> +    domid_init();
> +
>       xsm_multiboot_init(bi);
>   
>       /*
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-=
tree/dom0less-build.c
> index 2c56f13771..9236dbae11 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -850,15 +850,13 @@ void __init create_domUs(void)
>           struct xen_domctl_createdomain d_cfg =3D {0};
>           unsigned int flags =3D 0U;
>           bool has_dtb =3D false;
> +        domid_t domid;
>           uint32_t val;
>           int rc;
>   
>           if ( !dt_device_is_compatible(node, "xen,domain") )
>               continue;
>   
> -        if ( (max_init_domid + 1) >=3D DOMID_FIRST_RESERVED )
> -            panic("No more domain IDs available\n");
> -
>           d_cfg.max_evtchn_port =3D 1023;
>           d_cfg.max_grant_frames =3D -1;
>           d_cfg.max_maptrack_frames =3D -1;
> @@ -981,7 +979,11 @@ void __init create_domUs(void)
>            * very important to use the pre-increment operator to call
>            * domain_create() with a domid > 0. (domid =3D=3D 0 is reserve=
d for Dom0)
>            */
> -        d =3D domain_create(++max_init_domid, &d_cfg, flags);
> +        domid =3D domid_alloc(++max_init_domid);
> +        if ( domid =3D=3D DOMID_INVALID )
> +            panic("Error allocating ID for domain %s\n", dt_node_name(no=
de));
> +
> +        d =3D domain_create(domid, &d_cfg, flags);
>           if ( IS_ERR(d) )
>               panic("Error creating domain %s (rc =3D %ld)\n",
>                     dt_node_name(node), PTR_ERR(d));
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index abf1969e60..0ba3cdc47d 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -66,6 +66,74 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
>   static struct domain *domain_hash[DOMAIN_HASH_SIZE];
>   struct domain *domain_list;
>   
> +/* Non-system domain ID allocator. */
> +static DEFINE_SPINLOCK(domid_lock);
> +static struct rangeset *domid_rangeset;
> +static unsigned int domid_last;
> +
> +void __init domid_init(void)
> +{
> +    domid_rangeset =3D rangeset_new(NULL, "domid", RANGESETF_prettyprint=
_hex);
> +    if ( !domid_rangeset )
> +        panic("cannot allocate domain ID rangeset\n");
> +
> +    rangeset_limit(domid_rangeset, DOMID_FIRST_RESERVED);
> +}
> +
> +/*
> + * Allocate new non-system domain ID based on the hint.
> + *
> + * If hint is outside of valid [0..DOMID_FIRST_RESERVED - 1] range of ID=
s,
> + * perform an exhaustive search starting from the end of the used domain=
 ID
> + * range.
> + */
> +domid_t domid_alloc(domid_t domid)
> +{
> +    spin_lock(&domid_lock);
> +
> +    if ( domid < DOMID_FIRST_RESERVED )
> +    {
> +        if ( rangeset_contains_singleton(domid_rangeset, domid) )
> +            domid =3D DOMID_INVALID;
> +    }
> +    else
> +    {
> +        for ( domid =3D domid_last + 1; domid !=3D domid_last; domid++ )
> +        {
> +            if ( domid =3D=3D DOMID_FIRST_RESERVED )
> +                domid =3D 0;
> +
> +            if ( !rangeset_contains_singleton(domid_rangeset, domid) )
> +                break;
> +        }
> +
> +        if ( domid =3D=3D domid_last )
> +            domid =3D DOMID_INVALID;
> +    }
> +
> +    if ( domid !=3D DOMID_INVALID )
> +    {
> +        ASSERT(!rangeset_add_singleton(domid_rangeset, domid));
> +
> +        if ( domid !=3D domid_last )
> +            domid_last =3D domid;
> +    }
> +
> +    spin_unlock(&domid_lock);
> +
> +    return domid;
> +}

It's mostly a matter of implementation choice, but I am not really fan 
of relying on rangesets, which to me are meant for address ranges or 
something similar but at least large.

I would rather rely on a bitmap using find_first_zero_bit+set_bit which 
avoids doing a per-domid test, and may be simpler overall. The bitmap 
size for 0x3FF0 domains is almost 4KB, which looks acceptable.

I don't know what other thinks.

> +
> +void domid_free(domid_t domid)
> +{
> +    spin_lock(&domid_lock);
> +
> +    if ( rangeset_contains_singleton(domid_rangeset, domid) )
> +        ASSERT(!rangeset_remove_singleton(domid_rangeset, domid));
> +
> +    spin_unlock(&domid_lock);
> +}
> +
>   /*
>    * Insert a domain into the domlist/hash.  This allows the domain to be=
 looked
>    * up by domid, and therefore to be the subject of hypercalls/etc.
> @@ -1449,6 +1517,8 @@ void domain_destroy(struct domain *d)
>   
>       TRACE_TIME(TRC_DOM0_DOM_REM, d->domain_id);
>   
> +    domid_free(d->domain_id);
> +
>       /* Remove from the domlist/hash. */
>       domlist_remove(d);
>   
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index bfe2e1f9f0..2e02139660 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -49,20 +49,6 @@ static int xenctl_bitmap_to_nodemask(nodemask_t *nodem=
ask,
>                                      MAX_NUMNODES);
>   }
>   
> -static inline int is_free_domid(domid_t dom)
> -{
> -    struct domain *d;
> -
> -    if ( dom >=3D DOMID_FIRST_RESERVED )
> -        return 0;
> -
> -    if ( (d =3D rcu_lock_domain_by_id(dom)) =3D=3D NULL )
> -        return 1;
> -
> -    rcu_unlock_domain(d);
> -    return 0;
> -}
> -
>   void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *i=
nfo)
>   {
>       struct vcpu *v;
> @@ -421,34 +407,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t)=
 u_domctl)
>   
>       case XEN_DOMCTL_createdomain:
>       {
> -        domid_t        dom;
> -        static domid_t rover =3D 0;
> +        domid_t domid =3D domid_alloc(op->domain);
>   
> -        dom =3D op->domain;
> -        if ( (dom > 0) && (dom < DOMID_FIRST_RESERVED) )
> +        if ( domid =3D=3D DOMID_INVALID )
>           {
>               ret =3D -EEXIST;
> -            if ( !is_free_domid(dom) )
> -                break;
> -        }
> -        else
> -        {
> -            for ( dom =3D rover + 1; dom !=3D rover; dom++ )
> -            {
> -                if ( dom =3D=3D DOMID_FIRST_RESERVED )
> -                    dom =3D 1;
> -                if ( is_free_domid(dom) )
> -                    break;
> -            }
> -
> -            ret =3D -ENOMEM;
> -            if ( dom =3D=3D rover )
> -                break;
> -
> -            rover =3D dom;
> +            break;
>           }
>   
> -        d =3D domain_create(dom, &op->u.createdomain, false);
> +        d =3D domain_create(domid, &op->u.createdomain, false);
>           if ( IS_ERR(d) )
>           {
>               ret =3D PTR_ERR(d);

In case the domain creation failure, we need to free the domid, 
otherwise, it would not be used anymore as considered used by the domid 
allocator.

> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index e10baf2615..039bb7eeaf 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -38,6 +38,10 @@ void arch_get_domain_info(const struct domain *d,
>   
>   domid_t get_initial_domain_id(void);
>   
> +void domid_init(void);
> +void domid_free(domid_t domid);
> +domid_t domid_alloc(domid_t domid);
> +
>   /* CDF_* constant. Internal flags for domain creation. */
>   /* Is this a privileged domain? */
>   #define CDF_privileged           (1U << 0)

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



