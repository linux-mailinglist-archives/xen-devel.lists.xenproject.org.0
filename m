Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A95AACFEE7
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 11:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008248.1387502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNT6v-0006Ip-9K; Fri, 06 Jun 2025 09:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008248.1387502; Fri, 06 Jun 2025 09:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNT6v-0006H5-6X; Fri, 06 Jun 2025 09:11:37 +0000
Received: by outflank-mailman (input) for mailman id 1008248;
 Fri, 06 Jun 2025 09:11:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNT6t-0006Gz-RQ
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 09:11:35 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dd78683-42b6-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 11:11:33 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a375888297so1206346f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 02:11:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236032fccf1sm8377235ad.97.2025.06.06.02.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 02:11:32 -0700 (PDT)
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
X-Inumbo-ID: 3dd78683-42b6-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749201093; x=1749805893; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yuXnGITwwjCcJzqb+2/9XK9tqWFcCA2oZSa8lNn6TgI=;
        b=AE2TZLYS22f2GODLqMl4meD+HdTt3z3IuewDCTLxFEq0xHCTujkWEfOL3xwJPj9Cut
         0+ljfI0f4aZc03a74CnbIdNf4GUC9j98AIU5S5SgP7M3cNuwVOm9pnpt1cH8PWx2ZNcM
         j2nJZXikjvjqlRiNpvBX3Wn3d3SvkxscSpRO3du4SjWwrr0hqCcZiYtQkgV97bVY8lZ3
         YJP4TzA3bCuGCoLVcIVh6kOC0vCcknRX1OcQSlP9m3wZ4FLMzmJapiTITvsXYLXgRfGW
         ab1bbsu8S5pSrywu5gf0mDYFY2wJfxNjyp7N/VfSrsfOy0KyQPTtDG5dLBE5z6/rPH33
         PjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749201093; x=1749805893;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuXnGITwwjCcJzqb+2/9XK9tqWFcCA2oZSa8lNn6TgI=;
        b=cSDfZmNJYrhvuqzFu1vjnMQoeFwbxQ8vq7dn2D6YVrs2FeBqAcJKeuq3pm/Mjn4m4R
         i7Q2noJLWICZylTpWmTrZFoYZ/LU80ZcHvLemZWPGlqeShtmccOMpy1WxfSJ0redOPkI
         JnejpK4yP+FXW+emHCwWvSBoGgTm/czVdETBQUsWuMl4sb5S8MP4vO2RLI/gfUt/wwEq
         lWnEPOsrGo43TDFI7WlULtM98Q8ZrVaFrigDLP1xedmSgYkzCCZU5VNE0LD13AyOFdWy
         qbqBANE5bBLUatct8EpG92S9mkvp8o2Vx635hDqnIUDE9lscPusaDG6R7ddNOZJFiVA+
         9wmw==
X-Forwarded-Encrypted: i=1; AJvYcCXsB9+cNiW1sjln9aDAURE59UIAFXIdZEUHX+RUROTZNH4Tuc2XnFApiiQHhlFZtfpldQlQb7kmeaY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxr5JFviZs7LSQYyXRlqD+Ex98HsWA7+LN1i9PoKQAyQ7c5hVLa
	1kAcE9eTjL52iYdOx8If6w4y/jhzvf7A2D5QcT9KIW0oOiPC4pNgkHlBvWbbULVM6w==
X-Gm-Gg: ASbGncv8l1v6tMbuCv0pzfPTFvsSYUgEcZeGR3pY9DSXsZS9YL4P4pv5X/JIpu/OSWw
	xFqDuBkxamKzB2enYWws5Wq18HoSxiQxaqIs3/RcWBs87lnn4/DSiZYEkNm4XOnoXX8fPHhGL4B
	NEI4j06E58C3/7pKG7IlcjOsyChnSt7h8coMOGP1jFQ2VauONR6xub23CQtddVJvlAGYeabuJjb
	Trv9DXjLu0a+lKRwSpr54L1CyDTyjxvKRfBC/QZl3OhCzxkY/Qk7epr8Gg4CklHzvm7KowzRamc
	P9T6fr8C7Y0XbuyFpda4bnbMOdvRQRdL4b+IcA5FnhxKSYR9N+d70mOOBZQAzJl8DCdEhosTNR8
	RPDmxgondn4+zubBuyj6RtV66Lx+In7uY7ulH
