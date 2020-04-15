Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C17C91A981F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 11:13:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOe6R-0004As-K9; Wed, 15 Apr 2020 09:13:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOe6P-0004An-9U
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 09:13:01 +0000
X-Inumbo-ID: 4da57f60-7ef9-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4da57f60-7ef9-11ea-b4f4-bc764e2007e4;
 Wed, 15 Apr 2020 09:13:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B7BDAAE48;
 Wed, 15 Apr 2020 09:12:58 +0000 (UTC)
Subject: Re: [PATCH 01/12] xen: introduce xen_dom_flags
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aede4742-03e1-e47b-354a-5475f63fff86@suse.com>
Date: Wed, 15 Apr 2020 11:12:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415010255.10081-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.04.2020 03:02, Stefano Stabellini wrote:
> We are passing an extra special boolean flag at domain creation to
> specify whether we want to the domain to be privileged (i.e. dom0) or
> not. Another flag will be introduced later in this series.
> 
> Introduce a new struct xen_dom_flags and move the privileged flag to it.
> Other flags will be added to struct xen_dom_flags.

I'm unsure whether introducing a 2nd structure is worth it here.
We could as well define some internal-use-only flags for
struct xen_domctl_createdomain's respective field.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -529,7 +529,8 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>  }
>  
>  int arch_domain_create(struct domain *d,
> -                       struct xen_domctl_createdomain *config)
> +                       struct xen_domctl_createdomain *config,
> +                       struct xen_dom_flags *flags)

const (also elsewhere)?

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -706,6 +706,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>          .max_maptrack_frames = -1,
>      };
>      const char *hypervisor_name;
> +    struct xen_dom_flags flags = { !pv_shim };

Here and elsewhere please use field designators right away, even if
there's only a single field now.

> @@ -363,7 +363,7 @@ struct domain *domain_create(domid_t domid,
>      ASSERT(is_system_domain(d) ? config == NULL : config != NULL);
>  
>      /* Sort out our idea of is_control_domain(). */
> -    d->is_privileged = is_priv;
> +    d->is_privileged =  flags ? flags->is_priv : false;

Stray double blanks.

> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -364,6 +364,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>      bool_t copyback = 0;
>      struct xen_domctl curop, *op = &curop;
>      struct domain *d;
> +    struct xen_dom_flags flags ={ false };

Missing blank.

> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -63,8 +63,13 @@ void arch_vcpu_destroy(struct vcpu *v);
>  int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
>  void unmap_vcpu_info(struct vcpu *v);
>  
> +struct xen_dom_flags {
> +    bool is_priv;

Use a single bit bitfield instead? May even want to consider passing
this struct by value then.

Jan

