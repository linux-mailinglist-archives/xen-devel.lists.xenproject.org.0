Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 006968CD8B0
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 18:51:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728764.1133809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sABeQ-0007A9-Q6; Thu, 23 May 2024 16:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728764.1133809; Thu, 23 May 2024 16:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sABeQ-00077M-Mk; Thu, 23 May 2024 16:50:46 +0000
Received: by outflank-mailman (input) for mailman id 728764;
 Thu, 23 May 2024 16:50:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqPc=M2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sABeO-00077G-Tz
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 16:50:45 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97622fe6-1924-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 18:50:42 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4202cea9941so55185525e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 09:50:42 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-355038eb8cbsm503505f8f.33.2024.05.23.09.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 09:50:41 -0700 (PDT)
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
X-Inumbo-ID: 97622fe6-1924-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716483041; x=1717087841; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Une7sB2nD33xp74w7FaBn0c64cKbphTpkHiHzkUm+EQ=;
        b=X1BZRMzGMn5WhqZAD8l19c1W5ZYY7SX66OX2rQ2Bl4YLbrGxJROSvzJLQG6kFPHPhy
         fUOyFeiYsFc6YOCMjqRUDAHpCAFZBTonLuSrhqF6L+ADwKvNjnHXvE0fbOxclm1INSoD
         raXmregwnldcXm5bAlHoIwsGzN6w9edsMXpAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716483041; x=1717087841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Une7sB2nD33xp74w7FaBn0c64cKbphTpkHiHzkUm+EQ=;
        b=G1nEp25LlxmJZpXpP+sru78mnMiwK/3zbkkxFXu+y7yqO53j+RRiuUTC4oNE+9sIMS
         vxrU/ir2U/rVxxjs1dw2h6i3o9O2tW+KLhZChxOCfGEW3FSfZQb61XcR9dMfcWhp4gBq
         40r95bYCIBwMRhFqVKg16kk13RI1lpuDWpMVjxIbuw2azJquZdCaUqIEpBgRlErxVHUx
         FC19qsTotuhtATDXRi23kYgNAoeEgkDgF7eEZ7mExfA8Z/FBSaCQ/Cz7yizxt9s1vaEK
         WNOimWEewsvzJLvOHUNRF4l/u7d8snDari/cUSmqBz3crZxFwBVRUnSypa3cQD7JRIx5
         Jmug==
X-Gm-Message-State: AOJu0Yxipyo+mKDX6yZvITdqz5aBTBH8EysBOjuv3FZm0WT0RYbjSiyg
	fNvFFcuxajwSI5sxWRJjtHZNv4W6obWLtmC/UyQ28vqb1gi9aTS2Q3HnNPy+ODI=
X-Google-Smtp-Source: AGHT+IHt95GprgDPx6yopwP2lS1+9+nnhOK4Ujf9Smw7wTQGWLbIihnbbbGJUNUW1TVnwhj6eJXbAQ==
X-Received: by 2002:a7b:cb42:0:b0:41a:2044:1b3e with SMTP id 5b1f17b1804b1-420fd34d850mr40774885e9.32.1716483041434;
        Thu, 23 May 2024 09:50:41 -0700 (PDT)
Date: Thu, 23 May 2024 18:50:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: Re: [PATCH v2 6/8] xen/lib: Add topology generator for x86
Message-ID: <Zk9z4HJmqXpbivRu@macbook>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <1ffad529d7fed10381df67215c747fc2d69f805e.1715102098.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ffad529d7fed10381df67215c747fc2d69f805e.1715102098.git.alejandro.vallejo@cloud.com>

On Wed, May 08, 2024 at 01:39:25PM +0100, Alejandro Vallejo wrote:
> Add a helper to populate topology leaves in the cpu policy from
> threads/core and cores/package counts.
> 
> No functional change, as it's not connected to anything yet.

There is a functional change in test-cpu-policy.c.

Maybe the commit message needs to be updated to reflect the added
testing to test-cpu-policy.c using the newly introduced helper to
generate topologies?

> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v2:
>   * New patch. Extracted from v1/patch6
> ---
>  tools/tests/cpu-policy/test-cpu-policy.c | 128 +++++++++++++++++++++++
>  xen/include/xen/lib/x86/cpu-policy.h     |  16 +++
>  xen/lib/x86/policy.c                     |  86 +++++++++++++++
>  3 files changed, 230 insertions(+)
> 
> diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
> index 301df2c00285..0ba8c418b1b3 100644
> --- a/tools/tests/cpu-policy/test-cpu-policy.c
> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> @@ -650,6 +650,132 @@ static void test_is_compatible_failure(void)
>      }
>  }
>  
> +static void test_topo_from_parts(void)
> +{
> +    static const struct test {
> +        unsigned int threads_per_core;
> +        unsigned int cores_per_pkg;
> +        struct cpu_policy policy;
> +    } tests[] = {
> +        {
> +            .threads_per_core = 3, .cores_per_pkg = 1,
> +            .policy = {
> +                .x86_vendor = X86_VENDOR_AMD,
> +                .topo.subleaf = {
> +                    [0] = { .nr_logical = 3, .level = 0, .type = 1, .id_shift = 2, },
> +                    [1] = { .nr_logical = 1, .level = 1, .type = 2, .id_shift = 2, },
> +                },
> +            },
> +        },
> +        {
> +            .threads_per_core = 1, .cores_per_pkg = 3,
> +            .policy = {
> +                .x86_vendor = X86_VENDOR_AMD,
> +                .topo.subleaf = {
> +                    [0] = { .nr_logical = 1, .level = 0, .type = 1, .id_shift = 0, },
> +                    [1] = { .nr_logical = 3, .level = 1, .type = 2, .id_shift = 2, },
> +                },
> +            },
> +        },
> +        {
> +            .threads_per_core = 7, .cores_per_pkg = 5,
> +            .policy = {
> +                .x86_vendor = X86_VENDOR_AMD,
> +                .topo.subleaf = {
> +                    [0] = { .nr_logical = 7, .level = 0, .type = 1, .id_shift = 3, },
> +                    [1] = { .nr_logical = 5, .level = 1, .type = 2, .id_shift = 6, },
> +                },
> +            },
> +        },
> +        {
> +            .threads_per_core = 2, .cores_per_pkg = 128,
> +            .policy = {
> +                .x86_vendor = X86_VENDOR_AMD,
> +                .topo.subleaf = {
> +                    [0] = { .nr_logical = 2, .level = 0, .type = 1, .id_shift = 1, },
> +                    [1] = { .nr_logical = 128, .level = 1, .type = 2, .id_shift = 8, },
> +                },
> +            },
> +        },
> +        {
> +            .threads_per_core = 3, .cores_per_pkg = 1,
> +            .policy = {
> +                .x86_vendor = X86_VENDOR_INTEL,
> +                .topo.subleaf = {
> +                    [0] = { .nr_logical = 3, .level = 0, .type = 1, .id_shift = 2, },
> +                    [1] = { .nr_logical = 3, .level = 1, .type = 2, .id_shift = 2, },
> +                },
> +            },
> +        },
> +        {
> +            .threads_per_core = 1, .cores_per_pkg = 3,
> +            .policy = {
> +                .x86_vendor = X86_VENDOR_INTEL,
> +                .topo.subleaf = {
> +                    [0] = { .nr_logical = 1, .level = 0, .type = 1, .id_shift = 0, },
> +                    [1] = { .nr_logical = 3, .level = 1, .type = 2, .id_shift = 2, },
> +                },
> +            },
> +        },
> +        {
> +            .threads_per_core = 7, .cores_per_pkg = 5,
> +            .policy = {
> +                .x86_vendor = X86_VENDOR_INTEL,
> +                .topo.subleaf = {
> +                    [0] = { .nr_logical = 7, .level = 0, .type = 1, .id_shift = 3, },
> +                    [1] = { .nr_logical = 35, .level = 1, .type = 2, .id_shift = 6, },
> +                },
> +            },
> +        },
> +        {
> +            .threads_per_core = 2, .cores_per_pkg = 128,
> +            .policy = {
> +                .x86_vendor = X86_VENDOR_INTEL,
> +                .topo.subleaf = {
> +                    [0] = { .nr_logical = 2, .level = 0, .type = 1, .id_shift = 1, },
> +                    [1] = { .nr_logical = 256, .level = 1, .type = 2, .id_shift = 8, },

You don't need the array index in the initialization:

                .topo.subleaf = {
                    { .nr_logical = 2, .level = 0, .type = 1, .id_shift = 1, },
                    { .nr_logical = 256, .level = 1, .type = 2,
                      .id_shift = 8, },
                }

And lines should be limited to 80 columns if possible.

> +                },
> +            },
> +        },
> +    };
> +
> +    printf("Testing topology synthesis from parts:\n");
> +
> +    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
> +    {
> +        const struct test *t = &tests[i];
> +        struct cpu_policy actual = { .x86_vendor = t->policy.x86_vendor };
> +        int rc = x86_topo_from_parts(&actual, t->threads_per_core, t->cores_per_pkg);
> +
> +        if ( rc || memcmp(&actual.topo, &t->policy.topo, sizeof(actual.topo)) )
> +        {
> +#define TOPO(n) topo.subleaf[(n)]
> +            fail("FAIL[%d] - '%s %u t/c, %u c/p'\n",
> +                 rc,
> +                 x86_cpuid_vendor_to_str(t->policy.x86_vendor),
> +                 t->threads_per_core, t->cores_per_pkg);
> +            printf("  subleaf=%u  expected_n=%u actual_n=%u\n"
> +                   "             expected_lvl=%u actual_lvl=%u\n"
> +                   "             expected_type=%u actual_type=%u\n"
> +                   "             expected_shift=%u actual_shift=%u\n",
> +                   0, t->policy.TOPO(0).nr_logical, actual.TOPO(0).nr_logical,
> +                      t->policy.TOPO(0).level,      actual.TOPO(0).level,
> +                      t->policy.TOPO(0).type,       actual.TOPO(0).type,
> +                      t->policy.TOPO(0).id_shift,   actual.TOPO(0).id_shift);
> +
> +            printf("  subleaf=%u  expected_n=%u actual_n=%u\n"
> +                   "             expected_lvl=%u actual_lvl=%u\n"
> +                   "             expected_type=%u actual_type=%u\n"
> +                   "             expected_shift=%u actual_shift=%u\n",
> +                   1, t->policy.TOPO(1).nr_logical, actual.TOPO(1).nr_logical,
> +                      t->policy.TOPO(1).level,      actual.TOPO(1).level,
> +                      t->policy.TOPO(1).type,       actual.TOPO(1).type,
> +                      t->policy.TOPO(1).id_shift,   actual.TOPO(1).id_shift);
> +#undef TOPO

Seeing the usage of the macro, maybe you could even do something like:

TOPO(n, f)  t->policy.topo.subleaf[(n)].f, actual.topo.subleaf[(n)].f

This will limit a bit the repetition of the "t->policy..., actual..."
tuple.

> +        }
> +    }
> +}
> +
>  int main(int argc, char **argv)
>  {
>      printf("CPU Policy unit tests\n");
> @@ -667,6 +793,8 @@ int main(int argc, char **argv)
>      test_is_compatible_success();
>      test_is_compatible_failure();
>  
> +    test_topo_from_parts();
> +
>      if ( nr_failures )
>          printf("Done: %u failures\n", nr_failures);
>      else
> diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
> index 392320b9adbe..f5df18e9f77c 100644
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -551,6 +551,22 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>   */
>  uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id);
>  
> +/**
> + * Synthesise topology information in `p` given high-level constraints
> + *
> + * Topology is given in various fields accross several leaves, some of
> + * which are vendor-specific. This function uses the policy itself to
> + * derive such leaves from threads/core and cores/package.
> + *
> + * @param p                   CPU policy of the domain.
> + * @param threads_per_core    threads/core. Doesn't need to be a power of 2.
> + * @param cores_per_package   cores/package. Doesn't need to be a power of 2.
> + * @return                    0 on success; -errno on failure
> + */
> +int x86_topo_from_parts(struct cpu_policy *p,
> +                        unsigned int threads_per_core,
> +                        unsigned int cores_per_pkg);
> +
>  #endif /* !XEN_LIB_X86_POLICIES_H */
>  
>  /*
> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
> index 4cef658feeb8..d033ee5398dd 100644
> --- a/xen/lib/x86/policy.c
> +++ b/xen/lib/x86/policy.c
> @@ -13,6 +13,92 @@ uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id)
>      return vcpu_id * 2;
>  }
>  
> +static unsigned int order(unsigned int n)
> +{
> +    return 8 * sizeof(n) - __builtin_clz(n);

Do we need to assert that n is not 0, otherwise the return of
__builtin_clz() is undefined.

I think the usage below doesn't pass 0 to __builtin_clz() in any case,
but better add the check IMO.

Is __builtin_clz() also available in all versions of GCC and CLANG
that we support?  I have no idea when this was introduced.

> +}
> +
> +int x86_topo_from_parts(struct cpu_policy *p,
> +                        unsigned int threads_per_core,
> +                        unsigned int cores_per_pkg)
> +{
> +    unsigned int threads_per_pkg = threads_per_core * cores_per_pkg;
> +    unsigned int apic_id_size;
> +
> +    if ( !p || !threads_per_core || !cores_per_pkg )
> +        return -EINVAL;
> +
> +    p->basic.max_leaf = MAX(0xb, p->basic.max_leaf);
> +
> +    memset(p->topo.raw, 0, sizeof(p->topo.raw));
> +
> +    /* thread level */
> +    p->topo.subleaf[0].nr_logical = threads_per_core;
> +    p->topo.subleaf[0].id_shift = 0;
> +    p->topo.subleaf[0].level = 0;
> +    p->topo.subleaf[0].type = 1;
> +    if ( threads_per_core > 1 )
> +        p->topo.subleaf[0].id_shift = order(threads_per_core - 1);
> +
> +    /* core level */
> +    p->topo.subleaf[1].nr_logical = cores_per_pkg;
> +    if ( p->x86_vendor == X86_VENDOR_INTEL )
> +        p->topo.subleaf[1].nr_logical = threads_per_pkg;
> +    p->topo.subleaf[1].id_shift = p->topo.subleaf[0].id_shift;
> +    p->topo.subleaf[1].level = 1;
> +    p->topo.subleaf[1].type = 2;
> +    if ( cores_per_pkg > 1 )
> +        p->topo.subleaf[1].id_shift += order(cores_per_pkg - 1);
> +
> +    apic_id_size = p->topo.subleaf[1].id_shift;
> +
> +    /*
> +     * Contrary to what the name might seem to imply. HTT is an enabler for
> +     * SMP and there's no harm in setting it even with a single vCPU.
> +     */
> +    p->basic.htt = true;
> +    p->basic.lppp = MIN(0xff, p->basic.lppp);
> +
> +    switch ( p->x86_vendor )
> +    {
> +        case X86_VENDOR_INTEL: {
> +            struct cpuid_cache_leaf *sl = p->cache.subleaf;

Newline please.

> +            for ( size_t i = 0; sl->type &&
> +                                i < ARRAY_SIZE(p->cache.raw); i++, sl++ )
> +            {
> +                sl->cores_per_package = cores_per_pkg - 1;
> +                sl->threads_per_cache = threads_per_core - 1;
> +                if ( sl->type == 3 /* unified cache */ )
> +                    sl->threads_per_cache = threads_per_pkg - 1;
> +            }
> +            break;
> +        }

Newline here also.

> +        case X86_VENDOR_AMD:
> +        case X86_VENDOR_HYGON:
> +            /* Expose p->basic.lppp */
> +            p->extd.cmp_legacy = true;
> +
> +            /* Clip NC to the maximum value it can hold */
> +            p->extd.nc = 0xff;
> +            if ( threads_per_pkg <= 0xff )
> +                p->extd.nc = threads_per_pkg - 1;
> +
> +            /* TODO: Expose leaf e1E */
> +            p->extd.topoext = false;
> +
> +            /*
> +             * Clip APIC ID to 8 bits, as that's what high core-count machines do

Overly long line?  And missing full stop.

> +             *
> +             * That what AMD EPYC 9654 does with >256 CPUs
                  ^ That's

Thanks, Roger.

