Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F97CC8EC21
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 15:30:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174005.1498984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOd0w-0006DO-VX; Thu, 27 Nov 2025 14:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174005.1498984; Thu, 27 Nov 2025 14:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOd0w-0006Bx-Sq; Thu, 27 Nov 2025 14:30:30 +0000
Received: by outflank-mailman (input) for mailman id 1174005;
 Thu, 27 Nov 2025 14:30:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOd0v-0006Bp-Rd
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 14:30:29 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ee14c72-cb9d-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 15:30:28 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso5962955e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 06:30:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790add608bsm101630305e9.5.2025.11.27.06.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 06:30:27 -0800 (PST)
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
X-Inumbo-ID: 9ee14c72-cb9d-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764253828; x=1764858628; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/nCtCbcp9WHnGdKGrQY84Zv3JHOKX8MlJLRZtmME4e4=;
        b=F2AoFgxAQY2Z96TLYqawZz1tXqL21GoketoWoHqgYtOvmaJZ1Ntvy2gDpj3IOEsqXy
         JrCxyS2gqC91F47jyTO7goutm0b2Hu1DQQdd6FZl+QaCwY+nyThY/5vf2a+1OFk0W59Q
         PaJm8Tdf0CqrOO6rJRLCeMPOgiVVsm9c//7Q1ihQImJvSW2s3KS5DFUjAuBh6CykidgA
         eCfuMMc/10QWwcRCaNQQYSGfVLC3Z2tl0zoku1uDJCdo0ehhayw5HlnEImBgHKzHqJUG
         ACDvtMjtsdUyDc5VI7qIvNauJyFMlppVDTBsV7LOAHTQAHPax1OIKrYBCpcanky2TOQz
         +qsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764253828; x=1764858628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nCtCbcp9WHnGdKGrQY84Zv3JHOKX8MlJLRZtmME4e4=;
        b=QyyATLmIYQVwHzMuz4VKrL7wW4vahnVOKGUy3403rVeGPTrdvwWilmQ8MEnKi+3cGW
         EucT9kjsDH5javyC8KeGrgVlmDjv8qm9nQBRzQ9Jyl4920PPqIbwXVXMiPkivp2Yhv/T
         nPZ4IERsE91h0AdnFE6ZRjqbuKPUv/LudywfrLQxMfDvNvLPZfLiqsNeNe4pdmDzJd3O
         uDU+xiw7opXHaKF0CrTARtgjdtce0QlnibVMF0inrw/QWLG3Pxgyaba8JGWGh4bZPRCH
         t2cAE+tKM9oE7xnymyoGDAnB1QvR2wQ3d2MnQhShrIpMGN1IKJ5cSPMx5MPC26DrlgQl
         NBCg==
X-Forwarded-Encrypted: i=1; AJvYcCVBCHsY34Wovjyp1xkWQFdIJM5E/90069b9Z1Nyw7wKG9RQxO2iNo/j/7jLjmuh+9Xb+R3llhK3TuA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZHB6hUeuiR6f+95/MtdlNvr298MSdumJtCHgoY5tYtnIi1WCH
	6T83iwoLqh/OLCySxU4/mxDD03p5DremTHDzHgNu6pv85x8VwdUGTN3D8VGGVsAYkQ==
X-Gm-Gg: ASbGncsv5m66DU4bUpiPZn1l7rRA2vBXq3ZvknFGIKLSabvncp5nTOQoFFdTUejNPKc
	zhgF02xL6VtUQPfbs9II1mvnwVdaHa6IDElgIH231YoZn/fDJnS6G0dOlgDO+6L7zc3FIp86nzC
	LSpXtxPVm3cpYKVfaLSYcPbPQ920w2fU/hLuuijtvjj9QrxJZlaWueqBH+YdZWsDQCMMxQKG40b
	iMXlNyx0wx98H5O77xBzGtfJ8bEZxQ/rz8jC0MoVQqZVmdY4DZ/FIrVaCxLXD3C09EaLPVOu8aA
	hfIXBdWZ6YGD/kdDujFm6hzjdmUoDuVKUSrthgEVY1CHGtjP1oFEA7z3nzLK6XQb5RgLKQlXRW0
	84oPt4rsY7/oc9SlZHzfBHXoQiiQPsVwD2nrfZYTa+0U9mcYrVtmGYFk7uvPC4caxsWLpcrOcin
	73L8LcvUSCEzaTOoFYcvkUOqoUMWwhYg/JKxMgNoB++ZPgB44r/TVIuK8ZS+5lBLxbg3om9ukbC
	1KkvNJ+c8t2Bw==
