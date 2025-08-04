Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA66B19C57
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 09:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068819.1432678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uipU5-000653-TC; Mon, 04 Aug 2025 07:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068819.1432678; Mon, 04 Aug 2025 07:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uipU5-00063k-QI; Mon, 04 Aug 2025 07:19:49 +0000
Received: by outflank-mailman (input) for mailman id 1068819;
 Mon, 04 Aug 2025 07:19:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uipU4-00063X-1i
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 07:19:48 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65a81659-7103-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 09:19:45 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-615aa7de35bso8590675a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 00:19:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0763d8sm697967866b.2.2025.08.04.00.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 00:19:44 -0700 (PDT)
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
X-Inumbo-ID: 65a81659-7103-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754291985; x=1754896785; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=thBABlMUztZs/ScSwkyQTKbmuVqqDurKU4XGNU3O74o=;
        b=NyhDH5NBI9SNxfFg8wh2mSyjNu67mAJEk4GDvd9lg+TZ7r3zue9+e+9LYC5/OzoXUq
         iKm/Yfu9D1HwWcJnSIvIrhqmYpB5A4XGkLx+HmNDx7FkHBWGNulOMOQbzxRmdBmAoSBA
         Kw81Udkgldbhkoh4Pcu4Cp7FU6F9DL4TucOysWpZBBj38ukmxSgzPjQwV2Fepw9OozxD
         nuRF/T94+VkzDN65ZF0bY7nAGiqiRhpJFRw11W+1S+uQDrsqpmQWXYDgZtbQxEg0UFDi
         6Bq8mW2iOs0qk/95f/3z1hrOkjIT0t9DAQ+uybEo1RYiCOc+lAVIxnarrMS62Oug2YJa
         51vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754291985; x=1754896785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thBABlMUztZs/ScSwkyQTKbmuVqqDurKU4XGNU3O74o=;
        b=aOOxQimBmyrKrfeiJyT+5kUA3vFAYGikfCaqqbrNK9LAjRsAQH9fljGzxU8+Y4EsX2
         n4hwlv2h298murAhmpQNQIylHqP+ZvjtJsw/kiOwFs1YCHZ3BkAXusPYHlR2VvInvG4c
         QBO1n5ZPsU2nQDRejSZbYER9b+0KY8RY+EM6DPC9hqp6oRNVjoiBMI6st3tfiW2AKGQY
         rGnED6dmLdFHwm8zc7a8fwTZht2JiSRh9QXA0QLE6NdabePFREa+snCg/SDQAvOLZGPJ
         WXpgkHm2nYOGFDUDVTlNe4PMRYR7fX/iWQxcZbjcqtcMuxCa4RIpv+SAB96VZlsfrSOv
         0eaA==
X-Forwarded-Encrypted: i=1; AJvYcCVYCtr+B+ye8lYelgN+vZ40FZbTuQpbHk9njKY7nXiYns2PSmoKPHAbFIgdnrObvhEJrPT/zVO1eYA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1zornaZgP5n0sCQD1jPZxHOnw/+2i3HTYrLQrb13ffN3LFT2V
	5b1g4uEjkU+mcYcjWWVeCXqyATk2urEPcjCpi0wrp5YSBpLcgBuNeLt5zMtUtiO/oQ==
X-Gm-Gg: ASbGncu6Px+vrCNbYulAB9tywXR6JpOiZhjWLQJ6j18LOvk76D5/kwjMdpuvsrxF0+1
	QdCRHnV1/9LYYYnML58lPEo4s5RfVLuoZ5WKoYwS0QbxhHmFvz+VW3UAtPO0Ewte+tUInZg74gv
	0sXiRp9hxayqKKpwHocpLAm42+ZSabKgzdxiloy7f/PJEF7p6l8kDHs4H9Ebe1o6nrLNIv0dnQS
	e1MUBhY9eiY4K0kNew2XF30JE6eGmhqJ5d9hxtePdWwtvUrf2YUj4WEo7T7juxX+O+fIOWpw5Jx
	DlAwdczh1DOuN/sNvpWxtXAgXLGpoXEWRRSVQPQYDyVFRNx14cIiQeFJXAnhQrO2EreJgB7ZaCX
	BvLwpBM/bD1aqLzhD/YyO4jXnz8eKyYpPlty5mJ9tTGk3EuJtIDb0Jmqvl5hj54JktrSut58WyU
	FbhmsE2+rJNMYauEomTQ==
X-Google-Smtp-Source: AGHT+IHuU69DVs/thwOwZ4AeaPJJGVl54HXPEoYsOl5OZF8DhefIH5/DNDaBzozP0HXd3Wjcf0NeQw==
X-Received: by 2002:a17:907:944f:b0:ad5:7bc4:84be with SMTP id a640c23a62f3a-af94021d61cmr859930766b.52.1754291984474;
        Mon, 04 Aug 2025 00:19:44 -0700 (PDT)
Message-ID: <5ddd405b-b999-4dcc-8ba3-3d0db5f727bb@suse.com>
Date: Mon, 4 Aug 2025 09:19:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/19] xen/cpufreq: refactor cmdline "cpufreq=xxx"
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-6-Penny.Zheng@amd.com>
 <e9bc1036-2ab4-4e9a-9d43-8e11d4f67776@suse.com>
 <DM4PR12MB8451A993F94C92ED054A591FE123A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451A993F94C92ED054A591FE123A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.08.2025 07:47, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, July 16, 2025 11:01 PM
>>
>> On 11.07.2025 05:50, Penny Zheng wrote:
>>> --- a/xen/drivers/cpufreq/cpufreq.c
>>> +++ b/xen/drivers/cpufreq/cpufreq.c
>>> @@ -64,12 +64,53 @@ LIST_HEAD_READ_MOSTLY(cpufreq_governor_list);
>>>  /* set xen as default cpufreq */
>>>  enum cpufreq_controller cpufreq_controller = FREQCTL_xen;
>>>
>>> -enum cpufreq_xen_opt __initdata cpufreq_xen_opts[2] = { CPUFREQ_xen,
>>> -                                                        CPUFREQ_none };
>>> +enum cpufreq_xen_opt __initdata cpufreq_xen_opts[NR_CPUFREQ_OPTS] = {
>>> +    CPUFREQ_xen,
>>> +    CPUFREQ_none
>>> +};
>>>  unsigned int __initdata cpufreq_xen_cnt = 1;
>>
>> Given this, isn't the array index 1 initializer quite pointless above? Or else, if you
>> really mean to explicitly fill all slots with CPUFREQ_none (despite that deliberately
>> having numeric value 0), why not
>> "[1 ... NR_CPUFREQ_OPTS - 1] = CPUFREQ_none" (or using ARRAY_SIZE(), as
>> per below)?
>>
> 
> The cpufreq_xen_cnt initialized as 1 is to have default  CPUFREQ_xen value when there is no "cpufreq=xxx" cmdline option
> I suppose you are pointing out that the macro NR_CPUFREQ_OPTS is pointless, as we could use ARRAY_SIZE().

That I'm suggesting further down, yes. But here I'm questioning the array
initializer: As said, I think only slot 0 needs explicit initializing. Or
else the initializer would need touching again when the array size is
grown. Which would be nice to avoid, providing doing so is correct.

Jan

