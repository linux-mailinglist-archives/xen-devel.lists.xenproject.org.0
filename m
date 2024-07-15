Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 146D9931749
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 17:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759005.1168537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTNC3-00041g-T8; Mon, 15 Jul 2024 15:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759005.1168537; Mon, 15 Jul 2024 15:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTNC3-0003z4-Pn; Mon, 15 Jul 2024 15:00:47 +0000
Received: by outflank-mailman (input) for mailman id 759005;
 Mon, 15 Jul 2024 15:00:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FSyp=OP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTNC2-0003yv-Cw
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 15:00:46 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0289dc1e-42bb-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 17:00:44 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ee920b0781so44543541fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 08:00:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7eca7870sm4447329b3a.169.2024.07.15.08.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 08:00:42 -0700 (PDT)
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
X-Inumbo-ID: 0289dc1e-42bb-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721055643; x=1721660443; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=it9dFfPQBX1kutgokUk1Wn4ryZjrWu9ao5TRajqa9os=;
        b=XxeKsPBgHvC2p7GtGDEqt99uyjz1OtiyiFhm+fZ35XSGsm4LBrPrOLzkljaYpkY90C
         POpTu+UcMtrfUzDTK/X2ftvfwrxU3aV0gAT6iogrhYNM8oep8NZ25qddYJtHpINKRyI8
         LEkDQT5JyyXKW1AMkyOBF1TLr3O3QmR/wmuTJs0vN62n/7YYIGdJZfJRHfRVC/OzyoKQ
         qlI2cy1JUWhLI4R+UYU3tGfEruTDEQVaLHrbd6UTizGxxWypx5ZXavHP9GEpWfdH0W5Q
         C9Kfz112b/shqnwKm+fawmf9N99j3UukY3PmsJoEEaPhiQ2STcBJRbvTEidT7ikAt+ur
         j/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721055643; x=1721660443;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=it9dFfPQBX1kutgokUk1Wn4ryZjrWu9ao5TRajqa9os=;
        b=BoTq+lUUmyIB009VaWdpWnYYw0V6Cl6zWW/fqO2CbYOb2KSx1sJLTLjP4qPWycelcL
         693ZlBQB5IM3s4lrwE/Z72Xq6Okqpzj8FqE1Gc/Z50yMJLRlVq8GEyehgDkN6cv8TWCf
         Ws2qVdHZ55jZ4/9+Xy05taLnsurXD6glgBQIRHXIwCP5tymjsKFtAsGqobv67GWwOFSF
         VkjJ/mIMZw/FgQwOTz6+HYoyZTOM10dlfR++kEUL5t0GY2yx6lnBU86YS7IDA814w1Yx
         0gZtshE107Zo4wn2ZUYP9gU7n2gWZmlW/y6vOP84XPGt+qHSgZwVKXIrST3IQGQoL63D
         WfgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDl5KtSGvLIDCFIHyrqi7DwMdmU0GxCH7ard5UFYzBXQpXIRwMMd+djwsxKI2dapRSZl6H/+D1MKchEPakZeVYpWNdHtfPOPwbzgIKAWY=
X-Gm-Message-State: AOJu0YxthF6VM0oAbk6onnU8/SI43ogYUetRc7Dmuh9d8dUwD/moBeFK
	aA7MMzc2UTfgce341vEUpjHC/9NzRSSMe+bX9E/L7n2zwb0Wf3zqLGViw52jow==
X-Google-Smtp-Source: AGHT+IEYhtmvgSv7dEcvst4DUXl1rB66oyybmW+la1nLEXO1ciXuQmhNa5JByNyF/iOG603NCRtHVw==
X-Received: by 2002:a2e:80d7:0:b0:2ee:87c1:3c94 with SMTP id 38308e7fff4ca-2eef2da504bmr837331fa.40.1721055643493;
        Mon, 15 Jul 2024 08:00:43 -0700 (PDT)
Message-ID: <fa72b23a-2f2e-4c6a-aa3f-920e0ff0a930@suse.com>
Date: Mon, 15 Jul 2024 17:00:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] xen/riscv: introduce early_fdt_map()
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <4e4f94817fb3bba5f52336ea0b4491f7bc867d49.1720799926.git.oleksii.kurochko@gmail.com>
 <bc8d2e10-0898-4f5a-b296-1bc7f528bb77@suse.com>
 <ba7c72745052429d84e172cf731849c54445d27a.camel@gmail.com>
 <945afaf1-8223-4e3e-bf6d-98a6fad66f78@suse.com>
Content-Language: en-US
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
In-Reply-To: <945afaf1-8223-4e3e-bf6d-98a6fad66f78@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.07.2024 16:58, Jan Beulich wrote:
> On 15.07.2024 15:58, Oleksii wrote:
>> On Mon, 2024-07-15 at 10:52 +0200, Jan Beulich wrote:
>>> On 12.07.2024 18:22, Oleksii Kurochko wrote:
>>>> +    rc = map_pages_to_xen(BOOT_FDT_VIRT_START,
>>>> maddr_to_mfn(base_paddr),
>>>> +                          SZ_2M >> PAGE_SHIFT,
>>>> +                          PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
>>>> +    if ( rc )
>>>> +        panic("Unable to map the device-tree.\n");
>>>> +
>>>> +    offset = fdt_paddr % XEN_PT_LEVEL_SIZE(1);
>>>> +    fdt_virt = (void *)BOOT_FDT_VIRT_START + offset;
>>>> +
>>>> +    if ( fdt_magic(fdt_virt) != FDT_MAGIC )
>>>> +        return NULL;
>>>> +
>>>> +    size = fdt_totalsize(fdt_virt);
>>>> +    if ( size > BOOT_FDT_VIRT_SIZE )
>>>> +        return NULL;
>>>> +
>>>> +    if ( (offset + size) > SZ_2M )
>>>> +    {
>>>> +        rc = map_pages_to_xen(BOOT_FDT_VIRT_START + SZ_2M,
>>>> +                              maddr_to_mfn(base_paddr + SZ_2M),
>>>> +                              SZ_2M >> PAGE_SHIFT,
>>>> +                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
>>>> +        if ( rc )
>>>> +            panic("Unable to map the device-tree\n");
>>>> +    }
>>>
>>> Why this two part mapping? And why are you mapping perhaps much more
>>> than "size"?
>> I wasn't able to find if RISC-V has a requirement for alignment of FDT
>> address so I decided to follow Arm where FDT is required to be placed
>> on a 8-byte boundary, so FDT can cross a 2MB boundary, so the second
>> 2MB page should be mapped if the FDT is crossing the 2MB boundary.
> 
> This explains why you may need to map more than 2Mb (which wasn't the
> question), but it doesn't explain why you need to do it in two steps.

Oh, wait - you know the full size only after having mapped the initial
part. I'm sorry, I didn't spot that early enough.

Jan

