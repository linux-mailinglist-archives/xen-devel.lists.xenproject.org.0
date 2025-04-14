Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2124CA8805A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 14:28:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950113.1346525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Iva-0005WZ-KI; Mon, 14 Apr 2025 12:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950113.1346525; Mon, 14 Apr 2025 12:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Iva-0005Ti-Gh; Mon, 14 Apr 2025 12:28:42 +0000
Received: by outflank-mailman (input) for mailman id 950113;
 Mon, 14 Apr 2025 12:28:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4IvY-0005Sp-LV
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 12:28:40 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe28158a-192b-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 14:28:38 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39ac8e7688aso2557414f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 05:28:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2338dc13sm181331845e9.3.2025.04.14.05.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 05:28:37 -0700 (PDT)
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
X-Inumbo-ID: fe28158a-192b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744633718; x=1745238518; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b4AXk87WmGHddqtEoL6iJ4qpl0Sv5bTI/OIcAg8UUWM=;
        b=dJRbyMIITxQPCnyRf/DYULjQSCjUexwxapDmcZe5i3xWxGWtLI6I0vlqFY7EsG79N+
         mOmGDFQrASsky4+E8lDyHsGYDB6KOnI4wNWyDrOVBQ1iZ1vKeAxYc++1Mf38uw/dtZjB
         8iYcE44+DI/Tf9ZGszSxiTbBwa/aH6j+kUIxp/Rd70JBzaLkjfSTQofJhfpGEfG/s1dN
         1vzbpgPtUQsus1hWvDE/WyxPn2MGfyhyKnUEaglTe9g+xyocRKIrNYyVgRrjWVeQvAEQ
         FTBVsQBhPBoGT+WCi8ydGf9SCVpjVOqDchp7ix5N6xUFSpZNSfJrUAoX6yYzwBQGrArT
         K4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744633718; x=1745238518;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4AXk87WmGHddqtEoL6iJ4qpl0Sv5bTI/OIcAg8UUWM=;
        b=VSljKvT1HYIWZyVISSgP3/MbpUnABNkvehcEPTaOKnizRS8PZCEE7oYjjoX6rPVuk/
         ibGtHxLVBHIkYoxNHq+dBed17+UzpTNkHqHoQ8IoIzsEdQYRpoyB8kqFjvABJfGdNE8q
         /j9mYwt4i26nKFOZx3y4/LMfwqAeMv2xfmcctKM3UxEuUfMmeV+mCuo0R8XtqlzeJ2VW
         JspB/g6YzMGpc+m38gAlvINtjRcZw+oW0tmge1cuD0g+muJjkdZCAIE042jWhQUdYc2L
         CRtjD/fCcc1aZz3c5klfcRSzfm4CxY7UFRbV1ULStSkFUSALboac32UijE2pvVoFSRpg
         B1eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNSOk+kMqpl5ERibLSwGQmztx8ea+R++zo7ZJ+CPAlnohK3HxhmaakipY8myEwuWla+eL17lir9xY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJ2COBrZkDcwI3exTCKDHQB3BkKRCAXAoMyY/JWkeuy8Nvc8K0
	jWsIQlFb9ia+zPrxQBqEWCTxVzKKfcPo80Ef+W9IxUKFJdqt76FW55Hb+0Toig==
X-Gm-Gg: ASbGncsbGL5PyU0DbUexht8UpZgu6jaLZBTcPrpPfP7XEA0PirQXosLlmUMGNuS/l68
	mZzJBvdwyEF1siBk6LzZreofcdOKdKasUBIJf6x2B/46KuWLyfWZPQUAvmnfD+wZ01LRTD7SvYX
	fuqSTKH8p4KELZG8NbUoRxiVgsnjT3sloWROx1xdJtikl4XnMmrjlHCwpNWtLDEFugG4SgeaDS9
	Qo4Dq+C+05Ln2MdAUfGsgUGGNw4u89eY4W106TgS8PJFLWdvJkwpqykN9GRj+yitGGKca9fxiz+
	pHW2NBiUVjfiDntPZ1SS7D8Al4czM3VNUghBJDO7Am/brYp/92SlS9z0uDL8Hw2qF2qrPFJzlBg
	c+HjZTJGbkyOXR9+7rCd/+2R0rQ==
X-Google-Smtp-Source: AGHT+IG/QtjPxc20xekzsvxuCIPna/NhU48hum2N75mXD4IZvoItk3+3WQKhVgym/YW/ZpvAReraJQ==
X-Received: by 2002:adf:9dc5:0:b0:39e:cbc7:ad38 with SMTP id ffacd0b85a97d-39ecbc87f34mr5904717f8f.32.1744633718250;
        Mon, 14 Apr 2025 05:28:38 -0700 (PDT)
Message-ID: <9fc56d3f-ee76-4536-b0a1-e906a07c5c27@suse.com>
Date: Mon, 14 Apr 2025 14:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: Increase XEN_VIRT_SIZE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <eb20a5730b55c1731324cc3970c3a3c9ea666a85.1744214442.git.oleksii.kurochko@gmail.com>
 <a173245f-531a-434d-b3ce-1d8e35dec8ec@suse.com>
 <35a0256f-cb48-4e39-b60d-8ee698154e77@gmail.com>
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
In-Reply-To: <35a0256f-cb48-4e39-b60d-8ee698154e77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 13:48, Oleksii Kurochko wrote:
> 
> On 4/10/25 10:48 AM, Jan Beulich wrote:
>> On 09.04.2025 21:01, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/mm.h
>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>> @@ -9,6 +9,7 @@
>>>   #include <xen/mm-frame.h>
>>>   #include <xen/pdx.h>
>>>   #include <xen/pfn.h>
>>> +#include <xen/sections.h>
>>>   #include <xen/types.h>
>>>   
>>>   #include <asm/page-bits.h>
>>> @@ -35,6 +36,11 @@ static inline void *maddr_to_virt(paddr_t ma)
>>>       return (void *)va;
>>>   }
>>>   
>>> +#define is_init_section(p) ({                   \
>>> +    char *p_ = (char *)(unsigned long)(p);      \
>>> +    (p_ >= __init_begin) && (p_ < __init_end);  \
>>> +})
>> I think this wants to be put in xen/sections.h, next to where __init_{begin,end}
>> are declared. But first it wants making const-correct, to eliminate the potential
>> of it indirectly casting away const-ness from the incoming argument.
>>
>> (At some point related stuff wants moving from kernel.h to sections.h, I suppose.
>> And at that point they will all want to have const added.)
> 
> Sure, I'll change to 'const char *p_ = (const char*)(unsigned long)(p)'.

And hopefully without forgetting the blank ahead of the *.

Jan

