Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 436992208F1
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 11:37:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvdpo-0002PR-Dd; Wed, 15 Jul 2020 09:36:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osgb=A2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvdpn-0002Oi-8O
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 09:36:15 +0000
X-Inumbo-ID: 9fe4c7e7-c67e-11ea-93a9-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9fe4c7e7-c67e-11ea-93a9-12813bfff9fa;
 Wed, 15 Jul 2020 09:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594805775;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eAVhxkVPJFov0SlG2bMT+jjb/4wuJ2Q5ALt7SUBTOwA=;
 b=JmWNlT/243wk6jWsyBsJYJ1zqtzOUxH3UcOr//CadZ/hzXiOuYQduXoq
 u2oQa0EqxOARG3bOIiXzaiWtSi3JbO6o01om/3FcRWfRD6nVwTaiF/Oxy
 CLIae4B5m/W+Vv5fgXf7/nt4TmOcf8uei3SK5HR6zb+F29w2MqbeVyQaj I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Un/Fyobl/UYAVxynwhwit+fa0ZWnsYnH9le0Mc4fQg0D/61/UYkxcb8ruMmo6HiixFtSpcT1Qi
 sWXUactz9LAIZ+dG03z/s+Ln1+c+XNc6NH/AMG25Aix2ftrgFxPWdQJobJlIkxLiW/fuBq1SRM
 nYLhaE4Ys1b3Ak8eS9BddkswWL9yzZveiRaRVOYGYftMw/Ek07trSjIswP5wNKOepmR+rOZeou
 qj184Zo3XnFquoCxWgmZZ6fpeFl3EEomn23djO+MjcWmkllPQwFLeXh/SFY4rEIBmE6f9wRbkB
 alE=
X-SBRS: 2.7
X-MesageID: 22418574
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,354,1589256000"; d="scan'208";a="22418574"
Date: Wed, 15 Jul 2020 11:36:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v6 01/11] memory: batch processing in acquire_resource()
Message-ID: <20200715093606.GU7191@Air-de-Roger>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <02415890e4e8211513b495228c790e1d16de767f.1594150543.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02415890e4e8211513b495228c790e1d16de767f.1594150543.git.michal.leszczynski@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 tamas.lengyel@intel.com, Jan
 Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 07, 2020 at 09:39:40PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Allow to acquire large resources by allowing acquire_resource()
> to process items in batches, using hypercall continuation.
> 
> Be aware that this modifies the behavior of acquire_resource
> call with frame_list=NULL. While previously it would return
> the size of internal array (32), with this patch it returns
> the maximal quantity of frames that could be requested at once,
> i.e. UINT_MAX >> MEMOP_EXTENT_SHIFT.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---

FWIW, I think I've also said on a previous version, I would prefer if
the changelog between versions is added to each patch, having it on
the cover letter is not very helpful as I usually care about specific
changes made to each patch.

I've just got one comment that needs addressing below.

>  xen/common/memory.c | 49 ++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 44 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 714077c1e5..eb42f883df 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1046,10 +1046,12 @@ static int acquire_grant_table(struct domain *d, unsigned int id,
>  }
>  
>  static int acquire_resource(
> -    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
> +    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg,
> +    unsigned long *start_extent)
>  {
>      struct domain *d, *currd = current->domain;
>      xen_mem_acquire_resource_t xmar;
> +    uint32_t total_frames;
>      /*
>       * The mfn_list and gfn_list (below) arrays are ok on stack for the
>       * moment since they are small, but if they need to grow in future
> @@ -1069,7 +1071,7 @@ static int acquire_resource(
>          if ( xmar.nr_frames )
>              return -EINVAL;
>  
> -        xmar.nr_frames = ARRAY_SIZE(mfn_list);
> +        xmar.nr_frames = UINT_MAX >> MEMOP_EXTENT_SHIFT;
>  
>          if ( __copy_field_to_guest(arg, &xmar, nr_frames) )
>              return -EFAULT;
> @@ -1077,8 +1079,28 @@ static int acquire_resource(
>          return 0;
>      }
>  
> +    total_frames = xmar.nr_frames;
> +
> +    /* Is the size too large for us to encode a continuation? */
> +    if ( unlikely(xmar.nr_frames > (UINT_MAX >> MEMOP_EXTENT_SHIFT)) )
> +        return -EINVAL;
> +
> +    if ( *start_extent )
> +    {
> +        /*
> +         * Check whether start_extent is in bounds, as this
> +         * value if visible to the calling domain.
> +         */
> +        if ( *start_extent > xmar.nr_frames )
> +            return -EINVAL;
> +
> +        xmar.frame += *start_extent;
> +        xmar.nr_frames -= *start_extent;
> +        guest_handle_add_offset(xmar.frame_list, *start_extent);
> +    }
> +
>      if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
> -        return -E2BIG;
> +        xmar.nr_frames = ARRAY_SIZE(mfn_list);
>  
>      rc = rcu_lock_remote_domain_by_id(xmar.domid, &d);
>      if ( rc )
> @@ -1135,6 +1157,14 @@ static int acquire_resource(
>          }
>      }
>  
> +    if ( !rc )
> +    {
> +        *start_extent += xmar.nr_frames;
> +
> +        if ( *start_extent != total_frames )
> +            rc = -ERESTART;
> +    }
> +
>   out:
>      rcu_unlock_domain(d);
>  
> @@ -1599,8 +1629,17 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  #endif
>  
>      case XENMEM_acquire_resource:
> -        rc = acquire_resource(
> -            guest_handle_cast(arg, xen_mem_acquire_resource_t));
> +        do {
> +            rc = acquire_resource(
> +                guest_handle_cast(arg, xen_mem_acquire_resource_t),
> +                &start_extent);

I think it would be interesting from a performance PoV to move the
xmar copy_from_guest here, so that each call to acquire_resource
in the loop doesn't need to perform a copy from guest. That's
more relevant for translated callers, where a copy_from_guest involves
a guest page table and a p2m walk.

> +
> +            if ( hypercall_preempt_check() )

You are missing a rc == -ERESTART check here, you don't want to encode
a continuation if rc is different than -ERESTART AFAICT.

Thanks, Roger.