X-Google-Smtp-Source: AGHT+IHEYRJuQ0UxSTYS4yRDrMVFzajdesySE7JCtJMSmSPwoajs1ZIK6azSJVrOYGh03XhnqZYF+w==
X-Received: by 2002:a5d:5f51:0:b0:3a4:e61e:dc93 with SMTP id ffacd0b85a97d-3a526dc53e9mr6798091f8f.1.1749201093237;
        Fri, 06 Jun 2025 02:11:33 -0700 (PDT)
Message-ID: <b3f470f0-4b69-4d8d-9d26-d54544690a4b@suse.com>
Date: Fri, 6 Jun 2025 11:11:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] x86: re-work memset()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <73481cbf-337f-4e85-81d2-3487366cd822@suse.com>
 <4592a702-acf3-4229-9069-d5b639151657@suse.com>
 <d01ed027-5cfc-4e0f-8d62-dadb3e76eed2@vates.tech>
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
In-Reply-To: <d01ed027-5cfc-4e0f-8d62-dadb3e76eed2@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.06.2025 18:59, Teddy Astie wrote:
> Le 05/06/2025 à 12:26, Jan Beulich a écrit :
>> --- a/xen/arch/x86/alternative.c
>> +++ b/xen/arch/x86/alternative.c
>> @@ -346,6 +346,12 @@ static int init_or_livepatch _apply_alte
>>           /* 0xe8/0xe9 are relative branches; fix the offset. */
>>           if ( a->repl_len >= 5 && (*buf & 0xfe) == 0xe8 )
>>               *(int32_t *)(buf + 1) += repl - orig;
>> +        else if ( IS_ENABLED(CONFIG_RETURN_THUNK) &&
>> +                  a->repl_len > 5 && buf[a->repl_len - 5] == 0xe9 &&
>> +                  ((long)repl + a->repl_len +
>> +                   *(int32_t *)(buf + a->repl_len - 4) ==
>> +                   (long)__x86_return_thunk) )
>> +            *(int32_t *)(buf + a->repl_len - 4) += repl - orig;
> 
> That looks a bit confusing, to me that probably some comment explaining 
> what instructions transform it's looking to make.

It's still the same comment ahead of the if() that applies here. This will all
become easier with Andrew's decode-light, at which point we'll be able to spot
CALL/JMP anywhere  in a blob.

>> --- /dev/null
>> +++ b/xen/arch/x86/memset.S
>> @@ -0,0 +1,30 @@
>> +#include <asm/asm_defns.h>
>> +
> 
> It would be nice to have a reminder of the calling convention (i.e what 
> register maps to what memset parameter) as it will definitely help 
> future readers.
> 
> If I understand correctly here :
> - rdi: destination (s)
> - rsi: byte to write (c)
> - rdx: number of bytes to write (n)

I don't think the (default) ABI needs re-stating for every function in every
assembly file.

>> +.macro memset
>> +        and     $7, %edx
>> +        shr     $3, %rcx
>> +        movzbl  %sil, %esi
>> +        mov     $0x0101010101010101, %rax
>> +        imul    %rsi, %rax
>> +        mov     %rdi, %r8
>> +        rep stosq
>> +        or      %edx, %ecx
>> +        jz      0f
>> +        rep stosb
>> +0:
>> +        mov     %r8, %rax
>> +        RET
>> +.endm
>> +
>> +.macro memset_erms
>> +        mov     %esi, %eax
>> +        mov     %rdi, %r8
>> +        rep stosb
>> +        mov     %r8, %rax
>> +        RET
>> +.endm
>> +
> 
> Overall, I am a bit confused on the mixing of 32-bits (edx, esi, ...) 
> and 64-bits registers (rax, ...). But it looks ok to me.

Since 64-bit forms require REX, 32-bit ones are used wherever that's sufficient
for the purpose.

Jan

