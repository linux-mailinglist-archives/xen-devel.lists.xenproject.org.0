Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4179E908397
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 08:27:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740393.1147473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI0P6-0007iS-M3; Fri, 14 Jun 2024 06:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740393.1147473; Fri, 14 Jun 2024 06:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI0P6-0007gv-J8; Fri, 14 Jun 2024 06:27:16 +0000
Received: by outflank-mailman (input) for mailman id 740393;
 Fri, 14 Jun 2024 06:27:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sI0P5-0007gp-Bk
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 06:27:15 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 231680b7-2a17-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 08:27:13 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a6f0dc80ab9so282767466b.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 23:27:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f4182fsm149764266b.178.2024.06.13.23.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 23:27:12 -0700 (PDT)
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
X-Inumbo-ID: 231680b7-2a17-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718346433; x=1718951233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uiiGIfn0KxmgRHe7E3PFtjPcK8iBnXHQ2pGIajwaFEM=;
        b=X+A5G9OIM8BpvhT9gsN3o07R5tHO3DoOUOhnlQVog+x3Xw51sqi2kW1+iuaKF445xJ
         1s0WqaoEfsIks3Hma9iPxzJqJmkux60/HgQ5ve4HBb1ww+aaS1P9YWCsaL8rBjJFON+v
         AJdwV0sIjXaEwD/3yAmDgEwj+ZcwpMpkWtuj9Lm8dHS6CG1AUYeBJyWpK33sAVIGXBe/
         RHLDuqcJb1Av0/T9CD7VyLGs8wH1Qe/r0VXJ6c4JC2AHH82LZEqg+OK6cTIH8dNhmsam
         RDxmfI+AFu9JaZYhfhekAvRiMH34Kx3N07CccJZEGWhaEbpsqqAfjUpe0rUz1UTCuvBC
         MMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718346433; x=1718951233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiiGIfn0KxmgRHe7E3PFtjPcK8iBnXHQ2pGIajwaFEM=;
        b=Bx1dX1uFRdmRsqbz6tnq9mFaHy+7IohSSqM/hAjkxhgYPvm20ppPxnlC0Wr3lL9Vcf
         Tr4yuizbR8f4UQI0hSBU8H0swXF5NTEsuz8/TdFyXTDYxs9jJLIlrWpOlkXFG84WZ9yk
         EibJyv9za/y/J8ztlFUDNc3ifFfpAR4fOnskE92iNniKYWx8FaQH3Az1+36XZZLF3M+R
         hk/BxhryAk3a0n9eM3X47zEUG1h8j26mKhfSxY1qvslIfuzHiAWkEvgwHAdvCocf9rgx
         VV9H7tvQ5glmcZXto5MqKTnyvPWEJ+ePxIWnI2IQSeXPjAU2eCtH8NQnUSULnvKbMRmX
         LFqA==
X-Forwarded-Encrypted: i=1; AJvYcCXwtQY0WSZdoR1Mh3kwPx6z5y3ngEBnbLvoLjSBgQc4ukws5CifKRK1wgvKyJLSFPtEX01Daa+rDHqetDcLsbR7ODhfLdiECQUQHrlCgVk=
X-Gm-Message-State: AOJu0YxCnlCKRA6C29Dn0C3Q5VfkbJ6Qo6oyazPSFbHf/flfhk3cfG4S
	DaNnfJaF+R3owkkePERN/+dmtJx6dPeVWFj5pbab6ZynIa35HamCY5mbcGk1EQ==
X-Google-Smtp-Source: AGHT+IEZzlIwqPD90GoYGlKcMjMkKB1HtzNzQyksXMZRCRVxkORVHCCs11PdOI/z3vVWVoT153OX6g==
X-Received: by 2002:a17:906:388b:b0:a6f:1475:33a8 with SMTP id a640c23a62f3a-a6f60d29606mr105070866b.17.1718346432789;
        Thu, 13 Jun 2024 23:27:12 -0700 (PDT)
Message-ID: <e493035c-2954-418e-96fb-add1577df59f@suse.com>
Date: Fri, 14 Jun 2024 08:27:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.19?] x86/Intel: unlock CPUID earlier for the BSP
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <82277592-ea96-47c8-a991-7afd97d7a7bc@suse.com>
 <f51b2240-03da-4aee-8972-a72b53916ce1@citrix.com>
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
In-Reply-To: <f51b2240-03da-4aee-8972-a72b53916ce1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.06.2024 18:17, Andrew Cooper wrote:
> On 13/06/2024 9:19 am, Jan Beulich wrote:
>> Intel CPUs have a MSR bit to limit CPUID enumeration to leaf two. If
>> this bit is set by the BIOS then CPUID evaluation does not work when
>> data from any leaf greater than two is needed; early_cpu_init() in
>> particular wants to collect leaf 7 data.
>>
>> Cure this by unlocking CPUID right before evaluating anything which
>> depends on the maximum CPUID leaf being greater than two.
>>
>> Inspired by (and description cloned from) Linux commit 0c2f6d04619e
>> ("x86/topology/intel: Unlock CPUID before evaluating anything").
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> While I couldn't spot anything, it kind of feels as if I'm overlooking
>> further places where we might be inspecting in particular leaf 7 yet
>> earlier.
>>
>> No Fixes: tag(s), as imo it would be too many that would want
>> enumerating.
> 
> I also saw that go by, but concluded that Xen doesn't need it, hence why
> I left it alone.
> 
> The truth is that only the BSP needs it.  APs sort it out in the
> trampoline via trampoline_misc_enable_off, because they need to clear
> XD_DISABLE in prior to enabling paging, so we should be taking it out of
> early_init_intel().

Except for the (odd) case also mentioned to Roger, where the BSP might have
the bit clear but some (or all) AP(s) have it set.

> But, we don't have an early BSP-only early hook, and I'm not overwhelmed
> at the idea of exporting it from intel.c
> 
> I was intending to leave it alone until I can burn this whole
> infrastructure to the ground and make it work nicely with policies, but
> that's not a job for this point in the release...

This last part reads like the rest of your reply isn't an objection to me
putting this in with Roger's R-b, but it would be nice if you could
confirm this understanding of mine. Without this last part it, especially
the 2nd from last paragraph, certainly reads a little like an objection.

Jan

