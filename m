Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1730719F3DE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 12:53:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLPMl-0008DY-SF; Mon, 06 Apr 2020 10:52:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lhp/=5W=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jLPMj-0008DT-Vb
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 10:52:30 +0000
X-Inumbo-ID: b527096c-77f4-11ea-83d8-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b527096c-77f4-11ea-83d8-bc764e2007e4;
 Mon, 06 Apr 2020 10:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586170350;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FKW0021sBVGsf/MWs/HqraFUmc5nZ05OA5hZTNbg8+8=;
 b=B1iAic32gQPXa+IDB6LncHvY7az1WlhvJYbDoPLiCKpbqbIe1NgANpzN
 q5WHm/1Ym0b/zgmRoVzsNy6qrZsmlqoeJC5e3MBISjL2EVIi/xgRBuJZx
 1yuTFq1fYaedbYt0kozlI92q4f4D86kTp3KIEh+/r9D9YB0HCInhBvyaX k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zXu7PZ9EShbzjs6BDBuYgs9wS9X68TxAa3isJObPyaGEsjox0lH6Z/d0HsTYc9y9zA87IoYOa2
 Nsz0A1X+AaLvU/kvb4ws1qfrHBzLTYhcYgGa9mE/vhJnaa6yLenuATizKn5Qb6C7Sw/Mu5yEUB
 ItZ5/K9H3pfOdfQ6PMIEgs34HTjw6T7FtN4NGWaigGei3Whb4BvJe5o+fHwWWy4KfbZMfLja0X
 iI+XSkbimswLBF8YSEYRlU7JQdxzcrk09DpFX9Vqn5iS/TtPbx3/LHNhJzOg7gCVgwZocHSZPC
 1vw=
X-SBRS: 2.7
X-MesageID: 15449735
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,350,1580792400"; d="scan'208";a="15449735"
Date: Mon, 6 Apr 2020 12:52:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH v13 1/3] xen/mem_sharing: VM forking
Message-ID: <20200406105219.GY28601@Air-de-Roger>
References: <cover.1585579955.git.tamas.lengyel@intel.com>
 <f40757694decdfdbd5a264be4c277ba824261874.1585579955.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f40757694decdfdbd5a264be4c277ba824261874.1585579955.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tamas
 K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Mar 30, 2020 at 08:02:08AM -0700, Tamas K Lengyel wrote:
> VM forking is the process of creating a domain with an empty memory space and a
> parent domain specified from which to populate the memory when necessary. For
> the new domain to be functional the VM state is copied over as part of the fork
> operation (HVM params, hap allocation, etc).
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> +static int bring_up_vcpus(struct domain *cd, struct domain *d)
> +{
> +    unsigned int i;
> +    int ret = -EINVAL;
> +
> +    if ( d->max_vcpus != cd->max_vcpus ||
> +        (ret = cpupool_move_domain(cd, d->cpupool)) )
> +        return ret;
> +
> +    for ( i = 0; i < cd->max_vcpus; i++ )
> +    {
> +        if ( !d->vcpu[i] || cd->vcpu[i] )
> +            continue;
> +
> +        if ( !vcpu_create(cd, i) )
> +            return -EINVAL;
> +    }
> +
> +    domain_update_node_affinity(cd);
> +    return 0;
> +}
> +
> +static int copy_vcpu_settings(struct domain *cd, struct domain *d)

Nit: AFAICT *d can be constified.

