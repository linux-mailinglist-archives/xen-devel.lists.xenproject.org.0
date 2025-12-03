Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A85DCC9F2F5
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 14:49:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176810.1501276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQnEn-0007te-Ds; Wed, 03 Dec 2025 13:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176810.1501276; Wed, 03 Dec 2025 13:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQnEn-0007qX-Ap; Wed, 03 Dec 2025 13:49:45 +0000
Received: by outflank-mailman (input) for mailman id 1176810;
 Wed, 03 Dec 2025 13:49:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vQnEl-0007qR-Jq
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 13:49:43 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea91bd7d-d04e-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 14:49:41 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47798ded6fcso41496305e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 05:49:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1caa86d0sm37716279f8f.39.2025.12.03.05.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 05:49:40 -0800 (PST)
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
X-Inumbo-ID: ea91bd7d-d04e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764769780; x=1765374580; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NZmnbCb46luIJoKh+bwSc/BvLKT0WXdRDuJsInDK41U=;
        b=Lktg2u5aU8r6f5hOjGAm3e0WVhJK4P+zJcei7wXJDK0c+KjCQ4UpghNutqI7h6S6WN
         duhRtszzTMwuvMCd8DrqrlFyNBBKejl5eVbgFYqb/KodUbTIKTbcYGxsT8UkJLN+1bGL
         +8gamtSB/X8HJfKWOyqNaGOBJ8imhhZXxZLiJVd9x3+s83zb4qSIr3ZN032ZleWz4pww
         ksM5A6pj/FildwT5902mSzo2TWOWvMJgfzPNtO1DRtJXcpXwerps1MxVz7kBBlo2JCLz
         zsf6Fy8byIaW7j7AZU7UVs1VLUgscDODALkVzcDfsmDQtqyMVO0ybPwJXZnYnDMGLbkv
         Ho/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764769780; x=1765374580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZmnbCb46luIJoKh+bwSc/BvLKT0WXdRDuJsInDK41U=;
        b=Sm36uvdpdH4sO+WFxBszJxJ+BK82RHk6Xn+lTJ61OKfqqtKr5PZyd0IL8WZ7TmJkHf
         YnVj2oEenhmY01obNAsBmc9FYPsgbp3MVZZZjI/L5VsDYIFq8n5g9IB0C0EM6+6gAjQQ
         pBOLsSmWOCgmS7RBC1wnBhsMZ+NZ9Po3fpApI0TXttOskX4EcRX+IB29BJbz/xsrkDeT
         rqeYe/65sr+MWuwfCXVt4/1ZL6LvBgyw3a1d/o6lAMa3yC5z0HbldtJZv1F9l9emhupE
         BLH/yemdQGJ9tWMu3l0g3MgoowENM5KrfYHLugh4IfLWK/Bu+vIORwqOswbjhNoJT1CQ
         5x2g==
X-Forwarded-Encrypted: i=1; AJvYcCUNS3g93Ja8x8vbL46JsFXBnpnqdi5voZeoEqXd5Asb4prpHe6HK2W4S1gIy4HR9tCy6whT4C02O+Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7CMZJtE+5SXD9YL8eRpNyURQlHZc8LXT8iTjgaMTDkCym3ie5
	oA1KWU7GOfLGmXTF4HlTwDOWsqmhweCRsKyvfOxIyJBfIlhigfuXaD12cflGB+pcKQ==
X-Gm-Gg: ASbGncvwv9llzsvws/5jhe+n20EsESutdaOhgYmCCL8h2v05brFpvMnbaNGNCuQMqWp
	WhhLb73O2W/tjfGjd+8ofJjqv5QxBOzDwOGDdLn/H6t6gNsTwZOvd/Wt+CiMQqS9gP9a6XV42pe
	q5o+vdR/gp5Jh5OQyxozFz9QwhlIRvMgESfGoL5xBpgWLWKnGTnOzqqrhEpHfA3/tiZ62otJZUF
	TtO87iToxRZOG8ggwNmNtKpJKDANKIJoGqFg4P8oYLTlmOqRWANykmiuvw4VfFanILfgpFVx1LD
	KrX3LZ4j9oJvcKXHe//a4Gn2cchPjJXz5iIYOw9nTyhCxcsUVa6HXGPtCuq5wV5lACCDbeZZjUT
	lh546sHe7owdetC6f7mc96bvLR+FZdragc+0TcZNQ0WCBMGAWdfYdlSYT5rSPHxczmffuW6nZZw
	L+hk57dNFJRguHxEsubn5cs9mdtyVtQtNUeXRFBpLz4AmUs44fLuA1hMIteDIorvFR2BHtWNNUI
	bk=
