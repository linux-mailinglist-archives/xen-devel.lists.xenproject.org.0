Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C917BD1AFD
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 08:32:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141693.1475857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8C60-0007pT-RK; Mon, 13 Oct 2025 06:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141693.1475857; Mon, 13 Oct 2025 06:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8C60-0007n5-OE; Mon, 13 Oct 2025 06:31:48 +0000
Received: by outflank-mailman (input) for mailman id 1141693;
 Mon, 13 Oct 2025 06:31:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8C60-0007mz-6k
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 06:31:48 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a724d8a-a7fe-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 08:31:46 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3fc36b99e92so3366632f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 12 Oct 2025 23:31:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57cce5sm16865085f8f.1.2025.10.12.23.31.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Oct 2025 23:31:45 -0700 (PDT)
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
X-Inumbo-ID: 4a724d8a-a7fe-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760337106; x=1760941906; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ldHS2qkAha7NIT7RTC56XXjpQ7ycWHJ8R9Ve0GhNLhM=;
        b=DsMkdyL/w5pAww1u9O/k5nXuCqcwswng0thfwIX+SVa9bDkabhKjNYr8JuCGGxwbSW
         Ses1ZqTpWjK1rbQgd+D6HvTv16R1VgWwLSJtriqPO2rYGIhpoS1jc6m034yUOpXtVPEx
         F0dH5hzeulpUjVrwoRUhp+t2Hck7Qjp1jr8cAHCcYkTWsmng6fFn4PSJ+VTbP1hz78wE
         zdU+SopZZJDrqNu6JAjiZRN9sRi9xTX1ggAIUx9q5bxx43+IbOZMBwKvsn1ZmLBFLT9N
         V4VQyXLTtTI4ubaSaj3thPXk5rxaTWonkDqJhC9s+a+ryvZdHiA0DDNaU494BLFqQBDV
         e0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760337106; x=1760941906;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldHS2qkAha7NIT7RTC56XXjpQ7ycWHJ8R9Ve0GhNLhM=;
        b=QuZjCGbwlKuoBu5+FPQjbJ2sXPKbyD09iEv1ixYyTVLMjRuNVtJKtbPiPkFa0gjT9N
         MLYeOi831bZmMYoCRyvuB60a80vN9gZktVYuTU14PNz049CCf1ZWZTeDLCaOZUupGaxY
         3kWTgLuRdwFH7D7LlHZAx22x2DdnqZ27AKnHLF19kBya21Fox7etYVsBPpTrs+VIHeMi
         uNu4kBeJKsXeU3EBiwlJ23n+KyQjKoO79dNtubZ23ciu9m+d2EO4tv2rySBIrvLzlLtr
         DIkq4OBN2orKXzURn3SotnDBbHgJ2rVrCAVyqzP/hhlUvbYlTkbd3vCP8Eq5J13dS4wT
         hVsg==
X-Gm-Message-State: AOJu0YxiHzaWsBL3Q+//S+8s5vze01YaxnUd+Dl101gYScQOfFMDV0S/
	hIId1NVy1kWVbjh1apfG+3o/pfN8NTuX7KgUkYQrRZLTAufJwnru/LYEKsY/3Dqm6A==
X-Gm-Gg: ASbGncvXck7cwEYQ9UPq4siNfY2cqrK2gXIxX8LGEwNN0LQjLFkumrtAI1WcA4PpPtp
	Fqd5pXnLbGk9bQUKIcPf3Iny9Nky+KM2Q8GG9xGCxs2xriW0l+C2ly9GYNwBJOQZPQGP40dt3Cp
	J9CZfWYomQv36uPSfVQInfqfp2h8iDrqHFgfZDxqLWbGghjSwZnY9IlDMqORSG5YThCHwtLFsx6
	DTkEjrmQCkbwjObhVvjK77YJvW0luIWFKruVHcSLY3lvQSeHcO8S3rFCfv/5fxcXbYqrCrZUoKI
	WpD0/rdSAyLkKaMAH0D9jkxUqGCj/x7Ztsk93tjmzr5sh2vkXKa8evLRBOTvyAB0w1OsPbX5Gh/
	rkkiu6CUj/6uZhLPtIJte/Qbgl+etriS45UdBAi3gA8f3PZ0EYdaDaqh9dN16JN4k92hZ8sQMW7
	WyDW8glBAlLgH15wu2qTzoJk5BrjDBjEggK3vf
X-Google-Smtp-Source: AGHT+IGTBNR2XlcXuNGtyZvv/5ktxBRmhDnzeQwswJfhzCVW3X7W0TwXO/Ua1CUd7mqWAsUS9MakeQ==
X-Received: by 2002:a05:6000:2406:b0:3e7:6424:1b47 with SMTP id ffacd0b85a97d-42666a9e1b1mr16597773f8f.6.1760337105647;
        Sun, 12 Oct 2025 23:31:45 -0700 (PDT)
