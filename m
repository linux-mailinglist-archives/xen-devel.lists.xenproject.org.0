Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1093CA10AD9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 16:31:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871480.1282473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXis7-0008M3-A2; Tue, 14 Jan 2025 15:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871480.1282473; Tue, 14 Jan 2025 15:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXis7-0008K3-6A; Tue, 14 Jan 2025 15:30:27 +0000
Received: by outflank-mailman (input) for mailman id 871480;
 Tue, 14 Jan 2025 15:30:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXis6-0008Jv-0b
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 15:30:26 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7786b86c-d28c-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 16:30:21 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43634b570c1so40613865e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 07:30:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e3853b6sm14995598f8f.44.2025.01.14.07.30.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 07:30:20 -0800 (PST)
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
X-Inumbo-ID: 7786b86c-d28c-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736868621; x=1737473421; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pcfmpAgzk9ixb/ApUpSQ84RZ2MGK8LnCK+xilUkeWj8=;
        b=P/tUKKCjy6xEk8kPvNHhvKNHsqmAJpppzzyRRdvqFx2KdDnX0/+dpzux7wzEQ3kzUn
         dVLmvUDeDSeHRzQloqhfFeCHs0CkwZ0wlkL0xpusrvTE0oWIFQPap3qOcRfEAz2+x/k8
         0JPbin08VKrroozEp1kUeXs4zCVtXIfPeKTSvo/PKoGcqQquvDGr/PZoxV/P9gS5NeVP
         vPuaK9QTIPCl/e8NmG9cWuZbtkwB9HXEYeE6HW6uqZYnl1JBFogfjbk+PWTnhxkbvkEs
         7iVyP/O9OAC78N1NH0D8XRzt6/vveZSGG72Hz8UGWr22fGiOQNsU09lUdCqRTcXwcmRJ
         XUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736868621; x=1737473421;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcfmpAgzk9ixb/ApUpSQ84RZ2MGK8LnCK+xilUkeWj8=;
        b=PLkvtTj4ZqjabsRfcS1qpoNqhKQkpN36Yuy0M+vOLIbxg2NE0lB6KOnf3Os24jRF7h
         nbzc/3ZezgFMJ4UqLGygm5DpB4ahs+XnEnvbjT7x/tvIWRnAGZ2Sr7A4/WIQA9QKjADw
         VhFiD+mwzU9IujsuhW/a0T3NSowEoqDAp/z4jR6nlOrUz7oQXA7Xab40sUEwbBSJgKxa
         jCZtNoOosUWwVauc+ADV1Cm4JAxnRlwr7QuR0spiI4KngBoKPsXp3CFfONAWHmpEw+Tu
         VUss+LtYCU5VjmRKQNxVfYFwALBaiCqoSVk3d1D8F3ZOk0TFqOA3LbrImG8ZxZd7Mf3S
         sl5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyu5Q+89wV+JSP1+CZD3DRRu6dak26/Nd8KVLhGw96+FMhjJ0Pcz9Jf4jAAeM3hiBxy6+QS7hqlQo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1etMd5LLfCn/gS+GWJi5KoJfNAFj6/Nf5o1Zwqc19T7EYAOin
	WAR8Q7EkcJ50YmDZ7vUR9C+MTJAqZt6U8DFtzdTtqsHWI757AG3kNPa0QTtZCysgsDBKbDpYOFc
	=
X-Gm-Gg: ASbGncv4/0ROdUEpUyqaiAnPe7CLcQV+BtKJ2NG/5rrCqd0WxAng0HLG0OtezTd5mOi
	JZDsXFUhO7WB20+JvxcT28QbMjeNUv3Am0xZWi+y6B0Nds66V1kpLBE94fCwexnfKuxizp3RF7M
	dmemiKNcmiJvn6qspK3b3h5L56zFu3Zo29BTi02d9Ul6P3Tq+KXQj8OKHtmsJBbP/yhgpdS4XYV
	z8LfHoEf4yFZMsXHcpFke0h6DFFxoP6Yrly0PZX12IJ1P7hsTMggD+fPF6bVL6qTXpuHuvZXNDo
	qmxS3WKCKL6VgM+lldHA5Iq2VlnTU76cAfSpBCvUNw==
X-Google-Smtp-Source: AGHT+IFaxdXQ/rbRXKnOeN56OsWuH7yzR0ZP9r53IpXTJHN40rVW4ipVSikA7DUhTnQozVvhwSLZPQ==
X-Received: by 2002:a05:6000:1acd:b0:38a:8b0a:78da with SMTP id ffacd0b85a97d-38a8b0a7b87mr19242800f8f.42.1736868620902;
        Tue, 14 Jan 2025 07:30:20 -0800 (PST)
