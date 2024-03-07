Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E22875336
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 16:33:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689947.1075485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riFjr-00072F-Re; Thu, 07 Mar 2024 15:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689947.1075485; Thu, 07 Mar 2024 15:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riFjr-0006zm-OY; Thu, 07 Mar 2024 15:32:55 +0000
Received: by outflank-mailman (input) for mailman id 689947;
 Thu, 07 Mar 2024 15:32:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1riFjq-0006ze-8t
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 15:32:54 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5ca9b5a-dc97-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 16:32:51 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-564fd9eea75so1471398a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 07:32:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i23-20020a0564020f1700b00567f780d4a2sm1614385eda.78.2024.03.07.07.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 07:32:50 -0800 (PST)
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
X-Inumbo-ID: f5ca9b5a-dc97-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709825571; x=1710430371; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ICTD9W1jZNKmaeymhp1OA1AH+0jy22X0d9edds9WeIo=;
        b=YAFTiY+6ZxRoKL8UbrRkYrn5zghfBJwselnnsQHeeQIU9pfOEPuShHzBrl/x1SXolR
         266ruF2f1oBuipouly3mbhROmDXJKWALoiqAEKPimaESzFXj3dS5Cza7PCLwBSx1OyrJ
         qQSbj6M5Vy4D12HdfkKAxB/oWl/TgVnL56FpZ2JqaA3wBqTqVE5n4Li+DHRVzGpLV1B4
         1wnOiz8dmxh/j24GaUj9sLFBEodJciG7OCh9tdnXZ14xP++lv8GIlhtrDppnHtgnQsd1
         NkXXXdlbQRnzEloo9m+AFNgB/vG0hI2rHe9Alg6w6jC5k7oNJvehTOvTZiy04MTzJQ8Y
         75dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709825571; x=1710430371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ICTD9W1jZNKmaeymhp1OA1AH+0jy22X0d9edds9WeIo=;
        b=fyMWm7CF4T0VR6aaBdiOKjw1hGG4H35eIl2hsREMV1eYWDbmnpwj2y4Nwc7w6AEfMJ
         OmvA/efSsa34zVYQRywkeXALrsb02tmXoIIgnEDxReSEOGotN8/8s8f6ED9QN741RbIl
         OcsBDR+k6LlCL8ZX4Wwhnu/5CraMHd2XUmDgEbC9EJ5NDHk4z9gpt9O05PpTAKU2m/TB
         hWWl0qNBpxyyIJvbNIs7IiogJoZq+U4jUFoIVaFSahWQ517R7JikPhjFNC1zUAwPxemA
         DtKag8kRm2eMYd5NTBd92okSvD/Sf7KPg7t8FqvYA7NK+9h/JQqbLSOlPJJYJadUEFQV
         UiQA==
X-Forwarded-Encrypted: i=1; AJvYcCWTxSzujSvkJHapEh2f82+X+LQlIGGa0gga6ZzJfWRWTJePI5d2PWh/DxU3i5pJbLe578kGKB81ARL0I9zODx/MRGu9hZ+eEM+56n8T8nY=
X-Gm-Message-State: AOJu0Yxazl9/hlRgLiWLtiGcfBay1KE/WdaMqA2ynLNnA65hhajBVxkJ
	6IovSFII9V9KripyD0heY4sbK8EvoPkybsg4LO0OyxKzQq4O7h8N2sjXcVBpug==
X-Google-Smtp-Source: AGHT+IE4a6ySWnbqC1+6etZSY5njGHdzxOmDXQc+iri7lQX9wLSodv5Uy94bi6zTeOu3jeIxS20h8w==
X-Received: by 2002:a50:c354:0:b0:567:672f:6076 with SMTP id q20-20020a50c354000000b00567672f6076mr108987edb.14.1709825571223;
        Thu, 07 Mar 2024 07:32:51 -0800 (PST)
Message-ID: <2a05c233-b3c5-417c-bd6b-8b1c21f03c3d@suse.com>
Date: Thu, 7 Mar 2024 16:32:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/23] xen/riscv: introduce io.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <dd7c95b5197dfd0cca0edf9c0ada631336eb60d7.1708962629.git.oleksii.kurochko@gmail.com>
 <807c31d5-0c5a-4646-ba90-2f284289069f@suse.com>
 <d047c0956f804f7191f91b1d690650e220ec0fe4.camel@gmail.com>
 <a164230f-2054-47e9-b72c-51f4a5955fe0@suse.com>
 <2a3e49bf94332c17b50e4f0f745e4b28b16dceb1.camel@gmail.com>
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
In-Reply-To: <2a3e49bf94332c17b50e4f0f745e4b28b16dceb1.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.03.2024 14:44, Oleksii wrote:
> On Thu, 2024-03-07 at 14:24 +0100, Jan Beulich wrote:
>> On 07.03.2024 14:01, Oleksii wrote:
>>> On Wed, 2024-03-06 at 15:13 +0100, Jan Beulich wrote:
>>>>> +/* Generic IO read/write.  These perform native-endian
>>>>> accesses.
>>>>> */
>>>>> +static inline void __raw_writeb(uint8_t val, volatile void
>>>>> __iomem
>>>>> *addr)
>>>>> +{
>>>>> +    asm volatile ( "sb %0, 0(%1)" : : "r" (val), "r" (addr) );
>>>>> +}
>>>>
>>>> I realize this is like Linux has it, but how is the compiler to
>>>> know
>>>> that
>>>> *addr is being access here? 
>>> Assembler syntax told compiler that. 0(%1) - means that the memory
>>> location pointed to by the address in register %1.
>>
>> No, the compiler doesn't decompose the string to figure how operands
>> are used. That's what the constraints are for. The only two things
>> the
>> compiler does with the string is replace % operators and count line
>> separators.
> It looks like I am missing something.
> 
> addr -> a some register ( because of "r" contraint ).
> val -> is also register ( because of "r" contraint ).
> 
> So the compiler will update instert an instruction:
>  sb reg1, 0(reg2)
> 
> what means *(uint_8 *)reg2 = (uint8_t)reg1.
> 
> What am I missing?

The fact that the compiler will not know that *(uint_8 *)reg2 actually
changes across this asm(). It may therefore continue to hold a cached
value in a register, without knowing that its contents went stale.

Jan