Message-ID: <3b339baf-672d-4c3f-9a04-b18fe5181b71@suse.com>
Date: Mon, 13 Oct 2025 08:31:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21??? 1/3] x86/vLAPIC: add indirection to LVT
 handling
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Andrew Cooper <amc96@srcf.net>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
 <dd6b46f8-76f7-46d3-b3be-083b58781f32@suse.com> <aOkb5HKVejs6QO5Z@Mac.lan>
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
In-Reply-To: <aOkb5HKVejs6QO5Z@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.10.2025 16:44, Roger Pau Monné wrote:
> On Wed, Oct 08, 2025 at 02:08:26PM +0200, Jan Beulich wrote:
>> In preparation to add support for the CMCI LVT, which is discontiguous to
>> the other LVTs, add a level of indirection. Rename the prior
>> vlapic_lvt_mask[] while doing so (as subsequently a 2nd array will want
>> adding, for use by guest_wrmsr_x2apic()).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> The new name (lvt_valid[]) reflects its present contents. When re-based on
>> top of "x86/hvm: vlapic: fix RO bits emulation in LVTx regs", the name
>> wants to change to lvt_writable[] (or the 2nd array be added right away,
>> with lvt_valid[] then used by guest_wrmsr_x2apic()). Alternatively the
>> order of patches may want changing.
>>
>> --- a/xen/arch/x86/hvm/vlapic.c
>> +++ b/xen/arch/x86/hvm/vlapic.c
>> @@ -32,7 +32,16 @@
>>  #include <public/hvm/params.h>
>>  
>>  #define VLAPIC_VERSION                  0x00050014
>> -#define VLAPIC_LVT_NUM                  6
>> +#define LVT_BIAS(reg)                   (((reg) - APIC_LVTT) >> 4)
>> +
>> +#define LVTS \
>> +    LVT(LVTT), LVT(LVTTHMR), LVT(LVTPC), LVT(LVT0), LVT(LVT1), LVT(LVTERR),
>> +
>> +static const unsigned int lvt_reg[] = {
>> +#define LVT(which) APIC_ ## which
>> +    LVTS
>> +#undef LVT
>> +};
>>  
>>  #define LVT_MASK \
>>      (APIC_LVT_MASKED | APIC_SEND_PENDING | APIC_VECTOR_MASK)
>> @@ -41,20 +50,21 @@
>>      (LVT_MASK | APIC_DM_MASK | APIC_INPUT_POLARITY |\
>>      APIC_LVT_REMOTE_IRR | APIC_LVT_LEVEL_TRIGGER)
>>  
>> -static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =
>> +static const unsigned int lvt_valid[] =
>>  {
>> -     /* LVTT */
>> -     LVT_MASK | APIC_TIMER_MODE_MASK,
>> -     /* LVTTHMR */
>> -     LVT_MASK | APIC_DM_MASK,
>> -     /* LVTPC */
>> -     LVT_MASK | APIC_DM_MASK,
>> -     /* LVT0-1 */
>> -     LINT_MASK, LINT_MASK,
>> -     /* LVTERR */
>> -     LVT_MASK
>> +#define LVTT_VALID    (LVT_MASK | APIC_TIMER_MODE_MASK)
>> +#define LVTTHMR_VALID (LVT_MASK | APIC_DM_MASK)
>> +#define LVTPC_VALID   (LVT_MASK | APIC_DM_MASK)
>> +#define LVT0_VALID    LINT_MASK
>> +#define LVT1_VALID    LINT_MASK
>> +#define LVTERR_VALID  LVT_MASK
>> +#define LVT(which)    [LVT_BIAS(APIC_ ## which)] = which ## _VALID
>> +    LVTS
>> +#undef LVT
>>  };
>>  
>> +#undef LVTS
> 
> I've been thinking about this, as I agree with Grygorii here that the
> construct seems to complex.  What about using something like:
> 
> static const unsigned int lvt_regs[] = {
>     APIC_LVTT, APIC_LVTTHMR, APIC_LVTPC, APIC_LVT0, APIC_LVT1, APIC_LVTERR,
> };
> 
> static unsigned int lvt_valid(unsigned int reg)
> {
>     switch ( reg )
>     {
>     case APIC_LVTT:
>         return LVT_MASK | APIC_TIMER_MODE_MASK;
> 
>     case APIC_LVTTHMR:
>     case APIC_LVTPC:
>         return LVT_MASK | APIC_DM_MASK;
> 
>     case APIC_LVT0:
>     case APIC_LVT1:
>         return LINT_MASK;
> 
>     case APIC_LVTERR:
>         return LVT_MASK;
>     }
> 
>     ASSERT_UNREACHABLE();
>     return 0;
> }
> 
> That uses a function instead of a directly indexed array, so it's
> going to be slower.  I think the compiler will possibly inline it,
> plus the clarity is worth the cost.

I don't agree; I see no clarity issue with the table approach. In fact I
view that one as more "clear". Instead of the above, if anything, I'd
be (somewhat reluctantly) willing to make the (currently follow-on)
change the other way around: Rather than switching guest_wrmsr_x2apic()
to a table-based approach as well, do away with the table-based approach
in vlapic_reg_write() by splitting the respective case blocks some more.
To limit redundancy, that may then involve the (imo undesirable) use of
"goto".

Jan

