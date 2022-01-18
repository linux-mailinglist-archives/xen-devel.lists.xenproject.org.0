Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EF94925AF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 13:26:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258472.445160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9nZ8-0006Oi-Th; Tue, 18 Jan 2022 12:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258472.445160; Tue, 18 Jan 2022 12:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9nZ8-0006Ms-QY; Tue, 18 Jan 2022 12:26:22 +0000
Received: by outflank-mailman (input) for mailman id 258472;
 Tue, 18 Jan 2022 12:26:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1rGk=SC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n9nZ6-0006Mm-Lt
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 12:26:20 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d67b18bc-7859-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 13:26:19 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:52094)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n9nZ4-000xjD-o7 (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 18 Jan 2022 12:26:18 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 3EA7D1FC87;
 Tue, 18 Jan 2022 12:26:18 +0000 (GMT)
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
X-Inumbo-ID: d67b18bc-7859-11ec-a115-11989b9578b4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <5a9c0bdc-e996-436d-0b08-b7422f47f694@srcf.net>
Date: Tue, 18 Jan 2022 12:26:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220117094827.16756-1-roger.pau@citrix.com>
 <20220117094827.16756-3-roger.pau@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v6 02/12] libx86: introduce helper to fetch cpuid leaf
In-Reply-To: <20220117094827.16756-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/01/2022 09:48, Roger Pau Monne wrote:
> Introduce a helper based on the current Xen guest_cpuid code in order
> to fetch a cpuid leaf from a policy. The newly introduced function in
> cpuid.c should not be directly called and instead the provided
> x86_cpuid_get_leaf macro should be used that will properly deal with
> const and non-const inputs.
>
> Also add a test to check that the introduced helper doesn't go over
> the bounds of the policy.
>
> Note the code in x86_cpuid_copy_from_buffer is not switched to use the
> new function because of the boundary checks against the max fields of
> the policy, which might not be properly set at the point where
> x86_cpuid_copy_from_buffer get called, for example when filling an
> empty policy from scratch.

Filling an empty policy from scratch will be fine, because we always
ascend through leaves.  This also matches the chronology of how CPUID
developed.

The most likely case to go wrong is enabling an optional feature above
max_leaf, and getting the bump to max_leaf out of order.  That said, I
suspect such logic would be working on an object, rather than a list.

The important point is that x86_cpuid_copy_from_buffer() is deliberately
invariant to the order of entries for compatibility reasons, even if we
don't expect it to matter in practice.

>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes since v4:
>  - Rename _x86_cpuid_get_leaf to x86_cpuid_get_leaf_const.
>
> Changes since v3:
>  - New in this version.
> ---
> Regarding safety of the usage of array_access_nospec to obtain a
> pointer to an element of an array, there are already other instances
> of this usage, for example in viridian_time_wrmsr, so I would assume
> this is fine.

It's a bit of a weird construct, and both GCC and Clang could generate
better code, but it does look to be safe.

