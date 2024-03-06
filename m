Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F87872F86
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 08:23:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688967.1073807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhlbX-00022Q-88; Wed, 06 Mar 2024 07:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688967.1073807; Wed, 06 Mar 2024 07:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhlbX-00020A-5D; Wed, 06 Mar 2024 07:22:19 +0000
Received: by outflank-mailman (input) for mailman id 688967;
 Wed, 06 Mar 2024 07:22:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhlbV-000204-V9
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 07:22:17 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 426ff9ee-db8a-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 08:22:16 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a449c5411e1so650130866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 23:22:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z20-20020a170906271400b00a441cb52bfcsm6862217ejc.165.2024.03.05.23.22.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 23:22:15 -0800 (PST)
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
X-Inumbo-ID: 426ff9ee-db8a-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709709736; x=1710314536; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=br3ZeMiDjo2cgWcMnb81aMNlRz+DfjDJhOCVrdZSIiw=;
        b=D0eMGTKozwchYyPxASWDISwGOexWsFpitmdDDDlom36+v/XqiQRCeCiPnM3JTZb+lG
         ISOdAKETmmwaoeaiwRVr/xHauBz/JrQgpnl9hHzVnDcuJHsEGf9kd0+sScITX+IyoDYI
         1FlrBhj1d7xkfnaXtX3M1VsGrgvo4hYmI6LXOddMuj1BSkMasBHfX2pWYo4OVU8QgrSK
         M/SmTN+yQx3b9Mr3d1D0ZWjQU3PFNyfOb/EQTOEpHbrGRNH+eKf14z80K0jlfMW0r4Qo
         YabQ+/sq7Q+hdpS1YTvdGK4GOc1xt45+utfCQqQYC1GxPAut36r+co3UK6eLTg/9baER
         ptxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709709736; x=1710314536;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=br3ZeMiDjo2cgWcMnb81aMNlRz+DfjDJhOCVrdZSIiw=;
        b=B36OEFusW0VwZZ0chK4EEHLK+xAdK1K5Moc0EfyjH7VMUHPJOVthVRX8pVzXfg8b5e
         ay9+LAaBJ6jU/6WB3pb/yGE7Z6Njo3iIdckFULrUvYYfysFNycLndbcFwP5o63iYC1de
         iostnDM+L3Z86kuYLOfXzwVmo6lSLxu3qzFPkKIG/l/I48AQ7AAXw2z9QdJq2AF2HM8K
         dZU4NEC1a14Rk5CfdwwcEe896pWTne2wIhIhIpjMr5cRTKjxTIdyVvHGe5payuVXMXTi
         JJvAUjf6JUFoNmPUmha3dC4tfGPjas95fETz7beucaRVBjd7nplrR/pLl0sPI6MNtxSs
         y1zA==
X-Forwarded-Encrypted: i=1; AJvYcCWAM9OGzEEJUVTOUTxiEOdZv3iKukgxeC5S/D5goX2gt+FudOBBcjaXQ+nJHR8s0zXpKvJsOVuMdOnmtHFYj+82kp4jKWRD7NFpLa6ydAE=
X-Gm-Message-State: AOJu0YwNmX0TUPwEfg41vZaqnD7HWcX7l2bkD2t1YefN3di0AwZXhxBg
	GSNw77gYVcM7rLqo1mhb74ovjeCFJPBaoFvgle+2b/USMya4xVRiM8eVIbn57w==
X-Google-Smtp-Source: AGHT+IE3zP2G1YtIf6OziwX2utqvDz11aVb/NhvXVHwYruSNo3yfAZ2zlmmUkrmbm5YLKAf9qWxiAw==
X-Received: by 2002:a17:906:398a:b0:a44:e28d:31a0 with SMTP id h10-20020a170906398a00b00a44e28d31a0mr6939259eje.53.1709709735640;
        Tue, 05 Mar 2024 23:22:15 -0800 (PST)
Message-ID: <6fb7b2c9-6665-4cbd-a1c4-24ebf7514b88@suse.com>
Date: Wed, 6 Mar 2024 08:22:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86+Arm: drop (rename) __virt_to_maddr() /
 __maddr_to_virt()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b837e02d-fd65-458f-a946-ea36a52ddd3e@suse.com>
 <ce705871-bda9-4518-96da-010f24c98512@xen.org>
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
In-Reply-To: <ce705871-bda9-4518-96da-010f24c98512@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2024 20:24, Julien Grall wrote:
> Hi Jan,
> 
> The title is quite confusing. I would have expected the macro...
> 
> On 05/03/2024 08:33, Jan Beulich wrote:
>> There's no use of them anymore except in the definitions of the non-
>> underscore-prefixed aliases. Rename the inline functions, adjust the
>> virt_to_maddr() #define-e, and purge the (x86-only) maddr_to_virt() one,
>> thus eliminating a bogus cast which would have allowed the passing of a
>> pointer type variable into maddr_to_virt() to go silently.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -256,12 +256,12 @@ static inline void __iomem *ioremap_wc(p
>>   /* Page-align address and convert to frame number format */
>>   #define paddr_to_pfn_aligned(paddr)    paddr_to_pfn(PAGE_ALIGN(paddr))
>>   
>> -static inline paddr_t __virt_to_maddr(vaddr_t va)
>> +static inline paddr_t virt_to_maddr(vaddr_t va)
>>   {
>>       uint64_t par = va_to_par(va);
>>       return (par & PADDR_MASK & PAGE_MASK) | (va & ~PAGE_MASK);
>>   }
>> -#define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))
>> +#define virt_to_maddr(va) virt_to_maddr((vaddr_t)(va))
> 
> ... to be removed. But you keep it and just overload the name. I know it 
> is not possible to remove the macro because some callers are using 
> pointers (?).

Indeed. I actually tried without, but the build fails miserably.

> So I would rather prefer if we keep the name distinct on Arm.
> 
> Let see what the other Arm maintainers think.

Well, okay. I'm a little surprised though; I was under the impression
that a goal would be to, eventually, get rid of all the __-prefixed
secondary variants of this kind of helpers.

Jan

