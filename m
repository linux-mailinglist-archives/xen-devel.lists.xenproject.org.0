Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A314498D1E9
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 13:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808705.1220698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svx7k-0007Nt-89; Wed, 02 Oct 2024 11:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808705.1220698; Wed, 02 Oct 2024 11:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svx7k-0007Kk-4q; Wed, 02 Oct 2024 11:02:28 +0000
Received: by outflank-mailman (input) for mailman id 808705;
 Wed, 02 Oct 2024 11:02:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svx7i-0007Kc-3C
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 11:02:26 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccc6b99a-80ad-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 13:02:23 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c88e45f467so1153486a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 04:02:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88240543csm7483986a12.6.2024.10.02.04.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 04:02:20 -0700 (PDT)
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
X-Inumbo-ID: ccc6b99a-80ad-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727866942; x=1728471742; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CusrC6wfqJFEuuEHwMe9BQ1mFEgvQcg3FQVAGhQFz78=;
        b=D+OtEJ52ItzSXd0GEUSSrZiWDvxzdi+ys7FplXdMBonW5TQ1FolM3yNzHWuPpKWl7D
         23FgGOA3XBpS7Y4+g63P5Z+O+wfPFhVE44XJTSLcVFZWKpBsTAaOtHWjxfr26rhCtTmL
         zEmZub+kNjmsrf5O9CFaRxDOrBmT+ga9ZRbdnwOO7eZj8vWMplqaIA3dVVDzbYQtfEJ5
         s2dWyxhWydf9Gyb5BUX46qhi45EoYLR5CxTuCUKfdlBildFDaAkWC7Q/1uvHbQfaGgVP
         40QcFibkWsQmaOfNLuPgZK6sfQuy/yl6e3FrXqfqwIMNxk6RN+KaAjw3Cf0NZ/Obdeap
         VI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727866942; x=1728471742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CusrC6wfqJFEuuEHwMe9BQ1mFEgvQcg3FQVAGhQFz78=;
        b=DIQv5S8JyMz6Do5iej/3OSPA9jcJ+vRr4LlRkkZlYtt7JD5bwDNlN1N+O+wXWrhvA2
         7VxqClqsH/hGHSXygnziiJfzfifKtye23C1rTpDaR6ueYnTBc1rmRceFdyt44t2+sCHU
         3UbTfOQUwSR+OgO9G9k0KAGY6ASvdD/Ylql+KXYBRnBITzmFmhKqEo+YGvhZ+3vVxYGa
         SG4bTf0Vq80EglYW4GsqomkKJSZNNX4o5aLfA+xEPhClh9ZOsbeI+3fAZK0/yLkB39IW
         mbfZ6a0sEuhn/Pc75Px4DDybFR9HUUkRxbyqVAzO+RBlxAsj4BTOH5ReU7snUfE/bMkw
         hbsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH2Pmn0Hsd3Ohk2bQ4S0+AE+f9Zu/LvsfwtgyFBWgGPh2PBA8UaQJBPLUQZfI6x2g41vpbWhjGlDM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw41SWkFrnu+OcVLitFdegO0I2fP3ISXSj+V7az7ovoLa3FgJwu
	FcXkkw4QzAbgSVilnBSOi60RM3QCtGpdm3oviK0BEOcTIbrJvR0YbzmhjE6lRnYEvaZhCceMTko
	=
X-Google-Smtp-Source: AGHT+IEk+ESlIoEYagnJZ73sL2WuSKUlA04EY6CACjpAF7gNUkhG1gNcSnlJS+k15IpZvFCKcavpDg==
X-Received: by 2002:a05:6402:5215:b0:5c5:b90a:5803 with SMTP id 4fb4d7f45d1cf-5c8b115e626mr3159124a12.7.1727866941522;
        Wed, 02 Oct 2024 04:02:21 -0700 (PDT)
