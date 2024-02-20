Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FFA85B548
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 09:32:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683212.1062610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLXk-0003LL-EZ; Tue, 20 Feb 2024 08:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683212.1062610; Tue, 20 Feb 2024 08:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLXk-0003JF-Bm; Tue, 20 Feb 2024 08:32:00 +0000
Received: by outflank-mailman (input) for mailman id 683212;
 Tue, 20 Feb 2024 08:31:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcLXi-0003J9-RP
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 08:31:58 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 809f9139-cfca-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 09:31:54 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4126dd40a54so3960985e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 00:31:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l20-20020a1c7914000000b00412706c3ddasm476310wme.18.2024.02.20.00.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 00:31:53 -0800 (PST)
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
X-Inumbo-ID: 809f9139-cfca-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708417914; x=1709022714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2gsXVGDdG5g7JNoY2F7zo2dgWLlODMgbep354kVe0Xs=;
        b=fk8JKO09S63Q8a8H0MBR5sME5iQQCsWQGRCSmt2c8+kGhhr7XJVtpjU5dfauC6cV7P
         3fHDcrAZZCkhV2wlGWzL56ZkUMKPj3e5NkYk36LwaCDiixkLiYGvc4/4AzsLt3HzL1pA
         wCVa89aUWye4eEmFdx546fiVk7NufA5O+NYt4oRJHX6abV43Hn773FE5QABWYV9gEzGL
         uHQtCrxP/oVtcY+dhMuUyVPIjmLCpG4Ueoxfh4htunntyaJRRRbgqXgskJHcu+jMQG0A
         yHzBIZDbVAT/rq6QYb9qAI0exoNSB/StEg4qce5bWz6SyKgDgUCYZOrkxWSCzHSg7ptl
         /t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708417914; x=1709022714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2gsXVGDdG5g7JNoY2F7zo2dgWLlODMgbep354kVe0Xs=;
        b=rsvAKVyCijHqIQAfNi9T9nrbG54oAwD7K+jomtOsf6GEuduQx0rQGZhH/3xYoTxvi0
         jC7ZHLZ336VxKqVLvTGhq6RKQHiwebARd/ePFcmSBGpJRTNYnQFBD2ujgxs7g5V+aaA1
         99/RVoyRXM2n7t55zfm50t4ewpGlw+mDWnNq+QjcAAiadbnclMvaFouON1bHdpSTXy9v
         0Gugi9SzN4GdCCnRj+y+OsmeIUHb6kRNgv7SAsjHMNECZzYd3CL9lxye4p5eupEuXsI3
         HxIHtjBya7RRC43cSbUK18rWV1XUrz6CB2QRxWkng6YEcT1PBrjASCoQZyzBtQq54pPH
         IWWw==
X-Forwarded-Encrypted: i=1; AJvYcCV8x4Imt5KOhUPSzbexi0GCgtLvchU8EAYyTr6YXQ4k0Boe3zxrWtb8Agc5A1MZsPF04fNtMB7WZ25ueut1R6ZE1Qug57lDzlZuO8aqPak=
X-Gm-Message-State: AOJu0YwHEZBDEKeJe80gPCpTAWlq2T1g2kHSQJVFPYqol00Uc00eXYBl
	GRh7cb26YCG3LHF+Zn0gsAxbQf7ywssLvVnTJQYsp20M3colZE9ghEAlz6IO5g==
X-Google-Smtp-Source: AGHT+IETFDBDCNgCgbw240+OkC+8iXImSaZrM4wEy0CqUYorEKTHJTc1LMybVmXFVydrg01c7o30ug==
X-Received: by 2002:a05:600c:4f45:b0:412:5dfc:238d with SMTP id m5-20020a05600c4f4500b004125dfc238dmr8011150wmq.14.1708417913847;
        Tue, 20 Feb 2024 00:31:53 -0800 (PST)
Message-ID: <4924e95e-0806-4939-90f3-2f4216fada63@suse.com>
Date: Tue, 20 Feb 2024 09:31:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviation for MISRA C:2012
 Rule 16.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <b1d2b64c8117d61ea42cf4e9feae128541eb0b61.1708348799.git.federico.serafini@bugseng.com>
 <a6e8bd32-cc32-4084-907d-e2cd6d46e3e6@suse.com>
 <f28aed5e-0983-48fa-828f-b2133ca35086@bugseng.com>
 <4d2c5a69-4807-4af3-84c2-128d16ee2b43@suse.com>
 <1f1fdfd8-1a34-411e-a0f2-d9bcb5b050fd@bugseng.com>
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
In-Reply-To: <1f1fdfd8-1a34-411e-a0f2-d9bcb5b050fd@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.02.2024 09:16, Federico Serafini wrote:
> On 19/02/24 16:06, Jan Beulich wrote:
>> On 19.02.2024 15:59, Federico Serafini wrote:
>>> On 19/02/24 14:43, Jan Beulich wrote:
>>>> On 19.02.2024 14:24, Federico Serafini wrote:
>>>>> Update ECLAIR configuration to consider safe switch clauses ending
>>>>> with __{get,put}_user_bad().
>>>>>
>>>>> Update docs/misra/deviations.rst accordingly.
>>>>>
>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>>
>>>> As mentioned I'm not happy with this, not the least because of it being
>>>> unclear why these two would be deviated, when there's no sign of a
>>>> similar deviation for, say, __bad_atomic_size(). Imo this approach
>>>> doesn't scale, and that's already leaving aside that the purpose of
>>>> identically named (pseudo-)helpers could differ between architectures,
>>>> thus putting under question ...
>>>>
>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> @@ -368,6 +368,10 @@ safe."
>>>>>    -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/BUG\\(\\);/))))"}
>>>>>    -doc_end
>>>>>    
>>>>> +-doc_begin="Switch clauses ending with constructs \"__get_user_bad()\" and \"__put_user_bad()\" are safe: they denote an unreachable program point."
>>>>> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/__(put|get)_user_bad\\(\\);/))))"}
>>>>> +-doc_end
>>>>
>>>> ... the global scope of such a deviation. While it may not be a good idea,
>>>> even within an arch such (pseudo-)helpers could be used for multiple
>>>> distinct purposes.
>>>
>>> Would you agree with adding the missing break statement after
>>> the uses of __{put,get}_user_bad() (as it is already happening for
>>> uses of __bad_atomic_size())?
>>
>> I probably wouldn't mind that (despite being a little pointless).
>> Perhaps declaring them as noreturn would also help?
> 
> Yes, it will help.
> Is there any reason to have long as __get_user_bad()'s return value?
> It would be nicer to declare it as a void function and then add the
> noreturn attribute.

That's a historical leftover, which can be changed. Xen originally
derived quite a bit of code from Linux. If you go look at Linux 2.6.16,
you'll find why it was declared that way.

Jan

