Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0305F906AB5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 13:05:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739811.1146750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHiGC-0002BC-Nc; Thu, 13 Jun 2024 11:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739811.1146750; Thu, 13 Jun 2024 11:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHiGC-00029B-Kw; Thu, 13 Jun 2024 11:04:52 +0000
Received: by outflank-mailman (input) for mailman id 739811;
 Thu, 13 Jun 2024 11:04:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHiGB-000295-D0
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 11:04:51 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfff9c0f-2974-11ef-b4bb-af5377834399;
 Thu, 13 Jun 2024 13:04:48 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a6266ffdba8so98409466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 04:04:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56db67fdsm60232266b.46.2024.06.13.04.04.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 04:04:47 -0700 (PDT)
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
X-Inumbo-ID: bfff9c0f-2974-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718276688; x=1718881488; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yHyBPG1v4jxtE+C9XxxXDIA0QAMppzlHeGNld6GN0qo=;
        b=Hw/z9Bi7Evt6c4mDD16s0+NmEl9DsjOm/UUVYyxr1+PaAznAWSOOuNQjrbtBNfnt89
         DNkcKQX1aAFkPVvee6Zl0s+XWKxcOnifXU1KeenudncSKemGkmU6REx/QFiPgqdNs4hW
         jX4u8Ag8qmi4JK2ufMwiJvj+bkMxGH2rPziTjxcpjcy8kaA6ZF3EjVkgq824qm+UgEsV
         oNmKlJuQpgsDaskmD/Gu6BX/VGy6mLQskyM5dFLw1203j5igCtfIDrqyOGh4hIOAMNHH
         r3GRmmnfa1AMz58ZFVONQqFZfkTDLy5vz7Ne2LZvudEoA9QOSKYFWyLZxmZPG7Q90xFy
         rOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718276688; x=1718881488;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHyBPG1v4jxtE+C9XxxXDIA0QAMppzlHeGNld6GN0qo=;
        b=sFbe1dNVvfzvIwUXCTDYi2fsXCtjzZr+ZUcVnOGiIaS8pQunHtDf4U4EFfw8RjJDOP
         aTuTZViRSgGQAqOxIJyiqXPm6FghacBiMGpRwhRbvBtACByDfDn1FCPpmkT98Hujpt1s
         GqxCyjdiWRJrQrstGN1PuEtK4yr7/Q7c6zWrhiJw0BWqa2EV2lQRRDCnXCsdYEknYO3L
         QYHtp6e01HgZMeNQdGIiBNoHwcq4w4X5dgr0tvK4yH7Wc3kMwAYmDssHIGWDGs5drNIj
         LG7HRFHJM2XK4dE9qi23t/zbl4ctdSoq2Mbaf3GVN0EQPXoqQWsbFQG6iBwORrxh2ARQ
         IXFA==
X-Forwarded-Encrypted: i=1; AJvYcCV+9iEwKgC0NS472ykdRYz4rElQFe073SJQczG3dJwv0ZEChtFLgyAzdJkEaJBqdW2zywxxw9LFXp+mFVJW0Mdnk/DgrXDMBjiQemBZbWs=
X-Gm-Message-State: AOJu0Yw5iUijt0chDiO5TlMF8JBAfsdoHx4I/h0EzMtqwfOuoolS0SHq
	3KbLDOPmVW0CxA+sG75M654dJkRc7U3c09SsGKbQhYQrmLkV22ADl6KqfCtirA==
X-Google-Smtp-Source: AGHT+IEUqV6GZEUF+9Ng0UwhYMLUGOZOIUpfUOD8Lq26I6wqQOSlT3GwIL+MV3IJhdhGl+w7AzNg4g==
X-Received: by 2002:a17:906:c105:b0:a6f:489a:3a28 with SMTP id a640c23a62f3a-a6f489a3ba7mr320763966b.61.1718276687715;
        Thu, 13 Jun 2024 04:04:47 -0700 (PDT)
Message-ID: <c18dbed6-07ac-4ce6-a5e4-4a72cbac3e12@suse.com>
Date: Thu, 13 Jun 2024 13:04:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC for-4.20 v1 1/1] x86/hvm: Introduce Xen-wide ASID Allocator
To: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 george.dunlap@citrix.com, xen-devel@lists.xenproject.org
References: <cover.1716551380.git.vaishali.thakkar@vates.tech>
 <f15042aa7953d986b6dbd4dc1512024ba6362420.1716551380.git.vaishali.thakkar@vates.tech>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <f15042aa7953d986b6dbd4dc1512024ba6362420.1716551380.git.vaishali.thakkar@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.05.2024 14:31, Vaishali Thakkar wrote:
