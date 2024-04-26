Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2956E8B35F7
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 12:50:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712635.1113447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0J8b-0003nR-UI; Fri, 26 Apr 2024 10:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712635.1113447; Fri, 26 Apr 2024 10:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0J8b-0003ku-R4; Fri, 26 Apr 2024 10:49:05 +0000
Received: by outflank-mailman (input) for mailman id 712635;
 Fri, 26 Apr 2024 10:49:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s0J8a-0003ko-8k
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 10:49:04 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 979636a5-03ba-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 12:49:02 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a519e1b0e2dso277801166b.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 03:49:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d18-20020a1709061f5200b00a587831c09fsm4507567ejk.186.2024.04.26.03.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 03:49:00 -0700 (PDT)
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
X-Inumbo-ID: 979636a5-03ba-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714128541; x=1714733341; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=upoVOPXGeYRFP89FVskEKcXB6vRxHWSPcT9ROSFwTdc=;
        b=W90TkLNVGsrQn5jJz0gblC7nENRN3d3pTjmHKi4YMR5gkVfimAiwbq7gV3YVi0Uroc
         KoU7aIaY7sObwucmILWfk/JTILoDusgq03UWkoPa63BCRbrewm2PYUoUiJYMfSdVHdpp
         P9y/lN34UN/H1NdXrzsKABUUf14nvT1LQUSMmg2bVOSFg8T32D23kK5twn+UwaXGAMOw
         4vqGfWQ0b6mY/JCEelJPDTTaW6rI/87dNx3V9LqpwhDxe5sZUMAkpfghKT0lJroN2omN
         o4fq+hXgzCz/Q/gJWapi2fASNsZzl3tjUsLGCyvkU2+v1QjvyWekgOf71O5wQSamRCcn
         53Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714128541; x=1714733341;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=upoVOPXGeYRFP89FVskEKcXB6vRxHWSPcT9ROSFwTdc=;
        b=TIbH3qbcGoRDsmBiJmA34cafgBRjgqF+vGnNHoNGKJEevGJ+UFpC9zL+ZWpNZq/0TD
         PFPUk/pt4M3Jl50i4oknb4iE4Cc7CCGmz1ZuMqQ4MFREPxu5LyqD/wCzoXT2ZWatEEWD
         +Wx/kIl6NoL5Rw5W6vcKmS44v7SNZU+ciBh3wUs5D8j3QGaKkQmEkpcZWZDTyX7WrcYm
         coUyXLxvKFzuGrmIATEtii//hRPTyx4gQ3it+42+9WHyVFdk2sHDQ1xfJER1CvkW4gA6
         7N7GvKa/ULxc7OwUMoxVd9MWUfCx1WI6cAdfzdsG5gd5rjkJaBEPgNdlG8Ru7tU/OV2L
         xCNg==
X-Forwarded-Encrypted: i=1; AJvYcCV4q77gQVwkegzo/W8E2XXjNEPGpxqUc2lkr7XnTmkF1iDtSJg6+l4DTe+KjzJBCdysdZV3ao5qp8830PbxdPFi6Qy8y7CvnKNebR/9tLs=
X-Gm-Message-State: AOJu0Yx4c9yTCH0bGNRvuwKzEMIfROu24o47UL9xGlEeQKxdxCuCHCFU
	UacrZ66+KBnQ2hjorM5wvpMvGog7QtaO+OreM3shTBWZxH1IiSy4FPdS1LI26Q==
X-Google-Smtp-Source: AGHT+IFTVS4Bf+Gii9vZCRY2y6+P6VLhNhDueiTQunFLNatWDNOvkbwGul0XGQCjUSURGkIq5dow9w==
X-Received: by 2002:a17:906:480f:b0:a52:3ff7:744d with SMTP id w15-20020a170906480f00b00a523ff7744dmr1709053ejq.4.1714128540932;
        Fri, 26 Apr 2024 03:49:00 -0700 (PDT)
Message-ID: <9c295302-4ba4-4955-85dc-0f078192356c@suse.com>
Date: Fri, 26 Apr 2024 12:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/17] xen: introduce generic non-atomic test_*bit()
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
 <1a0977e3cf5a2de9f760ca5ec89a0d096894a9e3.1713347222.git.oleksii.kurochko@gmail.com>
 <3827c11c-6d47-411d-a356-871def4e5b30@suse.com>
 <367bcd4d7f501ce72a8c101dfd846e94682d4045.camel@gmail.com>
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
In-Reply-To: <367bcd4d7f501ce72a8c101dfd846e94682d4045.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.04.2024 10:14, Oleksii wrote:
> On Thu, 2024-04-25 at 17:35 +0200, Jan Beulich wrote:
>>>   /* --------------------- Please tidy above here -----------------
>>> ---- */
>>>   
>>>   #include <asm/bitops.h>
>>>   
>>> +#ifndef arch_check_bitop_size
>>> +#define arch_check_bitop_size(addr)
>>
>> Can this really do nothing? Passing the address of an object smaller
>> than
>> bitop_uint_t will read past the object in the generic__*_bit()
>> functions.
> Agree, in generic case it would be better to add:
> #define arch_check_bitop_size(addr) (sizeof(*(addr)) <
> sizeof(bitop_uint_t))

At which point x86 won't need any special casing anymore, I think.

Jan

