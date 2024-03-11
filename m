Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E42EC877B7E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 08:58:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691224.1076952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjaYI-00044M-87; Mon, 11 Mar 2024 07:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691224.1076952; Mon, 11 Mar 2024 07:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjaYI-00041y-5Q; Mon, 11 Mar 2024 07:58:30 +0000
Received: by outflank-mailman (input) for mailman id 691224;
 Mon, 11 Mar 2024 07:58:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjaYG-00041s-JO
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 07:58:28 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2400827f-df7d-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 08:58:26 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5684ea117a3so1799282a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 00:58:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d23-20020a056402001700b0056857701bf5sm924632edu.81.2024.03.11.00.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 00:58:25 -0700 (PDT)
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
X-Inumbo-ID: 2400827f-df7d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710143906; x=1710748706; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dulDBGKIMAQ9Uv14fCeI1V67r13X50fp7iYs7ios30M=;
        b=GoaTC/SLxf7iolph2CpXu5ovPPBWHErB/W8aD9Vdj0nCpn2AdB/ta0v5JCBoLF2KH7
         hjahZPOHHtm0ae3E226VWf17XLt3By3rXWQ+qioPw8Jl3n1MIknTET7ZNYvbuZHGbglu
         BauWVkVjGv1L+tV7NhQO6eAWsoq3blwgIwASqw9s9GTqN/H4goo4ukTY4dHElrsgYnum
         y6oVKYg7BsNbbNA1tf4ZIajlREczsqSu8L9f2W1HyoxBzgAqr5Y6pOlmrbVQJkDCA2S2
         FiD+7uEW7gFXFEAM8etxh4l96K4ks312OFsy2DB/cP9cHYobolIz1RPh2CjYHA1UZZ4z
         D22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710143906; x=1710748706;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dulDBGKIMAQ9Uv14fCeI1V67r13X50fp7iYs7ios30M=;
        b=kq0QdJdLVrrXPyUTWT9V5/MK9ya1uxUxv/d2l3dGV9siyGsIMgXphzucCYpF3Vdagd
         niuBAUbBtNVOtDvwoTZcqu+vCvy3KLZ54Khbgbe0kepolaBOwjCO/l/gKaOKsFIapja6
         pioUBsHc6VBNoKghH1INcw46wtK8iAjJzgJ6AxZ2rbeO4aOR2Xk71crGPu/n6OjFTC/x
         mNGNWg/FWGNGxPl01KEIsjnEJZ5oBATwzwHFD01O29yYKlVYi1kBpIB/VlZtdtDyYJdG
         9lBLWjAwc4XcBCFDvL/JrGvS1Pg52gl6iPNDRPH9mPo1+XL0xopbiDYzjnWQvOr3vPcy
         LeWQ==
X-Gm-Message-State: AOJu0YxCXY6zwFrKmeHu9RqtR05IZ73MpO8j29aghYov6YSeyABh3hIp
	hW5r1fHz43eItmL+UzgL75FNVpPWIOEue1Y8SyOufZ6L4k0KmlU4UiBPDAvvFiNN/BwHt6O/8aI
	=
X-Google-Smtp-Source: AGHT+IGrdxd/u+FE6iafc/9gjlBKPk2NURp0uO2ROocOsm6mVDQw7uTpKwKLJFghH4KY9+sljDOvkQ==
X-Received: by 2002:a50:8e18:0:b0:565:6e57:fa3d with SMTP id 24-20020a508e18000000b005656e57fa3dmr3915525edw.10.1710143905891;
        Mon, 11 Mar 2024 00:58:25 -0700 (PDT)
Message-ID: <608aa381-a099-459e-96c3-1f05f29ed3c3@suse.com>
Date: Mon, 11 Mar 2024 08:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression with xhci console
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, oxjo@proton.me,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20240201170159.66330-1-roger.pau@citrix.com>
 <20240201170159.66330-2-roger.pau@citrix.com> <Ze5qE9yBLG0chLm2@mail-itl>
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
In-Reply-To: <Ze5qE9yBLG0chLm2@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.03.2024 03:18, Marek Marczykowski-Górecki wrote:
> On Thu, Feb 01, 2024 at 06:01:56PM +0100, Roger Pau Monne wrote:
>> The current code that parses the IVMD blocks is relaxed with regard to the
>> restriction that such unity regions should always fall into memory ranges
>> marked as reserved in the memory map.
>>
>> However the type checks for the IVMD addresses are inverted, and as a result
>> IVMD ranges falling into RAM areas are accepted.  Note that having such ranges
>> in the first place is a firmware bug, as IVMD should always fall into reserved
>> ranges.
>>
>> Fixes: ed6c77ebf0c1 ('AMD/IOMMU: check / convert IVMD ranges for being / to be reserved')
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> FYI Xen 4.17.3 with this patch (but not others in the series) causes
> panic on boot on Framework 14 AMD laptop:
> 
>     (XEN)  [0000000044570000, 000000005077efff] (usable)
>     ...
>     (XEN) AMD-Vi: Warning: IVMD: [4f83f000,4f880000) is not (entirely) in reserved memory
>     (XEN) AMD-Vi: Error: IVMD: page at 4f83f000 can't be converted
>     ...
>     (XEN) Xen BUG at drivers/passthrough/amd/iommu_init.c:1386
> 
> Full boot log at https://github.com/QubesOS/qubes-issues/issues/9030
> 4.17.2 worked fine.
> I'll try the whole series (and the follow up one), but I don't expect
> any difference.
> 
> This looks to be related to XHCI console, which does use the same API to
> allow device to DMA into relevant buffers even when the rest of XHCI is
> used by dom0 (or even other domain if 'share=yes' is used):
> https://gitlab.com/xen-project/xen/-/blob/staging/xen/drivers/char/xhci-dbc.c?ref_type=heads#L1421-1424

Hmm, yes, this is what we get for allowing such (ab)use. I guess we need
to have iommu_add_extra_reserved_device_memory() actually convert the
region in question, to satisfy the later check. Care to make a patch?

Jan

