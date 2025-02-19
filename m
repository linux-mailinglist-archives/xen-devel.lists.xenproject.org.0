Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8C1A3BE69
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 13:45:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892823.1301767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjSS-0001ZT-Ov; Wed, 19 Feb 2025 12:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892823.1301767; Wed, 19 Feb 2025 12:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjSS-0001Ww-Lz; Wed, 19 Feb 2025 12:45:44 +0000
Received: by outflank-mailman (input) for mailman id 892823;
 Wed, 19 Feb 2025 12:45:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkjSQ-0001Wq-QB
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 12:45:42 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cee7e95-eebf-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 13:45:40 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-abb75200275so590108866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 04:45:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abba7c63162sm473617366b.182.2025.02.19.04.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 04:45:39 -0800 (PST)
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
X-Inumbo-ID: 6cee7e95-eebf-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739969140; x=1740573940; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wif2Fdr2RbD+YoQlG3dfna1JZi2/Ij2TP3fUilI/6B0=;
        b=KUQCAGwKRlHcRaAnU6R9JEvan/F4ohMGseLlhQ8L+06lWN/rmJDK+RvigRyVKcdko1
         NyE09VskOVIW/oT5HaNA0d6WT/afWs1bKLFBf/q6aWsoJMyu8OJkwjW8cTCokmPCA3kv
         Hx4/L3EHbeFdyzKc1mYolweXpzviV3gGGmp31dJXOlipGxN6UT6wtVkvetjWhZV+8gda
         a96xHv6XbidArCocBmcJq9e9WrF/tNEgehNFZibNF7CxIG0azoCi9+2a3YPJzS4E4R9d
         HPSSV+jRAOIOPazjzfGI6ibjFqdYGzgdUW2q4Pb7OnE4ES53EOAgtpbbtEe54FzHJcr+
         9GoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739969140; x=1740573940;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wif2Fdr2RbD+YoQlG3dfna1JZi2/Ij2TP3fUilI/6B0=;
        b=cJ7HLATXPfULfOmXsG204gfnZwfg7231eAeOI2LiR54toY0E4mY+110R03qmFLanDq
         9OzxxA+umQ9Uf2/TUy0sYXzcClnkSlaVffrdiB11sgEkpKWWnakebRMYnelsOWQs5xFO
         xazJYkBjPn+KioLBAje3CJthK8aeBTS5z6Vj+cjC1L9iL2I9jkU7bH+u38Ifwu06wHV2
         mybXMKKAgn9AcOixqsMnZY8UXizqKrUhGx91zaqnBwkNDKtiLXvvpVgcr3DnyXt/xH9N
         4pKKHydoaD4w+efWBPU133ds9Ij4Hr1afbEGvD/pGZWI3p5eR5dBB5qNzFhF6o+DEQOw
         f0KA==
X-Forwarded-Encrypted: i=1; AJvYcCUE6xlGX/H3K82po4tc80RZeaDAORwBLtcU/uTtdErX0A5+LwwQx4r3SyYHVJyfZG85jg+5OVa7DUk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNFwGC6G8xpbGG3ofjJVjQysdbZcJDcUfmJ25obBqljd5AURww
	+MiSR8BXM8Uv0M78Swrmlk4NdeB9pyf16pOuRrxS8IwMPTRPnkE1FYcL45+KhQ==
X-Gm-Gg: ASbGnctnAVf1v9AAtv7uLRGoaT9ESpCWN1Lt5ah50C1sZ84ijXXr61I5O7HJFg5d4n8
	eWp+NJD2AqeG+cSvvjRQEWW0t529/1iLgqpd+/hos+oqJzUXqU81zyjjEoHJH92XP0k5z2eScGe
	d3Pj85S3FF1G/nnEqbEBeLt4Fjieq8oEp//W+JyHeGJxDhX/pyKgbJjZ0kZISSV4O67S5DN18i5
	F5Q5K1/aOtYS8BdNhEM/b2OK011m087E1i3I+6qGgIIa3z0Wy/ItIBz/AjY1Ix5L3Tu4Hvm1wgM
	/Xo3D6F1EG4xHdu7HeEqPAv8ZcKmwAEgMOLXZ4ey0krPuh9fXOxK7pHShBmts5cvoYrk6DA8NKM
	t