> +{
> +    unsigned int i;
> +    struct p2m_domain *p2m = p2m_get_hostp2m(cd);
> +    int ret = -EINVAL;
> +
> +    for ( i = 0; i < cd->max_vcpus; i++ )
> +    {
> +        const struct vcpu *d_vcpu = d->vcpu[i];
> +        struct vcpu *cd_vcpu = cd->vcpu[i];
> +        struct vcpu_runstate_info runstate;
> +        mfn_t vcpu_info_mfn;
> +
> +        if ( !d_vcpu || !cd_vcpu )
> +            continue;
> +
> +        /* Copy & map in the vcpu_info page if the guest uses one */
> +        vcpu_info_mfn = d_vcpu->vcpu_info_mfn;
> +        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
> +        {
> +            mfn_t new_vcpu_info_mfn = cd_vcpu->vcpu_info_mfn;
> +
> +            /* Allocate & map the page for it if it hasn't been already */
> +            if ( mfn_eq(new_vcpu_info_mfn, INVALID_MFN) )
> +            {
> +                gfn_t gfn = mfn_to_gfn(d, vcpu_info_mfn);
> +                unsigned long gfn_l = gfn_x(gfn);
> +                struct page_info *page;
> +
> +                if ( !(page = alloc_domheap_page(cd, 0)) )
> +                    return -ENOMEM;
> +
> +                new_vcpu_info_mfn = page_to_mfn(page);
> +                set_gpfn_from_mfn(mfn_x(new_vcpu_info_mfn), gfn_l);
> +
> +                ret = p2m->set_entry(p2m, gfn, new_vcpu_info_mfn,
> +                                     PAGE_ORDER_4K, p2m_ram_rw,
> +                                     p2m->default_access, -1);
> +                if ( ret )
> +                    return ret;
> +
> +                ret = map_vcpu_info(cd_vcpu, gfn_l,
> +                                    PAGE_OFFSET(d_vcpu->vcpu_info));
> +                if ( ret )
> +                    return ret;
> +            }
> +
> +            copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
> +        }
> +
> +        /* Setup the vCPU runstate area */
> +        if ( !guest_handle_is_null(runstate_guest(d_vcpu)) )
> +        {
> +            runstate_guest(cd_vcpu) = runstate_guest(d_vcpu);
> +            vcpu_runstate_get(cd_vcpu, &runstate);
> +            __copy_to_guest(runstate_guest(cd_vcpu), &runstate, 1);

I just realized there's no need to copy the runstate area contents
here, since they will get copied anyway in schedule_tail before
resuming execution og cd_vcpu as long as runstate_guest is set.

Note that the vcpu_info needs to be copied since it contains event
channel info which is not unconditionally updated on context switch
IIRC.

> +        }
> +
> +        /*
> +         * TODO: to support VMs with PV interfaces copy additional
> +         * settings here, such as PV timers.
> +         */
> +    }
> +
> +    return 0;
> +}
> +
> +static int fork_hap_allocation(struct domain *cd, struct domain *d)
> +{
> +    int rc;
> +    bool preempted;
> +    unsigned long mb = hap_get_allocation(d);
> +
> +    if ( mb == hap_get_allocation(cd) )
> +        return 0;
> +
> +    paging_lock(cd);
> +    rc = hap_set_allocation(cd, mb << (20 - PAGE_SHIFT), &preempted);
> +    paging_unlock(cd);
> +
> +    return preempted ? -ERESTART : rc;
> +}
> +
> +static void copy_tsc(struct domain *cd, struct domain *d)
> +{
> +    uint32_t tsc_mode;
> +    uint32_t gtsc_khz;
> +    uint32_t incarnation;
> +    uint64_t elapsed_nsec;
> +
> +    tsc_get_info(d, &tsc_mode, &elapsed_nsec, &gtsc_khz, &incarnation);
> +    /* Don't bump incarnation on set */
> +    tsc_set_info(cd, tsc_mode, elapsed_nsec, gtsc_khz, incarnation - 1);
> +}
> +
> +static int copy_special_pages(struct domain *cd, struct domain *d)
> +{
> +    mfn_t new_mfn, old_mfn;
> +    struct p2m_domain *p2m = p2m_get_hostp2m(cd);
> +    static const unsigned int params[] =
> +    {
> +        HVM_PARAM_STORE_PFN,
> +        HVM_PARAM_IOREQ_PFN,
> +        HVM_PARAM_BUFIOREQ_PFN,
> +        HVM_PARAM_CONSOLE_PFN
> +    };
> +    unsigned int i;
> +    int rc;
> +
> +    for ( i = 0; i < ARRAY_SIZE(params); i++ )
> +    {
> +        p2m_type_t t;
> +        uint64_t value = 0;
> +        struct page_info *page;
> +
> +        if ( hvm_get_param(cd, params[i], &value) || !value )

Don't you need to use d here instead of cd? You want to check whether
the parent has this parameter set in order to copy it to the child I
think.

With that:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

