Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2542CB52DAF
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 11:53:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119867.1465051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwdyL-0006xt-Gk; Thu, 11 Sep 2025 09:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119867.1465051; Thu, 11 Sep 2025 09:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwdyL-0006uz-Cw; Thu, 11 Sep 2025 09:52:09 +0000
Received: by outflank-mailman (input) for mailman id 1119867;
 Thu, 11 Sep 2025 09:52:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwdyJ-0006ut-QV
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 09:52:07 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f98053b1-8ef4-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 11:52:05 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b0787fdb137so72047666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 02:52:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b30da4c5sm92931366b.21.2025.09.11.02.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 02:52:04 -0700 (PDT)
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
X-Inumbo-ID: f98053b1-8ef4-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757584325; x=1758189125; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uywRppr1+m9BATvN76D6Q1/AqxH6pkAJLlw5PWEDakw=;
        b=YA9ZR8wI5RI9AsCIU9SQCbqcTqOfqZ0i52pi825/KFJTX5B7o/K0ohj0ebVbtQnqUN
         Cu1G+KbOX167KCp1speZhxLlD0WhWUjZuD7ErIYftKK6OPa/InQQJGfhHXXhjFOKUsmq
         tVTMCa5NCxBZeuxp8tTQb9fYU/LSvGCnGv3FNOSSwuH4ACerjZTx/pWlspcSyjRW2GUt
         QjeVi2JJmySy8v5yt1h1WHzpGTX+ZL6DgwTWDD9WnZGKY12tgZ2PTrh6lrgO4upoOCXa
         F/dVSVygcI2LcTO5Dg28oEyCeopeIu6OKVK2PWgDfBdtTIRhUzpWWDjjS+dlnlhZDb1R
         YO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757584325; x=1758189125;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uywRppr1+m9BATvN76D6Q1/AqxH6pkAJLlw5PWEDakw=;
        b=s1MEavyW4mMOJXZ73LdZyjUVtTXkY05YARCON5LE2vW+VUZeJI5i+B12bmc0BR5HmL
         EUALvyqWJ5LUOa2EkwMkcrOfZrOtYY1iSegTHXmLxepNLIj8ZvnfWj8ncNxYoB1XkAsc
         R+YQjTaHBWRtC2ExmqX5wUVdsgraMLhfXIMoCtD7k3Nqbvm16wONLF249JBR5OCunh1u
         CPlTutDhumEYuaPL1YQBw4behElONtbVEmNHqT/gZusMUoJ9TIi90xXVuaPhMmxTCaEQ
         FGhJRdRe/WOGnUa8hlFUYCvHuFdsIBotKst9+cFdtFKHGktnqjOLyUV+GADP5FvfmppQ
         eEyw==
X-Forwarded-Encrypted: i=1; AJvYcCWacK1gICqAW8X5l/pQYS9F4ryhe+rMiSvWcR6Qh1gn3jiu47OtaBjI/GU5bYjwJ6pIhgbYKG2YOUw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBAHCrlH6uzRWlfBXQjyBzXILHkeipgtoDSFE75lO32ngsdvLD
	UK3MWbUtldAPQxxgwZhCINAPvEydpR/il59+aAAOOKnycLu+aegC8kF8zaXP7h80jA==
X-Gm-Gg: ASbGncuETXaLJqHyG3NSCiqM21RT1FzoScL8q7sGAAmVY2zqQowB90Gtb+PtKxzrPzS
	ElVhK7cOqsmjLrA/H++D7bJpXKd1nwRDKlVjAD279FMN6TpdL0gFGofMabgAruulk2ngUoVVZ2l
	0OBNniLQ6jEKrsZ4fsAkh7XlZD/IR9rTaV9rYcJkIzo0sSaPQ1kcjfzCuwSId/qkMWdUffFL45j
	43m3JfrTiVBS7QwSwwUeBrMPrq/rKt1mkgw9U+8WhRFZCOz/vj1we0a/Pxgym84GXBV9xXnKZWB
	6eZvAekwtkRbTf9wXyjiyZORxuxNbsKjPlZCFjkylA9h8pQUxSLexmJlOBUvWT4jCLtjCHeROjl
	s37iNwhXJrazWg5gaKh+UANO8GXr/Pg0NFT0CGFjX6BguSsVcrnvyhtEbLZpNc8tpVpTwcD3T9J
	JnIbS68n5VIQxkpfHHhg==
X-Google-Smtp-Source: AGHT+IELfaxamOpX9yHEKCdCkmm8rIUdT7oqykT5WIC7t7znsYYimJV7Gc3Tg4Tae67bdhO5SskCSA==
X-Received: by 2002:a17:907:7e8b:b0:b07:b19c:1381 with SMTP id a640c23a62f3a-b07b19c15bcmr189748466b.50.1757584325243;
        Thu, 11 Sep 2025 02:52:05 -0700 (PDT)
Message-ID: <5d5b4f0e-4c5e-42ac-a9e2-61fbb60718f5@suse.com>
Date: Thu, 11 Sep 2025 11:52:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/26] xen: consolidate CONFIG_VM_EVENT
To: "Penny, Zheng" <penny.zheng@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-5-Penny.Zheng@amd.com>
 <b8430631-f857-426a-a144-c6b8fbf94ee9@suse.com>
 <DM4PR12MB84517E150D46E26EF2708B44E109A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84517E150D46E26EF2708B44E109A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.2025 11:20, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, September 10, 2025 10:57 PM
>>
>> On 10.09.2025 09:38, Penny Zheng wrote:
>>> --- a/xen/include/xen/vm_event.h
>>> +++ b/xen/include/xen/vm_event.h
>>> @@ -50,6 +50,7 @@ struct vm_event_domain
>>>      unsigned int last_vcpu_wake_up;
>>>  };
>>>
>>> +#ifdef CONFIG_VM_EVENT
>>>  /* Returns whether a ring has been set up */  bool
>>> vm_event_check_ring(struct vm_event_domain *ved);
>>>
>>> @@ -68,6 +69,20 @@ bool vm_event_check_ring(struct vm_event_domain
>> *ved);
>>>   */
>>>  int __vm_event_claim_slot(struct domain *d, struct vm_event_domain *ved,
>>>                            bool allow_sleep);
>>> +#else
>>> +static inline bool vm_event_check_ring(struct vm_event_domain *ved) {
>>> +    return false;
>>> +}
>>
>> Which call site is in need of this stub? I was first considering
>> mem_paging_enabled(), but MEM_PAGING already now depends on VM_EVENT.
>>
> 
> It is used in hvm.c to check whether vm_event_share ring is empty. And it has the same problem as the below: whether we support the configuration: VM_EVENT=n and MEM_SHARING=y.

Hmm, yes, I must have overlooked that. This needs to stay, I expect.

Jan