Message-ID: <c618d4ac-0735-44ac-9f37-f3146039d0d7@suse.com>
Date: Wed, 2 Oct 2024 13:02:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC-for-4.20 v2 1/1] x86/hvm: Introduce Xen-wide ASID allocator
To: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <cover.1723574652.git.vaishali.thakkar@vates.tech>
 <8512ff4c4d78fcd59e6f3185d8a5abd9ef3168b8.1723574652.git.vaishali.thakkar@vates.tech>
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
In-Reply-To: <8512ff4c4d78fcd59e6f3185d8a5abd9ef3168b8.1723574652.git.vaishali.thakkar@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.08.2024 21:01, Vaishali Thakkar wrote:
> Currently ASID generation and management is done per-PCPU. This
> scheme is incompatible with SEV technologies as SEV VMs need to
> have a fixed ASID associated with all vcpus of the VM throughout
> it's lifetime.
> 
> This commit introduces a Xen-wide allocator which initializes
> the asids at the start of xen and allows to have a fixed asids
> throughout the lifecycle of all domains. Having a fixed asid
> for non-SEV domains also presents us with the opportunity to
> further take use of AMD instructions like TLBSYNC and INVLPGB
> for broadcasting the TLB invalidations.
> 
> Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>

I'm afraid some aspects / intentions remain unclear because of commentary
apparently contradicting what's said above. With that it's hard to give
back an "overall looks okay" or alike.

Of course the change could do with splitting some, if at all possible.

