Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ACB8B948C
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 08:14:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715529.1117222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Phm-000393-Os; Thu, 02 May 2024 06:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715529.1117222; Thu, 02 May 2024 06:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Phm-00036B-LS; Thu, 02 May 2024 06:14:06 +0000
Received: by outflank-mailman (input) for mailman id 715529;
 Thu, 02 May 2024 06:14:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2Phl-000365-R8
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 06:14:05 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d615b12-084b-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 08:14:04 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d8a2cbe1baso98664891fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 23:14:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b0041c14061c71sm710626wmq.15.2024.05.01.23.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 23:14:02 -0700 (PDT)
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
X-Inumbo-ID: 2d615b12-084b-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714630444; x=1715235244; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FwcLNS+C1DcjgGVhCSJg6/XZY1PNQQ9sD3B4uti7yck=;
        b=IOZ9I3awFibb7fnnGgoanP/2lIxsHsGGeKkbrjcj5gTbpxW+vhrDaoJ3cCtiTBnsc4
         nQtMw/xwC4w0VwDn0GJ+NJ93FSyo8ccZOxtVt+iP7WRDdVw43Ju6+N/monAuRnXBsqhd
         ICggrQ7ElE5yJBgyVWb5qKKRSGt9XIEgg4P5xd4grtZXdF6LsmlVXscvDwofBi2QYFVa
         unCVLj/jYa3ebaNAimzc9BGbs8TQxINXEhLtS1kNEqcai/4ntfyAxy8BKhM2zLazM5w2
         swz0/um7doJk2LPRWTd8/20VRjv14i4DtpXyG4X9oLo49ULgIZzFpJJcgFmdrJz96gqc
         twfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714630444; x=1715235244;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwcLNS+C1DcjgGVhCSJg6/XZY1PNQQ9sD3B4uti7yck=;
        b=aevoCg8n3qk7i8Bz7d62z0TVwbcGFBHy1v3O1tE2UG54cypXvGfh8iAWkhjnw3U180
         +kSGy3yI6S1RjTGvFHcUb+6MJSS1eBiKEHfD88GHd/sdf/yL/BHYTypa0Pyyh6mDHwdm
         zuvsvAAi1a/yUl2GEYJ2hyiG1lOeLWHLQqRneoKBqG13HvBZ+2RMsujU0NeNwa/W3/kH
         2V7hV3QLl4kS8N8/WqPZdJKa8DelOEjqZQzLIoMHewUcMijrsuK8anKOFfNn/y7WWL20
         2gl1amorHlY4f+8adV67+WMSkz1sjboeXsQKyV0zCGNeR03poEh4onfOf/8kn86+4oim
         z3xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO9ij92fmd54cLOjiPtMWZgo/KqFRVXyVPGcz30tZrM+GKpuzOs3UHWr2S37ypYm0YYJ6kkLoAydsILNSOmoIqBQGwBAIHhO0vu20rKdg=
X-Gm-Message-State: AOJu0YxmLpzFiJNfqt28MQ8Ff//f8qgRKbQayKX2GEIt4iP+15FdGcDr
	M5r4ZSnfIChEDd8Ko4p+lTgoTFcYsNS7m/U6m3JjcVI1G9i7VZRkB6jLV5YJxw==
X-Google-Smtp-Source: AGHT+IH1fe5sxrvlFkdTSFmEC7kjbe9VBmIlwn/s1M1vuZdwO8ZBz6tEuwesvDgxMU5E/bCjHwDUoQ==
X-Received: by 2002:a2e:9b12:0:b0:2dd:d3a0:e096 with SMTP id u18-20020a2e9b12000000b002ddd3a0e096mr894362lji.31.1714630442516;
        Wed, 01 May 2024 23:14:02 -0700 (PDT)
Message-ID: <de09e134-0150-49ca-8338-a0f4759c218b@suse.com>
Date: Thu, 2 May 2024 08:14:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible array
 member not at the end
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240430110922.15052-1-luca.fancellu@arm.com>
 <20240430110922.15052-3-luca.fancellu@arm.com>
 <327c7e42-9b59-4925-b746-0b59dbb5a3fb@suse.com>
 <91B23E5F-7515-4C4E-9FBD-57654980905F@arm.com>
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
In-Reply-To: <91B23E5F-7515-4C4E-9FBD-57654980905F@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.05.2024 08:57, Luca Fancellu wrote:
> Hi Jan,
> 
>> On 30 Apr 2024, at 12:37, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 30.04.2024 13:09, Luca Fancellu wrote:
>>> --- a/xen/arch/arm/include/asm/setup.h
>>> +++ b/xen/arch/arm/include/asm/setup.h
>>> @@ -64,18 +64,20 @@ struct membank {
>>> };
>>>
>>> struct membanks {
>>> -    unsigned int nr_banks;
>>> -    unsigned int max_banks;
>>> +    __struct_group(membanks_hdr, common, ,
>>> +        unsigned int nr_banks;
>>> +        unsigned int max_banks;
>>> +    );
>>>     struct membank bank[];
>>> };
>>
>> I'm afraid I can't spot why __struct_group() is needed here. Why would just
>> one of the two more straightforward
>>
>> struct membanks {
>>    struct membanks_hdr {
>>        unsigned int nr_banks;
>>        unsigned int max_banks;
>>    );
>>    struct membank bank[];
>> };
>>
> 
> At the first sight I thought this solution could have worked, however GCC brought me back down to earth
> remembering me that flexible array members can’t be left alone in an empty structure:
> 
> /data_sdc/lucfan01/gitlab_mickledore_xen/xen/xen/arch/arm/include/asm/setup.h:70:6: error: declaration does not declare anything [-Werror]
> 70 | };
> | ^
> /data_sdc/lucfan01/gitlab_mickledore_xen/xen/xen/arch/arm/include/asm/setup.h:71:20: error: flexible array member in a struct with no named members
> 71 | struct membank bank[];
> | ^~~~
> [...]

Since for patch 1 you looked at Linux'es uapi/linux/stddef.h, the solution
to this lies there, in __DECLARE_FLEX_ARRAY(). Alongside or instead of
borrowing __struct_group(), we could consider borrowing this as well. Or
open-code it just here, for the time being (perhaps my preference). Yet
it's not clear to me that doing so will actually be enough to make things
work for you.

Jan

