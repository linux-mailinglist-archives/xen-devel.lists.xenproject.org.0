Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A8DA9EB90
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 11:14:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970363.1359084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9KZS-0003k1-K0; Mon, 28 Apr 2025 09:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970363.1359084; Mon, 28 Apr 2025 09:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9KZS-0003iX-HI; Mon, 28 Apr 2025 09:14:38 +0000
Received: by outflank-mailman (input) for mailman id 970363;
 Mon, 28 Apr 2025 09:14:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9KZQ-0003iR-MD
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 09:14:36 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e6f48c1-2411-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 11:14:26 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so39665085e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 02:14:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2ad112sm149173605e9.24.2025.04.28.02.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 02:14:25 -0700 (PDT)
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
X-Inumbo-ID: 2e6f48c1-2411-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745831666; x=1746436466; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1EYo2AiIT3qbT7CK0uDRHACAazbH5QViWpYJFODduDk=;
        b=d+kO/1u9C0s/vjV2tjX9zCRKzraSwSpTS454fJ8G+IB1YTd6WJd2wACgmkN9pWmPhC
         M/sUdM1YRThdz8U/E3rIGZYD/SDHh0ch7/TrUfpyJtvM1sU88m73uevwXremHi3rYlPN
         Oqk6OoKvrGC6ZWaDWjOeNq7fOzpL3WSlZiauu76yuxdFXNXEYEfw/B6RkyJrBjM32RxA
         QJjuKPffb2ZZE09Wb0uaTBDuXAnZgUc41pU0gEdG1ihCWzZJANnq1MiBIUdfx1r5lady
         lq5WsUTniPKAVoeLJTR8gjL2Vihit8TZxFvRCjWDUzqVaWlzpv0Nn/+xcyVkEO4lvTmX
         WD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745831666; x=1746436466;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EYo2AiIT3qbT7CK0uDRHACAazbH5QViWpYJFODduDk=;
        b=lDH/2IfHs15o6ai0vJaxqXF6Qp/RkaaPzwwXp0FTRV+G+w47Axbf5tOOWlojWHPGsP
         gyMYsyC69zsUTQEs4Oww7P07C7Rf+QtjUrcfkWoPPYKpRFsGIl5jbuGzkrQozRQZkz08
         ZSdXhuKJJuUNOtQrrTrBMNdpN688P0reIb7V0j8FzUHlrmuKYp2z1zhqBSfsqXxNsndt
         1nimSSHowuhkhIwH+QV59x5BOWG+ey2rZ1xTbGpZsZYY13+PDQ8tzQ33Mpex61lc3WVw
         INuYm/sCn1tvtCRzgjTP8Py/hqaOzyNZz5AE0YxtbnfAQ+z1GAlk87BW6WUKXnDraqyL
         PINg==
X-Forwarded-Encrypted: i=1; AJvYcCUFgMwWX+IAwKD8T5bwkDuCKKs6td8pv2VJmXh+fyMe5VkCAAwoyt6gFtmoQJc2axAbIiER+kmAYdc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw83xEC/xQ204xO+mc5SoP9C+KB+J2sHkdEFpxaxaU0QsRNNkkn
	DwXbbttPO9E7pGhlrUeDNW5jMwcmNqYJ6AtMxO9qLtqzxrE4BFUJaPD7CKEb2w==
X-Gm-Gg: ASbGncuSH5+l+memNSkQCmCbnffb3lxE5PSgYkDpfX7S4VBLX2jqy0VN8jz3NzHdi+5
	/oaYQBHMEs6k3DZyzYhBfIL4JjEscatvnuFm2FmH2NBEvT94sJz+dVjKwXOz/gxTLRa1RVH9WVH
	18gemFSKL9pNh7YMiVZ0lomGVX9gnTfBFnbvZ52AyR/eJXT/BmDeYaXSR62pv4gVm22/OngvlIp
	DIJF0gjI1xJ61f3YOxSY1JD1vgHGaRaKYm803g5ew1vtmW50Iam0IuIU4b6YcqMAnkJHYRobZHx
	3FaToeiw13S8q7jX60amXW8CzFb9vWyO3kS1FraL/bUdgXzqT1Cw676f789znZBH+vWEoh1jVAs
	FGbqZBV9f6gdnkA2ubgklEACl3Q==
X-Google-Smtp-Source: AGHT+IGQbGzPEw5YvEKdpWA3OpLBbOtEW602Bf2tejLfJfUivpCUEpKAVbY5yi4Njlfc3cIMgX8YRw==
X-Received: by 2002:a05:600c:55c7:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-4409c4615e0mr107966385e9.6.1745831665544;
        Mon, 28 Apr 2025 02:14:25 -0700 (PDT)
Message-ID: <f8be084a-e259-456b-b30d-677b128978e3@suse.com>
Date: Mon, 28 Apr 2025 11:14:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/domain: unify domain ID allocation
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250422215322.521464-1-dmukhin@ford.com>
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
In-Reply-To: <20250422215322.521464-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2025 23:54, dmkhn@proton.me wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -66,6 +66,57 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
>  static struct domain *domain_hash[DOMAIN_HASH_SIZE];
>  struct domain *domain_list;
>  
> +/* Domain ID allocator */
> +static unsigned int domid_last;
> +
> +static inline bool is_free_domid(domid_t dom)
> +{
> +    struct domain *d = rcu_lock_domain_by_id(dom);
> +
> +    if ( d )
> +        rcu_unlock_domain(d);
> +
> +    return !d;
> +}
> +
> +/*
> + * Allocate new domain ID based on the hint.
> + *
> + * If hint is outside of valid [0..DOMID_FIRST_RESERVED - 1] range of IDs,
> + * perform an exhaustive search starting from the end of the used domain ID
> + * range, excluding hardware_domid.
> + */
> +domid_t domid_alloc(domid_t hint)
> +{
> +    domid_t domid = DOMID_INVALID;
> +
> +    if ( hint < DOMID_FIRST_RESERVED )
> +    {
> +        /* Exact match. */
> +        if ( is_free_domid(hint) )
> +            domid = hint;
> +    }
> +    else
> +    {
> +        for ( domid = domid_last + 1; domid != domid_last; domid++ )
> +        {
> +            if ( domid == DOMID_FIRST_RESERVED )
> +                domid = 0;
> +
> +            if ( domid == hardware_domid )
> +                continue;
> +
> +            if ( is_free_domid(domid) )
> +                break;
> +        }
> +
> +        if ( domid != domid_last )
> +            domid_last = domid;
> +    }
> +
> +    return domid;
> +}

The function name suggests the ID returned is firmly allocated by the time
the caller gets to see / use it. Yet that's not the case. Two back-to-back
calls here with the same argument will yield the same result, afaict. This
supports my prior statement that I don't think it is a good idea to
"centralize" things like this.

Jan

