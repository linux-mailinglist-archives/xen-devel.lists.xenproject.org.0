Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E93C698A940
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:58:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807537.1219075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svIn9-0004dg-Ut; Mon, 30 Sep 2024 15:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807537.1219075; Mon, 30 Sep 2024 15:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svIn9-0004bQ-RV; Mon, 30 Sep 2024 15:58:31 +0000
Received: by outflank-mailman (input) for mailman id 807537;
 Mon, 30 Sep 2024 15:58:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svIn9-0004bI-7E
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:58:31 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5c8d5bc-7f44-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 17:58:29 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so957274166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:58:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2948355sm563678366b.142.2024.09.30.08.58.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 08:58:28 -0700 (PDT)
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
X-Inumbo-ID: d5c8d5bc-7f44-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727711909; x=1728316709; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GYwhdxQhci2t5PwMPxDd3nFw4T+kEFDO+CU+MsP6kBE=;
        b=DP/PrH6LHRFJbHTR4XK+MaNT+yjt9wL+Ap18otIa9fO9og4NQx6kN8DMWmS1G7NZSe
         vCS3PGUXfSIn73S79nTvZ3pBONfCklykofPh2Mn7aDZOQTloacCKp5ghsA20Ogg3TEkB
         hLg6FIvp6LVUqFgYQ1Ozh10Oq3aYUmZRAJINtwUTNDL6WS2s1q5USGMxfO9bdw7WAP9m
         VOo/zV23woHea72kuzURH9+I5D96yrJJnxugfdm/sE4puf9zUwStqeIcGp6alEFzSAfu
         ExvniWBaJmcAbJwbRGm1LesCltKcg0tPuf7yR5LpXDj/nudqBZPVYmg4ZVEMgRdF5NFf
         oxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727711909; x=1728316709;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYwhdxQhci2t5PwMPxDd3nFw4T+kEFDO+CU+MsP6kBE=;
        b=D0Fs0YY1hFb3Clio3kw8ndownLOcov8iDAsS3k33QSUfa9CQjtiXPNHpiZUOhNB453
         Ze3D7gsc+GqWUMKKZR17IviozfAv/wQAyXzvKTkzfBsjErMIP+BFmw/QFhOurnK44m0y
         bLoYn+Sa9u+/EKi5xJPfquizMGVZ5m4hr69sp+mSHXYW0Gl5ClA88ApDZVucq521TiLS
         lWrsZUJp/zo70C0b/0NAnQuj2ymqs/t7zNpSFWz2chYKsMIIPbOQrgAC0Cy8+pJDQ2+e
         dgK++VGhigksW61y0Ab+5zxbHr1h3Z10lr5wb1D+Qo7+1XxCyn5g4ioSfHJMk1DX4vBo
         fQ0g==
X-Forwarded-Encrypted: i=1; AJvYcCVGjajaU6HvhTgvqY3dZ6kiue6LXk2bIj56XeTFGyydtAJ3LJorRh9EJsvkHazIKhv9ss6RZBe2jFs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy80IY3DLNs1Whk6pnHiPWaXj3hbE0C7DXlZ+FUn80vRiUqsIas
	R0aP/suoQmom4qA8C++77CE5W/FtrJA9kuzUeputyMHp3JsvkWLIfe1IluYX/w==
X-Google-Smtp-Source: AGHT+IHaR6hITWChK6Ygbi1mOomVwUwiN8cK2i42OXestQvEmOYoiFJBDsgFuvvecGPkqTjoAB8g7Q==
X-Received: by 2002:a17:906:4fcd:b0:a8d:2fdb:b449 with SMTP id a640c23a62f3a-a967bf45259mr9901766b.16.1727711908714;
        Mon, 30 Sep 2024 08:58:28 -0700 (PDT)
Message-ID: <47d3a709-491b-49c8-8c16-7576141282d2@suse.com>
Date: Mon, 30 Sep 2024 17:58:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: move per-cpu area management into common code
To: oleksii.kurochko@gmail.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <d52cd7cddb09c3b87bc4c66458f619dbf7ac214f.1727365499.git.oleksii.kurochko@gmail.com>
 <78a03796-e8b7-4ecc-935b-662304c7984d@suse.com>
 <183f0be3788bd281067d32d35d7aedfe07bf84ab.camel@gmail.com>
 <a8b3312987d8944b6720b66bd098fa36409b98ec.camel@gmail.com>
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
In-Reply-To: <a8b3312987d8944b6720b66bd098fa36409b98ec.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2024 17:56, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-09-30 at 17:50 +0200, oleksii.kurochko@gmail.com wrote:
>> On Mon, 2024-09-30 at 15:25 +0200, Jan Beulich wrote:
>>> On 26.09.2024 18:54, Oleksii Kurochko wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/x86/include/asm/percpu.h
>>>> @@ -0,0 +1,14 @@
>>>> +#ifndef __X86_PERCPU_H__
>>>> +#define __X86_PERCPU_H__
>>>> +
>>>> +#define PARK_OFFLINE_CPUS
>>>> +
>>>> +/*
>>>> + * Force uses of per_cpu() with an invalid area to attempt to
>>>> access the
>>>> + * middle of the non-canonical address space resulting in a #GP,
>>>> rather than a
>>>> + * possible #PF at (NULL + a little) which has security
>>>> implications in the
>>>> + * context of PV guests.
>>>> + */
>>>> +#define INVALID_PERCPU_AREA (0x8000000000000000UL - (unsigned
>>>> long)__per_cpu_start)
>>>> +
>>>> +#endif /* __X86_PERCPU_H__ */
>>>
>>> With this file appearing, doesn't arch/x86/include/asm/Makefile
>>> want
>>> the
>>> respective line removed?
>> For sure, it should be removed ( as it was done in previous patch
>> series:
>> https://lore.kernel.org/xen-devel/e573f9d46e7af0806381f6a41af00dc415bf87bb.1727185495.git.oleksii.kurochko@gmail.com/#Z31xen:arch:x86:include:asm:Makefile
>> ).
> Actually there is the same removing in this version:
> https://lore.kernel.org/xen-devel/183f0be3788bd281067d32d35d7aedfe07bf84ab.camel@gmail.com/T/#Z2e.:..:d52cd7cddb09c3b87bc4c66458f619dbf7ac214f.1727365499.git.oleksii.kurochko::40gmail.com:1xen:arch:x86:include:asm:Makefile

Hmm, you're right. I checked more than once before writing that part of the
reply, and still got that checking wrong. I'm sorry.

Jan

