Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C449A880F72
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 11:17:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695842.1086031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmszF-0006tO-TU; Wed, 20 Mar 2024 10:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695842.1086031; Wed, 20 Mar 2024 10:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmszF-0006rX-PX; Wed, 20 Mar 2024 10:15:57 +0000
Received: by outflank-mailman (input) for mailman id 695842;
 Wed, 20 Mar 2024 10:15:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+RR=K2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmszF-0006rM-0U
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 10:15:57 +0000
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d489a695-e6a2-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 11:15:52 +0100 (CET)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-789f1b59a28so240029685a.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 03:15:52 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 wj18-20020a05620a575200b00789e7ddf8a5sm4733604qkn.17.2024.03.20.03.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 03:15:51 -0700 (PDT)
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
X-Inumbo-ID: d489a695-e6a2-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710929752; x=1711534552; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c4HjjdW+jTvr14dLOqe97qddyAnOoGqhxHjAWy88ljo=;
        b=UQJZ3b0UPhQPMwF0VHXnK2VAO09oGfwc3YA+2eGO0hdyakppHIjB83zSQ3VL4of2br
         wH1vq/lQqd0FRc8kq+/dBoJlAYHUMi7mnGkh9AjzvZr018slrT8YPg9wyFsYSTd93b7N
         MZ7hT8jRsuDbg9a8OrxclXxKYJcs/x6Ac82SA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710929752; x=1711534552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4HjjdW+jTvr14dLOqe97qddyAnOoGqhxHjAWy88ljo=;
        b=izj3Q315VTrYa62IM+uYnGGIiiw66mh/kNTjYafq80WCRIgrWj72832VvjIVSRrEf/
         5D0TfXgNFxLDeH9mnRdqkU002GwFwbkHLTcp7srY1DomdnasckFyE+LANNqhqcUFqsWU
         h3bkGTxr56+J5OcOLgEUl2HlTJ7ZHT0Rg51FqcyCgs7RUbCm+xgpy2064amk8/PCKxo2
         EAvBNk8lcBcmgJQI61ZswQi7BsorqrkIiWNXv9pKW1sF1NA+8ovCqXaKalFNOZ1bEwoC
         oZu6dkmqLuVyNFnHrtv8MYXO05ud4se+EmFcOcGr5fmmakep4k7HfnhI467nxnt0vrXL
         LvPw==
X-Gm-Message-State: AOJu0Yxi6oCXl+hJ7+kwgmHabunSwy2KbEHx1Pa+saKSK+Rempq3WRKV
	j557+79RJRn2he64o30VuMogDMy8CFQsdQJ5DpBlNPzCqyQzP0HD+7pqxPE0eA0=
X-Google-Smtp-Source: AGHT+IFabEO3CtLSxc0P/ZbUPjk1MoFAplibhlPpDrjEEC61aQzR+zwvJWmY1VRe+FQulquyb1C/bw==
X-Received: by 2002:a05:620a:13d1:b0:789:e703:675 with SMTP id g17-20020a05620a13d100b00789e7030675mr15003883qkl.15.1710929751720;
        Wed, 20 Mar 2024 03:15:51 -0700 (PDT)
Date: Wed, 20 Mar 2024 11:15:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 5/6] xen/x86: Derive topologically correct x2APIC IDs
 from the policy
Message-ID: <Zfq3VVbEA4ljxllI@macbook>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-6-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240109153834.4192-6-alejandro.vallejo@cloud.com>

