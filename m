Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 695989B3434
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:01:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826640.1240972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5RF8-0006mY-Jn; Mon, 28 Oct 2024 15:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826640.1240972; Mon, 28 Oct 2024 15:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5RF8-0006jt-GS; Mon, 28 Oct 2024 15:01:18 +0000
Received: by outflank-mailman (input) for mailman id 826640;
 Mon, 28 Oct 2024 15:01:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5RF7-0006jl-AC
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:01:17 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7af50e58-953d-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 16:01:16 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43168d9c6c9so45696215e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 08:01:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b55f779sm141292715e9.18.2024.10.28.08.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 08:01:15 -0700 (PDT)
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
X-Inumbo-ID: 7af50e58-953d-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730127675; x=1730732475; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Waws4sxMxmsg+1KCPdMNmG6diNbqVaHnZOWjCmR+lsU=;
        b=aKKKibKYwYMZf5m6H6UrWXY77zB8JIU8OAxDFLaQHSK4hv/hNux/XGOsHYBK0EAOwf
         irbjZud+2lUR0JsCyUAH2lMWqoDdcGpNJsW0uR3bf8MaFe+byb+UzzzsgLLL2kJczcMB
         DGpGj74EaY8mPM4IKhR7pYzTENKxponUg+AiE1XmcHV9znsPAZNRAWFzP3YdfjSqusuB
         B1PPYy+nwyRzVh8NqT/FmWNbuDuqkCW4P/+/JlqY73SV1j+GPLxazxAMJNyidm2LZh9z
         /+v6s+8ATTQNFnYWN9GB3Q8eI0xT3YIiRNIEnooYMnMHTwXNLxpk+GI5RIpjq8xMZhKK
         M1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730127675; x=1730732475;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Waws4sxMxmsg+1KCPdMNmG6diNbqVaHnZOWjCmR+lsU=;
        b=GXdEeB4W6vt624GFZHVkpC0buf6vB6KUg2UKFpCcNFeKqhjQPxoKqMPdcVMem03Ezs
         IpOpZkb+tM+BCHaObehwgNJJUvjweiYCc460CwbkeUs8qj7ypAFdUiO5JP6nrsSzaDhb
         uVfmxci8ZOMJI3Yeajqo7rRSfd1b/z+03enlkS3i0QERWRL2SmvFj+GjeJtppPjD6XIh
         Jh6uwADR/xnvLTorBsaw4GJX0GfL1K5EGZ03rvi4+teHfBApsuW/xunqerNRrC+5gbPT
         VPtZ3QSIwUF8qxjQWbQx+T30iighfP3AyLdDScUQv/ANVuAe4GE7Ga3a+/PVKiOoX6P6
         Wyzg==
X-Forwarded-Encrypted: i=1; AJvYcCWg5L4PQoVl/47BCrDbSucJS4k3g7uPHQrNLKFu8Zg+haL+u2ss8e0FF3yRvTZrlzNoZunf0CpkDJY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0pPI4zBtOiajkhdAgJLBgxWj/y2Gl2Vs1jf4/rfy4tN1xp4YP
	ryQTc4VP03k1jsAOwJ9rTVQZzCI/56AbbyyJsj/nF5mjvWS+0PoJUYCqsolWHw==
X-Google-Smtp-Source: AGHT+IHBVcrJKTMV00grUn/XxpDz85RClD5QrNc4A+xacdsFyKDceA3tNpTNjMTNTcx5GeSFIIbkLA==
X-Received: by 2002:a05:600c:5253:b0:431:46fe:4cc1 with SMTP id 5b1f17b1804b1-4319aca42bemr77948265e9.10.1730127675505;
        Mon, 28 Oct 2024 08:01:15 -0700 (PDT)
Message-ID: <55728fdc-6247-4810-8696-a999713f4a7c@suse.com>
Date: Mon, 28 Oct 2024 16:01:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-7-ayan.kumar.halder@amd.com>
 <27be8d00-8260-460e-948d-81418b93662a@suse.com>
 <8fa530cb-4d70-4300-8d4e-1e7208f7c045@amd.com>
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
In-Reply-To: <8fa530cb-4d70-4300-8d4e-1e7208f7c045@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 15:39, Ayan Kumar Halder wrote:
> On 28/10/2024 12:55, Jan Beulich wrote:
>> On 28.10.2024 13:45, Ayan Kumar Halder wrote:
>>> --- a/xen/arch/Kconfig
>>> +++ b/xen/arch/Kconfig
>>> @@ -6,11 +6,13 @@ config PHYS_ADDR_T_32
>>>   
>>>   config NR_CPUS
>>>   	int "Maximum number of CPUs"
>>> +	range 1 1 if ARM && MPU
>>>   	range 1 16383
>>>   	default "256" if X86
>>>   	default "8" if ARM && RCAR3
>>>   	default "4" if ARM && QEMU
>>>   	default "4" if ARM && MPSOC
>>> +	default "1" if ARM && MPU
>>>   	default "128" if ARM
>>>   	help
>>>   	  Controls the build-time size of various arrays and bitmaps
>> I'm afraid I can't easily tell whether MPU can be used together with any of
>> RCAR3, QEMU, or MPSOC. If it can, the new default line would need to move
>> up, as it's the first one that has a match on its condition which is being
>> used.
> 
> MPU cannot be used with any of the existing platforms.

That is - qemu can't emulate such an environment, i.e. even QEMU and MPU
don't go together?

Jan