> --- a/xen/arch/x86/hvm/asid.c
> +++ b/xen/arch/x86/hvm/asid.c
> @@ -27,8 +27,8 @@ boolean_param("asid", opt_asid_enabled);
>   * the TLB.
>   *
>   * Sketch of the Implementation:
> - *
> - * ASIDs are a CPU-local resource.  As preemption of ASIDs is not possible,
> + * TODO(vaishali): Update this comment
> + * ASIDs are Xen-wide resource.  As preemption of ASIDs is not possible,
>   * ASIDs are assigned in a round-robin scheme.  To minimize the overhead of
>   * ASID invalidation, at the time of a TLB flush,  ASIDs are tagged with a
>   * 64-bit generation.  Only on a generation overflow the code needs to
> @@ -38,20 +38,21 @@ boolean_param("asid", opt_asid_enabled);
>   * ASID useage to retain correctness.
>   */
>  
> -/* Per-CPU ASID management. */
> +/* Xen-wide ASID management */
>  struct hvm_asid_data {
> -   uint64_t core_asid_generation;
> +   uint64_t asid_generation;
>     uint32_t next_asid;
>     uint32_t max_asid;
> +   uint32_t min_asid;
>     bool disabled;
>  };
>  
> -static DEFINE_PER_CPU(struct hvm_asid_data, hvm_asid_data);
> +static struct hvm_asid_data asid_data;
>  
>  void hvm_asid_init(int nasids)
>  {
>      static int8_t g_disabled = -1;
> -    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
> +    struct hvm_asid_data *data = &asid_data;
>  
>      data->max_asid = nasids - 1;
>      data->disabled = !opt_asid_enabled || (nasids <= 1);
> @@ -64,67 +65,73 @@ void hvm_asid_init(int nasids)
>      }
>  
>      /* Zero indicates 'invalid generation', so we start the count at one. */
> -    data->core_asid_generation = 1;
> +    data->asid_generation = 1;
>  
>      /* Zero indicates 'ASIDs disabled', so we start the count at one. */
>      data->next_asid = 1;

Both of these want to become compile-time initializers now, I think. The
comments would move there, but especially the second one also looks to
need updating.

>  }
>  
> -void hvm_asid_flush_vcpu_asid(struct hvm_vcpu_asid *asid)
> +void hvm_asid_flush_domain_asid(struct hvm_domain_asid *asid)
>  {
>      write_atomic(&asid->generation, 0);
>  }
>  
> -void hvm_asid_flush_vcpu(struct vcpu *v)
> +void hvm_asid_flush_domain(struct domain *d)
>  {
> -    hvm_asid_flush_vcpu_asid(&v->arch.hvm.n1asid);
> -    hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
> +    hvm_asid_flush_domain_asid(&d->arch.hvm.n1asid);
> +    //hvm_asid_flush_domain_asid(&vcpu_nestedhvm(v).nv_n2asid);

While in Lisbon Andrew indicated to not specifically bother about the nested
case, I don't think he meant by this to outright break it. Hence imo
something like this will need taking care of (which it being commented out
may or may not indicate is the plan).

>  }
>  
> -void hvm_asid_flush_core(void)
> +void hvm_asid_flush_all(void)
>  {
> -    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
> +    struct hvm_asid_data *data = &asid_data;
>  
> -    if ( data->disabled )
> +    if ( data->disabled)
>          return;
>  
> -    if ( likely(++data->core_asid_generation != 0) )
> +    if ( likely(++data->asid_generation != 0) )
>          return;
>  
>      /*
> -     * ASID generations are 64 bit.  Overflow of generations never happens.
> -     * For safety, we simply disable ASIDs, so correctness is established; it
> -     * only runs a bit slower.
> -     */
> +    * ASID generations are 64 bit.  Overflow of generations never happens.
> +    * For safety, we simply disable ASIDs, so correctness is established; it
> +    * only runs a bit slower.
> +    */

Please don't screw up indentation; this comment was well-formed before. What
I question is whether, with the ultimate purpose in mind, the comment actually
will continue to be correct. We can't simply disable ASIDs when we have SEV
VMs running, can we?

>      printk("HVM: ASID generation overrun. Disabling ASIDs.\n");
>      data->disabled = 1;
>  }
>  
> -bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid)
> +/* This function is called only when first vmenter happens after creating a new domain */
> +bool hvm_asid_handle_vmenter(struct hvm_domain_asid *asid)

With what the comment says, the function likely wants giving a different
name.

