Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1955AD6884
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 09:14:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012408.1390839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPc87-0007u8-VP; Thu, 12 Jun 2025 07:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012408.1390839; Thu, 12 Jun 2025 07:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPc87-0007sA-S7; Thu, 12 Jun 2025 07:13:43 +0000
Received: by outflank-mailman (input) for mailman id 1012408;
 Thu, 12 Jun 2025 07:13:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPc86-0007s4-5u
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 07:13:42 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c40f6990-475c-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 09:13:40 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-450ce3a2dd5so4981095e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 00:13:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2364e6d9badsm7131205ad.93.2025.06.12.00.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 00:13:35 -0700 (PDT)
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
X-Inumbo-ID: c40f6990-475c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749712419; x=1750317219; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SThEqv3QD+IFOrdp1AvLe2umZa8d7tLuCqdV+qefQDE=;
        b=CiVUk+ONPXTEXvXcgIzpir4g0rGtflUb1L5RZGM2owfkNAsvho3i5Fe4JT2MXNs2xo
         jKKs7mQyrHwxsXBBnav3MUuMLT0MqvZUyoAGsyjIy4YKLx0ZGZ8JC4nYZYXQ/Cl8C+tI
         /GwA8fhTYEP4wY/R0jheLsXHYVZjdFR26S3Z4k1mBnVN1iV7X6qnsnDsLLWg1csW+IfW
         PXj5unvmIReJtJBdvqNRz/TdsRY6PxZaMe+sjfyeojksx6O5Y1cNJgGJBK0oyCJLObOV
         0g3QW3mBJcaWS8UKpPr0ImFeWIT21rXC62qf7bCpZsPPv8HunS4SGojs25hGGgoB09uP
         FYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749712419; x=1750317219;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SThEqv3QD+IFOrdp1AvLe2umZa8d7tLuCqdV+qefQDE=;
        b=bo3kYHB7TrVnzC5FlAZWgMJoIF8YXkp6A92NaSfJMemAzXDAAcaoyUKm+km/J+1BP3
         wP0pCXuY27lLCySNcIff9UbyAb7pIqgW/VdF1Wh1OApemCHqRlGWroyB7ZOu+TMRZVRy
         X2f1ppDFt22S1Lq0G1XyWKJDcxwTw9k1Mhv6Rim2jOyLwsdWmf//QrCIUM+6biSJRuzL
         /zqdkBUMNHWx+ffguGR/eBwce8DelW4ICW/8lG1hbXFGl5PPSuAhFu3fdtVc7+uJQOHZ
         hyAfjgoSI9Vtvqkxl3FaUNnRuRY7V61AMr+2eV7hrjlb7Iu7lbN7nHZ3hZWvJB4QhqTt
         agew==
X-Forwarded-Encrypted: i=1; AJvYcCUvIQAmVBKpUOWx9cCviv2g/wxw2A0GjQIppvbIb6Xy7iRwsP0y9UTrE0oo7TrPymp1LRz1KeAu/k4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAR7L2GC+77xJ50k/5eZ4MHtw84gvX9pKBiqPNzHegpNZNLHcx
	QGi/GoWr8FVs7Ar9MsRmva5RwwcBKOQV9E241O1uqkmD+J5BEGI1fAcVsJjgcVbeHQ==
X-Gm-Gg: ASbGncuA/Bm6gYXREIW89/8p96dazQfL1NcxrkJAxoTpoXpwxn/ViTMjDX1gkVKM1qN
	sJAIbunhwAFuIM15aK+8fE18G46G+QgbSDPY2k7/U9ie8IuzdA92JHQWtl9ISEwNZyT1UFN9T9S
	jsBDtp0aboDlWJuoTcX97R7gpQ2GK1j2DdYNHK9oGb+aaLoZip3TM+o2W3L+bpitm5p0HSr2nJg
	hP3n+k8txyScRUdC05w41U8dk+ibbRh+YLofB7jdhpB2roN26q4XLeV6YOn8TPaz8IYhhgCxZog
	nWQpSpyxbDb/QGxhT+kWRE/YgIC3x3m1zqVElnSt0x4hT8HG7gfUxgmpc+BPU1kspZoknhaOTyg
	x12GvyTeE5o1/2Jx5EUw3LGn8/acs+GWVfQvx11HeGUiX2AQ=
X-Google-Smtp-Source: AGHT+IGBPUs6Gb116GWWXvqzA6d6C9Q0NMUiJIbo5NDUQ+z1VF4jfvWGRs/Zj5Mx/jWe/FJ/tdf8TA==
X-Received: by 2002:a05:6000:25c3:b0:3a4:f2ed:217e with SMTP id ffacd0b85a97d-3a5614c2053mr1366978f8f.42.1749712416378;
        Thu, 12 Jun 2025 00:13:36 -0700 (PDT)
Message-ID: <94442a1e-48e9-4236-b5e4-e192cf2a8261@suse.com>
Date: Thu, 12 Jun 2025 09:13:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/20] xen: introduce CONFIG_SYSCTL
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
 <20250528091708.390767-5-Penny.Zheng@amd.com>
 <51fde0e2-abca-43c8-9cfa-734219431970@suse.com>
 <DM4PR12MB8451169A7B4D80FFE38A62FDE174A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451169A7B4D80FFE38A62FDE174A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2025 06:35, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, June 10, 2025 9:05 PM
>>
>> On 28.05.2025 11:16, Penny Zheng wrote:
>>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>>
>>> We introduce a new Kconfig CONFIG_SYSCTL, which shall only be disabled
>>> on some dom0less systems or PV shim on x86, to reduce Xen footprint.
>>>
>>> Making SYSCTL without prompt is transient and it will be fixed in the
>>> final
>>
>> Nit: s/fixed/adjusted/ ? It's not a bug, after all.
> 
> Understood.

At the risk of being overly blunt - did you really? You use ...

>>> patch. Also, we will also state unsetting SYSCTL in pvshim_defconfig
>>> to explicitly make it unavailable for PV shim in the final patch.
>>
>> Even without the double "also" this reads odd. But it's also unclear what it has to do
>> here, nor whether what is being said is actually correct.
> 
> Hmmm, How about  "
> The consequences of introducing "CONFIG_SYSCTL=y" in .config file generated from pvshim_defconfig
> is transient and will be also fixed in the final."

... "fixed" again right away, in the same misleading way. Apart from
this - yes, this wording is quite a bit better.

>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -579,4 +579,15 @@ config BUDDY_ALLOCATOR_SIZE
>>>       Amount of memory reserved for the buddy allocator to serve Xen heap,
>>>       working alongside the colored one.
>>>
>>> +menu "Supported hypercall interfaces"
>>> +   visible if EXPERT
>>> +
>>> +config SYSCTL
>>> +   bool "Enable sysctl hypercall"
>>> +   def_bool y
>>
>> Why def_bool when you already have bool on the earlier line?
>>
> 
> Ack, then here maybe a simple
> "
> config SYSCTL
>         def_bool y
> "
>  is enough.

Indeed; see my later reply on this same topic.

Jan

