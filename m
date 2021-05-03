Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD973713BA
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 12:43:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121502.229178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldW2j-0007Tq-9D; Mon, 03 May 2021 10:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121502.229178; Mon, 03 May 2021 10:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldW2j-0007TP-67; Mon, 03 May 2021 10:43:13 +0000
Received: by outflank-mailman (input) for mailman id 121502;
 Mon, 03 May 2021 10:43:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldW2h-0007TH-Mt
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 10:43:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b55a956-e558-4f28-9942-fda32340bee3;
 Mon, 03 May 2021 10:43:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76B58AB64;
 Mon,  3 May 2021 10:43:09 +0000 (UTC)
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
X-Inumbo-ID: 4b55a956-e558-4f28-9942-fda32340bee3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620038589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=07thARZPh4LASF5qfa0CAKK7il3OpXViMHivwWcOe1Q=;
	b=B03CS6YsWqi7pHjTSW6FhofGyRszUh0qXggQEJdhzQ2LIzliHfKzeG4B/sbVWtLe/hSmLY
	6zAeRao4263VuUR/GKZ785YYXINyoSSnzYcrEJHH+EqcbSRrBS/3166MmyFy6b+rIA4aDP
	8si/sJFf/dFfvLl0u9T023BUD723ILY=
Subject: Re: [PATCH v3 07/13] libs/guest: obtain a compatible cpu policy from
 two input ones
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-8-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <838e358d-5707-0f34-c8fe-64e29f000a69@suse.com>
Date: Mon, 3 May 2021 12:43:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210430155211.3709-8-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.04.2021 17:52, Roger Pau Monne wrote:
> Introduce a helper to obtain a compatible cpu policy based on two
> input cpu policies. Currently this is done by and'ing all CPUID
> feature leaves and MSR entries, except for MSR_ARCH_CAPABILITIES which
> has the RSBA bit or'ed.
> 
> The _AC macro is pulled from libxl_internal.h into xen-tools/libs.h
> since it's required in order to use the msr-index.h header.
> 
> Note there's no need to place this helper in libx86, since the
> calculation of a compatible policy shouldn't be done from the
> hypervisor.
> 
> No callers of the interface introduced.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v2:
>  - Add some comments.
>  - Remove stray double semicolon.
>  - AND all 0x7 subleaves (except 0.EAX).
>  - Explicitly handle MSR indexes in a switch statement.
>  - Error out when an unhandled MSR is found.
>  - Add handling of leaf 0x80000021.
> 
> Changes since v1:
>  - Only AND the feature parts of cpuid.
>  - Use a binary search to find the matching leaves and msr entries.
>  - Remove default case from MSR level function.
> ---
>  tools/include/xen-tools/libs.h    |   5 ++
>  tools/include/xenctrl.h           |   4 +
>  tools/libs/guest/xg_cpuid_x86.c   | 137 ++++++++++++++++++++++++++++++
>  tools/libs/light/libxl_internal.h |   2 -
>  4 files changed, 146 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/include/xen-tools/libs.h b/tools/include/xen-tools/libs.h
> index a16e0c38070..b9e89f9a711 100644
> --- a/tools/include/xen-tools/libs.h
> +++ b/tools/include/xen-tools/libs.h
> @@ -63,4 +63,9 @@
>  #define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
>  #endif
>  
> +#ifndef _AC
> +#define __AC(X,Y)   (X##Y)
> +#define _AC(X,Y)    __AC(X,Y)
> +#endif
> +
>  #endif	/* __XEN_TOOLS_LIBS__ */
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 5f699c09509..c41d794683c 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2622,6 +2622,10 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
>  /* Compatibility calculations. */
>  bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
>                                   const xc_cpu_policy_t guest);
> +int xc_cpu_policy_calc_compatible(xc_interface *xch,
> +                                  const xc_cpu_policy_t p1,
> +                                  const xc_cpu_policy_t p2,
> +                                  xc_cpu_policy_t out);
>  
>  int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
>  int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> index 6b8bae00334..be2056469aa 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -32,6 +32,7 @@ enum {
>  #include <xen/arch-x86/cpufeatureset.h>
>  };
>  
> +#include <xen/asm/msr-index.h>
>  #include <xen/asm/x86-vendors.h>
>  
>  #include <xen/lib/x86/cpu-policy.h>
> @@ -949,3 +950,139 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
>  
>      return false;
>  }
> +
> +static bool level_msr(const xen_msr_entry_t *e1, const xen_msr_entry_t *e2,
> +                      xen_msr_entry_t *out)
> +{
> +    *out = (xen_msr_entry_t){ .idx = e1->idx };
> +
> +    switch ( e1->idx )
> +    {
> +    case MSR_INTEL_PLATFORM_INFO:
> +        out->val = e1->val & e2->val;
> +        return true;
> +
> +    case MSR_ARCH_CAPABILITIES:
> +        out->val = e1->val & e2->val;
> +        /*
> +         * Set RSBA if present on any of the input values to notice the guest
> +         * might run on vulnerable hardware at some point.
> +         */
> +        out->val |= (e1->val | e2->val) & ARCH_CAPS_RSBA;
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
> +/* Only level featuresets so far. */

I have to admit that I don't think I see all the implications from
this implementation restriction. All other leaves get dropped by
the caller, but it's not clear to me what this means wrt what the
guest is ultimately going to get to see.

> +static bool level_leaf(const xen_cpuid_leaf_t *l1, const xen_cpuid_leaf_t *l2,
> +                       xen_cpuid_leaf_t *out)
> +{
> +    *out = (xen_cpuid_leaf_t){
> +        .leaf = l1->leaf,
> +        .subleaf = l2->subleaf,

Since ->leaf and ->subleaf ought to match anyway, I think it would
look less odd if both initializers were taken from consistent source.

> +    };
> +
> +    switch ( l1->leaf )
> +    {
> +    case 0x1:
> +    case 0x80000001:
> +        out->c = l1->c & l2->c;
> +        out->d = l1->d & l2->d;
> +        return true;
> +
> +    case 0xd:
> +        if ( l1->subleaf != 1 )
> +            break;
> +        /*
> +         * Only take Da1 into account, the rest of subleaves will be dropped
> +         * and recalculated by recalculate_xstate.
> +         */
> +        out->a = l1->a & l2->a;
> +        return true;
> +
> +    case 0x7:
> +        if ( l1->subleaf )
> +            /* subleaf 0 EAX contains the max subleaf count. */
> +            out->a = l1->a & l2->a;

        else
            out->a = min(l1->a, l2->a);

? Or is the result from here then further passed to
x86_cpuid_policy_shrink_max_leaves() (not visible from this patch)?
(If not, the same would apply to all other multi-subleaf leaves.)

> +        out->b = l1->b & l2->b;
> +        out->c = l1->c & l2->c;
> +        out->d = l1->d & l2->d;
> +        return true;
> +
> +    case 0x80000007:
> +        out->d = l1->d & l2->d;
> +        return true;
> +
> +    case 0x80000008:
> +        out->b = l1->b & l2->b;
> +        return true;
> +
> +    case 0x80000021:
> +        out->a = l1->a & l2->a;
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
> +int xc_cpu_policy_calc_compatible(xc_interface *xch,
> +                                  const xc_cpu_policy_t p1,
> +                                  const xc_cpu_policy_t p2,
> +                                  xc_cpu_policy_t out)

I have to admit that I find these two "const" misleading here. You
don't equally constify the other two parameters (which would e.g. be
xc_interface *const xch), and I don't think doing so is common
practice elsewhere. And what p1 and p2 point to is specifically non-
const (and cannot be const), due to ...

> +{
> +    unsigned int nr_leaves, nr_msrs, i, index;
> +    unsigned int p1_nr_leaves, p2_nr_leaves;
> +    unsigned int p1_nr_entries, p2_nr_entries;
> +    int rc;
> +
> +    p1_nr_leaves = p2_nr_leaves = ARRAY_SIZE(p1->leaves);
> +    p1_nr_entries = p2_nr_entries = ARRAY_SIZE(p1->entries);
> +
> +    rc = xc_cpu_policy_serialise(xch, p1, p1->leaves, &p1_nr_leaves,
> +                                 p1->entries, &p1_nr_entries);
> +    if ( rc )
> +        return rc;
> +    rc = xc_cpu_policy_serialise(xch, p2, p2->leaves, &p2_nr_leaves,
> +                                 p2->entries, &p2_nr_entries);

... these two calls.

Jan