X-Google-Smtp-Source: AGHT+IHtxIHS2KHXZe8pe6DRCO0VOewo6uhgK6QS19iCZCawiczlOIZSE1YwBPdTF/5te9IrjCyb+w==
X-Received: by 2002:a17:906:478b:b0:aba:667d:7cd6 with SMTP id a640c23a62f3a-abb70b2580fmr1569468666b.18.1739969139956;
        Wed, 19 Feb 2025 04:45:39 -0800 (PST)
Message-ID: <bc6b785c-627e-4185-aa02-b90b9e592d08@suse.com>
Date: Wed, 19 Feb 2025 13:45:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250218095130.2666580-1-luca.fancellu@arm.com>
 <20250218095130.2666580-2-luca.fancellu@arm.com>
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
In-Reply-To: <20250218095130.2666580-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.02.2025 10:51, Luca Fancellu wrote:
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -110,6 +110,8 @@ extern int8_t iommu_hwdom_reserved;
>  
>  extern unsigned int iommu_dev_iotlb_timeout;
>  
> +#ifdef CONFIG_HAS_PASSTHROUGH
> +
>  int iommu_setup(void);
>  int iommu_hardware_setup(void);
>  
> @@ -122,6 +124,28 @@ int arch_iommu_domain_init(struct domain *d);
>  void arch_iommu_check_autotranslated_hwdom(struct domain *d);
>  void arch_iommu_hwdom_init(struct domain *d);
>  
> +#else
> +
> +static inline int iommu_setup(void)
> +{
> +    return -ENODEV;
> +}
> +
> +static inline int iommu_domain_init(struct domain *d, unsigned int opts)
> +{
> +    /*
> +     * When !HAS_PASSTHROUGH, iommu_enabled is set to false and the expected
> +     * behaviour of this function is to return success in that case.
> +     */
> +    return 0;
> +}

Hmm. Would the function be anywhere near likely to do anything else than
what it's expected to do? My original concern here was with "opts"
perhaps asking for something that cannot be supported. But that was wrong
thinking on my part. Here what you do is effectively open-code what the
real iommu_domain_init() would do: Return success when !is_iommu_enabled().
Which in turn follows from !iommu_enabled when !HAS_PASSTHROUGH.

On that basis I'd be okay if the comment was dropped again. Else it imo
wants re-wording to get closer to the explanation above.

> @@ -383,12 +429,12 @@ struct domain_iommu {
>  #define iommu_set_feature(d, f)   set_bit(f, dom_iommu(d)->features)
>  #define iommu_clear_feature(d, f) clear_bit(f, dom_iommu(d)->features)
>  
> +#ifdef CONFIG_HAS_PASSTHROUGH
>  /* Are we using the domain P2M table as its IOMMU pagetable? */
>  #define iommu_use_hap_pt(d)       (IS_ENABLED(CONFIG_HVM) && \
>                                     dom_iommu(d)->hap_pt_share)
>  
>  /* Does the IOMMU pagetable need to be kept synchronized with the P2M */
> -#ifdef CONFIG_HAS_PASSTHROUGH
>  #define need_iommu_pt_sync(d)     (dom_iommu(d)->need_sync)
>  
>  int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,

Coming back to my v2 comment: Why exactly is this change needed here? If
things build fine without the macro being defined when !HAS_PASSTHROUGH,
surely they will also build fine with it being defined? As per the
respective revlog entry, this change looks to belong into whatever is
going to be done to deal with the one Arm use of the macro. Or maybe
it's unneeded altogether.

Jan

