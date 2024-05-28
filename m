Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAFD8D1CF6
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 15:29:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731154.1136511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBwsb-0000d8-K4; Tue, 28 May 2024 13:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731154.1136511; Tue, 28 May 2024 13:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBwsb-0000bH-HC; Tue, 28 May 2024 13:28:41 +0000
Received: by outflank-mailman (input) for mailman id 731154;
 Tue, 28 May 2024 13:28:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/BF=M7=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sBwsa-0000bB-O5
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 13:28:40 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30f67980-1cf6-11ef-b4bb-af5377834399;
 Tue, 28 May 2024 15:28:38 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a63036f2daaso106361866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 06:28:38 -0700 (PDT)
Received: from [10.80.5.21] ([160.101.139.1]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a63570e5d0esm24566866b.214.2024.05.28.06.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 06:28:37 -0700 (PDT)
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
X-Inumbo-ID: 30f67980-1cf6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716902918; x=1717507718; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Stzh1/6q+z2/sSILrF67K/1rlkNSVEaKd0fowUH80q4=;
        b=eRb4xAiPilIflQnBP2UJhSgmkLGZkUhCaLCvOGOFTfYU6dkwTgWpbVbvSTm9lCKs82
         cL5zEDOA8VE+ErzM4bYfujJkfCOsVyUTv9qkuAWhxpO4bEeJTkwL1DyEqS19ZAMDuWXf
         96tDepBO5W7KDiwC8yGL/toQK3d/1wZHLs+u4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716902918; x=1717507718;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Stzh1/6q+z2/sSILrF67K/1rlkNSVEaKd0fowUH80q4=;
        b=ID3cQlOrpXv2BZjynBy5I9YNnklOzw4yenLZlf9L2OPdccnHxJ5HEty64gSJfJbWg2
         WnK/QPabhl+WqE+3i9v5epM5/FW7o+7TBDse3gN/0W7ZCcwvniVcRgqr/XD4S9H5/ViF
         +GC53Mfg5BbZKOW7CG94Uekl42aOS6vxUdwcw13K4PLmZvYD+X0gA5CZE6FKlJXjjh4d
         8Ucp+yAUg3S/ROdHKJ4jF0g5MZT0GBh+a0dtiR4Q2ER6rN8JJbBOv3rACEJnqxH4ODk0
         E9dPylj/vxGnbsvRF2DR0bNhaLZTFnWCxEzBX6maTK9aaNW+Nl06f9TPzwkGjAaDlP0e
         Cfcw==
X-Gm-Message-State: AOJu0YxIdZS5csQX/pe264NrHs5hbcxRjJSlxCYH8uOjgWU8T+nRefxo
	9Cq97w7UD+FTb0ZuxH/VQ+9C5weVrJIJ3lhnRIhZl+Q+vK2jn+yQFBAe87C7p+w=
X-Google-Smtp-Source: AGHT+IFvrXlE421GnEB77R2Ak42rqJUMCknFT4TuGWbtszvpa78z3EQ6vS5ZmS8dhJJB7EwY6EpTcg==
X-Received: by 2002:a17:906:4903:b0:a62:ad6:4286 with SMTP id a640c23a62f3a-a62642d9799mr910331966b.7.1716902917446;
        Tue, 28 May 2024 06:28:37 -0700 (PDT)
Message-ID: <ec59063d-fb06-428b-9e00-41f5f7aaebf1@cloud.com>
Date: Tue, 28 May 2024 14:28:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: Re: [PATCH v2 6/8] xen/lib: Add topology generator for x86
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <1ffad529d7fed10381df67215c747fc2d69f805e.1715102098.git.alejandro.vallejo@cloud.com>
 <Zk9z4HJmqXpbivRu@macbook>
Content-Language: en-GB
In-Reply-To: <Zk9z4HJmqXpbivRu@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/05/2024 17:50, Roger Pau Monné wrote:
> On Wed, May 08, 2024 at 01:39:25PM +0100, Alejandro Vallejo wrote:
>> Add a helper to populate topology leaves in the cpu policy from
>> threads/core and cores/package counts.
>>
>> No functional change, as it's not connected to anything yet.
> 
> There is a functional change in test-cpu-policy.c.
> 
> Maybe the commit message needs to be updated to reflect the added
> testing to test-cpu-policy.c using the newly introduced helper to
> generate topologies?
> 

Sure to this and all formatting feedback below.

>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> ---
>> v2:
>>   * New patch. Extracted from v1/patch6
>> ---
>>  tools/tests/cpu-policy/test-cpu-policy.c | 128 +++++++++++++++++++++++
>>  xen/include/xen/lib/x86/cpu-policy.h     |  16 +++
>>  xen/lib/x86/policy.c                     |  86 +++++++++++++++
>>  3 files changed, 230 insertions(+)
>>
>> diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
>> index 301df2c00285..0ba8c418b1b3 100644
>> --- a/tools/tests/cpu-policy/test-cpu-policy.c
>> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
>> @@ -650,6 +650,132 @@ static void test_is_compatible_failure(void)
>>      }
>>  }
>>  
>> +static void test_topo_from_parts(void)
>> +{
>> +    static const struct test {
>> +        unsigned int threads_per_core;
>> +        unsigned int cores_per_pkg;
>> +        struct cpu_policy policy;
>> +    } tests[] = {
>> +        {
>> +            .threads_per_core = 3, .cores_per_pkg = 1,
>> +            .policy = {
>> +                .x86_vendor = X86_VENDOR_AMD,
>> +                .topo.subleaf = {
>> +                    [0] = { .nr_logical = 3, .level = 0, .type = 1, .id_shift = 2, },
>> +                    [1] = { .nr_logical = 1, .level = 1, .type = 2, .id_shift = 2, },
>> +                },
>> +            },
>> +        },
>> +        {
>> +            .threads_per_core = 1, .cores_per_pkg = 3,
>> +            .policy = {
>> +                .x86_vendor = X86_VENDOR_AMD,
>> +                .topo.subleaf = {
>> +                    [0] = { .nr_logical = 1, .level = 0, .type = 1, .id_shift = 0, },
>> +                    [1] = { .nr_logical = 3, .level = 1, .type = 2, .id_shift = 2, },
>> +                },
>> +            },
>> +        },
>> +        {
>> +            .threads_per_core = 7, .cores_per_pkg = 5,
>> +            .policy = {
>> +                .x86_vendor = X86_VENDOR_AMD,
>> +                .topo.subleaf = {
>> +                    [0] = { .nr_logical = 7, .level = 0, .type = 1, .id_shift = 3, },
>> +                    [1] = { .nr_logical = 5, .level = 1, .type = 2, .id_shift = 6, },
>> +                },
>> +            },
>> +        },
>> +        {
>> +            .threads_per_core = 2, .cores_per_pkg = 128,
>> +            .policy = {
>> +                .x86_vendor = X86_VENDOR_AMD,
>> +                .topo.subleaf = {
>> +                    [0] = { .nr_logical = 2, .level = 0, .type = 1, .id_shift = 1, },
>> +                    [1] = { .nr_logical = 128, .level = 1, .type = 2, .id_shift = 8, },
>> +                },
>> +            },
>> +        },
>> +        {
>> +            .threads_per_core = 3, .cores_per_pkg = 1,
>> +            .policy = {
>> +                .x86_vendor = X86_VENDOR_INTEL,
>> +                .topo.subleaf = {
>> +                    [0] = { .nr_logical = 3, .level = 0, .type = 1, .id_shift = 2, },
>> +                    [1] = { .nr_logical = 3, .level = 1, .type = 2, .id_shift = 2, },
>> +                },
>> +            },
>> +        },
>> +        {
>> +            .threads_per_core = 1, .cores_per_pkg = 3,
>> +            .policy = {
>> +                .x86_vendor = X86_VENDOR_INTEL,
>> +                .topo.subleaf = {
>> +                    [0] = { .nr_logical = 1, .level = 0, .type = 1, .id_shift = 0, },
>> +                    [1] = { .nr_logical = 3, .level = 1, .type = 2, .id_shift = 2, },
>> +                },
>> +            },
>> +        },
>> +        {
>> +            .threads_per_core = 7, .cores_per_pkg = 5,
>> +            .policy = {
>> +                .x86_vendor = X86_VENDOR_INTEL,
>> +                .topo.subleaf = {
>> +                    [0] = { .nr_logical = 7, .level = 0, .type = 1, .id_shift = 3, },
>> +                    [1] = { .nr_logical = 35, .level = 1, .type = 2, .id_shift = 6, },
>> +                },
>> +            },
>> +        },
>> +        {
>> +            .threads_per_core = 2, .cores_per_pkg = 128,
>> +            .policy = {
>> +                .x86_vendor = X86_VENDOR_INTEL,
>> +                .topo.subleaf = {
>> +                    [0] = { .nr_logical = 2, .level = 0, .type = 1, .id_shift = 1, },
>> +                    [1] = { .nr_logical = 256, .level = 1, .type = 2, .id_shift = 8, },
> 
> You don't need the array index in the initialization:
> 
>                 .topo.subleaf = {
>                     { .nr_logical = 2, .level = 0, .type = 1, .id_shift = 1, },
>                     { .nr_logical = 256, .level = 1, .type = 2,
>                       .id_shift = 8, },
>                 }
> 
> And lines should be limited to 80 columns if possible.
> 
>> +                },
>> +            },
>> +        },
>> +    };
>> +
>> +    printf("Testing topology synthesis from parts:\n");
>> +
>> +    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
>> +    {
>> +        const struct test *t = &tests[i];
>> +        struct cpu_policy actual = { .x86_vendor = t->policy.x86_vendor };
>> +        int rc = x86_topo_from_parts(&actual, t->threads_per_core, t->cores_per_pkg);
>> +
>> +        if ( rc || memcmp(&actual.topo, &t->policy.topo, sizeof(actual.topo)) )
>> +        {
>> +#define TOPO(n) topo.subleaf[(n)]
>> +            fail("FAIL[%d] - '%s %u t/c, %u c/p'\n",
>> +                 rc,
>> +                 x86_cpuid_vendor_to_str(t->policy.x86_vendor),
>> +                 t->threads_per_core, t->cores_per_pkg);
>> +            printf("  subleaf=%u  expected_n=%u actual_n=%u\n"
>> +                   "             expected_lvl=%u actual_lvl=%u\n"
>> +                   "             expected_type=%u actual_type=%u\n"
>> +                   "             expected_shift=%u actual_shift=%u\n",
>> +                   0, t->policy.TOPO(0).nr_logical, actual.TOPO(0).nr_logical,
>> +                      t->policy.TOPO(0).level,      actual.TOPO(0).level,
>> +                      t->policy.TOPO(0).type,       actual.TOPO(0).type,
>> +                      t->policy.TOPO(0).id_shift,   actual.TOPO(0).id_shift);
>> +
>> +            printf("  subleaf=%u  expected_n=%u actual_n=%u\n"
>> +                   "             expected_lvl=%u actual_lvl=%u\n"
>> +                   "             expected_type=%u actual_type=%u\n"
>> +                   "             expected_shift=%u actual_shift=%u\n",
>> +                   1, t->policy.TOPO(1).nr_logical, actual.TOPO(1).nr_logical,
>> +                      t->policy.TOPO(1).level,      actual.TOPO(1).level,
>> +                      t->policy.TOPO(1).type,       actual.TOPO(1).type,
>> +                      t->policy.TOPO(1).id_shift,   actual.TOPO(1).id_shift);
>> +#undef TOPO
> 
> Seeing the usage of the macro, maybe you could even do something like:
> 
> TOPO(n, f)  t->policy.topo.subleaf[(n)].f, actual.topo.subleaf[(n)].f
> 
> This will limit a bit the repetition of the "t->policy..., actual..."
> tuple.
> 

Hm. Sure, but bear in mind it ends up looking rather cryptic.

>> +        }
>> +    }
>> +}
>> +
>>  int main(int argc, char **argv)
>>  {
>>      printf("CPU Policy unit tests\n");
>> @@ -667,6 +793,8 @@ int main(int argc, char **argv)
>>      test_is_compatible_success();
>>      test_is_compatible_failure();
>>  
>> +    test_topo_from_parts();
>> +
>>      if ( nr_failures )
>>          printf("Done: %u failures\n", nr_failures);
>>      else
>> diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
>> index 392320b9adbe..f5df18e9f77c 100644
>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>> @@ -551,6 +551,22 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>>   */
>>  uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id);
>>  
>> +/**
>> + * Synthesise topology information in `p` given high-level constraints
>> + *
>> + * Topology is given in various fields accross several leaves, some of
>> + * which are vendor-specific. This function uses the policy itself to
>> + * derive such leaves from threads/core and cores/package.
>> + *
>> + * @param p                   CPU policy of the domain.
>> + * @param threads_per_core    threads/core. Doesn't need to be a power of 2.
>> + * @param cores_per_package   cores/package. Doesn't need to be a power of 2.
>> + * @return                    0 on success; -errno on failure
>> + */
>> +int x86_topo_from_parts(struct cpu_policy *p,
>> +                        unsigned int threads_per_core,
>> +                        unsigned int cores_per_pkg);
>> +
>>  #endif /* !XEN_LIB_X86_POLICIES_H */
>>  
>>  /*
>> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
>> index 4cef658feeb8..d033ee5398dd 100644
>> --- a/xen/lib/x86/policy.c
>> +++ b/xen/lib/x86/policy.c
>> @@ -13,6 +13,92 @@ uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id)
>>      return vcpu_id * 2;
>>  }
>>  
>> +static unsigned int order(unsigned int n)
>> +{
>> +    return 8 * sizeof(n) - __builtin_clz(n);
> 
> Do we need to assert that n is not 0, otherwise the return of
> __builtin_clz() is undefined.
> 
> I think the usage below doesn't pass 0 to __builtin_clz() in any case,
> but better add the check IMO.

I doesn't, but asserting sanity sounds good.

> 
> Is __builtin_clz() also available in all versions of GCC and CLANG
> that we support?  I have no idea when this was introduced.
> 

Works on GCC 4.1.2 and Clang 3.5 according to godbolt.

>> +}
>> +
>> +int x86_topo_from_parts(struct cpu_policy *p,
>> +                        unsigned int threads_per_core,
>> +                        unsigned int cores_per_pkg)
>> +{
>> +    unsigned int threads_per_pkg = threads_per_core * cores_per_pkg;
>> +    unsigned int apic_id_size;
>> +
>> +    if ( !p || !threads_per_core || !cores_per_pkg )
>> +        return -EINVAL;
>> +
>> +    p->basic.max_leaf = MAX(0xb, p->basic.max_leaf);
>> +
>> +    memset(p->topo.raw, 0, sizeof(p->topo.raw));
>> +
>> +    /* thread level */
>> +    p->topo.subleaf[0].nr_logical = threads_per_core;
>> +    p->topo.subleaf[0].id_shift = 0;
>> +    p->topo.subleaf[0].level = 0;
>> +    p->topo.subleaf[0].type = 1;
>> +    if ( threads_per_core > 1 )
>> +        p->topo.subleaf[0].id_shift = order(threads_per_core - 1);
>> +
>> +    /* core level */
>> +    p->topo.subleaf[1].nr_logical = cores_per_pkg;
>> +    if ( p->x86_vendor == X86_VENDOR_INTEL )
>> +        p->topo.subleaf[1].nr_logical = threads_per_pkg;
>> +    p->topo.subleaf[1].id_shift = p->topo.subleaf[0].id_shift;
>> +    p->topo.subleaf[1].level = 1;
>> +    p->topo.subleaf[1].type = 2;
>> +    if ( cores_per_pkg > 1 )
>> +        p->topo.subleaf[1].id_shift += order(cores_per_pkg - 1);
>> +
>> +    apic_id_size = p->topo.subleaf[1].id_shift;
>> +
>> +    /*
>> +     * Contrary to what the name might seem to imply. HTT is an enabler for
>> +     * SMP and there's no harm in setting it even with a single vCPU.
>> +     */
>> +    p->basic.htt = true;
>> +    p->basic.lppp = MIN(0xff, p->basic.lppp);
>> +
>> +    switch ( p->x86_vendor )
>> +    {
>> +        case X86_VENDOR_INTEL: {
>> +            struct cpuid_cache_leaf *sl = p->cache.subleaf;
> 
> Newline please.
> 
>> +            for ( size_t i = 0; sl->type &&
>> +                                i < ARRAY_SIZE(p->cache.raw); i++, sl++ )
>> +            {
>> +                sl->cores_per_package = cores_per_pkg - 1;
>> +                sl->threads_per_cache = threads_per_core - 1;
>> +                if ( sl->type == 3 /* unified cache */ )
>> +                    sl->threads_per_cache = threads_per_pkg - 1;
>> +            }
>> +            break;
>> +        }
> 
> Newline here also.
> 
>> +        case X86_VENDOR_AMD:
>> +        case X86_VENDOR_HYGON:
>> +            /* Expose p->basic.lppp */
>> +            p->extd.cmp_legacy = true;
>> +
>> +            /* Clip NC to the maximum value it can hold */
>> +            p->extd.nc = 0xff;
>> +            if ( threads_per_pkg <= 0xff )
>> +                p->extd.nc = threads_per_pkg - 1;
>> +
>> +            /* TODO: Expose leaf e1E */
>> +            p->extd.topoext = false;
>> +
>> +            /*
>> +             * Clip APIC ID to 8 bits, as that's what high core-count machines do
> 
> Overly long line?  And missing full stop.

I've reduced the indentation of the case statement to align them to the
switch. The line fits afterwards.

> 
>> +             *
>> +             * That what AMD EPYC 9654 does with >256 CPUs
>                   ^ That's
> 
> Thanks, Roger.

Cheers,
Alejandro

