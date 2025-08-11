Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 908C1B20816
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 13:44:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077522.1438577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQwy-0000ry-He; Mon, 11 Aug 2025 11:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077522.1438577; Mon, 11 Aug 2025 11:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQwy-0000or-Eo; Mon, 11 Aug 2025 11:44:24 +0000
Received: by outflank-mailman (input) for mailman id 1077522;
 Mon, 11 Aug 2025 11:44:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulQwx-0000ol-CX
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 11:44:23 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85642f7c-76a8-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 13:44:21 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-af95b919093so623255966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 04:44:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3792sm1997441966b.50.2025.08.11.04.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 04:44:19 -0700 (PDT)
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
X-Inumbo-ID: 85642f7c-76a8-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754912661; x=1755517461; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H6IgQA1IS1QG0Ap2C4UrD5lFa+wKraqXe2AGVdf/5tw=;
        b=R+fvc/x52S2hEcfQOcnvu8SrfcNKpnlQ+mRUJytN6xY9Vd3gbe2FmdUirJnL1Ybdhj
         fKciudOvtQ2wV3x6nKdZUgHfGEjD0ql6NHUexcRsllxoECYCLKRNVM2EE5rjVFvZaIWO
         5dDaSOqUINFxYWn3HX1vJmeoOI4xjnbTYRsHPH4JZQXcjBUwAefsk31LjAZsLTriKfJQ
         DEPDic/OyqmD2dqFUK9JjZWBBURnDtZ1SKlIgFDhEnGZga2fPRYBsYPlldB9cqnmFKY0
         0zbW0M0fORXENXtrIXo0lMrbOH3QrPMV17Gd6KzQDyEZLqhTL3kfLauVtV6KfbUiY+8x
         vDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754912661; x=1755517461;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6IgQA1IS1QG0Ap2C4UrD5lFa+wKraqXe2AGVdf/5tw=;
        b=DE3iKsmSa9JJGrn/FPhVf6K2DDnrJQsr25x3fUgjVfYMdPwIYxA2AC5CIp+82JIKv6
         qKHkqC0GntDjSrUIZ7xKSiJAByO10JsS42IhQUATaaQF0q/3235sNo3enennA0tf2vy3
         pQJserd6ZCHnVj+Kd3Klz2lakZIBF4XXe2IkdsHT90K8+hsD4IXz6GeaOXomb2fPydZi
         AK+PD1MPX8s6hD7i+3vN5udIfU/jvSjOYvbHOhA8xbY5FRMdCSJAi4i5s9u7wiAcu1VM
         w0Y3VArbg7p7aJ/SmeBAIs6LqYX8m/HmImcNu8qFNB8g9OceSnW7rDpDk4d+ZemiSgAU
         j6xw==
X-Forwarded-Encrypted: i=1; AJvYcCUL3ayfdKZ68zGe86ke0R4T/t1pKAmY/8mYuIazdsGhDWUrmtsOsrWustcLGr6AytDURWGYLTc5Gfw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPhTf+o47K5rBkkrkTIVkhLctADOCfNJo2Pi0QSknZLDqUSFmM
	FIeAzoHGUEBfuTLw9OxLCnhCqVwMEYDTE1wHtdqwClBQMUkK0P1St+AkxqM80LePRA==
X-Gm-Gg: ASbGncu3TMhTiUr4vEttLzV5nsmHr8D9DSq1KxS9vcsTv72LNx6qtE3saqpgEvMAYTM
	bOOwlZ0YFZplZ+BLGh4syDhgwBm0q3jPbqisqiwgSQTlnurR6irXXpakCKetRbGc9lUmsTR9XJ8
	pBI8Q770K4BNYf8+FwjvUnE/kexDGz8Jr5h7C0SU4fQlma1HitT1/H6L6dzID1w7sQ+Guh+37Td
	MiRQj0h3WS+yTIlvUBIigftJEV2eDVAgIMIVPuAHywftoEx/o5SA/oy/kYkPo7jba4nvdPVsgKc
	8/aUsMhE7pcKIR+yvEBRefZuQI5OfOMctXfyBKHVt4h8ZYbhOyNYFo37znKKuTD/TdijBL/uEYS
	UCL3b2JD1jnu+Ncf2Ips/1iYNPWfO0vVAz+gI7+QWPNbv4FpZ3kyaiBBwKpkmndXR/iJHneli1b
	+EbVjr3pg=
X-Google-Smtp-Source: AGHT+IHu8/6+G9QRuGim/hl6exZqou+QHqgVbxJwSqZC2+yyQNEs/F/SNq7dvi/A8ceMKwhMBs51Zw==
X-Received: by 2002:a17:906:99c3:b0:af9:a4de:f092 with SMTP id a640c23a62f3a-af9c65f2e00mr1144935766b.55.1754912660766;
        Mon, 11 Aug 2025 04:44:20 -0700 (PDT)
Message-ID: <d1803b0c-b536-4d31-a070-c2c146b3132b@suse.com>
Date: Mon, 11 Aug 2025 13:44:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/20] xen/riscv: implement p2m_next_level()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <8d8953fb00b4ac64bb2e82d827da4fbbe0c29918.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8d8953fb00b4ac64bb2e82d827da4fbbe0c29918.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -302,6 +302,48 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
>      return e;
>  }
>  
> +/* Generate table entry with correct attributes. */
> +static pte_t page_to_p2m_table(struct page_info *page)

You don't mean to alter what page points to, so pointer-to-const please.

> @@ -326,9 +368,43 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
>                            unsigned int level, pte_t **table,
>                            unsigned int offset)
>  {
> -    panic("%s: hasn't been implemented yet\n", __func__);
> +    pte_t *entry;
> +    int ret;

Please can this move into the more narrow scope it's (solely) used in?

> +    mfn_t mfn;
> +
> +    /* The function p2m_next_level() is never called at the last level */
> +    ASSERT(level != 0);

The revlog says "move", but ...

> +    entry = *table + offset;
> +
> +    if ( !pte_is_valid(*entry) )
> +    {
> +        if ( !alloc_tbl )
> +            return P2M_TABLE_MAP_NONE;
> +
> +        ret = p2m_create_table(p2m, entry);
> +        if ( ret )
> +            return P2M_TABLE_MAP_NOMEM;
> +    }
> +
> +    /* The function p2m_next_level() is never called at the last level */
> +    ASSERT(level != 0);

... the original one's still here.

> --- a/xen/arch/riscv/paging.c
> +++ b/xen/arch/riscv/paging.c
> @@ -91,6 +91,17 @@ void paging_free_page(struct domain *d, struct page_info *pg)
>      spin_unlock(&d->arch.paging.lock);
>  }
>  
> +struct page_info * paging_alloc_page(struct domain *d)

Nit: Stray blank after *.

Jan

