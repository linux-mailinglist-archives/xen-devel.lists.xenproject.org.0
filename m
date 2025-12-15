Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC58CBD39C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 10:42:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186723.1508146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV55Z-00042Z-4a; Mon, 15 Dec 2025 09:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186723.1508146; Mon, 15 Dec 2025 09:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV55Z-000400-1u; Mon, 15 Dec 2025 09:41:57 +0000
Received: by outflank-mailman (input) for mailman id 1186723;
 Mon, 15 Dec 2025 09:41:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV55X-0003zu-9c
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 09:41:55 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4963720e-d99a-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 10:41:53 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so24559355e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 01:41:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4bebf4sm64334105e9.8.2025.12.15.01.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 01:41:51 -0800 (PST)
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
X-Inumbo-ID: 4963720e-d99a-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765791712; x=1766396512; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HD9BBJU0e1MmcNRgmpeJcbkLD64hxkGHNzeKFm27JsE=;
        b=RtCbit1/7ZyqMG9+NqA9vSBb6ntHMYznkk5u9D99vYDY2lTh35NegmRMagshXNJRgD
         U0ijXe77G5iOkF9O47FQDhyVc9wFCzrA12tBEpOliRahH3LDCAcrRUv4G/Hm7G3x9j7k
         qDENHXM7GRQ2GXUpoLpNNw0urEaqvLZUYkjJQKTnClOTzLocA+lqK9i5gN7C+LOGxCgc
         AUv7oCr6FPFMdLZ9r7nOymZdR4mk6TLhNj1bbA3bS1EdLiluTDVUQonkfCnxRcAkwnFa
         r/Vn0isEitxaDjmmOmt22OhAgrS14nga8R18uQWJ5Mzm5riHmF87Bx9+vimjbYpoR/tm
         DD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791712; x=1766396512;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HD9BBJU0e1MmcNRgmpeJcbkLD64hxkGHNzeKFm27JsE=;
        b=RFqdk5m9lmATCGUTiAdAklAnxDw0fdQ3VxZ5/QTOPjC/1mzYVhCjCQZlE59W2ra1Lc
         E4GJWBoT1fC2h8kVi159WTxY5yN5O1ElXk9p+zB1eh8VHOATCSykxu8/mI4JLZ60vNTx
         fYFWK/1r2ZT/EKBm5nMohAwYCwCT2yIaue4Q2lKNRsbGJDdtYQhXBMi5D4CTwAUNBH4X
         6vyMEZHhfssp5pnGH0bwm30hCfqFb50vjiO4kEC5/l9q1O1drNUKkikOvbRHDgK+ROOH
         2RGVcZ0l8o4M5zZhxzEKqyfgps1nkrd0aO30aVpCy22K7O2lLBzob7c0Jbvn00dRWKxe
         5ibg==
X-Forwarded-Encrypted: i=1; AJvYcCXSDaVoYz5oxBVR2Ja9v+Sbbzwum6BobZkHcwfEf+WQkvKsFJqpiiU8DAlMTpFWSsC7ckFjBZ7hRnk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxXK3RlCOd45bU593o53Ry5S7EaR4tWY6v7ARoNa5crKFT4HOW
	iVYUq2/EgqxRm+wRzn3GS+BEc3PZNwxlto7fTn0qKu3QUwifUb/3ra22L4DxIWWFpg==
X-Gm-Gg: AY/fxX7KH8uBZCMeGrAT7/G5oMb69ppQveyeCKw3rsYvILNaZfAKpJq+bAsYs+9RgBR
	bn+xF2At9JrvqvlesgKRFAyQoUTwQbDi3P/r2/UtwtyALR/4ArnqnaIChl6HSqjEGWEWy1Aw6C3
	C34mP1bnTglxCuRMA74LM26Mupx+61S09mXOGvKkhrcpF3bkVp7xNehnEBE304/dSbdhcE6k12R
	fw1R/tXm6hH9IycPg7lHjJwYzLXqzajJuGysFtwN1TRppx6LmlzUMigrqfPEBoU9rGjmt/yyBZk
	l5dAaQkGfSQ13hPTk3n2vxLnwCerriFt1A+8ONVUPZndKCDN8Dn9ZTM7ifCSOT9zEmqbJzK5HPp
	KQbXnuECxcFcEDBc0iW6zUPyk8cLPBqW+Swy16d6yp859/+Cs89WSpJxWOFkhGECHoP7wPmbSME
	KIufbNfdGJiQPUaaJpwmDNknsFGyCI3PmAQAaT1myDZjhKcId/s3d02GhefpDWQEbaoL6+Sl586
	BA=
X-Google-Smtp-Source: AGHT+IFc9/2z0Ls5hD05ZsromCvWsGeCSIMIITkL3humZFikzdcshM0+ed+f35gs3VvK33y4cLsfkg==
X-Received: by 2002:a05:600c:524c:b0:477:73cc:82c2 with SMTP id 5b1f17b1804b1-47a8f8c4334mr103126545e9.9.1765791712297;
        Mon, 15 Dec 2025 01:41:52 -0800 (PST)
Message-ID: <7beb1c09-dcbf-4cc8-ae90-cd9151ca97e1@suse.com>
Date: Mon, 15 Dec 2025 10:41:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Undefined behavior in libxenvchan
To: Demi Marie Obenour <demiobenour@gmail.com>
References: <e06eb432-289b-447a-8c3d-43da4705b4e9@gmail.com>
 <e0c8ffb0-a916-4c78-bd5f-010b9a7a8bc3@citrix.com>
 <bdf22b1a-49b5-43d4-8dfc-178c0076c917@gmail.com>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
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
In-Reply-To: <bdf22b1a-49b5-43d4-8dfc-178c0076c917@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.12.2025 00:08, Demi Marie Obenour wrote:
> On 12/14/25 17:50, Andrew Cooper wrote:
>> On 14/12/2025 7:09 pm, Demi Marie Obenour wrote:
>>> I noticed that libxenvchan has undefined behavior: it passes pointers
>>> to guest memory to memcpy() even though they can be concurrently
>>> changed.
>>>
>>> Would it make sense to reuse some of Xen's copy_from_guest() code
>>> instead?  There might be a licensing problem (GPL vs LGPL), though.
>>> I think the only approach that isn't UB and has decent performance
>>> is to do the whole copy in assembly.
>>
>> memcpy() is well defined.
> 
> Rich Felker wrote otherwise on the musl mailing list.  Specifically,
> it is undefined behavior if the data is changed while memcpy() is
> accessing it, either for reading or for writing.

Aren't you talking about undefined-ness beyond what the C spec uses the
term for? Of course it is always unpredictable what the result of a
function will be when you fiddle with its source behind its back. But
that's not of concern as far as safety is concerned (while the
correctness issue that results is solely a problem for the party doing
the undue modifications).

What we need to guarantee is that whatever copy is made of whatever
in-flight data, any sanity and consistency checking as well as subsequent
use would take only the one, exact same copy of source data. Which, as
Andrew said, may require some extra barriers, while using memcpy() for
the mechanical copying ought to be okay.

Jan

>> The problem is the potential for creating TOCTOU races if suitable
>> barriers aren't used, due to the compiler being able to optimise through
>> memcpy().
> 
> The concern here is about races in memcpy() itself.
> 
>> Xen's copy to/from guest are not appropriate in userspace.  They're
>> guarding against pagefaults and address ranges not belonging to the
>> target context.
>>
>> If more compiler/smp barriers are needed, then that's the appropriate fix.
> 
> Rich Felker suggested to use an open-coded memcpy() that used volatile
> accesses.


