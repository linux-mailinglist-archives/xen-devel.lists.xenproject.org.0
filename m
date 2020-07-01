Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C638F2108E7
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 12:06:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqZdB-0008Fu-Ao; Wed, 01 Jul 2020 10:06:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4aC=AM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jqZd9-0008Fp-Ev
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 10:06:15 +0000
X-Inumbo-ID: 7ea65948-bb82-11ea-b7bb-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ea65948-bb82-11ea-b7bb-bc764e2007e4;
 Wed, 01 Jul 2020 10:06:14 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: mnfIwy5AWaf4fvbkpyhbEDNJWDx7drEi6+8QkIaPLqBI3NDQ68oxsoisRnHxLeUCNN/lgu0UOH
 f6GZzXjcPKI1vJwP2ltqTVVbGej/mXNw914Q2Zd0jf0wGjgEc9pXhsJJ0fRP5senQHAEeiADTX
 EtgkZmSkncvPSmV6ZxRuIaYi62R3g0omQD4a8OXFb5QFVc/SVB8c6x1DW18BbZTyKIM17UyTeG
 BXSDnoHmed/sNYOPxlR3vDOUyw1QWHO/0hWIaEChxNVnVM5ByB5y+NU3jauj/bFrWRyLnAdmce
 Zxk=
X-SBRS: 2.7
X-MesageID: 22191019
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,299,1589256000"; d="scan'208";a="22191019"
Date: Wed, 1 Jul 2020 12:05:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v4 03/10] tools/libxl: add vmtrace_pt_size parameter
Message-ID: <20200701100552.GP735@Air-de-Roger>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <5f4f4b1afa432258daff43f2dc8119b6a441fff4.1593519420.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f4f4b1afa432258daff43f2dc8119b6a441fff4.1593519420.git.michal.leszczynski@cert.pl>
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
Cc: Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com, Jan
 Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 30, 2020 at 02:33:46PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Allow to specify the size of per-vCPU trace buffer upon
> domain creation. This is zero by default (meaning: not enabled).
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  docs/man/xl.cfg.5.pod.in             | 10 ++++++++++
>  tools/golang/xenlight/helpers.gen.go |  2 ++
>  tools/golang/xenlight/types.gen.go   |  1 +
>  tools/libxl/libxl.h                  |  8 ++++++++
>  tools/libxl/libxl_create.c           |  1 +
>  tools/libxl/libxl_types.idl          |  2 ++
>  tools/xl/xl_parse.c                  | 20 ++++++++++++++++++++
>  xen/common/domain.c                  | 12 ++++++++++++
>  xen/include/public/domctl.h          |  1 +
>  9 files changed, 57 insertions(+)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 0532739c1f..78f434b722 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -278,6 +278,16 @@ memory=8096 will report significantly less memory available for use
>  than a system with maxmem=8096 memory=8096 due to the memory overhead
>  of having to track the unused pages.
>  
> +=item B<vmtrace_pt_size=BYTES>
> +
> +Specifies the size of processor trace buffer that would be allocated
> +for each vCPU belonging to this domain. Disabled (i.e. B<vmtrace_pt_size=0>
> +by default. This must be set to non-zero value in order to be able to
> +use processor tracing features with this domain.
> +
> +B<NOTE>: The size value must be between 4 kB and 4 GB and it must

I think the minimum value is 8kB, since 4kB would be order 0, which
is used to signal that the feature is disabled?

> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 61b4ef7b7e..4eba224590 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1861,6 +1861,26 @@ void parse_config_data(const char *config_source,
>          }
>      }
>  
> +    if (!xlu_cfg_get_long(config, "vmtrace_pt_size", &l, 1) && l) {
> +        int32_t shift = 0;

unsigned int? I don't think there's a reason for this to be a fixed
width signed integer.

> +
> +        if (l & (l - 1))
> +        {
> +            fprintf(stderr, "ERROR: pt buffer size must be a power of 2\n");
> +            exit(1);
> +        }
> +
> +        while (l >>= 1) ++shift;
> +
> +        if (shift <= XEN_PAGE_SHIFT)
> +        {
> +            fprintf(stderr, "ERROR: too small pt buffer\n");
> +            exit(1);
> +        }
> +
> +        b_info->vmtrace_pt_order = shift - XEN_PAGE_SHIFT;
> +    }
> +
>      if (!xlu_cfg_get_list(config, "ioports", &ioports, &num_ioports, 0)) {
>          b_info->num_ioports = num_ioports;
>          b_info->ioports = calloc(num_ioports, sizeof(*b_info->ioports));
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 0a33e0dfd6..27dcfbac8c 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -338,6 +338,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> +    if ( config->vmtrace_pt_order && !vmtrace_supported )
> +    {
> +        dprintk(XENLOG_INFO, "Processor tracing is not supported\n");
> +        return -EINVAL;
> +    }
> +
>      return arch_sanitise_domain_config(config);
>  }
>  
> @@ -443,6 +449,12 @@ struct domain *domain_create(domid_t domid,
>          d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
>  
>          radix_tree_init(&d->pirq_tree);
> +
> +        if ( config->vmtrace_pt_order )
> +        {
> +            uint32_t shift_val = config->vmtrace_pt_order + PAGE_SHIFT;
> +            d->vmtrace_pt_size = (1ULL << shift_val);

I don't think the vmtrace_pt_size domain field has been introduced
yet?

Please check that each patch builds on it's own, or else we would
break bisectability of the tree.

Also I would consider just storing this directly as an order, there's
no reason to convert it back to a size?

Thanks, Roger.

