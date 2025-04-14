Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EA3A87B06
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 10:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949422.1345964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4FY3-0006rP-87; Mon, 14 Apr 2025 08:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949422.1345964; Mon, 14 Apr 2025 08:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4FY3-0006og-4f; Mon, 14 Apr 2025 08:52:11 +0000
Received: by outflank-mailman (input) for mailman id 949422;
 Mon, 14 Apr 2025 08:52:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4FY1-0006oa-Hj
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 08:52:09 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be1ce030-190d-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 10:52:06 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so3457185f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 01:52:06 -0700 (PDT)
Received: from ?IPV6:2003:ca:b71f:2f7e:5948:62cb:7cd1:ada3?
 (p200300cab71f2f7e594862cb7cd1ada3.dip0.t-ipconnect.de.
 [2003:ca:b71f:2f7e:5948:62cb:7cd1:ada3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f20625ea4sm172331955e9.12.2025.04.14.01.52.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 01:52:05 -0700 (PDT)
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
X-Inumbo-ID: be1ce030-190d-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744620726; x=1745225526; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JLEITPsRGuaDBlNiL3Cg9aRDspa2iBoLM6N5LZCmTHI=;
        b=H3ugIS8sLf5nRldFKDv5qjtiqbD/fDpHo337XZe3zMxxJQI/Fmo9WBUSl3C/WvOzaB
         TZ4bGpFpAlEIPOHkk2UAFNzd7l7tT1UoOGvC07EcMdRx9qFxPyT46hzvNxk45hxF4yGi
         JT/VF5v2R30YIcY4wYngJ6qTgN6UPiA1A6ukHfIUrb3dz71k7GCjyLEBjqM62qUsWb1X
         fm3+ereOkt6w9ccvFkDrtqsv/sb52xSsJpkB3b2QBb+jvK6kh6ukEbUtNlYVspNyX/1G
         +fPOIxmQ5YrzTKMMHwkLJdPBdH+1naTMh8CQiEzPvCF7yyJHOKhpgVTzuw1KmYV/+r0x
         I9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744620726; x=1745225526;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLEITPsRGuaDBlNiL3Cg9aRDspa2iBoLM6N5LZCmTHI=;
        b=UiNsq4cgRRo+gcruAVRBakdvc2gM3iAHBTCgdzTEdjlTkY3Q6UzZVMuhKb/fU6gXL/
         2gmG9HSpwrs2Hw6SZKKNyaWOBH1RzXyxu0fpjrAyo/PKCUy6RAGwOxUjBObYFPusUViG
         w/CffDeZ2/g2gxAKcfxA2q1tdAX3rwd6qxs9I1Zz91/tawp2IldejCRZRPa0hDxM45WZ
         y4r+Zmql3bV4Sxi370uNTR6mcr7CkdWnAWSNsilDOLqv86k9ED0o9POmZXFWOhNZl/r9
         h5XVk3XQBKLeS+0q5WR4BW6eaZFrwss/zMOaMA5FNGcFzvCpTCqZvP6GNm3qGfopnDUT
         kd8A==
X-Forwarded-Encrypted: i=1; AJvYcCU6ji0eZZTXnSgIesY5jn6p72eZqUmoRRxySfF6O6PRCuj5OWqfwTQVwwDIP7Ko2rYJwM7VdQMR25Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYUhBkNHe9Te6ehe9PWQ1A9MkEE/oGAE4xhbh6OTEB9p1OUoW+
	SCWSvllcXb9WWsremQvmgtvlIdhsy5KsML8+jRfKNIjVZCTfvue8vST/HkPw0Q==
X-Gm-Gg: ASbGncsiOQ/WXqL/ZhWPJx6sKXsRk2bTX5SeR0Wk+uT4AQMKeJMr2S8PVukKzqpD3Zo
	NawiaXhh02a/q6nwvBSKjrNpjGxogUui6VcPnUc3apxEjCV0ImwGVvI/GkzsCZf4pB6h/NhIfdF
	jcd2SIeY7c8afYaSx49UA7wVerswdZWk5PTokmGG4mBbpLu+73fL9G8V/afewNK0QdFWVQhqZYi
	+beF5wNvTgeiPZDFtCspSh+sKq0INUctjaVIpEScCWSEpoqccyjjv6eTvnW6b8bb5ReJfD4w97Y
	N6etv3Ilv9Q+rJ9pc6ENBMTCFu8/xgHXtQiaS/e0DrcNkUth4ot7MF8x5Oa9jThm9ctb3RdtyPj
	03VyeKEAy64QGxxUnPBmltv0uOW+T+pbOb2RmaTI1qSS9zPm9CrsY8KvRH6NHRAJ4Yw/Kjj7BW2
	I=
X-Google-Smtp-Source: AGHT+IF+ODqiNKlfUWt/Ayadib48xRMJUlvoiJZhhsSSQRcjYzBk93c6Scs93eZ68SBC3KzqCPvIlQ==
X-Received: by 2002:a05:6000:248a:b0:39b:f12c:385e with SMTP id ffacd0b85a97d-39ea52019d7mr8001118f8f.20.1744620725754;
        Mon, 14 Apr 2025 01:52:05 -0700 (PDT)
Message-ID: <2bc5ae09-34b9-48e2-840a-2d42c1138e38@suse.com>
Date: Mon, 14 Apr 2025 10:52:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/io: provide helpers for multi size MMIO accesses
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20250411105411.22334-1-roger.pau@citrix.com>
 <20250411105411.22334-3-roger.pau@citrix.com>
 <bd77106c-7e5c-4e6f-98f9-faacf4f9deef@suse.com>
 <28db4a69-ea60-4c4d-a6e8-0dcc548a9e75@xen.org>
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
In-Reply-To: <28db4a69-ea60-4c4d-a6e8-0dcc548a9e75@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.04.2025 09:49, Julien Grall wrote:
> On 14/04/2025 15:07, Jan Beulich wrote:
>> On 11.04.2025 12:54, Roger Pau Monne wrote:
>>> Several handlers have the same necessity of reading from an MMIO region
>>> using 1, 2, 4 or 8 bytes accesses.  So far this has been open-coded in the
>>> function itself.  Instead provide a new handler that encapsulates the
>>> accesses.
>>>
>>> Since the added helpers are not architecture specific, introduce a new
>>> generic io.h header.
>>
>> Except that ...
>>
>>> --- /dev/null
>>> +++ b/xen/include/xen/io.h
>>> @@ -0,0 +1,63 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Generic helpers for doing MMIO accesses.
>>> + *
>>> + * Copyright (c) 2025 Cloud Software Group
>>> + */
>>> +#ifndef XEN_IO_H
>>> +#define XEN_IO_H
>>> +
>>> +#include <xen/bug.h>
>>> +
>>> +#include <asm/io.h>
>>> +
>>> +static inline uint64_t read_mmio(const volatile void __iomem *mem,
>>> +                                 unsigned int size)
>>> +{
>>> +    switch ( size )
>>> +    {
>>> +    case 1:
>>> +        return readb(mem);
>>> +
>>> +    case 2:
>>> +        return readw(mem);
>>> +
>>> +    case 4:
>>> +        return readl(mem);
>>> +
>>> +    case 8:
>>> +        return readq(mem);
>>
>> ... this and ...
>>
>>> +    }
>>> +
>>> +    ASSERT_UNREACHABLE();
>>> +    return ~0UL;
>>> +}
>>> +
>>> +static inline void write_mmio(volatile void __iomem *mem, uint64_t data,
>>> +                              unsigned int size)
>>> +{
>>> +    switch ( size )
>>> +    {
>>> +    case 1:
>>> +        writeb(data, mem);
>>> +        break;
>>> +
>>> +    case 2:
>>> +        writew(data, mem);
>>> +        break;
>>> +
>>> +    case 4:
>>> +        writel(data, mem);
>>> +        break;
>>> +
>>> +    case 8:
>>> +        writeq(data, mem);
>>> +        break;
>>
>> ... this may (generally will) not work on 32-bit architectures. Add
>> CONFIG_64BIT conditionals? At which point return type / last parameter
>> type could move from uint64_t to unsigned long.
> 
> Technically arm32 bit supports 64-bit write because we mandate LPAE. I see this is used by the vPCI code. Are we expecting to have any 64-bit access?

vPCI is, I think, supposed to not see 64-bit accesses (to config space).
However, vMSI-X already may see such.

Jan

