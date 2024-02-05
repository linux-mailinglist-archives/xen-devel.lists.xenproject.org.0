Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D5E8496B1
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 10:37:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675735.1051156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvPw-0008Ao-EP; Mon, 05 Feb 2024 09:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675735.1051156; Mon, 05 Feb 2024 09:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvPw-00088P-BV; Mon, 05 Feb 2024 09:37:32 +0000
Received: by outflank-mailman (input) for mailman id 675735;
 Mon, 05 Feb 2024 09:37:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWvPu-0007pV-Us
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 09:37:30 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2db1c08d-c40a-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 10:37:29 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-51121637524so6285462e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 01:37:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h11-20020a05600c314b00b0040fde7250f4sm350606wmo.38.2024.02.05.01.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 01:37:28 -0800 (PST)
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
X-Inumbo-ID: 2db1c08d-c40a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707125848; x=1707730648; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QAvm6dqaFKH/KmVmlkXN3f2MJxKOho4bem3WUKORwKU=;
        b=MR8SpM4sv4YHO7l6NsGPueq9le3wShrnbh1YC3LKRIgFhoIJk+1Ps3zo+I0L1WrQvg
         T6dvK3EXcJAGpYLG/5+opfu59+5bNk+SUhxuLp4CU9vwil8Wxvmh8Dma7VaRkHBqTrJB
         rOU3zj7j9xVi3DvY7TCfapdlDV5p9fxGRfxojcLwJVoA1IgHybsoT88JcF4JwvJAJB32
         8YFE9gEi/qLhzHMp1Nt5jXdunTV4zarQRMdkLTcCdx6olvBrA7iuH+X4eXUhPuWaM0Yx
         pevgJW/ePyXYlkGFtHadeI/7sDbGnoRKSDSh7+51IOmDdC37dZbBeCSfWAd14+ugveAs
         njqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707125848; x=1707730648;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QAvm6dqaFKH/KmVmlkXN3f2MJxKOho4bem3WUKORwKU=;
        b=oxV7zgYmOJ1UOsd9NM/1dpXN3vOaWb2fm7EIhe6xpFHjSaa+DOFeN+YOgXfz07rVLA
         yKnJmbVFcSk2YlvpFdW0o//tOe1XvT0dVJmQNiET6En6/aVz5MV2nnuhEuNPoopVJzeB
         bcwPjX7NJmKEmeAGIycRicx5ll6t8wYcOcv/nTc/HLDaniIPdQsqxlD+zD6WvbTxhBBF
         +fHNWpdrx47zpVkaBUYIJ3MKduqCcOabLHP695rolNOxht3X2IX5szRp5GApwsNqlqR5
         jYdQ5xngLrmSCP5+AfV4XzX5/DUMGLrYccaKUmr8t6Dcce0SbkMUWwozA6AhBxz9VhPI
         1E4g==
X-Gm-Message-State: AOJu0YxcPTWVb97+NjUsgjRtQK63E1bRSrOCBg1YbyiT/U5VfuktSeoB
	dk1+qlGaMJg/z9OpkgwPlWt1Gf3xcqP5or+iml1ILMOfO1W1Hj8OtBQt1jePUA==
X-Google-Smtp-Source: AGHT+IE1M8ZaHQnOtfnGdyJpOMNL3DFNWKXiwEf660AjIaAY6Xr9yEUYuEDrXQzfAVK04Za2ajnQDA==
X-Received: by 2002:a05:6512:1153:b0:511:53fa:b971 with SMTP id m19-20020a056512115300b0051153fab971mr809998lfg.9.1707125848585;
        Mon, 05 Feb 2024 01:37:28 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVJSNQHLtlc4LZRlQmHYJAvVOO84UHHJ8Qm9MxCWZcVPAUgJTxTBwta3Lgk1MMmAT2QLWSOvrp8NjvLl1KfT9US8w9IWLccbxBr45XKsqI+U4YV35XpdBUZXT5gcMyKyWXjYhQ2C/bx7CsVxTl48H/DyyLxff3+8gO+awzegREfZFedxq9UBkeGBj5e6waNfBp0LQRRtiPHwYJp1gyJ0XK4RQYLsW+GHvcw6BLvQAjNHMq/69Wwa1+rCowywUmCKku3eyG5RQSHPcgXcOV9P0XaU3mLWudZ
Message-ID: <275107b0-bcee-489b-92e6-449a4ac627d0@suse.com>
Date: Mon, 5 Feb 2024 10:37:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/15] xen: extend domctl interface for cache coloring
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-6-carlo.nonato@minervasys.tech>
 <49827753-14f1-42cc-8791-27c5400e6e50@suse.com>
 <CAG+AhRUGdkqhoSL-ihiCGZctH2mkSOi+ap+=a_kKLzJRGugCbw@mail.gmail.com>
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
In-Reply-To: <CAG+AhRUGdkqhoSL-ihiCGZctH2mkSOi+ap+=a_kKLzJRGugCbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.02.2024 12:41, Carlo Nonato wrote:
> On Thu, Feb 1, 2024 at 2:51 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 29.01.2024 18:18, Carlo Nonato wrote:
>>> --- a/xen/common/llc-coloring.c
>>> +++ b/xen/common/llc-coloring.c
>>> @@ -4,6 +4,7 @@
>>>   *
>>>   * Copyright (C) 2022 Xilinx Inc.
>>>   */
>>> +#include <xen/guest_access.h>
>>>  #include <xen/keyhandler.h>
>>>  #include <xen/llc-coloring.h>
>>>  #include <xen/param.h>
>>> @@ -229,6 +230,30 @@ int __init dom0_set_llc_colors(struct domain *d)
>>>      return domain_check_colors(d);
>>>  }
>>>
>>> +int domain_set_llc_colors_domctl(struct domain *d,
>>> +                                 const struct xen_domctl_set_llc_colors *config)
>>
>> What purpose has the "domctl" in the function name?
> 
> To signal that it's called from domctl. Do you suggest leaving it out?

Yes. Names want to be descriptive, but also not be overly long. Imo.

Jan

