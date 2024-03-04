Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8385D86FAB6
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 08:26:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688157.1072011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh2hT-0001sE-PS; Mon, 04 Mar 2024 07:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688157.1072011; Mon, 04 Mar 2024 07:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh2hT-0001q1-Lc; Mon, 04 Mar 2024 07:25:27 +0000
Received: by outflank-mailman (input) for mailman id 688157;
 Mon, 04 Mar 2024 07:25:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kl9k=KK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rh2hS-0001pv-7h
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 07:25:26 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5db9fd73-d9f8-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 08:25:24 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-565d1656c12so7216180a12.1
 for <xen-devel@lists.xenproject.org>; Sun, 03 Mar 2024 23:25:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u17-20020a056402111100b0056729e902f7sm1507882edv.56.2024.03.03.23.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 23:25:23 -0800 (PST)
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
X-Inumbo-ID: 5db9fd73-d9f8-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709537124; x=1710141924; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+Q3KZ2WtVF7i6fMn4u4hmT38MdFFnvKR0PgAtrFTw9g=;
        b=W6VK2cE5Z3+95miykXugOTmDZIQiHFLEctFxlMsxmHy1CE9Q/SRuA4dKoBxJvgNvWN
         Ej9ckywxE18yYtbLsGFLdM8/s8uSX7Y7Mk7bMnczq0KuUOV9hFwnuQ/IQExqntgGF814
         86eqXXMmwMbyqK/seEdlnwDWZrOk2y2tn8E+J4/oHFwowAPcw/ql61fVTTVMfL7cZd/e
         8FjVDWAlmDlqJzlr0PswCLE+YclnUn8vthabfHtJ2GmlSBAzdQDqtJOTwUkx3c//AK9K
         t/XFkLx+frC/yl/OwZn9CBN0EJPEqvAftPgoZteTbG2YIZxwOeMYJgjgMwHXqbz7BURu
         oU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709537124; x=1710141924;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Q3KZ2WtVF7i6fMn4u4hmT38MdFFnvKR0PgAtrFTw9g=;
        b=vCIryn/sD3EhCtE9sUZEV5u/J4wYAVdaHod2wfBtogX33j+RL9s6AaT9kXFg9Xk1dV
         9ec54i/wkmSTT1weSur2fPfbFwCwu6tOOCpRGHNUIcneX3WwZ08Dt9r6YcC8RNFuxLJl
         5DafHDggFW7CT46IFDJ0b7iDtgML1pqADRnLHVJgE5kV6PfhHleIAtLqBapIbmZTHP/b
         S4TeqOvfs0SR3NmQplbfF0CqrnCU26IzDjT7mN4SDyAY61UxPfMQsNqi+NgE8dnJTC6C
         QWJ5ApF8JthVI2oltIjKCyens+qmKmB6npEmZ/nYBq1USDguQnOeD88gtJHceF2K3txk
         GxIg==
X-Forwarded-Encrypted: i=1; AJvYcCXfqYDMjAoC3Lw6jHds1M7+dViEoJI1H/X+OEigQmKnNp3j8IQXb1uY9/1bbF2vQcW8INdA40hU15CSqJL4Tdu62P2D5g+kCnPhzCl3TwI=
X-Gm-Message-State: AOJu0Ywu4ztLMWela+6Ch2RQBFR2cjc8WjgFd+yIk9ftLBSa85i/vfM4
	9C3SYJzF/9my/iYp1SGukhgAgyBsoAckKqn3PPNWZcHIiY4RxaL+j0LleoFdHg==
X-Google-Smtp-Source: AGHT+IF41mcKJifwGSYi3e/xmyfEQm/pYR/KYz///8Ow4Rs2itbPF76c/FPlPmQx+y/J76iuWOESYg==
X-Received: by 2002:aa7:dbcb:0:b0:567:683:11bb with SMTP id v11-20020aa7dbcb000000b00567068311bbmr4121505edt.20.1709537124194;
        Sun, 03 Mar 2024 23:25:24 -0800 (PST)
Message-ID: <a2c8f733-eef6-4af2-87c2-989f1772baea@suse.com>
Date: Mon, 4 Mar 2024 08:25:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] xen/spinlock: split recursive spinlocks from
 normal ones
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-11-jgross@suse.com>
 <a037facf-c4d9-491f-b39f-56ed4221abf1@suse.com>
 <d54d0774-0b73-4431-9d17-35b544bf91c3@suse.com>
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
In-Reply-To: <d54d0774-0b73-4431-9d17-35b544bf91c3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.03.2024 15:37, Juergen Gross wrote:
> On 29.02.24 16:32, Jan Beulich wrote:
>> On 12.12.2023 10:47, Juergen Gross wrote:
>>> +#define nrspin_lock_irqsave(l, f)                               \
>>> +    ({                                                          \
>>> +        BUILD_BUG_ON(sizeof(f) != sizeof(unsigned long));       \
>>> +        ((f) = __nrspin_lock_irqsave(l));                       \
>>
>> I don't think the outer pair of parentheses is needed here.
> 
> Turns out it is needed. Otherwise something like:
> 
> 
> if ( a )
>      nrspin_lock_irqsave(l, f);
> else
>      ...
> 
> will fail with "else without a previous if".

That's for "outer" in the whole #define I suppose, when I commented on
just a specific line inside the construct. The ({ ... }) may better be
avoided here too, for there being no reason to use a compiler
extension when do { ... } while ( false ) would also do. Things would
be different in the construct "returned" the flags value, in a more
function-like manner. But that would be inconsistent with related
similar functions.

Jan

