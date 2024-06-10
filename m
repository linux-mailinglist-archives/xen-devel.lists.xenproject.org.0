Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5253901B9F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 09:17:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736957.1143041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZHA-0001sd-9v; Mon, 10 Jun 2024 07:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736957.1143041; Mon, 10 Jun 2024 07:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZHA-0001r8-71; Mon, 10 Jun 2024 07:17:08 +0000
Received: by outflank-mailman (input) for mailman id 736957;
 Mon, 10 Jun 2024 07:17:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGZH8-0001qy-No
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 07:17:06 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70dca8c3-26f9-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 09:17:05 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57c76497cefso1284319a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 00:17:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57aae237408sm6922828a12.93.2024.06.10.00.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 00:17:04 -0700 (PDT)
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
X-Inumbo-ID: 70dca8c3-26f9-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718003825; x=1718608625; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JfXo5DY86DUjRjTZno/zguF/2yTWu03Tx+dhEuiFnwE=;
        b=RZDi/OiwzJ3F6E/EMocV9dkU6QeX0aTpleNKSoj58ihCvMR8cyBAb9Iq0M9APZOoUe
         GzI1rsmt5E3I/uHBAbvVkdhpDvd/2FopRSm5qcJi1V8UNh01zgAVwIV0BYFUi6KqiP9r
         ZGumVyjonhl7Zunk7K+GNYC9R+YGemxM6NpBXRjYFrHpP8M6qXVnXFfN+mrcxLki0kQx
         PlvsIwdhnHZaC+SH2+TLbvzNINrfnTWveFRb0Gx41SBnvVuNl/9p7IdAVmlTHBJl2gOx
         ZjacjDA/FMKCfHYtYhY2200QNywtHUJIsMRmyRwcaNMBW/9FjVkt97W25LMHIfWDLHlk
         qo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718003825; x=1718608625;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfXo5DY86DUjRjTZno/zguF/2yTWu03Tx+dhEuiFnwE=;
        b=a0Ta50jAJfykKyvw+b0z9WRxP8HkfMQI8NqkpEYcDiHpqF0p59yPighPTpVTUnPSuF
         Bnj2MGNlwbx+87oIK3H35RU0b/5Z45my0oO3e5RDM0WIuj8CtGG1dSGCX1oZ6yFAp/XR
         Zfs5+kCKpeBNkAVdYL5qlaX/yocBG2elZssQDwRspGm3kQJEc+2J/2JvWdwgkL0/7Yn0
         2GJ0+BvPw+M00zSUAPsz4/3EKmu1TWerSLvNX73aB1QlTzHrNNqE0sqALUOU1L2KrqT/
         u9CvX5jRdpLpNbvb/mZVFSy4ckgfcMTp7BdRFQzKf4erXkst0BQ4MQRt/p3akjjiBNsC
         8uXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSsjUINzIdt7v5SkSTu365Fv1C0mH9kODNfXy3cYPryTRLehJTrJBNbBIpMq1EuejK8NdaRW9I/6Qfxfc88rEwRW5gqy1kAf40OCwldog=
X-Gm-Message-State: AOJu0YwKtsHVyWOvFYX8CMQVjoBY9aGpf5xsl+7/VqaeOhRTKR4MCxf3
	UaJl31hwcevu8eHZ0UbdII6QbupKFQ0V7DHrckj21JZJ4x12Kgn9I8eTVzOt6A==
X-Google-Smtp-Source: AGHT+IFdDdcYuzFyiNiGOqyXwLz8UwIbjCTHYMbqhf4AD3V2WY9wDjhS5bzzzAAD7go3RrQS1b5hMw==
X-Received: by 2002:a50:c306:0:b0:57c:6861:d735 with SMTP id 4fb4d7f45d1cf-57c6861d783mr4418309a12.19.1718003825210;
        Mon, 10 Jun 2024 00:17:05 -0700 (PDT)
Message-ID: <c642d1ef-9466-424a-9e84-54accecd8c6a@suse.com>
Date: Mon, 10 Jun 2024 09:17:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] x86/cpufreq: separate powernow/hwp cpufreq code
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20240604093406.2448552-1-Sergiy_Kibrik@epam.com>
 <5cb13d1a-1452-4542-b50d-23e6a9d9d3ef@suse.com>
 <c66966da-bbe3-432e-8a2f-809bf434db39@epam.com>
 <ab57f7f3-ac54-4b41-950a-1f7bee4293ab@suse.com>
 <647b086a-04b0-42be-a7b8-a266c4f4e64b@epam.com>
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
In-Reply-To: <647b086a-04b0-42be-a7b8-a266c4f4e64b@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.06.2024 11:14, Sergiy Kibrik wrote:
> 06.06.24 10:54, Jan Beulich:
>> On 06.06.2024 09:30, Sergiy Kibrik wrote:
>>> 06.06.24 10:08, Jan Beulich:
>>>> On 04.06.2024 11:34, Sergiy Kibrik wrote:
>>>>> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
>>>>> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
>>>>> @@ -657,7 +657,7 @@ static int __init cf_check cpufreq_driver_init(void)
>>>>>    
>>>>>            case X86_VENDOR_AMD:
>>>>>            case X86_VENDOR_HYGON:
>>>>> -            ret = powernow_register_driver();
>>>>> +            ret = IS_ENABLED(CONFIG_AMD) ? powernow_register_driver() : -ENODEV;
>>>>>                break;
>>>>>            }
>>>>
>>>> What about the Intel-specific code immediately up from here?
>>>> Dealing with that as well may likely permit to reduce ...
>>>
>>> you mean to guard a call to hwp_register_driver() the same way as for
>>> powernow_register_driver(), and save one stub? ?
>>
>> Yes, and perhaps more. Maybe more stubs can be avoided? And
>> acpi_cpufreq_driver doesn't need registering either, and hence
>> would presumably be left unreferenced when !INTEL?
>>
> 
> {get,set}_hwp_para() can be avoided, as they're being called just once 
> and may be guarded by IS_ENABLED(CONFIG_INTEL).
> The same for hwp_cmdline_parse().
> As for hwp_active() it's being used many times by generic cpufreq code 
> and even outside of cpufreq, so probably it has to be either a stub, or 
> be moved outside of hwp.c and become smth, like this:
> 
>   bool hwp_active(void)
>   {
>      return IS_ENABLED(CONFIG_INTEL) && hwp_in_use;
>   }
> 
> Though I'm not sure such movement would be any better than a stub.
> 
> acpi_cpufreq_driver, i.e. the most of code in cpufreq.c file, can 
> probably be separated into acpi.c and put under CONFIG_INTEL as well. 
> What you think of this?

Sounds like the direction I think we want to be following.

Jan

