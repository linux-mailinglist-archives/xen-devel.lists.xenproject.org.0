Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E184C805855
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:15:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648014.1011894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAX8Y-0001Jq-TG; Tue, 05 Dec 2023 15:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648014.1011894; Tue, 05 Dec 2023 15:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAX8Y-0001GW-Ou; Tue, 05 Dec 2023 15:15:02 +0000
Received: by outflank-mailman (input) for mailman id 648014;
 Tue, 05 Dec 2023 15:15:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAX8X-0001GQ-3e
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:15:01 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0df0b3a6-9381-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 16:14:59 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-332fd78fa9dso4654988f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:14:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q18-20020adf9dd2000000b00333357a77c4sm10463936wre.34.2023.12.05.07.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 07:14:58 -0800 (PST)
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
X-Inumbo-ID: 0df0b3a6-9381-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701789298; x=1702394098; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0SjG8eJ/JAdY43wB+nU+rycxpGV9ftdDE3uTO2Efwqk=;
        b=BvhWIS2gDb0esAPbk0CK5q913QHhbrPKH2DpsJivgBzEwuVhbCJimiE9i3EGwW6sCU
         W0VaQZTLo0FtzEJf/X3DA50CrKvfKblb+L1ioCw6I7xMaizcLqr1lIi8RPgFEOB4/oF3
         3klooU6m0+6H9fd0LjjjDJMdXpK3MIjHV79t3M4MwEhu0ludYz1HBNan0iaWhQLnBCLG
         3oTOVBLJTWZgnQZp3BCu5xvxkyrMkHF320EySeXdiUUESZGar5q5quLUkRCW+3ehHajE
         T+gO0czoNn5On5gybCFvZ1Q+JiB2pPhrLuxoG+7qAUXeXEeJSaJoytT6wFMhtQWGkgDv
         Ln+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701789298; x=1702394098;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0SjG8eJ/JAdY43wB+nU+rycxpGV9ftdDE3uTO2Efwqk=;
        b=nSgLMMlmcV/V9NJmHLBB1astzGA3SYlBanIEBH+vPTF7v7lKGjDboy1Tao8SoZypCR
         01R5IEguOx4Zwo/JQrgpSC2ZaPcVj//doNgDDjZ7JngIpIf3K967MfaeVUC89wI/PpvN
         hdR9y5TfmI6bG0o8UH+ihFo7FoxgSei9wS6C1a6NACtQ2o9PSOnmQwsUoKZrp2KAS2r9
         3uDQsfvOcujrieXY0ZCcmxesoHNyuS+vJVzy+XfjxRtt0Djfche1t//76EEFE4fk548I
         k+qYduretKihYfe9qpqHyrcwWP6Vpe24qveuJQwz6Gxi5fdDqZfvywQjr2GLlx4YDUYU
         j7Pw==
X-Gm-Message-State: AOJu0YybwsLSiW+PAsa44cl2jfkWnaxWSEB3frFyEKJsnzkOVqnv8K6Z
	cl0B1lP+7tiVG+4p539vRn1v
X-Google-Smtp-Source: AGHT+IG7/+QmzkL7RRg2tKVnn4mK40tS6TJRV/ai6cYi0yCuaNgNrt3ohQIENhvQ7spd4FLVQ0JuUA==
X-Received: by 2002:a5d:484b:0:b0:333:49a8:73ea with SMTP id n11-20020a5d484b000000b0033349a873eamr949937wrs.249.1701789298544;
        Tue, 05 Dec 2023 07:14:58 -0800 (PST)
Message-ID: <29b2d864-2b3f-4a74-9d61-534523e842cd@suse.com>
Date: Tue, 5 Dec 2023 16:14:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/livepatch: set function alignment to ensure
 minimal function size
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-2-roger.pau@citrix.com>
 <ddbf1fad-e0c1-4b7c-9734-71d4997b5aa0@citrix.com> <ZW87Qq3Hw4ql-ZFw@macbook>
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
In-Reply-To: <ZW87Qq3Hw4ql-ZFw@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2023 16:01, Roger Pau Monné wrote:
> On Tue, Dec 05, 2023 at 01:42:42PM +0000, Andrew Cooper wrote:
>> On 28/11/2023 10:03 am, Roger Pau Monne wrote:
>>> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
>>> index f3abdf9cd111..f629157086d0 100644
>>> --- a/xen/arch/x86/Makefile
>>> +++ b/xen/arch/x86/Makefile
>>> @@ -82,6 +82,8 @@ obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
>>>  obj-y += sysctl.o
>>>  endif
>>>  
>>> +CFLAGS-$(CONFIG_LIVEPATCH) += -falign-functions=$(CONFIG_CC_FUNCTION_ALIGNMENT)
>>
>> I'd really prefer not to express it like this.  For one, a major reason
>> for using an alignment of 16b or more is simply performance.
>>
>> Also, it isn't "CC" when we get the asm macros working.
>>
>> Copy Linux more closely.  Then, you have LIVEPATCH select
>> FUNCTION_ALIGNMENT_{8,16}B as appropriate.  And PERFORMANCE selects
>> FUNCTION_ALIGNMENT_16B or perhaps 32B depending on uarch.
> 
> So just use CONFIG_FUNCTION_ALIGNMENT and drop the CC part of it?
> That would indeed be fine.  We will also need to adjust
> CC_SPLIT_SECTIONS to drop the CC_ prefix when we start using it in
> assembly code.

Could we prune the CC infixes once everything is settled asm-code-wise?

>> If we ever get around to having KCFI, then we need 16B irrespective of
>> anything else.
>>
>>
>>
>> As for the subject, it's not really about size; the function size is
>> still going to be small irrespective of the alignment.
> 
> What about wording it like:
> 
> x86/livepatch: set function alignment to ensure minimal space between functions

This still wouldn't be right, as there may be no padding at all between
functions (if they're just the right size). Maybe "minimal distance
between function entry points"? Getting long-ish, though ...

Jan