X-Google-Smtp-Source: AGHT+IEPU2Uxl2pnZVlp4nDsBWfsOfOqJbOJm4aNsjs1UBFYBaTiD5FjnsAYy+ROLWcT8K7cHP2RoQ==
X-Received: by 2002:a05:600c:450a:b0:477:b0b8:4dd0 with SMTP id 5b1f17b1804b1-4792af1b10fmr22846885e9.17.1764769780580;
        Wed, 03 Dec 2025 05:49:40 -0800 (PST)
Message-ID: <329029f1-cca5-4c33-8183-680ffabbb250@suse.com>
Date: Wed, 3 Dec 2025 14:49:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1764755558.git.xakep.amatop@gmail.com>
 <f05ece00c276187d764c7539142f29ee3c48987c.1764755558.git.xakep.amatop@gmail.com>
 <63ed70d8-ab4c-4b9e-8884-954f8f8194e4@suse.com>
 <CAGeoDV8zjwZ5YMLG4RKO6NCOwjeiS85mW5=yRP5E8MRYwgNESw@mail.gmail.com>
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
In-Reply-To: <CAGeoDV8zjwZ5YMLG4RKO6NCOwjeiS85mW5=yRP5E8MRYwgNESw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.12.2025 13:13, Mykola Kvach wrote:
> Hi Jan,
> 
> Thank you for the review.
> 
> On Wed, Dec 3, 2025 at 12:11 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 03.12.2025 10:57, Mykola Kvach wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -26,6 +26,7 @@
>>>  #include <xen/hypercall.h>
>>>  #include <xen/delay.h>
>>>  #include <xen/shutdown.h>
>>> +#include <xen/suspend.h>
>>>  #include <xen/percpu.h>
>>>  #include <xen/multicall.h>
>>>  #include <xen/rcupdate.h>
>>> @@ -1363,6 +1364,9 @@ void domain_resume(struct domain *d)
>>>
>>>      spin_lock(&d->shutdown_lock);
>>>
>>> +    if ( arch_domain_resume(d) )
>>> +        goto fail;
>>
>> In case I didn't ask before: You're after a boolean result here, yet ...
>>
>>> --- /dev/null
>>> +++ b/xen/include/xen/suspend.h
>>> @@ -0,0 +1,25 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef XEN_SUSPEND_H
>>> +#define XEN_SUSPEND_H
>>> +
>>> +#if __has_include(<asm/suspend.h>)
>>> +#include <asm/suspend.h>
>>> +#else
>>> +static inline int arch_domain_resume(struct domain *d)
>>> +{
>>> +    return 0;
>>> +}
>>> +#endif
>>
>> ... int is being returned. Why?
> 
> Would you prefer I switch arch_domain_resume() to bool, or is keeping
> int acceptable?
> 
> I lean toward keeping int: the generic call site is shared by all arches,
> so future arches could inspect/handle specific error codes,

It's an arch hook, so the arch provides the error code. It's common code
which may want to inspect it.

> and this matches
> other arch hooks (e.g. arch_domain_teardown()) that are only checked for
> "rc != 0" before bailing.

And it's questionable there as well why they would return an error code
if the sole caller cares about a boolean outcome only.

> With int, I'll store the result and gate the rest:
> 
>     rc = arch_domain_resume(d);
>     if (rc)
>         goto fail;
> 
> If int works for you, I’ll keep it; otherwise I can flip to bool.

If you want to stick to int, please justify doing so in the description.

Jan

