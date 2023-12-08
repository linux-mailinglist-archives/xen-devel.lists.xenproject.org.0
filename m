Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C86180A092
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 11:23:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650548.1016203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBY0w-0007JD-NF; Fri, 08 Dec 2023 10:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650548.1016203; Fri, 08 Dec 2023 10:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBY0w-0007HY-KS; Fri, 08 Dec 2023 10:23:22 +0000
Received: by outflank-mailman (input) for mailman id 650548;
 Fri, 08 Dec 2023 10:23:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBY0v-0007HS-Lm
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 10:23:21 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf5d5256-95b3-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 11:23:20 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c29f7b068so16653165e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 02:23:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k42-20020a05600c1caa00b003fe1fe56202sm2391163wms.33.2023.12.08.02.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Dec 2023 02:23:19 -0800 (PST)
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
X-Inumbo-ID: cf5d5256-95b3-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702031000; x=1702635800; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6x76WUDNewsTNxYrpglF6vJ9GoXMh21tPJ8MfaaFlk8=;
        b=TWA9zI8jEReLMjvnR/YYGjZfO+SvledAHkIIM3N5zDZxQ3PkZAzP3nqwOBqopByvrk
         XoJwSiQq1lDtTnVwFk6UoxV2b9l7ogtuXOpTzz3ici3pbrsiUWS5gcrOHpHtnVAc5aEk
         ID7LK9EyUh/+jmvXV+PIXN7YYTk5OZXzqOmd1yWpLaU7B6BhmBQr5X5U57oU78inI0CK
         ijidmGgIBO3o1d0ktGU8d1GTAjR8HXTwiz7uJcXR+GhnxaiG9guCL3FwUitHWAIXgM2z
         10t9PfK+q2mWGMXZ9KGPi+GqWZihbDwTs3Dg2QDwyYx0dyOC5kSOB1a2NIT1Bbqpjc1v
         XsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702031000; x=1702635800;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6x76WUDNewsTNxYrpglF6vJ9GoXMh21tPJ8MfaaFlk8=;
        b=qxuOc23utUzXb3tbFpQDqhLogTNJnhI404gvM26LYQVMjQQ0aPdOtf5unTj12cw9jK
         38SPiRs3eZ/r9khEVnF/C/cowf47PCPsYA1a9nSB9mx8+j7PaHT11VkfMnWi8SphWPHi
         ROMoe3CIwFP+YnMGhF7WTcHfCpK4nloRdqNA2gR4qFQJfweEOHPvTdO4NMh7kGX2UK93
         L9X8QrAbyKJREtgTK76rwu1p/ITZhlG88x5AIDOJlRaHim2gx1CjWfr156q1lnrLEGq4
         4q/zV3QjP9fvFGYsYcpvljGk3iToCUyo0A1b1AWlxUOpLJkw77HS4QS51WNDShZ8pRiy
         t+zQ==
X-Gm-Message-State: AOJu0Yzn9UKinkcRsBl9ryZ6uKoXE765Yi3xemFN1ojt0n/lJ/AOqJoD
	pZiQ9ffi0g8esZoA1QgYtJ4G
X-Google-Smtp-Source: AGHT+IEtLVA1NMGCEV7C/8vaInw/dTdtl9KafbOUcxPOQdvNyM+NDxrbZEs8iNYN+BtnGY/cVGP2Cg==
X-Received: by 2002:a05:600c:2802:b0:40c:2b16:1dd with SMTP id m2-20020a05600c280200b0040c2b1601ddmr1278579wmb.93.1702031000079;
        Fri, 08 Dec 2023 02:23:20 -0800 (PST)
Message-ID: <3d5aa7de-cbcd-4207-a540-ad512ba315eb@suse.com>
Date: Fri, 8 Dec 2023 11:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/39] xen/riscv: introduce asm/nospec.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <aa2ff1df494f82f7c045f913371d3b9d04962a5e.1700761381.git.oleksii.kurochko@gmail.com>
 <028532fb-55d4-4a08-9b93-9ae29ed8e37c@suse.com>
 <484d52564ea8b800d1eb39f1ef899c1a3044fc53.camel@gmail.com>
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
In-Reply-To: <484d52564ea8b800d1eb39f1ef899c1a3044fc53.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.12.2023 10:33, Oleksii wrote:
> On Thu, 2023-12-07 at 15:28 +0100, Jan Beulich wrote:
>> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/nospec.h
>>> @@ -0,0 +1,25 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/* Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights
>>> Reserved. */
>>> +
>>> +#ifndef _ASM_RISCV_NOSPEC_H
>>> +#define _ASM_RISCV_NOSPEC_H
>>> +
>>> +static inline bool evaluate_nospec(bool condition)
>>> +{
>>> +    return condition;
>>> +}
>>> +
>>> +static inline void block_speculation(void)
>>> +{
>>> +}
>>> +
>>> +#endif /* _ASM_RISCV_NOSPEC_H */
>>
>> This being identical between Arm, PPC, and now RISC-V, wouldn't this
>> be another
>> asm-generic/ candidate? (Whether such trivial stubs are copyrightable
>> is, as
>> per earlier remarks, at least questionable to me.)
> It is a good candidate to be moved to asm-generic. Thanks for notice
> that. I'll update move this patch to generic headers patch series.
> 
> I am not sure too but the copyright was presented in Arm's file and
> RISC-V's version is just a copy so I decided to leave it.
> Does any documented rule exist in which cases copyright should be and
> not?

I'm afraid there's nothing. But see how PPC has dropped the copyright,
too. Generally I'm of the opinion that purely trivial stubs aren't
sensible to put under a copyright.

Jan

