Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2121B038E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 09:57:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQRIg-0003Gn-Jy; Mon, 20 Apr 2020 07:57:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2FAk=6E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jQRIe-0003Gi-Lk
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 07:57:04 +0000
X-Inumbo-ID: 853aadc4-82dc-11ea-83d8-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 853aadc4-82dc-11ea-83d8-bc764e2007e4;
 Mon, 20 Apr 2020 07:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587369423;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z4oFYSLmLzGpfaUyWAYlBZkAsjCQNOvHHSOxWRX6LIc=;
 b=VfGb6S8rMTRyMqhGnmqFFI1P7drrzLGoNy+rByqZke70lRHFRHSNM2GY
 nvojSjXpqsGYBcrgkd7h/tf8t3aRox57LLxn+4W9XpAHmhFeIWuA4shVv
 LTcxkyXKxeiYO/tHhMg3KNk17PgduuBFNvNz+Ua6vRJLjukcqw0KGfl+Y w=;
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
IronPort-SDR: OR08X66S/ezZrfrZorqmcTtz63ZcB2fnG+hMugYldHT+ANeyYyVNjEU+IqEY9Dok+4jZC0A8gu
 nfzpGiznroV/B/z117MWjTy07bdusUgOX/qht4JcGe0wJvo1frbHCanQXHeRkLcZrHzAfUdpGd
 lvpaQ9cJqedOXwwl3jCYrL3kYAkulu8c1vmYOeQm5DxUOQ/CsdUSGuQKanXZ3pYthvSNsU6ItO
 yt+0UihufUhVWuF6IYAbWRvTz1Pi+eA4OeAOZfWr48GNOe4mZ+FitD4PEQZvA4KJH+1SOu+jqX
 9lQ=
X-SBRS: 2.7
X-MesageID: 16166357
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,406,1580792400"; d="scan'208";a="16166357"
Date: Mon, 20 Apr 2020 09:56:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH v15 2/3] mem_sharing: allow forking domain with IOMMU
 enabled
Message-ID: <20200420075655.GR28601@Air-de-Roger>
References: <cover.1587142844.git.tamas.lengyel@intel.com>
 <0be7501ace42d856b344828755ece18659dabd33.1587142844.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <0be7501ace42d856b344828755ece18659dabd33.1587142844.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Apr 17, 2020 at 10:06:32AM -0700, Tamas K Lengyel wrote:
> The memory sharing subsystem by default doesn't allow a domain to share memory
> if it has an IOMMU active for obvious security reasons. However, when fuzzing a
> VM fork, the same security restrictions don't necessarily apply. While it makes
> no sense to try to create a full fork of a VM that has an IOMMU attached as only
> one domain can own the pass-through device at a time, creating a shallow fork
> without a device model is still very useful for fuzzing kernel-mode drivers.
> 
> By allowing the parent VM to initialize the kernel-mode driver with a real
> device that's pass-through, the driver can enter into a state more suitable for
                ^ passed
> fuzzing. Some of these initialization steps are quite complex and are easier to
> perform when a real device is present. After the initialization, shallow forks
> can be utilized for fuzzing code-segments in the device driver that don't
> directly interact with the device.

If I understand this correctly, the forked VM won't have an IOMMU
setup, and the only domain allowed to interact with the device would
be the parent?

> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> ---
>  xen/arch/x86/mm/mem_sharing.c | 18 ++++++++++++------
>  xen/include/public/memory.h   |  4 +++-
>  2 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index 4b31a8b8f6..a5063d5992 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1430,7 +1430,8 @@ static int range_share(struct domain *d, struct domain *cd,
>      return rc;
>  }
>  
> -static inline int mem_sharing_control(struct domain *d, bool enable)
> +static inline int mem_sharing_control(struct domain *d, bool enable,
> +                                      bool allow_iommu)
>  {
>      if ( enable )
>      {
> @@ -1440,7 +1441,7 @@ static inline int mem_sharing_control(struct domain *d, bool enable)
>          if ( unlikely(!hap_enabled(d)) )
>              return -ENODEV;
>  
> -        if ( unlikely(is_iommu_enabled(d)) )
> +        if (unlikely(!allow_iommu && is_iommu_enabled(d)) )

Coding style (missing space)

>              return -EXDEV;
>      }
>  
> @@ -1827,7 +1828,8 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
>      if ( rc )
>          goto out;
>  
> -    if ( !mem_sharing_enabled(d) && (rc = mem_sharing_control(d, true)) )
> +    if ( !mem_sharing_enabled(d) &&
> +         (rc = mem_sharing_control(d, true, false)) )
>          return rc;
>  
>      switch ( mso.op )
> @@ -2063,9 +2065,10 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
>      case XENMEM_sharing_op_fork:
>      {
>          struct domain *pd;
> +        bool allow_iommu;
>  
>          rc = -EINVAL;
> -        if ( mso.u.fork.pad[0] || mso.u.fork.pad[1] || mso.u.fork.pad[2] )
> +        if ( mso.u.fork.pad[0] || mso.u.fork.pad[1] )
>              goto out;
>  
>          rc = rcu_lock_live_remote_domain_by_id(mso.u.fork.parent_domain,
> @@ -2080,7 +2083,10 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
>              goto out;
>          }
>  
> -        if ( !mem_sharing_enabled(pd) && (rc = mem_sharing_control(pd, true)) )
> +        allow_iommu = mso.u.fork.flags & XENMEM_FORK_WITH_IOMMU_ALLOWED;

I'm not sure whether it is worth to extract the flags into booleans at
this level. As you add more flags it might make sense to just pass the
whole flags field to mem_sharing_control?

mem_sharing_memop itself doesn't need to know which flags are
specified.

> +
> +        if ( !mem_sharing_enabled(pd) &&
> +             (rc = mem_sharing_control(pd, true, allow_iommu)) )
>          {
>              rcu_unlock_domain(pd);
>              goto out;
> @@ -2138,7 +2144,7 @@ int mem_sharing_domctl(struct domain *d, struct xen_domctl_mem_sharing_op *mec)
>      switch ( mec->op )
>      {
>      case XEN_DOMCTL_MEM_SHARING_CONTROL:
> -        rc = mem_sharing_control(d, mec->u.enable);
> +        rc = mem_sharing_control(d, mec->u.enable, false);
>          break;
>  
>      default:
> diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> index d36d64b8dc..1d2149def3 100644
> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -536,7 +536,9 @@ struct xen_mem_sharing_op {
>          } debug;
>          struct mem_sharing_op_fork {      /* OP_FORK */
>              domid_t parent_domain;        /* IN: parent's domain id */
> -            uint16_t pad[3];              /* Must be set to 0 */
> +#define XENMEM_FORK_WITH_IOMMU_ALLOWED 1  /* Allow forking domain with IOMMU */

Since this is a flags field, can you express this is as: (1u << 0).

> +            uint16_t flags;               /* IN: optional settings */
> +            uint16_t pad[2];              /* Must be set to 0 */

Nit: padding can be made a uint32_t now instead of an array of two
uint16_t.

Or add an uint16_t between parent_domain and flags and make flags an
uint32_t.

Thanks, Roger.

