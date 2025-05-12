Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BF6AB3C79
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 17:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981769.1368179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVJ1-00071Y-HD; Mon, 12 May 2025 15:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981769.1368179; Mon, 12 May 2025 15:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVJ1-0006zB-EU; Mon, 12 May 2025 15:43:03 +0000
Received: by outflank-mailman (input) for mailman id 981769;
 Mon, 12 May 2025 15:43:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEVJ0-0006z3-5N
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 15:43:02 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c69cb410-2f47-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 17:42:57 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so802520866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 08:42:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad23fc5328bsm378115166b.40.2025.05.12.08.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 08:42:56 -0700 (PDT)
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
X-Inumbo-ID: c69cb410-2f47-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747064576; x=1747669376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=woq5axa4XDROliFlm/IrjqsVSOX8rkTvq0NLFICJj2I=;
        b=cmINE4e6mrZT/Efcc1+OUzpD0vDYRVyYdl6cdwyM+xFKt4oHmVx13D/RCuHGCAJ/WK
         /dOdquYtPsoHN052eUcQ9YyvKWKnULyRDdwo/jptBkznzYTjrHemlC/pf/8PBA/tthTD
         rsWhmLaJvJiq1DLheuStl50Icbv5+SmxiEHgODBcKCCG3DVFXmlvCaC3PdtqXZrQsxES
         EUlq3YbQqn+bKBmqolj+mGcsNjjH/HrOPLxnOMp+nzByxcowyWwss3nSQ9/UErL7ko8l
         foNnfa3UXnq+g4vh8PBFfJ4PeuDqFmvz8JXUuYhBbta1k+RtCUcDzrM5GU7WCtI/Tish
         5TDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747064576; x=1747669376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woq5axa4XDROliFlm/IrjqsVSOX8rkTvq0NLFICJj2I=;
        b=Dn6fIs6OAF4xZwuD18ZmpXBzWO/N6MP0WY3zf6n+p7B3rsvzbEdOJzhwzlwNgApEjx
         uBxemwKy+d2lmB4aYKT5IGU2RF1Q/eMDoB8e04IzWJSMEwdGs7XxNGkCiHBtEXY5EV5Y
         Ijx4PgqdTuwrwaPEJxEPMPFT1woAoMDxx+gK3S1AbjnS7LLs4fqXzg6m6nzbFVL105jg
         SzaQ8giMsP7OKK55fDzGZdxG7QvhMl93xbIM7S8iU9Sj4GCmoIg307Ov8r3H9/vuUCOd
         sBXGCvoxmZq2igr4KxZPqYdbZbvLjNs/fQorViDbVTnGk468tzOui8iLQNUeba1EMhtg
         2+qw==
X-Forwarded-Encrypted: i=1; AJvYcCVUL5MNBTyHZIqq/Zc1ySw+fWjcV0/hlJV+QZO1Vrj5dTqjCSSRSg6aAri1wcX8yI8DWAnHaiy5Fi4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQ8sR1zEDzKjcN6dVwvSHVaJpNqOfPGsvgbbPa2PRPFYOAvCl0
	zoM0t7LI54TDPByAXBXumpfJ5C1JIKXOuLBv+Alxyns0kouG75IoLfYDPEH+hw==
X-Gm-Gg: ASbGncuMXAisAFlcj5pXkxbG1l5FFmDx/IA8NuX+hcspJM0CXip7lgwgH4S6lGn/hgX
	oo2T6wajO9X00nJcnLt8C7Oqi3mLfYOAN8tuS/BOF1tB2d4MxZLllO3dsj54kkRlQgO6sgGRHjU
	wWPCy9xFF4IvwtNxkFXKpH6KsUyxdNbAqY0/7J77n6pnZ0ZonlFOe4c/tSJVJNBnA2mXax+3qDY
	HSdyQPJV3O8q+4+fqEhbBb90YBg7MYXFnV+C9irXMd2VeueH06tbLVszAvMlwXdQrEUgiZeaWa4
	csdNRjcRx72o7optTeL9OXekx7vms8xR1Zzft8YUFDIGmbt7VVaTiD98C8GSVnqTyYS7lt5ylNA
	Uv+XHSZUL1qUeZTT/CKkqbm0YA+7eZeo0LS5I
