Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C482A1A473
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 13:44:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876215.1286591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tawZb-0004Ed-Au; Thu, 23 Jan 2025 12:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876215.1286591; Thu, 23 Jan 2025 12:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tawZb-0004CF-7C; Thu, 23 Jan 2025 12:44:39 +0000
Received: by outflank-mailman (input) for mailman id 876215;
 Thu, 23 Jan 2025 12:44:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tawZZ-0004C1-Q5
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 12:44:37 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd29b17a-d987-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 13:44:35 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so8578425e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 04:44:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b318a38bsm63727285e9.6.2025.01.23.04.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 04:44:35 -0800 (PST)
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
X-Inumbo-ID: cd29b17a-d987-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737636275; x=1738241075; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZX31MC31Y7iTaz7/yHdlVhMl6BCpgyjs1QWm3fml3VE=;
        b=OdWDk5D8ZAbQFj+UV3c0/YvaisKuK3cY7ziGG/f08ZpA9XtnXzzbiPBPAzQkhhRI7e
         Bdlj/3xyjQgfz0X1amUVQcCP5qizr1crhEGhQq9l5rEQTX7HgOPPa16QJ31RT8QAVEzZ
         +DcEbquqQcJtYrmiOLheDjGoAwu+IGOt6SHBxQay3jvqlRkQ6ZhlylQGAmcLDFo31cU3
         A01fP4wF45vDif9dgq/Ee4zOE9QDQ15D8+TiETlHwnSyFrQDcYFjglLRhbXnwHTXaeGC
         eWAl2fegEymg3lzYSc0dru4X7ixgTXPbabVjJgTLFOEeBtPKdp8SzS8/jVuWsqsfINLj
         oExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737636275; x=1738241075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZX31MC31Y7iTaz7/yHdlVhMl6BCpgyjs1QWm3fml3VE=;
        b=cPTQshmPU+TLFDjm0HNR9PTuPg43CdqzCMKjyEUagtYGZkh6miyUVRKd/v4zgCqi23
         WZxbQ26fIxuMMlCs2yO4NR1elc+2a7wbf7lEa8Z6ErfzgyItxKhI1E2GY4IxkbOxamQV
         XexTQMI0Wigw+ECjkLe9UJQ+7TwXmr/0B4tdgok5x6fNhucJp3EzSUmzCZFZBWnjySg+
         XBAcoaWlV/8PgHHM9aoWYxBq6ZzkH6kx4MD38H8+RE8J9qhdxPZiXQI4PsTigkI5DCjN
         wpONhrSEj5qhRiWvGfOIxJF8XWGAAQLRWzXT56eBqoUXY15PCHHi+NDQTgwFgIishZB9
         dZbw==
X-Gm-Message-State: AOJu0Yym//ifuTaXK96rsaBZTZnpIs6dkL29dtIKU5oWa2BCtl+1BuQ4
	N0l6ZexMiy3e6qMcy0gl9mR5uBGvv1u5Qm7wCZIqoYYHTkmFCb7HYAENK1RjHpZT64Jl7r7AyPo
	=
X-Gm-Gg: ASbGncvughjLDX3mYJuop4Ax9sKZ3nunDt+BZj3YsrxftPH+zD9UnUxGJHb2fQJCZY1
	G/rsuK+eRiQFHfWDrgDThX2REC2RzC5FPRXDdrmIKygmZhzgOguWsJWeRTBd+/kWsBsTh3wEqB3
	Q4OGGCJ+H1T4SitcnWg1QfowVMVSYYighXXiy5UEev94XPo/SS19zkEBiLR//U+ntGJmmc2zMMQ
	BW0qKxAjZEBzVs/l4yGw9yQFIHqKDrELpXVbj1L7nrM2PssHuXXfCGSDG30n1Wpn2v8WnTpJlG0
	IO39vrExADOIzbeiOuzDkQC7XMfvYb1GFDpQ9R6U90biXDKA/67g88zASwuK+a0UCQ==
X-Google-Smtp-Source: AGHT+IEJr9elbdIAvn2z8nFhYCsviiWuQRnEr2ugYfBycK8Gpv4FtL4zt3Nyzsb0F6aqiuLnR3fWbA==
X-Received: by 2002:a05:600c:3149:b0:434:e9ee:c2d with SMTP id 5b1f17b1804b1-4389144eee4mr209414795e9.26.1737636275355;
        Thu, 23 Jan 2025 04:44:35 -0800 (PST)
Message-ID: <10a655b0-1cdc-4e14-8fcf-221336ccc0ac@suse.com>
Date: Thu, 23 Jan 2025 13:44:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PV: further harden guest memory accesses against
 speculative abuse
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <a537dd1e-bbd3-4ef8-8014-6bb432484c57@suse.com>
 <Z5IuEq9Lauhn8glx@macbook.local>
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
In-Reply-To: <Z5IuEq9Lauhn8glx@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2025 12:54, Roger Pau Monné wrote:
> On Tue, Nov 05, 2024 at 02:56:42PM +0100, Jan Beulich wrote:
>> The original implementation has two issues: For one it doesn't preserve
>> non-canonical-ness of inputs in the range 0x8000000000000000 through
>> 0x80007fffffffffff. Bogus guest pointers in that range would not cause a
>> (#GP) fault upon access, when they should.
>>
>> And then there is an AMD-specific aspect, where only the low 48 bits of
>> an address are used for speculative execution; the architecturally
>> mandated #GP for non-canonical addresses would be raised at a later
>> execution stage. Therefore to prevent Xen controlled data to make it
>> into any of the caches in a guest controllable manner, we need to
>> additionally ensure that for non-canonical inputs bit 47 would be clear.
>>
>> See the code comment for how addressing both is being achieved.
>>
>> Fixes: 4dc181599142 ("x86/PV: harden guest memory accesses against speculative abuse")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: Two variants of part of the logic are being presented, both with
>>      certain undesirable aspects: The first form is pretty large and
>>      ugly (some improvement may be possible by introducing further
>>      helper macros). The alternative form continues to use RCR, which
>>      generally would be nice to do away with. Then again that's also
>>      slightly smaller generated code.
> 
> Oh, I assume that's why there's a hardcoded .if 1, I was wondering
> about that.  What's the specific issue with using rcr?

It's slower than SHL. Albeit - checking a few places - not as much as I
thought I remembered it would be.

>  And why is the
> more complex set of macros that use setc plus a shl better?

They're slightly longer (beyond the source complexity), but (presumably)
a little faster.

> Why not use cmovc:
> 
> mov $(1 << 63), \scratch1
> cmovc \scratch1, \scratch2
> 
> AFAICT \scratch1 is not used past the btr instruction, and hence can
> be used for the cmovc?

Such an alternative was already considered back at the time:
https://lists.xen.org/archives/html/xen-devel/2021-02/msg01067.html.
Granted I was wrong there about needing a 3rd scratch register, but
the code size consideration remains - we have dozens of instances of
this macro in the resulting binary, after all. Yet ftaod, this isn't
to mean we can't re-consider. Given the above I'm inclined though to
go the RCR route.

Jan

