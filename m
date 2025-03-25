Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B30A70749
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 17:46:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926723.1329560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx7Q8-0001MX-MX; Tue, 25 Mar 2025 16:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926723.1329560; Tue, 25 Mar 2025 16:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx7Q8-0001K7-I3; Tue, 25 Mar 2025 16:46:32 +0000
Received: by outflank-mailman (input) for mailman id 926723;
 Tue, 25 Mar 2025 16:46:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tx7Q7-0001Jz-3n
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 16:46:31 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b33383d7-0998-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 17:46:30 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so1905376f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 09:46:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdeb6esm205543215e9.31.2025.03.25.09.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 09:46:28 -0700 (PDT)
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
X-Inumbo-ID: b33383d7-0998-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742921189; x=1743525989; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aiukUuVbNWN1E8woYFQ1KwSKF7YW+oMpjW8b0NLO96w=;
        b=MUvaBClrgrmW6mVEObwBd7h4boh3dk7d+Uswc9VqGYUS1Bx2Dqi810FPXxueGFIJEH
         5S6QpHYSwPmytpkvdQVHGURkXUIqBvfIaJ+0P1w0S4uzhwzXnplV9zHtn5y0DuWSvaSd
         +fVnzcWHUZh6ocHaI2/oUGnaekKcDDEFifkhliCZwY64dfVaKNZ/3bmJpQW4m1uRXJlf
         DtYmsITxAvXLb6FUnC+23bcGJ5XG8V/tHdKZNvMNa5L+wrrrp2rSI9PTjBDeNpZkhZ62
         cyS2V6Ca+VnzdnHvcVtne47phUumYY4WgvgxwnUXw5F9J6He3/eJPwuLEi7G7EgwTQAz
         rEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742921189; x=1743525989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiukUuVbNWN1E8woYFQ1KwSKF7YW+oMpjW8b0NLO96w=;
        b=Uq8c1cdsuXJdZn9u3cayjP5jpAx574yvoEEVjHPwzWigtdwToYuPASZOeZdHw5Jbvc
         ryZw3YxGdXTXGk64aXptRk104Eu9Ivl5BVmJWue1/ynwnzYSelLp69a0XkjXuCBRc9wF
         F8Vj3PXEkHiOIOSEzpjAKE9724z7EHo1mgILeDLLj7u6rwkrrvuPobbwBeB0m0v52ygw
         hcWKbQ5M+PGrDDZt7OFfrEWVZjFlgJic7obWea1VPTRyoLcSN24IB8GuBU18YqKHX6lA
         62S5FVIiw1bXd7Ayai9nnWxc6lMWTvlWREwxLXHt0z4qZN9Trgi3OJ9f3Ewe6bXbD+2I
         nDoA==
X-Gm-Message-State: AOJu0YwaKem/pAwFIdFkA2e7yo2xNaWNlvezP2YpjcB0v9fRHlwqC5vj
	Qq9Kr8jc1GcCrulwt9yWpCV/0NlnDkf5z4mJgFIl4TpuPedju6wvhFtHG1FnCeqBhOFgWy5Tiso
	=
X-Gm-Gg: ASbGncuhZh54Lh5VGBZ7yVKAAhsfCnfyexCyj001KAg4NlpxGwAWBNakrKtSsoIL44D
	lc4h9YbMvcrf8WgA1aqwTbfJikyW6nA65nMhcwOlfyuuUs6J+L9jOgZGZjaOTPTr6trx+YDLgfu
	NqIfbTiP1LNNPDYj+p89AYr9a74QCzd6IwnkO6Z3jSJAXgKlCWydjs80td/eQWIA/Igzqnn/xxb
	7gMHEJYkbE65XsFY0EaPDKLoeUlu6zlfAEKdssQbFnILM1YlIGywvPUPuFVJkjWQCU1LIZh054K
	A496FpnzGBu1+CkOKWJFPe6vyfFVIJ2MG4X3PBnCFKcqyLxm1AvldH1F/DVblTGQOKu8r28aZff
	st/sNk7IxUha3rIdTn6gjddz0lHk6MSawUqF+782U
X-Google-Smtp-Source: AGHT+IHAzY795PWdAYeu5uejpT84u62Fvk4ZLP7i1eLyhcIGJAp7IpBC8thfC7eRXHuGzRHDfyXoqQ==
X-Received: by 2002:a05:6000:178b:b0:390:de33:b0ef with SMTP id ffacd0b85a97d-3997f911ec1mr14452537f8f.30.1742921188873;
        Tue, 25 Mar 2025 09:46:28 -0700 (PDT)
