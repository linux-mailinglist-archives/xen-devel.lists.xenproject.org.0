Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E679583265E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 10:15:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668958.1041469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQkxk-0006Qo-Bd; Fri, 19 Jan 2024 09:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668958.1041469; Fri, 19 Jan 2024 09:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQkxk-0006PE-8B; Fri, 19 Jan 2024 09:14:56 +0000
Received: by outflank-mailman (input) for mailman id 668958;
 Fri, 19 Jan 2024 09:14:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPDw=I5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQkxi-0006P6-Tq
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 09:14:54 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34292d3b-b6ab-11ee-9b0f-b553b5be7939;
 Fri, 19 Jan 2024 10:14:52 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e9fd483e2so1372025e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 01:14:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c190700b0040e52cac976sm31834034wmq.29.2024.01.19.01.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jan 2024 01:14:51 -0800 (PST)
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
X-Inumbo-ID: 34292d3b-b6ab-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705655692; x=1706260492; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rFsQ0akVQdH3W5JdVz3aqW5/NI9U1738dvXdj+LE/HM=;
        b=a0Y8rsZ7Lu0jqLBlvDw8EXeoQGx9Fch+dMbmjpdVYBm7h6YYm86yAVpGAWq3C8uYGI
         u3ved57+CwGpKsKZF2F19LH0N+wM5iJ3heWYhUBd2Ewm9ZlxvyI+9n8D7zPd0Y5llTlc
         vDlP4B85nS9K4ksJrqWjPCVzmPIdrVY5aySRjfnLk5yv0HGKqL9RmAHuvYshjfCRnUPO
         S2N0i5hJzEziZdRvob+aRpsptqI1oFS0BK8dKv34Sg8UQ7Y2GYunE6nH6ONE8mNRxP54
         BtDIeOR7p/O2L2gDZyOkIgoU6al+/E8slnQhxTwVt1lTd460lxeOe3OPoXuGvIEwifv1
         mE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705655692; x=1706260492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rFsQ0akVQdH3W5JdVz3aqW5/NI9U1738dvXdj+LE/HM=;
        b=qWObTvBE+iCn7Ojs/WfIjiI9xQscJAnGYiLyEgHyjzX9Cvda5o1CzyioEwZwvEjc5W
         RMYxXJoEoisehK4jd7LxAD8KZ/qaV1KpU8tczZDeeq7mY96O+J65lORKL1UQU0uvh2MO
         QKvHE3EX6mE+5cRuyM7tIlbCMVcpwD5Io/n9maJb2+9dKCBMIS3GC6iS0r9IG5xRHIg/
         g6FjrHtDaNXt+MJIuK+74pMq0IlvJ7/BerpFsd4EAUhcuyPYUT6LAoDm/9/3b2ZOZvwT
         jkY/RodZ61eprxWkCnM1+DWNye4dW8maHDJQTeH5eb7gXdxCukVOb+DUp/s0gSvRIfwX
         q0Xw==
X-Gm-Message-State: AOJu0Yy23V5J+zanVGs2nAL2hAUTK8Z34Xw5em5J4LGq8LKgX6DYjz3d
	3MOEdeXoSQLpGKmkg9mvSGvaG/UH4k9uVSVL288GUkzpxCrzipNb/NwqG3VO3g==
X-Google-Smtp-Source: AGHT+IG2g1DiXb8BoSc51qum0P0/k7uBCnZcTmmcipRKg/h1E4w41V6eejnk/uDiqhoF92Ih5U6wqQ==
X-Received: by 2002:a7b:ce0f:0:b0:40e:95eb:863a with SMTP id m15-20020a7bce0f000000b0040e95eb863amr905373wmc.75.1705655692219;
        Fri, 19 Jan 2024 01:14:52 -0800 (PST)
Message-ID: <df4ffb88-616e-45c3-8b9d-eaea8a4fed3a@suse.com>
Date: Fri, 19 Jan 2024 10:14:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/34] xen/riscv: introduce bitops.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <841d59c3950970f4937da200cf8f04aa39132e14.1703255175.git.oleksii.kurochko@gmail.com>
 <f6e13ad0-5401-41f7-9f3b-ef8f1bf9c1df@suse.com>
 <af71f5ce0ac6af9a2d87a31a154ba051a0841e3a.camel@gmail.com>
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
In-Reply-To: <af71f5ce0ac6af9a2d87a31a154ba051a0841e3a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.01.2024 10:09, Oleksii wrote:
> On Thu, 2024-01-18 at 12:03 +0100, Jan Beulich wrote:
>> On 22.12.2023 16:12, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/include/asm-generic/bitops/bitops-bits.h
>>> @@ -0,0 +1,10 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +#ifndef _ASM_GENERIC_BITOPS_BITS_H_
>>> +#define _ASM_GENERIC_BITOPS_BITS_H_
>>> +
>>> +#define BITOP_BITS_PER_WORD     32
>>> +#define BITOP_MASK(nr)          (1UL << ((nr) %
>>> BITOP_BITS_PER_WORD))
>>> +#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
>>> +#define BITS_PER_BYTE           8
>>
>> Btw, I can't spot a use of BITS_PER_BYTE. Why do you add it? And if
>> it really needed adding, it surely wouldn't belong here.
> It is used in common/bitmap.c and ns16550.c, and inside some arch code,
> but it is not used by RISC-V right now.
> 
> Would it be better to define it in config.h?

Yes, perhaps. Imo this shouldn't have a "generic" fallback; every arch
should explicitly state this (along with e.g. BITS_PER_LONG).

Jan