> ---
>  tools/tests/cpu-policy/test-cpu-policy.c | 75 ++++++++++++++++++++++++
>  xen/arch/x86/cpuid.c                     | 55 +++--------------
>  xen/include/xen/lib/x86/cpuid.h          | 19 ++++++
>  xen/lib/x86/cpuid.c                      | 52 ++++++++++++++++
>  4 files changed, 153 insertions(+), 48 deletions(-)
>
> diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
> index ed450a0997..3f777fc1fc 100644
> --- a/tools/tests/cpu-policy/test-cpu-policy.c
> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> @@ -570,6 +570,80 @@ static void test_cpuid_out_of_range_clearing(void)
>      }
>  }
>  
> +static void test_cpuid_get_leaf_failure(void)
> +{
> +    static const struct test {
> +        struct cpuid_policy p;
> +        const char *name;
> +        uint32_t leaf, subleaf;
> +    } tests[] = {
> +        /* Bound checking logic. */
> +        {
> +            .name = "Basic max leaf >= array size",
> +            .p = {
> +                .basic.max_leaf = CPUID_GUEST_NR_BASIC,
> +            },
> +        },
> +        {
> +            .name = "Feature max leaf >= array size",
> +            .p = {
> +                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
> +                .feat.max_subleaf = CPUID_GUEST_NR_FEAT,
> +            },
> +            .leaf = 0x00000007,
> +        },
> +        {
> +            .name = "Extended max leaf >= array size",
> +            .p = {
> +                .extd.max_leaf = 0x80000000 + CPUID_GUEST_NR_EXTD,
> +            },
> +            .leaf = 0x80000000,
> +        },
> +
> +        {
> +            .name = "Basic leaf >= max leaf",
> +            .p = {
> +                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
> +            },
> +            .leaf = CPUID_GUEST_NR_BASIC,
> +        },
> +        {
> +            .name = "Feature leaf >= max leaf",
> +            .p = {
> +                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
> +                .feat.max_subleaf = CPUID_GUEST_NR_FEAT - 1,
> +            },
> +            .leaf = 0x00000007,
> +            .subleaf = CPUID_GUEST_NR_FEAT,
> +        },
> +        {
> +            .name = "Extended leaf >= max leaf",
> +            .p = {
> +                .extd.max_leaf = 0x80000000 + CPUID_GUEST_NR_EXTD - 1,
> +            },
> +            .leaf = 0x80000000 + CPUID_GUEST_NR_EXTD,
> +        },
> +    };
> +    const struct cpuid_policy pc;
> +    const struct cpuid_leaf *lc;
> +    struct cpuid_policy p;
> +    struct cpuid_leaf *l;
> +
> +    /* Constness build test. */
> +    lc = x86_cpuid_get_leaf(&pc, 0, 0);
> +    l = x86_cpuid_get_leaf(&p, 0, 0);
> +
> +    printf("Testing CPUID get leaf bound checking:\n");
> +
> +    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
> +    {
> +        const struct test *t = &tests[i];

memdup().  It is important for tests which potentially reach out of
bounds, so ASAN can work.


That said, you're only testing half of the boundary cases.  Perhaps more
important important is the case where max_leaf is really out of legal
bounds.  Further, it is also important to check the non-NULL cases too.

It would probably be better to have a single cpuid_policy object, and a
list of pointers (perhaps offsets) to interesting max_leaf fields, along
with their relevant compile time bounds.  That way, you can try all the
interesting max_leaf values (0, limit-1, limit, ~0) and check
NULL/non-NULLness of the answer with a simple min() calculation.

> diff --git a/xen/include/xen/lib/x86/cpuid.h b/xen/include/xen/lib/x86/cpuid.h
> index a4d254ea96..050cd4f9d1 100644
> --- a/xen/include/xen/lib/x86/cpuid.h
> +++ b/xen/include/xen/lib/x86/cpuid.h
> @@ -431,6 +431,25 @@ int x86_cpuid_copy_from_buffer(struct cpuid_policy *policy,
>                                 uint32_t nr_entries, uint32_t *err_leaf,
>                                 uint32_t *err_subleaf);
>  
> +/**
> + * Get a cpuid leaf from a policy object.
> + *
> + * @param policy      The cpuid_policy object.
> + * @param leaf        The leaf index.
> + * @param subleaf     The subleaf index.
> + * @returns a pointer to the requested leaf or NULL in case of error.
> + *
> + * The function will perform out of bound checks. Do not call this function
> + * directly and instead use x86_cpuid_get_leaf that will deal with both const
> + * and non-const policies returning a pointer with constness matching that of
> + * the input.
> + */
> +const struct cpuid_leaf *x86_cpuid_get_leaf_const(const struct cpuid_policy *p,
> +                                                  uint32_t leaf,
> +                                                  uint32_t subleaf);

Examples like this demonstrate obviously why

const struct cpuid_leaf *x86_cpuid_get_leaf_const(
    const struct cpuid_policy *p, uint32_t leaf, uint32_t subleaf);

is a better layout.

> +#define x86_cpuid_get_leaf(p, l, s) \
> +    ((__typeof__(&(p)->basic.raw[0]))x86_cpuid_get_leaf_const(p, l, s))

You can drop the outermost brackets.

~Andrew

