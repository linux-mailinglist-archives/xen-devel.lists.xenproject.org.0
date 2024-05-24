Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 758868CE270
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 10:40:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729177.1134284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAQSa-0003FD-0P; Fri, 24 May 2024 08:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729177.1134284; Fri, 24 May 2024 08:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAQSZ-0003C1-TY; Fri, 24 May 2024 08:39:31 +0000
Received: by outflank-mailman (input) for mailman id 729177;
 Fri, 24 May 2024 08:39:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LySr=M3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sAQSY-0003Ac-ME
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 08:39:30 +0000
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2231b63e-19a9-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 10:39:29 +0200 (CEST)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6ab20178a78so24057536d6.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 01:39:29 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ac162fe1b7sm5182616d6.104.2024.05.24.01.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 01:39:27 -0700 (PDT)
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
X-Inumbo-ID: 2231b63e-19a9-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716539968; x=1717144768; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eWZCUoWZhFd+uL07Tq+rkzT187dValeJDIWvpb88kRM=;
        b=aesUN46O7uCeIv/Hybieer1YRBSaWJdOXmMzOXJKQoIJZcFrPxFEHn65njbjwVZ6KH
         xRIj8IyZDcUTCfdwz5aB1+36Qny/jCcL25acAMbZv4xsro5uEAPRwOGNQ2WtxeY6pwWy
         lDgA2VwnOl2GWR2UbLLNZVLMVtHybkz8aQUuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716539968; x=1717144768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWZCUoWZhFd+uL07Tq+rkzT187dValeJDIWvpb88kRM=;
        b=pkuSc+Y4+1aUS5j/2H0sUVU9sgBPXQz5Kqm6bapOrVdDQv/EbyGD1+sWQdGUTatl+T
         lO7YysF7iKe3mcYI4j1OICfMnlnTtExavm/53iriRC5tTii2Jgkkq12WyudUK/jv7nJu
         MS0dHCBiZ4MGyV74coeEaKGmz6VtRt2Odl3WLf2xLVq9uz8rt1kVYX+NVEXH4yNByySz
         uWtdrMhQIl1DGMehRtcHWEBNWbWl0igBrufTjsZkFWE7+6HifGMmKYUKQjgZfoPUXcma
         tIc/kJPrHakl0Bk5GJAepbqwAuXS3qZsIsc/ZizllOZObYI27yAHlmpfjFnDqhYGY4eh
         CjTg==
X-Gm-Message-State: AOJu0YzZfvyY6lIojvu9STZeq2VViESBRDCf5Dn1cI09o2zMNNTB7Jnh
	NGQ2t0uxIBIxrpQPGk/9It3jRITJDQTDZP51QxrUZe8ItX8FitOhnUGNEJll35A=
X-Google-Smtp-Source: AGHT+IHgu684rlCc2LndIkxcDq8n8IjIqsHj9vkhT6WKe61kuPiVfLcRsQqh3sR/yrdjWcA3MB2AwQ==
X-Received: by 2002:a0c:f106:0:b0:6ad:5d19:d9d5 with SMTP id 6a1803df08f44-6ad5d19dd5bmr4453706d6.38.1716539968231;
        Fri, 24 May 2024 01:39:28 -0700 (PDT)
Date: Fri, 24 May 2024 10:39:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: Re: [PATCH v2 7/8] xen/x86: Derive topologically correct x2APIC IDs
 from the policy
Message-ID: <ZlBSPYCpEAosNVzo@macbook>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <87a2a4589e330472b7260ff6ab513744596a4488.1715102098.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87a2a4589e330472b7260ff6ab513744596a4488.1715102098.git.alejandro.vallejo@cloud.com>

On Wed, May 08, 2024 at 01:39:26PM +0100, Alejandro Vallejo wrote:
> Implements the helper for mapping vcpu_id to x2apic_id given a valid
> topology in a policy. The algo is written with the intention of extending
> it to leaves 0x1f and e26 in the future.

Using 0x1f and e26 is kind of confusing.  I would word as "0x1f and
extended leaf 0x26" to avoid confusion.

