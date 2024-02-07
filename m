Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7055A84C8F1
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 11:48:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677415.1053990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXfTo-0006Zl-Uh; Wed, 07 Feb 2024 10:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677415.1053990; Wed, 07 Feb 2024 10:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXfTo-0006Wo-RI; Wed, 07 Feb 2024 10:48:36 +0000
Received: by outflank-mailman (input) for mailman id 677415;
 Wed, 07 Feb 2024 10:48:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXfTn-0006WV-Fa
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 10:48:35 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70d9e490-c5a6-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 11:48:34 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40f02b8d176so3785465e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 02:48:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c154800b0040fb03f803esm1680514wmg.24.2024.02.07.02.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 02:48:33 -0800 (PST)
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
X-Inumbo-ID: 70d9e490-c5a6-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707302914; x=1707907714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXwRRf/nnbvG7KmptQ7/e+l/dIAGEq4cgunLwMG1JXk=;
        b=JC7p90hRYEno9M0B+BeO8924VyJq3wCXPQgqJaOrBqpM65WcWQSIXSBCN7U2c6DHjD
         v5DqH5HtqrIVBGwzN/nIfBc9wSNw0yQBQn/K1kSKet8xGjCdPMRXSD07P3bWnpEiKHTb
         Ck1LI8acgfluONIvvKaPcOG7ewwdRbxbB8U3mLhA3L5K3DUTTiM49WYXiyTp8SLzGCuo
         aTOtHFONEK5Jb8ne3QJ9i3Amo/RRJVehhK4IfNCCe687PPnaS233qYJfQnmSDxKZYqds
         MeNiTGC8sKHVlAn2WVgzZi1SU2CZVAjBLzyPH4FJu2hBkjbD9gb968q8xkVaStgSMaao
         pOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707302914; x=1707907714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXwRRf/nnbvG7KmptQ7/e+l/dIAGEq4cgunLwMG1JXk=;
        b=Vu5G5Mdco9Rfgsu3yqt/IucXUsqUdfa/0qCE9p6dYDhU0W0TJhC14pNJR7KNjT1eU1
         sKcSn7Lg1/3U2GikoSwEor8QXafPzxLrYJ9lNG5k5JQmfCT29Iw6IXf4naED+t6JwKlY
         fUuMBaFssX8i5mcaLDLRjUChFvJJPIktUrsNz74OxlClhUM/Ic8Op808cJTHhN9BMcLt
         8fh3Z9yh9xGTWcUa48Mp2bLQ5hvWT+hws/DqKA/flEv6Vc9HbjK2xY1owKD1TWdgu5lo
         6R4dnWX7QQo9Z5A1sYc7X5BEf7JKDUCj+7BF/IpFRPMuSSOZkwx+MTn6h6FpBniyafOX
         27XQ==
X-Gm-Message-State: AOJu0Ywrke34ghe0tKWiOIxE5eIQEDLdqm2bk8NKfYfaecSzwJEIy5TD
	PFk45AESkn4ib3sK6PjfP2ktjUWNnTVfot0zxeqKVmyPLewHvRyadhW15EgMbg==
X-Google-Smtp-Source: AGHT+IGiLc4QV7DVNoUGCkQbRF7166JsL6KNp8eQa8LrGBOEb2rI7WquPcxVG5PwJ1xSLI6U01XDXQ==
X-Received: by 2002:a05:600c:45d1:b0:40f:c1f9:c884 with SMTP id s17-20020a05600c45d100b0040fc1f9c884mr4176401wmo.39.1707302914004;
        Wed, 07 Feb 2024 02:48:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWoiWl2zL3zvjnz1eJumKb8cZBB3U9k4GIpGgLd+mcRrw9aQU5IK/qC9zjl5a0qGiQV8cjf5cHKd60bZzDzaw9SJgDP3ZpRrLa29YeF2gzJfrDFLuzrcwIL5NB5zv0toYJx0F+xOY3YkVp9wdYxHCRVf/HV+DCvR8hcNSX6xQ==
Message-ID: <161c2e1f-0c43-4391-bee3-1f94d27ba036@suse.com>
Date: Wed, 7 Feb 2024 11:48:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Mini-OS: x86: zero out .bss segment at boot
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: samuel.thibault@ens-lyon.org, wl@xen.org,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <20240207103138.26901-1-jgross@suse.com>
 <6ba32907-2d35-4dcf-ba3b-409984f1d877@suse.com>
 <13ac1a21-8275-4e7a-859d-41d8cb0aea76@suse.com>
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
In-Reply-To: <13ac1a21-8275-4e7a-859d-41d8cb0aea76@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2024 11:46, Juergen Gross wrote:
> On 07.02.24 11:39, Jan Beulich wrote:
>> On 07.02.2024 11:31, Juergen Gross wrote:
>>> --- a/arch/x86/setup.c
>>> +++ b/arch/x86/setup.c
>>> @@ -184,6 +184,8 @@ arch_init(void *par)
>>>   {
>>>   	static char hello[] = "Bootstrapping...\n";
>>>   
>>> +	memset(&__bss_start, 0, &_end - &__bss_start);
>>
>> Doesn't / shouldn't the loader guarantee this? I ask in particular
>> because doing this here implies earlier assembly code may not write
>> to any variable in .bss (nothing like that looks to exist right now,
>> but who knows what may be added at some point).
> 
> Oh, am I misremembering that the hypervisor doesn't do the clearing?
> 
> I do remember a bug when dom0 Linux crashed due to a not zeroed .bss,
> so I added the zeroing in the paravirt startup code of the kernel.
> 
> But maybe this was due to a bug in the linker script of the kernel.

That's what I recall.

Jan

