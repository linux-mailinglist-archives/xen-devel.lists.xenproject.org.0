Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D055816C28
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 12:28:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655877.1023741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFBnW-0003b3-FU; Mon, 18 Dec 2023 11:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655877.1023741; Mon, 18 Dec 2023 11:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFBnW-0003Yn-C4; Mon, 18 Dec 2023 11:28:34 +0000
Received: by outflank-mailman (input) for mailman id 655877;
 Mon, 18 Dec 2023 11:28:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFBnV-0003Yh-5N
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 11:28:33 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 921d2d5e-9d98-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 12:28:30 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3366827ca79so617726f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 03:28:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k15-20020adff28f000000b003365dc5b125sm6704909wro.69.2023.12.18.03.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 03:28:30 -0800 (PST)
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
X-Inumbo-ID: 921d2d5e-9d98-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702898910; x=1703503710; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vz8AILrAucXAWiaclwBZWeVtVjCyc6JBG28HfDpIZlk=;
        b=Nc2YqoMl7QoSgVm6lhOI7k5/0RMU19ZMF3oXfxHyseyykajdxUDdinU/d6UxeZO3u0
         SIf3NLPeu15a0CkLazsTRjiEI/1c+sBgRv9hzJ4NXDVYcR4CJ9CoT8/a/xEdaom56UMx
         Eph+J9ezzvwu3xHS+6TRNQ19ZzlF0DSE4N3GRfnNd8Yoi2yVPsHlYuIgSOSgKSylAarS
         fKiedeSF3WqVCVw41w9A+ygH4Bf/lCePS9LBKUcCFo75b1CH929mxAcXCt9rwxDMhdQ3
         4N67cvlp30z3Blde4ErbaS4CFazKMnX3C5J43OafV2AddL02Ywi1B7F3PkuarL3cSZ7J
         +a0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702898910; x=1703503710;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vz8AILrAucXAWiaclwBZWeVtVjCyc6JBG28HfDpIZlk=;
        b=nVt3r/LWsYfWI3h8Pa+gSZpwwxetAkgPjqBOjgZiGliGr4OKb/6kRxGUWuCLNzu9r3
         7c3HSf94qa1ZALedGmNBAB35gFT3v0BGMhJ8+9R2LgLi4k1cp3xe0mPI7aiXYjacH5QT
         d4L4X/Fk+9ZMEjJNm+/X4o3aQs32q39gK4fGy9axYJsl5hNiIR8Nsi6hJ/iURIw7CxZS
         erTyoU3LvtNVQjszdB8ldIRzm24wEYNuzswmPEHb5z4hY70059Ha8Cqzk0zgFML2cYQN
         CAuGy9vgROy5cy9VooK8fI3kLIRBfEQHxZ42YEvMVuxsVPhOwGbA3XSFOb7c7e7Auze3
         MzjQ==
X-Gm-Message-State: AOJu0YxP/Dy+8HmU2n0wP99Ejnt1z2cMp9pZ4MFRkR3D0/PoEkywIIAw
	5tTZgvWDOATV5pfwQ7iScNlH
X-Google-Smtp-Source: AGHT+IHFUwg2GwyAaG0EYAGxFCVBK1GUAEaYM8tEHqeJ2W6TWkh4MTRQsPAjnkqYYW7eUbjBOTYglA==
X-Received: by 2002:a5d:4003:0:b0:336:6514:a97f with SMTP id n3-20020a5d4003000000b003366514a97fmr1247663wrp.106.1702898910274;
        Mon, 18 Dec 2023 03:28:30 -0800 (PST)
Message-ID: <95431643-9f52-4723-89e6-a5e7e8b51bca@suse.com>
Date: Mon, 18 Dec 2023 12:28:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/39] xen/riscv: add required things to asm/current.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <b6328d9b5bbb9269066dc17d7c0fcb32fa935b2b.1700761381.git.oleksii.kurochko@gmail.com>
 <8d089dbe-a411-4083-9540-d0c95fa183cf@suse.com>
 <2c0ac2c7d21222944052f51c3af497c53f1a1da4.camel@gmail.com>
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
In-Reply-To: <2c0ac2c7d21222944052f51c3af497c53f1a1da4.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2023 11:39, Oleksii wrote:
> On Thu, 2023-12-14 at 16:55 +0100, Jan Beulich wrote:
>> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/current.h
>>> +++ b/xen/arch/riscv/include/asm/current.h
>>> @@ -3,6 +3,22 @@
>>>  #ifndef __ASM_CURRENT_H
>>>  #define __ASM_CURRENT_H
>>>  
>>> +#include <xen/percpu.h>
>>> +#include <asm/processor.h>
>>> +
>>> +#ifndef __ASSEMBLY__
>>> +
>>> +struct vcpu;
>>
>> I don't think you need this here?
> Shouldn't forward declaration be for the case of curr_vcpu declaration
> in the next line ?

I don't think so. In C forward decls are needed only when an otherwise
undeclared type is used as type of a function parameter. (C++ is different
in this regard.)

Jan

>>> +/* Which VCPU is "current" on this PCPU. */
>>> +DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
>>> +
>>> +#define current            (this_cpu(curr_vcpu))


