Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D76BA039F3
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 09:43:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866129.1277406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5BG-0005SB-5q; Tue, 07 Jan 2025 08:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866129.1277406; Tue, 07 Jan 2025 08:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5BG-0005QO-3H; Tue, 07 Jan 2025 08:43:18 +0000
Received: by outflank-mailman (input) for mailman id 866129;
 Tue, 07 Jan 2025 08:43:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tV5BE-0005QI-Ko
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 08:43:16 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fa4358f-ccd3-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 09:43:15 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso104862595e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 00:43:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436604e9c2csm591076955e9.43.2025.01.07.00.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 00:43:13 -0800 (PST)
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
X-Inumbo-ID: 6fa4358f-ccd3-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736239395; x=1736844195; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KVX8TXD0K8yavRQGZ6xlgaZrPxSoFb3ECczY36Sr0ts=;
        b=AUGDTEVxi3Z6t4XqzY10xrqMpk43q0iuP8+cbahjH3kvykbNNpzftJbBLNYynJ2NoU
         EsNyhCaNb302tzcWza2zaacO03HjcPR/nBEINA2nZZj80jtUtds17YmDtHpQoJRqP4xK
         fq0yDIQandqXJR9WL5QofE2uRo3NCTtEFCUL2lpxwmk6XC6s6dVY5sPrlUQ4DyuAqcSv
         exB6Ykw1GytOzKA3xr1EswRmuGpEa5JU8gXE8+2MPPAJOr2TUJwPQ1y2WR/sok00qjd5
         zZjyaUXTXSRNxtAhoe4mqYtIkS4BZ3+zG1aVqRg93x2JGth+vNaduJQk5IliLUqVmupE
         oA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736239395; x=1736844195;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVX8TXD0K8yavRQGZ6xlgaZrPxSoFb3ECczY36Sr0ts=;
        b=EwaR/yWyvSDqa7Qv85plBS0YrL1LG5oKuO41aeJgOvOUf6EBqiqi5Gbp41aUW2b4cm
         +vwh+m3wnXdtDju63hH7A4BiBpzFg4jIhsJW/HlGFrKBoKqybfFgIwsKZ4ysjS0HpLkY
         DOfHpgRkL4gBoEtMCSERFbtT20Cd+e8C2+gbXz5HSEOH+jQCZzKpMRTuoV3zOZmjlCvJ
         +HpYdc8eu1+yhspxdqGZwKO/baYD3jcrb41dMfU36+YfGx/sW7Lnc2z/yORCdDa4FmsE
         36G18xsL3UskHZGWisxQGHwgFNy1nwNhAd90zqv2SFANQhW0CfB/U8vCGcqwg154KbFl
         DjeA==
X-Forwarded-Encrypted: i=1; AJvYcCWorBhNsNZEZOGtDtlCufvNQokK3S1Dk98HovvRnwCzEPCQ+WlA3IqlbzrkEE5mO4ByWigIde6cmu4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6tzwgUqd7vt6wpXBNWfR13wpLXKuLsCoCOvONNWg3y2cWAGPD
	THPaGi4JqDEKMvrkwTTUBmjsmsWY3/IquqKOwltcQQYFO2qayDVNQV+U2AwTRA==
X-Gm-Gg: ASbGnctsnNG12Er7Ba8TmLzA6pP+cqG5L1ajkbC6lPPMAkp6pZrVViy8965WrYQgIMY
	utXv69u6wTIhHtfD93rD944YZMlMTdmLwiqZVc0STZr8Q0y+ZxndJ3c15CrWIojGonfOznIwFlc
	IhRlAwDGXWkyHSjLAS2XSy/7O+OoTRd3pNvdwsgu824RzJfMvDQXytQcBnEjdiiMZcCPbWjEBv4
	Zi/K3smG+zypim9hbGdvxa1AvbRrjBxqk5eblOZMmyuCYoTSu1oht+tWj6FU/TivC09L6ii15Dg
	Eu4edz7uHaFoGjm+A9NuR8FAVHAkRq0E8equ/+kNig==
X-Google-Smtp-Source: AGHT+IETx6/pe6aZkqMxcY2IUlIh4Ng4wuwM6se87+KRES8zpM6IYMfU6N4dQw7stYkfpU8vmlQt0g==
X-Received: by 2002:a05:600c:138d:b0:434:ff08:202b with SMTP id 5b1f17b1804b1-43668643173mr543395955e9.12.1736239395023;
        Tue, 07 Jan 2025 00:43:15 -0800 (PST)
Message-ID: <149856c5-d168-4ebf-9a1f-54be0105fd2c@suse.com>
Date: Tue, 7 Jan 2025 09:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/35] x86/hvm: introduce NS8250 UART emulator
To: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-31-e9aa923127eb@ford.com>
 <3be247cc-900b-48f3-98f3-0d97532ede76@suse.com>
 <DJo9IkTvGXsao_hA4njnkX9OVYVR6tXdo95AeBiT8wGtbPb7UKQjLCqqIset3bJ3JbLqogcIb4wPqNXJ-2GFwyrW_UIvRg5Nt9QhpG0hfyo=@proton.me>
 <5e4fb323-0dd1-4eb9-9e83-245ab516be06@suse.com>
 <V4pjEMTV_MhwDERhOJQksxnt1aNMN6cE5z0lRjvE-4R1cdBRizIaMikI1hNXYB0tei3ljgLOWVQkMITOEeeBYIsNQzblqB7g8jJJwalRzY0=@proton.me>
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
In-Reply-To: <V4pjEMTV_MhwDERhOJQksxnt1aNMN6cE5z0lRjvE-4R1cdBRizIaMikI1hNXYB0tei3ljgLOWVQkMITOEeeBYIsNQzblqB7g8jJJwalRzY0=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.01.2025 21:16, Denis Mukhin wrote:
> On Monday, January 6th, 2025 at 1:19 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 04.01.2025 06:31, Denis Mukhin wrote:
>>> On Monday, December 16th, 2024 at 7:04 AM, Jan Beulich jbeulich@suse.com wrote:
>>>> On 06.12.2024 05:42, Denis Mukhin via B4 Relay wrote:
>>>>
>>>>> + depends on HVM && HAS_IOPORTS
>>>>
>>>> Why HAS_IOPORTS?
>>>
>>> It is meant to highlight the fact that MMIO-based UART is not supported.
>>> It is not currently possible to enable the emulator for, say, Arm platforms.
>>
>>
>> That I guessed, yet you realize that HAS_IOPORTS describes a host property,
>> not (so much) a guest one?
> 
> re: host property: yes; this is meant to be only a guardrail for porting of the
> emulator code (if any) to other architectures, since there's no MMIO-based
> NS16550 emulator yet.
> 
> I will drop this superfluous dependency in the next iteration.

Just to clarify: If properly justified, I'm okay with the dependency to
be kept. Otoh the lack of MMIO handling will turn out as pretty obvious
if someone was to try to enable this emulation on an IO-port-less arch.

Jan

