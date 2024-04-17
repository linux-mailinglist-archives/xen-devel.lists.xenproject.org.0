Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 882A88A86E1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 17:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707611.1105687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6n4-0007mZ-4u; Wed, 17 Apr 2024 15:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707611.1105687; Wed, 17 Apr 2024 15:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6n4-0007kF-1J; Wed, 17 Apr 2024 15:01:38 +0000
Received: by outflank-mailman (input) for mailman id 707611;
 Wed, 17 Apr 2024 15:01:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rx6n2-0007jf-Qs
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 15:01:36 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 626c99ac-fccb-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 17:01:35 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-418d33ee188so1407985e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 08:01:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w17-20020a05600c475100b004162d06768bsm3134764wmo.21.2024.04.17.08.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 08:01:34 -0700 (PDT)
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
X-Inumbo-ID: 626c99ac-fccb-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713366095; x=1713970895; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=18VnjRHg6xzXTEaGMRRz5zXGGMbbBVhjQ56u5nS7t4U=;
        b=J08FYYQq4HubwhwrsbeC/2Z2hgqK/rQyS1aA/d3pTWn2zqq1N49T/PmIRVpWxinE0I
         z5+6sLIrZFSwL2dsWhLhlUAeIwx8vNqQcyJT9KaR0Tvc506TsrO2ZecuFyRDWztBc9rk
         +u8Up6CAi6xq8bmGMJycxg5NzNcLiqb7i8tfhBTAaxLsBmVasHAENOIWDKQ2oFZPBN/B
         xUWseBf6MdefWEfOfJs3201/+W9hRzSGDXGFkTQ95Mn3mel1Vsfjt/jlLzlFWJC3e0rs
         120I/HPKCRTMlOZ27MRRcf4/bKYd0C7VeuKbbUPdjyW9GewYFD806wqBdnipB8bMnOXc
         zqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713366095; x=1713970895;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=18VnjRHg6xzXTEaGMRRz5zXGGMbbBVhjQ56u5nS7t4U=;
        b=D+eBu4vcVLOG5LkUaczgWyD6TuhybJlMkLJ1NUugo5aQgLbUGnTYYgruuhER4/Nndm
         TMXv+aAr4TV67fOvwaQkY0VhYwqts2IKm+zHKgYrlsmCVXbzzjlLMW3lpIJDc+n8qsKf
         8rhS7KrSuXz0gURSY3IqIjYGx45tCxglvCBp7pyOwd9QmtgT6+Vjom9SBI4CfLwqWZex
         BbUbjN5UEY7V7DLbp/XvN/S0EmfdN6bWheCHchh1v8Gms1A1hgOI1loJ0USMD6BZNbNk
         BdpOTHTb7Fj+SsZBjDCydRpuRyEYAyaQGtqpf7ZdiuzG/hqZGu6RwCmJFt3jTt8Czh6P
         xiQQ==
X-Gm-Message-State: AOJu0YweVSmCoAF362/4zDLyACGUOIqFbzu3zKtfHxLU6U7VXTbMbEse
	YTLZgkxxm+XOG/IkRa8wiO081hk6/BUSKZzX/wIK91T8c7q4HXJshFInHXDANg==
X-Google-Smtp-Source: AGHT+IFOYYj+voWAI6C8+j9Io9/nRYolY3IoCpfEjLke2Cp79qclFeNJepLt3Th6EiHCnC3YdPF2uA==
X-Received: by 2002:a05:600c:1c13:b0:418:8428:2472 with SMTP id j19-20020a05600c1c1300b0041884282472mr6082678wms.26.1713366094852;
        Wed, 17 Apr 2024 08:01:34 -0700 (PDT)
Message-ID: <0c3a38fe-9608-4ac7-8526-0a0beb545b09@suse.com>
Date: Wed, 17 Apr 2024 17:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH V1] x86/ucode: optional amd/intel ucode build & load
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Sergiy Kibrik <sergiy_kibrik@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240405103027.2704728-1-Sergiy_Kibrik@epam.com>
 <33eb77af-2196-40d9-9cdb-a4acf95f221c@citrix.com>
 <ae38f758-7894-4098-85dc-04cbf3523393@epam.com>
 <alpine.DEB.2.22.394.2404091443140.2245130@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2404091443140.2245130@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.04.2024 23:49, Stefano Stabellini wrote:
> On Tue, 9 Apr 2024, Sergiy Kibrik wrote:
>> 05.04.24 13:57, Andrew Cooper:
>>> On 05/04/2024 11:30 am, Sergiy Kibrik wrote:
>>>> Introduce configuration variables to make it possible to selectively turn
>>>> on/off CPU microcode management code in the build for AMD and Intel CPUs.
>>>>
>>>> This is to allow build configuration for a specific CPU, not compile and
>>>> load what will not be used anyway.
>>>>
>>>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>>
>>> Hmm... Stefano didn't check up with me first.
>>>
>>> _https://lore.kernel.org/xen-devel/20231027191926.3283871-1-andrew.cooper3@citrix.com/
>>>
>>> I've already got a series out for this, although its blocked on naming
>>> and IMO, particularly unhelpful replies.  I've not had time to apply the
>>> community-resolution vote on naming issues.  (Also, you should be CC-ing
>>> Roger on x86 patches).

I can't remain silent here. Roger has now changed his mind, so formally
things are correct. Yet judging from the earlier example where Roger
was agreeing with you, shouldn't it have been this time the other way
around: A majority was of different opinion than you, and you should
have accepted that? Instead you've waited for a time when I was away,
got Stefano to agree and Roger to change his mind, and once again you
got what you want. It feels increasingly like not everyone among the
REST maintainers and not everyone among the x86 ones are equal.

Jan

>> + Stefano & Roger
>>
>> should we revisit this series then?
> 
> Yes, I replied. I think there are three naming options:
> 
> Option-1)
> CONFIG_{AMD,INTEL}
> nothing else
> 
> Option-2)
> CONFIG_{AMD,INTEL}_IOMMU
> CONFIG_{AMD,INTEL} selects CONFIG_{AMD,INTEL}_IOMMU
> 
> Option-3)
> CONFIG_{AMD,INTEL}_IOMMU
> CONFIG_{AMD,INTEL}_CPU
> CONFIG_{AMD,INTEL} selects both CPU and IOMMU options
> 
> 
> My preference is Option-1 (best), Option-3, Option-2 (worse)
> 
> I am fine with anything but please let move this forward.


