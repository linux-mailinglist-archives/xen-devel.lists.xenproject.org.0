Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FF884DAEF
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 09:02:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678022.1055033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXzMN-00044E-15; Thu, 08 Feb 2024 08:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678022.1055033; Thu, 08 Feb 2024 08:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXzMM-00042J-UI; Thu, 08 Feb 2024 08:02:14 +0000
Received: by outflank-mailman (input) for mailman id 678022;
 Thu, 08 Feb 2024 08:02:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXzML-00042D-5U
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 08:02:13 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c64732b-c658-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 09:02:10 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4102eae7e6aso5238985e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 00:02:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m3-20020a056000024300b0033b2799815csm3055415wrz.86.2024.02.08.00.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 00:02:09 -0800 (PST)
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
X-Inumbo-ID: 5c64732b-c658-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707379330; x=1707984130; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sA6DTUljh8AuqClGp1xj+vIuOIKVU2MgFNi3HwqW92Y=;
        b=X3NNEyAhBllCgj4f5Vt3rz/P8SAlz+Q2zOJMKMujdhiAibLDKMDEKKhkTHUtJzP6rl
         rTy2r0X+P3A3J3K2kzmpDjKSVFkyosQZfxmtN1auGuAc8N5CSn/uV8jX1RchYYn9Kwfz
         DKamEmfQM50No05IxHwpZf5WnyKdJ1tgNhLDRLbx1IaqqDRZtVUvMTbm7KFcHAFckoOa
         PI25XRYHU0Uk4U6rytEZ3/hlfDy5VIg06HT5gn6XnYBgTVEdPmDcqMG4sK4XBlW83cHp
         +VD+KhX/1JJPmCKzYk5chfTUlRQzNu290C3J8MLJKEbdLj43m24bhIYoUKMmhx9XREEq
         +/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707379330; x=1707984130;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sA6DTUljh8AuqClGp1xj+vIuOIKVU2MgFNi3HwqW92Y=;
        b=ctitJKhrYv5pugcTOHjU774PRF57nA77amEMuoK/8yhuiPNTYrWcZUk2YCQhoCWMrS
         x2rzXiZJ9yGuZE7fNfYbuUil43l3fs0eFMQ7/FuCnBi1007GQsra3tT0FbQ4d+b10AwA
         kM6wtLUg0D+LnPIGw3ba1r3xaQc1QJ38LolqA/AvgabZ5u5dqfOpq3omlbrnlUAFkQQj
         deFOf1lCOQjPnzDFxjiPZVqFinfybkukERnBF52f1DDG+fnd0NU0XR03o2hP8A5O9q0w
         oHNVLI94LF8unU6jh6Imn53xBXqV+tWXguCxjCUiGM6kZlpkI9z5eLYu8eu8gr8ma+f+
         Ih/A==
X-Gm-Message-State: AOJu0Yylbun0f/gNt44Z01adIEstsfW2sRmxiPfKeIvgjnXMq51Dme7L
	IYeF3hHDnM6KuENxww95dxEQp1ypbINu7LiKttcdAQ4ZaaIsp1rJynZY7xgEVg==
X-Google-Smtp-Source: AGHT+IGxlQqzhqccR5pAw12IpRkO5HU6l2U7IJY1tN6SfFuEzk7LuNMbasBODOHwaki763Q9WfVL5A==
X-Received: by 2002:a05:600c:1d9c:b0:410:3fc8:f75c with SMTP id p28-20020a05600c1d9c00b004103fc8f75cmr433965wms.36.1707379330082;
        Thu, 08 Feb 2024 00:02:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhfKUGOOm413S2cJBFpu4jL9UI8tzRGXXO/2+cg1i87DxvzXXHzPsDS66B7gFMlJ3jVyrNsMd0Jt0T6s/+SMsJzVRaZJNufB4utIG6R6Dsmgw6ln/aGqF+bNmPZGbCWRhRc38/ECQ1y+1JTeZCGz9CYPVOC3MIuKQsisMXcwugjtB0ajQ=
Message-ID: <bb2533df-dbb6-4836-bfe9-3611cd11b7f9@suse.com>
Date: Thu, 8 Feb 2024 09:02:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/p2m: make p2m_get_page_from_gfn() handle grant
 case correctly
Content-Language: en-US
To: George Dunlap <dunlapg@umich.edu>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@cloud.com>
References: <5d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com>
 <8d5df1f4-74ca-27cc-99f0-7e7a82050de1@suse.com>
 <CAFLBxZbO2-f3rdgVhu2j_7sRWSeL5oMZt6pit=6nRvhPn=pqoQ@mail.gmail.com>
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
In-Reply-To: <CAFLBxZbO2-f3rdgVhu2j_7sRWSeL5oMZt6pit=6nRvhPn=pqoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.02.2024 07:32, George Dunlap wrote:
> On Thu, Jun 23, 2022 at 7:54 PM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> Grant P2M entries, which are covered by p2m_is_any_ram(), wouldn't pass
>> the get_page() unless the grant was a local one. These need to take the
>> same path as foreign entries. Just the assertion there is not valid for
>> local grants, and hence it triggering needs to be avoided.
>>
> 
> I think I'd say:
> 
> ---
> The 'fast' path of p2m_get_page_from_gfn handles three cases: normal ram,
> foreign p2m entries, and grant map entries.  For normal ram and grant table
> entries, get_page() is called, but for foreign entries,
> page_get_owner_and_reference() is called, since the current domain is
> expected not to be the owner.
> 
> Unfortunately, grant maps are *also* generally expected to be owned by
> foreign domains; so this function will fail for any p2m entry containing a
> grant map that doesn't happen to be local.
> 
> Have grant maps take the same path as foreign entries.  Since grants may
> actually be either foreign or local, adjust the assertion to allow for this.
> ---

Sure, thanks, I can use this, but then I'd perhaps ought to add your
S-o-b instead of ...

> One more comment...
> 
> 
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Using | instead of || helps the compiler fold the two p2m_is_*().
>> ---
>> v2: The shared case was fine; limit to grant adjustment.
>>
>> --- a/xen/arch/x86/mm/p2m.c
>> +++ b/xen/arch/x86/mm/p2m.c
>> @@ -357,11 +357,11 @@ struct page_info *p2m_get_page_from_gfn(
>>               && !((q & P2M_UNSHARE) && p2m_is_shared(*t)) )
>>          {
>>              page = mfn_to_page(mfn);
>> -            if ( unlikely(p2m_is_foreign(*t)) )
>> +            if ( unlikely(p2m_is_foreign(*t) | p2m_is_grant(*t)) )
>>
> 
> I'm not a fan of this.  If you replace it with || you can have my R-b

... R-b, requiring yet someone else's ack?

> immediately; otherwise we'll have to wait until we can discuss our general
> policy on this sort of thing at the x86 maintainer's call.

I prefer to wait. Considering that even leaving aside the use of
p2m_is_...() "if ( a || b )" is equivalent to "if ( a | b )" (with a and
b of suitable types, of course), and typically requiring less branches
(on x86 at least; architectures with predicated insns of course are
different), personally I'd see us make more use of this in general.
(Hence also the post-commit-message remark.) But yes, Misra in principle
doesn't like such (we've already deviated the underlying pattern,
though).

Of course the compiler is generally in a position to do such a
transformation itself. Just that in at least this specific case I did
observe it not to. I didn't check simpler cases any time halfway
recently.

Jan

