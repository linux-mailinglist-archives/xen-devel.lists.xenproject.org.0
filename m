Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE25A367FAD
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 13:38:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115301.219886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZXfX-0007wt-PE; Thu, 22 Apr 2021 11:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115301.219886; Thu, 22 Apr 2021 11:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZXfX-0007wT-LX; Thu, 22 Apr 2021 11:38:51 +0000
Received: by outflank-mailman (input) for mailman id 115301;
 Thu, 22 Apr 2021 11:38:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZXfW-0007wN-0u
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 11:38:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c6ca6ff-4549-43c3-a431-3ed834baaec1;
 Thu, 22 Apr 2021 11:38:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B3DACAD8D;
 Thu, 22 Apr 2021 11:38:47 +0000 (UTC)
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
X-Inumbo-ID: 5c6ca6ff-4549-43c3-a431-3ed834baaec1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619091527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X7yX/ted2E5C/j5NM3ejyEI0B4mH3miz2yFmcr7Iixw=;
	b=CXKnNZ+eNh3gofqcxrgdeBcUI082ghWbV2KVP/RMdlzcmHZNu8goIcVc0K31Bpm9Qu0tfk
	xdpqwe4YFCQJEYD3WUMBtPo7dme/rs6/vXzI3s62ezcsaYUfjt+A9o6sgVsmuBoLtCTs35
	7tY6uB3QOjYRJ84kFQy40nBsjVbLWws=
Subject: Ping: [PATCH v3] x86/CPUID: shrink max_{,sub}leaf fields according to
 actual leaf contents
