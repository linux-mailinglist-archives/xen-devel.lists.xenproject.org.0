Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 238C8318EF6
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 16:42:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83970.157283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAE7F-0002Mc-CU; Thu, 11 Feb 2021 15:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83970.157283; Thu, 11 Feb 2021 15:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAE7F-0002MD-97; Thu, 11 Feb 2021 15:42:49 +0000
Received: by outflank-mailman (input) for mailman id 83970;
 Thu, 11 Feb 2021 15:42:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cmTu=HN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lAE7D-0002M6-JC
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 15:42:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a885a60-44bd-4a7d-bd8e-a9d5c2703629;
 Thu, 11 Feb 2021 15:42:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67110B07D;
 Thu, 11 Feb 2021 15:42:45 +0000 (UTC)
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
X-Inumbo-ID: 7a885a60-44bd-4a7d-bd8e-a9d5c2703629
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613058165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hWYjTk2p4fW93pD3xlZCnWexIq9M2POLfp1SKCK9dVg=;
	b=E0NCC7GTaHwjllRdI6PwcBdMz4hBN1I0EYo0vTJXBB0KzSJVh96VHbiSbeW3FLTomtPxrP
	lpDo+avy0jFcoPMfkC68xMQWqQMYhVodsafUtkF8ySYnO8WCDf4NkSMFMW63kjlXvkDP6m
	NAgVady2gc+DVoozbHKtn+U2VhMG1Bs=
Subject: Re: [PATCH v2 12/17] x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
 <2aaffa0e-e17f-6581-6003-e58d2c9fc1d7@suse.com>
Message-ID: <7d1a0041-4b1a-855c-b522-421df21ca9d4@suse.com>
Date: Thu, 11 Feb 2021 16:42:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2aaffa0e-e17f-6581-6003-e58d2c9fc1d7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.11.2020 15:33, Jan Beulich wrote:
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
> ---
> v2: New.

While most other parts of this series are to be delayed until
(at least) 4.16, I consider this one a bug fix as well, just
like the previous one. I also realize only now that I forgot to
Cc Paul on the original submission - sorry.

Jan

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
> @@ -564,6 +567,103 @@ static void test_cpuid_out_of_range_clea
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
> @@ -679,6 +779,7 @@ int main(int argc, char **argv)
>      test_cpuid_serialise_success();
>      test_cpuid_deserialise_failure();
>      test_cpuid_out_of_range_clearing();
> +    test_cpuid_maximum_leaf_shrinking();
>  
>      test_msr_serialise_success();
>      test_msr_deserialise_failure();
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -346,6 +346,8 @@ static void __init calculate_host_policy
>          p->extd.raw[0xa].d |= ((1u << SVM_FEATURE_VMCBCLEAN) |
>                                 (1u << SVM_FEATURE_TSCRATEMSR));
>      }
> +
> +    x86_cpuid_policy_shrink_max_leaves(p);
>  }
>  
>  static void __init guest_common_default_feature_adjustments(uint32_t *fs)
> @@ -415,6 +417,8 @@ static void __init calculate_pv_max_poli
>      recalculate_xstate(p);
>  
>      p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
> +
> +    x86_cpuid_policy_shrink_max_leaves(p);
>  }
>  
>  static void __init calculate_pv_def_policy(void)
> @@ -435,6 +439,8 @@ static void __init calculate_pv_def_poli
>      sanitise_featureset(pv_featureset);
>      cpuid_featureset_to_policy(pv_featureset, p);
>      recalculate_xstate(p);
> +
> +    x86_cpuid_policy_shrink_max_leaves(p);
>  }
>  
>  static void __init calculate_hvm_max_policy(void)
> @@ -494,6 +500,8 @@ static void __init calculate_hvm_max_pol
>      sanitise_featureset(hvm_featureset);
>      cpuid_featureset_to_policy(hvm_featureset, p);
>      recalculate_xstate(p);
> +
> +    x86_cpuid_policy_shrink_max_leaves(p);
>  }
>  
>  static void __init calculate_hvm_def_policy(void)
> @@ -518,6 +526,8 @@ static void __init calculate_hvm_def_pol
>      sanitise_featureset(hvm_featureset);
>      cpuid_featureset_to_policy(hvm_featureset, p);
>      recalculate_xstate(p);
> +
> +    x86_cpuid_policy_shrink_max_leaves(p);
>  }
>  
>  void __init init_host_cpuid(void)
> @@ -704,6 +714,8 @@ void recalculate_cpuid_policy(struct dom
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
> @@ -121,7 +121,9 @@ void cpuid_viridian_leaves(const struct
>      switch ( leaf )
>      {
>      case 0:
> -        res->a = 0x40000006; /* Maximum leaf */
> +        /* Maximum leaf */
> +        cpuid_viridian_leaves(v, 0x40000006, 0, res);
> +        res->a = res->a | res->b | res->c | res->d ? 0x40000006 : 0x40000004;
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
> @@ -238,6 +238,45 @@ void x86_cpuid_policy_clear_out_of_range
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
> +    p->basic.raw[0x7] = p->feat.raw[0];
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
> 


