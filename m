Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16428AC0D38
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 15:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994006.1377041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6IU-0000wi-IM; Thu, 22 May 2025 13:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994006.1377041; Thu, 22 May 2025 13:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6IU-0000u6-E7; Thu, 22 May 2025 13:49:22 +0000
Received: by outflank-mailman (input) for mailman id 994006;
 Thu, 22 May 2025 13:49:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckVG=YG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uI6IS-0000u0-N7
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 13:49:20 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f1a3c72-3713-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 15:49:19 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ad5a11c2942so499392466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 06:49:19 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4909e1sm1070910166b.125.2025.05.22.06.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 06:49:18 -0700 (PDT)
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
X-Inumbo-ID: 8f1a3c72-3713-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747921759; x=1748526559; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sx+KRYDTbT4B3nMPYW7GWFPVoLXsATxjAtZIdY4HVh8=;
        b=n3Xg/H/C9+09K/Wz8wehAEfeI/tauu+ZfELGEP9h4hJqIAPqTBmhWInQ9iKezON7L6
         3gaI1VuO7Dl8is3SeapVqIXFc4O0aoCJ6DgnyLK2ATjY/WQ62yCVPyvrIXSSp88cUqcm
         9wrdKobf42ZIulDWaC33CnsqR+sWVchEOrCKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747921759; x=1748526559;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sx+KRYDTbT4B3nMPYW7GWFPVoLXsATxjAtZIdY4HVh8=;
        b=MhEHA50plYwvszTNgMqDEp7dmVq0kAk+5evWxp5Gjoat1zx2L2np1tiBr92ZMixZNq
         mw0eSMUyYBL5m56AxamThrhQZP4eyyd60PzqeMZlv6fXD09gTDPrWZY6qMJ7ZZtddUxu
         /hoQnCAxHwBoULmkUbvC/gU8YHAuBktjdQkYR8oEGhiguUju44FyHjKNfCqP+rSMDwCj
         8RbyHmTxqKtzA65ne3b8UovclLAZBqx/dhdWMASDefQdHC0JOTCpUKNXNgPIr7T6nr9K
         J0sEtlNQRrvI+g1dsycFZgCfyTAQ+fu7VUIC+rqHJLMzoAGZBu0KbYDQDlX1M4ThrKTB
         65Fw==
X-Gm-Message-State: AOJu0Yy3mkqKN6ZtylErr70vxovFc3qMPRZNUatF1m4IyQ1NOFds8Mze
	E9jdJmLZgxq4fzkeIApCVUFy5rH7BRpwkUusfS3bj+IBTP5GaPbNt8Lq7S2AS+yo8/o=
X-Gm-Gg: ASbGncuu6I2hS/tlFBDiNnAU4BbyiPGeOanxJgJ+JCXSq9HKjfACE094BpkRBY0n6Ht
	ngZLB9WGnl7n5GzHEPTzwneJ/HNj/tdOj6ZFXhCqFpW11XU0AokHeqvlRrf5tyX7jRE4GS2gcvj
	b5oowooOX4LKGF1HCR5fMLqBEQSkaIkHqkBt1HlZ0HSkmtS1GFNYHEBUK8FceIvMpUW8kMGpLrP
	tr0NSM5eDIA0vN+w86OdS6pQRh9/DV4dJv0FjOdfjwpAXdHBnp9REXk2OAKlXdVK+FSGjRyh0gS
	xgAaeC5nP8ADde545E0WMNnFRqDa1ftC7oq1AVM8Anm/4WqdvVVGopvru9DDARV/opZ2lq1xDX1
	BhQMAP/USE/1xgdLk2tNpi8dBu2c=
X-Google-Smtp-Source: AGHT+IGamR/mwYWGakxFKoH/whk9DRF2mx2ZZvJF6DwpwquDxCkWl4+GhlCILc/2o1OYheiWa3Kz0g==
X-Received: by 2002:a17:907:1b1b:b0:ad2:40a1:7894 with SMTP id a640c23a62f3a-ad536f9db58mr2124747766b.41.1747921758820;
        Thu, 22 May 2025 06:49:18 -0700 (PDT)
Message-ID: <49f092f9-c0fb-4b66-af20-368c736dde91@citrix.com>
Date: Thu, 22 May 2025 14:49:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Eclair false positive] Re: [PATCH] x86/msr: Rework wrmsr_safe()
 using asm goto()
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250521143658.312514-1-andrew.cooper3@citrix.com>
 <8504aab1-c48a-4981-a502-93a2fd18880b@citrix.com>
 <e25858b4fedaa40d8934e5fe6bc40c01@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e25858b4fedaa40d8934e5fe6bc40c01@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/05/2025 1:45 pm, Nicola Vetrini wrote:
> On 2025-05-21 20:00, Andrew Cooper wrote:
>> On 21/05/2025 3:36 pm, Andrew Cooper wrote:
>>> diff --git a/xen/arch/x86/include/asm/msr.h
>>> b/xen/arch/x86/include/asm/msr.h
>>> index 0d3b1d637488..4c4f18b3a54d 100644
>>> --- a/xen/arch/x86/include/asm/msr.h
>>> +++ b/xen/arch/x86/include/asm/msr.h
>>> @@ -69,20 +69,20 @@ static inline void wrmsr_ns(uint32_t msr,
>>> uint32_t lo, uint32_t hi)
>>>  /* wrmsr with exception handling */
>>>  static inline int wrmsr_safe(unsigned int msr, uint64_t val)
>>>  {
>>> -    int rc;
>>> -    uint32_t lo, hi;
>>> -    lo = (uint32_t)val;
>>> -    hi = (uint32_t)(val >> 32);
>>> -
>>> -    __asm__ __volatile__(
>>> -        "1: wrmsr\n2:\n"
>>> -        ".section .fixup,\"ax\"\n"
>>> -        "3: movl %5,%0\n; jmp 2b\n"
>>> -        ".previous\n"
>>> -        _ASM_EXTABLE(1b, 3b)
>>> -        : "=&r" (rc)
>>> -        : "c" (msr), "a" (lo), "d" (hi), "0" (0), "i" (-EFAULT));
>>> -    return rc;
>>> +    uint32_t lo = val, hi = val >> 32;
>>> +
>>> +    asm_inline goto (
>>> +        "1: wrmsr\n\t"
>>> +        _ASM_EXTABLE(1b, %l[fault])
>>> +        :
>>> +        : "a" (lo), "c" (msr), "d" (hi)
>>> +        :
>>> +        : fault );
>>> +
>>> +    return 0;
>>> +
>>> + fault:
>>> +    return -EFAULT;
>>>  }
>>
>> It turns out this is the first piece of Eclair-scanned code using asm
>> goto.
>>
>> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/10108558677
>> (The run also contained an equivalent change to xsetbv())
>>
>> We're getting R1.1 and R2.6 violations.
>>
>> R1.1 complains about [STD.adrslabl] "label address" not being valid C99.
>>
>> R2.6 complains about unused labels.
>>
>> I expect this means that Eclair doesn't know how to interpret asm goto()
>> yet.  The labels listed are reachable from inside the asm block.
>>
>
> That has been fixed upstream. I'll reach out to you when that fix
> trickles down to the runners, so that you're able to test and push
> that change.

Oh, fantastic thanks.

I'll hold off pushing until then.

~Andrew