> @@ -784,6 +785,7 @@ int arch_domain_create(struct domain *d,
>                         unsigned int flags)
>  {
>      bool paging_initialised = false;
> +    struct hvm_domain_asid *p_asid;
>      uint32_t emflags;
>      int rc;
>  
> @@ -898,6 +900,11 @@ int arch_domain_create(struct domain *d,
>  
>      spec_ctrl_init_domain(d);
>  
> +    if ( is_hvm_domain(d) ) {
> +        p_asid = &d->arch.hvm.n1asid;
> +        hvm_asid_domain_create(p_asid);
> +    }

I don't see a need for the local variable. If you absolutely want one, it
would want to be limited in scope.

I further don't see why this lives here. Would seem to belong into
hvm_domain_initialise().

Also style-wise please have opening figure braces on their own lines
(applicable in several further places).

> --- a/xen/arch/x86/hvm/asid.c
> +++ b/xen/arch/x86/hvm/asid.c
> @@ -11,51 +11,66 @@
>  #include <xen/sched.h>
>  #include <xen/smp.h>
>  #include <xen/percpu.h>
> +
> +#include <asm/bitops.h>
>  #include <asm/hvm/asid.h>
>  
>  /* Xen command-line option to enable ASIDs */
>  static bool __read_mostly opt_asid_enabled = true;
>  boolean_param("asid", opt_asid_enabled);
>  
> +unsigned long *hvm_asid_bitmap;
> +unsigned long *hvm_reclaim_asid_bitmap;

Both __ro_after_init?

> +static DEFINE_SPINLOCK(hvm_asid_lock);
> +
>  /*
> - * ASIDs partition the physical TLB.  In the current implementation ASIDs are
> - * introduced to reduce the number of TLB flushes.  Each time the guest's
> - * virtual address space changes (e.g. due to an INVLPG, MOV-TO-{CR3, CR4}
> - * operation), instead of flushing the TLB, a new ASID is assigned.  This
> - * reduces the number of TLB flushes to at most 1/#ASIDs.  The biggest
> - * advantage is that hot parts of the hypervisor's code and data retain in
> - * the TLB.
> - *
>   * Sketch of the Implementation:
> - *
> - * ASIDs are a CPU-local resource.  As preemption of ASIDs is not possible,
> - * ASIDs are assigned in a round-robin scheme.  To minimize the overhead of
> - * ASID invalidation, at the time of a TLB flush,  ASIDs are tagged with a
> - * 64-bit generation.  Only on a generation overflow the code needs to
> - * invalidate all ASID information stored at the VCPUs with are run on the
> - * specific physical processor.  This overflow appears after about 2^80
> - * host processor cycles, so we do not optimize this case, but simply disable
> - * ASID useage to retain correctness.
> + * ASIDs are assigned in a round-robin scheme per domain as part of
> + * global allocator scheme and doesn't change during the lifecycle of
> + * the domain. Once vcpus are initialized and are up, we assign the
> + * same ASID to all vcpus of that domain at the first VMRUN. With the
> + * new scheme, we don't need to assign the new ASID during MOV-TO-{CR3,
> + * CR4}. In the case of INVLPG, we flush the TLB entries belonging to
> + * the vcpu and do the reassignment of the ASID belonging to the given
> + * domain.

Why reassignment? In the description you say that ASIDs no longer change while
a domain exists.

>  Currently we do not do anything special for flushing guest
> + * TLBs in flush_area_local as wbinvd() should able to handle this.

How's WBINVD coming into the picture here? Here we solely care about TLBs,
which WBINVD is solely about caches.

> In
> + * the future Xen should be able to take an advantage of TLBSYNC and
> + * INVLPGB (AMD SVM) with this scheme.
> +
> + * When the domain is destroyed, ASID goes to the reclaimable ASID pool
> + * for the reuse. We only go for checking in the reclaimable ASID pool
> + * when we run out of ASIDs in the hvm_asid_bitmap.
>   */
>  
> -/* Per-CPU ASID management. */
> +/* Xen-wide ASID management */
>  struct hvm_asid_data {
> -   uint64_t core_asid_generation;
>     uint32_t next_asid;
>     uint32_t max_asid;
>     bool disabled;
>  };
>  
> -static DEFINE_PER_CPU(struct hvm_asid_data, hvm_asid_data);
> +static struct hvm_asid_data asid_data;
>  
> -void hvm_asid_init(int nasids)
> +int hvm_asid_init(int nasids)

While touching this, would you mind also switching the parameter to unsigned
int? (May also apply elsewhere.)

I also can't spot any change to the VMX caller of this function. Right now
it's called as CPUs come online, whereas you now want to have this called
only once (as you apparently do for SVM). Presumably the function then should
become __init.

>  {
> +    struct hvm_asid_data *data = &asid_data;
>      static int8_t g_disabled = -1;
> -    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
>  
>      data->max_asid = nasids - 1;
>      data->disabled = !opt_asid_enabled || (nasids <= 1);
>  
> +    hvm_asid_bitmap = xzalloc_array(unsigned long,
> +                                    BITS_TO_LONGS(data->max_asid));

xv{m,z}alloc() and friends please going forward.

> +    if ( !hvm_asid_bitmap )
> +        return -ENOMEM;
> +
> +    hvm_reclaim_asid_bitmap = xzalloc_array(unsigned long,
> +                                            BITS_TO_LONGS(data->max_asid));
> +    if ( !hvm_reclaim_asid_bitmap ) {
> +        xfree(hvm_asid_bitmap);
> +        hvm_asid_bitmap = NULL;

Please use XFREE() in cases like this one.

> +    }

Missing "return -ENOMEM" here?

> @@ -63,74 +78,67 @@ void hvm_asid_init(int nasids)
>              g_disabled = data->disabled;
>      }
>  
> -    /* Zero indicates 'invalid generation', so we start the count at one. */
> -    data->core_asid_generation = 1;
> +    /* ASID 0 is reserved, so we start the counting from 1 */
> +    data->next_asid = find_first_zero_bit(hvm_asid_bitmap, data->max_asid ) + 1;

Wouldn't you better permanently mark ASID 0 as used in the bitmap?

> -    /* Zero indicates 'ASIDs disabled', so we start the count at one. */
> -    data->next_asid = 1;
> +    return 0;
>  }
>  
> -void hvm_asid_flush_vcpu_asid(struct hvm_vcpu_asid *asid)
> +void hvm_asid_flush_domain_asid(struct hvm_domain_asid *asid)
>  {
>      write_atomic(&asid->generation, 0);
>  }

Can't this function (and the struct field) go away altogether? ->generation
looks to not otherwise be used anymore. Of course given ...

> -void hvm_asid_flush_vcpu(struct vcpu *v)
> +void hvm_asid_flush_domain(struct domain *d)
>  {
> -    hvm_asid_flush_vcpu_asid(&v->arch.hvm.n1asid);
> -    hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
> +    hvm_asid_flush_domain_asid(&d->arch.hvm.n1asid);
> +    hvm_asid_flush_domain_asid(&d->arch.hvm.nv_n2asid);
>  }

... this I suspect the function needs to survive, but do something different
now.

> -void hvm_asid_flush_core(void)
> +/* We still allow flushing on vcpu level for non-SEV domain */
> +void hvm_asid_flush_vcpu(struct vcpu *v)
>  {
> -    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
> -
> -    if ( data->disabled )
> -        return;
> -
> -    if ( likely(++data->core_asid_generation != 0) )
> -        return;
> -
> -    /*
> -     * ASID generations are 64 bit.  Overflow of generations never happens.
> -     * For safety, we simply disable ASIDs, so correctness is established; it
> -     * only runs a bit slower.
> -     */
> -    printk("HVM: ASID generation overrun. Disabling ASIDs.\n");
> -    data->disabled = 1;
> +    hvm_asid_flush_domain_asid(&v->domain->arch.hvm.n1asid);
> +    hvm_asid_flush_domain_asid(&v->domain->arch.hvm.nv_n2asid);
>  }

The new comment ahead of the function is somewhat confusing, considering
that you flush at domain scope here. Also - any reason not to simply
forward to hvm_asid_flush_domain() then (as long as finer granularity
aren't possible)?

> -bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid)
> +/* This function is called while creating a new domain */
> +bool hvm_asid_domain_create(struct hvm_domain_asid *asid)
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
> -        return 0;
> +    spin_lock(&hvm_asid_lock);
> +
> +    /* We assume that next_asid > max_asid is unlikely at this point*/

Nit: Missing blank at the end of the comment (also elsewhere).

> +    arch__test_and_set_bit(data->next_asid, hvm_asid_bitmap);

No direct calls of such arch__* functions please. __test_and_set_bit() is
what you want to use here, assuming you actually use the result. If the
result isn't needed, __set_bit() is what you want.

As to what the comment says - "unlikely" doesn't mean "impossible", yet
if it was you'd end up with a buffer overrun if I'm not mistaken.

> +    /* Find the next available asid to assign to the domain*/
> +    data->next_asid = find_next_zero_bit(hvm_asid_bitmap, data->next_asid,
> +                                         data->max_asid) + 1;
> +
> +    /* Check if there are any ASIDs to reclaim */
> +    if ( data->next_asid > data->max_asid ) {
> +        data->next_asid = find_next_bit(hvm_reclaim_asid_bitmap, 0,
> +                                             data->max_asid+1);

You don't record that you've used the bit, so the next time we make it
here we'll use the same ASID again.

I wonder anyway: Wouldn't it make sense to move the reclaim bitmap
wholesale to the "normal" one when nothing's left available there, and
clear it afterwards, for bits to then accumulate anew?

> +        spin_unlock(&hvm_asid_lock);
>  
> -    /* If there are no free ASIDs, need to go to a new generation */
> -    if ( unlikely(data->next_asid > data->max_asid) )
> -    {
> -        hvm_asid_flush_core();
> -        data->next_asid = 1;
>          if ( data->disabled )
>              goto disabled;

Is the "disabled" state actually still possible to encounter?

> +
> +        if ( data->next_asid > data->max_asid )
> +            return -EBUSY;
>      }

If you fall out of this if(), ...

> -    /* Now guaranteed to be a free ASID. */
> -    asid->asid = data->next_asid++;
> -    write_atomic(&asid->generation, data->core_asid_generation);
> +    spin_unlock(&hvm_asid_lock);

... you'll end up unlocking this lock a 2nd time.

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -777,6 +777,10 @@ void hvm_domain_destroy(struct domain *d)
>      }
>  
>      destroy_vpci_mmcfg(d);
> +
> +    /* Clear the asid and put it in the reclaimable ASID pool */
> +    clear_bit(d->arch.hvm.n1asid.asid, hvm_asid_bitmap);
> +    set_bit(d->arch.hvm.n1asid.asid, hvm_reclaim_asid_bitmap);
>  }

