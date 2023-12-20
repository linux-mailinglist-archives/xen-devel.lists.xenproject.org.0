Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CAC819B26
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 10:12:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657480.1026334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFscm-0001K5-GX; Wed, 20 Dec 2023 09:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657480.1026334; Wed, 20 Dec 2023 09:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFscm-0001HA-Dt; Wed, 20 Dec 2023 09:12:20 +0000
Received: by outflank-mailman (input) for mailman id 657480;
 Wed, 20 Dec 2023 09:12:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFscl-0001Fj-3c
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 09:12:19 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dec9f6c8-9f17-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 10:12:16 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-336746c7b6dso1160015f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 01:12:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v16-20020adfe4d0000000b0033672cfca96sm3688137wrm.89.2023.12.20.01.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 01:12:15 -0800 (PST)
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
X-Inumbo-ID: dec9f6c8-9f17-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703063536; x=1703668336; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6jgx9GA5nZJf/nT5tpbTu+moTg4PDeDJ6prelIKvopk=;
        b=aqY2oB676wt4skp7hBKyqEp1z+va+gRS/75xi5+ki0NjwwkeDbC4h/hn0pJYSv0Nod
         mmRM5V56DEFirQH0w2chayB2aUdeVfGYHvyi+823vyIbJtkg2lvCN+zJkSUMOAvku76a
         G0QrY/5Uzs3N6rHfMxvto97j7nQbZs2XXSX+lmkPAPsg7i6Kss1b4fAFKcgk8y+b+dt2
         y3IHEVNvxzx7v6nS5+GwEfDTrcZbYs7dYDSXKjI+ml9ruPPj9jAskyLYvUOy5zeo7+rF
         5B0uxJ9lRgz6R3IELkjH1lmQN21hYurSpMqohHHYybfNXsrhA7QLfG6UNGltnzos5RBh
         U22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703063536; x=1703668336;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6jgx9GA5nZJf/nT5tpbTu+moTg4PDeDJ6prelIKvopk=;
        b=wfzhRW7QFpmcStls58NObcxcxqIoVXGIXaGlWwUVyopf5zXnv5S1SmrQaS/WNQj9EV
         Gowtftqe8PUhiLrKtmCNGZ7o1qwFmqQYtbArzscI8rHe2Jxncuwmi84+FCbYu6D1sDAG
         R+Xn77RHbmtkfQGPKW4pjri3uUw957TM83lhHPo3+6xSb8C/u5W/Lrsz2qQymJg/BPuh
         c19bi66TxJPFIGMLeX+tk4MQotvE9Ab/nbbqwP/tvhv6qKOvWdxzLKVni1S+gc5RxRr4
         M3RlikfHLGNMGbQqaVMR8YNyTHPgm81JzX6ZZKSJMX3/oIinHiQtpX2XYuv6ACFcmQ7w
         UL8w==
X-Gm-Message-State: AOJu0YxHxWmhCQTYrisUsPiLURdWhbUWTTyuXqAY0zESSAXk4sWZBE5k
	oHVbXuyXn6tMroxsHUV/OnNC
X-Google-Smtp-Source: AGHT+IEE98TwBcoK2AumvYoOt/N6Zfa+BjTtOZDkFVJ8poapTcJVFeb1HYiBYaKgl4Sicqan13JcOA==
X-Received: by 2002:adf:a4c2:0:b0:336:77fb:8cec with SMTP id h2-20020adfa4c2000000b0033677fb8cecmr535768wrb.11.1703063536227;
        Wed, 20 Dec 2023 01:12:16 -0800 (PST)
Message-ID: <91390df2-57f7-41b7-a1cc-a050d89e5219@suse.com>
Date: Wed, 20 Dec 2023 10:12:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xen/x86: introduce self modifying code test
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20231215111842.8009-1-roger.pau@citrix.com>
 <20231215111842.8009-3-roger.pau@citrix.com>
 <32d6d42f-2736-42ed-bad3-a6bdaedf588c@citrix.com> <ZYKvFUICQ4pKwH0S@macbook>
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
In-Reply-To: <ZYKvFUICQ4pKwH0S@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.12.2023 10:08, Roger Pau Monné wrote:
> On Tue, Dec 19, 2023 at 08:31:29PM +0000, Andrew Cooper wrote:
>> On 15/12/2023 11:18 am, Roger Pau Monne wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/include/asm/test.h
>>> @@ -0,0 +1,30 @@
>>> +#ifndef _ASM_X86_TEST_H_
>>> +#define _ASM_X86_TEST_H_
>>> +
>>> +#include <xen/types.h>
>>> +
>>> +int test_smoc(uint32_t selection, uint32_t *results);
>>> +
>>> +static inline void execute_selftests(void)
>>
>> IMO run_selftests() would be better, but this is already not all of our
>> selftests, and this particular function really doesn't warrant being
>> static inline.
>>
>> But I'm also not sure what this is liable to contain other than
>> test_smoc() so I'm not sure why we want it.
> 
> This was requested by Jan, he was concerned that more of such tests
> would appear.  It's new in v4 IIRC.

If the two of you want it without such a wrapper, so be it. I will admit
I was a little puzzled to find it implemented as inline function, but I
didn't see a strong need to comment on that.

Jan

