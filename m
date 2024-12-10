Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868819EB3B9
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 15:44:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852604.1266351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1TI-0007Y3-2Q; Tue, 10 Dec 2024 14:44:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852604.1266351; Tue, 10 Dec 2024 14:44:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1TH-0007Ve-Vf; Tue, 10 Dec 2024 14:44:19 +0000
Received: by outflank-mailman (input) for mailman id 852604;
 Tue, 10 Dec 2024 14:44:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL1TG-0007VW-W5
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 14:44:18 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a1273b2-b705-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 15:44:15 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so4614002f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 06:44:15 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38621fbbc14sm16394589f8f.87.2024.12.10.06.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 06:44:14 -0800 (PST)
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
X-Inumbo-ID: 3a1273b2-b705-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733841854; x=1734446654; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XfeWjf0t/1mknC8RdFDvvPEXQ/H4yqP4bWUHMvESMBA=;
        b=JaEtW5n8vqGOqENiT1p3/B15rDsnehBevr3l7mzouxjkpdLtO7t4hDWnRufSKR3Luc
         SVsYglyRUOP81PU5H+CZoeEwe98FTYQmzmv4avFD6COzZV4RgwD73M4xwiPEGiHOuPku
         HYP3WQOY64AZ1ZARSiQ86lYENkEmEQIOTJdYs3wt56v5Dx1oRZUaiOeSjU2NWNdAdOKD
         FZmMcYr40UJZNSb8+fn+74LcO2W3DGvErnNYbv6NI1ZKp1Bbc3ffM6/cHC38M8IvMXzX
         kGU4IfQ2SInIvWfzFVp2s9QZ+t9uRSXDkjr/WPnQIeQgw+i4l56GnJ7l2n2Ta2ctagVR
         bLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841854; x=1734446654;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfeWjf0t/1mknC8RdFDvvPEXQ/H4yqP4bWUHMvESMBA=;
        b=d16Io77OzPUKzPbWa/wsQEBrRvoytQh+VBDOlFDYirLtLI5RgP+XflydQpR8uMZCJg
         C+zFCzJvMpzP4WmdDs3nVqtSqVrYj1bvB4TarrsmLBeZj9Wmg857r7BAoUawjVHDafee
         sQtnUcc6wVf56M87DoknILOVCq2nv+A0FRSmiDMrUmIg4tBN9WA0dFy8V/ZpHDhE4SDY
         O/mgQ8zlIkqaiEAndePgBR5RR+GNZTqtHLXqHCfBTEgTdfMjTsHnGlWvFCwjkC1sBSP/
         +z4pDvxgXI4uNqflqx2xSiCn04GVXSqxGSgICg+wUX9tXoU6llXbqgtr71othpqZNhbu
         xgcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvQre86pHoXzqS1wh5o6H8JvrCZoLmxkZoOUALJECkXUpzIUgRm1wKYx0UftMvwDVkTdWPNAT9TDM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBJq4Zc5QSfGfjbTKzJ/08GRHR664GCU8sh8dYsusON7C0wLU2
	XuEQOSP9uB0XlzbfGs9p5wRIe2YS6s6Rbg2sn1ypKFGlejNuijHQD7Lk1wPVmg==
X-Gm-Gg: ASbGncu2szP75a6RqT+8leKar+2a0DbgQ+g7Wekf8X5aX+hnBk6NJ7n6Q97A8WGJxLi
	f8ApYNrpawrb/QRdtPWCK1rdgibCt9TpFAiI1CmU0H1uaaUU20MwOH3uHJ35GUKvj3u4J9K4Ttk
	sTLpmbwmW6XCx857lBj0iHkGMHS6XYLmcnpd6o+y2Ze36qDvLIuvaP63k193DxtjPdzP7bTsRGx
	uawNMuCMlWdcT0MHH3e8fRFWtOJfyPugmXQtTV2IhbvE/qiTgweBwqSeMtO/8DfYYtSYhJ02tw1
	8ybXBTD4K4aIp+5x30tFsWx5SSVTmMrTa1kMuJYPDlcFfcNo+laL9W10Ehzb+q9eSzTagP+pnee
	ufoQcf/U/TQ==
X-Google-Smtp-Source: AGHT+IG/VQGTvrTw23EQ2Hd2U27ZhxdlPVzMM0CGbP867h1vG3IX5LVMTsdHPDkYy4WQZMZt6P7IZg==
X-Received: by 2002:a05:6000:18a5:b0:386:3e87:2cd6 with SMTP id ffacd0b85a97d-3863e8737fcmr6516907f8f.38.1733841854367;
        Tue, 10 Dec 2024 06:44:14 -0800 (PST)
Message-ID: <d245dcc2-49f8-4ada-9eb0-a922c1171b9d@suse.com>
Date: Tue, 10 Dec 2024 15:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] x86/boot: Use header to allows inclusion of public
 xen.h header
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241122093358.478774-1-frediano.ziglio@cloud.com>
 <20241122093358.478774-3-frediano.ziglio@cloud.com>
 <7f74b7a9-1869-4efa-a213-04d56ba48fb1@suse.com>
 <CACHz=Zhpk7HOULDjoK1==mLz-G8qcFLjo4ihWTuQxGqJ1u+zQQ@mail.gmail.com>
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
In-Reply-To: <CACHz=Zhpk7HOULDjoK1==mLz-G8qcFLjo4ihWTuQxGqJ1u+zQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2024 15:35, Frediano Ziglio wrote:
> On Tue, Dec 10, 2024 at 10:32 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 22.11.2024 10:33, Frediano Ziglio wrote:
>>> This allows to include other headers and avoid duplicated declarations.
>>>
>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>>
>> Again it's left unclear what the purpose / goal is.
>>
> 
> Reduce duplication avoiding duplicate declarations. The alternative
> would be to duplicate them, which was proposed already and refused as
> duplication was not good.

Which declarations specifically?

>>> --- /dev/null
>>> +++ b/xen/arch/x86/include/boot/public/xen.h
>>> @@ -0,0 +1,28 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +/* This header allows the inclusion of public xen.h */
>>> +
>>> +#ifndef BOOT__PUBLIC__XEN_H
>>> +#define BOOT__PUBLIC__XEN_H
>>> +
>>> +#if !defined(__XEN__) || defined(__XEN_TOOLS__) || __XEN__ != 1
>>> +#error Unexpected defines
>>> +#endif
>>
>> What is this to guard against? We're in the Xen tree, building Xen.
>>
> 
> In include/public/arch-x86/xen.h file there are these declarations:
> 
> #if defined(__i386__)
> # ifdef __XEN__
> __DeFiNe__ __DECL_REG_LO8(which) uint32_t e ## which ## x
> __DeFiNe__ __DECL_REG_LO16(name) union { uint32_t e ## name; }
> # endif
> #include "xen-x86_32.h"
> # ifdef __XEN__
> __UnDeF__ __DECL_REG_LO8
> __UnDeF__ __DECL_REG_LO16
> __DeFiNe__ __DECL_REG_LO8(which) e ## which ## x
> __DeFiNe__ __DECL_REG_LO16(name) e ## name
> # endif
> #elif defined(__x86_64__)
> #include "xen-x86_64.h"
> #endif
> 
> This header allows us to include that part without compiler errors due
> to __DeFiNe__ and __UnDeF__ not being C code.

And why exactly can't 32-bit code simply include the compat variant of
the public header, which is being generated by processing those non-C
constructs?

Jan

