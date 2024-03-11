Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB995878113
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 14:56:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691505.1077530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjg8T-0007Yu-JE; Mon, 11 Mar 2024 13:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691505.1077530; Mon, 11 Mar 2024 13:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjg8T-0007Vh-G9; Mon, 11 Mar 2024 13:56:13 +0000
Received: by outflank-mailman (input) for mailman id 691505;
 Mon, 11 Mar 2024 13:56:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjg8R-0007VY-UY
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 13:56:11 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dc89c24-dfaf-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 14:56:10 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso5266850a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 06:56:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 lt10-20020a170906fa8a00b00a45ab830eabsm2896848ejb.51.2024.03.11.06.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 06:56:10 -0700 (PDT)
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
X-Inumbo-ID: 1dc89c24-dfaf-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710165370; x=1710770170; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QDP7ErY6NRkBE4AyzZdVhP6LRsPdLqAoMkS1X/+Oq2g=;
        b=OmJiR4F/9+fwi1xiLHFEMulb4t6f6fIiikw74dMutekE4atOy+vIwoDc4Ffkb9scvO
         /zO9YHpjJgpjpIk6MwJWD/INXvx5fBY5GegFCWWxeWB6/BD+gFWdmOMtus4XWGKD35Xn
         7vC7npTCvoE0hJk1Hsesl0OdEqb1UFJj4YwN/gKkPpl6ujNCa34xwAvYvBG2m2mAed/o
         U+puiF2G96xnnp5iWW8UMkDeO2lqE3qohgPfUdwAV+a7vAcQmu3aVYu8o1q47Xc/N70h
         rMn/cXvrVDx6wtAf5fP5OnSmE7yPGA2ORO6HuIOXSNur3zG1Wr0BF7uy+nCciBzXF2Ye
         8t6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710165370; x=1710770170;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QDP7ErY6NRkBE4AyzZdVhP6LRsPdLqAoMkS1X/+Oq2g=;
        b=R6LScjMpamJx7VVJPHjvmZmtwlRgbncm9AyxOTQ/ME7LWuMTNVGd1MRvmdxogOzTAh
         xN+jh6G1EhzRlV0GRwhp4sMy8lo+DxqCkJrvRxCOaEz4bkNxEahWD/zFvL0nS/gznoSk
         leopm2Qj2URI/24I2aDljxmFF8uNqdQAzlkcYX7ZyE6aCaf5OH7krAitYdgOivgJ29op
         ObBN35zo7oNxyn/Wap7PZsXe9wgz+H/SlUdMws6g3b1yup697ohIGL3Z9dX9E6Lv/2LW
         hWAe8iND0kqTLAmFXljjJZicGHDdCKo31rE8fKgRZ5b9apWOAp+qlxEUr5EALKFSIlAt
         wxOw==
X-Forwarded-Encrypted: i=1; AJvYcCX5PyjUrn7XWI2tDZdXciBG+ku6dwIkviQ4BVUKfCRPQI/ukl4JXWnfmzQjkGFtF2l7e3URErX3r2175LW6pjGNwWl+d6423bJpO6Y5tng=
X-Gm-Message-State: AOJu0YwrKD7gsgtl8KfvD7CNQVYhWLK0MiGVqClnfXZ6XhwExfk8rcj5
	2+kxJvEitMGaLrsPoS6SarKAR9bcKEFRvzfBGIXi5CpEpv76XXjrLPBICUYJQw==
X-Google-Smtp-Source: AGHT+IFtNB2nYNoB1DibmJG+hGzbaGVzA96D6WaV9uI8HLszYuIihebzeCoTJC/YDis7ChLxduaSKA==
X-Received: by 2002:a17:906:dfd7:b0:a45:b761:2c2 with SMTP id jt23-20020a170906dfd700b00a45b76102c2mr347813ejc.60.1710165370324;
        Mon, 11 Mar 2024 06:56:10 -0700 (PDT)
Message-ID: <a9f85f2b-3eae-4544-88dd-6984011f0ef9@suse.com>
Date: Mon, 11 Mar 2024 14:56:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 03/16] misra: add deviations for direct inclusion
 guards
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <1fdfec12fd2207c294f50d01d8ec32f890b915d7.1710145041.git.simone.ballarin@bugseng.com>
 <adeb5103-81b4-4f04-9ff6-a0526c8065db@suse.com>
 <6472eb42-157a-4d6e-b5bb-daa74fbbd97b@bugseng.com>
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
In-Reply-To: <6472eb42-157a-4d6e-b5bb-daa74fbbd97b@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 13:00, Simone Ballarin wrote:
> On 11/03/24 11:08, Jan Beulich wrote:
>> On 11.03.2024 09:59, Simone Ballarin wrote:
>>> --- a/xen/arch/arm/include/asm/hypercall.h
>>> +++ b/xen/arch/arm/include/asm/hypercall.h
>>> @@ -1,3 +1,4 @@
>>> +/* SAF-5-safe direct inclusion guard before */
>>>   #ifndef __XEN_HYPERCALL_H__
>>>   #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
>>>   #endif
>>> --- a/xen/arch/x86/include/asm/hypercall.h
>>> +++ b/xen/arch/x86/include/asm/hypercall.h
>>> @@ -2,6 +2,7 @@
>>>    * asm-x86/hypercall.h
>>>    */
>>>   
>>> +/* SAF-5-safe direct inclusion guard before */
>>>   #ifndef __XEN_HYPERCALL_H__
>>>   #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
>>>   #endif
>>
>> Iirc it was said that this way checking for correct guards is suppressed
>> altogether in Eclair, which is not what we want. Can you clarify this,
>> please?
>>
> 
> My first change was moving this check inside the guard.
> You commented my patch saying that this would be an error because someone can
> include it directly if it has already been included indirectly.
> I replied telling that this was the case also before the change.
> You agreed with me, and we decided that the correct thing would be fixing the
> check and not apply my temporary change to address the finding.
> 
> Considering that the code should be amended, a SAF deviation seems to me
> the most appropriate way for suppressing these findings.

Since I don't feel your reply addresses my question, asking differently: With
your change in place, will failure to have proper guards (later) in these
headers still be reported by Eclair?

Jan

