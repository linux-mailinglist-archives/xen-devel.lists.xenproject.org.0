Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 362A5195865
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 14:52:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHpNv-0006s4-PJ; Fri, 27 Mar 2020 13:50:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xJX5=5M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHpNv-0006rx-7h
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 13:50:55 +0000
X-Inumbo-ID: fa06eb12-7031-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa06eb12-7031-11ea-bec1-bc764e2007e4;
 Fri, 27 Mar 2020 13:50:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1AE08AC53;
 Fri, 27 Mar 2020 13:50:52 +0000 (UTC)
To: julien@xen.org
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-18-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5a5e6da9-ddef-ee4f-fb11-99e3e2b5ef63@suse.com>
Date: Fri, 27 Mar 2020 14:50:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200322161418.31606-18-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 17/17] xen: Switch parameter in
 get_page_from_gfn to use typesafe gfn
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.03.2020 17:14, julien@xen.org wrote:
> --- a/xen/arch/x86/hvm/domain.c
> +++ b/xen/arch/x86/hvm/domain.c
> @@ -296,8 +296,10 @@ int arch_set_info_hvm_guest(struct vcpu *v, const vcpu_hvm_context_t *ctx)
>      if ( hvm_paging_enabled(v) && !paging_mode_hap(v->domain) )
>      {
>          /* Shadow-mode CR3 change. Check PDBR and update refcounts. */
> -        struct page_info *page = get_page_from_gfn(v->domain,
> -                                 v->arch.hvm.guest_cr[3] >> PAGE_SHIFT,
> +        struct page_info *page;
> +
> +        page = get_page_from_gfn(v->domain,
> +                                 gaddr_to_gfn(v->arch.hvm.guest_cr[3]),

My earlier comment on this remains - I thing this conversion makes
the problem this expression has more hidden than with the shift.
This would better use a gfn_from_cr3() helper (or whatever it'll
be that it gets named). Same elsewhere in this patch then.

> @@ -2363,7 +2364,7 @@ int hvm_set_cr3(unsigned long value, bool may_defer)
>      {
>          /* Shadow-mode CR3 change. Check PDBR and update refcounts. */
>          HVM_DBG_LOG(DBG_LEVEL_VMMU, "CR3 value = %lx", value);
> -        page = get_page_from_gfn(v->domain, value >> PAGE_SHIFT,
> +        page = get_page_from_gfn(v->domain, cr3_to_gfn(value),

Oh, seeing this I recall Paul did point out the above already.

> @@ -508,7 +508,7 @@ int evtchn_fifo_init_control(struct evtchn_init_control *init_control)
>  {
>      struct domain *d = current->domain;
>      uint32_t vcpu_id;
> -    uint64_t gfn;
> +    gfn_t gfn;
>      uint32_t offset;
>      struct vcpu *v;
>      int rc;
> @@ -516,7 +516,7 @@ int evtchn_fifo_init_control(struct evtchn_init_control *init_control)
>      init_control->link_bits = EVTCHN_FIFO_LINK_BITS;
>  
>      vcpu_id = init_control->vcpu;
> -    gfn     = init_control->control_gfn;
> +    gfn     = _gfn(init_control->control_gfn);

There's silent truncation here now for Arm32, afaict. Are we really
okay with this?

Jan

