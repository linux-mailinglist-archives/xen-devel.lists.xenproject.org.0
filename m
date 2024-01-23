Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE78838C00
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 11:30:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670348.1043059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSE2v-0000RC-6Z; Tue, 23 Jan 2024 10:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670348.1043059; Tue, 23 Jan 2024 10:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSE2v-0000Pb-3l; Tue, 23 Jan 2024 10:30:21 +0000
Received: by outflank-mailman (input) for mailman id 670348;
 Tue, 23 Jan 2024 10:30:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSE2u-0000PV-Dx
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 10:30:20 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 681117bd-b9da-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 11:30:19 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cdb50d8982so47067191fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 02:30:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j8-20020a92c208000000b00361bae6cd64sm2180946ilo.88.2024.01.23.02.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 02:30:18 -0800 (PST)
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
X-Inumbo-ID: 681117bd-b9da-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706005819; x=1706610619; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v1Qw0Jicl3vB72v1DQ3wjIpKJygKCma5W+5fiFVygX4=;
        b=YFEO1Pb8EeMDAXiqS17E+6iOQOiV72VJhaRkahTadNE/dn9Y8/KUxIixi4I/wdnLvZ
         vyOkqfrGLvQMZ1r7mHciyKYFNHYRRTsAP11X2OJbM9y1pMtmKPAsb28v08UxF8zNY05l
         xEub7Ze+Abb6OO+EMdgKJAku0gYFFlW642Ad7p6KKirTKij2nSDWnl8emXx26YLilzAF
         US+Rnto/PTjbC5uD07yMV8lk/dzDO98fwNXoRpupEy02Hf1Z0ijo1qsyfZHxGfzPZLOH
         +OW8pjR5wYHWTtk92MueOes1i9UjCugOIjNNUdgPQlMW9rcdnReKo5iBfQM7L8i6Tq8S
         XTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706005819; x=1706610619;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1Qw0Jicl3vB72v1DQ3wjIpKJygKCma5W+5fiFVygX4=;
        b=vbLpHWONfILygABwGFHD/KrCmaAU/hNtEeFxTTNOWOlIYplN5jFQ921n4HkX7CUmW3
         xE2/r1vd/v5q4FHdtyKh6Ue88tA/tFOrU8BoZc47E29/EXNq0ehEuTL0a6OYdZd2NVma
         F0EKIPSnWqSu64HMgnLx+3izIJq3xFnfz6rEIyR1VtjNDWL6Ew5if34sQvskZTOZC0O2
         RaWqLCBK7+178275MLirga1bDqWGxlkd1QiCNN/SHJJSg//3BkzWdhBFqQa3fmC1M9mp
         MujG5npxyhqEkJIYXnqQIAv7arDlhbCU1zMQz4WxxOCe+XHGW4Y/iAiaWKnc2M83ACwH
         9Eag==
X-Gm-Message-State: AOJu0YzOrXC8BnfhxhzD11taDI2U/rb+1BbD0ni2iVBKIAx5WN/w95oE
	7fzgTf212WNbsjuocfyIYVVq+TzfXHHzW8I8J/Tz7do6nWk4P8Mnru7WWJsXlw==
X-Google-Smtp-Source: AGHT+IFWYfGfvpetZh1mhNFUib+lZKhXuTmTHUQXtJwEesOi0HrUjiaek6cWnMDIfBf7ZjgocwZuZA==
X-Received: by 2002:a2e:a71e:0:b0:2cf:1355:aa6a with SMTP id s30-20020a2ea71e000000b002cf1355aa6amr268885lje.12.1706005819208;
        Tue, 23 Jan 2024 02:30:19 -0800 (PST)
Message-ID: <6aa39fac-fef6-47ce-8c27-4941d83c138a@suse.com>
Date: Tue, 23 Jan 2024 11:30:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/34] xen/riscv: introduce atomic.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <54f5f13a4ee3de3c3cf4ba2b4d0347bb77bb7d08.1703255175.git.oleksii.kurochko@gmail.com>
 <2429395f-3ce8-4f17-aabe-78af2446ff6d@suse.com>
 <92d7caf20a37b68dce7676812c2780bc2fbc00cf.camel@gmail.com>
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
In-Reply-To: <92d7caf20a37b68dce7676812c2780bc2fbc00cf.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2024 11:21, Oleksii wrote:
> On Mon, 2024-01-22 at 17:56 +0100, Jan Beulich wrote:
>> On 22.12.2023 16:12, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/fence.h
>>> @@ -0,0 +1,13 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +#ifndef _ASM_RISCV_FENCE_H
>>> +#define _ASM_RISCV_FENCE_H
>>> +
>>> +#ifdef CONFIG_SMP
>>> +#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
>>> +#define RISCV_RELEASE_BARRIER		"\tfence rw,  w\n"
>>> +#else
>>> +#define RISCV_ACQUIRE_BARRIER
>>> +#define RISCV_RELEASE_BARRIER
>>> +#endif
>>
>> Do you really care about the !SMP case? On x86 at least we stopped
>> special-
>> casing that configuration many years ago (the few cases where for
>> typically
>> build reasons it matters, using CONFIG_NR_CPUS is sufficient). If you
>> care
>> about it, there needs to be somewhere you actually #define
>> CONFIG_SMP.
> Can't we use instead of CONFIG_SMP - CONFIG_NR_CPUS?

You can. Question is whether there's a point in doing so. Do you
expect people to actually want to run Xen on single-CPU systems?
They're generally not overly well suited for virtualization ...

Jan

