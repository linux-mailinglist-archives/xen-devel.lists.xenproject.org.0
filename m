Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C940C96B2B
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 11:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175700.1500323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ1Ok-0000Ub-A4; Mon, 01 Dec 2025 10:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175700.1500323; Mon, 01 Dec 2025 10:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ1Ok-0000Rj-7M; Mon, 01 Dec 2025 10:44:50 +0000
Received: by outflank-mailman (input) for mailman id 1175700;
 Mon, 01 Dec 2025 10:44:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0dw1=6H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vQ1Oj-0000Rd-NL
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 10:44:49 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1e58dc1-cea2-11f0-9d19-b5c5bf9af7f9;
 Mon, 01 Dec 2025 11:44:48 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42e2e47be25so735578f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Dec 2025 02:44:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca1a38bsm25930319f8f.24.2025.12.01.02.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 02:44:47 -0800 (PST)
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
X-Inumbo-ID: c1e58dc1-cea2-11f0-9d19-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764585888; x=1765190688; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KW1ez9P9UYF74AAJFz6n/3tdo0OGkcdr8NW3Jeb7wWo=;
        b=DqGUXyUGlUgLPRu6NjIPwotGT+jQOuCH4pq2xeDR6gE4yT2np78PHzTtmQNENMydLd
         y1tArT+0uA7clwxaU6TDKQ1dXddt/mVto/O7oOD24vCkQqqTlrnOeG9F4q+YgIfWKLkE
         cAh2qVPyoItMPd/xgwoJZp5TphX46sVlX/uO7YUeLFS6IX9J89adA6QgcE4tIERg84nk
         jOmmy55VmGkoi88gVuUdK2PnPCt3oyvb5KBPSNLLjxXwGHfzPdV7HdizHLVdxyx7UqOi
         gGjjPKWxOfDmvA3B4dVHKshRO6q7roGZ8aI3xI1K2C1myhoYFGEwEmq3NCLztSFx/Frp
         66PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764585888; x=1765190688;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KW1ez9P9UYF74AAJFz6n/3tdo0OGkcdr8NW3Jeb7wWo=;
        b=sayiKzJjgehrh9r2H6nUgPwmiuYXsybN8kFPBD85wluM60wcAXj5bVUNc5QvnoVwHQ
         AnmKXEN10uNWyluAtl45pEGtBq0XR4az3IeyqUyMITohknkw6QxMq8UjY9AfwTYhZMmx
         2Txcw0A8lomd9ACGZ/NnFqCM5a+fdk0togJANZzdAaSp/Fln1rg7Agwhg0mFIPjmzHrf
         I5W0YesnMI/gNG9warIEMtk8xz8WObZUCY6VQ7cb9g1BTtnp5BdWUSUHX/JkDC6OqC6m
         EdVaHcAE3Hzyy10Dy677Hfllwpjd2VbdXJ7a9ElGl8o+zgG9EROEewLu3sJk0pVuOyRi
         vFPg==
X-Forwarded-Encrypted: i=1; AJvYcCUCCOS2NqE+JJ1IfOqeM96jUI6DYWb9+04XiB514q3Ml5QR8ACwKYH6mHozqCVqbtZtRud5bsQFv5g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwsZSC8zUqEMGmfH3kBnSLkUqnDKrgGDqCobmyw/GWPa/ySN/rl
	+jCKKKItiP+Fynl5IVDc3V6+dyFHgXNFKGj6wAtm9bxQmyOWZ7LOiCNOLwkv0m6Bww==
X-Gm-Gg: ASbGnctygFA69Ja7Uh5cD3tMX3lh2l+p9IUcvJLnILqe/xNXlxhGanzbIl6w0bR545r
	PmXDslrtULV7iwLgoUiAm4iRzbhoeUNWKv9hLeX+U+rYD82YZusdvs3csCIevicTVFdSLdjkPi8
	8ZdWIG8zBN/NMy5e62vQjQg//OR1VkYakejpJDdWy1J0Nl/tzRVhr0VZ9weyyizPTEJov+boPQM
	YXeo59pG+xHBDtGS44PgJ4vJ9ED/tISzjaHh5Wl42tqhLAn6s3CqDaPC5c6h+MKWqVSFVXrfVrm
	NprhlBikO8x065OjXOC8D1A8y0bj0jv7n1kR8K49qcsyFzDNW+7h3bPthKjvsKhzHVW/3s97jh6
	NVXz28NDIdu8Tnxlyw+idaIGOvb/cBXwbXoqhPMsdgGS/MGrLo/j4A1AGLNrCFBCxl+ghP6eLy8
	IC/pXZ0CS2j7gsSSp4LIx1BM6ESWX7vFsLValMLvJKNuRgz5uIZ8x9mvGzx9aNBfI8695KuHUZW
	l0=
