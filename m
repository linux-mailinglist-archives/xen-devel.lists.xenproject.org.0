Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE3E6A5B85
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 16:18:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503474.775751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX1jg-0002RH-Br; Tue, 28 Feb 2023 15:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503474.775751; Tue, 28 Feb 2023 15:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX1jg-0002O7-8L; Tue, 28 Feb 2023 15:17:48 +0000
Received: by outflank-mailman (input) for mailman id 503474;
 Tue, 28 Feb 2023 15:17:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4VB9=6Y=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pX1jf-0002O1-M4
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 15:17:47 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e2fd3be-b77b-11ed-9695-2f268f93b82a;
 Tue, 28 Feb 2023 16:17:46 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id h16so41419203edz.10
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 07:17:46 -0800 (PST)
Received: from [192.168.1.93] (adsl-6.109.242.139.tellas.gr. [109.242.139.6])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170906328d00b008def483cf79sm4516026ejw.168.2023.02.28.07.17.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 07:17:45 -0800 (PST)
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
X-Inumbo-ID: 0e2fd3be-b77b-11ed-9695-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gl/5X5VFlbYIWjZeUbXJ6WkNiv6V1nLY6UVlFnKIcrc=;
        b=Q1CmWmRYrNKLCt662iblWnR6DP/B5faxn56clA/NLlohfNRlbKnssl3uG5kSEOj7FZ
         LUOewKWggW4omFIy/9raz336BdTxsgdlu3g3Is2cLdcUNdCMgv/DUGdk6a4IbjPgu/8R
         4dCvc6LklHUzLftnfCQ+pC9yPeqaYpz5ZzqdONeGtpoWzpSNBAGfOdsYjL/MX83NNDcO
         R7gsXXhrCgbkgi0CXag416zt9XKXZ/G0YTgRbbMOgARPcK6K+v3bhMO+uf1FYdaUWPK6
         dxhsglvoe6UhvuRETqag5W1/taLxebkVN005qian8X44etKlxzSqmmwLLy4+sWeWW0QI
         XGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gl/5X5VFlbYIWjZeUbXJ6WkNiv6V1nLY6UVlFnKIcrc=;
        b=DudUXEC6mGx3Gno48oST27kh4lDaH33uzRH17CVH9MNBJ9OP8S/PZ8y9frrQHOZW1S
         UfAZec/Y83jmsCTCno+kPoT0irFAlbKM/FllqnHGFxDUthSrqGMOxf9UgoQSCDut0F7e
         ikWrYZLPiF4cjJiNsZ+Ad0m5Fp4DgS9DGrlvzD6+IjqTVIMD2vwgbU5lKUyBYCuTmd/+
         MCYOHHpzXChRPB0dS/z8L59q/rR4FLyUHi0tJVwllGjkEjYKVXj2qpLcby+XOpGHQ4JG
         /nQhjINwmuEF0vJdXsF9uVEEOybCIq1XWQAAhYzqfujUmnri7DsgUpOHfCmvleuCpAFH
         yXXQ==
X-Gm-Message-State: AO0yUKW1AopFTQHFCf5K77APCY6g7Dw5GcmfApyTFMYtOKSKMecyKP2f
	RNNokwVFSSLcswHKZWU9ySM=
X-Google-Smtp-Source: AK7set+L0rKxtfOdMb2E2jsMIYUnh3bgBE4P6e+3JgdPsGU9bRu1xmrknUSJpkLGXg9nTAgiqgQ86A==
X-Received: by 2002:a17:906:1e4a:b0:88d:f759:15ae with SMTP id i10-20020a1709061e4a00b0088df75915aemr3370308ejj.42.1677597465956;
        Tue, 28 Feb 2023 07:17:45 -0800 (PST)
