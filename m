Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A17D1A677
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 17:51:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202188.1517812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfhbd-0003ZA-JQ; Tue, 13 Jan 2026 16:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202188.1517812; Tue, 13 Jan 2026 16:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfhbd-0003X0-Gb; Tue, 13 Jan 2026 16:50:57 +0000
Received: by outflank-mailman (input) for mailman id 1202188;
 Tue, 13 Jan 2026 16:50:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i8AK=7S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfhbc-0003Wu-6r
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 16:50:56 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0622f84b-f0a0-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 17:50:53 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-64c893f3a94so13583a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 08:50:53 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8701e1d467sm892936566b.70.2026.01.13.08.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 08:50:52 -0800 (PST)
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
X-Inumbo-ID: 0622f84b-f0a0-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768323053; x=1768927853; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=weAGDGv5+VXSGDykJWyb+EGUtDTcouQ244mvV/7VgWM=;
        b=fNRR4Yy8cbWApkJKoUas171I1nhIKeXsmjpctN9PlYusWMTPHZQjlRPB2Rjb7fwoMg
         rCno3Dka0qb8o9PdsLwE6/EdGSJGGvqeYrvvzmOuYJgqVU1/w3NiX19cdJN/Q+L0Oj5L
         HAEuaGQB9Ti9sQnJ23DVbk2iqOej8dhQWIqHd7Rg2oQbh0oKVH9S3BZN0tP6JXMO4y5W
         EIiyRUAzH8lUMJYtJQgt1cwzu/baktS4UnguushVw4G07EtCdS4ky56mk4LzR0ZARQFN
         l7TAOAlUGVW2A1oN1zD9Iaf53anij9c3iqxHN3oA93+j71a59aaFWs06wYilhVlbtTIz
         +N9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323053; x=1768927853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weAGDGv5+VXSGDykJWyb+EGUtDTcouQ244mvV/7VgWM=;
        b=h4KisTweLg9CwgjDmsDN9vL3Gw7YF4BYaNDoFXNFoS8nF4KOg9WPVIcp/Pms+HHbFg
         3BlmFomSQxcuvDI9lTInlESFkTOwdY7j9CLRkPvvEBtT4b0zGHmbIlpM17Xn8ktTB4b3
         sbc0ku8Yudd3VqFeWMOZQWSqbjHwD7X868cc0Monns5ew3oFUfIOvNTBsF9DmT0FF8KS
         IT9B5kpXAlGgH8nOJcSx4NIB8ZyJH79ZDAEBEaf1m1m9sLvY9wJxjrV3kx/WMTUKcDzo
         /Z3WN7dGDo7Ubs1fn9YgpyL863ZWYlMOfh3XPqrRtmDMaeZGK806jLFX3PxzuXrJPwwP
         AwaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5acElqS6S1bb7rmTPsyk4gvcQVZdbs+Yz9AqxjLesA0YMPwREAHGD3DYOP4BLzO/Oyrj6DNX8Hf4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyj4pFFdEi24aEwyvJwA9g3BwFmjGpAavm8f/Vf9NcmwSxUA8Gx
	VR+tDMYlNQvrnm2Whq/NzJ4cV0pRuCvZMVN5lEZu5WHgqtJ8/GawsDKK
X-Gm-Gg: AY/fxX5X1nGUkGYuOtEFsjn5QLtZxOopd1M5yyI0jpm//OzmYXlwVzzwrBG0UNF1m6C
	vuWaFMGs/r1PWvZPSBZy2VS1Tuat6WP4G+H2KfyVpUQHF54xoXm+3deW9v386Ot8xsqbU91sXvo
	oqjgnFVzMU0tWxFgUaP0RoGoh9AIThZjn2qKiEJbWk4YCuEn7aB8afn60yEaOVbgGIyfu3CBPTC
	+uVxO6QUS5AwT4YFI121A/SgoBwRbd8aFqHhfFGoTiXGNCaI227GuUcrIvw6sIY8UH7a8NZVBhu
	U0tdb+BCj7eP1rvoH5/V25+G1Z4j76k1bC40sNHFbC1KEr9BM0hW2oKM1THy9+rn+R/aaTMYWDh
	oC7vPicWs22ub22ksGwKDYovGPs8ZY4Mq8jRuVMMoInvBzA3aYzxr6FkBfFP+gfJwW9mYgyThH0
	ZophHLBpCRmRrlmXdZ8bQ9fwJjWDE/kNXghETD1b3mbISOwkPHtF83+f06wFAODOY=
X-Google-Smtp-Source: AGHT+IFbwkgx3lCWSWgMDEd5BdC/lpD0EA5nwVaggRQs/Vprry7RjOtdoFiWhbFNHAj+dXnQ0qbmkg==
X-Received: by 2002:a17:907:3f24:b0:b87:191f:4fab with SMTP id a640c23a62f3a-b873598d8d2mr324205766b.26.1768323052965;
        Tue, 13 Jan 2026 08:50:52 -0800 (PST)
Message-ID: <90e7fc60-09cc-4b61-ab0a-80037f8ecaf8@gmail.com>
Date: Tue, 13 Jan 2026 17:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/15] xen/riscv: implement reprogram_timer() using SBI
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <43249171def325c49541ebdac141fe99d159b60f.1766595589.git.oleksii.kurochko@gmail.com>
 <f14c8b3d-66ce-4ea7-bf50-591a4a48345a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f14c8b3d-66ce-4ea7-bf50-591a4a48345a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/12/26 4:24 PM, Jan Beulich wrote:
> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>> @@ -39,6 +43,33 @@ static void __init preinit_dt_xen_time(void)
>>       cpu_khz = rate / 1000;
>>   }
>>   
>> +int reprogram_timer(s_time_t timeout)
>> +{
>> +    uint64_t deadline, now;
>> +    int rc;
>> +
>> +    if ( timeout == 0 )
>> +    {
>> +        /* Disable timers */
>> +        csr_clear(CSR_SIE, BIT(IRQ_S_TIMER, UL));
>> +
>> +        return 1;
>> +    }
>> +
>> +    deadline = ns_to_ticks(timeout) + boot_clock_cycles;
>> +    now = get_cycles();
>> +    if ( deadline <= now )
>> +        return 0;
>> +
>> +    /* Enable timer */
>> +    csr_set(CSR_SIE, BIT(IRQ_S_TIMER, UL));
> Still learning RISC-V, so question for my understanding: Even if the timeout
> is short enough to expire before the one SIE bit will be set, the interrupt
> will still occur (effectively immediately)? (Else the bit may need setting
> first.)

The interrupt will become pending first (when mtime >= mtimecmp or
mtime >= CSR_STIMECMP in case of SSTC) and then fire immediately once
|SIE.STIE |(and global|SIE|) are enabled.

>
>> +    if ( (rc = sbi_set_timer(deadline)) )
>> +        panic("%s: timer wasn't set because: %d\n", __func__, rc);
> Hmm, if this function ends up being used from any guest accessible path (e.g.
> a hypercall), such panic()-ing better shouldn't be there.

I don't have such use cases now and I don't expect that guest should use
this function.

>
>> +    return 1;
>> +}
> Finally, before we get yet another instance of this de-fact boolean function:
> Wouldn't we better globally switch it to be properly "bool" first?

We could do that, I will prepare a separate patch in the next version of
this patch series.

Thanks.

~ Oleksii