On Tue, Jan 09, 2024 at 03:38:33PM +0000, Alejandro Vallejo wrote:
> Implements the helper for mapping vcpu_id to x2apic_id given a valid
> topology in a policy. The algo is written with the intention of extending
> it to leaves 0x1f and e26 in the future.
> 
> Toolstack doesn't set leaf 0xb and the HVM default policy has it cleared,
> so the leaf is not implemented. In that case, the new helper just returns
> the legacy mapping.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  tools/tests/cpu-policy/test-cpu-policy.c | 128 +++++++++++++++++++++++
>  xen/include/xen/lib/x86/cpu-policy.h     |   2 +
>  xen/lib/x86/policy.c                     |  75 +++++++++++--
>  3 files changed, 199 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
> index 301df2c002..6ff5c1dd3d 100644
> --- a/tools/tests/cpu-policy/test-cpu-policy.c
> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> @@ -650,6 +650,132 @@ static void test_is_compatible_failure(void)
>      }
>  }
>  
> +static void test_x2apic_id_from_vcpu_id_success(void)
> +{
> +    static struct test {

const

> +        const char *name;
> +        uint32_t vcpu_id;
> +        uint32_t x2apic_id;
> +        struct cpu_policy policy;
> +    } tests[] = {
> +        {
> +            .name = "3v: 3 t/c, 8 c/s", .vcpu_id = 3, .x2apic_id = 1 << 2,
> +            .policy = {
> +                .x86_vendor = X86_VENDOR_AMD,
> +                .topo.subleaf = {
> +                    [0] = { .nr_logical = 3, .level = 0, .type = 1, .id_shift = 2, },
> +                    [1] = { .nr_logical = 8, .level = 1, .type = 2, .id_shift = 5, },
> +                },

Don't we need a helper that gets passed the number of cores per
socket and threads per core and fills this up?

I would introduce this first, add a test for it, and then do this
testing using the helper.

> +            },
> +        },
> +        {
> +            .name = "6v: 3 t/c, 8 c/s", .vcpu_id = 6, .x2apic_id = 2 << 2,
> +            .policy = {
> +                .x86_vendor = X86_VENDOR_AMD,
> +                .topo.subleaf = {
> +                    [0] = { .nr_logical = 3, .level = 0, .type = 1, .id_shift = 2, },
> +                    [1] = { .nr_logical = 8, .level = 1, .type = 2, .id_shift = 5, },
> +                },
> +            },
> +        },
> +        {
> +            .name = "24v: 3 t/c, 8 c/s", .vcpu_id = 24, .x2apic_id = 1 << 5,
> +            .policy = {
> +                .x86_vendor = X86_VENDOR_AMD,
> +                .topo.subleaf = {
> +                    [0] = { .nr_logical = 3, .level = 0, .type = 1, .id_shift = 2, },
> +                    [1] = { .nr_logical = 8, .level = 1, .type = 2, .id_shift = 5, },
> +                },
> +            },
> +        },
> +        {
> +            .name = "35v: 3 t/c, 8 c/s", .vcpu_id = 35,
> +            .x2apic_id = (35 % 3) | (((35 / 3) % 8)  << 2) | ((35 / 24) << 5),
> +            .policy = {
> +                .x86_vendor = X86_VENDOR_AMD,
> +                .topo.subleaf = {
> +                    [0] = { .nr_logical = 3, .level = 0, .type = 1, .id_shift = 2, },
> +                    [1] = { .nr_logical = 8, .level = 1, .type = 2, .id_shift = 5, },
> +                },
> +            },
> +        },
> +        {
> +            .name = "96v: 7 t/c, 3 c/s", .vcpu_id = 96,
> +            .x2apic_id = (96 % 7) | (((96 / 7) % 3)  << 3) | ((96 / 21) << 5),
> +            .policy = {
> +                .x86_vendor = X86_VENDOR_AMD,
> +                .topo.subleaf = {
> +                    [0] = { .nr_logical = 7, .level = 0, .type = 1, .id_shift = 3, },
> +                    [1] = { .nr_logical = 3, .level = 1, .type = 2, .id_shift = 5, },
> +                },
> +            },
> +        },
> +        {
> +            .name = "3v: 3 t/c, 8 c/s", .vcpu_id = 3, .x2apic_id = 1 << 2,
> +            .policy = {
> +                .x86_vendor = X86_VENDOR_INTEL,
> +                .topo.subleaf = {
> +                    [0] = { .nr_logical = 3,  .level = 0, .type = 1, .id_shift = 2, },
> +                    [1] = { .nr_logical = 24, .level = 1, .type = 2, .id_shift = 5, },
> +                },
> +            },
> +        },
> +        {
> +            .name = "6v: 3 t/c, 8 c/s", .vcpu_id = 6, .x2apic_id = 2 << 2,
> +            .policy = {
> +                .x86_vendor = X86_VENDOR_INTEL,
> +                .topo.subleaf = {
> +                    [0] = { .nr_logical = 3,  .level = 0, .type = 1, .id_shift = 2, },
> +                    [1] = { .nr_logical = 24, .level = 1, .type = 2, .id_shift = 5, },
> +                },
> +            },
> +        },
> +        {
> +            .name = "24v: 3 t/c, 8 c/s", .vcpu_id = 24, .x2apic_id = 1 << 5,
> +            .policy = {
> +                .x86_vendor = X86_VENDOR_INTEL,
> +                .topo.subleaf = {
> +                    [0] = { .nr_logical = 3,  .level = 0, .type = 1, .id_shift = 2, },
> +                    [1] = { .nr_logical = 24, .level = 1, .type = 2, .id_shift = 5, },
> +                },
> +            },
> +        },
> +        {
> +            .name = "35v: 3 t/c, 8 c/s", .vcpu_id = 35,
> +            .x2apic_id = (35 % 3) | (((35 / 3) % 8)  << 2) | ((35 / 24) << 5),
> +            .policy = {
> +                .x86_vendor = X86_VENDOR_INTEL,
> +                .topo.subleaf = {
> +                    [0] = { .nr_logical = 3,  .level = 0, .type = 1, .id_shift = 2, },
> +                    [1] = { .nr_logical = 24, .level = 1, .type = 2, .id_shift = 5, },
> +                },
> +            },
> +        },
> +        {
> +            .name = "96v: 7 t/c, 3 c/s", .vcpu_id = 96,
> +            .x2apic_id = (96 % 7) | (((96 / 7) % 3)  << 3) | ((96 / 21) << 5),
> +            .policy = {
> +                .x86_vendor = X86_VENDOR_INTEL,
> +                .topo.subleaf = {
> +                    [0] = { .nr_logical = 7,   .level = 0, .type = 1, .id_shift = 3, },
> +                    [1] = { .nr_logical = 21,  .level = 1, .type = 2, .id_shift = 5, },
> +                },
> +            },
> +        },
> +    };
> +
> +    printf("Testing x2apic id from vcpu id success:\n");
> +
> +    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
> +    {
> +        struct test *t = &tests[i];

const

> +        uint32_t x2apic_id = x86_x2apic_id_from_vcpu_id(&t->policy, t->vcpu_id);

Newline preferably.

> +        if ( x2apic_id != t->x2apic_id )
> +            fail("FAIL - '%s'. bad x2apic_id: expected=%u actual=%u\n",
> +                 t->name, t->x2apic_id, x2apic_id);
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
> +    test_x2apic_id_from_vcpu_id_success();
> +
>      if ( nr_failures )
>          printf("Done: %u failures\n", nr_failures);
>      else
> diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
> index 65f6335b32..d81ae2f47c 100644
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -550,6 +550,8 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>  /**
>   * Calculates the x2APIC ID of a vCPU given a CPU policy
>   *
> + * If the policy lacks leaf 0xb falls back to legacy mapping of apic_id=cpu*2
> + *
>   * @param p          CPU policy of the domain.
>   * @param vcpu_id    vCPU ID of the vCPU.
>   * @returns x2APIC ID of the vCPU.
> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
> index a3b24e6879..2a50bc076a 100644
> --- a/xen/lib/x86/policy.c
> +++ b/xen/lib/x86/policy.c
> @@ -2,15 +2,78 @@
>  
>  #include <xen/lib/x86/cpu-policy.h>
>  
> -uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t vcpu_id)
> +static uint32_t parts_per_higher_scoped_level(const struct cpu_policy *p, size_t lvl)
>  {
>      /*
> -     * TODO: Derive x2APIC ID from the topology information inside `p`
> -     *       rather than from vCPU ID. This bodge is a temporary measure
> -     *       until all infra is in place to retrieve or derive the initial
> -     *       x2APIC ID from migrated domains.
> +     * `nr_logical` reported by Intel is the number of THREADS contained in
> +     * the next topological scope. For example, assuming a system with 2
> +     * threads/core and 3 cores/module in a fully symmetric topology,
> +     * `nr_logical` at the core level will report 6. Because it's reporting
> +     * the number of threads in a module.
> +     *
> +     * On AMD/Hygon, nr_logical is already normalized by the higher scoped
> +     * level (cores/complex, etc) so we can return it as-is.
>       */
> -    return vcpu_id * 2;
> +    if ( p->x86_vendor != X86_VENDOR_INTEL || !lvl )
> +        return p->topo.subleaf[lvl].nr_logical;
> +
> +    return p->topo.subleaf[lvl].nr_logical / p->topo.subleaf[lvl - 1].nr_logical;

I think this is an optimization because we only have 2 levels,
otherwise you would need a loop like:

unsigned int nr = p->topo.subleaf[lvl].nr_logical
for ( unsigned int i; i < lvl; i++ )
    nr /= p->topo.subleaf[i].nr_logical;

If that's the case I think we need a
BUILD_BUG_ON(ARRAY_SIZE(p->topo.subleaf) > 1);

> +}
> +
> +uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id)

Can you keep the previous vcpu_id parameter name?  Or alternatively
adjust the prototype to also be id.

Thanks, Roger.