This feels like a layering violation - I think you want to have
hvm_asid_domain_destroy() for that purpose.

> --- a/xen/arch/x86/hvm/nestedhvm.c
> +++ b/xen/arch/x86/hvm/nestedhvm.c
> @@ -41,8 +41,6 @@ nestedhvm_vcpu_reset(struct vcpu *v)
>      nv->stale_np2m = false;
>      nv->np2m_generation = 0;
>  
> -    hvm_asid_flush_vcpu_asid(&nv->nv_n2asid);

Can this really be dropped without replacement?

> --- a/xen/arch/x86/hvm/svm/asid.c
> +++ b/xen/arch/x86/hvm/svm/asid.c
> @@ -4,16 +4,23 @@
>   * Copyright (c) 2007, Advanced Micro Devices, Inc.
>   */
>  
> +#include <xen/cpumask.h>
> +
> +#include <asm/processor.h>

Please move this latter one ...

>  #include <asm/amd.h>
>  #include <asm/hvm/nestedhvm.h>
>  #include <asm/hvm/svm/svm.h>

... down here, to retain alphabetic sorting.

>  #include "svm.h"
>  
> -void svm_asid_init(const struct cpuinfo_x86 *c)
> +void __init svm_asid_init(void)
>  {
> +    unsigned int cpu = smp_processor_id();
> +    const struct cpuinfo_x86 *c;
>      int nasids = 0;
>  
> +    c = &cpu_data[cpu];
> +
>      /* Check for erratum #170, and leave ASIDs disabled if it's present. */
>      if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
>          nasids = cpuid_ebx(0x8000000aU);

See also the comment at the very bottom: an invocation of the CPUID instruction
needs to run _on_ the CPU in question. Yet I don't see why this function would
need calling more than once anyway. (If it did, you'd have an issue with CPUs
being brought up later.)

> @@ -22,33 +29,31 @@ void svm_asid_init(const struct cpuinfo_x86 *c)
>  }
>  
>  /*
> - * Called directly before VMRUN.  Checks if the VCPU needs a new ASID,
> - * assigns it, and if required, issues required TLB flushes.
> + * Called directly at the VMRUN of a domain to assign
> + * the asid to all associated vcpus of that domain

With that, ...

>   */
> -void svm_asid_handle_vmrun(void)
> +void svm_vcpu_assign_asid(struct vcpu *v)

