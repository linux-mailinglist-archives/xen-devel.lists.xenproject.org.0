Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 745E18425A1
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 13:59:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673336.1047694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUnht-0005XO-Cw; Tue, 30 Jan 2024 12:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673336.1047694; Tue, 30 Jan 2024 12:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUnht-0005UF-A6; Tue, 30 Jan 2024 12:59:17 +0000
Received: by outflank-mailman (input) for mailman id 673336;
 Tue, 30 Jan 2024 12:59:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFHt=JI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rUnhs-0005TL-Dl
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 12:59:16 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f5157cf-bf6f-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 13:59:15 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33ae6f4fd78so1799076f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 04:59:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bs14-20020a056000070e00b0033aeba36b7csm6059848wrb.57.2024.01.30.04.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 04:59:15 -0800 (PST)
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
X-Inumbo-ID: 5f5157cf-bf6f-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706619555; x=1707224355; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y46pMYdg8Umezh48UzNmq8ws/1WAGzLS1jgcWOIDxLE=;
        b=Br9gAdIxtzijyrORRXSr8t7gFq+lmPmD1h4rvlauUiMbgiKrR03cltaHE3Z8nXU8z4
         DaDmm4Xak0aWlJDu6oPbaQsBjpyULbhvW+t2+Jm1nuWI/UZS7pNyQFLhdyptrOdSXe44
         WOG9dpipeD2zeQ23GYgGAJNMKCTKpsRBWVP33ELHFKQ01uNZhZ69D/VpgHDnc3NbpBTD
         u7dPnkWTQ7pw7br9/SpTu+M5TQuKgcslA1yBHxX6TS6gEspCnb/Bk8A/1PfwbW5ORJyC
         T0Q6nX1dHeQBCzXHasq+ACKlymq/uzaKfDJm6zqubCLZ5yxuLP8I1wR8i9X5Q9ircf6N
         Zlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706619555; x=1707224355;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y46pMYdg8Umezh48UzNmq8ws/1WAGzLS1jgcWOIDxLE=;
        b=txxz7NvAmpLCnL5Ym6iMhi67M7rlEUbKtT/i7Q6KmDu4RG6zcdUi0iOtziL+jET2YG
         83TfhRvGNJ+pc98t9+b2ZYgO6vxSN5qlagvvolZNrtIFUlOn686aT0FQ/uFv88bvIm70
         6BK805K21O99LXzssLolT23wUwBUjTYd9HjuDNK9WCWO5KhPvhR/N9nECNcFz/Mwmyjh
         bClBtQIX+di9jympK5ppyDArPl3Chw7Zg2CO6GMMggh17q3Fn2JRe6XJqYhJYtlO3f4J
         81VPxBdyrTEWxFONCdkPbZ7Y58WhBXLu1fy7uLgZfEcKA1sM6xep333DPUy+Pta5SBec
         ktXg==
X-Gm-Message-State: AOJu0Yy0EWacayQdMpMoHrZYFvpSXkMn29fudaheO95HFSnyzv+5g6d4
	RYwglCegIS477CmZxotv0tX8H04xg9O332gRQ5RwGJlCra138MIRI0oZDSHJRg==
X-Google-Smtp-Source: AGHT+IEWIv59LuVLr0sUo5ZLwLNSJVgtBDCZHyP6g5GkWFd0g4qCMhxFSDQAYCWBDHoKIu1y+EiB+Q==
X-Received: by 2002:adf:e584:0:b0:337:c097:db9f with SMTP id l4-20020adfe584000000b00337c097db9fmr6809777wrm.17.1706619555298;
        Tue, 30 Jan 2024 04:59:15 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVhAS+vmGLmA3x+xSWpyUIVaYWJHmHDBHCoaZ6A5UBdLg6erqBKGkuaoeOLsExmUZdadesbNkCO4MivXHsAHmv9XzS61f4GPJ5lBruDf0oM3Bs/h4AKWl8wItk=
Message-ID: <0ad880e8-0f2b-4519-971e-c98b3411fba5@suse.com>
Date: Tue, 30 Jan 2024 13:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/intel: expose IPRED_CTRL to guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240130091400.50622-1-roger.pau@citrix.com>
 <20240130091400.50622-2-roger.pau@citrix.com>
 <3959f556-6177-473e-a052-bec11b5a8a9b@suse.com> <ZbjmS2oLAV7Fyqdn@macbook>
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
In-Reply-To: <ZbjmS2oLAV7Fyqdn@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.01.2024 13:06, Roger Pau Monné wrote:
> On Tue, Jan 30, 2024 at 11:57:17AM +0100, Jan Beulich wrote:
>> On 30.01.2024 10:13, Roger Pau Monne wrote:
>>> The CPUID feature bit signals the presence of the IPRED_DIS_{U,S} controls in
>>> SPEC_CTRL MSR.
>>>
>>> Note that those controls are not used by the hypervisor.
>>
>> Despite this, ...
>>
>>> --- a/xen/arch/x86/msr.c
>>> +++ b/xen/arch/x86/msr.c
>>> @@ -324,6 +324,9 @@ uint64_t msr_spec_ctrl_valid_bits(const struct cpu_policy *cp)
>>>      return (SPEC_CTRL_IBRS | SPEC_CTRL_STIBP |
>>>              (ssbd       ? SPEC_CTRL_SSBD       : 0) |
>>>              (psfd       ? SPEC_CTRL_PSFD       : 0) |
>>> +            (cp->feat.ipred_ctrl ? (SPEC_CTRL_IPRED_DIS_U |
>>> +                                    SPEC_CTRL_IPRED_DIS_S)
>>> +                                 : 0) |
>>>              0);
>>>  }
>>
>> ... if I'm not mistaken exposing SPEC_CTRL bits to guests is independent
>> of whether we write SPEC_CTRL on entry to Xen. Therefore I think in the
>> description it wants clarifying why it is acceptable to run Xen with the
>> guest chosen settings for at least the DIS_S bit (assuming that it is
>> okay to do so). Likely (didn't look there yet) also applicable to the
>> further two patches.
> 
> "The added feature is made dependent on IBRSB, which ensures it will
> only be exposed if X86_FEATURE_SC_MSR_{PV,HVM} is available, and that
> ensures the value of SPEC_CTRL will get context switched on exit/entry
> to guest."
> 
> Would adding the above to the commit message clarify the intended
> implementation?

It would improve things, at least hinting towards there being a connection
between exposure and updating on entry to Xen. I'd like to ask though to
avoid "context switch" when talking about entry from guest context. While
in a way technically correct, our normal meaning of the term is the
process of switching vCPU-s out/in on a pCPU.

Jan

