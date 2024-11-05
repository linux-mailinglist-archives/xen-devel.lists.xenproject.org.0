Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D3E9BD160
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 17:00:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830445.1245447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8LyI-0007zG-Fj; Tue, 05 Nov 2024 15:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830445.1245447; Tue, 05 Nov 2024 15:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8LyI-0007wm-D7; Tue, 05 Nov 2024 15:59:58 +0000
Received: by outflank-mailman (input) for mailman id 830445;
 Tue, 05 Nov 2024 15:59:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8LyG-0007wg-Ni
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 15:59:56 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe82cfea-9b8e-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 16:59:53 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-37d6ff1cbe1so4096256f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 07:59:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7b80sm16759965f8f.10.2024.11.05.07.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 07:59:52 -0800 (PST)
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
X-Inumbo-ID: fe82cfea-9b8e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzIiLCJoZWxvIjoibWFpbC13cjEteDQzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZlODJjZmVhLTliOGUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODIyMzkzLjE0OTgwMSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730822392; x=1731427192; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/mbXfj13cF1EdqRtTfG9qdItJsDNSq8nsgZp6yXJmME=;
        b=TjAp6xzEN8vYmmvGIZmQfcysbq4QyHWPrp4FFqyZhSiPBV/xwPqIaOUxGtHmP+8CTu
         JyIFEmA+J9D0J+QE9H/dXt+YQkIwaWaKv/HwebybC7QMUD1DYGCvrX9A5KQc4Q/jSmnO
         BhMtMGFGliidcDMM7M+f6wwQdRTlcHGODww1BHXZGDisG1rPo89TeDGpmwLoMzQTLwCm
         BA4iyajIxMISeXL9yMuBffby1rMFhvWJtcc1WkwrdIKOnhmkq0vx7zyida3pv81w/Ucy
         mV5ztYn2cIqU15cY/0nyhTfWloXbrHeB3/Cun1TiodeIiAd6HW3gr6dg4ayi4xDAkF9e
         mTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730822392; x=1731427192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mbXfj13cF1EdqRtTfG9qdItJsDNSq8nsgZp6yXJmME=;
        b=KcRxfY6QaBlBAq40NB3YibHrC9EHyQ06Rsr0sZ/jodvtVkW8vxDLFF2DRNmpm5Wvkt
         CMpH6Txt5QeWuFe1i07UsKvFh0ZaPQPJhKwI5pslfXTcEwb0Ha0J6CJiQQa/qEb//oKk
         TviMkuFC/zafh4pBHMEV0FT2mc/lJH3sfhxG6KnjVi7RNEuL2udnX1fXXQuEmgIshpBh
         NYsM0K7NHzTx/G0kLPwK+WqrpipTu+eyj4nhPhEcO1vZBVYCrwTgQhEqJrWMe8zLYLky
         WVsZGMpxugweQ3WCQMezgrtxHuMhvYshEujBiMU9JklX/zM6UYcRCceEDu4cQE4bIcoA
         UTew==
X-Forwarded-Encrypted: i=1; AJvYcCVYuAL01/wMrOZlKFTQMQpE/wSLIGwsBnF8rk5nEEsFYTYsdLb/dPxRuzbqW1tldbtiezVUkz3n9n0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSBFg5fuJ4haQMdWojuC7wZSEo5JKws8ptkKu2f/iNkg4v4a0Q
	TmHHHdnNrUx7ruuZDvYFin+BQkcoA1CP9MiH9ew4I4YD8fmgHPkUhfPEZJIzqA==
X-Google-Smtp-Source: AGHT+IGVZ2UJqrCTAmb+vM4uv0yJVjtycthEJ4b81KIGawOayfX5nKUm32Sr0txuTeCyzCVq1vfOUQ==
X-Received: by 2002:a05:6000:18a5:b0:369:9358:4634 with SMTP id ffacd0b85a97d-381be7c80a7mr19221837f8f.19.1730822392427;
        Tue, 05 Nov 2024 07:59:52 -0800 (PST)
Message-ID: <f86f611a-4f18-4847-8f21-c6ef20cd6b6c@suse.com>
Date: Tue, 5 Nov 2024 16:59:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 08/13] xen/page_alloc: introduce preserved page flags
 macro
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
 <20241025095014.42376-9-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20241025095014.42376-9-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.10.2024 11:50, Carlo Nonato wrote:
> PGC_static and PGC_extra needs to be preserved when assigning a page.
> Define a new macro that groups those flags and use it instead of or'ing
> every time.
> 
> To make preserved flags even more meaningful, they are kept also when
> switching state in mark_page_free().
> Enforce the removal of PGC_extra before freeing new pages as this is
> considered an error and can cause ASSERT violations.

What does "new" here mean?

> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> ---
> v9:
> - add PGC_broken to PGC_preserved

Which then also wants reflecting in the description.

> @@ -2485,6 +2485,14 @@ struct page_info *alloc_domheap_pages(
>          }
>          if ( assign_page(pg, order, d, memflags) )
>          {
> +            if ( memflags & MEMF_no_refcount )
> +            {
> +                unsigned long i;
> +
> +                for ( i = 0; i < (1UL << order); i++ )
> +                    pg[i].count_info &= ~PGC_extra;
> +            }

The description doesn't cover this, only ...

> @@ -2539,6 +2547,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
>                  {
>                      ASSERT(d->extra_pages);
>                      d->extra_pages--;
> +                    pg[i].count_info &= ~PGC_extra;
>                  }
>              }

... this is mentioned there. And it's not clear to me why it would need doing
in both places.

Jan

