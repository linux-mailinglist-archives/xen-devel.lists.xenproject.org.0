Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACE7854A18
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 14:09:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680736.1058826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raF1A-0006XJ-83; Wed, 14 Feb 2024 13:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680736.1058826; Wed, 14 Feb 2024 13:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raF1A-0006Ur-4x; Wed, 14 Feb 2024 13:09:40 +0000
Received: by outflank-mailman (input) for mailman id 680736;
 Wed, 14 Feb 2024 13:09:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raF18-0006Uh-8O
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 13:09:38 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c9641d1-cb3a-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 14:09:34 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-511898b6c9eso4093275e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 05:09:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m10-20020a05600c4f4a00b00411e6243e70sm1933730wmq.12.2024.02.14.05.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 05:09:34 -0800 (PST)
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
X-Inumbo-ID: 4c9641d1-cb3a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707916174; x=1708520974; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2WgV/KpmqVIoQsd4n3Phk/UVFdI4GBNBCLy9AxSUPqY=;
        b=H0YUrLmI4NQLCBCq1kpjJtOSPJbB9g+KwXFzbqWbFZ1JPN1YUvujMtY1QLZVPluU8Y
         SitW0vxXa94DG/wYXxQ/ec4v2n0QilLKfdAC1gnMBxDnQz1wkjrG0yRuxiTeMikviENl
         rm6gn6F+TTnT5P7tLmDhrPQ6deWgvQ4hE1vqqyORfzEGCjKZDDd3Ec3gAwwHBWSYPRgm
         VVJ8/KjMr+9DcViMgpK+Opoxm07W6aIJNsrNTQ/+/1DCDJhTwtazB9ZYN7SzpkgWE5TE
         bAWyIr5a5tAMLz269XxYFhPq72tllLpLdZa5BoTmrOPcbYiD1fo0B7qKfp9gdgRXQXMY
         SyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707916174; x=1708520974;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2WgV/KpmqVIoQsd4n3Phk/UVFdI4GBNBCLy9AxSUPqY=;
        b=bTqWAx94WzW0e5K/aNk2QLjLHhgkp6z42kTPu17ncQC9fFlfdZC6eg6Q2FD6dHuhqh
         f4NSCPfsVUSqT1nqwHN5T0ZHQa6/VCvKCbLOWZCIyrvgGMGLeEDovjSHT9uVgN+jDDbi
         msO4MDogkApRud7H36xvrC2r2ojrp7Lw5T/pLhvgpXfbOV23JGXP9m41IuXy8Y4iCly3
         ukbx0AEqE//bIqVLwvkXzzd8ds0ohwUBlhNA3a3JSJIFh3zKRROjh44OMlTyJYQi3AKV
         zFgCnbRUu5qFptsoFicoYiiA3jxgm8eP1gThhp6cDtGIIRqgn8r//MGvubd/xuOpHAVG
         ZNzg==
X-Forwarded-Encrypted: i=1; AJvYcCVN9+Ktyd56Mt7ZYmQlzbJ2/I2ezeTJcaxu1lHb0iPVw7Twavu4Ggq+CbBq3ILHnfBHI0CijRgzgTQoElAbLjph4MeESvZFl/67jMIOeqs=
X-Gm-Message-State: AOJu0Yyw9OxBLrSwRlildbzYjmGnjQtrA/Q8fjAF8/vJWn3uAJHTseCX
	lVYSmLg+yQjxclLIyrLCp2qt5dy6vmLyrn92h9tpG26NhFRHRP1Ity7vHmaTOg==
X-Google-Smtp-Source: AGHT+IF5tn5KKuczaaH54Vs9gcimwfvNX1ijsYcJrHo4SP7BOAdGX2/EFM1sFDhtXCRHWyVqJugnOg==
X-Received: by 2002:a05:6512:3983:b0:511:7c0a:da3 with SMTP id j3-20020a056512398300b005117c0a0da3mr2193477lfu.25.1707916174436;
        Wed, 14 Feb 2024 05:09:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhE/UnIeLJH/KKuV5WbfZRXqwFo+AXyrgTSNRG9t6b8cuT925ZRg3D3b4+EuKebpSxPQucivq8Wbw0r/g9/9FnK/TXZOLsRsQ0IuLdGJeHKCxd2zgqiNcL6UDTxnNpeBuJ65ipVDZPxg0w0uJFAwj+1C5uNCa+GnnF+qGe2o0fwksvF2uAjbHZhwzhRY9krD3qwYFO2tCH/lU/usvyfzZQ+FdWlItTChqwy4/zj/pnrW21QtojjCk74Xy/lpE88/v1c/hLW76HIdIezWBLJnwfEldudTUXV4ckVaoGpU9HrLGTcBjydg8U
Message-ID: <59312f50-d36c-48d8-8d95-e1abe48d9bc3@suse.com>
Date: Wed, 14 Feb 2024 14:09:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/30] xen/riscv: introduce atomic.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <6554f2479e19ed3eae6de842ac1568c31d236461.1707146506.git.oleksii.kurochko@gmail.com>
 <134e09c9-776a-4261-a28b-137d109b62ef@suse.com>
 <8af3bbf27c51f4b5d8663b537c3123c6e05e74e7.camel@gmail.com>
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
In-Reply-To: <8af3bbf27c51f4b5d8663b537c3123c6e05e74e7.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.02.2024 13:11, Oleksii wrote:
> On Tue, 2024-02-13 at 12:36 +0100, Jan Beulich wrote:
>> On 05.02.2024 16:32, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/atomic.h
>>> @@ -0,0 +1,395 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Taken and modified from Linux.
>>> + *
>>> + * atomic##prefix##_*xchg_*(atomic##prefix##_t *v, c_t n) were
>>> updated to use
>>> + * __*xchg_generic()
>>> + * 
>>> + * Copyright (C) 2007 Red Hat, Inc. All Rights Reserved.
>>> + * Copyright (C) 2012 Regents of the University of California
>>> + * Copyright (C) 2017 SiFive
>>> + * Copyright (C) 2021 Vates SAS
>>> + */
>>> +
>>> +#ifndef _ASM_RISCV_ATOMIC_H
>>> +#define _ASM_RISCV_ATOMIC_H
>>> +
>>> +#include <xen/atomic.h>
>>> +#include <asm/cmpxchg.h>
>>> +#include <asm/fence.h>
>>> +#include <asm/io.h>
>>> +#include <asm/system.h>
>>> +
>>> +void __bad_atomic_size(void);
>>> +
>>> +static always_inline void read_atomic_size(const volatile void *p,
>>> +                                           void *res,
>>> +                                           unsigned int size)
>>> +{
>>> +    switch ( size )
>>> +    {
>>> +    case 1: *(uint8_t *)res = readb(p); break;
>>> +    case 2: *(uint16_t *)res = readw(p); break;
>>> +    case 4: *(uint32_t *)res = readl(p); break;
>>> +    case 8: *(uint32_t *)res  = readq(p); break;
>>
>> Why is it the MMIO primitives you use here, i.e. not read<X>_cpu()?
>> It's RAM you're accessing after all.
> Legacy from Linux kernel. For some reason they wanted to have ordered
> read/write access.

Wants expressing in a comment then, or at the very least in the patch
description.

Jan

