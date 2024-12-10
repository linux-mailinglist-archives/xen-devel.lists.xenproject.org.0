Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C45959EB444
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 16:04:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852678.1266411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1mT-0005Wh-NJ; Tue, 10 Dec 2024 15:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852678.1266411; Tue, 10 Dec 2024 15:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1mT-0005Ut-Jm; Tue, 10 Dec 2024 15:04:09 +0000
Received: by outflank-mailman (input) for mailman id 852678;
 Tue, 10 Dec 2024 15:04:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL1mR-0005Un-Mp
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 15:04:07 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00725e62-b708-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 16:04:06 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-434f09d18e2so31913105e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 07:04:06 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434da1133cesm197888385e9.34.2024.12.10.07.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 07:03:58 -0800 (PST)
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
X-Inumbo-ID: 00725e62-b708-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733843046; x=1734447846; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kXIJpB3d5xD/yfT0gORF9PGfBtAAQGS0YGx+1HxJP3Y=;
        b=fZ6lCEAKlN7XpYJLM83hWisNhXyRVSolCnpZmSfuXA7voXBuncGksfM41aCDjOhWDU
         QjBQbdIcOsq30TF/3gmQnyHT9039GP8hlg+D28JTHAMxR8FtVIXhIgrHH0CJKXdXexDR
         /xyYoKQ6zjNZFz7OeaZ9TYoob5So74xgIRsRS/zmsNf5ihFwwZaCUtAWHuVsAUvYIo7C
         kLZTMtMWlbd9n0sRp0444hNy8mgNoDZv/Ufo7g18mFKctWtyeuuPKKa/eK0W6oGFFxES
         /aAmp7deVsu2El8JVWDrbvAo3D5enKBYqRkoSdpLR8eGf+rC8UH0S+GnZkMswqpHwF6G
         dfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733843046; x=1734447846;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXIJpB3d5xD/yfT0gORF9PGfBtAAQGS0YGx+1HxJP3Y=;
        b=GQCGczjjVv05kphLE4rfSvupBGUL7MNz0taIxt8/Utw7eopYpFROn4w+chc/Evwzzd
         H5Ud2T8w6Xj4B4O7XCPeY5b4g2T4YotElp+TMMpprepl2YaAjjaHe2lmdMvLE1OOWzju
         Vg6X4nx2m2TkGiE5gX5Q4UtU7+LOGeG2Qx58XeSXJUvfwRhYdjUC9trBaD5DbR4fPwsN
         cg1hQt0NTTT8ZHiByHWekYo2xingTXcl27vBKwr1KExJn1hXsgnDOqcCpulA/BcKKjjw
         mCf7tfXVLyN3kxlRJ2pL7r8rqZRjfKWxW4dWmenlSSMDqJUO1f4/+vCwOn09NNt1cA4e
         HPBA==
X-Forwarded-Encrypted: i=1; AJvYcCV/b4b3VTt0+kT7HIdTwlxzgO45yr7FWg4zOmjF+j72caB5kJFhwMj3NUvgcruO7T5DtbjDlS2v+To=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4xbp2Ec4I73byalmdWk98IlZp+SbkBBbd/1U2tkaxtHYMNZ2C
	+SsS9jd4xnVon2c9/2Bw3MNRYbSlO+YeNI3FcMMXh2MLBknXEBaEWMaD5NBLUg==
X-Gm-Gg: ASbGnct7PiXcCpM3vhsG9gGYDNktfwQa59lJcnNfD/eUGwM/CzXm60aqsd9bhpjADQU
	N4a6XuZOm2YtADBFmRSN0sdP7svn6xxo4XcY6UJPkfB46kMXjW5j2amKKaSjlqM0SR9MzPGAkQ1
	a9rk08tOFTdvjhFz2lnTnDuY8ojq5zZZiGvwc0muc/DM/W8T8mYgqlrdSc8RUuXCnyJsxqOJ5SO
	hCVlBPb7Ylomccxwb2qOfh9/PBfgmgxVknpYjFvLqGYVfAJPKi9OkUZNLdoxVu8rr0mixNLaVTp
	yccIqrBwTt0/Pi2UMbSupp2OwL6Xb16V7OcAMMlT23TVKrLzrbn8ieE9VCSn5rIedHv6fzIYe+3
	bD7zsADoz+g==
X-Google-Smtp-Source: AGHT+IGWpgkI+RA/wQxW9UPZdIueInhetDNWn7P+7wmoXg2NoZ8XeBRUABUYzaujX02qm8LtFaPrgQ==
X-Received: by 2002:a05:600c:3649:b0:436:1971:2a4 with SMTP id 5b1f17b1804b1-436197104acmr13697945e9.17.1733843038727;
        Tue, 10 Dec 2024 07:03:58 -0800 (PST)
Message-ID: <36a51e99-0066-4f0d-b189-9eab11dd51df@suse.com>
Date: Tue, 10 Dec 2024 16:03:57 +0100
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
 <d245dcc2-49f8-4ada-9eb0-a922c1171b9d@suse.com>
 <CACHz=Zhf=B5mvNgTzhAJ6OkYtPFYnDg_TrMsfFsCPdPX64XWAQ@mail.gmail.com>
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
In-Reply-To: <CACHz=Zhf=B5mvNgTzhAJ6OkYtPFYnDg_TrMsfFsCPdPX64XWAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2024 15:48, Frediano Ziglio wrote:
> On Tue, Dec 10, 2024 at 2:44 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 10.12.2024 15:35, Frediano Ziglio wrote:
>>> On Tue, Dec 10, 2024 at 10:32 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 22.11.2024 10:33, Frediano Ziglio wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/x86/include/boot/public/xen.h
>>>>> @@ -0,0 +1,28 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +
>>>>> +/* This header allows the inclusion of public xen.h */
>>>>> +
>>>>> +#ifndef BOOT__PUBLIC__XEN_H
>>>>> +#define BOOT__PUBLIC__XEN_H
>>>>> +
>>>>> +#if !defined(__XEN__) || defined(__XEN_TOOLS__) || __XEN__ != 1
>>>>> +#error Unexpected defines
>>>>> +#endif
>>>>
>>>> What is this to guard against? We're in the Xen tree, building Xen.
>>>>
>>>
>>> In include/public/arch-x86/xen.h file there are these declarations:
>>>
>>> #if defined(__i386__)
>>> # ifdef __XEN__
>>> __DeFiNe__ __DECL_REG_LO8(which) uint32_t e ## which ## x
>>> __DeFiNe__ __DECL_REG_LO16(name) union { uint32_t e ## name; }
>>> # endif
>>> #include "xen-x86_32.h"
>>> # ifdef __XEN__
>>> __UnDeF__ __DECL_REG_LO8
>>> __UnDeF__ __DECL_REG_LO16
>>> __DeFiNe__ __DECL_REG_LO8(which) e ## which ## x
>>> __DeFiNe__ __DECL_REG_LO16(name) e ## name
>>> # endif
>>> #elif defined(__x86_64__)
>>> #include "xen-x86_64.h"
>>> #endif
>>>
>>> This header allows us to include that part without compiler errors due
>>> to __DeFiNe__ and __UnDeF__ not being C code.
>>
>> And why exactly can't 32-bit code simply include the compat variant of
>> the public header, which is being generated by processing those non-C
>> constructs?
> 
> I suppose I could solve that specific issue in that way. Where are
> they generated?

include/Makefile generates them into include/compat/.

Jan

