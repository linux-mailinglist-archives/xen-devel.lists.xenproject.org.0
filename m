Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD3EA2F445
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 17:53:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884913.1294660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thX2F-0008PW-Fn; Mon, 10 Feb 2025 16:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884913.1294660; Mon, 10 Feb 2025 16:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thX2F-0008Mn-DG; Mon, 10 Feb 2025 16:53:27 +0000
Received: by outflank-mailman (input) for mailman id 884913;
 Mon, 10 Feb 2025 16:53:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thX2E-0008Mh-LX
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 16:53:26 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89c49168-e7cf-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 17:53:23 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ab7b80cc3d2so197781966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 08:53:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7985f9786sm623013666b.20.2025.02.10.08.53.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 08:53:21 -0800 (PST)
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
X-Inumbo-ID: 89c49168-e7cf-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739206402; x=1739811202; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w9IzQC1k3v2YybyJ6U0glTt/3GnRb2+fp83XKmaMSpg=;
        b=WyKnFbRwq0c/3auiN09DCpxDQ2NdnDrXZGnp5LRD3TrrvX2+8g8OduBTgA7xMTuEqc
         pU3U0431LVyfODUyUyzFlhQXkIxl+CsbkjEQTBWOxUcGI3qbXrx9Y4cEn0Kf+QtfZdtR
         gIZFiOXgMXXC149nECDiL/n+76SbP4PJLzT2RxCGFVsnMNDdOJy94kYC20zjMSB6gVwM
         PM5t7Ze5ADuLgXanYwmMss7sCCqRXuqmFq5D51FI3xcftuo/RJEcU0iDcoFxe8uQUIyw
         xFe0XqipkyyGBkA9XtnFMHmOirZHKccrXBgnIbidFAyoNT5KnU1OdOob5kXu6luj0cZr
         P6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739206402; x=1739811202;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9IzQC1k3v2YybyJ6U0glTt/3GnRb2+fp83XKmaMSpg=;
        b=tUFcVwiF3gQjU5xghnNsyLayxAOF8O8W6j68Rd5L8AIAgiuTFt1G6ENEqVnBzEfupP
         Ph0zMMpGym5SJb6Ll+8YZMGgfZ+mOGlxnDtBWUZ2DKNAcBhZVxHRN1gEGKORw+98vVGK
         vElutTfaoNGZ6ObA/nh/Aybu2MKVjmweIK4RfKPTafQX4xk7AiqnLmKxY5VLV/HTXao1
         eGOEWQWs5CYmUphEJkj3mE8n+M/Qu9YJSd8MibWefjvO2wEOYjYWWIF9oIwklkDx02m3
         DQGfdJPPKoCK21f2xi87kmnzWwlp+2hWHn78o50hqRHr3Q5FN281Odwl91uJIDznbVhL
         hqQw==
X-Forwarded-Encrypted: i=1; AJvYcCWimdgBS9m1KVWnAfWKwShxzYwxpV2g317+yun/nVH+GQ5Z5kO9S07RbLbeh7IM/GWX6n9AU+RNpZw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMaKtsPCH8kutzy3Fnovh0qwzC8SdL87n9HPlh/7k0o3giPI/B
	Oy6L9i8wyIhbnEsaz21f0aEuYcWL2Rl0m+OLvR8cUyjgEyuToIzXW203KA1O3Q==
X-Gm-Gg: ASbGncuENYt1NCW9dkOSYr3NNMqpBfbhGCIc+Bcl4ubspSbzLNXqt0rPV+ZRbj6UJxd
	XnA1bND0D1R9wOdmc2k9vZXBzCZJ2bwrof6ANz5I9nF5UU5znzt1KEDWPxCj7+iGT9T5GCjZZF5
	DQ7USZ8cFdFykec4VZsQUZFfbE833DaQIvHYgBgJsU1rjy3Gm12xSbOrTab9z0lztJ85urO85+L
	lMAkjlJe6iWtghH6uC2Mw/Xr274P2kPVPRGw6+/yzCWQlHXTU70VaC49lyqFfkVJK+EE5ufyBAT
	uOjEzP3LKtFiHVgWcNgkrK5SLrlBLjS0tp6xg/AvAOOZ86n03VzsXJ2Rom0HI3L+1oc6KuZ+INz
	c