X-Google-Smtp-Source: AGHT+IHsQTUkbtg6wdNXGpZ7YoC0siP3Q0V0V9p4yc7FrVuK0sRxmBWIq55FPBOv31jPs+oL+0mHpg==
X-Received: by 2002:a05:600c:4f4c:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-477c0184b1emr266067185e9.14.1764253827755;
        Thu, 27 Nov 2025 06:30:27 -0800 (PST)
Message-ID: <e7f7e2df-5881-40f6-b157-bd01c0d514f5@suse.com>
Date: Thu, 27 Nov 2025 15:30:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/4] x86/hap: Migrate tlb flush logic to
 p2m->flush_tlb
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1764248710.git.teddy.astie@vates.tech>
 <94bf385598cc7d70ecaecfae670e305581ad83b3.1764248710.git.teddy.astie@vates.tech>
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
In-Reply-To: <94bf385598cc7d70ecaecfae670e305581ad83b3.1764248710.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2025 14:39, Teddy Astie wrote:
> Now that p2m->need_flush is set when modifying the pagetable in a way that
> requires it. We can move the tlb flush logic to p2m->tlb_flush.
> 
> Introduce hap_tlb_flush to do it, which is called by main p2m logic (e.g p2m_unlock,
> p2m_tlb_flush_sync, ...). Drop inline calls of guest_flush_tlb_mask which are now
> redundant with what now does p2m->flush_tlb, allowing us to drop guest_flush_tlb_*
> as it is now unused.
> 
> No function change intended.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

I think the safety / correctness of the change needs explaining in the
description. TLB flushing is often delicate, so it wants to be made pretty
clear that no necessary flush is now omitted anywhere. It also wants to be
made clear, from a performance angle, no new excess flushing is added (see
below for a respective question towards EPT).

> --- a/xen/arch/x86/flushtlb.c
> +++ b/xen/arch/x86/flushtlb.c
> @@ -320,18 +320,3 @@ void cache_writeback(const void *addr, unsigned int size)
>      asm volatile ("sfence" ::: "memory");
>  }
>  
> -unsigned int guest_flush_tlb_flags(const struct domain *d)
> -{
> -    bool shadow = paging_mode_shadow(d);
> -    bool asid = is_hvm_domain(d) && (cpu_has_svm || shadow);

There's an SVM dependency here, which ...

> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -105,8 +105,6 @@ int hap_track_dirty_vram(struct domain *d,
>              p2m_change_type_range(d, begin_pfn, begin_pfn + nr_frames,
>                                    p2m_ram_rw, p2m_ram_logdirty);
>  
> -            guest_flush_tlb_mask(d, d->dirty_cpumask);
> -
>              memset(dirty_bitmap, 0xff, size); /* consider all pages dirty */
>          }
>          else
> @@ -191,7 +189,6 @@ static int cf_check hap_enable_log_dirty(struct domain *d)
>       * to be read-only, or via hardware-assisted log-dirty.
>       */
>      p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
> -    guest_flush_tlb_mask(d, d->dirty_cpumask);
>  
>      return 0;
>  }
> @@ -220,7 +217,6 @@ static void cf_check hap_clean_dirty_bitmap(struct domain *d)
>       * be read-only, or via hardware-assisted log-dirty.
>       */
>      p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
> -    guest_flush_tlb_mask(d, d->dirty_cpumask);
>  }
>  
>  /************************************************/
> @@ -806,18 +802,14 @@ static void cf_check hap_update_paging_modes(struct vcpu *v)
>      put_gfn(d, cr3_gfn);
>  }
>  
> -static void cf_check
> -hap_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
> +void hap_p2m_tlb_flush(struct p2m_domain *p2m)
>  {
> -    struct domain *d = p2m->domain;
> -
> -    if ( oflags & _PAGE_PRESENT )
> -        guest_flush_tlb_mask(d, d->dirty_cpumask);
> +    flush_mask(p2m->domain->dirty_cpumask, FLUSH_HVM_ASID_CORE);
>  }
>  
>  void hap_p2m_init(struct p2m_domain *p2m)
>  {
> -    p2m->write_p2m_entry_post = hap_write_p2m_entry_post;
> +    p2m->tlb_flush = hap_p2m_tlb_flush;
>  }

... is entirely lost throughout the hap.c changes. Are we now doing excess flushing
for EPT? I guess the relevant point here is that hap_p2m_init(), despite its name
suggesting otherwise, doesn't come into play when EPT is in use. (This could do
with cleaning up, as right now it then has to be the case that in a AMD_SVM=n
configuration that function is unreachable, violating a Misra rule.

Also, why would hap_p2m_tlb_flush() lose static and cf_check that the prior hook
function validly had?

Jan

