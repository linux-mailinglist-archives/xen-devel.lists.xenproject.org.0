Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943ADA90652
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 16:27:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956352.1349803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53jF-00043F-Cz; Wed, 16 Apr 2025 14:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956352.1349803; Wed, 16 Apr 2025 14:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53jF-00041m-AD; Wed, 16 Apr 2025 14:27:05 +0000
Received: by outflank-mailman (input) for mailman id 956352;
 Wed, 16 Apr 2025 14:27:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u53jD-0003yC-UV
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 14:27:03 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd827e19-1ace-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 16:27:03 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so56844535e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 07:27:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b526ee9sm23005865e9.32.2025.04.16.07.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 07:27:02 -0700 (PDT)
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
X-Inumbo-ID: dd827e19-1ace-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744813622; x=1745418422; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=47CxdK73KYnbTFRZ90C0mGuhK6mbbOJN6WVlbt81+AU=;
        b=UXJbCtgpUbDtckbeexqL0urLUm9pCgLjHAER9pjb9T5vJzyBtSgYqWH5Qbyf2Ifa3J
         BZQF0zcQDNBPEak/Dcmo15NlZZd87ANS0SumLbgZyUevprsXAn98TW5fXaZbmfq8FILX
         yZqjY3DHMR5PXnQKB8bmbKDZOoYmuGssrzghDbHtGv7bz8X2W9DWUVBEQ4lOZMwRnyHh
         jMmaeKFAW7PVOm7t4eJ7nW2OG+d7KY8E3mMzV2l3Y/BBR1SqON1rUryIc8HhG3bOocEJ
         yncu3evFaLgSDy65lsKFP8+NeID8/3lFqivM5enzLf31iNHYOccJld0KcL8OnqjD1qhl
         D7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744813622; x=1745418422;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47CxdK73KYnbTFRZ90C0mGuhK6mbbOJN6WVlbt81+AU=;
        b=Ubdua6Tl6H7H76Xqs/pDmeAYkHGINH799ZTJczfGaKcUsMtj13b2TsE/6LpSlJChJk
         eFXQ6qgVRNkg0OlqWK0ZXmh6d4Qe4mbeQ8dXCYkOBGLlT+Px8Jm/lS1xoErpLuTIh73l
         jEFxKdDyS2RC5ZvQQcMHWjTvwsdfRD2J5rXpsBVUpmjMJfTv9SlI0p70OYKumAiXcJtx
         jv2o7ZKWF+GWYhJ2EZYSUh7HnN01YdKkpxJkgjP/N0VLvjTDC94G+Jm0+EOHl2BPuXBu
         YSVrtu3sFwcIXmaOJvywatfl9NJ8wVAEbLFz6bH7jFvb+RzFu8sRiVTurrVFdRrBtXeU
         1KVA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ39d4IRi9jQ+FN034wwM5drcAtXifbCbutB3SaT2De1bpb89R85W9XRg7DnLAaqIOfJePDVbhoWk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1LMsvuy0awp21Zsqu4i+HjCz4PgZhfc7JYQ4Vl6GDqbBI9/QC
	wO7hSQOyqZmF7L9KtXFSrQG6FLEpF5B9EAoSqlTVTHZMjDcjOEUtTajIAhbQhA==
X-Gm-Gg: ASbGncvcdV6uksPWZ6VgwNqbBM9j9SJH+6j5XYIkdsBbkKsYRkVX7daW02k0zaNaIOi
	bghyxH4FnN2wWH32ypb2IlSGAYMuFwzHPHSjR9D2ht5z9fjpTzGw1wQPRLT9T9CdO1W/PwBvTGb
	EPnlRS3zUuthbwL9MdPjkMtb5iuu26+mtP0dJweuqn06d+wLsJmOdEeXTUQ05upelOElEHroUXX
	C6Na2YYngiRiItDfo3f7X1qpKlr6NLkDRdrnIRS7y6ep5SA9HcjRAmEFUC/bMudG77bpctDrgZ5
	N+5SHfgy8veWurUdxOgfahmTu31feylTE3zPGML+T55O1l9oUJVJLe3yZOzIITpduLtT/CfGC6u
	zAnOLqvJ0yjsMy3A+kmTHmTbnBg==
X-Google-Smtp-Source: AGHT+IHgUFh3RrXwwMKBfGtb4sVQKZdI+PlnJxSfZ99Pltnj0crMpzfkqIh4e5NtXIsXRkcmJgxtow==
X-Received: by 2002:a05:600c:3d0c:b0:43c:fc04:6d48 with SMTP id 5b1f17b1804b1-4405d5bd52emr23962325e9.0.1744813622472;
        Wed, 16 Apr 2025 07:27:02 -0700 (PDT)
Message-ID: <2c21fb56-3303-468a-8953-783ce2446aac@suse.com>
Date: Wed, 16 Apr 2025 16:27:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/16] x86/hyperlaunch: add memory parsing to domain
 config
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org, Alejandro Vallejo <agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-15-agarciav@amd.com>
 <e78824bc-3b0a-406e-80ac-5a67b127254f@suse.com>
 <2fe06df0-ee92-4466-a532-ff246efffdac@apertussolutions.com>
 <1c12c10f-02e3-4b12-a890-205d3fa0ca39@suse.com>
 <d47ce533-bc0a-472f-ad11-e350150410b9@apertussolutions.com>
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
In-Reply-To: <d47ce533-bc0a-472f-ad11-e350150410b9@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2025 16:12, Daniel P. Smith wrote:
> On 4/16/25 09:41, Jan Beulich wrote:
>> On 16.04.2025 15:37, Daniel P. Smith wrote:
>>> On 4/10/25 08:03, Jan Beulich wrote:
>>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>>> @@ -212,6 +213,39 @@ static int __init process_domain_node(
>>>>>                else
>>>>>                    printk("PV\n");
>>>>>            }
>>>>> +        else if ( strncmp(prop_name, "memory", name_len) == 0 )
>>>>> +        {
>>>>> +            uint64_t kb;
>>>>> +            if ( fdt_prop_as_u64(prop, &kb) != 0 )
>>>>
>>>> Nit (you know what I have to say here, and again below.)
>>>>
>>>>> +            {
>>>>> +                printk("  failed processing memory for domain %s\n", name);
>>>>> +                return -EINVAL;
>>>>
>>>> Any reason to override fdt_prop_as_u64()'s return value here?
>>>
>>> IMHO this should be a function that libfdt should provide, but altering
>>> libftd directly would make uprev'ing it challenging. The least I could
>>> do is make the function behave like the rest of libfdt's helper functions.
>>
>> How's this related to the question that I raised? I didn't question the
>> function, but a particular aspect of the specific use that is being made
>> of it here.
> 
> Your question was, "Any reason to override fdt_prop_as_u64()'s return 
> value here?"
> 
> And my answer was, I copied libfdt's behavior for its helper functions. 
> IOW, to have the helper behave like libfdt's other helper functions.

I'm sorry, but no. It meanwhile feels like you're intentionally
misunderstanding. We're in process_domain_node() here. That's not a libfdt-
like helper function? And the question was why this function throws away
the return value it got from fdt_prop_as_u64().

Jan

