Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 331CD94FE57
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 09:02:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775983.1186134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdlY0-0003Ng-85; Tue, 13 Aug 2024 07:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775983.1186134; Tue, 13 Aug 2024 07:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdlY0-0003L0-5G; Tue, 13 Aug 2024 07:02:24 +0000
Received: by outflank-mailman (input) for mailman id 775983;
 Tue, 13 Aug 2024 07:02:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdlXy-0003KW-UY
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 07:02:22 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc0922e2-5941-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 09:02:20 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5b5b67d0024so5849944a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 00:02:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f3fb069dsm43339466b.80.2024.08.13.00.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 00:02:19 -0700 (PDT)
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
X-Inumbo-ID: fc0922e2-5941-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723532540; x=1724137340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XF2r7HyMcvp3Zgz62HvJXzBMQ9YQZbDu6pAbWtOV6Kc=;
        b=fHoHP/kILzhMNHOm/awSuXYatUDbsyArRnxrRXHnNusjj3+7TJVNqwJALUFV+y5oTe
         nGeTZXJjP0+XQBvRZwNwcor47hrnFz59fYd6VVXOwChlshk0cipz0wxhot9+yVmsUdAJ
         TCmgLMEXe8p9HCLFMJa5ayc3fkKEKekYaSFTow6q7L87XlLeblSOnmAs9n88hwrEA8tJ
         Ux9wbQCZdVrvnTpiA8nwanI7YGARTkenzR/cUwhG0ccGS5O4T6pTprMCLKtXuIGa+mDc
         rcBWuO+oDQqBWJV80G+W5uNMLhT0wHt4CEO8lhKoLlyfMsyIOTydk1ZwT+0nICo9IStj
         kvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723532540; x=1724137340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XF2r7HyMcvp3Zgz62HvJXzBMQ9YQZbDu6pAbWtOV6Kc=;
        b=dI137tvn0DrF509M7AwenBBwMXmUVQdSZK1d6Dm4CmF8QkzroYxrR3bzDL+JLSTD1L
         OW95sG7U2RlNPuVZIFqsbhqt4KbYynO02P1LJsLiS2qMEFyoA0Db6Ef+y1IAtBK9lYyQ
         OeQEgN256WtSnWRPDiffHBH7GzcV59AnGuvqxDObdPcLKOjSrcuzgU2rIOayQsUlJDVm
         NQSdfFH5ubokroA1DGRLJY6f+zyOLkbt1cO4wrmgrx1xq3ptAV7yShc8cjX2cxJuPBbe
         iL849wth6/jHJN3q9HXvDVbS6rDwQ2ZgFceztP39kL6oXJmcghNpvwzsx/uBfzLzO/FA
         QwDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9Omv6AC6/dxSVns0i00Gk3GEZtpxs7Vle9CSuRlmiTbZ/Jec0HU69eQVdrKRjpJ7N4XAmEM8usWmu+dubmbe1oUqOCIg8rMVPqbmMbXI=
X-Gm-Message-State: AOJu0YybiACWdw45S80nvLNitv+jrmgAyMIUUldqteAjHkSh+0OPpceN
	v9Hom+AE738ykgjvlBvpJNOf973K8vXb6C+q6KaD+0GgGvhBAYJ5NL2XHouo+8iADU5H4HK149U
	=
X-Google-Smtp-Source: AGHT+IFzMLxbVH0sFLPqDUMWPTZ23/p5ZpCK/ryWaU88t9tcMPyfZeTAREl5U0yDFskqqYL9hYUhOA==
X-Received: by 2002:a17:907:f1e1:b0:a7a:aa35:408e with SMTP id a640c23a62f3a-a80ed2055f4mr179618666b.27.1723532540127;
        Tue, 13 Aug 2024 00:02:20 -0700 (PDT)
Message-ID: <2fe91be6-c7be-4d61-ab71-ca6cfdd5ffd9@suse.com>
Date: Tue, 13 Aug 2024 09:02:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: slightly simplify MB2/EFI "magic" check
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f2186827-62e6-4b24-8a6c-0c2a9499c232@suse.com>
 <18701bb3-7aa3-4f46-8071-be4cf75a2e76@citrix.com>
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
In-Reply-To: <18701bb3-7aa3-4f46-8071-be4cf75a2e76@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.08.2024 23:40, Andrew Cooper wrote:
> On 08/08/2024 9:49 am, Jan Beulich wrote:
>> --- a/xen/arch/x86/boot/head.S
>> +++ b/xen/arch/x86/boot/head.S
>> @@ -233,13 +233,11 @@ __efi64_mb2_start:
>>  
>>          /* Check for Multiboot2 bootloader. */
>>          cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
>> -        je      .Lefi_multiboot2_proto
>>  
>>          /* Jump to .Lnot_multiboot after switching CPU to x86_32 mode. */
>>          lea     .Lnot_multiboot(%rip), %r15
>> -        jmp     x86_32_switch
>> +        jne     x86_32_switch
>>  
>> -.Lefi_multiboot2_proto:
>>          /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline. */
>>          xor     %esi,%esi
>>          xor     %edi,%edi
> 
> 
> You've split the logical in two, and now the comment is in the wrong
> position.
> 
> If you're going to make this change, it wants to end up reading:
> 
>     /* Jump to .Lnot_multiboot after switching CPU to x86_32 mode. */
>     lea     .Lnot_multiboot(%rip), %r15
> 
>     /* Check for Multiboot2 bootloader. */
>     cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
>     jne     x86_32_switch
> 
> 
> Not that it's really relevant, but this form also macrofuses nicely.

All true, yet I'm sure you also read my response to Alejandro: Then we
ought to also change the other similar instances. The goal of this simple
change, after all, is to get all similar pieces of code into consistent
shape.

Jan