X-Google-Smtp-Source: AGHT+IEWBzpyz43hZokZDtLsEU19mT1dvcscem+kqcXc8CnCaANj79lKesDuqwkyL2w7wgMXZ8CQoQ==
X-Received: by 2002:a05:6402:2185:b0:5dc:5ada:e0c7 with SMTP id 4fb4d7f45d1cf-5de4507069emr36382697a12.26.1739206402179;
        Mon, 10 Feb 2025 08:53:22 -0800 (PST)
Message-ID: <3786ac96-c153-45d5-b70e-3bdb8900024f@suse.com>
Date: Mon, 10 Feb 2025 17:53:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20? v3 3/3] xen/riscv: update mfn calculation in
 pt_mapping_level()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1738933678.git.oleksii.kurochko@gmail.com>
 <0290ae707cdd98d57714afb9bc4c3386683c1190.1738933678.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0290ae707cdd98d57714afb9bc4c3386683c1190.1738933678.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2025 14:13, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/pt.c
> +++ b/xen/arch/riscv/pt.c
> @@ -238,11 +238,10 @@ pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
>  
>  /* Update an entry at the level @target. */
>  static int pt_update_entry(mfn_t root, vaddr_t virt,
> -                           mfn_t mfn, unsigned int target,
> +                           mfn_t mfn, unsigned int *target,
>                             unsigned int flags)
>  {
>      int rc;
> -    unsigned int level = HYP_PT_ROOT_LEVEL;
>      pte_t *table;

Considering the lack of an initializer here, ...

> @@ -256,39 +255,45 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
>      bool alloc_tbl = !mfn_eq(mfn, INVALID_MFN) || (flags & PTE_POPULATE);
>      pte_t pte, *entry;
>  
> -    /* convenience aliases */
> -    DECLARE_OFFSETS(offsets, virt);
> -
> -    table = map_table(root);
> -    for ( ; level > target; level-- )
> +    if ( *target == CONFIG_PAGING_LEVELS )
> +        entry = _pt_walk(virt, target);
> +    else
>      {
> -        rc = pt_next_level(alloc_tbl, &table, offsets[level]);
> -        if ( rc == XEN_TABLE_MAP_NOMEM )
> +        unsigned int level = HYP_PT_ROOT_LEVEL;
> +        /* convenience aliases */
> +        DECLARE_OFFSETS(offsets, virt);
> +
> +        table = map_table(root);
> +        for ( ; level > *target; level-- )
>          {
> -            rc = -ENOMEM;
> -            goto out;
> +            rc = pt_next_level(alloc_tbl, &table, offsets[level]);
> +            if ( rc == XEN_TABLE_MAP_NOMEM )
> +            {
> +                rc = -ENOMEM;
> +                goto out;
> +            }
> +
> +            if ( rc == XEN_TABLE_MAP_NONE )
> +            {
> +                rc = 0;
> +                goto out;
> +            }
> +
> +            if ( rc != XEN_TABLE_NORMAL )
> +                break;
>          }
>  
> -        if ( rc == XEN_TABLE_MAP_NONE )
> +        if ( level != *target )
>          {
> -            rc = 0;
> +            dprintk(XENLOG_ERR,
> +                    "%s: Shattering superpage is not supported\n", __func__);
> +            rc = -EOPNOTSUPP;
>              goto out;
>          }
>  
> -        if ( rc != XEN_TABLE_NORMAL )
> -            break;
> -    }
> -
> -    if ( level != target )
> -    {
> -        dprintk(XENLOG_ERR,
> -                "%s: Shattering superpage is not supported\n", __func__);
> -        rc = -EOPNOTSUPP;
> -        goto out;
> +        entry = table + offsets[level];
>      }
>  
> -    entry = table + offsets[level];
> -
>      rc = -EINVAL;
>      if ( !pt_check_entry(*entry, mfn, flags) )
>          goto out;

... I'm surprised the compiler doesn't complain about use of a possibly
uninitialized variable at

 out:
    unmap_table(table);

For the new path you're adding the variable is uninitialized afaict.
Which implies that you're again failing to unmap what _pt_walk() has
handed you.

Jan

