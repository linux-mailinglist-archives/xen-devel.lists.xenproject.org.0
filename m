Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8121121541F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 10:43:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsMi5-0003ZE-BM; Mon, 06 Jul 2020 08:42:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jsMi4-0003Z9-8B
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 08:42:44 +0000
X-Inumbo-ID: a7ff5e12-bf64-11ea-bb8b-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7ff5e12-bf64-11ea-bb8b-bc764e2007e4;
 Mon, 06 Jul 2020 08:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594024962;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2J0WmcZk3jwW/nK+rCzs6kJlwALEZ725s3mSmlqGcMw=;
 b=gFn133RzSvKkrPbydcL7NdgfZ62cdhaN9um9IZ61KOcg/NU62ib2WUAn
 qL3BahrLB6PGxEdf31hQ269AceaFUGii0OsfBskMv+s+rJoVnIiyk0vY/
 EskJfSi03YfNFsyN0FJuUohhcrSIawc27r/qCV38FPE5h+NBjXuYBZrwb g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: JC14DaW4V9aEFbDaIeCwGhKIavvvaawRBxEfABm6hD7BGJ+Uyxl1Y8CPriGJEYLsKeorhhJX/g
 7ZavBXeM1jTgVB/8pNjquSvOCURQnZpFM5KHt7AhzIeze+DaWBtjnawQJdXNZ9YgtuecrwlbzS
 3MvDGFRDWtWFd+O6coskgvF0023e016bilM96YyjgWvvs4pbKuxxl8T9PChHNaxwrCUUwHcy9S
 oU9/eRCw5cHyVumlEmShK6MmUZWcNEEL9e5sPpavxhEylPXbbbJ7ud2olYVT4KuVPTvwHlRSOg
 UsU=
X-SBRS: 2.7
X-MesageID: 21864110
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,318,1589256000"; d="scan'208";a="21864110"
Date: Mon, 6 Jul 2020 10:42:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v5 06/11] x86/hvm: processor trace interface in HVM
Message-ID: <20200706084234.GB735@Air-de-Roger>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
 <a4833c8168e287f0caf1dc6f16ec5c054bd88b0a.1593974333.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4833c8168e287f0caf1dc6f16ec5c054bd88b0a.1593974333.git.michal.leszczynski@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
 tamas.lengyel@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Jul 05, 2020 at 08:54:59PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Implement necessary changes in common code/HVM to support
> processor trace features. Define vmtrace_pt_* API and
> implement trace buffer allocation/deallocation in common
> code.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  xen/arch/x86/domain.c         | 19 +++++++++++++++++++
>  xen/common/domain.c           | 19 +++++++++++++++++++
>  xen/include/asm-x86/hvm/hvm.h | 20 ++++++++++++++++++++
>  xen/include/xen/sched.h       |  4 ++++
>  4 files changed, 62 insertions(+)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index fee6c3931a..79c9794408 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2199,6 +2199,25 @@ int domain_relinquish_resources(struct domain *d)
>                  altp2m_vcpu_disable_ve(v);
>          }
>  
> +        for_each_vcpu ( d, v )
> +        {
> +            unsigned int i;
> +
> +            if ( !v->vmtrace.pt_buf )
> +                continue;
> +
> +            for ( i = 0; i < (v->domain->vmtrace_pt_size >> PAGE_SHIFT); i++ )
> +            {
> +                struct page_info *pg = mfn_to_page(
> +                    mfn_add(page_to_mfn(v->vmtrace.pt_buf), i));
> +                if ( (pg->count_info & PGC_count_mask) != 1 )
> +                    return -EBUSY;
> +            }
> +
> +            free_domheap_pages(v->vmtrace.pt_buf,
> +                get_order_from_bytes(v->domain->vmtrace_pt_size));

This is racy as a control domain could take a reference between the
check and the freeing.

> +        }
> +
>          if ( is_pv_domain(d) )
>          {
>              for_each_vcpu ( d, v )
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 25d3359c5b..f480c4e033 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -137,6 +137,21 @@ static void vcpu_destroy(struct vcpu *v)
>      free_vcpu_struct(v);
>  }
>  
> +static int vmtrace_alloc_buffers(struct vcpu *v)
> +{
> +    struct page_info *pg;
> +    uint64_t size = v->domain->vmtrace_pt_size;
> +
> +    pg = alloc_domheap_pages(v->domain, get_order_from_bytes(size),
> +                             MEMF_no_refcount);
> +
> +    if ( !pg )
> +        return -ENOMEM;
> +
> +    v->vmtrace.pt_buf = pg;
> +    return 0;
> +}

I think we already agreed that you would use the same model as ioreq
servers, where a reference is taken on allocation and then the pages
are not explicitly freed on domain destruction and put_page_and_type
is used. Is there some reason why that model doesn't work in this
case?

If not, please see hvm_alloc_ioreq_mfn and hvm_free_ioreq_mfn.

Roger.

