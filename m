Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1405E2CA020
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 11:42:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41819.75289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk36j-0004Bb-E3; Tue, 01 Dec 2020 10:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41819.75289; Tue, 01 Dec 2020 10:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk36j-0004BC-AF; Tue, 01 Dec 2020 10:42:05 +0000
Received: by outflank-mailman (input) for mailman id 41819;
 Tue, 01 Dec 2020 10:42:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lvrb=FF=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kk36i-0004B7-6z
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 10:42:04 +0000
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fe7f5c9-0acc-4984-80e9-7d825828368a;
 Tue, 01 Dec 2020 10:42:03 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g14so1851471wrm.13
 for <xen-devel@lists.xenproject.org>; Tue, 01 Dec 2020 02:42:03 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k16sm2390397wrl.65.2020.12.01.02.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 02:42:02 -0800 (PST)
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
X-Inumbo-ID: 6fe7f5c9-0acc-4984-80e9-7d825828368a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=iYDXREdUAV/LJlcuptjzgZ8tcA4UyMaQyotxPegfS5k=;
        b=Th00CvFdx0Yl+1TbSox9O7R9OJnEXQO7n+oc68HeCU4mruNkTn/vhqBgh8BNiWY7sY
         yuKDcVEATZhBBjqYfKsgIXV8yFTy3t88Po9tLMPG4mQz5r6P+P7xYuBiOlui583rwrKt
         5LX1UTFqFOYJAt0XgrAfZPPBw8WLATVEvStzpTdQiUqAHUVt/r/CZZOVDdEjWscA/+MV
         cy5TFfXlXr/D4ET6CAUXTEzlzr9OFYKQFTAkFxrfxdu9r4xXTFZZVhhhpHPVx0hzSJSW
         gN5MyhVdkJW7UIWiF1fFmCBEhCr3OKyZQ1icGiA7CjUMhrRBEW/t8gCWOqCLftVzmnSy
         TZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=iYDXREdUAV/LJlcuptjzgZ8tcA4UyMaQyotxPegfS5k=;
        b=dgr/EyA+jS96Z7xSV0mq8Psih5f8YM8iiB3eDnLFI2hqGX5j7x5PRiQG1NlISQWToU
         di1xz1SbU9FOOPCjHJ8YOH+qZAo0FDSHPDtDhbzaCvLPE0vB5+r276oxsyxaisUNr6es
         WHTOjvv75lHgb9xAvWSCrwxW8We30wmSpvLJupsIaNB2vxDsU04K6IxO0BHgdTiRFqVl
         owhHxyRbmSbXghb4lJtPEq6wZeob6iFls7jzEpUkSafWX7ZgP0lPXB3CIlI9bVNadhM6
         7b6ZOLIWkhkvTyQwiVdzKoXE8SsyRuDD6kN+7uKfaLdwdc6pofaS61vtpINZ8V4dZg39
         7+Ig==
X-Gm-Message-State: AOAM530eemAJUoM0pqsEpmLZ1CPMJKcZeuDkf4902raGd9l69MjOllgW
	3ZPwg40XyV0u9cqC/VMGiDU=
X-Google-Smtp-Source: ABdhPJxEuo7SvEhaaLaHEsEFRfcVfd5HWV2auBfgupVEr89QKyJ+wHSJr9dcZQ+l1V6UyC85klQ2NA==
X-Received: by 2002:adf:a191:: with SMTP id u17mr3004296wru.421.1606819322470;
        Tue, 01 Dec 2020 02:42:02 -0800 (PST)
Subject: Re: [PATCH V3 19/23] xen/arm: io: Abstract sign-extension
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-20-git-send-email-olekstysh@gmail.com>
 <878sai7e1a.fsf@epam.com> <cad0d7fe-3a9f-3992-9d89-8e9bb438dfbe@gmail.com>
 <93284ea1-e658-ffff-3223-174d633e38ad@suse.com>
 <d7b8f43d-2a59-6316-5609-0595b2a86045@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <932d7826-7e48-aaee-d566-44c384f84e1c@gmail.com>
Date: Tue, 1 Dec 2020 12:42:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d7b8f43d-2a59-6316-5609-0595b2a86045@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 01.12.20 12:30, Julien Grall wrote:

Hi Julien

> Hi Jan,
>
> On 01/12/2020 07:55, Jan Beulich wrote:
>> On 01.12.2020 00:27, Oleksandr wrote:
>>> On 30.11.20 23:03, Volodymyr Babchuk wrote:
>>>> Oleksandr Tyshchenko writes:
>>>>> --- a/xen/include/asm-arm/traps.h
>>>>> +++ b/xen/include/asm-arm/traps.h
>>>>> @@ -83,6 +83,30 @@ static inline bool VABORT_GEN_BY_GUEST(const 
>>>>> struct cpu_user_regs *regs)
>>>>>            (unsigned long)abort_guest_exit_end == regs->pc;
>>>>>    }
>>>>>    +/* Check whether the sign extension is required and perform it */
>>>>> +static inline register_t sign_extend(const struct hsr_dabt dabt, 
>>>>> register_t r)
>>>>> +{
>>>>> +    uint8_t size = (1 << dabt.size) * 8;
>>>>> +
>>>>> +    /*
>>>>> +     * Sign extend if required.
>>>>> +     * Note that we expect the read handler to have zeroed the bits
>>>>> +     * outside the requested access size.
>>>>> +     */
>>>>> +    if ( dabt.sign && (r & (1UL << (size - 1))) )
>>>>> +    {
>>>>> +        /*
>>>>> +         * We are relying on register_t using the same as
>>>>> +         * an unsigned long in order to keep the 32-bit assembly
>>>>> +         * code smaller.
>>>>> +         */
>>>>> +        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
>>>>> +        r |= (~0UL) << size;
>>>> If `size` is 64, you will get undefined behavior there.
>>> I think, we don't need to worry about undefined behavior here. Having
>>> size=64 would be possible with doubleword (dabt.size=3). But if "r"
>>> adjustment gets called (I mean Syndrome Sign Extend bit is set) then
>>> we deal with byte, halfword or word operations (dabt.size<3). Or I
>>> missed something?
>>
>> At which point please put in a respective ASSERT(), possibly amended
>> by a brief comment.
>
> ASSERT()s are only meant to catch programatic error. However, in this 
> case, the bigger risk is an hardware bug such as advertising a sign 
> extension for either 64-bit (or 32-bit) on Arm64 (resp. Arm32).
>
> Actually the Armv8 spec is a bit more blurry when running in AArch32 
> state because they suggest that the sign extension can be set even for 
> 32-bit access. I think this is a spelling mistake, but it is probably 
> better to be cautious here.
>
> Therefore, I would recommend to rework the code so it is only called 
> when len < sizeof(register_t).

I am not sure I understand the recommendation, could you please clarify 
(also I don't see 'len' being used here).


-- 
Regards,

Oleksandr Tyshchenko