Message-ID: <afc00a90-753c-18c1-65ed-8b8635874b2a@gmail.com>
Date: Tue, 28 Feb 2023 17:17:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/4] x86/svm: split svm_intercept_msr() into
 svm_{set,clear}_msr_intercept()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230227075652.3782973-1-burzalodowa@gmail.com>
 <20230227075652.3782973-3-burzalodowa@gmail.com>
 <bf77733a-d0cc-8e31-5a05-f0709e7ef1fb@suse.com>
 <b13c5685-7d52-e0e0-95ad-7d766790d057@gmail.com>
 <dea4bf56-6b8a-7cdc-fa98-a9624f4fc67d@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <dea4bf56-6b8a-7cdc-fa98-a9624f4fc67d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/28/23 17:10, Jan Beulich wrote:
> On 28.02.2023 16:05, Xenia Ragiadakou wrote:
>> On 2/28/23 16:20, Jan Beulich wrote:
>>> On 27.02.2023 08:56, Xenia Ragiadakou wrote:
>>>> This change aims to render the control interface of MSR intercepts identical
>>>> between SVM and VMX code, so that the control of the MSR intercept in common
>>>> code can be done through an hvm_funcs callback.
>>>>
>>>> Create two new functions:
>>>> - svm_set_msr_intercept(), enables interception of read/write accesses to the
>>>>     corresponding MSR, by setting the corresponding read/write bits in the MSRPM
>>>>     based on the flags
>>>> - svm_clear_msr_intercept(), disables interception of read/write accesses to
>>>>     the corresponding MSR, by clearing the corresponding read/write bits in the
>>>>     MSRPM based on the flags
>>>
>>> In how far is VMX'es present model better than SVM's? They both have pros and
>>> cons, depending on the specific use. I'm not asking to do it the other way
>>> around (at least not yet), I'd merely like to understand why we're going to
>>> gain two new hooks (if I'm not mistaken) when we could also get away with
>>> just one.
>>
>> SVM approach always touches both read/write bits (either by setting or
>> clearing them). I thought that using the SVM approach on VMX could be
>> considered a functional change (because there are parts where VMX
>> assumes that a bit is already set or cleared and does not touch it).
> 
> As per my comment on the last patch a question is whether both actually
> need to become uniform. But if they do, then the new model should imo
> be followed right away, and that VMX'es simply leaving bits alone when
> already in known state.

But the SVM implementation does not assume. I can do it and remove the 
no functional change part.

> 
>>>> --- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
>>>> +++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
>>>> @@ -585,13 +585,12 @@ void svm_destroy_vmcb(struct vcpu *v);
>>>>    
>>>>    void setup_vmcb_dump(void);
>>>>    
>>>> -#define MSR_INTERCEPT_NONE    0
>>>> -#define MSR_INTERCEPT_READ    1
>>>> -#define MSR_INTERCEPT_WRITE   2
>>>> -#define MSR_INTERCEPT_RW      (MSR_INTERCEPT_WRITE | MSR_INTERCEPT_READ)
>>>> -void svm_intercept_msr(struct vcpu *v, uint32_t msr, int enable);
>>>> -#define svm_disable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_NONE)
>>>> -#define svm_enable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_RW)
>>>> +void svm_set_msr_intercept(struct vcpu *v, uint32_t msr, int flags);
>>>> +void svm_clear_msr_intercept(struct vcpu *v, uint32_t msr, int flags);
>>>> +#define svm_disable_intercept_for_msr(v, msr) \
>>>> +    svm_clear_msr_intercept((v), (msr), MSR_RW)
>>>> +#define svm_enable_intercept_for_msr(v, msr) \
>>>> +    svm_set_intercept_msr((v), (msr), MSR_RW)
>>>
>>> Please avoid excess parentheses. Also could you clarify why you retain
>>> these shorthands when you don't use them in the conversion that you're
>>> doing (e.g. ())? Are you intending them to go
>>> away down the road?
>>
>> Ok.
>> I did not understand the question. Which shorthands?
> 
> svm_disable_intercept_for_msr() and svm_enable_intercept_for_msr().

Are you suggesting to replace svm_{en,dis}able_intercept_for_msr() with 
svm_{ser,clear}_msr_intercept()?  svm_disable_intercept_for_msr() is 
used in svm.c and vmcb.c.

-- 
Xenia

