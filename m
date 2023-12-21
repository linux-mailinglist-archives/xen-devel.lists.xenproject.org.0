Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 215F481AFE1
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 08:58:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658538.1027738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGDwc-0006Dz-ND; Thu, 21 Dec 2023 07:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658538.1027738; Thu, 21 Dec 2023 07:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGDwc-0006BE-KY; Thu, 21 Dec 2023 07:58:14 +0000
Received: by outflank-mailman (input) for mailman id 658538;
 Thu, 21 Dec 2023 07:58:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGDwa-0006B6-CA
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 07:58:12 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af2268bf-9fd6-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 08:58:10 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d2764c0f2so5931275e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 23:58:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m5-20020a05600c4f4500b0040c57e4ea28sm10174751wmq.17.2023.12.20.23.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 23:58:09 -0800 (PST)
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
X-Inumbo-ID: af2268bf-9fd6-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703145490; x=1703750290; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kCDGwXoUh2vP8rmkpjqZSMvOXZXoWj/OxWNHfNbVkOg=;
        b=LAHixWaTccQ3X161vnG+XT/UshxjOOi1zYAWINNJDfZJVxNUg1Cd/mV43X/ziuzlZX
         xwwx/ZByxZyelHYDIxaXfeb2Z1JH3DQL8QrradnWA3BclFkTh737D14aic0zaZj4PgHN
         WFKqkjLblX3PkVlI2oipyt3XXsO+IrQ5SxPLTDMn6MLhVZnEVH1OoZD+DJvyYX5S4qxC
         2mVW6R+PBG00gKycdaYSHJQ/tOwJS62vVNwfAuqz5wm7nURapO9dmfIbCx8phS1g1x61
         PXby2LJqcSB2sP1mgtozy6Otr38jANZbxVf42R/fonCpAiRKauaJmtAqSp5cm7Mvqf3F
         M5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703145490; x=1703750290;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kCDGwXoUh2vP8rmkpjqZSMvOXZXoWj/OxWNHfNbVkOg=;
        b=Yh6Wj6CvhFdL8myr+7sFjWxS/lg6MB9bhA+RvL5Bc+LxxrMrkM1vR1qBKmnTUAvkHq
         75WzvAnaq7fmx/H3W8gqM4Zxx/OeGe48sfFkm72ur+im43BnPHEZUJFDTR8QLwww1ejN
         POXKxLz4zEYK5ADwrsOmJRQDWdiPiwEYOLV+kgoq4uYH/J4fPRS1O5RVuVsiNV/8v6G/
         A8vzx4dOqG4bLDrn15gNgU7frhXYlrwYz+kZwIilJRvpHM/RI29vDUs62rofAJygYdMN
         DHQwjQlF/p6ISxIEaEZE3QsZ1xNTMp01o7/fjltlKvnI8wjtlBO/Zwcul+r8HEyGrymN
         /CdQ==
X-Gm-Message-State: AOJu0YwqCb6hx/dQHhgPk/Tf0kaXJIQ0plqGYmKSeYwC3Vkprns/ThBD
	ZilAr6Km7qwOhVljwHRnOrJz
X-Google-Smtp-Source: AGHT+IFvdG4SEdvE8qnqmrfifRRHomfLPLLbJnY9ZtcTKFvxxkQELZPCrx15Zn9LQyEPSDVYnESATA==
X-Received: by 2002:a05:600c:4f52:b0:40c:325b:6360 with SMTP id m18-20020a05600c4f5200b0040c325b6360mr446416wmq.130.1703145490096;
        Wed, 20 Dec 2023 23:58:10 -0800 (PST)
Message-ID: <5a896d14-d96e-424a-a2a9-f0fc92b3cbde@suse.com>
Date: Thu, 21 Dec 2023 08:58:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/39] xen/riscv: introduce arch-riscv/hvm/save.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <acb870b980a791d7800d47c08c9574275159df39.1700761381.git.oleksii.kurochko@gmail.com>
 <5eae9d9b-e499-4c8c-aed0-2f52c0aa7c9f@suse.com>
 <f890996c2b100c6ace1f853da2c293d2f9244ef9.camel@gmail.com>
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
In-Reply-To: <f890996c2b100c6ace1f853da2c293d2f9244ef9.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.12.2023 21:05, Oleksii wrote:
> On Tue, 2023-12-05 at 16:59 +0100, Jan Beulich wrote:
>> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/include/public/arch-riscv/hvm/save.h
>>> @@ -0,0 +1,20 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Structure definitions for HVM state that is held by Xen and
>>> must
>>> + * be saved along with the domain's memory and device-model state.
>>> + */
>>> +
>>> +#ifndef __XEN_PUBLIC_HVM_SAVE_RISCV_H__
>>> +#define __XEN_PUBLIC_HVM_SAVE_RISCV_H__
>>> +
>>> +#endif
>>> +
>>> +/*
>>> + * Local variables:
>>> + * mode: C
>>> + * c-file-style: "BSD"
>>> + * c-basic-offset: 4
>>> + * tab-width: 4
>>> + * indent-tabs-mode: nil
>>> + * End:
>>> + */
>>
>> Seeing that Arm's is as empty, I wonder why we have it. Julien,
>> Stefano?

I'm still curious about the reason here, but ...

> It seems to exist to satisfy the 'install-tools-public-headers' target:
> install: cannot stat 'xen/arch-arm/hvm/*.h': No such file or directory
> Makefile:58: recipe for target 'install' failed
> make[1]: *** [install] Error 1
> make[1]: Leaving directory '/builds/xen-
> project/people/olkur/xen/tools/include'
> Makefile:44: recipe for target 'install-tools-public-headers' failed
> 
> From tools/include/Makefile:
> install: all
> ...
> $(DESTDIR)$(includedir)/xen/arch-arm
> 	$(INSTALL_DATA) xen/arch-arm/hvm/*.h
> $(DESTDIR)$(includedir)/xen/arch-arm/hvm
> ...
> 
> We have the following options:
> 1. Remove the line with $(INSTALL_DATA) xen/arch-arm/hvm/*.h (only
> save.h is now in this folder, which is empty).

... we can't easily remove any existing public header. We can only try to
avoid making the same mistake (even if it's just a minor one) again.

> 2. Don't touch the Arm part, but for PPC and RISC-V, do the following:
> #if defined(__i386__) || defined(__x86_64__)
> #include "../arch-x86/hvm/save.h"
> #elif defined(__arm__) || defined(__aarch64__)
> #include "../arch-arm/hvm/save.h"
> +#elif defined(__powerpc64__) || defined(__riscv)
> +/* no specific header to include */
> #else
> #error "unsupported architecture"
> #endif

Yes. Still awaiting Shawn's input here as well, though.

> 3. Provide an asm-generic version of save.h for Arm, PPC, and RISC-V
> and use it in public/save.h.

That's not an option imo - what's under public/ needs to be self-contained.
Stuff there isn't supposed to even know of asm-generic/.

Jan