... why struct vcpu * as parameter, and why "vcpu" in the name?

>  {
> -    struct vcpu *curr = current;
> -    struct vmcb_struct *vmcb = curr->arch.hvm.svm.vmcb;
> -    struct hvm_vcpu_asid *p_asid =
> -        nestedhvm_vcpu_in_guestmode(curr)
> -        ? &vcpu_nestedhvm(curr).nv_n2asid : &curr->arch.hvm.n1asid;
> -    bool need_flush = hvm_asid_handle_vmenter(p_asid);
> +    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
> +    struct hvm_domain_asid *p_asid = &v->domain->arch.hvm.n1asid;
>  
>      /* ASID 0 indicates that ASIDs are disabled. */
>      if ( p_asid->asid == 0 )
>      {
>          vmcb_set_asid(vmcb, true);
>          vmcb->tlb_control =
> -            cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
> +            cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID :
> +            TLB_CTRL_FLUSH_ALL;

Please avoid making unrelated changes especially in already involved patches.

>          return;
>      }
>  
> -    if ( vmcb_get_asid(vmcb) != p_asid->asid )
> +    if ( vmcb_get_asid(vmcb) != p_asid->asid ) {
>          vmcb_set_asid(vmcb, p_asid->asid);
> -
> -    vmcb->tlb_control =
> -        !need_flush ? TLB_CTRL_NO_FLUSH :
> -        cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
> +        vmcb->tlb_control = cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID :
> +                            TLB_CTRL_FLUSH_ALL;
> +    }
> +    else
> +        return;
>  }