X-Google-Smtp-Source: AGHT+IEIF/FaVxkT9ImPuJTxN3AAVqh6D6bVUbL4mgGamR32XOaSBxFialUqSLdLPFEQL1FhZNU0RQ==
X-Received: by 2002:a05:6000:430d:b0:42b:36f4:cd24 with SMTP id ffacd0b85a97d-42e0f204b52mr27872695f8f.24.1764585887448;
        Mon, 01 Dec 2025 02:44:47 -0800 (PST)
Message-ID: <3678d8ef-8e7d-4667-ac3c-083add25c426@suse.com>
Date: Mon, 1 Dec 2025 11:44:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: move vcpu_kick() declaration to common header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <b009997b5f3e7489fadb5f62f1623fc4d13bf271.1764344988.git.oleksii.kurochko@gmail.com>
 <0173e0bd-130a-4966-b0f1-882f8dd78aa1@suse.com>
 <74fdbc0e-7919-4a89-8cd4-cc6cf3ffc402@gmail.com>
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
In-Reply-To: <74fdbc0e-7919-4a89-8cd4-cc6cf3ffc402@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.12.2025 10:24, Oleksii Kurochko wrote:
> 
> On 12/1/25 9:40 AM, Jan Beulich wrote:
>> On 28.11.2025 17:23, Oleksii Kurochko wrote:
>>> The vcpu_kick() declaration is duplicated across multiple
>>> architecture-specific event.h headers (ARM, x86, PPC).
>>>
>>> Remove the redundant declarations and move vcpu_kick() into
>>> the common xen/include/xen/sched.h header.
>>>
>>> Drop the definition of vcpu_kick() from ppc/include/asm/event.h,
>>> as it is already provided in ppc/stubs.c.
>>>
>>> Add inclusion of xen/sched.h in the files where vcpu_kick() is
>>> used.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
> 
>> albeit preferably with at least ...
>>
>>> --- a/xen/arch/x86/cpu/mcheck/vmce.c
>>> +++ b/xen/arch/x86/cpu/mcheck/vmce.c
>>> @@ -12,6 +12,7 @@
>>>   #include <xen/event.h>
>>>   #include <xen/kernel.h>
>>>   #include <xen/delay.h>
>>> +#include <xen/sched.h>
>>>   #include <xen/smp.h>
>>>   #include <xen/mm.h>
>>>   #include <asm/hvm/save.h>
>> ... this change omitted. This file includes the private "mce.h", which in turn
>> includes xen/sched.h.
>>
>>> --- a/xen/arch/x86/pv/traps.c
>>> +++ b/xen/arch/x86/pv/traps.c
>>> @@ -10,6 +10,7 @@
>>>   #include <xen/event.h>
>>>   #include <xen/hypercall.h>
>>>   #include <xen/lib.h>
>>> +#include <xen/sched.h>
>>>   #include <xen/softirq.h>
>> Somewhat similarly here, xen/event.h includes xen/sched.h. That's less obviously
>> guaranteed, though, so making the include explicit here is likely okay.
> 
> I am generally okay with not adding what is probably an unnecessary new header
> inclusion, but it is unclear to me why we should avoid including a header just
> because it is already included by another one. In other words, if one day someone
> removes "xen/sched.h" from "mce.h", is it acceptable for this to result in a
> compilation error? How do we decide when such an error is acceptable and when
> it is not?

This is precisely why I made the distinction between global vs private headers.
Relying on private headers to have certain #include-s is imo always okay. For
global headers that's less clear, ...

> Should the default behavior be that if header X is already included indirectly
> through other headers, there is no need to include header X directly?

... and hence I wouldn't want to give too much of a rule of thumb. One may say
that if a (global) header, to fulfill its purpose, absolutely has to include
some other header, then one can rely on this when using that header. But in
most cases the situation is somewhat blurred, so it's case-by-case decision.

What commonly happens is that #include-s are added to keep the build working
in all configurations. But #include-s typically wouldn't be added "just because".

Jan

