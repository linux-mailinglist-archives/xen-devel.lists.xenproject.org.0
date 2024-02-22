Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2BD85F502
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 10:51:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684287.1064033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd5jF-0008D5-J7; Thu, 22 Feb 2024 09:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684287.1064033; Thu, 22 Feb 2024 09:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd5jF-0008Ar-GI; Thu, 22 Feb 2024 09:50:57 +0000
Received: by outflank-mailman (input) for mailman id 684287;
 Thu, 22 Feb 2024 09:50:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rd5jE-0008Ah-7M
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 09:50:56 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de3d57e8-d167-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 10:50:53 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-563c2b2bddbso10915294a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 01:50:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i7-20020aa7c9c7000000b005649f17558bsm3062566edt.42.2024.02.22.01.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 01:50:52 -0800 (PST)
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
X-Inumbo-ID: de3d57e8-d167-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708595453; x=1709200253; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/EP+k7IchCG5AUxEyx665O9ED9ZcjaJbrg7Qwar7VTs=;
        b=ExWXdSD96ZNyupVREZ+C8OSEP/c2NxYy/UoIkIH9lsJ9loKgzfub6qcf1tKUL5A6a6
         y99LPIJQZvs9O70zwT+1wizWXgTpyelFe4ueEkcpKDzLTuQuPs9r38kQooFIMKNDjREh
         yZYiOFtKY1vgAa7cnELt45Vj5Hg5uylt4lcjyKQufK1T+5tddBzfnH5GowX7POg+Tbih
         dFHZHNhkwhFegxVZ5ktBN5fyI5uYU3/IZNFasEVvAJ5ddsDtvmnZ6xzyoaQkGaNMjHiY
         /vqH8ihDiCY5BUPuHJvfJ25M0nF+r1DQxLWhdRgq/VMZ/PR9bIpfqG19mWdfF/sI/rBM
         C6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708595453; x=1709200253;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/EP+k7IchCG5AUxEyx665O9ED9ZcjaJbrg7Qwar7VTs=;
        b=IZs4eYzafhkHD/oNruZEEtml49cUDm3UeR9vSzDjnIa7jAwyEklaGBH2f6TzQ/mv7W
         NqjT1vhgNT3sKmHIeQ1c0eYKbRrWE2nZcFOEG9109vX/19/E5XCDRxqGhI5I2Bl+y7gY
         WX1pXHXBq7R61N9xBGLWZ2BDIhm/+y6/Fj7zXhpse8yMWPDt2KLKytiXjYtthkZDVGQv
         P4UsgNn38M6uvDjL05esjyNart2MB46AqKekUL1wQtp+dGv+AG1rXjty2/p2njeih507
         /ja+aU6ZcjEhIiPQmHIjTlNok66Et1ieUge2A95sxzfvdpxfzM4Zx8xHGjrkB3i9yli4
         U96w==
X-Forwarded-Encrypted: i=1; AJvYcCVRuxtiraMylPZQB8JpVxsOCx0wsjjCf5lnvsZ4TJYDBddFfLTyZfzkyYyfVe2Mfv64zvwoZOWM02iD4AMcCrwerRx1JE+Inb5bDbLDJN4=
X-Gm-Message-State: AOJu0Yw5S7meng/72F/3rxbis6Psufu+CMLuZxV4ue5qR7DBkI9Wh3Yf
	r/0cSPi2J6U+evhwHi31flVXIVpf5zEm7jEPyMO/gkrXgPy1+/cIvmITMqcgWw==
X-Google-Smtp-Source: AGHT+IHW5ZOTMp+9xCGM1j/AxW7tmsK/1xvFIR/CmMt32p029fbweCpPbpPQENaKciF4xqvU5NyDNw==
X-Received: by 2002:a05:6402:6d5:b0:564:7bff:846e with SMTP id n21-20020a05640206d500b005647bff846emr6801868edy.3.1708595453131;
        Thu, 22 Feb 2024 01:50:53 -0800 (PST)