>  {
> -    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
> +    struct hvm_asid_data *data = &asid_data;
>  
>      /* On erratum #170 systems we must flush the TLB. 
>       * Generation overruns are taken here, too. */
>      if ( data->disabled )
>          goto disabled;
>  
> -    /* Test if VCPU has valid ASID. */
> -    if ( read_atomic(&asid->generation) == data->core_asid_generation )
> +    /* Test if domain has valid ASID. */
> +    if ( read_atomic(&asid->generation) == data->asid_generation )
>          return 0;
>  
>      /* If there are no free ASIDs, need to go to a new generation */
>      if ( unlikely(data->next_asid > data->max_asid) )
>      {
> -        hvm_asid_flush_core();
> +        // TODO(vaishali): Add a check to pick the asid from the reclaimable asids if any
> +        hvm_asid_flush_all();
>          data->next_asid = 1;
>          if ( data->disabled )
>              goto disabled;
>      }
>  
> -    /* Now guaranteed to be a free ASID. */
> -    asid->asid = data->next_asid++;
> -    write_atomic(&asid->generation, data->core_asid_generation);
> +    /* Now guaranteed to be a free ASID. Only assign a new asid if the ASID is 1 */
> +    if (asid->asid == 0)

Comment and code appear to not be matching up, which makes it difficult
to figure what is actually meant.

> +    {
> +        asid->asid = data->next_asid++;
> +    }
> +
> +    write_atomic(&asid->generation, data->asid_generation);

Is this generation thing really still relevant when a domain has an ASID
assigned once and for all? Plus, does allocation really need to happen as
late as immediately ahead of the first VM entry? Can't that be part of
normal domain creation?

> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -2519,10 +2519,7 @@ static int cf_check hvmemul_tlb_op(
>  
>      case x86emul_invpcid:
>          if ( x86emul_invpcid_type(aux) != X86_INVPCID_INDIV_ADDR )
> -        {
> -            hvm_asid_flush_vcpu(current);
>              break;
> -        }

What replaces this flush? Things like this (also e.g. the change to
switch_cr3_cr4(), and there are more further down) would be good to
explain in the description, perhaps by more generally explaining how
the flushing model changes.

> --- a/xen/arch/x86/hvm/svm/asid.c
> +++ b/xen/arch/x86/hvm/svm/asid.c
> @@ -7,31 +7,35 @@
>  #include <asm/amd.h>
>  #include <asm/hvm/nestedhvm.h>
>  #include <asm/hvm/svm/svm.h>
> -
> +#include <asm/processor.h>
>  #include "svm.h"
> +#include "xen/cpumask.h"

The blank line was here on purpose; please keep it. And please never
use "" for xen/ includes. That #include also wants moving up; the
"canonical" way of arranging #include-s would be <xen/...> first, then
<asm/...>, then anything custom. Each block separated by a blank line.

> -void svm_asid_init(const struct cpuinfo_x86 *c)
> +void svm_asid_init(void)

Since this is now global initialization, can't it be __init?

>  {
> +    unsigned int cpu = smp_processor_id();
> +    const struct cpuinfo_x86 *c;
>      int nasids = 0;
>  
> -    /* Check for erratum #170, and leave ASIDs disabled if it's present. */
> -    if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
> -        nasids = cpuid_ebx(0x8000000aU);
> -
> +    for_each_online_cpu( cpu ) {

Nit (style): Brace goes on its own line.

> +        c = &cpu_data[cpu];
> +        /* Check for erratum #170, and leave ASIDs disabled if it's present. */
> +        if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
> +            nasids += cpuid_ebx(0x8000000aU);

Why += ? Don't you mean to establish the minimum across all CPUs? Which would
be assuming there might be an asymmetry, which generally we assume there
isn't.

And if you invoke CPUID, you'll need to do so on the very CPU, not many times
in a row on the BSP.

> +    }
>      hvm_asid_init(nasids);
>  }
>  
>  /*
> - * Called directly before VMRUN.  Checks if the VCPU needs a new ASID,
> + * Called directly before first VMRUN.  Checks if the domain needs an ASID,
>   * assigns it, and if required, issues required TLB flushes.
>   */
>  void svm_asid_handle_vmrun(void)

Again the function name will likely want to change if this is called just
once per domain. Question then again is whether really this needs doing as
late as ahead of the VMRUN, of whether perhaps at least parts can be done
during normal domain creation.

>  {
> -    struct vcpu *curr = current;
> -    struct vmcb_struct *vmcb = curr->arch.hvm.svm.vmcb;
> -    struct hvm_vcpu_asid *p_asid =
> -        nestedhvm_vcpu_in_guestmode(curr)
> -        ? &vcpu_nestedhvm(curr).nv_n2asid : &curr->arch.hvm.n1asid;
> +    struct vcpu *v = current;

Please don't move away from naming this "curr".

> +    struct domain *d = current->domain;

Then this, if it needs to be a local variable in the first place, would
want to be "currd".

> @@ -988,8 +986,8 @@ static void noreturn cf_check svm_do_resume(void)
>          v->arch.hvm.svm.launch_core = smp_processor_id();
>          hvm_migrate_timers(v);
>          hvm_migrate_pirqs(v);
> -        /* Migrating to another ASID domain.  Request a new ASID. */
> -        hvm_asid_flush_vcpu(v);
> +        /* Migrating to another ASID domain. Request a new ASID. */
> +        hvm_asid_flush_domain(v->domain);
>      }

Is "migrating to another ASID domain" actually still possible in the new
model?

> @@ -2358,8 +2351,9 @@ static bool cf_check is_invlpg(
>  
>  static void cf_check svm_invlpg(struct vcpu *v, unsigned long linear)
>  {
> +    v = current;

???

>      /* Safe fallback. Take a new ASID. */
> -    hvm_asid_flush_vcpu(v);
> +    hvm_asid_flush_domain(v->domain);
>  }
>  
>  static bool cf_check svm_get_pending_event(
> @@ -2533,6 +2527,7 @@ void asmlinkage svm_vmexit_handler(void)
>      struct cpu_user_regs *regs = guest_cpu_user_regs();
>      uint64_t exit_reason;
>      struct vcpu *v = current;
> +    struct domain *d = current->domain;
>      struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>      int insn_len, rc;
>      vintr_t intr;
> @@ -2927,7 +2922,7 @@ void asmlinkage svm_vmexit_handler(void)
>          }
>          if ( (insn_len = svm_get_insn_len(v, INSTR_INVLPGA)) == 0 )
>              break;
> -        svm_invlpga_intercept(v, regs->rax, regs->ecx);
> +        svm_invlpga_intercept(d, regs->rax, regs->ecx);
>          __update_guest_eip(regs, insn_len);
>          break;

The function may certainly benefit from introducing "d" (or better "currd"),
but please uniformly then (in a separate, prereq patch). Else just use
v->domain in this one place you're changing.

> --- a/xen/arch/x86/include/asm/hvm/asid.h
> +++ b/xen/arch/x86/include/asm/hvm/asid.h
> @@ -8,25 +8,24 @@
>  #ifndef __ASM_X86_HVM_ASID_H__
>  #define __ASM_X86_HVM_ASID_H__
>  
> +struct hvm_domain;
> +struct hvm_domain_asid;

I can see the need for the latter, but why the former?

> -struct vcpu;
> -struct hvm_vcpu_asid;
> -
> -/* Initialise ASID management for the current physical CPU. */
> +/* Initialise ASID management distributed across all CPUs. */
>  void hvm_asid_init(int nasids);
>  
>  /* Invalidate a particular ASID allocation: forces re-allocation. */
> -void hvm_asid_flush_vcpu_asid(struct hvm_vcpu_asid *asid);
> +void hvm_asid_flush_domain_asid(struct hvm_domain_asid *asid);
>  
> -/* Invalidate all ASID allocations for specified VCPU: forces re-allocation. */
> -void hvm_asid_flush_vcpu(struct vcpu *v);
> +/* Invalidate all ASID allocations for specified domain */
> +void hvm_asid_flush_domain(struct domain *d);
>  
> -/* Flush all ASIDs on this processor core. */
> -void hvm_asid_flush_core(void);
> +/* Flush all ASIDs on all processor cores */
> +void hvm_asid_flush_all(void);
>  
>  /* Called before entry to guest context. Checks ASID allocation, returns a
>   * boolean indicating whether all ASIDs must be flushed. */
> -bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid);
> +bool hvm_asid_handle_vmenter(struct hvm_domain_asid *asid);

Much like the comment on the definition, this comment then wants adjusting,
too.

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -525,6 +525,7 @@ void ept_sync_domain(struct p2m_domain *p2m);
>  
>  static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
>  {
> +    struct domain *d = current->domain;

Why "current" when "v" is being passed in?

> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -739,13 +739,13 @@ static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap)
>          if ( !flush_vcpu(v, vcpu_bitmap) )
>              continue;
>  
> -        hvm_asid_flush_vcpu(v);
> -
>          cpu = read_atomic(&v->dirty_cpu);
>          if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) && v->is_running )
>              __cpumask_set_cpu(cpu, mask);
>      }
>  
> +    hvm_asid_flush_domain(d);

Hmm, that's potentially much more flushing than is needed here. There
surely wants to be a wait to flush at a granularity smaller than the
entire domain. (Likely applies elsewhere as well.)

> @@ -2013,6 +2014,12 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>          printk(XENLOG_INFO "Parked %u CPUs\n", num_parked);
>      smp_cpus_done();
>  
> +    /* Initialize xen-wide ASID handling */
> +    #ifdef CONFIG_HVM
> +    if ( cpu_has_svm )
> +        svm_asid_init();
> +    #endif

Nit (style): Pre-processor directives want to start in the leftmost column.

Overall I'm afraid I have to say that there's too much hackery and too
little description to properly reply to this to address its RFC-ness. You
also don't really raise any specific questions.

Jan

