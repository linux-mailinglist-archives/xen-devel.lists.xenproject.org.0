Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DB7838C52
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 11:44:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670358.1043072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSEGI-0003Hm-Ep; Tue, 23 Jan 2024 10:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670358.1043072; Tue, 23 Jan 2024 10:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSEGI-0003El-C8; Tue, 23 Jan 2024 10:44:10 +0000
Received: by outflank-mailman (input) for mailman id 670358;
 Tue, 23 Jan 2024 10:44:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSEGH-0003Ef-Jt
 for xen-devel@lists.xen.org; Tue, 23 Jan 2024 10:44:09 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55631ac4-b9dc-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 11:44:07 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cf16f2445bso2163211fa.2
 for <xen-devel@lists.xen.org>; Tue, 23 Jan 2024 02:44:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q4-20020a056e02096400b00361b2452601sm2429839ilt.15.2024.01.23.02.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 02:44:06 -0800 (PST)
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
X-Inumbo-ID: 55631ac4-b9dc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706006647; x=1706611447; darn=lists.xen.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tkE06AkiI7dJJtx8WaJ2ABwZaTr/7y/Xn5/Szq9POUk=;
        b=exxKNWigHJCNKMcLRUqJL8iMGj0Nfc99ftVqvFtpGjyEHRCXsddjOpfac14YcPXTkV
         qX3GZsf/RRMw02oy2sRiY7muXEY4kjh5T2m/Qq1Oy5tbQN+5hPkGeRbsU50laKFutPSe
         v7d0QYRC39GXP94/EAaX50Nrcna7cTzThATFg5AVdaGke0QkJsqJo8jv+XrUiiE2LbKG
         /scNlkKB4Fdd0/gYa0Zk2xMyPhhux+IqARdgX2hxwS2hdi48C8wv/nPyM5Mtoz4Yi5gV
         /+vlLeuDfGoNOSln9jnroOo1dPCfhp8yZ2dc7qJSK8adiJBN76oK3MFA0J+0g7ZEQapt
         Y/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706006647; x=1706611447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tkE06AkiI7dJJtx8WaJ2ABwZaTr/7y/Xn5/Szq9POUk=;
        b=iXefK7fAtpYiHIHAwT7WPc4/Q71Ihh/8v5ZrB42BjlKfA+Dtx8ddyYT8n/4ZgcHJyB
         wgKLrvML9x84nU7TJnMffgjV0UyuvUf1xKgJFvVYSiUm9FSdhHfn6ERHsebtrJUwn+l5
         kYFjPQ0PK9w5LaqOte2ZC1eOpL8EXh6ip9UhPSclbhYPrzx9ole9uJsITgGL3ocNjykK
         F/LkGScT6dx3QgEhplf3k//LCEZPyNl7Ldm4rjJDZ7B7W6Wzhj48BiQD9bSdXrTgFQfo
         4U/6j0u4d6uRpxcrXaxcuSM2yO3tEphKJqmXH8OxNdKLmrtAEmUdrXpFvzXadLRb21TB
         MZhg==
X-Gm-Message-State: AOJu0Yz2BgozRilIoxemqsJNYrEtyfKUd605JNNHKc6wxMhZ8romt150
	YzDjxeedqPTUzGmfkz449fgELqMDsC5YQHX9bRNOPsi0gv7jZj7eAZszocZWRMfK/NyGb7Aa07E
	=
X-Google-Smtp-Source: AGHT+IHWScdAzyUgxwyCGLn3LGShOw14e/OF43+q3ufLN2CIDbDVfRksn2JY7pAhh4LyxznZdldQtw==
X-Received: by 2002:a05:651c:1551:b0:2cc:6e7a:37a4 with SMTP id y17-20020a05651c155100b002cc6e7a37a4mr3382155ljp.69.1706006646652;
        Tue, 23 Jan 2024 02:44:06 -0800 (PST)
Message-ID: <111f5551-70fa-4ded-a62a-e0aa967b3c29@suse.com>
Date: Tue, 23 Jan 2024 11:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thoughts on current Xen EDAC/MCE situation
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
References: <Za7Vr+Rb25y/+MSy@mattapan.m5p.com>
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
In-Reply-To: <Za7Vr+Rb25y/+MSy@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.01.2024 21:53, Elliott Mitchell wrote:
> I've been mentioning this on a regular basis, but the state of MCE
> handling with Xen seems poor.

I certainly agree here.

> I find the present handling of MCE in Xen an odd choice.  Having Xen do
> most of the handling of MCE events is a behavior matching a traditional
> stand-alone hypervisor.  Yet Xen was originally pushing any task not
> requiring hypervisor action onto Domain 0.

Not exactly. Xen in particular deals with all of CPU and all of memory.
Dom0 may be unaware of the full amount of CPUs in the system, nor the
full memory map (without resorting to interfaces specifically making
that information available, but not to be used for Dom0 kernel's own
acting as a kernel).

> MCE seems a perfect match for sharing responsibility with Domain 0.
> Domain 0 needs to know about any MCE event, this is where system
> administrators will expect to find logs.  In fact, if the event is a
> Correctable Error, then *only* Domain 0 needs to know.  For a CE, Xen
> may need no action at all (an implementation could need help) and
> the effected domain would need no action.  It is strictly for
> Uncorrectable Errors that action beside logging is needed.
> 
> For a UE memory error, the best approach might be for Domain 0 to decode
> the error.  Once Domain 0 determines it is UE, invoke a hypercall to pass
> the GPFN to Xen.

What GPFN? Decoding can only possibly find machine addresses in what
hardware supplies.

>  Xen would then forcibly unmap the page (similar to what
> Linux does to userspace for corrupted pages).  Xen would then identify
> what the page was used for, alert the domain and return that to Domain 0.

Some of this is already in place. How well it functions is a different
question.

> The key advantage of this approach is it makes MCE handling act very
> similar to MCE handling without Xen.

While that's true, you're completely omitting all implications towards
what it means to hand off most handling to Dom0. While it is perhaps
possible to make Linux'es chipset-specific EDAC drivers Xen PV aware,
it might be yet harder to achieve the same in a PVH Dom0.

>  Documentation about how MCEs are
> reported/decoded would apply equally to Xen.  Another rather important
> issue is it means less maintenance work to keep MCE handling working with
> cutting-edge hardware.  I've noticed one vendor being sluggish about
> getting patches into Linux and I fear similar issues may apply more
> severely to Xen.

With all of your suggestions: Who do you think is going to do all of
the work involved here (properly writing down a design, to take care
of all known difficulties, and then actually implement everything)?
We're already short on people, as you're very likely aware.

Jan

