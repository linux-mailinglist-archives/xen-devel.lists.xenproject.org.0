Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CA096877A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 14:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787848.1197321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl69P-00007s-5q; Mon, 02 Sep 2024 12:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787848.1197321; Mon, 02 Sep 2024 12:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl69P-0008WC-31; Mon, 02 Sep 2024 12:27:19 +0000
Received: by outflank-mailman (input) for mailman id 787848;
 Mon, 02 Sep 2024 12:27:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sl69N-0008W6-SV
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 12:27:17 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b00b6f5f-6926-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 14:27:15 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c26852aff1so450559a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 05:27:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898900f6e0sm550488066b.77.2024.09.02.05.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 05:27:14 -0700 (PDT)
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
X-Inumbo-ID: b00b6f5f-6926-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725280035; x=1725884835; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D3KyEm1q2dvNS8zj3+tllqdYvZRHu7+dslMYi9fncdA=;
        b=S9BT+IUuWzt8Q82NTEnZE1SkCRh4LI4H8B19kn0pI8TxBkns8d90OKd7XP/whQZejg
         IDzbKvdYOj0XwcBVWlUjaxQWPDzILToSq7CckLX8fLDeR1yRBcxSU20dZIbSehn4//B1
         iQQVFMsXXycTvovaXUNbRuEUTByIRZZf+DgJJBljUGo0cadOz+PLT2TxdVvHundik1sl
         qKuYFAlFpY5R5SCqvTHyKhFxTIoVikglyQBwGWRfI7WL/WebNpbtz8tq2226vbNiCc8I
         DdIebdmPlsUr+8ucJuCVc2fsNa5rBSUdffo6QmPFXzB20o6CWnqchJOzJfKpzeZrhhzP
         oI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725280035; x=1725884835;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3KyEm1q2dvNS8zj3+tllqdYvZRHu7+dslMYi9fncdA=;
        b=hf7q9DmMUwdPqgE8CAMa2jfi8NTTS1WC/mMPVoJU7MQrB09+rrxTotDyeYgBQpijW6
         BQY7WuWyy2KGeO3dxbm0TBWxcklOXge/AW4Vlk/Yl3HSWlKs45u3o8Q8JqTJdp4DFW2K
         Mnl7V0nY5CG148smVu3yjQJkmgqJRDZCBzZTdqwkV9LHsp++z8/KRbBm+6JgTlt25Y07
         wCfHep81sH9EnNQCMklpDqHdcUp9REOsPm2guJYce+P3ZHKC1COHTO8Guy8wF46h9prU
         LxlQxJ99DnV6K5+46bzgR/MPpKY0WOrZi8I4Rrx+O5qahl4dSZmVQrik0fpWuxGs6WvF
         izmw==
X-Forwarded-Encrypted: i=1; AJvYcCVshUL4p/ByMvWmlX14vVMidHzXijc1maE2LPaHvX7LNEFwdsnxZsVNZQ/wDD3nO6aXhvsJbddRzmk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJ81xTiraAO9epJ/dZdQOM1tE27PLvdYtOmtbZORrO0JySq3VM
	jHLnoxmtM0ZTxFXW5q1/AG9PDUiLdlDprvAfMC1cImGAsCu/UWf4GfTBRphbKQ==
X-Google-Smtp-Source: AGHT+IEH4TaMHp4+rG8QMiNS042jq8FIyAmxqz4+12qKEzSUUjChrywscfz+RE6+clZk+kVx2F3v+A==
X-Received: by 2002:a17:907:7b92:b0:a7d:e98c:5bd1 with SMTP id a640c23a62f3a-a89d8782279mr517534966b.26.1725280034948;
        Mon, 02 Sep 2024 05:27:14 -0700 (PDT)
Message-ID: <7af9f57b-ceea-416d-b79f-507af689b04d@suse.com>
Date: Mon, 2 Sep 2024 14:27:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Use <xen/types.h>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240902115912.3145737-1-andrew.cooper3@citrix.com>
 <bbc0be08-690b-467c-9f77-193d3fa38bb9@suse.com>
 <d7dec8ec-16ae-4364-9b0d-3d36bc7b8ed2@citrix.com>
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
In-Reply-To: <d7dec8ec-16ae-4364-9b0d-3d36bc7b8ed2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2024 14:12, Andrew Cooper wrote:
> On 02/09/2024 1:07 pm, Jan Beulich wrote:
>> On 02.09.2024 13:59, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/boot/cmdline.c
>>> +++ b/xen/arch/x86/boot/cmdline.c
>>> @@ -31,6 +31,8 @@ asm (
>>>      );
>>>  
>>>  #include <xen/kconfig.h>
>>> +#include <xen/types.h>
>> And why not include the file centrally ...
>>
>>> --- a/xen/arch/x86/boot/defs.h
>>> +++ b/xen/arch/x86/boot/defs.h
>>> @@ -20,14 +20,10 @@
>>>  #ifndef __BOOT_DEFS_H__
>>>  #define __BOOT_DEFS_H__
>>>  
>>> -#include <xen/stdbool.h>
>> ... here? Both above and ...
>>
>>> --- a/xen/arch/x86/boot/reloc.c
>>> +++ b/xen/arch/x86/boot/reloc.c
>>> @@ -26,6 +26,8 @@ asm (
>>>      "    jmp  reloc                    \n"
>>>      );
>>>  
>>> +#include <xen/types.h>
>>> +
>>>  #include "defs.h"
>> ... here you have the inclusion ahead of that of defs.h, so there aren't
>> any other dependencies (unless something subtle is going on).
> 
> Because I intend to delete defs.h entirely.

Oh, okay.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

