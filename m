Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507C78CE8FF
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 19:04:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729659.1134865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAYKI-00056w-VG; Fri, 24 May 2024 17:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729659.1134865; Fri, 24 May 2024 17:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAYKI-00055P-SP; Fri, 24 May 2024 17:03:30 +0000
Received: by outflank-mailman (input) for mailman id 729659;
 Fri, 24 May 2024 17:03:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=di0w=M3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sAYKG-00055B-PM
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 17:03:28 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 891eb371-19ef-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 19:03:27 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42108856c33so5780545e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 10:03:26 -0700 (PDT)
Received: from [192.168.0.16] (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100fadcabsm57605785e9.35.2024.05.24.10.03.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 May 2024 10:03:24 -0700 (PDT)
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
X-Inumbo-ID: 891eb371-19ef-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716570205; x=1717175005; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l4N1HbDa+as1czqlaMAoz2GDemeBb+xIjSoFaK5NyIA=;
        b=RRpaUyzexFR53fMMjOgTd23f71kQSIOSREGkkIg2wCBzKqrAJHRxHE9hmsHXVYmjkF
         6oDLUEx4DtEdsMw1w1scZvtEhRDGpVoiEASYTLhNWbBZg4y1lYeL3kJa/NThvdAeTUfq
         F0hXyjIkNgh6qkFPGcegBdABoHdDIxuPq97P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716570205; x=1717175005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l4N1HbDa+as1czqlaMAoz2GDemeBb+xIjSoFaK5NyIA=;
        b=PhMfe3J9VQ1lmpQWUirTToClBVpMSu0wLEu+UoY29GWRPtqpX+FS49T8CG91GmFHr/
         SOuiGT1Pt881kwjvuMEPUn2k+GAWfLrAlT+FoAWweXUZjV1GuFXsmNB++/NqazP+bmAs
         TDK8zjI7YBzj62wq8/HDqWQTPqhWrVtU4RZmmFZ8W0KcSKRTBBfgvGXkdQ2Autv/axdC
         NtX5HuiVlTzj45uzmgkyJuRU+bJgwEfKnhp3WDy28zYux13+o2HGIlLaOU4EFHt8UHJg
         Tep7VXHLPJTMISbbuH8TtrxDHo2MoNV3ss3mu45vdfKd1B6BRKfPEe0B7cZjNS5I7wfT
         1KrA==
X-Gm-Message-State: AOJu0Yyuj+8R3zL31OMmSbD0k9PFFNpDZiybXOEBm8qYriCUEA0dzKA9
	GKnxxKvbrWS6MTvrs4bA0P8QqBt/YEbm/WInjBrvNadWpNIDuzNKEw43hnqIycE=
X-Google-Smtp-Source: AGHT+IFU3/6IHcS/ifs31twOKN3VRepoofgHFSr95ASnRD2vKHmf/GUteE8F6DywKYa9znfEcW6Jtg==
X-Received: by 2002:a05:600c:3b1c:b0:418:2981:c70f with SMTP id 5b1f17b1804b1-421015fdc48mr50714235e9.19.1716570205533;
        Fri, 24 May 2024 10:03:25 -0700 (PDT)
Message-ID: <1e16ffa9-3f6c-43ed-b36c-55fe132c8145@cloud.com>
Date: Fri, 24 May 2024 18:03:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] xen/x86: Derive topologically correct x2APIC IDs
 from the policy
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <87a2a4589e330472b7260ff6ab513744596a4488.1715102098.git.alejandro.vallejo@cloud.com>
 <ZlBSPYCpEAosNVzo@macbook>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <ZlBSPYCpEAosNVzo@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/05/2024 09:39, Roger Pau Monné wrote:
> On Wed, May 08, 2024 at 01:39:26PM +0100, Alejandro Vallejo wrote:
>> Implements the helper for mapping vcpu_id to x2apic_id given a valid
>> topology in a policy. The algo is written with the intention of extending
>> it to leaves 0x1f and e26 in the future.
> 
> Using 0x1f and e26 is kind of confusing.  I would word as "0x1f and
> extended leaf 0x26" to avoid confusion.
> 
>>
>> Toolstack doesn't set leaf 0xb and the HVM default policy has it cleared,
>> so the leaf is not implemented. In that case, the new helper just returns
>> the legacy mapping.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> ---
>> v2:
>>   * const-ify the test definitions
>>   * Cosmetic changes (newline + parameter name in prototype)
>> ---
>>  tools/tests/cpu-policy/test-cpu-policy.c | 63 ++++++++++++++++++++
>>  xen/include/xen/lib/x86/cpu-policy.h     |  2 +
>>  xen/lib/x86/policy.c                     | 73 ++++++++++++++++++++++--
>>  3 files changed, 133 insertions(+), 5 deletions(-)
>>
>> diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
>> index 0ba8c418b1b3..82a6aeb23317 100644
>> --- a/tools/tests/cpu-policy/test-cpu-policy.c
>> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
>> @@ -776,6 +776,68 @@ static void test_topo_from_parts(void)
>>      }
>>  }
>>  
>> +static void test_x2apic_id_from_vcpu_id_success(void)
>> +{
>> +    static const struct test {
>> +        unsigned int vcpu_id;
>> +        unsigned int threads_per_core;
>> +        unsigned int cores_per_pkg;
>> +        uint32_t x2apic_id;
>> +        uint8_t x86_vendor;
>> +    } tests[] = {
>> +        {
>> +            .vcpu_id = 3, .threads_per_core = 3, .cores_per_pkg = 8,
>> +            .x2apic_id = 1 << 2,
>> +        },
>> +        {
>> +            .vcpu_id = 6, .threads_per_core = 3, .cores_per_pkg = 8,
>> +            .x2apic_id = 2 << 2,
>> +        },
>> +        {
>> +            .vcpu_id = 24, .threads_per_core = 3, .cores_per_pkg = 8,
>> +            .x2apic_id = 1 << 5,
>> +        },
>> +        {
>> +            .vcpu_id = 35, .threads_per_core = 3, .cores_per_pkg = 8,
>> +            .x2apic_id = (35 % 3) | (((35 / 3) % 8)  << 2) | ((35 / 24) << 5),
>> +        },
>> +        {
>> +            .vcpu_id = 96, .threads_per_core = 7, .cores_per_pkg = 3,
>> +            .x2apic_id = (96 % 7) | (((96 / 7) % 3)  << 3) | ((96 / 21) << 5),
>                                                       ^ extra space (same above)
> 
>> +        },
>> +    };
>> +
>> +    const uint8_t vendors[] = {
>> +        X86_VENDOR_INTEL,
>> +        X86_VENDOR_AMD,
>> +        X86_VENDOR_CENTAUR,
>> +        X86_VENDOR_SHANGHAI,
>> +        X86_VENDOR_HYGON,
>> +    };
>> +
>> +    printf("Testing x2apic id from vcpu id success:\n");
>> +
>> +    /* Perform the test run on every vendor we know about */
>> +    for ( size_t i = 0; i < ARRAY_SIZE(vendors); ++i )
>> +    {
>> +        struct cpu_policy policy = { .x86_vendor = vendors[i] };
> 
> Newline.

Ack

> 
>> +        for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
>> +        {
>> +            const struct test *t = &tests[i];
>> +            uint32_t x2apic_id;
>> +            int rc = x86_topo_from_parts(&policy, t->threads_per_core, t->cores_per_pkg);
> 
> Overly long line.
> 
> Won't it be better to define `policy` in this scope, so that for each
> test you start with a clean policy, rather than having leftover data
> from the previous test?

The leftover data is overridden during setup by x86_topo_from_parts(),
but I can see the appeal. Sure.

> 
> Also you could initialize x2apic_id at definition:
> 
> const struct test *t = &tests[j];
> struct cpu_policy policy = { .x86_vendor = vendors[i] };
> int rc = x86_topo_from_parts(&policy, t->threads_per_core, t->cores_per_pkg);
> uint32_t x2apic_id = x86_x2apic_id_from_vcpu_id(&policy, t->vcpu_id);

Seeing this snippet I just realized there's a bug. The second loop
should use j rather than i. Ugh.

As for the initialization, I want to prevent feeding garbage into
x86_x2apic_id_from_vcpu_id(). For which there's an "if ( !rc )" missing
to gate the call.

I'll sort both of those.

> 
>> +
>> +            x2apic_id = x86_x2apic_id_from_vcpu_id(&policy, t->vcpu_id);
>> +            if ( rc || x2apic_id != t->x2apic_id )
>> +                fail("FAIL[%d] - '%s cpu%u %u t/c %u c/p'. bad x2apic_id: expected=%u actual=%u\n",
>> +                     rc,
>> +                     x86_cpuid_vendor_to_str(policy.x86_vendor),
>> +                     t->vcpu_id, t->threads_per_core, t->cores_per_pkg,
>> +                     t->x2apic_id, x2apic_id);
>> +        }
>> +    }
>> +}
>> +
>>  int main(int argc, char **argv)
>>  {
>>      printf("CPU Policy unit tests\n");
>> @@ -794,6 +856,7 @@ int main(int argc, char **argv)
>>      test_is_compatible_failure();
>>  
>>      test_topo_from_parts();
>> +    test_x2apic_id_from_vcpu_id_success();
>>  
>>      if ( nr_failures )
>>          printf("Done: %u failures\n", nr_failures);
>> diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
>> index f5df18e9f77c..2cbc2726a861 100644
>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>> @@ -545,6 +545,8 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>>  /**
>>   * Calculates the x2APIC ID of a vCPU given a CPU policy
>>   *
>> + * If the policy lacks leaf 0xb falls back to legacy mapping of apic_id=cpu*2
>> + *
>>   * @param p          CPU policy of the domain.
>>   * @param id         vCPU ID of the vCPU.
>>   * @returns x2APIC ID of the vCPU.
>> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
>> index d033ee5398dd..e498e32f8fd7 100644
>> --- a/xen/lib/x86/policy.c
>> +++ b/xen/lib/x86/policy.c
>> @@ -2,15 +2,78 @@
>>  
>>  #include <xen/lib/x86/cpu-policy.h>
>>  
>> +static uint32_t parts_per_higher_scoped_level(const struct cpu_policy *p, size_t lvl)
>> +{
>> +    /*
>> +     * `nr_logical` reported by Intel is the number of THREADS contained in
>> +     * the next topological scope. For example, assuming a system with 2
>> +     * threads/core and 3 cores/module in a fully symmetric topology,
>> +     * `nr_logical` at the core level will report 6. Because it's reporting
>> +     * the number of threads in a module.
>> +     *
>> +     * On AMD/Hygon, nr_logical is already normalized by the higher scoped
>> +     * level (cores/complex, etc) so we can return it as-is.
>> +     */
>> +    if ( p->x86_vendor != X86_VENDOR_INTEL || !lvl )
>> +        return p->topo.subleaf[lvl].nr_logical;
>> +
>> +    return p->topo.subleaf[lvl].nr_logical / p->topo.subleaf[lvl - 1].nr_logical;
> 
> Line length here and in the function declaration.
> 

Ack

>> +}
>> +
>>  uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id)
>>  {
>> +    uint32_t shift = 0, x2apic_id = 0;
>> +
>> +    /* In the absence of topology leaves, fallback to traditional mapping */
>> +    if ( !p->topo.subleaf[0].type )
>> +        return id * 2;
>> +
>>      /*
>> -     * TODO: Derive x2APIC ID from the topology information inside `p`
>> -     *       rather than from vCPU ID. This bodge is a temporary measure
>> -     *       until all infra is in place to retrieve or derive the initial
>> -     *       x2APIC ID from migrated domains.
> 
> I'm a bit confused with this, the policy is domain wide, so we will
> always need to pass the vCPU ID into x86_x2apic_id_from_vcpu_id()?
> IOW: the x2APIC ID will always be derived from the vCPU ID.
> 
> Thanks, Roger.

The x2APIC ID is derived (after the series) from the vCPU ID _and_ the
topology information. The vCPU alone will work out in all cases because
it'll be cached in the vlapic hvm structure.

I guess the comment could be rewritten as "... rather than from the vCPU
ID alone..."

Cheers,
Alejandro