What's this "else return" about, when the function ends here anyway?

Overall I'm struggling with what this function is (supposed to be) doing.

> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -486,7 +486,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>      if ( rc )
>          return rc;
>  
> -    /* ASID - Emulation handled in hvm_asid_handle_vmenter() */
> +    /* ASID - Emulation handled in hvm_asid_domain_create */

As it was before, please have the () there to indicate it's a function
the comment talks about.

> @@ -681,6 +681,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
>      struct nestedvcpu *nv = &vcpu_nestedhvm(v);
>      struct nestedsvm *svm = &vcpu_nestedsvm(v);
>      struct vmcb_struct *ns_vmcb;
> +    struct domain *d = v->domain;

I don't think you need this local var, when you use it ...

> @@ -699,7 +700,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
>      if ( svm->ns_asid != vmcb_get_asid(ns_vmcb))
>      {
>          nv->nv_flushp2m = 1;
> -        hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
> +        hvm_asid_flush_domain_asid(&d->arch.hvm.nv_n2asid);

... solely here.

> @@ -179,17 +180,7 @@ static void cf_check svm_update_guest_cr(
>          break;
>      case 3:
>          vmcb_set_cr3(vmcb, v->arch.hvm.hw_cr[3]);
> -        if ( !nestedhvm_enabled(v->domain) )
> -        {
> -            if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
> -                hvm_asid_flush_vcpu(v);
> -        }
> -        else if ( nestedhvm_vmswitch_in_progress(v) )
> -            ; /* CR3 switches during VMRUN/VMEXIT do not flush the TLB. */
> -        else if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
> -            hvm_asid_flush_vcpu_asid(
> -                nestedhvm_vcpu_in_guestmode(v)
> -                ? &vcpu_nestedhvm(v).nv_n2asid : &v->arch.hvm.n1asid);
> +        /* Do not flush during the CR3 switch */
>          break;

I think it would help if the comment would briefly mention how / where else
the necessary flushing is going to be carried out.

> @@ -1017,7 +1006,7 @@ void asmlinkage svm_vmenter_helper(void)
>  
>      ASSERT(hvmemul_cache_disabled(curr));
>  
> -    svm_asid_handle_vmrun();
> +    svm_vcpu_assign_asid(curr);

I don't think we want to call such a function for every VM entry, when the
ASID needs determining just once (before the guest even starts).

> @@ -2359,8 +2345,8 @@ static bool cf_check is_invlpg(
>  
>  static void cf_check svm_invlpg(struct vcpu *v, unsigned long linear)
>  {
> -    /* Safe fallback. Take a new ASID. */
> -    hvm_asid_flush_vcpu(v);
> +    /* Flush the TLB entries belonging to the vcpu and reassign the asid. */
> +    hvm_asid_flush_domain(v->domain);
>  }

Again: reassign?

> @@ -2929,7 +2915,7 @@ void asmlinkage svm_vmexit_handler(void)
>          }
>          if ( (insn_len = svm_get_insn_len(v, INSTR_INVLPGA)) == 0 )
>              break;
> -        svm_invlpga_intercept(v, regs->rax, regs->ecx);
> +        svm_invlpga_intercept(v->domain, regs->rax, regs->ecx);

I don't think such an intercept function should take a struct domain *. If
the determination of ASID is domain-based now, that ought to be handled
inside the function.

> --- a/xen/arch/x86/hvm/svm/svm.h
> +++ b/xen/arch/x86/hvm/svm/svm.h
> @@ -15,9 +15,6 @@ struct cpu_user_regs;
>  struct cpuinfo_x86;
>  struct vcpu;
>  
> -void svm_asid_init(const struct cpuinfo_x86 *c);

This (private to SVM) declaration shouldn't move to a non-private header.

> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -1957,8 +1957,6 @@ void cf_check vmx_do_resume(void)
>           * but the action of another VMCS is deferred till it is switched in.
>           */
>          v->arch.hvm.vmx.hostenv_migrated = 1;
> -
> -        hvm_asid_flush_vcpu(v);

Can this really be left without replacement?

> @@ -1832,8 +1832,6 @@ static void cf_check vmx_update_guest_cr(
>  
>          __vmwrite(GUEST_CR3, v->arch.hvm.hw_cr[3]);
>  
> -        if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
> -            hvm_asid_flush_vcpu(v);
>          break;

Like for SVM please indicate in a comment where else the flushing then
happens. It's not at all obvious to me, I'm afraid.

> @@ -4809,9 +4807,8 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
>  {
>      struct vcpu *curr = current;
>      struct domain *currd = curr->domain;
> -    u32 new_asid, old_asid;
> -    struct hvm_vcpu_asid *p_asid;
> -    bool need_flush;
> +    u32 asid;

Please can you switch to uint32_t when touching such code anyway?

> @@ -4825,36 +4822,22 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
>      if ( !cpu_has_vmx_vpid )
>          goto out;
>      if ( nestedhvm_vcpu_in_guestmode(curr) )
> -        p_asid = &vcpu_nestedhvm(curr).nv_n2asid;
> +        p_asid = &currd->arch.hvm.nv_n2asid;
>      else
> -        p_asid = &curr->arch.hvm.n1asid;
> +        p_asid = &currd->arch.hvm.n1asid;
>  
> -    old_asid = p_asid->asid;
> -    need_flush = hvm_asid_handle_vmenter(p_asid);
> -    new_asid = p_asid->asid;
> -
> -    if ( unlikely(new_asid != old_asid) )
> +    if ( unlikely(asid = p_asid->asid) )
>      {
> -        __vmwrite(VIRTUAL_PROCESSOR_ID, new_asid);
> -        if ( !old_asid && new_asid )
> +        __vmwrite(VIRTUAL_PROCESSOR_ID, asid);
> +        if (!asid) 
>          {
> -            /* VPID was disabled: now enabled. */
> +            /* VPID was disabled: now enabled */
>              curr->arch.hvm.vmx.secondary_exec_control |=
>                  SECONDARY_EXEC_ENABLE_VPID;
>              vmx_update_secondary_exec_control(curr);
>          }
> -        else if ( old_asid && !new_asid )
> -        {
> -            /* VPID was enabled: now disabled. */
> -            curr->arch.hvm.vmx.secondary_exec_control &=
> -                ~SECONDARY_EXEC_ENABLE_VPID;
> -            vmx_update_secondary_exec_control(curr);
> -        }
>      }

I'm afraid I don't understand this change: Shouldn't arrangements once
again be made as the domain is (and vCPU-s are) being constructed?

> @@ -2055,8 +2056,8 @@ static int nvmx_handle_invvpid(struct cpu_user_regs *regs)
>      case INVVPID_INDIVIDUAL_ADDR:
>      case INVVPID_SINGLE_CONTEXT:
>      case INVVPID_ALL_CONTEXT:
> -        hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(current).nv_n2asid);
> -        break;
> +        hvm_asid_flush_domain_asid(&currd->arch.hvm.nv_n2asid);
> +      break;

Please don't screw up indentation.

> --- a/xen/arch/x86/include/asm/hvm/asid.h
> +++ b/xen/arch/x86/include/asm/hvm/asid.h
> @@ -8,25 +8,25 @@
>  #ifndef __ASM_X86_HVM_ASID_H__
>  #define __ASM_X86_HVM_ASID_H__
>  
> +struct hvm_domain_asid;

Blank line here please.

> --- a/xen/arch/x86/include/asm/hvm/svm/svm.h
> +++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
> @@ -21,6 +21,8 @@ bool svm_load_segs(unsigned int ldt_ents, unsigned long ldt_base,
>                     unsigned long fs_base, unsigned long gs_base,
>                     unsigned long gs_shadow);
>  
> +extern void svm_asid_init(void);
> +extern void svm_vcpu_assign_asid(struct vcpu *v);

As indicated, these should live in SVM's private header. Please also omit
"extern" on function decls.

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -525,6 +525,7 @@ void ept_sync_domain(struct p2m_domain *p2m);
>  
>  static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
>  {
> +    struct domain *d = v->domain;

const (if the variable is needed at all)?

> @@ -544,7 +545,7 @@ static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
>          type = INVVPID_ALL_CONTEXT;
>  
>  execute_invvpid:
> -    __invvpid(type, v->arch.hvm.n1asid.asid, (u64)gva);
> +    __invvpid(type, d->arch.hvm.n1asid.asid, (u64)gva);

Please can you drop the pointless cast while touching the line?

> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -739,13 +739,14 @@ static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap)
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
> +    printk(XENLOG_INFO "hvm_asid_flush_vcpu called in HAP code");
> +    hvm_asid_flush_vcpu(v);

Why the printk()?

> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -1395,7 +1395,8 @@ p2m_flush(struct vcpu *v, struct p2m_domain *p2m)
>      ASSERT(v->domain == p2m->domain);
>      vcpu_nestedhvm(v).nv_p2m = NULL;
>      p2m_flush_table(p2m);
> -    hvm_asid_flush_vcpu(v);
> +    printk(XENLOG_INFO "hvm_asid_flush_domain called in p2m_flush");
> +    hvm_asid_flush_domain(v->domain);
>  }

Same question here.

> @@ -1573,8 +1574,7 @@ void np2m_schedule(int dir)
>          {
>              if ( !np2m_valid )
>              {
> -                /* This vCPU's np2m was flushed while it was not runnable */
> -                hvm_asid_flush_core();
> +                /* This vCPU's np2m was flushed while it was not runnable */ 

Please don't introduce trailing whitespace.

> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -305,6 +305,7 @@ int pv_vcpu_initialise(struct vcpu *v)
>      struct domain *d = v->domain;
>      int rc;
>  
> +    printk(XENLOG_INFO "pv_vcpu_initialise called for domain %u", d->domain_id);
>      ASSERT(!is_idle_domain(d));
>  
>      rc = pv_create_gdt_ldt_l1tab(v);

???

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -59,6 +59,7 @@
>  #include <asm/microcode.h>
>  #include <asm/prot-key.h>
>  #include <asm/pv/domain.h>
> +#include <asm/hvm/svm/svm.h>
>  
>  /* opt_nosmp: If true, secondary processors are ignored. */
>  static bool __initdata opt_nosmp;
> @@ -2015,6 +2016,15 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>          printk(XENLOG_INFO "Parked %u CPUs\n", num_parked);
>      smp_cpus_done();
>  
> +    /* Initialize xen-wide ASID handling */
> +    #ifdef CONFIG_HVM
> +    for_each_present_cpu ( i )
> +    {
> +        if ( cpu_has_svm )
> +            svm_asid_init();
> +    }
> +    #endif

Why in a loop? And why for SVM only? (If an #ifdef was really needed here, it
should start in the first column.)

Jan

