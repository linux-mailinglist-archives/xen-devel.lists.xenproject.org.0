Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF2A8734D1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 11:50:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689046.1073973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhopj-0005OP-Ky; Wed, 06 Mar 2024 10:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689046.1073973; Wed, 06 Mar 2024 10:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhopj-0005ME-Hr; Wed, 06 Mar 2024 10:49:11 +0000
Received: by outflank-mailman (input) for mailman id 689046;
 Wed, 06 Mar 2024 10:49:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhopi-0005M8-MA
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 10:49:10 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 290ffb3b-dba7-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 11:49:09 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so9623885a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 02:49:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ij26-20020a056402159a00b00562d908daf4sm6745630edb.84.2024.03.06.02.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 02:49:08 -0800 (PST)
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
X-Inumbo-ID: 290ffb3b-dba7-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709722148; x=1710326948; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CpnzL7zGupMqwZS40pL/dZlKvEN0NLrUTaa9NvbyAoM=;
        b=JYs1g8R+D+DnNnLkrOpAj/wo+Wr+MCz3DFJHOcrWrL8bcGMrAxDKc9C26pGOUMqBOd
         RqB4keqi19tT4WM7cdeNF52i1rg7HO79fKaNY7zyEX1/H7WX30zWHHrUcmup+VFAN1Pi
         ozkqvbSSSfG0PIW9+Hyud4kQyT/M2l9eGhC9zsOVjh2ABIQ5cHLWpQjYg9VVaGn7JSaL
         r3kOWLlmJIqKFrx4334oMsARYb3cHIy4+0T0HndDe/YxAVG39tLGlIrYzR+ZXpOUY+83
         Hq2vtD9xNFka676qHiIFGnaJRjgITzV9I2+aMvnPEzl6ztf8H+c1VpprWVz5kJSXFCPk
         T/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709722148; x=1710326948;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CpnzL7zGupMqwZS40pL/dZlKvEN0NLrUTaa9NvbyAoM=;
        b=R73FS5Ar5IxJ2+8pp6VZSZdApAsJWUjJyVml95DId7JqMYDvsLP7sZX7jjP/mqQz0T
         VNmH2UA7KDIVD0VT51Bk/0W0GsEIXi7DIzRGRppSh6jfJqAWqnLPlrEglDGsICI8nEJ1
         U9RIyheCHDTrXpwGvHJVV/4tHnNtqWnWP7Wdt0yVkwWamZSgU0MEMoR97FhD12YRsZL3
         4u9R1EXBD9qLkSPuRfU5n/k1mqnZlm5eLrt6O7eyfm3+hXsbrKqM5ldZqpFIzdtUgyEH
         2bvYxKKCeBd8rqLLqan+SaMH7uKaiQwq7eQwDvTTdizfIkGN5ZeUmFk8DuHKM41lQLAh
         Q3GA==
X-Forwarded-Encrypted: i=1; AJvYcCVzqZAgk8YeR6Xz0WYzwHjjwsdhYDx55BRoXXFv/vfXlU8/D0o+NMHPdpvm9jOfD51ZsgKOsrwTLbxgdZNGNGH6Dl0K6i2YpT9Jd3XVs/s=
X-Gm-Message-State: AOJu0YwmlLm6Gw6gn+fX9SxV+6264LqFoWSZojcuNSfLFOs3yaktUOIU
	vgI4AXmKLYtBUdwniweyhN4+zMXQCL6ckMeBVAjlnLatiFo91oy9aATfONJ/cw==
X-Google-Smtp-Source: AGHT+IFUN9UXNnj0k0OuNO67KcXEKO/L6tJID18TJdIiegsPnO+4ye8+qQ9VHMUQEauIlMzOKwQXmw==
X-Received: by 2002:aa7:ca4e:0:b0:567:f4ea:1066 with SMTP id j14-20020aa7ca4e000000b00567f4ea1066mr528355edt.18.1709722148652;
        Wed, 06 Mar 2024 02:49:08 -0800 (PST)
Message-ID: <54bc9b3f-27af-41ea-9ab4-f35d38fe995d@suse.com>
Date: Wed, 6 Mar 2024 11:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/entry: shrink insn size for some of our EFLAGS
 manipulation
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0ba4903d-638d-408e-bcd4-7c13cb56e078@suse.com>
 <76cdb4b4-a9f5-46e6-bb30-515ffb37c45a@citrix.com>
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
In-Reply-To: <76cdb4b4-a9f5-46e6-bb30-515ffb37c45a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.03.2024 11:33, Andrew Cooper wrote:
> On 05/03/2024 2:04 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -52,7 +52,7 @@ UNLIKELY_END(syscall_no_callback)
>>          movq  %rax,TRAPBOUNCE_eip(%rdx)
>>          movb  %cl,TRAPBOUNCE_flags(%rdx)
>>          call  create_bounce_frame
>> -        andl  $~X86_EFLAGS_DF,UREGS_eflags(%rsp)
>> +        andb  $~(X86_EFLAGS_DF >> 8), UREGS_eflags + 1(%rsp)
> 
> The other adjustments are fine, but what on earth are we doing with DF here?
> 
> This looks straight up buggy.  We've got no legitimate reason to be
> playing with the guest's view of DF.

This is the PV equivalent of the SYSCALL_MASK MSR, isn't it? With it not
really being an (emulated) MSR, but an agreement that guests will only ever
care about having DF cleared (besides the requested way of dealing with the
event mask). One of the many things not written down anywhere ...

Jan

