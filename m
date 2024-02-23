Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA4D86102B
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 12:14:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684798.1064925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdTV6-0006YA-BQ; Fri, 23 Feb 2024 11:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684798.1064925; Fri, 23 Feb 2024 11:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdTV6-0006W3-88; Fri, 23 Feb 2024 11:13:56 +0000
Received: by outflank-mailman (input) for mailman id 684798;
 Fri, 23 Feb 2024 11:13:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0yaO=KA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rdTV4-0006Ve-Ru
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 11:13:54 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a04e007e-d23c-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 12:13:52 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-512bde3d197so170186e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 03:13:52 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e11-20020a05620a12cb00b00787b6750619sm304075qkl.130.2024.02.23.03.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 03:13:51 -0800 (PST)
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
X-Inumbo-ID: a04e007e-d23c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708686832; x=1709291632; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KGKWwxph69B4iBv+6rJEvJhMpAG8cYrWDwfcQGnn0OM=;
        b=qCDzR65ldPq41oBbxJS9cEjVqbZM6fRLqjkJI4Z8LwnGbu/2l4FqWFp0wKRyFa8CWh
         xD89cM0mpyQX0Xkq6+k8pZHOXgbI7JgRpLwgIqwHHXxBz6nY1/BoFxKzpPRrJoS/a6RY
         0GKm2jLCf/pREKtK2KkSM+r14y9dP5mZLPvvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708686832; x=1709291632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KGKWwxph69B4iBv+6rJEvJhMpAG8cYrWDwfcQGnn0OM=;
        b=phft936HYVk7iUUUsn0BSEC6Tw+6K9eHUKkjxTOG7xlLaNY7BE4E3R6ffEMFhYdTv0
         4c8EYjcVUGHoOSjxZMLezWY6fa7e8a+KjdHHw2qYCfxPI422zPe+Mn+atNdHrHbwMo14
         b6LfNmngMjSjEWZlLJJJ+TIAnjtp0LhsFf8UQ8CYx8ev7gcmdi0AdAECTcx37orioH5g
         kGABJ68IrwaZfDHpCSElpBMvds26lLuv6GsLyXSr+o5lKklkZcOouO187NHNG0jTswQ4
         GPmlD9LpvNbKujKiFZRlmxzGypl3McTvmlza0WzZwFrqznmlwlPfQ1weC8nNF4r2ds6B
         7HPg==
X-Gm-Message-State: AOJu0YzmE2Zkkc13OcTwxyXDgMZaVFPrBKfuQctaH4zr1bIumjeG02JJ
	Iep+XPAUvASBZhtvUbih1PHIpPz16Srh0tni8/xw4qT2FvLqbF9lcrQ4U5bScSk=
X-Google-Smtp-Source: AGHT+IE/5cZk5AWk5a7xzqUN850yzLQTtt1/weVUf1dWbhJkHnGCWF9EoUAzPJ3NJRrF2UVAiN8CUg==
X-Received: by 2002:a05:6512:3b89:b0:512:e506:1c6c with SMTP id g9-20020a0565123b8900b00512e5061c6cmr1459678lfv.34.1708686832039;
        Fri, 23 Feb 2024 03:13:52 -0800 (PST)
Message-ID: <6bd41e23-e7c9-4cfc-8227-b508b0d4ed13@citrix.com>
Date: Fri, 23 Feb 2024 11:13:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/spec: fix BRANCH_HARDEN option to only be set when
 build-enabled
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20240223094215.71889-1-roger.pau@citrix.com>
 <b5696664-0e85-414b-8360-242349a87a7e@citrix.com> <Zdhwve9-YQekWb0B@macbook>
 <cf60c604-5a4a-46be-badf-1f55a760e421@citrix.com> <Zdh9b4vNHfJnFXPR@macbook>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zdh9b4vNHfJnFXPR@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/02/2024 11:11 am, Roger Pau Monné wrote:
> On Fri, Feb 23, 2024 at 10:26:15AM +0000, Andrew Cooper wrote:
>> On 23/02/2024 10:17 am, Roger Pau Monné wrote:
>>> On Fri, Feb 23, 2024 at 09:46:27AM +0000, Andrew Cooper wrote:
>>>> On 23/02/2024 9:42 am, Roger Pau Monne wrote:
>>>>> The current logic to handle the BRANCH_HARDEN option will report it as enabled
>>>>> even when build-time disabled. Fix this by only allowing the option to be set
>>>>> when support for it is built into Xen.
>>>>>
>>>>> Fixes: 2d6f36daa086 ('x86/nospec: Introduce CONFIG_SPECULATIVE_HARDEN_BRANCH')
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>> ---
>>>>>  xen/arch/x86/spec_ctrl.c | 6 ++++--
>>>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
>>>>> index 421fe3f640df..e634c6b559b4 100644
>>>>> --- a/xen/arch/x86/spec_ctrl.c
>>>>> +++ b/xen/arch/x86/spec_ctrl.c
>>>>> @@ -50,7 +50,8 @@ static int8_t __initdata opt_psfd = -1;
>>>>>  int8_t __ro_after_init opt_ibpb_ctxt_switch = -1;
>>>>>  int8_t __read_mostly opt_eager_fpu = -1;
>>>>>  int8_t __read_mostly opt_l1d_flush = -1;
>>>>> -static bool __initdata opt_branch_harden = true;
>>>>> +static bool __initdata opt_branch_harden =
>>>>> +    IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH);
>>>>>  
>>>>>  bool __initdata bsp_delay_spec_ctrl;
>>>>>  uint8_t __read_mostly default_xen_spec_ctrl;
>>>>> @@ -267,7 +268,8 @@ static int __init cf_check parse_spec_ctrl(const char *s)
>>>>>              opt_eager_fpu = val;
>>>>>          else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
>>>>>              opt_l1d_flush = val;
>>>>> -        else if ( (val = parse_boolean("branch-harden", s, ss)) >= 0 )
>>>>> +        else if ( IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH) &&
>>>>> +                  (val = parse_boolean("branch-harden", s, ss)) >= 0 )
>>>>>              opt_branch_harden = val;
>>>> Yeah, we should definitely fix this, but could we use no_config_param()
>>>> here for the compiled-out case ?
>>>>
>>>> See cet= for an example.  If we're going to ignore what the user asks,
>>>> we should tell them why.
>>> Maybe I'm missing something: I've looked into using no_config_param(),
>>> but there's no difference really, because cmdline_parse() is called
>>> before the console is initialized, so those messages seem to be
>>> lost.
>> Look at `xl dmesg` rather than the console.  They also do appear on vga
>> in some configurations.
> Oh, my internal buffer was too small on those also got truncated, had
> to bump it.

Yeah - the default buffer size in Xen is too small.  It has been for
more than a decade, which is how long the adjustment in XenServer has
been around.

>
>> There's a separate todo to get these out in a slightly nicer way, but
>> they at least exist in logs.
> I've created:
>
> https://gitlab.com/xen-project/xen/-/issues/184

Thanks.

~Andrew

