Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67848A1D45D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 11:25:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877601.1287738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMI3-0004i9-FG; Mon, 27 Jan 2025 10:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877601.1287738; Mon, 27 Jan 2025 10:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMI3-0004gY-BI; Mon, 27 Jan 2025 10:24:23 +0000
Received: by outflank-mailman (input) for mailman id 877601;
 Mon, 27 Jan 2025 10:24:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcMI1-0004gO-Ib
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 10:24:21 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de979630-dc98-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 11:24:20 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa689a37dd4so858228566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 02:24:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e124e3sm555067466b.21.2025.01.27.02.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 02:24:19 -0800 (PST)
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
X-Inumbo-ID: de979630-dc98-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737973459; x=1738578259; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RgmuTDj0uAXzjg8zQRTvW2GcIE0H5Jo8YjWaR+itgXU=;
        b=Yxex4Pg5yx0tl2soA+Q5fXtZT3MT1GmEKcsEYaYEh9HSO3HzgHVp54pEf/ObrDFzQH
         +4c2P2+l+cnlikTs1PwUNHGt7R9eqhqUi8gWRj8HKwvRva5XY7YRkj+NVFbzG6LbzrZK
         a0RkB8g5RmjGM4bC2prc0M8f7vLr6hQI1hLU5UqxZ3ePb4lAhzo0NwMlzJRcpirMcVRW
         CO9a6r8xWcym/jWFrpuDhqyKfc30tmz54qApBHzQRZShjlKsmMeIbIWLTROEkhjX6ntJ
         /vcTU6z65fyJk3BwAAxYXBdmya5L15tC/IhPhMM5jfAP48eujf/GSzCBng8ekYk5Xlkg
         OKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737973459; x=1738578259;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgmuTDj0uAXzjg8zQRTvW2GcIE0H5Jo8YjWaR+itgXU=;
        b=Nd9+6ykg8kbH0P/qtV018ML5meXrP4gNayJ0KvGEOFfYztVevXhLnTXuo8lXfsg2Hv
         p5eUrcS79GAsDoUAdv0EFt7V0/L5gPgNk7lq7X3UP3GVa8DglWYE1GA4QF8I1GvheA6o
         9aiVRr1oqlidx3GO04PbS9uYDOLSyi9JwYzj/BlkF9Iph/h0zd9xg5PwzLouYmD05ya1
         7gu7D+S3W3rLp6enWzKZqXsd8JMGdok9YNYanQmR5egzZXwhBXZ9qqUdx9KE1RPc1ZN9
         /1WS1BqkK+SdKXs4dAmAH3cgNSw+VWoAa1pEW0ibRV8NcqFmcwvC95rUaCnpMCAiDXZz
         dVLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKylWiqxS7a8XUOViaYjxHUwg6MCmlSUQvd6kzZvGe65pWlxQo6EKWsH+zn3uxrcfXW94u51SmGRA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7fQtt7QbLAho/OS9jd1uGOlm+b4s7NVnM30L3lS0K1L0lkElv
	UtRiF0ANDo2sxtDphV4tgGno1HnlShquok0fKVAT9H9G928Yvt5unM9YJrHrTA==
X-Gm-Gg: ASbGnctCqf9w1O4zVo84qqXDma3lzqJQscRmwj7FXxEFBhjQD0fVKeigrStTFaaJmTa
	OCXUrKBahObmKBUu8TAlyGIu5wXNh0KcvULtpWexJ0qqUer0YH1UOnBsahLenTHoXR1cm+Sqttt
	bMGT1XOy6Q/SSQo/Bn1WpAiEFNM0NPtmjMQKXzIuMIqyAuhuMl0XUagmEGB2fi7HsW54rRA+Rgj
	sHG+WL0Cei03lby79ePtzjNqmyKzEK8pSVpb1GwdDGjKLsN21YpSnu30XGWqkr9GpkR3sBtwvjv
	/mUHYKFr75e/Fp60JQHT0AyF8Mcklca1BJdwgFFBZolrsUm4SC2CW92s9R7ujOoeFw==
X-Google-Smtp-Source: AGHT+IF8DiyW/DpERaeVfY0KnBz+bUJ6Lt3txnMt06zX1Tj2jv7M9Yqxt/Yr7SiPf0OJH1f6xJ1Xow==
X-Received: by 2002:a17:907:7dab:b0:aa6:a87e:f2df with SMTP id a640c23a62f3a-ab38b2b7842mr3436872566b.25.1737973459399;
        Mon, 27 Jan 2025 02:24:19 -0800 (PST)
Message-ID: <f244ed32-cf27-452f-8c92-206f892f809c@suse.com>
Date: Mon, 27 Jan 2025 11:24:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/riscv: update mfn calculation in
 pt_mapping_level()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1737391102.git.oleksii.kurochko@gmail.com>
 <a4a970490471035bf49a97257b400da23091fb9a.1737391102.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a4a970490471035bf49a97257b400da23091fb9a.1737391102.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.01.2025 17:54, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/pt.c
> +++ b/xen/arch/riscv/pt.c
> @@ -346,9 +346,33 @@ static int pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
>          return level;
>  
>      /*
> -     * Don't take into account the MFN when removing mapping (i.e
> -     * MFN_INVALID) to calculate the correct target order.
> +     * `mfn` should be set properly in cases when modifying/destroying a
> +     * mapping to ensure the correct page table `level` is received. In the
> +     * case of `mfn` == INVALID_MFN, the `mask` will take into account only
> +     * `vfn` and could accidentally return an incorrect level. For example,
> +     * if `vfn` is page table level 1 aligned, but it was mapped as page table
> +     * level 0, then without the check below it will return `level` = 1
> +     * because only `vfn`, which is page table level 1 aligned, is taken into
> +     * account when `mfn` == INVALID_MFN.
>       *
> +     * POPULATE shouldn't be considered as `va` hasn't been mapped yet.
> +     */
> +    if ( mfn_eq(mfn, INVALID_MFN) && !(flags & PTE_POPULATE) )
> +    {
> +        vaddr_t va = vfn << PAGE_SHIFT;
> +        paddr_t pa;
> +        unsigned long xen_virt_end = (XEN_VIRT_START + XEN_VIRT_SIZE - 1);
> +
> +        if ( ((va >= DIRECTMAP_VIRT_START) && (va <= DIRECTMAP_VIRT_END)) ||
> +             ((va >= XEN_VIRT_START) && (va <= xen_virt_end)) )
> +            pa = virt_to_maddr(va);
> +        else
> +            pa = pt_walk(va);
> +
> +        mfn = _mfn(paddr_to_pfn(pa));
> +    }

Doing a walk here and then another in pt_update() feels wasteful. I
wonder whether the overall approach to page table updating doesn't want
changing. It ought to be possible to tell an "update" operation to walk
down to wherever the leaf entry is, and update there.

Jan

