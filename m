Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7668A9B4B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 15:31:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708383.1107270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRqx-0001lW-PY; Thu, 18 Apr 2024 13:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708383.1107270; Thu, 18 Apr 2024 13:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRqx-0001jZ-MZ; Thu, 18 Apr 2024 13:31:03 +0000
Received: by outflank-mailman (input) for mailman id 708383;
 Thu, 18 Apr 2024 13:31:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxRqw-0001WF-Kv
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 13:31:02 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5869a83-fd87-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 15:31:01 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-418c0d83e61so9367665e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 06:31:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a12-20020adfed0c000000b0034635bd6ba5sm1858911wro.92.2024.04.18.06.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 06:31:00 -0700 (PDT)
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
X-Inumbo-ID: e5869a83-fd87-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713447060; x=1714051860; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+lEaaj3MuqcTwsfNK42FJSNRAops+k57UiovJlV35tk=;
        b=HqxEG0eqEoKOI8SUFIKUUuis87oSi1/reBq2tcQAZeuT2W/fnnt0B7hlJFDGVhBfii
         S2tWgNiLJ0qPKMqpJ/TVmU9mUDmvzZjCgxryRa/+AU3w+48Fyid24PmZ2OaCbgb1bLbg
         GYpj1VCOWRRvITbowinNX/wYLwizy4ndhTy2d/DbHM5roEoQTKTpPsd0Pg0rm2UjpVb9
         ZM//ft05wCiOmcq0/VxXJy+1ce/3R+ki9wxlgsvyJFzkYht2CWo7Lrpaleuzxq4yWtaw
         hyQvBcmgxxaBOn+/HnwiKVLXCk8Q9jFh4z7GuYXMRrct/bQxLmnf+dXpI/zZVJSmsow0
         rwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713447060; x=1714051860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+lEaaj3MuqcTwsfNK42FJSNRAops+k57UiovJlV35tk=;
        b=iU+mq3Vgadp8qiENHxF0mVu0UeCVpKRFVPcuvxvAraPJOpsFTqbywe9zBodH7oHNm6
         +dBqOpnSFvLmiSHP5na1bSoaUjd9IeJGeklQtNIGIYvyOUCKTwg1Vz4tUl6sFCtG+cAz
         Fpy4KGkNtliMW3t06ffY/PxyVL3AUpAZFB8GZw0Qe4tK+3fQHJ35GAj7A2DhEyb37ox+
         0GF6rf3/3hfq8vm4Reg2Hs8f2dbQaXb9/l48JZKKsCt8xa37qOMRuix+Tl25hbLM8QJG
         KyaxhdlCqDV5IbnZ8JfQWjZIehP6uMD81afcbsatl3A3kFqL5YL5d+P/2REQueHs4CYf
         yB+w==
X-Forwarded-Encrypted: i=1; AJvYcCUkXRpHT4U2D9qWAzdjXFTtlyRsHyG9mWP0VHLUMRQta0674oZdAkjyHznlf5jC9cwUH/14xzbQHPCwBoQt+M3X1XNMbi/Gg45AHOWMlb0=
X-Gm-Message-State: AOJu0YxCJ2WxaEY15Q0a4y81GkGBRHXSERZIDtI1f4/Xs6DuWqGqPBKQ
	IHPqIM+zMJnL5NTSiZXBvkOVXvfKEWIskEQCOPmykfcUS9DVV8TGh6QCt3EjPA==
X-Google-Smtp-Source: AGHT+IGIIXn3HzblNVkCr5VLdD6vkbqdNwH8//UEb4oamWXyHW/gtibh6wjExsYohpdfKpUZh7eLEg==
X-Received: by 2002:a05:6000:18c8:b0:345:bcd4:8f34 with SMTP id w8-20020a05600018c800b00345bcd48f34mr2069952wrq.54.1713447060308;
        Thu, 18 Apr 2024 06:31:00 -0700 (PDT)
Message-ID: <b5b2b549-3a8f-447a-9713-83b0093d792d@suse.com>
Date: Thu, 18 Apr 2024 15:30:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 08/15] x86/vpmu: separate amd/intel vPMU code
Content-Language: en-US
To: Sergiy Kibrik <sergiy_kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240416063534.3469482-1-Sergiy_Kibrik@epam.com>
 <939adb2d-7816-4f99-9d57-ed444ab859b4@citrix.com>
 <25e2f901-04a6-4c05-9072-a926f6abf06c@epam.com>
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
In-Reply-To: <25e2f901-04a6-4c05-9072-a926f6abf06c@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.04.2024 15:25, Sergiy Kibrik wrote:
> 16.04.24 14:05, Andrew Cooper:
>> On 16/04/2024 7:35 am, Sergiy Kibrik wrote:
>>> diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
>>> index 35561fe51d..d3d7b8fb2e 100644
>>> --- a/xen/arch/x86/cpu/Makefile
>>> +++ b/xen/arch/x86/cpu/Makefile
>>> @@ -10,4 +10,6 @@ obj-y += intel.o
>>>   obj-y += intel_cacheinfo.o
>>>   obj-y += mwait-idle.o
>>>   obj-y += shanghai.o
>>> -obj-y += vpmu.o vpmu_amd.o vpmu_intel.o
>>> +obj-y += vpmu.o
>>> +obj-$(CONFIG_SVM) += vpmu_amd.o
>>> +obj-$(CONFIG_VMX) += vpmu_intel.o
>>
>> I'm afraid this breaks perf counters on PV guests.  These files are
>> joint guest-type implementations.
>>
>> Seeing as you leave vpmu.o alone, I guess that all you're actually
>> wanting to do is compile out vpmu_intel.o?  In which case, use
>> CONFIG_{AMD,INTEL} rather than CONFIG_{SVM,VMX} please.
>>
> 
> Thanks for pointing that out.
> I think I'll just exclude this patch from the series, and make a 
> separate series with CONFIG_{AMD,INTEL} option and code separation that 
> unrelated to VMX/SVM & HVM/PV, only to CPUs themselves.
> 
> BTW, how would you suggest CONFIG_{AMD,INTEL} shall relate to 
> CONFIG_{SVM,VMX}? Should CONFIG_VMX just plainly depend on CONFIG_AMD, 
> or more complex relations needed?

The answer to this, from my perspective, is actually one of the reasons
why I would have wished we'd have separate CONFIG_INTEL and
CONFIG_INTEL_CPU. I'd then suggest to have VMX simply default to INTEL,
permitting at least experts to select it also when INTEL=n. Perhaps that
would still be the best approach even with this INTEL / INTEL_CPU
distinction.

Jan

