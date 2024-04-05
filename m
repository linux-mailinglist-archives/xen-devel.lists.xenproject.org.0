Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8CB8994EA
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 08:08:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701092.1095200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsckF-0005hR-Md; Fri, 05 Apr 2024 06:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701092.1095200; Fri, 05 Apr 2024 06:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsckF-0005fT-IQ; Fri, 05 Apr 2024 06:08:11 +0000
Received: by outflank-mailman (input) for mailman id 701092;
 Fri, 05 Apr 2024 06:08:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsckD-0005ek-F7
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 06:08:09 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df2b0824-f312-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 08:08:07 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d6c9678cbdso20999521fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 23:08:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k41-20020a05600c1ca900b004156c501e24sm5129829wms.12.2024.04.04.23.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 23:08:06 -0700 (PDT)
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
X-Inumbo-ID: df2b0824-f312-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712297287; x=1712902087; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Aw4pmvRZn8zYYK4vM8Ekgana1ZpOxpE7zptPh5fBb0=;
        b=DVBGaYZk3SPWxU+xOxuDqEMz8FuHERkDLRHxufTcOV+BwfBIMOQuD0hwc4zfMKYmry
         7z/pX0mjb9VxolMOtmaxyyznQH7d3P8UZ6BDWLEvvxFKUBu5sQOlsezdLRZvcJOWDkvj
         HvJp2rfsOsjXxjtIVL7iyG1mxJvY5x1JbmWzSvjKF9bIKTem9+g5/5wpdql4C9GT3rXW
         KvyKC4hOMSWjRh0w2YmwBiQLTodMH9ilQe2tVDMw2vyr/FF96muHkIa5T3xKErn6h9Eo
         USbIOqX+CyDNAeY1eYWOp3HHc3/qGjOn/epREeeXBF4XSdiAkQkon867zk07+L3VibfZ
         ARMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712297287; x=1712902087;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Aw4pmvRZn8zYYK4vM8Ekgana1ZpOxpE7zptPh5fBb0=;
        b=ofa+E7B0/sbN+v+8ZNyeKLfnheo3a39gqs636vOPZ1gSeABFW0mp/aa6zNd0PMXqGd
         F6QLW85AN349Ax/6f3MLffrazYWcxALAYisYl2NuEuDpB6EZwQuPmTmgqpPIzTGCobot
         xjfyDX8imi5Y2FzwZIJLJE42xbWaB2zdgjnW4t43UV90+jt6zk58B6mn87TFafVIm3bK
         QFYc5EDCgssuUdq7hUI0ZwSK+ahVZFVOOYN8fhm/0GI8WKf0gsXuSYYamV/6zVg5tyBb
         sZmHG8EpuCGkYCivm8Pi+83x/6RCYmqk1IF1HAZnHKZlun6ZYV5+R7WI+6mczrvM1rgS
         9SyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcSYbYs+N9bnjUErpbOT29G+r8xd1bXz/r6x2ToTq4AdwLvAnXS9LkgcipmtMcr1yu1JPMuqJUcovz+WJYKUV1nFrQMKA8aUlBvPQV7YY=
X-Gm-Message-State: AOJu0YyNSG/lwKFvNcMn5raow484LLKSMU9S9VQBHKGDWhF10LTDmKsi
	dAbv3opnuOVKt0jaaxNmu/HFd2SNNu/zBu8H4dDQZHxRRmvws8KS970V5rsiQbxiELhhQKHp140
	=
X-Google-Smtp-Source: AGHT+IH7NysDN+ZNLBvc1FsDGOZvygdNDcw2XB7LNbLhxYlPLtA5ves3Xapio50pU/ZjPHbj9bcP4Q==
X-Received: by 2002:a2e:a688:0:b0:2d7:1152:d40c with SMTP id q8-20020a2ea688000000b002d71152d40cmr379977lje.5.1712297287073;
        Thu, 04 Apr 2024 23:08:07 -0700 (PDT)
Message-ID: <b63bf76c-b03a-4eb9-a179-69d9341f4b21@suse.com>
Date: Fri, 5 Apr 2024 08:08:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/19] xen/riscv: introduce extenstion support check by
 compiler
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <0c9b0317d0fc4f93bf5cc0893d480853110b8287.1712137031.git.oleksii.kurochko@gmail.com>
 <bda70742-04b7-4bab-8cdd-6b5a3d45dc3c@suse.com>
 <9945cb144f5c1b95202646135b88891537230e17.camel@gmail.com>
 <3095e62f-583c-414d-92d9-9b09b6959251@suse.com>
 <9ac4b0f3171c6b714092d04e07c2e16add16c86a.camel@gmail.com>
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
In-Reply-To: <9ac4b0f3171c6b714092d04e07c2e16add16c86a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.04.2024 18:17, Oleksii wrote:
> On Thu, 2024-04-04 at 17:43 +0200, Jan Beulich wrote:
>> On 04.04.2024 17:18, Oleksii wrote:
>>> On Thu, 2024-04-04 at 12:07 +0200, Jan Beulich wrote:
>>>> On 03.04.2024 12:19, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/arch.mk
>>>>> +++ b/xen/arch/riscv/arch.mk
>>>>> @@ -3,16 +3,27 @@
>>>>>  
>>>>>  $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>>>>>  
>>>>> -CFLAGS-$(CONFIG_RISCV_64) += -mabi=lp64
>>>>> +riscv-abi-$(CONFIG_RISCV_32) := -mabi=ilp32
>>>>> +riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
>>>>>  
>>>>>  riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
>>>>>  riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
>>>>>  
>>>>> +riscv-generic-flags := $(riscv-abi-y) -march=$(riscv-march-y)
>>>>> +
>>>>> +zbb := $(call as-insn,$(CC) $(riscv-generic-
>>>>> flags)_zbb,"",_zbb)
>>>>
>>>> While committing another question popped up: Why "" (i.e. no
>>>> insn)
>>>> here, ...
>>>>
>>>>> +zihintpause := $(call as-insn,\
>>>>> +               $(CC) $(riscv-generic-
>>>>> flags)_zihintpause,"pause",_zihintpause)
>>>>
>>>> ... but "pause" here?
>>>
>>> In the case of the Zbb extension, we don't check for a specific
>>> instruction, but with the Zihintpause, the idea was to verify if
>>> the
>>> pause instruction is supported or not.
>>
>> And why's this verification relevant here, but not for Zbb?
> It is not relevant and can be dropped.

Is it really not? Aren't you checking two things for Zihintpause (compiler
and assembler support), while checking only one (compiler) for Zbb?

Jan

