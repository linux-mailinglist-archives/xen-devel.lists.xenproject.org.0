Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDCB950986
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 17:55:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776437.1186591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdtrO-0000Tk-4O; Tue, 13 Aug 2024 15:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776437.1186591; Tue, 13 Aug 2024 15:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdtrO-0000Rc-0v; Tue, 13 Aug 2024 15:54:58 +0000
Received: by outflank-mailman (input) for mailman id 776437;
 Tue, 13 Aug 2024 15:54:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdtrN-0000RM-4s
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 15:54:57 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6305f7a4-598c-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 17:54:56 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-530ae4ef29dso10401022e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 08:54:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f3f4c443sm79348966b.3.2024.08.13.08.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 08:54:55 -0700 (PDT)
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
X-Inumbo-ID: 6305f7a4-598c-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723564496; x=1724169296; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/4h7H3HtJRtg+3PNRDxCsr1WajvrUoqmTVHdGiWOvXk=;
        b=WqcmtWRKqUqj7/w0LDiY0WnNkWpo4PNIdBf5vykid3Xjbbzbwc3s2wSiJdsG8lgbIk
         3mEwaoBys0mkrGb66Gpmw7k/8Tn/kGlHN8iQLzB7TUJlUKIw5RyZIlFnB5s/Fi0HfbFd
         FrD7p6MSeAz+cYa97SMEOP9+WwKZ6vtBwKoPyLGdBTPgRm6US+QzWDk1Lp7ls2OlvcWZ
         P/wh3wxBhbj7IJD2FS7x9DP1b+VeJEhZueJI12rGSPUHjyIqlaCvnb3eNqQKu5+eN7O7
         f5ZArYDUGVV6/iwj5M0XemustZvWAiu9hOGmGzx1gQ2Wpet3kcYvB61+MivlUiptV8mL
         kdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723564496; x=1724169296;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4h7H3HtJRtg+3PNRDxCsr1WajvrUoqmTVHdGiWOvXk=;
        b=P00QQCLKYVV0OtsDrGHetAtRZ0f1NBEBIYMNoLdoIu3+mxtEBsezUPu5MKI/SOO6fk
         H7gNGwBL3V9lGgU3J2cIUmDyPEcrBfcEl/n7bhi27lrOlPVWw4zhhflI7eRcE6S+B9d3
         +AnUa9PwdvKoo1qmMQzUASdnbBYTwMSu5/j4dg6oczO9D6AKv8heYQ4LjsTem67qvm9k
         0KoUSEWzXFRZilPdKYvhaRc7zUajXGKzRmwY9ql3y0W0JqqdPDha7U45TX4kq9ugMw8E
         4maqhTYcW4OaWOn3h1qVzl+HAvWAvV7K9ENHh9I87rPj5V1FpMqevkUsLWuE7rsVyDuJ
         olyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW6hofryuT6pzOSCrOI0detfv082WrIOnbvPCcb8VGc3IBJV6BnRsmXadBnqrEMqiSEtjywtxOF426Uy1mEfM++j6zbSCjroIdtRo86WM=
X-Gm-Message-State: AOJu0YzgDIUo3T0SclQHnCeweSXCTL01iklXQVTzOZOJPupzhMfIhwHq
	kb61l0Zut1IOrcUgKuOjN7VpdULOBG598Rco3WwtM1WuJWI5Eh00RgFp8fR3jg==
X-Google-Smtp-Source: AGHT+IE8kRTDO8fU5MX/cPTia1WhwQV6gmJM3nPP12UKR0LYNRcuhWzlluGH7ixbkMSXnBbJj/Adeg==
X-Received: by 2002:a05:6512:1190:b0:530:da96:a990 with SMTP id 2adb3069b0e04-53213659a4amr2976968e87.32.1723564495597;
        Tue, 13 Aug 2024 08:54:55 -0700 (PDT)
Message-ID: <550c6f14-228d-45b4-9146-8d950082b574@suse.com>
Date: Tue, 13 Aug 2024 17:54:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/22] x86/mm: ensure L4 idle_pg_table is not modified
 past boot
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: alejandro.vallejo@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-5-roger.pau@citrix.com>
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
In-Reply-To: <20240726152206.28411-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.07.2024 17:21, Roger Pau Monne wrote:
> The idle_pg_table L4 is cloned to create all the other L4 Xen uses, and hence
> it shouldn't be modified once further L4 are created.

Yes, but the window between moving into SYS_STATE_smp_boot and Dom0 having
its initial page tables created is quite large. If the justification was
relative to AP bringup, that may be all fine. But when related to cloning,
I think that would then truly want keying to there being any non-system
domain(s).

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5023,6 +5023,12 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
>          mfn_t l3mfn;
>          l3_pgentry_t *l3t = alloc_mapped_pagetable(&l3mfn);
>  
> +        /*
> +         * dom0 is build at smp_boot, at which point we already create new L4s
> +         * based on idle_pg_table.
> +         */
> +        BUG_ON(system_state >= SYS_STATE_smp_boot);

Which effectively means most of this function could become __init (e.g. by
moving into a helper). We'd then hit the BUG_ON() prior to init_done()
destroying the .init.* mappings, and we'd simply #PF afterwards. That's
not so much for the space savings in .text, but to document the limited
lifetime of the (helper) function directly in its function head.

I further wonder whether in such a case the enclosing if() wouldn't want
to gain unlikely() at the same time.

Jan