Message-ID: <7a05d031-d664-47a9-a9c0-5579fe4cfd9f@suse.com>
Date: Tue, 14 Jan 2025 16:30:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2.1 06/18] x86/pv: set/clear guest GDT mappings using
 {populate,destroy}_perdomain_mapping()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250108142659.99490-7-roger.pau@citrix.com>
 <20250108151133.858-1-roger.pau@citrix.com>
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
In-Reply-To: <20250108151133.858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2025 16:11, Roger Pau Monne wrote:
> The pv_{set,destroy}_gdt() functions rely on the L1 table(s) that contain such
> mappings being stashed in the domain structure, and thus such mappings being
> modified by merely updating the L1 entries.
> 
> Switch both pv_{set,destroy}_gdt() to instead use
> {populate,destory}_perdomain_mapping().

Like for an earlier patch it doesn't really become clear why what is being done
wants / needs doing. I might guess that it's the "stashed in the domain structure"
that you ultimately want to get rid of?

> --- a/xen/arch/x86/pv/descriptor-tables.c
> +++ b/xen/arch/x86/pv/descriptor-tables.c
> @@ -49,23 +49,20 @@ bool pv_destroy_ldt(struct vcpu *v)
>  
>  void pv_destroy_gdt(struct vcpu *v)
>  {
> -    l1_pgentry_t *pl1e = pv_gdt_ptes(v);
> -    mfn_t zero_mfn = _mfn(virt_to_mfn(zero_page));
> -    l1_pgentry_t zero_l1e = l1e_from_mfn(zero_mfn, __PAGE_HYPERVISOR_RO);
>      unsigned int i;
>  
>      ASSERT(v == current || !vcpu_cpu_dirty(v));
>  
> -    v->arch.pv.gdt_ents = 0;

How can this validly go away?

> -    for ( i = 0; i < FIRST_RESERVED_GDT_PAGE; i++ )
> -    {
> -        mfn_t mfn = l1e_get_mfn(pl1e[i]);
> +    if ( v->arch.cr3 )
> +        destroy_perdomain_mapping(v, GDT_VIRT_START(v),
> +                                  ARRAY_SIZE(v->arch.pv.gdt_frames));

How is v->arch.cr3 being non-zero related to the GDT area needing
destroying?

> -        if ( (l1e_get_flags(pl1e[i]) & _PAGE_PRESENT) &&
> -             !mfn_eq(mfn, zero_mfn) )
> -            put_page_and_type(mfn_to_page(mfn));
> +    for ( i = 0; i < ARRAY_SIZE(v->arch.pv.gdt_frames); i++)
> +    {
> +        if ( !v->arch.pv.gdt_frames[i] )
> +            break;
>  
> -        l1e_write(&pl1e[i], zero_l1e);
> +        put_page_and_type(mfn_to_page(_mfn(v->arch.pv.gdt_frames[i])));
>          v->arch.pv.gdt_frames[i] = 0;
>      }
>  }
> @@ -74,8 +71,8 @@ int pv_set_gdt(struct vcpu *v, const unsigned long frames[],
>                 unsigned int entries)
>  {
>      struct domain *d = v->domain;
> -    l1_pgentry_t *pl1e;
>      unsigned int i, nr_frames = DIV_ROUND_UP(entries, 512);
> +    mfn_t mfns[ARRAY_SIZE(v->arch.pv.gdt_frames)];

Having this array is kind of odd - it'll hold all the same values as
frames[], just under a different type. Considering the further copying
done ...

> @@ -90,6 +87,8 @@ int pv_set_gdt(struct vcpu *v, const unsigned long frames[],
>          if ( !mfn_valid(mfn) ||
>               !get_page_and_type(mfn_to_page(mfn), d, PGT_seg_desc_page) )
>              goto fail;
> +
> +        mfns[i] = mfn;
>      }
>  
>      /* Tear down the old GDT. */
> @@ -97,12 +96,9 @@ int pv_set_gdt(struct vcpu *v, const unsigned long frames[],
>  
>      /* Install the new GDT. */
>      v->arch.pv.gdt_ents = entries;
> -    pl1e = pv_gdt_ptes(v);
>      for ( i = 0; i < nr_frames; i++ )
> -    {
>          v->arch.pv.gdt_frames[i] = frames[i];

... here, would it perhaps be an option to change ->arch.pv.gdt_frames[]
to mfn_t[], thus allowing ...

> -        l1e_write(&pl1e[i], l1e_from_pfn(frames[i], __PAGE_HYPERVISOR_RW));
> -    }
> +    populate_perdomain_mapping(v, GDT_VIRT_START(v), mfns, nr_frames);

... that array to be passed into here?

Jan