> 
> Toolstack doesn't set leaf 0xb and the HVM default policy has it cleared,
> so the leaf is not implemented. In that case, the new helper just returns
> the legacy mapping.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v2:
>   * const-ify the test definitions
>   * Cosmetic changes (newline + parameter name in prototype)
> ---
>  tools/tests/cpu-policy/test-cpu-policy.c | 63 ++++++++++++++++++++
>  xen/include/xen/lib/x86/cpu-policy.h     |  2 +
>  xen/lib/x86/policy.c                     | 73 ++++++++++++++++++++++--
>  3 files changed, 133 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
> index 0ba8c418b1b3..82a6aeb23317 100644
> --- a/tools/tests/cpu-policy/test-cpu-policy.c
> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> @@ -776,6 +776,68 @@ static void test_topo_from_parts(void)
>      }
>  }
>  
> +static void test_x2apic_id_from_vcpu_id_success(void)
> +{
> +    static const struct test {
> +        unsigned int vcpu_id;
> +        unsigned int threads_per_core;
> +        unsigned int cores_per_pkg;
> +        uint32_t x2apic_id;
> +        uint8_t x86_vendor;
> +    } tests[] = {
> +        {
> +            .vcpu_id = 3, .threads_per_core = 3, .cores_per_pkg = 8,
> +            .x2apic_id = 1 << 2,
> +        },
> +        {
> +            .vcpu_id = 6, .threads_per_core = 3, .cores_per_pkg = 8,
> +            .x2apic_id = 2 << 2,
> +        },
> +        {
> +            .vcpu_id = 24, .threads_per_core = 3, .cores_per_pkg = 8,
> +            .x2apic_id = 1 << 5,
> +        },
> +        {
> +            .vcpu_id = 35, .threads_per_core = 3, .cores_per_pkg = 8,
> +            .x2apic_id = (35 % 3) | (((35 / 3) % 8)  << 2) | ((35 / 24) << 5),
> +        },
> +        {
> +            .vcpu_id = 96, .threads_per_core = 7, .cores_per_pkg = 3,
> +            .x2apic_id = (96 % 7) | (((96 / 7) % 3)  << 3) | ((96 / 21) << 5),
                                                      ^ extra space (same above)

> +        },
> +    };
> +
> +    const uint8_t vendors[] = {
> +        X86_VENDOR_INTEL,
> +        X86_VENDOR_AMD,
> +        X86_VENDOR_CENTAUR,
> +        X86_VENDOR_SHANGHAI,
> +        X86_VENDOR_HYGON,
> +    };
> +
> +    printf("Testing x2apic id from vcpu id success:\n");
> +
> +    /* Perform the test run on every vendor we know about */
> +    for ( size_t i = 0; i < ARRAY_SIZE(vendors); ++i )
> +    {
> +        struct cpu_policy policy = { .x86_vendor = vendors[i] };

Newline.

> +        for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
> +        {
> +            const struct test *t = &tests[i];
> +            uint32_t x2apic_id;
> +            int rc = x86_topo_from_parts(&policy, t->threads_per_core, t->cores_per_pkg);

Overly long line.

Won't it be better to define `policy` in this scope, so that for each
test you start with a clean policy, rather than having leftover data
from the previous test?

Also you could initialize x2apic_id at definition:

const struct test *t = &tests[j];
struct cpu_policy policy = { .x86_vendor = vendors[i] };
int rc = x86_topo_from_parts(&policy, t->threads_per_core, t->cores_per_pkg);
uint32_t x2apic_id = x86_x2apic_id_from_vcpu_id(&policy, t->vcpu_id);

> +
> +            x2apic_id = x86_x2apic_id_from_vcpu_id(&policy, t->vcpu_id);
> +            if ( rc || x2apic_id != t->x2apic_id )
> +                fail("FAIL[%d] - '%s cpu%u %u t/c %u c/p'. bad x2apic_id: expected=%u actual=%u\n",
> +                     rc,
> +                     x86_cpuid_vendor_to_str(policy.x86_vendor),
> +                     t->vcpu_id, t->threads_per_core, t->cores_per_pkg,
> +                     t->x2apic_id, x2apic_id);
> +        }
> +    }
> +}
> +
>  int main(int argc, char **argv)
>  {
>      printf("CPU Policy unit tests\n");
> @@ -794,6 +856,7 @@ int main(int argc, char **argv)
>      test_is_compatible_failure();
>  
>      test_topo_from_parts();
> +    test_x2apic_id_from_vcpu_id_success();
>  
>      if ( nr_failures )
>          printf("Done: %u failures\n", nr_failures);
> diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
> index f5df18e9f77c..2cbc2726a861 100644
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -545,6 +545,8 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>  /**
>   * Calculates the x2APIC ID of a vCPU given a CPU policy
>   *
> + * If the policy lacks leaf 0xb falls back to legacy mapping of apic_id=cpu*2
> + *
>   * @param p          CPU policy of the domain.
>   * @param id         vCPU ID of the vCPU.
>   * @returns x2APIC ID of the vCPU.
> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
> index d033ee5398dd..e498e32f8fd7 100644
> --- a/xen/lib/x86/policy.c
> +++ b/xen/lib/x86/policy.c
> @@ -2,15 +2,78 @@
>  
>  #include <xen/lib/x86/cpu-policy.h>
>  
> +static uint32_t parts_per_higher_scoped_level(const struct cpu_policy *p, size_t lvl)
> +{
> +    /*
> +     * `nr_logical` reported by Intel is the number of THREADS contained in
> +     * the next topological scope. For example, assuming a system with 2
> +     * threads/core and 3 cores/module in a fully symmetric topology,
> +     * `nr_logical` at the core level will report 6. Because it's reporting
> +     * the number of threads in a module.
> +     *
> +     * On AMD/Hygon, nr_logical is already normalized by the higher scoped
> +     * level (cores/complex, etc) so we can return it as-is.
> +     */
> +    if ( p->x86_vendor != X86_VENDOR_INTEL || !lvl )
> +        return p->topo.subleaf[lvl].nr_logical;
> +
> +    return p->topo.subleaf[lvl].nr_logical / p->topo.subleaf[lvl - 1].nr_logical;

Line length here and in the function declaration.

> +}
> +
>  uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id)
>  {
> +    uint32_t shift = 0, x2apic_id = 0;
> +
> +    /* In the absence of topology leaves, fallback to traditional mapping */
> +    if ( !p->topo.subleaf[0].type )
> +        return id * 2;
> +
>      /*
> -     * TODO: Derive x2APIC ID from the topology information inside `p`
> -     *       rather than from vCPU ID. This bodge is a temporary measure
> -     *       until all infra is in place to retrieve or derive the initial
> -     *       x2APIC ID from migrated domains.

I'm a bit confused with this, the policy is domain wide, so we will
always need to pass the vCPU ID into x86_x2apic_id_from_vcpu_id()?
IOW: the x2APIC ID will always be derived from the vCPU ID.

Thanks, Roger.

