Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDA9A3BC81
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 12:15:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892690.1301647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tki2h-0007gU-32; Wed, 19 Feb 2025 11:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892690.1301647; Wed, 19 Feb 2025 11:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tki2g-0007eF-VV; Wed, 19 Feb 2025 11:15:02 +0000
Received: by outflank-mailman (input) for mailman id 892690;
 Wed, 19 Feb 2025 11:15:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tki2f-0007e9-P0
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 11:15:01 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c287b5da-eeb2-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 12:15:00 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso1253194066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 03:15:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbab9e9863sm440461466b.64.2025.02.19.03.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 03:14:59 -0800 (PST)
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
X-Inumbo-ID: c287b5da-eeb2-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739963700; x=1740568500; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6GR7O42iO2NogXDNY/BmLGlTgTNmxYU3abEW8NZ3dz0=;
        b=LUARcagHZBHeuP09Wp6myuTqwQV51d8t/7LPCY/Rs0cVjFy0Pcvudy72lU3agFxG/7
         U+ld5026wZV5IYPJFlUd2ou0c3PXsMSceWONMWvKPc/jOOexYY1l77sk5nQ7DUoosi+W
         MsuaIZHjUv7P0diTxhKoBWjmnTpCOGjYWfZP15TyeY09RbHFvx3nI2RdkG2CGlub8B3S
         PBucpQJWHqPNEyAchkr3eQyCyEeOYNOwLKX8YTvOCeFTgU3mYBVCLOXoxiPcSMQVsOiZ
         2Zl2I0KufQ54vRuxox7nM3JqTO7dVtNiEjCePUF6TdaFogBlDU58EpsQWw7VqxquRASG
         ysuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739963700; x=1740568500;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GR7O42iO2NogXDNY/BmLGlTgTNmxYU3abEW8NZ3dz0=;
        b=FXOTJF8x8nolo7YMVXGJGX+cU61oSsIkIvTFfjywLbjITOy3kkX8Shts6Wc7KLUFzf
         QnhvgNYD9As6SjdSxQ5hjkBYw7UxbkqWEmGORIGWX280NGr+zCXtXfCbrMLPOksqrv26
         6HqK3qV3qU4T07gPtfmUbLQD44aeiScHNhCV6VPq55pJuOWbsYI625W/6VDONDl0VCuA
         h5mZWRIlYqSJMgaZMjvtuQiKdxyCbRcnJ20fmavoKeHtgv2GRSqGncgCCCyoGgs119IE
         /Tyrnp+kcVpg+7SwMT3xutPLcjBkj/fXSe9ew47SHrtsESDFWQtGdTEEyGSUOOR0O1te
         10lA==
X-Forwarded-Encrypted: i=1; AJvYcCXlGrqAgp8iS2+RJrJFaUjU1ZNIKxLsrnjWAUJDjC+GozjjEqhYs29tuui/4vnbarZ69fJaLhy4zR8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPh6yFLf7DDGTZk7hoTDCer3anDoBJiL0OhfaK6OBhmJJamQkt
	594G6sSMYbR0Fb28IxO9V0vhbWOP9n6OejCyRy3XNtmA8pnb8AyJvvnYAxkHGg==
X-Gm-Gg: ASbGncsAEX8nl2hNHjOUPJUeCjDFIkqh0u4hD8urSBrWvzpgF5ZTQXcmh3B0hZSWUpg
	qQ9UI+WW1P/Ov/09xFXS9aHoknNYtCNIIFxxxrWi2gTzASq1wKO/uufezOb+eRdF8WEk+/BkT/l
	6ROjJFtsP0lFRmvtoI1qCaWRQjQUm7U0cnxVVM0zdSq7MPKGqen1CfzKHAVv7r7G1W695cprP/T
	XjLgk0Uvh+QbspVcBFOHCCKQoNPE8gFWhUiykm24StkdM93yJaNjRh5X0VkPPVRKtWxB/MBfUFs
	wrvRIXhJz5Xpnjt7i3qNmYA6m8w7bMTLC0us4INRiJESTSenvtyvbetaALmK4+gmYPLxstQU0v9
	e
X-Google-Smtp-Source: AGHT+IHqFTLwiq7jHDo2P7DtXDLgRuA+kYZ3nL53OctRzg3g3BuLFWCRHF2dF1X3dfayupYw0lscNg==
X-Received: by 2002:a17:907:7b8b:b0:aa6:b63a:4521 with SMTP id a640c23a62f3a-abb70aa620cmr1766727566b.15.1739963700186;
        Wed, 19 Feb 2025 03:15:00 -0800 (PST)
Message-ID: <5c56ef1f-1a13-4a2e-9317-0cc90e93d479@suse.com>
Date: Wed, 19 Feb 2025 12:14:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20? v4 1/3] xen/riscv: implement software page table
 walking
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1739363240.git.oleksii.kurochko@gmail.com>
 <9f1fbf84a82fd141f40428993106f0672d6d8c4c.1739363240.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <9f1fbf84a82fd141f40428993106f0672d6d8c4c.1739363240.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.02.2025 17:50, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/pt.c
> +++ b/xen/arch/riscv/pt.c
> @@ -185,6 +185,68 @@ static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
>      return XEN_TABLE_NORMAL;
>  }
>  
> +/*
> + * _pt_walk() performs software page table walking and returns the pte_t of
> + * a leaf node or the leaf-most not-present pte_t if no leaf node is found
> + * for further analysis.
> + *
> + * Additionally, _pt_walk() returns the level of the found pte by using
> + * `pte_level` argument.
> + * `pte_level` is optional, set `pte_level`=NULL if a caller doesn't need
> + * the level of the found pte.

How about this, reducing redundancy a little?

 * _pt_walk() can optionally return the level of the found pte. Pass NULL
 * for `pte_level` if this information isn't needed.

> +pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
> +{
> +    pte_t *entry = _pt_walk(va, pte_level);
> +    pte_t pte = *entry;
> +
> +    unmap_table(entry);
> +
> +    return pte;
> +}

"entry" especially in this context is ambiguous. I would expect a variable of
this name to be of type pte_t, not pte_t *. How about "ptep"?

Preferably with these adjustments, which I'd be fine making while committing,
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Considering the 4.20? tag you'll need to decide whether you still want this
in before the release.

Jan

