Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6D48A95D3
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 11:18:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708147.1106778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxNtn-00072B-CD; Thu, 18 Apr 2024 09:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708147.1106778; Thu, 18 Apr 2024 09:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxNtn-0006zl-7N; Thu, 18 Apr 2024 09:17:43 +0000
Received: by outflank-mailman (input) for mailman id 708147;
 Thu, 18 Apr 2024 09:17:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxNtl-0006zf-S3
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 09:17:41 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80c0ad89-fd64-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 11:17:39 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-349caee176bso389192f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 02:17:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g30-20020adfa49e000000b00343f662327bsm1337989wrb.77.2024.04.18.02.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 02:17:38 -0700 (PDT)
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
X-Inumbo-ID: 80c0ad89-fd64-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713431859; x=1714036659; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5kE6rlbXaEc4qwF2cwWOEtrQQM95MMQlgYpURHGtOE=;
        b=RPzsnxiOhLBS3pDgxzl+1gujoZ7zJJorLG4j3Jz6GOn1qs6za/SGT7jpMXEVfz2pNG
         1NSOyf99D4Cjx+0vg7yZey9QTrOacTHF6yp4WTZ6IHYyZncmJ0Jed92fX6RDU/MNCV96
         60c41iQol97TZ3qdyznt02x4M2NDT6WFiiORJsaxteHCVG4MxxcTTdHjmoNnrffG8jvm
         O74RpMtx7Rb+7mKQLGpyqPU1EcNecMARY4Mq6NPMw52V5axmda8gVDk1wIOD74OU7se7
         4NvEYU8D4eh7uzMS6iFDPzYJlzzmr5hrQPmfQX1N1zeq4MBvnzAJRa+6o9j7LKbR51Zi
         ZXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713431859; x=1714036659;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5kE6rlbXaEc4qwF2cwWOEtrQQM95MMQlgYpURHGtOE=;
        b=aYzyYCAHkiSEg7E769c7GJqSbkpriK//LFFnytykbq+OCAwGk3q5zxKI5udsghLp6q
         cYY0HVf6dEcWUH6bqqPbYSk1AGOiYcmVsLvKK5xcxVVwCxSu8OQpKd2b63lzsIWyAEan
         p8J+lOwQ/pPRR/Vvr+iA32b5q77Gz6m45EZZoJoFEvqGG2bN39hx4kGDrvTq2vB68EzD
         sk176Fj76DAbzjn1/6aL0JdQbT6gZhsJ/9SA/TGpOYz1OaiuvJaY4THLGgwaZjs97Tz6
         QyeUa7QoSvMNx86lZoe5O1DZ5DVyBa5Xtonh0t8FVIIq4paCXs8E3o7QqWOa40QC52qc
         jauw==
X-Forwarded-Encrypted: i=1; AJvYcCV6yrLy0YGYOy9c84bkKiE4QagoHRZWRn1QPgPvb7MWp9VEvD/hn41rZQybk29+A8QNBSFbm7Hus0vh3xshwlMfRmEV8ldElUTZcFeoXVI=
X-Gm-Message-State: AOJu0Yxu3v82LIj2WY0zSv+aaGlGCMkqF0g1fcvfHn1FdoXYtQaUByz2
	tQ4qldUpoZktRI3OdpXwXVK+Mxp9F/f+Y1dy3AMnFqsywyICXvSWywidUSbxrg==
X-Google-Smtp-Source: AGHT+IHShF68dQf/HXD0tWegNkwQyss1Ec1gSmdCpR3B+hi8ZWzGLSJ7OeFOTsTOTRUQPIZdK/whrw==
X-Received: by 2002:adf:f982:0:b0:345:daff:97e0 with SMTP id f2-20020adff982000000b00345daff97e0mr1161547wrr.16.1713431859004;
        Thu, 18 Apr 2024 02:17:39 -0700 (PDT)
Message-ID: <cd468e0c-40a6-41f6-9989-563dec881398@suse.com>
Date: Thu, 18 Apr 2024 11:17:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] gzip: refactor state tracking
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
 <20240411152518.2995-4-dpsmith@apertussolutions.com>
 <360958a2-5b0d-4fbc-8637-2a33185bdd8d@citrix.com>
 <efb44106-832b-409a-a810-7821e830ac81@suse.com>
 <3ab847bd-b738-48b8-865b-62f7c488386b@apertussolutions.com>
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
In-Reply-To: <3ab847bd-b738-48b8-865b-62f7c488386b@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.04.2024 11:13, Daniel P. Smith wrote:
> On 4/18/24 03:36, Jan Beulich wrote:
>> On 11.04.2024 21:24, Andrew Cooper wrote:
>>> On 11/04/2024 4:25 pm, Daniel P. Smith wrote:
>>>> diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
>>>> index 1bcb007395ba..9b4891731b8b 100644
>>>> --- a/xen/common/gzip/gunzip.c
>>>> +++ b/xen/common/gzip/gunzip.c
>>>> @@ -102,12 +109,13 @@ __init int gzip_check(char *image, unsigned long image_len)
>>>>   
>>>>   __init int perform_gunzip(char *output, char *image, unsigned long image_len)
>>>>   {
>>>> +    struct gzip_data gd;
>>>>       int rc;
>>>
>>> By the end of this series,
>>>
>>> Reading symbols from xen-syms...
>>> (gdb) p sizeof(struct gzip_data)
>>> $1 = 2120
>>>
>>> x86 has an 8k stack and this takes 1/4 of it.  Other bits of state are
>>> dynamically allocated, even in inflate.c, so I'd highly recommend doing
>>> the same for this.
>>>
>>>
>>> Also, could I nitpick the name and request:
>>>
>>> struct gzip_state *s;
>>
>> Except: Why "gzip" when it's un-zipping state?
> 
> Gzip is the name of the algo/suite for which the code is moved under, 
> and in typical fashion its structures are named after the feature they 
> belong. Still, I went and looked at the other algos. I found two that 
> have state tracking and yes, they do use the operation for the struct 
> name and not the algo/feature under which they reside. If you want this 
> yak shaved, I have no vested interest one way or another, I just need 
> the decompressor to be re-entrant.

Well. Generally speaking compressor and decompressor may need different
state to track. As we have seen with tmem, there may be reasons why a
compressor may also be needed in Xen. Hence unless it is known for sure
that either no need will ever appear for gzip, or gzip's compression
and decompression states are identical, I'd prefer the struct name to
reflect the specific purpose.

Jan

