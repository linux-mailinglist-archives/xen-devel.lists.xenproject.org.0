Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F829B45E1
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 10:42:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827160.1241683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ijh-0004d0-4P; Tue, 29 Oct 2024 09:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827160.1241683; Tue, 29 Oct 2024 09:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ijg-0004aG-WB; Tue, 29 Oct 2024 09:42:00 +0000
Received: by outflank-mailman (input) for mailman id 827160;
 Tue, 29 Oct 2024 09:41:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E68c=RZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5ijf-0004aA-3Y
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 09:41:59 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0993cccb-95da-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 10:41:56 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-431481433bdso51767685e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 02:41:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b55f779sm167105905e9.18.2024.10.29.02.41.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 02:41:56 -0700 (PDT)
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
X-Inumbo-ID: 0993cccb-95da-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730194916; x=1730799716; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UMYI2acOpQSGxB2Pfq2OsubTrPdy34iQ9iU0BZw5LZM=;
        b=ExmOY4v83k0dGv9EidyYHJt/Kx/EyV16atHnjwNce2omayW1hdiODwniasNQDfAl5O
         uAa15h3nItDVVpeAWBBtGJfqlX5NOFJUAhi3DPhNJH9+km8cOHf55TnWViBwJxBHTCvO
         PsjvygHzR65CyF/scWB6YbI6R/UNEJciIy7agx88MeovzlLX4dFddKCbyZ+ddWoQ1aCE
         gbo6Bl8s4P/gcZgeniU3kd90+IL84bZkiqeQ7mh7fnCkHng54nijRxOh7FuT8k90cq9X
         edG2SRrJ3G2aSozLLEVFmLwcsa8kM60IPRfGCshUDsasb2/qtchK4b6fS0KCMXlK+u6H
         kXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730194916; x=1730799716;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMYI2acOpQSGxB2Pfq2OsubTrPdy34iQ9iU0BZw5LZM=;
        b=G5ZIyXIUkdxiLnLIEo+wc5s6+FGQYSBC2cGOvOeRyaRxL2PczYbNvcjHpx73TxFNwc
         nEE0wIbz3HqOf41+Mq5Q15u0D+c34MIxftH1h2r3QhM7zNkqPguhXoFIjR5PBcPz0r9S
         m6DcicO1SIlPT0xhWORAL1FRpOqzcwwBrlLR3BLzkpNovGw808Tn/k3rPs/68I9Opu5l
         drGzgZNkEYq3SDyj3bNcAxJ8TVF3mXJsXxzoV8vjxLQ29imENx2s39c62wn7rGsJTqZj
         Ghk240Zym+/QAgCUif7ceF3drENi+cNqd4h3cGSnSxJLRu6FBb3lwYCMTbOyXUlGvLyD
         komw==
X-Forwarded-Encrypted: i=1; AJvYcCXqay/Cw8H/81Aet/ciqulazbvNn/XDFJ4AO1EieQbcnLwYxbBDyo0ZL8I1DpIytFkAh+6bESEUuj0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzv8gga6hV3yca654BjC/WMUfus40fFWtePGsJxZ1mv580b5s2r
	nxGvOgeWxwR0Zgu/pZVscT3WLZPB6u+5jmuDEjqSDTiG6uAZMCSENXSzpw1urw==
X-Google-Smtp-Source: AGHT+IHufijWrFEBdWqY6hVSjKtSwINABIpaN+X3ABxrKwgJkufmX6VGdlWe0CJ0dFnfvfzxAefazQ==
X-Received: by 2002:a05:600c:3b87:b0:42c:b187:bde9 with SMTP id 5b1f17b1804b1-4319ad2f06fmr86118955e9.30.1730194916360;
        Tue, 29 Oct 2024 02:41:56 -0700 (PDT)
Message-ID: <0b27059b-a8ff-4dfb-9652-4f040b8aa08f@suse.com>
Date: Tue, 29 Oct 2024 10:41:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-7-ayan.kumar.halder@amd.com>
 <27be8d00-8260-460e-948d-81418b93662a@suse.com>
 <8fa530cb-4d70-4300-8d4e-1e7208f7c045@amd.com>
 <55728fdc-6247-4810-8696-a999713f4a7c@suse.com>
 <3231cc7b-4c2e-4939-a623-a7b9960d1641@amd.com>
 <5fb1ac28-395c-4065-8a70-4bac809c7f50@suse.com>
 <FF40F41F-D5E1-4EEB-865C-6E447D1CA043@arm.com>
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
In-Reply-To: <FF40F41F-D5E1-4EEB-865C-6E447D1CA043@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.10.2024 10:30, Luca Fancellu wrote:
> Hi Jan,
> 
>> On 29 Oct 2024, at 08:08, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 28.10.2024 18:38, Ayan Kumar Halder wrote:
>>> On 28/10/2024 15:01, Jan Beulich wrote:
>>>> On 28.10.2024 15:39, Ayan Kumar Halder wrote:
>>>>> On 28/10/2024 12:55, Jan Beulich wrote:
>>>>>> On 28.10.2024 13:45, Ayan Kumar Halder wrote:
>>>>>>> --- a/xen/arch/Kconfig
>>>>>>> +++ b/xen/arch/Kconfig
>>>>>>> @@ -6,11 +6,13 @@ config PHYS_ADDR_T_32
>>>>>>>
>>>>>>>   config NR_CPUS
>>>>>>>   	int "Maximum number of CPUs"
>>>>>>> +	range 1 1 if ARM && MPU
>>>>>>>   	range 1 16383
>>>>>>>   	default "256" if X86
>>>>>>>   	default "8" if ARM && RCAR3
>>>>>>>   	default "4" if ARM && QEMU
>>>>>>>   	default "4" if ARM && MPSOC
>>>>>>> +	default "1" if ARM && MPU
>>>>>>>   	default "128" if ARM
>>>>>>>   	help
>>>>>>>   	  Controls the build-time size of various arrays and bitmaps
>>>>>> I'm afraid I can't easily tell whether MPU can be used together with any of
>>>>>> RCAR3, QEMU, or MPSOC. If it can, the new default line would need to move
>>>>>> up, as it's the first one that has a match on its condition which is being
>>>>>> used.
>>>>> MPU cannot be used with any of the existing platforms.
>>>> That is - qemu can't emulate such an environment, i.e. even QEMU and MPU
>>>> don't go together?
>>>
>>> Qemu has support for Aarch32 MPU at EL2 and EL1 (ie R52). As far as I am 
>>> aware, there is no support for Aarch64 MPU in Qemu (ie R82).
>>>
>>> Even for R52, I could not get the upstream Qemu working (emulating some 
>>> Arm reference platform).
>>>
>>> I could get the Xilinx fork of Qemu (https://github.com/Xilinx/qemu) 
>>> working which emulates AMD's SoC using R52.
>>>
>>> However, this should not impact the current patch. There is no Qemu in 
>>> xen/arch/arm/platforms/*.
>>
>> Aiui that's not relevant. There is a QEMU item in xen/arch/arm/platforms/Kconfig.
>> I continue to fail to see why that couldn't be selected together with MPU. Yet if
>> it can be, you'd end up with a default of 4, not 1, if it actually _is_ selected.
>> Alternatively QEMU (and maybe also RCAR3 and MPSOC) need to be mutually exclusive
>> with MPU. Hmm, looks like that's already the case, by patch 2 suppressing the
>> "Platform Support" prompt. While that looks fragile to me, I'm sorry for the
>> noise then.
> 
> Are you suggesting to move "default "1" if ARM && MPU” right after “default "256" if X86”?

Yes.

Jan

