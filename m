Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3336A898B62
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 17:44:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700951.1094824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsPFq-0000lq-KG; Thu, 04 Apr 2024 15:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700951.1094824; Thu, 04 Apr 2024 15:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsPFq-0000jO-HN; Thu, 04 Apr 2024 15:43:54 +0000
Received: by outflank-mailman (input) for mailman id 700951;
 Thu, 04 Apr 2024 15:43:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsPFp-0000jI-1A
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 15:43:53 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22bccb80-f29a-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 17:43:51 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4162a3e2d22so6889545e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 08:43:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fm22-20020a05600c0c1600b004162bac1393sm1643021wmb.43.2024.04.04.08.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 08:43:50 -0700 (PDT)
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
X-Inumbo-ID: 22bccb80-f29a-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712245431; x=1712850231; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lxQeNv3T/0Pnqho71eXNyeSIDAiCSm3GECjSxFpQ1OM=;
        b=GihG2JpjKR+MluGaa8PKNeyVyBq+uH68zv8QdMEiYpM+7dIwkvIzxP4n8AjRkUKvBT
         23irFWjFxWR19cimEvMfrXi+tgHalKBejX/71CCi+7xN1gdtpTXSl/5UgTv4USZPWHxh
         EY5K+HkHpFFL9e42m/+ImvItAvdABOXjHAlAz9rGIITggfND8mRUtWFtj1T0zvWclZ+Y
         EVj+MA2KQ6zsip0lUvwqq2aOWmrNArWvqPwEVzPBlxFGDNFbh2q0QKFqROZ/ftqG3Jj5
         CjGhY8IpctNwxEGPirbTbqkLTQMEOP5b30zPfrukZIRXMGVcxA6iRx/tKuY75gbPSE6f
         RAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712245431; x=1712850231;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lxQeNv3T/0Pnqho71eXNyeSIDAiCSm3GECjSxFpQ1OM=;
        b=D7zoLQ5fuwwggcPAbNfHZNcPC5ESk/+B9EIqsDv9Cm/8vTLjA49zB2ipmIkx8YgFQF
         ynKoxT7LTMhAHt4IddqQokZBEuUVBhS5C0+B1RCbduluabgvQm0SwWfDG3pNmqp6RdQX
         r7ksNrn5qZp4xGwwicN1boklhZ9XDifMOHZeC+l555pqSl0f/IkwBrvw0vVtANYGpacP
         rociSN2eX7EImZkKgztti/guAL001NVdA7MCezMwhfASjMMF8Gpm21MtGy1ahoKpwZY6
         kdQ74qTMYBXd5kdITKN71lOiBCWNPy7a1gsjotH8nCDDxptCSOkQLZ/xHg9zHah8DbHv
         RIvw==
X-Forwarded-Encrypted: i=1; AJvYcCUYjYR6LtT0YLOc7flcOyXsqHzaSEfn6eka0vOBjJTJ0MjfyPjd7LuSgGYAAaxc8WjARYrwQxzN3lCr8/fB46YFknYVdNnan/zPSBVYMas=
X-Gm-Message-State: AOJu0YxPyX8iMO1lGaqu1I+j6lU67OQPaeRKxGWSmKk+EtGcPEVtqqQd
	maa9pZqpRDfvm0h/iH0bu/YMVzpu6I6ccTsHkkl8IHEWZAEFiJ9HKMB7GZAl4g==
X-Google-Smtp-Source: AGHT+IFP1468+PGvSPxZuafWO3OJ8qlE1EMX3zdmH0RJT7rtJBStiUhZBA9eexbPi9DNYKe6OItC3w==
X-Received: by 2002:a05:600c:1c13:b0:415:4457:3f8b with SMTP id j19-20020a05600c1c1300b0041544573f8bmr105461wms.25.1712245431349;
        Thu, 04 Apr 2024 08:43:51 -0700 (PDT)
Message-ID: <3095e62f-583c-414d-92d9-9b09b6959251@suse.com>
Date: Thu, 4 Apr 2024 17:43:49 +0200
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
In-Reply-To: <9945cb144f5c1b95202646135b88891537230e17.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.04.2024 17:18, Oleksii wrote:
> On Thu, 2024-04-04 at 12:07 +0200, Jan Beulich wrote:
>> On 03.04.2024 12:19, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/arch.mk
>>> +++ b/xen/arch/riscv/arch.mk
>>> @@ -3,16 +3,27 @@
>>>  
>>>  $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>>>  
>>> -CFLAGS-$(CONFIG_RISCV_64) += -mabi=lp64
>>> +riscv-abi-$(CONFIG_RISCV_32) := -mabi=ilp32
>>> +riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
>>>  
>>>  riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
>>>  riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
>>>  
>>> +riscv-generic-flags := $(riscv-abi-y) -march=$(riscv-march-y)
>>> +
>>> +zbb := $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,"",_zbb)
>>
>> While committing another question popped up: Why "" (i.e. no insn)
>> here, ...
>>
>>> +zihintpause := $(call as-insn,\
>>> +               $(CC) $(riscv-generic-
>>> flags)_zihintpause,"pause",_zihintpause)
>>
>> ... but "pause" here?
> 
> In the case of the Zbb extension, we don't check for a specific
> instruction, but with the Zihintpause, the idea was to verify if the
> pause instruction is supported or not.

And why's this verification relevant here, but not for Zbb?

Jan

> However, in both checks, there
> might be no instruction as an argument of as-insn.
> 
> ~ Oleksii


