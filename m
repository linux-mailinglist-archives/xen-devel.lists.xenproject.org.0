Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AEF976D4D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 17:13:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797621.1207613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1solVN-0002Ry-2O; Thu, 12 Sep 2024 15:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797621.1207613; Thu, 12 Sep 2024 15:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1solVM-0002PW-Vu; Thu, 12 Sep 2024 15:13:08 +0000
Received: by outflank-mailman (input) for mailman id 797621;
 Thu, 12 Sep 2024 15:13:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1solVL-0002PQ-91
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 15:13:07 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 832d91c7-7119-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 17:13:06 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so367055666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 08:13:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d40b78sm758555766b.193.2024.09.12.08.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 08:13:05 -0700 (PDT)
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
X-Inumbo-ID: 832d91c7-7119-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726153986; x=1726758786; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LWza+RcXoo7QDVHzsn6ATDTyPpK23MIgGrTAzqcSZQE=;
        b=LFePPLcXqfsSzpbIw0+q6Xq2HOYjkZoNeMidJrDp89SBF0Fdl9yeimFjUuUJa0nZjY
         lbfqtb7f7ZYzdF5xqW3ag0/HOLA0d2IIOt8jSPFTu3wsIZFGFmPZAsKCIBSS8eqQVuRD
         cJ/N66WlsuS/O/HXal78PAVi5obPxp/AsHOFpmUbg5krGETk95gYEiUL18Berm6gl3FI
         Yj/r7D9seBGP/k7FFBRPoQKdYzFSVoRjFX6Tc/2hIFzVHjsqv79N8KKvN/pmAL/fplCj
         VKlUkF/8M8jOLeTitS5/f+F2FeaNoql44ABy/vApXDE0KYJrq47Qpkxe0x6wewrSKwb0
         PdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726153986; x=1726758786;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWza+RcXoo7QDVHzsn6ATDTyPpK23MIgGrTAzqcSZQE=;
        b=dEd6TSFOUoidiVrzWaTYBNBPD3hKiH7+gTsjttkjwfEuH2aHF1ZWU4usKuyp4TmCD7
         8m/4kZyYa836XwH0fkAXPXxkO/VnJDgCrkSz/yszzi2GLoUkx8INdj1J4BXSfVBvf1hZ
         GY+u+0nNATtMU6vRZs4EjxUjUz2iVeluWIB8gI04whkIPdMJE/EkElJysTPgK6TkUGdl
         pJgj6EBc0602SsDTC+EVH1uG9RRfLIyxviW83VW+i+IVYuYkpU/RzTkWM625c+6Wo4wJ
         OoeNHE43k2+C4fB8Zla2eb45aBrVqT7Yafg305wKZ0iLP0HhmHYK4UtLTWZXmv6P7Ftw
         lf/A==
X-Gm-Message-State: AOJu0Yw0dv8WC/8bkgE995ejDiCKNmviMJzjV56zG3sAGw9Qv7utSk9k
	q8X++WsqegYAhozj9QfEcb0fdMdIVUFF+KN7/7lsLbC3gm+vNfSTGS/xM8WKPw==
X-Google-Smtp-Source: AGHT+IEKpCD7oiJUrut3UAR7HVo8Zphw7vUK0GzM+VM2qyp9UKqbWIClWqdxZJfz9NhoT2bRAPjo5Q==
X-Received: by 2002:a17:907:944d:b0:a7d:c464:d5f3 with SMTP id a640c23a62f3a-a902a431263mr355321566b.11.1726153985367;
        Thu, 12 Sep 2024 08:13:05 -0700 (PDT)
Message-ID: <54885d19-3efc-47b7-ad09-5bb99b4e3a05@suse.com>
Date: Thu, 12 Sep 2024 17:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | 221f2748
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <66e2e41b9f8da_2ec0c1018481a@gitlab-sidekiq-catchall-v2-85fcd868d7-x8qhw.mail>
 <efdda482-3fea-476b-b911-15a63a188e50@suse.com>
 <ZuMEAMpg-Pi_n6v2@macbook.local>
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
In-Reply-To: <ZuMEAMpg-Pi_n6v2@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.09.2024 17:08, Roger Pau Monné wrote:
> On Thu, Sep 12, 2024 at 04:30:29PM +0200, Jan Beulich wrote:
>> On 12.09.2024 14:52, GitLab wrote:
>>>
>>>
>>> Pipeline #1450753094 has failed!
>>>
>>> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
>>> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
>>>
>>> Commit: 221f2748 ( https://gitlab.com/xen-project/hardware/xen/-/commit/221f2748e8dabe8361b8cdfcffbeab9102c4c899 )
>>> Commit Message: blkif: reconcile protocol specification with in...
>>> Commit Author: Roger Pau Monné
>>> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
>>>
>>>
>>> Pipeline #1450753094 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1450753094 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
>>> had 13 failed jobs.
>>>
>>> Job #7809027717 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7809027717/raw )
>>>
>>> Stage: build
>>> Name: ubuntu-24.04-x86_64-clang
>>> Job #7809027747 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7809027747/raw )
>>>
>>> Stage: build
>>> Name: opensuse-tumbleweed-clang
>>> Job #7809027539 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7809027539/raw )
>>>
>>> Stage: build
>>> Name: debian-bookworm-clang-debug
>>
>> I picked this one as example - Clang dislikes the switch to bool in
>>
>> --- a/xen/arch/x86/include/asm/mm.h
>> +++ b/xen/arch/x86/include/asm/mm.h
>> @@ -286,8 +286,8 @@ struct page_info
>>          struct {
>>              u16 nr_validated_ptes:PAGETABLE_ORDER + 1;
>>              u16 :16 - PAGETABLE_ORDER - 1 - 1;
>> -            u16 partial_flags:1;
>> -            s16 linear_pt_count;
>> +            bool partial_flags:1;
>> +            int16_t linear_pt_count;
>>          };
>>  
>>          /*
>>
>> for places where that field's set using PTF_partial_set:
>>
>> arch/x86/mm.c:1582:35: error: converting the result of '<<' to a boolean always evaluates to true [-Werror,-Wtautological-constant-compare]
>>             page->partial_flags = PTF_partial_set;
>>                                   ^
>> I wonder why we're not using plain "true" there. Alternatively the change to
>> bool would need undoing.
> 
> I'm hitting this locally when building with clang.
> 
> I find it confusing that the partial_flags field cannot possibly be a
> flags field, for it having a width of 1 bit.

I meanwhile guess the idea may have been that the field could be widened
if needed, and the low bit would then retain its present meaning. How
well that would work out if a need for that arose I can't tell of course.

> I think my proposal would be to rename to partially_validated (or
> similar) and set it using `true`, but that would also imply re-writing
> part of the comment in struct page_info definition.

This may have been named just "partial" originally. Yet with the above
maybe we really should switch back to uint16_t (for the time being; I'm
unconvinced of the use of fixed-width types here, or in general when it
comes to bitfields).

Jan

