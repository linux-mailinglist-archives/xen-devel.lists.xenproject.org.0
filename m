Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 997FC8BCC29
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:42:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717539.1119844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vn8-0003w5-CK; Mon, 06 May 2024 10:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717539.1119844; Mon, 06 May 2024 10:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vn8-0003t2-9d; Mon, 06 May 2024 10:41:54 +0000
Received: by outflank-mailman (input) for mailman id 717539;
 Mon, 06 May 2024 10:41:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3vn6-0003sw-Pp
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:41:52 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f3a8b0e-0b95-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 12:41:51 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51f71e4970bso1983753e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:41:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 hc17-20020a05622a2a1100b00437b4048972sm4984776qtb.18.2024.05.06.03.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 03:41:50 -0700 (PDT)
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
X-Inumbo-ID: 3f3a8b0e-0b95-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714992111; x=1715596911; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WI60SXQx2PFmM3yU66qoV6vyK5R/kzpLS52lw1aCV3s=;
        b=glbtTpcqB+wN6nnENwgo+EgAjWpJNitu8fP4MLSuIsI6AKBcbFWkgxOS0YL9kwkkbv
         IgzIWJQ9ffOCu+OVBzNSCsNeTGkaKQ8HGFqtzRyVGTrtoOCjIgfgLHD8yiA6G4MmuYuz
         FjP1uzjnjvBzAOJBdDfVRKHl9LOxoYgwuUY7IjM1k0VPiyFGWDDMOJV9UZuvIEjmXz9F
         PS5XOM9zKo8wwOAYFv1RAm+N4T0d+uQrzYYsDYn4TWw0rLf5oiQiWlp6l1LfF2/APcYH
         INfEjk6akGOvMyLQT9w8xYEC75qvr1tjaXjsIFFbmnqBM9xKqsvpe3/vULIt5pBjemWA
         Sg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714992111; x=1715596911;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WI60SXQx2PFmM3yU66qoV6vyK5R/kzpLS52lw1aCV3s=;
        b=dX4ETdBkAxF8NTX6baeIXshtaOdYZbpYHd8a7ptYw90GvJpzDg3FTDxBRUkEuS4Nkq
         8FF9NkD/QYjYNrgalcEoOi/e3SJgKMNlzY5ydrWdpIjfgjVjPvhMg2XcythYUh0HxHIU
         ZgoPSOQX6LWkER1sO2iDa0A6KPAzn7VfyM2w/8eXnf99tu8Chmkv8wUOoBmWmyTgsndw
         +cBP/uRJDfvBZZrIPOsh818yRxYzJg6Cc7nlgwy2HqcO6JctAGkEtZNbZ0impD2eBr8X
         Yi1QwyosVQwwrn+PTHnEaJ1TvG3koxyJbPnScT+hhj4+CH7Z2vu3RGqaWHaGT70YgccP
         KjmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ8vwPNJDhAw9F7A1imyID5E4jvROm7eFrWq1dlvntFBF0WVNQ/45YQBfypYXH3cWZMzxzS6t/bAkDbZSJ8n7aG7Y8undA+j8KLEpu55g=
X-Gm-Message-State: AOJu0YzGq7jpz91A0rImkn88mPxPtFwgvshuwZFze2rFDtiOcYe7Eiri
	JRn4ltChr+R0QTvq9MuI58XcSfRrAUvL3yTvh8emizxBfZdmtZY05pPDiCzc6Q==
X-Google-Smtp-Source: AGHT+IEcve25x17bLq2o01bUwZioghN2LiADhk7vN13wnfyoFJVy/ven90nKGG+aR2ROUi1T2tEm3w==
X-Received: by 2002:a19:4311:0:b0:51c:d8f6:4e6f with SMTP id q17-20020a194311000000b0051cd8f64e6fmr7521827lfa.40.1714992110572;
        Mon, 06 May 2024 03:41:50 -0700 (PDT)
Message-ID: <54a52cc8-4c36-4086-a10e-114e9a733f45@suse.com>
Date: Mon, 6 May 2024 12:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? 2/2] xen/x86: remove foreign mappings from the
 p2m on teardown
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20240430165845.81696-1-roger.pau@citrix.com>
 <20240430165845.81696-3-roger.pau@citrix.com>
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
In-Reply-To: <20240430165845.81696-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2024 18:58, Roger Pau Monne wrote:
> @@ -2695,6 +2691,70 @@ int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
>      return rc;
>  }
>  
> +/*
> + * Remove foreign mappings from the p2m, as that drops the page reference taken
> + * when mapped.
> + */
> +int relinquish_p2m_mapping(struct domain *d)
> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);

Are there any guarantees made anywhere that altp2m-s and nested P2Ms can't
hold foreign mappings? p2m_entry_modify() certainly treats them all the same.

> +    unsigned long gfn = gfn_x(p2m->max_gfn);
> +    int rc = 0;
> +
> +    if ( !paging_mode_translate(d) )
> +        return 0;
> +
> +    BUG_ON(!d->is_dying);
> +
> +    p2m_lock(p2m);
> +
> +    /* Iterate over the whole p2m on debug builds to ensure correctness. */
> +    while ( gfn && (IS_ENABLED(CONFIG_DEBUG) || p2m->nr_foreign) )
> +    {
> +        unsigned int order;
> +        p2m_type_t t;
> +        p2m_access_t a;
> +
> +        _get_gfn_type_access(p2m, _gfn(gfn - 1), &t, &a, 0, &order, 0);
> +        ASSERT(IS_ALIGNED(gfn, 1u << order));

This heavily relies on the sole place where max_gfn is updated being indeed
sufficient.

> +        gfn -= 1 << order;

Please be consistent with the kind of 1 you shift left. Perhaps anyway both
better as 1UL.

> +        if ( t == p2m_map_foreign )
> +        {
> +            ASSERT(p2m->nr_foreign);
> +            ASSERT(order == 0);
> +            /*
> +             * Foreign mappings can only be of order 0, hence there's no need
> +             * to align the gfn to the entry order.  Otherwise we would need to
> +             * adjust gfn to point to the start of the page if order > 0.
> +             */

I'm a little irritated by this comment. Ahead of the enclosing if() you
already rely on (and assert) GFN being suitably aligned.

> +            rc = p2m_set_entry(p2m, _gfn(gfn), INVALID_MFN, order, p2m_invalid,
> +                               p2m->default_access);
> +            if ( rc )
> +            {
> +                printk(XENLOG_ERR
> +                       "%pd: failed to unmap foreign page %" PRI_gfn " order %u error %d\n",
> +                       d, gfn, order, rc);
> +                ASSERT_UNREACHABLE();
> +                break;
> +            }

Together with the updating of ->max_gfn further down, for a release build
this means: A single attempt to clean up the domain would fail when such a
set-entry fails. However, another attempt to clean up despite the earlier
error would then not retry for the failed GFN, but continue one below.
That's unexpected: I'd either see such a domain remain as a zombie forever,
or a best effort continuation of all cleanup right away.

> +        }
> +
> +        if ( !(gfn & 0xfff) && hypercall_preempt_check() )

By going from gfn's low bits you may check way more often than necessary
when encountering large pages.

Jan

