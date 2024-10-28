Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F9C9B3467
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:07:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826646.1240981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5RKS-0007Ui-5g; Mon, 28 Oct 2024 15:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826646.1240981; Mon, 28 Oct 2024 15:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5RKS-0007SO-36; Mon, 28 Oct 2024 15:06:48 +0000
Received: by outflank-mailman (input) for mailman id 826646;
 Mon, 28 Oct 2024 15:06:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5RKQ-0007Oz-Tv
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:06:46 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fa4af64-953e-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 16:06:46 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-539e63c8678so4417447e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 08:06:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b57b5d9sm141504405e9.44.2024.10.28.08.06.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 08:06:45 -0700 (PDT)
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
X-Inumbo-ID: 3fa4af64-953e-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730128005; x=1730732805; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gqflbiWmtpOO6U9/BwdFS9BlUbLmiRF9EkK1xJKr7vk=;
        b=WoMVZqiozXe2aIK1lSIiec6GBSaB2cSs+wql+wrUTDhy42MvfGAsqp8BU5FiYMpRSU
         zhcFSi1Ye9HomvhiaE6Vj4BjnFkG6jT0eoF1aK40f32Xo+q8jsZ4LGWGQyJ+/4KJDriv
         92T5Q7r7eRuLHsGduiNO4rdf07GzVmoJxA+NFAPhocLX2hLn/aVGPKqZzvV0zMYL+92Z
         UEsQ3tdtq1RUP5Vr5pFA/9JOv8vxNXzDPTUE3maq/VsyJeuk95HMJtRd7Jhd9jNk/eNy
         n4VwAP34Aq67bqrV+iE83Ve/ASLTe/wCPxP7zzrlHR6TSJcF/hn/UQVHIdOxg+w63YV9
         4iVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730128005; x=1730732805;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqflbiWmtpOO6U9/BwdFS9BlUbLmiRF9EkK1xJKr7vk=;
        b=p6SP++BcjYmk+I4EQ2vsdvLW00Smi22toFSuF22PjLX7wJ8YsjAlsrIeh/ywvclOYE
         mFx7kPrVdjDBQR6j1Fl/Tuy7qAAupcqqritiQbAW8qqQMREhsCMouzTbBHfNhkkuHq68
         8I4k3ExS/fqgl0oWQns2CCqUQjuzSJ1a6OGObI513ekBvcNzFPebcWwxW4xdsd3K1YHa
         wY/LzjOuNzxwo5sBsWZOfYVljLnBKKmdaJ91eI7T0r8aPy8yUA8LhRqgSd/Il21IOGQX
         f0zeg7m8Y9Gsq/JEaq9sm97ktOnC+FdNOIDz/9j4lN23YNO+QQFKvNum0DF4GTeEqubu
         KJrg==
X-Forwarded-Encrypted: i=1; AJvYcCVkGiEBBDq3SIxeHrcIAPwBbqXhlV5l9Y2xBg7akkFBbyDs+h9fEJRCCyBnUHzGz7VQzALG9ToV/V4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUwTS97TptwTgyk9HzyT/AlNR1TaysnKqRzNWChgfuqEXdnL/5
	1+vKw+u8Kszbe965Ru8v7YSGOqA1586RIaQVynN+o4dvkL7rJkGMRCKRV6WX3A==
X-Google-Smtp-Source: AGHT+IH1CqghehB/hLtpuc5KC04MSTui9lOqHvdrlub2y/Jjr6NaEUUz44Vz8pPTccD8KncdcvGJgg==
X-Received: by 2002:a05:6512:401f:b0:539:9155:e8d4 with SMTP id 2adb3069b0e04-53b348c1e25mr3307100e87.8.1730128005428;
        Mon, 28 Oct 2024 08:06:45 -0700 (PDT)
Message-ID: <b1b428bf-9842-4b07-9438-c64b286d236d@suse.com>
Date: Mon, 28 Oct 2024 16:06:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] x86/ucode: Move the CPIO path string into
 microcode_ops
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-8-andrew.cooper3@citrix.com>
 <2e3dfea1-8277-4d4e-b594-87b3cac3052b@suse.com>
 <d54ed169-fd41-41b3-9222-50e858c0b622@citrix.com>
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
In-Reply-To: <d54ed169-fd41-41b3-9222-50e858c0b622@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.10.2024 15:38, Andrew Cooper wrote:
> On 28/10/2024 2:25 pm, Jan Beulich wrote:
>> On 28.10.2024 10:18, Andrew Cooper wrote:
>>> We've got a perfectly good vendor abstraction already for microcode.  No need
>>> for a second ad-hoc one in microcode_scan_module().
>>>
>>> This is in preparation to use ucode_ops.cpio_path in multiple places.
>>>
>>> These paths are only used during __init, so take the opportunity to move them
>>> into __initconst.
>> As an alternative to this, how about ...
>>
>>> --- a/xen/arch/x86/cpu/microcode/private.h
>>> +++ b/xen/arch/x86/cpu/microcode/private.h
>>> @@ -59,6 +59,13 @@ struct microcode_ops {
>>>       */
>>>      enum microcode_match_result (*compare_patch)(
>>>          const struct microcode_patch *new, const struct microcode_patch *old);
>>> +
>>> +    /*
>>> +     * For Linux inird microcode compatibliity.
>>> +     *
>>> +     * The path where this vendor's microcode can be found in CPIO.
>>> +     */
>>> +    const char *cpio_path;
>>     const char cpio_path[];
>>
>> inheriting the __initconst from the struct instances?
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> with a slight preference to the form without the extra pointer.
> 
> I'm slightly surprised at this request, given that the form with the
> pointer results in less data held at runtime.

No, it doesn't. Yet I only now realize that ...

>>  Except that:
>> gcc14 looks to be buggy when it comes to the copying of such a struct. The
>> example below yields an internal compiler error. And the direct structure
>> assignment also doesn't quite do what I would expect it to do (visible when
>> commenting out the "else" branch. Bottom line - leave the code as is.
> 
> It's unfortunate to hit an ICE, but the copy cannot possibly work in the
> first place.
> 
> ucode_ops is in a separate translation unit and has no space allocated
> after the flexible member.   Any copy into it is memory corruption of
> whatever object happens to be sequentially after ucode_ops.

... my expectation of how the copy ought to work (and how the C standard,
at least in close enough an example, specifies it) would specifically _not_
suit our needs. The copy ought to only cover sizeof(struct ...), i.e. not
the string. Yet we'd need that string to be copied to be usable for our
purposes.

> The only way it would work is having `const char cpio_path[40];` which
> is long enough for anything we'd expect to find.
> 
> But again, that involves holding init-only data post init.

This, indeed, would increase post-init size. Yet with the compiler issue
no question arises anyway as to how this needs doing.

Jan

