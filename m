Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 590D9BCBB90
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 07:32:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140960.1475599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v75jy-0000kC-Hr; Fri, 10 Oct 2025 05:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140960.1475599; Fri, 10 Oct 2025 05:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v75jy-0000iN-F1; Fri, 10 Oct 2025 05:32:30 +0000
Received: by outflank-mailman (input) for mailman id 1140960;
 Fri, 10 Oct 2025 05:32:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v75jw-0000iH-Rt
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 05:32:28 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81dbe9c1-a59a-11f0-9d15-b5c5bf9af7f9;
 Fri, 10 Oct 2025 07:32:27 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3f2cf786abeso1461952f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 22:32:27 -0700 (PDT)
Received: from ?IPV6:2003:ca:b74b:a84d:5516:3900:45b8:340e?
 (p200300cab74ba84d5516390045b8340e.dip0.t-ipconnect.de.
 [2003:ca:b74b:a84d:5516:3900:45b8:340e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e0a03sm2298977f8f.37.2025.10.09.22.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 22:32:26 -0700 (PDT)
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
X-Inumbo-ID: 81dbe9c1-a59a-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760074346; x=1760679146; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yhBsvNpa2DehMZyFpLlWZXZfQZmOhiCse3L/IQd4yPU=;
        b=POLfhoATsiVXBYewILQ3mGIniA+DaDuTblXHTdv3yTbnGbPwrEweFM84AZDd1HB4Yy
         o/ptID14SbyqfT27D9WR6NMveoUaKADsLbcp762p/5kxaMy/5Pd5JHfA5Pf7LxnED/P0
         c3J//1SumzYpJU0Mak1Cfgt9OsU/DTPwbtFgNIXw+9A/HG7ZuEOxoNrXbFD18I2xOMS6
         hSO5DzdVdz7nuVNuISh4mby7O98WPr871Li/9Y3wvdeFEVoXggOcQY5hdSeUZPcdn9+M
         M8ebKOLILTx3tYJoQfFtj3z/ux6tAikAzPW3FCl0poeWQ/OOqLHJrVfw2F4SkWCT0kAD
         Z6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760074346; x=1760679146;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhBsvNpa2DehMZyFpLlWZXZfQZmOhiCse3L/IQd4yPU=;
        b=L9lB/qFWKBFMokGiInDXteEYc/Ot5oVeyQ/TLCQFGuvyjOHcuVSJiDO8pSwRUyXp+x
         acF0W1d7QVT5KOpqdDZN/YFfat9QEihJ+QRKCxU1W5x1J62Jq3hiVPFrJjjaufTAmwlF
         l7WJ+wSyzQL7qAyirz6X4SIFhvH6Q2iqmKcWj5qJVdCT8s/mKr6lSPLw2JJdZn48pMU2
         jOBdFviIruR1nooBo7RoqSoVmhqMoZ7uugUEi7E3Rn0Und8lew7NDDYzhU8kaMpAlOLl
         9asldSsQ/CAm36zm0LmTmkCfp2HJTPSZ6pXW1kWbDBdD3xDkNPDDo4gNPXqQxQlg8FME
         88nQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5cUt69xeqI8H3tOR9CUfMYY3fl2jl19z8AaSD+opKpj76/DHt9P+/wGB5HbwX9rv+vYdRC+eeVOk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4gj06g+/A6kAHziFLzWxqjIvw/zZEBcZWCZiJp66VWITUyjB0
	W102ZAgt1HwoVUmuy9+puZWj+lU+XHhbMj1SVBgz6SJN5qvG/a7dZD77DfjIEzUqRQ==
X-Gm-Gg: ASbGncs19NSuXZ2mVsLeWQVQl15vhbHIlYDsgY4+bHvJVDOpYqzu1oc1mI0tFf8Plkd
	+pwXQhf8Ns7TSRZ4oWIOMZ9a10TUwrJSueBn/Ic/uUDQxbvyyJ1rM/4N3rU626U5m6C7gAMK9Sn
	8Z5V0sH7LqYrTaYw/SSnMCtQs63CbjeCa2hw52+pVYaeYYuUUaZ3QUBPHCaFKozsohs0DWvEYSC
	/7e0pAtUc+kVLCHHv66jzIqCyegLIn4ZPTXEnRY6viK3WKG7LOe8wDs30kQBbOFwojeNg1nyM98
	hxqHI39pGpMFSUGoBP0oJakMnGe9cLQAkPfIEUH1r3UQ7iyaCuisSTryLtHt6rzZoXgqRVNi+uV
	Oyaxe0pNhH7T/Q/65MKJsi2q9YF1aZuR/detsnNH+4V6osybHzWTbBWC54QxwaptApPZ1rzDLIJ
	R93TADZIMOecOWWrk7IOqbxwtp1y8pYZIgFp23+LbA83rQNlwERm4yNavEHGL1uAYP0WsUtT3CQ
	g8=
X-Google-Smtp-Source: AGHT+IHTfRr+z6wjsrMt+jpRSblrLM01SFm+puA4of9UmzhweZA+V0XYp7ttJre+KLdyejR6c6R6tA==
X-Received: by 2002:a05:6000:4308:b0:3ee:3dce:f672 with SMTP id ffacd0b85a97d-42666ac625emr5727195f8f.4.1760074346536;
        Thu, 09 Oct 2025 22:32:26 -0700 (PDT)
Message-ID: <afe1d9c5-f399-4b52-ad24-ec52aa755fbf@suse.com>
Date: Fri, 10 Oct 2025 07:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21??? 1/3] x86/vLAPIC: add indirection to LVT
 handling
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <amc96@srcf.net>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
 <dd6b46f8-76f7-46d3-b3be-083b58781f32@suse.com>
 <6a3494af-96a7-4092-a8fe-39aee85fc983@epam.com>
 <f5ae9852-4fa8-4441-9ad9-491e1d1143b9@suse.com>
 <a35ca989-e199-4072-bf73-c9d135f7c2e7@epam.com>
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
In-Reply-To: <a35ca989-e199-4072-bf73-c9d135f7c2e7@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.10.2025 18:16, Grygorii Strashko wrote:
> On 09.10.25 18:31, Jan Beulich wrote:
>> On 09.10.2025 16:56, Grygorii Strashko wrote:
>>> On 08.10.25 15:08, Jan Beulich wrote:
>>>> @@ -41,20 +50,21 @@
>>>>        (LVT_MASK | APIC_DM_MASK | APIC_INPUT_POLARITY |\
>>>>        APIC_LVT_REMOTE_IRR | APIC_LVT_LEVEL_TRIGGER)
>>>>    -static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =
>>>> +static const unsigned int lvt_valid[] =
>>>>    {
>>>> -     /* LVTT */
>>>> -     LVT_MASK | APIC_TIMER_MODE_MASK,
>>>> -     /* LVTTHMR */
>>>> -     LVT_MASK | APIC_DM_MASK,
>>>> -     /* LVTPC */
>>>> -     LVT_MASK | APIC_DM_MASK,
>>>> -     /* LVT0-1 */
>>>> -     LINT_MASK, LINT_MASK,
>>>> -     /* LVTERR */
>>>> -     LVT_MASK
>>>> +#define LVTT_VALID    (LVT_MASK | APIC_TIMER_MODE_MASK)
>>>> +#define LVTTHMR_VALID (LVT_MASK | APIC_DM_MASK)
>>>> +#define LVTPC_VALID   (LVT_MASK | APIC_DM_MASK)
>>>> +#define LVT0_VALID    LINT_MASK
>>>> +#define LVT1_VALID    LINT_MASK
>>>> +#define LVTERR_VALID  LVT_MASK
>>>> +#define LVT(which)    [LVT_BIAS(APIC_ ## which)] = which ## _VALID
>>>> +    LVTS
>>>> +#undef LVT
>>>>    };
>>>>    +#undef LVTS
>>>> +
>>>
>>> I know people have different coding style/approaches...
>>> But using self expanding macro-magic in this particular case is over-kill
>>> - it breaks grep (grep APIC_LVTT will not give all occurrences)
>>> - it complicates code analyzes and readability
>>>      - What is array size?
>>>      - Which array elements actually initialized?
>>>      - what is the actual element's values?
>>> - in this particular case - no benefits in terms of code lines.
>>>
>>> It might be reasonable if there would be few dozen of regs (or more),
>>> but there are only 6(7) and HW spec is old and stable.
>>>
>>> So could there just be:
>>> static const unsigned int lvt_reg[] = {
>>>    APIC_LVTT,
>>>    APIC_LVTTHMR
>>>    ...
>>>
>>> and
>>>
>>> static const unsigned int lvt_valid[] = {
>>>    [LVT_REG_IDX(APIC_LVTT)] = (LVT_MASK | APIC_TIMER_MODE_MASK),
>>>    [LVT_REG_IDX(APIC_LVTTHMR)] = (LVT_MASK | APIC_DM_MASK),
>>>    ..
>>>
>>> Just fast look at above code gives all info without need to parse all
>>> these recursive macro.
>>
>> And with no guarantee at all that the order of entries remains in sync
>> between all (two now, three later) uses.
> 
> The order in lvt_x_masks[] arrays are guaranteed by "[x] = y,".

Hmm, yes, sorry - not sure what I was thinking. What then remains is a
readability concern towards the longish lines you propose. I'll have to
think about it some more.

> Comparing or syncing lvt_reg[] array with with lvt_x_masks[]
> would not be exactly correct as they are used in a different way and
> have different sizes (after patch 3).
> 
> if somebody decide to add AMD Extended LVTs which have offsets 500-530h
> then lvt_x_masks[] will grow even more and will contain more unused wholes.

Yes, but (a) what do you do (of course a solution can be found, but
likely at the expense of adding yet another layer of indirection) and
(b) there are other (harder?) problems to be sorted for supporting
them.

>>>>    #define vlapic_lvtt_period(vlapic)                              \
>>>>        ((vlapic_get_reg(vlapic, APIC_LVTT) & APIC_TIMER_MODE_MASK) \
>>>>         == APIC_TIMER_MODE_PERIODIC)
>>>> @@ -827,16 +837,16 @@ void vlapic_reg_write(struct vcpu *v, un
>>>>               if ( !(val & APIC_SPIV_APIC_ENABLED) )
>>>>            {
>>>> -            int i;
>>>> +            unsigned int i,
>>>
>>> uint32_t?
>>>
>>>> +                nr = GET_APIC_MAXLVT(vlapic_get_reg(vlapic, APIC_LVR)) + 1;
>>>
>>> This deserves wrapper (may be static inline)
>>> Defining multiple vars on the same line makes code less readable as for me.
>>
>> I don't see multiple variables being defined on this line.
> 
>     unsigned int i;
>     unsigned int nr = GET_APIC_MAXLVT(vlapic_get_reg(vlapic, APIC_LVR)) + 1;

Hmm, I see now what you mean, but then my take is that your variant is
less readable (and too long a line afaict; once properly line-wrapped
it'll become more similar to what I had, I think).

Jan

