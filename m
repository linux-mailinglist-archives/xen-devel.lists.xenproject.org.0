Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7146D816804
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 09:26:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655698.1023421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF8xG-0005Pj-Q7; Mon, 18 Dec 2023 08:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655698.1023421; Mon, 18 Dec 2023 08:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF8xG-0005Mm-Mf; Mon, 18 Dec 2023 08:26:26 +0000
Received: by outflank-mailman (input) for mailman id 655698;
 Mon, 18 Dec 2023 08:26:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rF8xE-0005Mg-LD
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 08:26:24 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20f262c1-9d7f-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 09:26:23 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40c3ca9472dso31179565e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 00:26:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bi11-20020a05600c3d8b00b0040c2963e5f3sm40658941wmb.38.2023.12.18.00.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 00:26:22 -0800 (PST)
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
X-Inumbo-ID: 20f262c1-9d7f-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702887983; x=1703492783; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d5pT9m4n+V1mSNPWP2Fz4wO3/NsQmAiWtPyv5IaAhJQ=;
        b=fF/z0EEfDj42mKQCUyg/l7lAMtETdCtLVyQefxCCm6o8VPj44qERmJFSKoaV2dxQ5u
         t6evT9ViILpcLfBEPkXlmTk0uttWN1z6ah4hciu+FAKLMjUnGjKoBsE74FCKPsJkrDHY
         /u7gel27+A2W+91P0TvGVCKPcUPJh5gk6dkPVTERef1Qt5f41tdpYjSC8GxyLy9I2pkK
         O8CDmiTYaxnahmTi9tC7vAxmS3LcpIp6khzB/uyAXaVIpF/8geJR+hhiN25jwiVl6bSJ
         DbumM70phILCjEcNRNZTgvKcdqDJ3598iuBzbWsmsEskBHEjgAdQfJp4O5etNHrYf2C+
         CzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702887983; x=1703492783;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d5pT9m4n+V1mSNPWP2Fz4wO3/NsQmAiWtPyv5IaAhJQ=;
        b=F1bHeMvrhJjslf/NY3IyJYtVaOt4qlGwbNbv8BI76yxRfmcuJNUCNaahNHhqAR2RZo
         Fs4HCUrwSaGoQhC3VEIx8IpjUB2jc/iTSShwFbJ/CQjA5NrWSt6BmIRm1OdbVRmyMIHl
         sABJv77hb1unNg7Cei7ILyxX5sEfcgOds+TpETi7iiKvjcMlHUoDcxkiJ1aHPvk9xFu1
         CgJFZm60vXgjC7NPbEGlZ8PowA4olSN6Yux2AfVxoNGqqP5sN/HbOQbJteFMg+PDhg/Q
         X4UZ4D87Z+5/QBZXVTcfzPYWiQ0zhTGS3YvWmj/WOPHDStZSd6rvRxiFeTOtJItHMKFn
         BW3g==
X-Gm-Message-State: AOJu0Yw1xkdJ9jZk6hro8zldB4iBVskV66RYc95+dnetdxjpGfw/wPaG
	iTZpOqHf6HEV68DgI/G2RT7Z
X-Google-Smtp-Source: AGHT+IFtbHEcoxqOrwd1E4CrBz9gR2uuGK5NXTBXrMe6TzhP1jzQNIAmT6Rv76qXahfEgJ8rbOzmxQ==
X-Received: by 2002:a05:600c:6020:b0:40b:5e59:99bd with SMTP id az32-20020a05600c602000b0040b5e5999bdmr5569257wmb.221.1702887983008;
        Mon, 18 Dec 2023 00:26:23 -0800 (PST)
Message-ID: <3a41ab3a-c1e6-4371-bd71-26cd97baffd6@suse.com>
Date: Mon, 18 Dec 2023 09:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: allow non-BIGMEM configs to boot on >= 16Tb systems
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <4b282f2f-bce8-4c98-897c-2866ec1b6dd0@suse.com>
 <ZXxovHNdNK_OfHUs@macbook>
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
In-Reply-To: <ZXxovHNdNK_OfHUs@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.12.2023 15:54, Roger Pau Monné wrote:
> On Wed, Jun 07, 2023 at 08:17:30AM +0200, Jan Beulich wrote:
>> While frame table setup, directmap init, and boot allocator population
>> respect all intended bounds, the logic passing memory to the heap
>> allocator which wasn't passed to the boot allocator fails to respect
>> max_{pdx,pfn}. This then typically triggers the BUG() in
>> free_heap_pages() after checking page state, because of hitting a struct
>> page_info instance which was set to all ~0.
>>
>> Of course all the memory above the 16Tb boundary is still going to
>> remain unused; using it requires BIGMEM=y. And of course this fix
>> similarly ought to help BIGMEM=y configurations on >= 123Tb systems
>> (where all the memory beyond that boundary continues to be unused).
>>
>> Fixes: bac2000063ba ("x86-64: reduce range spanned by 1:1 mapping and frame table indexes")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1722,15 +1722,16 @@ void __init noreturn __start_xen(unsigne
>>  
>>      if ( max_page - 1 > virt_to_mfn(HYPERVISOR_VIRT_END - 1) )
>>      {
>> -        unsigned long limit = virt_to_mfn(HYPERVISOR_VIRT_END - 1);
>> +        unsigned long lo = virt_to_mfn(HYPERVISOR_VIRT_END - 1);
>> +        unsigned long hi = pdx_to_pfn(max_pdx - 1) + 1;
> 
> Maybe use max_page to avoid the pdx_to_pfn() call?  (And is also more
> in context with the condition on the outside if).

You mean

        unsigned long hi = min(pdx_to_pfn(max_pdx - 1) + 1, max_page);

? I could switch to that, yes. I wouldn't feel well switching to using
just max_page, especially with me having nowhere to (reasonably) test.

Jan