X-Google-Smtp-Source: AGHT+IF2sCku4ymuGnWw98Ksj2JonP9Fyemm3PQkMSO3URizeTRG8FQ6NrKkXmWNMhRsvODM0qWVXQ==
X-Received: by 2002:a17:907:c009:b0:ad2:372d:6bf8 with SMTP id a640c23a62f3a-ad2372d7b62mr952670366b.15.1747064576645;
        Mon, 12 May 2025 08:42:56 -0700 (PDT)
Message-ID: <c86a08d3-46b9-4341-b6ed-a13a7a760bf0@suse.com>
Date: Mon, 12 May 2025 17:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/15] xen/cpufreq: extract _PSD info from "struct
 xen_processor_performance"
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-3-Penny.Zheng@amd.com>
 <829e710d-d257-455a-b4fc-1746119609ef@suse.com>
 <DM4PR12MB8451AEBC8D8D1A005A074D5EE1892@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451AEBC8D8D1A005A074D5EE1892@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2025 07:56, Penny, Zheng wrote:
> [Public]
> 
> Hi,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, April 28, 2025 11:32 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Anthony PERARD <anthony.perard@vates.tech>;
>> Orzel, Michal <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Roger
>> Pau Monné <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>;
>> xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v4 02/15] xen/cpufreq: extract _PSD info from "struct
>> xen_processor_performance"
>>
>> On 14.04.2025 09:40, Penny Zheng wrote:
>>> --- a/xen/include/public/platform.h
>>> +++ b/xen/include/public/platform.h
>>> @@ -440,6 +440,11 @@ struct xen_psd_package {
>>>      uint64_t num_processors;
>>>  };
>>>
>>> +/* Coordination type value */
>>> +#define XEN_CPUPERF_SHARED_TYPE_HW   1 /* HW does needed
>> coordination */
>>> +#define XEN_CPUPERF_SHARED_TYPE_ALL  2 /* All dependent CPUs
>> should
>>> +set freq */ #define XEN_CPUPERF_SHARED_TYPE_ANY  3 /* Freq can be
>> set
>>> +from any dependent CPU */
>>> +
>>>  struct xen_processor_performance {
>>>      uint32_t flags;     /* flag for Px sub info type */
>>>      uint32_t platform_limit;  /* Platform limitation on freq usage */
>>> @@ -449,10 +454,7 @@ struct xen_processor_performance {
>>>      XEN_GUEST_HANDLE(xen_processor_px_t) states;
>>>      struct xen_psd_package domain_info;
>>>      /* Coordination type of this processor */
>>> -#define XEN_CPUPERF_SHARED_TYPE_HW   1 /* HW does needed
>> coordination */
>>> -#define XEN_CPUPERF_SHARED_TYPE_ALL  2 /* All dependent CPUs
>> should
>>> set freq */ -#define XEN_CPUPERF_SHARED_TYPE_ANY  3 /* Freq can be set
>> from any dependent CPU */
>>> -    uint32_t shared_type;
>>> +    uint32_t shared_type; /* XEN_CPUPERF_SHARED_TYPE_xxx */
>>>  };
>>>  typedef struct xen_processor_performance xen_processor_performance_t;
>>> DEFINE_XEN_GUEST_HANDLE(xen_processor_performance_t);
>>
>> What's this movement about? In the public interface nothing changes?
> 
> As we will have shared type in "struct xen_processor_cppc" too, maybe the definition would like to live
> at more common place, then it could be shared?
> Living inside "struct xen_processor_performance" looks like internal values for internal field.
> If it breaks the public interface some way, I'll change it back and duplicate the definition in "struct xen_processor_cppc" too

I don't think it would break anything, but I also don't see any need for the
movement. And generally we prefer to avoid unnecessary code churn.

Jan

