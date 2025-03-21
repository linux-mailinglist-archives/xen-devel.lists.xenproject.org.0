Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BFDA6BDEC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 16:03:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924163.1327490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvduR-000225-WF; Fri, 21 Mar 2025 15:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924163.1327490; Fri, 21 Mar 2025 15:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvduR-00020T-Tb; Fri, 21 Mar 2025 15:03:43 +0000
Received: by outflank-mailman (input) for mailman id 924163;
 Fri, 21 Mar 2025 15:03:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvduR-00020N-BS
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 15:03:43 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ace837b0-0665-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 16:03:41 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso14643725e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 08:03:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd2704bsm29041815e9.18.2025.03.21.08.03.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 08:03:40 -0700 (PDT)
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
X-Inumbo-ID: ace837b0-0665-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742569421; x=1743174221; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2hvrEzhHatopb1MMOcUKnFpAOwD2cfPklfcg/bR9Zn4=;
        b=Uz26VMj6AUC2O7ZYYwtpYZDyaOs4FsupBXQ02eaZmWPqr3pt9JawmpzKm1Dvuud8PY
         Dr2CnDpjhsu1KcWdZhe+GW7zVz/WeiAYTFY2fDEck6fxrhIy4shKYnvCzsVKPV8Hz7Dm
         NalAArO7BUmvTCZZOYm53CZp6okCOaW/0g8o5qPMUtL2ekRb69KDYbXMgTxJaY+osF4V
         /EEFaULABavpfLQjpAKgaPQc49KDcVOVA7/bDUwAz7wmilPX4t9fwktDi0/TADgUgUOI
         F2syO85RbjkMLBiEuZRiAPmCQu0kHAzcNEMOjuBOfRoR95Lbzs5pXQUl+R3ZY/T9treK
         G7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742569421; x=1743174221;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hvrEzhHatopb1MMOcUKnFpAOwD2cfPklfcg/bR9Zn4=;
        b=rhqb0uofr5S3hpPsO/tMtnzvSXCSfOVQtHJjG5baws9W8jU6Ca8tS/SVGQlLw4TKMp
         ixwQocYmpXimWK0r7uZNamRJ53HBn+dxZTk/jMtZmnXmqvGj7qHqlSE8cChn6WjtZ/5M
         TYmLl51jIYknXZG15BKhDoFqthtbq6V+bf1O6iiPRAv05oekNTYuzLRhefbATovDOsz4
         lu71MhSN2bi1B5KxctARZiNxCNT360MdPB+p8yWqYAHq2mg553xL1EuR7LRstONH4osU
         Nhx6wN4Ua2VouRbSQWGxZmdyOGEo8D/cnIKF+fYbdQTD7mmdYdWy1Oexlsp4e4ePCwi8
         e9jQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1wHLMgeLWnOEkkggp3QH522UQ3aXFkSTal0bIM2cmdeYyFvu1J2L08PRPDgRsEiclBx2vDAXsbSk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmxyMNUiDBFvXcaoAmYmchODetABB6ebli3ZYWJAql12xtTA5w
	vvIZ87OHQA3YSp3uZr8pfW5GumdD6x5raloekqiNYQIaak6rHYor33yukcEx2Q==
X-Gm-Gg: ASbGncsoHYtJH7Utdm+7kcnYFwSPbAT+hkw+tiSvpoAjy2NzcaUi+SxxaIO8zG+WeoI
	L6ayBDvEz9d9zHEApFfrhicP03SDgfomyO/b1/BguuB+/ihxR6Gu5TjTweYn7OxnfEWe1nK0hvx
	7H2Ycx8TMnqUIcpimMV9n/FKQKgdJ346vyO5gI7H2LpEZEsOOFsIpUbSJRXu/AV9Ae42uVCzNS3
	LUSMKMHhRAiLf+eH5fnqVUM6jTRvOS3uzDq0fgjJPwtj7sI4fZLzVyvrP0AZgSPbepswOEbRkbL
	NOtP/qhkBNG+AdaswHxKZtNHElu8zPfWr32JolXnFupHRSIQ6aIaK5qpahZtFdKgS4Z3kEMo1y9
	4YR/NGHnSs6qmZcY/aj2SHzdA4QVQhg==
X-Google-Smtp-Source: AGHT+IHirXH0Vsmfq9IIjZjbNTE377Y965JfElOiRb1/LDC1DZeZDiCpfZ7bhj6RKf64sIFu5up+OA==
X-Received: by 2002:a05:600c:83cf:b0:439:91dd:cf9c with SMTP id 5b1f17b1804b1-43d509ec70cmr43187665e9.10.1742569420512;
        Fri, 21 Mar 2025 08:03:40 -0700 (PDT)
Message-ID: <25fe073a-21b8-4ca7-8edd-03e0a3489245@suse.com>
Date: Fri, 21 Mar 2025 16:03:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
 <7fa0bde7-3aa9-48f4-a0ed-d03216edcc4e@suse.com>
 <dbc57c17-867f-49c4-be61-186b5562eff1@epam.com>
 <f90b5092-1522-414a-b57a-7a9d116a1f43@suse.com>
 <d79e9fe2-0239-4360-8b13-06498ce2c205@epam.com>
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
In-Reply-To: <d79e9fe2-0239-4360-8b13-06498ce2c205@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2025 15:50, Mykyta Poturai wrote:
> On 21.03.25 15:41, Jan Beulich wrote:
>> On 21.03.2025 11:56, Mykyta Poturai wrote:
>>> On 17.03.25 17:07, Jan Beulich wrote:
>>>> On 14.03.2025 14:34, Mykyta Poturai wrote:
>>>>> --- a/xen/drivers/pci/physdev.c
>>>>> +++ b/xen/drivers/pci/physdev.c
>>>>> @@ -19,7 +19,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>            struct pci_dev_info pdev_info;
>>>>>            nodeid_t node = NUMA_NO_NODE;
>>>>>    
>>>>> -        if ( !is_pci_passthrough_enabled() )
>>>>> +        if ( !is_pci_passthrough_enabled(true) )
>>>>>                return -EOPNOTSUPP;
>>>>
>>>> Seeing the function's parameter name, how do you know it's Dom0 calling
>>>> here?
>>>
>>> Is this a functional or naming concern? If it is about naming then can
>>> it also be solved by renaming the parameter?
>>
>> The renaming suggested above would resolve this, yes. Whether "for_pci_hwdom"
>> or anything alike is a good parameter name is a different question.
>>
>>> Regarding functional issues, I have assumed that only hwdom can make
>>> physdev operations, but after checking it, this assumption seems to be
>>> correct on x86 but wrong on Arm.
>>> I expected there would be a check in do_arm_physdev_op() or somewhere
>>> near it, similar to how it is done in x86, but there are none. I'm not
>>> sure if it is intentional or by mistake, I think it needs some
>>> clarification by Arm folks.
>>
>> Hmm, looking at x86'es do_physdev_op() I fear I can't see such a check there
>> either. And indeed there are certain PHYSDEVOP_* which DomU-s may also make
>> use of.
> 
> It is one level above in hvm_physdev_op()
> 
>      case PHYSDEVOP_setup_gsi:
>      case PHYSDEVOP_pci_mmcfg_reserved:
>      case PHYSDEVOP_pci_device_add:
>      case PHYSDEVOP_pci_device_remove:
>      case PHYSDEVOP_pci_device_reset:
>      case PHYSDEVOP_dbgp_op:
>          if ( !is_hardware_domain(currd) )
>              return -ENOSYS;
>          break;

But that's for just HVM guests, and only a functional restriction, not a
security one.

Jan