Message-ID: <52bd483a-c5bf-4eba-867f-3476b1b86550@suse.com>
Date: Tue, 25 Mar 2025 17:46:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISCV/bitops: Use Zbb to provide arch-optimised bitops
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250226172050.1300771-1-andrew.cooper3@citrix.com>
 <113b2464-c7b2-4068-a179-707cba4f3835@suse.com>
 <50cd2332-11b7-4b64-85ea-489c416098f9@citrix.com>
 <db2073b0-8585-4518-9467-b7da4cefbbae@suse.com>
 <8dff5fb9-b46f-47bf-a6ee-863282155706@citrix.com>
 <295f59af-ebb8-4ad5-bf27-ec0ea5a2c2fe@gmail.com>
 <927264c2-0b99-4d60-97f8-31bcd0d64aa6@suse.com>
 <a7f05789-cf1a-474f-b619-80a7e890a579@citrix.com>
 <7cfbd773-de4b-459f-8fa9-7c6ed19fe0ad@gmail.com>
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
In-Reply-To: <7cfbd773-de4b-459f-8fa9-7c6ed19fe0ad@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.03.2025 17:35, Oleksii Kurochko wrote:
> 
> On 3/7/25 1:12 PM, Andrew Cooper wrote:
>> On 07/03/2025 12:01 pm, Jan Beulich wrote:
>>> On 07.03.2025 12:50, Oleksii Kurochko wrote:
>>>> On 3/6/25 9:19 PM, Andrew Cooper wrote:
>>>>> On 05/03/2025 7:34 am, Jan Beulich wrote:
>>>>>> I was actually hoping to eliminate BITS_PER_LONG at some point, in favor
>>>>>> of using sizeof(long) * BITS_PER_BYTE. (Surely in common code we could
>>>>>> retain a shorthand of that name, if so desired, but I see no reason why
>>>>>> each arch would need to provide all three BITS_PER_{BYTE,INT,LONG}.)
>>>>> The concern is legibility and clarity.
>>>>>
>>>>> This:
>>>>>
>>>>>       ((x) ? 32 - __builtin_clz(x) : 0)
>>>>>
>>>>> is a clear expression in a way that this:
>>>>>
>>>>>       ((x) ? (sizeof(int) * BITS_PER_BYTE) - __builtin_clz(x) : 0)
>>>>>
>>>>> is not.  The problem is the extra binary expression, and this:
>>>>>
>>>>>       ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)
>>>>>
>>>>> is still clear, because the reader doesn't have to perform a multiply to
>>>>> just to figure out what's going on.
>>>>>
>>>>>
>>>>> It is definitely stupid to have each architecture provide their own
>>>>> BITS_PER_*.  The compiler is in a superior position to provide those
>>>>> details, and it should be in a common location.
>>>>>
>>>>> I don't particularly mind how those constants are derived, but one key
>>>>> thing that BITS_PER_* can do which sizeof() can't is be used in #ifdef/etc.
>>>> What about moving them to xen/config.h? (if it isn't the best one place, any suggestion which is better?)
>>>>
>>>> #define BYTES_PER_INT  (1 << INT_BYTEORDER)
>>>> #define BITS_PER_INT  (BYTES_PER_INT << 3)
>>>>
>>>> #define BYTES_PER_LONG (1 << LONG_BYTEORDER)
>>>> #define BITS_PER_LONG (BYTES_PER_LONG << 3)
>>>> #define BITS_PER_BYTE 8
>> The *_BYTEORDER's are useless indirection.  BITS_PER_* should be defined
>> straight up, and this will simplify quite a lot of preprocessing.
> 
> Could we really drop *_BYTEORDER?
> 
> For example, LONG_BYTEORDER for Arm could be either 2 or 3 depends on Arm32 or Arm64 is used.

The can still #define BITS_PER_LONG to 32 or 64 respectively, can't they?

>>>> Also, it seems like the follwoing could be moved there too:
>>>>
>>>> #define POINTER_ALIGN  BYTES_PER_LONG
>>> This one is likely fine to move.
>>>
>>>> #define BITS_PER_LLONG 64
>>> This one is only fine to move imo when converted to
>>>
>>> #define BITS_PER_LONG (BYTES_PER_LLONG << 3)
>> Erm?  That's mixing long and long long types.  Presuming that's an
>> errant L, then sure.
>>
>>>> #define BITS_PER_BYTE 8
>>> Personally I'd rather leave this per-arch. The others can truly be derived;
>>> this one can't be. If we centralize, imo we should also convert the " << 3"
>>> to " * BITS_PER_BYTE".
>> It is highly unlikely that Xen will ever run on a system where CHAR_BIT
>> isn't 8.
>>
>> So I suggest it stays central to reduce complexity.  If an arch ever
>> needs to change it, the complexity can be added then.
> 
> Does it make sense to ifdef that? Or, at least, before defintion of BITS_PER_BYTE something like:
> #if CHAR_BIT != 8
> #error "CHAR_BIT isn't 8"
> #endif

Where would CHAR_BIT come from? Oh, perhaps you mean __CHAR_BIT__? If all
compilers we can build with supply that value, we could indeed centrally
use either

#define BITS_PER_BYTE __CHAR_BIT__

or

#define BITS_PER_BYTE 8
#if BITS_PER_BYTE != __CHAR_BIT__
# error "..."
#endif

Jan