Message-ID: <40ff2158-78aa-478b-b591-02bbcb1bf88f@suse.com>
Date: Thu, 22 Feb 2024 10:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] nestedsvm: Disable TscRateMSR
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-5-george.dunlap@cloud.com>
 <c5f3a78c-4a2b-499b-93bb-11f60b0afcc0@suse.com>
 <CA+zSX=acH-4B01=vUBstAbsNBMVgcRe_A5v0eXn66BdsuPtgiA@mail.gmail.com>
 <74ef7b2b-b105-4060-afaa-73ec272a7449@suse.com>
 <CA+zSX=ZPKScDQO6XXGOp6gv1arEs4-iWTgX8NSezYo4LGqkoLA@mail.gmail.com>
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
In-Reply-To: <CA+zSX=ZPKScDQO6XXGOp6gv1arEs4-iWTgX8NSezYo4LGqkoLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.02.2024 10:30, George Dunlap wrote:
> On Wed, Feb 21, 2024 at 6:52 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> But then of course Andrew may know of reasons why all of this is done
>>>> in calculate_host_policy() in the first place, rather than in HVM
>>>> policy calculation.
>>>
>>> It sounds like maybe you're confusing host_policy with
>>> x86_capabilities?  From what I can tell:
>>>
>>> *  the "basic" cpu_has_X macros resolve to boot_cpu_has(), which
>>> resolves to cpu_has(&boot_cpu_data, ...), which is completely
>>> independent of the cpu-policy.c:host_cpu_policy
>>>
>>> * cpu-policy.c:host_cpu_policy only affects what is advertised to
>>> guests, via {pv,hvm}_cpu_policy and featureset bits.  Most notably a
>>> quick skim doesn't show any mechanism by which host_cpu_policy could
>>> affect what features Xen itself decides to use.
>>
>> I'm not mixing the two, no; the two are still insufficiently disentangled.
>> There's really no reason (long term) to have both host policy and
>> x86_capabilities. Therefore I'd prefer if new code (including a basically
>> fundamental re-write as is going to be needed for nested) to avoid
>> needlessly further extending x86_capabilities. Unless of course there's
>> something fundamentally wrong with eliminating the redundancy, which
>> likely Andrew would be in the best position to point out.
> 
> So I don't know the history of how things got to be the way they are,
> nor really much about the code but what I've gathered from skimming
> through while creating this patch series.  But from that impression,
> the only issue I really see with the current code is the confusing
> naming.  The cpufeature.h code has this nice infrastructure to allow
> you to, for instance, enable or disable certain bits on the
> command-line; and the interface for querying all the different bits of
> functionality is all nicely put in one place.  Moving the
> svm_feature_flags into x86_capabilities would immediately allow SVM to
> take advantage of this infrastructure; it's not clear to me how this
> would be "needless".
> 
> Furthermore, it looks to me like host_cpu_policy is used as a starting
> point for generating pv_cpu_policy and hvm_cpu_policy, both of which
> are only used for guest cpuid generation.  Given that the format of
> those policies is fixed, and there's a lot of "copy this bit from the
> host policy wholesale", it seems like no matter what, you'd want a
> host_cpu_policy.
> 
> And in any case -- all that is kind of moot.  *Right now*,
> host_cpu_policy is only used for guest cpuid policy creation; *right
> now*, the nested virt features of AMD are handled in the
> host_cpu_policy; *right now*, we're advertising to guests bits which
> are not properly virtualized; *right now* these bits are actually set
> unconditionally, regardless of whether they're even available on the
> hardware; *right now*, Xen uses svm_feature_flags to determine its own
> use of TscRateMSR; so *right now*, removing this bit from
> host_cpu_policy won't prevent Xen from using TscRateMSR itself.
> 
> (Unless my understanding of the code is wrong, in which case I'd
> appreciate a correction.)

There's nothing wrong afaics, just missing at least one aspect: Did you
see all the featureset <-> policy conversions in cpu-policy.c? That (to
me at least) clearly is a sign of unnecessary duplication of the same
data. This goes as far as seeding the host policy from the raw one, just
to then immediately run x86_cpu_featureset_to_policy(), thus overwriting
a fair part of what was first taken from the raw policy. That's necessary
right now, because setup_{force,clear}_cpu_cap() act on
boot_cpu_data.x86_capability[], not the host policy.

As to the "needless" further up, it's only as far as moving those bits
into x86_capability[] would further duplicate information, rather than
(for that piece at least) putting them into the policies right away. But
yes, if the goal is to have setup_{force,clear}_cpu_cap() be able to
control those bits as well, then going the intermediate step would be
unavoidable at this point in time.

Jan