From: Jan Beulich <jbeulich@suse.com>
To: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9ecd03b2-f8fa-2a8b-69ad-4b31920ea205@suse.com>
Message-ID: <9a2058cc-d6af-d01a-8630-ab897a75ccbc@suse.com>
Date: Thu, 22 Apr 2021 13:38:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <9ecd03b2-f8fa-2a8b-69ad-4b31920ea205@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.04.2021 15:16, Jan Beulich wrote:
> Zapping leaf data for out of range leaves is just one half of it: To
> avoid guests (bogusly or worse) inferring information from mere leaf
> presence, also shrink maximum indicators such that the respective
> trailing entry is not all blank (unless of course it's the initial
> subleaf of a leaf that's not the final one).
> 
> This is also in preparation of bumping the maximum basic leaf we
> support, to ensure guests not getting exposed related features won't
> observe a change in behavior.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

First of all - I'm sorry Paul, I forgot to Cc you on the original
submission.

May I ask for an ack or otherwise for the Viridian part of this?
Please be sure, however, that you have seen the earlier discussion,
also on v2, as Roger is questioning whether the Viridian change
here wouldn't better be dropped.

Jan

> ---
> v3: Record the actual non-empty subleaf in p->basic.raw[0x7], rather
>     than subleaf 0. Re-base over Viridian leaf 40000005 addition.
> v2: New.
> 
> --- a/tools/tests/cpu-policy/test-cpu-policy.c
> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> @@ -8,10 +8,13 @@
>  #include <err.h>
>  
>  #include <xen-tools/libs.h>
> +#include <xen/asm/x86-defns.h>
>  #include <xen/asm/x86-vendors.h>
>  #include <xen/lib/x86/cpu-policy.h>
>  #include <xen/domctl.h>
>  
> +#define XSTATE_FP_SSE  (X86_XCR0_FP | X86_XCR0_SSE)
> +
>  static unsigned int nr_failures;
>  #define fail(fmt, ...)                          \
>  ({                                              \
> @@ -553,6 +556,103 @@ static void test_cpuid_out_of_range_clea
>      }
>  }
>  
> +static void test_cpuid_maximum_leaf_shrinking(void)
> +{
> +    static const struct test {
> +        const char *name;
> +        struct cpuid_policy p;
> +    } tests[] = {
> +        {
> +            .name = "basic",
> +            .p = {
> +                /* Very basic information only. */
> +                .basic.max_leaf = 1,
> +                .basic.raw_fms = 0xc2,
> +            },
> +        },
> +        {
> +            .name = "cache",
> +            .p = {
> +                /* Cache subleaves present. */
> +                .basic.max_leaf = 4,
> +                .cache.subleaf[0].type = 1,
> +            },
> +        },
> +        {
> +            .name = "feat#0",
> +            .p = {
> +                /* Subleaf 0 only with some valid bit. */
> +                .basic.max_leaf = 7,
> +                .feat.max_subleaf = 0,
> +                .feat.fsgsbase = 1,
> +            },
> +        },
> +        {
> +            .name = "feat#1",
> +            .p = {
> +                /* Subleaf 1 only with some valid bit. */
> +                .basic.max_leaf = 7,
> +                .feat.max_subleaf = 1,
> +                .feat.avx_vnni = 1,
> +            },
> +        },
> +        {
> +            .name = "topo",
> +            .p = {
> +                /* Topology subleaves present. */
> +                .basic.max_leaf = 0xb,
> +                .topo.subleaf[0].type = 1,
> +            },
> +        },
> +        {
> +            .name = "xstate",
> +            .p = {
> +                /* First subleaf always valid (and then non-zero). */
> +                .basic.max_leaf = 0xd,
> +                .xstate.xcr0_low = XSTATE_FP_SSE,
> +            },
> +        },
> +        {
> +            .name = "extd",
> +            .p = {
> +                /* Commonly available information only. */
> +                .extd.max_leaf = 0x80000008,
> +                .extd.maxphysaddr = 0x28,
> +                .extd.maxlinaddr = 0x30,
> +            },
> +        },
> +    };
> +
> +    printf("Testing CPUID maximum leaf shrinking:\n");
> +
> +    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
> +    {
> +        const struct test *t = &tests[i];
> +        struct cpuid_policy *p = memdup(&t->p);
> +
> +        p->basic.max_leaf = ARRAY_SIZE(p->basic.raw) - 1;
> +        p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
> +        p->extd.max_leaf = 0x80000000 | (ARRAY_SIZE(p->extd.raw) - 1);
> +
> +        x86_cpuid_policy_shrink_max_leaves(p);
> +
> +        /* Check the the resulting max (sub)leaf values against expecations. */
> +        if ( p->basic.max_leaf != t->p.basic.max_leaf )
> +             fail("  Test %s basic fail - expected %#x, got %#x\n",
> +                  t->name, t->p.basic.max_leaf, p->basic.max_leaf);
> +
> +        if ( p->extd.max_leaf != t->p.extd.max_leaf )
> +             fail("  Test %s extd fail - expected %#x, got %#x\n",
> +                  t->name, t->p.extd.max_leaf, p->extd.max_leaf);
> +
> +        if ( p->feat.max_subleaf != t->p.feat.max_subleaf )
> +             fail("  Test %s feat fail - expected %#x, got %#x\n",
> +                  t->name, t->p.feat.max_subleaf, p->feat.max_subleaf);
> +
> +        free(p);
> +    }
> +}
> +
>  static void test_is_compatible_success(void)
>  {
>      static struct test {
> @@ -668,6 +768,7 @@ int main(int argc, char **argv)
>      test_cpuid_serialise_success();
>      test_cpuid_deserialise_failure();
>      test_cpuid_out_of_range_clearing();
> +    test_cpuid_maximum_leaf_shrinking();
>  
>      test_msr_serialise_success();
>      test_msr_deserialise_failure();
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -341,6 +341,8 @@ static void __init calculate_host_policy
>          p->extd.raw[0xa].d |= ((1u << SVM_FEATURE_VMCBCLEAN) |
>                                 (1u << SVM_FEATURE_TSCRATEMSR));
>      }
> +
> +    x86_cpuid_policy_shrink_max_leaves(p);
>  }
>  
>  static void __init guest_common_default_feature_adjustments(uint32_t *fs)
> @@ -410,6 +412,8 @@ static void __init calculate_pv_max_poli
>      recalculate_xstate(p);
>  
>      p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
> +
> +    x86_cpuid_policy_shrink_max_leaves(p);
>  }
>  
>  static void __init calculate_pv_def_policy(void)
> @@ -430,6 +434,8 @@ static void __init calculate_pv_def_poli
>      sanitise_featureset(pv_featureset);
>      cpuid_featureset_to_policy(pv_featureset, p);
>      recalculate_xstate(p);
> +
> +    x86_cpuid_policy_shrink_max_leaves(p);
>  }
>  
>  static void __init calculate_hvm_max_policy(void)
> @@ -495,6 +501,8 @@ static void __init calculate_hvm_max_pol
>      sanitise_featureset(hvm_featureset);
>      cpuid_featureset_to_policy(hvm_featureset, p);
>      recalculate_xstate(p);
> +
> +    x86_cpuid_policy_shrink_max_leaves(p);
>  }
>  
>  static void __init calculate_hvm_def_policy(void)
> @@ -519,6 +527,8 @@ static void __init calculate_hvm_def_pol
>      sanitise_featureset(hvm_featureset);
>      cpuid_featureset_to_policy(hvm_featureset, p);
>      recalculate_xstate(p);
> +
> +    x86_cpuid_policy_shrink_max_leaves(p);
>  }
>  
>  void __init init_guest_cpuid(void)
> @@ -699,6 +709,8 @@ void recalculate_cpuid_policy(struct dom
>  
>      if ( !p->extd.page1gb )
>          p->extd.raw[0x19] = EMPTY_LEAF;
> +
> +    x86_cpuid_policy_shrink_max_leaves(p);
>  }
>  
>  int init_domain_cpuid_policy(struct domain *d)
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -124,7 +124,15 @@ void cpuid_viridian_leaves(const struct
>      switch ( leaf )
>      {
>      case 0:
> -        res->a = 0x40000006; /* Maximum leaf */
> +        /* Maximum leaf */
> +        cpuid_viridian_leaves(v, 0x40000006, 0, res);
> +        if ( res->a | res->b | res->c | res->d )
> +            res->a = 0x40000006;
> +        else
> +        {
> +            cpuid_viridian_leaves(v, 0x40000005, 0, res);
> +            res->a = 0x40000005 - !(res->a | res->b | res->c | res->d);
> +        }
>          memcpy(&res->b, "Micr", 4);
>          memcpy(&res->c, "osof", 4);
>          memcpy(&res->d, "t Hv", 4);
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -964,13 +964,15 @@ void cpuid_hypervisor_leaves(const struc
>      uint32_t base = is_viridian_domain(d) ? 0x40000100 : 0x40000000;
>      uint32_t idx  = leaf - base;
>      unsigned int limit = is_viridian_domain(d) ? p->hv2_limit : p->hv_limit;
> +    unsigned int dflt = is_pv_domain(d) ? XEN_CPUID_MAX_PV_NUM_LEAVES
> +                                        : XEN_CPUID_MAX_HVM_NUM_LEAVES;
>  
>      if ( limit == 0 )
>          /* Default number of leaves */
> -        limit = XEN_CPUID_MAX_NUM_LEAVES;
> +        limit = dflt;
>      else
>          /* Clamp toolstack value between 2 and MAX_NUM_LEAVES. */
> -        limit = min(max(limit, 2u), XEN_CPUID_MAX_NUM_LEAVES + 0u);
> +        limit = min(max(limit, 2u), dflt);
>  
>      if ( idx > limit )
>          return;
> --- a/xen/include/public/arch-x86/cpuid.h
> +++ b/xen/include/public/arch-x86/cpuid.h
> @@ -113,6 +113,10 @@
>  /* Max. address width in bits taking memory hotplug into account. */
>  #define XEN_CPUID_MACHINE_ADDRESS_WIDTH_MASK (0xffu << 0)
>  
> -#define XEN_CPUID_MAX_NUM_LEAVES 5
> +#define XEN_CPUID_MAX_PV_NUM_LEAVES 5
> +#define XEN_CPUID_MAX_HVM_NUM_LEAVES 4
> +#define XEN_CPUID_MAX_NUM_LEAVES \
> +    (XEN_CPUID_MAX_PV_NUM_LEAVES > XEN_CPUID_MAX_HVM_NUM_LEAVES ? \
> +     XEN_CPUID_MAX_PV_NUM_LEAVES : XEN_CPUID_MAX_HVM_NUM_LEAVES)
>  
>  #endif /* __XEN_PUBLIC_ARCH_X86_CPUID_H__ */
> --- a/xen/include/xen/lib/x86/cpuid.h
> +++ b/xen/include/xen/lib/x86/cpuid.h
> @@ -351,6 +351,13 @@ void x86_cpuid_policy_fill_native(struct
>   */
>  void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p);
>  
> +/**
> + * Shrink max leaf/subleaf values such that the last respective valid entry
> + * isn't all blank.  While permitted by the spec, such extraneous leaves may
> + * provide undue "hints" to guests.
> + */
> +void x86_cpuid_policy_shrink_max_leaves(struct cpuid_policy *p);
> +
>  #ifdef __XEN__
>  #include <public/arch-x86/xen.h>
>  typedef XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_leaf_buffer_t;
> --- a/xen/lib/x86/cpuid.c
> +++ b/xen/lib/x86/cpuid.c
> @@ -236,6 +236,45 @@ void x86_cpuid_policy_clear_out_of_range
>                  ARRAY_SIZE(p->extd.raw) - 1);
>  }
>  
> +void x86_cpuid_policy_shrink_max_leaves(struct cpuid_policy *p)
> +{
> +    unsigned int i;
> +
> +    p->basic.raw[0x4] = p->cache.raw[0];
> +
> +    for ( i = p->feat.max_subleaf; i; --i )
> +        if ( p->feat.raw[i].a | p->feat.raw[i].b |
> +             p->feat.raw[i].c | p->feat.raw[i].d )
> +            break;
> +    p->feat.max_subleaf = i;
> +    p->basic.raw[0x7] = p->feat.raw[i];
> +
> +    p->basic.raw[0xb] = p->topo.raw[0];
> +
> +    /*
> +     * Due to the way xstate gets handled in the hypervisor (see
> +     * recalculate_xstate()) there is (for now at least) no need to fiddle
> +     * with the xstate subleaves (IOW we assume they're already in consistent
> +     * shape, for coming from either hardware or recalculate_xstate()).
> +     */
> +    p->basic.raw[0xd] = p->xstate.raw[0];
> +
> +    for ( i = p->basic.max_leaf; i; --i )
> +        if ( p->basic.raw[i].a | p->basic.raw[i].b |
> +             p->basic.raw[i].c | p->basic.raw[i].d )
> +            break;
> +    p->basic.max_leaf = i;
> +
> +    for ( i = p->extd.max_leaf & 0xffff; i; --i )
> +        if ( p->extd.raw[i].a | p->extd.raw[i].b |
> +             p->extd.raw[i].c | p->extd.raw[i].d )
> +            break;
> +    if ( i | p->extd.raw[0].b | p->extd.raw[0].c | p->extd.raw[0].d )
> +        p->extd.max_leaf = 0x80000000 | i;
> +    else
> +        p->extd.max_leaf = 0;
> +}
> +
>  const uint32_t *x86_cpuid_lookup_deep_deps(uint32_t feature)
>  {
>      static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
> 


