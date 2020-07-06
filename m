Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CFC2159BD
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 16:40:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsSGx-0000lw-8J; Mon, 06 Jul 2020 14:39:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jsSGv-0000lr-NK
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 14:39:05 +0000
X-Inumbo-ID: 703f0018-bf96-11ea-bb8b-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 703f0018-bf96-11ea-bb8b-bc764e2007e4;
 Mon, 06 Jul 2020 14:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594046343;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=v0e5AF/j7e9kwAWUc2BvTLeCZE2YrBNYU2sWxNQcAfQ=;
 b=RjO3rmson9mumnCBjhH8ttwu++ImYV2lz6/JUqiAHMODIMUD7KSVP6Pu
 qgqbGt2j08p+XTvdnLItBzjr97WkHJx3PCQPBU6LpOvy5oan5AYwAh+CB
 ccol++p7297KHv4YceJGqu7q/YSwZOFEwQVJsovfF0hpPLwvccfKYACYe 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: LZ5sHd8nyg+LhK+nzup6owCB8qV6HETp99CLLAYfvquZfj+dLTu8mgBOx/W0F0pNNYwSDThEs0
 eI1mMoK6xcQDhrSXriaH9w5wvK95h2JwLM8FO8mn83AsPUDABIztSxQupvFMD+WJ5j6dO48j9R
 zgPuK3j65D5/wrrQPcZWyNDtEDBpPAf3WevB3b5bNqD3MzijO/WxBZ1IyGUR0VFdBT/DAXT+RV
 cCKA8uUIerEv/dvwCP/xdRQyJ+uh8/py88laOEGd8xCLL0mX9qs6M0B3Yp5a8ssenANbKvSN9i
 OW4=
X-SBRS: 2.7
X-MesageID: 22504755
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,320,1589256000"; d="scan'208";a="22504755"
Date: Mon, 6 Jul 2020 16:38:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v5 06/11] x86/hvm: processor trace interface in HVM
Message-ID: <20200706143853.GA7191@Air-de-Roger>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
 <a4833c8168e287f0caf1dc6f16ec5c054bd88b0a.1593974333.git.michal.leszczynski@cert.pl>
 <20200706084234.GB735@Air-de-Roger>
 <212702848.20024300.1594030142855.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <212702848.20024300.1594030142855.JavaMail.zimbra@cert.pl>
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 tamas lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei kang <luwei.kang@intel.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jul 06, 2020 at 12:09:02PM +0200, Michał Leszczyński wrote:
> ----- 6 lip 2020 o 10:42, Roger Pau Monné roger.pau@citrix.com napisał(a):
> 
> > On Sun, Jul 05, 2020 at 08:54:59PM +0200, Michał Leszczyński wrote:
> >> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> >> 
> >> Implement necessary changes in common code/HVM to support
> >> processor trace features. Define vmtrace_pt_* API and
> >> implement trace buffer allocation/deallocation in common
> >> code.
> >> 
> >> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> >> ---
> >>  xen/arch/x86/domain.c         | 19 +++++++++++++++++++
> >>  xen/common/domain.c           | 19 +++++++++++++++++++
> >>  xen/include/asm-x86/hvm/hvm.h | 20 ++++++++++++++++++++
> >>  xen/include/xen/sched.h       |  4 ++++
> >>  4 files changed, 62 insertions(+)
> >> 
> >> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> >> index fee6c3931a..79c9794408 100644
> >> --- a/xen/arch/x86/domain.c
> >> +++ b/xen/arch/x86/domain.c
> >> @@ -2199,6 +2199,25 @@ int domain_relinquish_resources(struct domain *d)
> >>                  altp2m_vcpu_disable_ve(v);
> >>          }
> >>  
> >> +        for_each_vcpu ( d, v )
> >> +        {
> >> +            unsigned int i;
> >> +
> >> +            if ( !v->vmtrace.pt_buf )
> >> +                continue;
> >> +
> >> +            for ( i = 0; i < (v->domain->vmtrace_pt_size >> PAGE_SHIFT); i++ )
> >> +            {
> >> +                struct page_info *pg = mfn_to_page(
> >> +                    mfn_add(page_to_mfn(v->vmtrace.pt_buf), i));
> >> +                if ( (pg->count_info & PGC_count_mask) != 1 )
> >> +                    return -EBUSY;
> >> +            }
> >> +
> >> +            free_domheap_pages(v->vmtrace.pt_buf,
> >> +                get_order_from_bytes(v->domain->vmtrace_pt_size));
> > 
> > This is racy as a control domain could take a reference between the
> > check and the freeing.
> > 
> >> +        }
> >> +
> >>          if ( is_pv_domain(d) )
> >>          {
> >>              for_each_vcpu ( d, v )
> >> diff --git a/xen/common/domain.c b/xen/common/domain.c
> >> index 25d3359c5b..f480c4e033 100644
> >> --- a/xen/common/domain.c
> >> +++ b/xen/common/domain.c
> >> @@ -137,6 +137,21 @@ static void vcpu_destroy(struct vcpu *v)
> >>      free_vcpu_struct(v);
> >>  }
> >>  
> >> +static int vmtrace_alloc_buffers(struct vcpu *v)
> >> +{
> >> +    struct page_info *pg;
> >> +    uint64_t size = v->domain->vmtrace_pt_size;
> >> +
> >> +    pg = alloc_domheap_pages(v->domain, get_order_from_bytes(size),
> >> +                             MEMF_no_refcount);
> >> +
> >> +    if ( !pg )
> >> +        return -ENOMEM;
> >> +
> >> +    v->vmtrace.pt_buf = pg;
> >> +    return 0;
> >> +}
> > 
> > I think we already agreed that you would use the same model as ioreq
> > servers, where a reference is taken on allocation and then the pages
> > are not explicitly freed on domain destruction and put_page_and_type
> > is used. Is there some reason why that model doesn't work in this
> > case?
> > 
> > If not, please see hvm_alloc_ioreq_mfn and hvm_free_ioreq_mfn.
> > 
> > Roger.
> 
> 
> Ok, I've got it, will do. Thanks for pointing out the examples.
> 
> 
> One thing that is confusing to me is that I don't get what is
> the meaning of MEMF_no_refcount flag.

That flag prevents the memory from being counted towards the amount of
memory assigned to the domain. You want it that way so that trace
buffers are not accounted as part of the memory assigned to the
domain.

You then need to get a (extra) reference to the pages (there's always
the 'allocated' reference AFAICT) so that when the last reference is
dropped (either by the domain being destroyed or the memory being
unmapped from the control domain) it will be freed.

> In the hvm_{alloc,free}_ioreq_mfn the memory is allocated
> explicitly but freed just by putting out the reference, so
> I guess it's automatically detected that the refcount dropped to 0
> and the page should be freed?

Yes, put_page_alloc_ref will remove the allocated flag and then when
the last reference is dropped the page will be freed.

> If so, why the flag is named "no refcount"?

I'm not sure about the naming, but you can get references to pages
allocated as MEMF_no_refcount, and change their types. They are
however not accounted towards the memory usage of a domain.

Roger.

