Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F167D83AD6B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 16:33:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671104.1044262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSfFQ-0001Qo-Am; Wed, 24 Jan 2024 15:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671104.1044262; Wed, 24 Jan 2024 15:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSfFQ-0001O5-6x; Wed, 24 Jan 2024 15:33:04 +0000
Received: by outflank-mailman (input) for mailman id 671104;
 Wed, 24 Jan 2024 15:33:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSfFO-0001Nz-I7
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 15:33:02 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db1983b9-bacd-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 16:33:00 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2cd2f472665so58613651fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 07:33:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m3-20020a056602018300b007bee55fd6e5sm6903572ioo.43.2024.01.24.07.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 07:32:59 -0800 (PST)
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
X-Inumbo-ID: db1983b9-bacd-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706110380; x=1706715180; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i1hmwnHTXz6m2lr90jo4Z3WUtCGsoyqYBpj9xkitF68=;
        b=abS2Nsvp39aJA6lV9ErjMoMNRtaFjqGzMrqSbcnKF5wvs2N7bVmowqwR6GnL2YxvaB
         Yls+gG07uKjor3oimFt+2oHPVtira0LIDW8CiPBrx5foTdkiV3HppEyRN1QuQLBReaLe
         IlGU3hJLN1/NjIPynkI0r0YpImQnZgofx0/InGUA5nmbTjV2gatZEhPu43STIys6D2y6
         S6Ha2IrgOCBIAt0rzmgaS97VOFar6yiKdZ5xZkK2Sv3tX4jdvQ9bw31O06+E1VAKnm/1
         jhNIOqy311MpVZ2yyEuazgDlKCcoaf+v2HW8p2qmsOnbgLYmEeEPw1cwY50Q61YG+qb4
         7/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706110380; x=1706715180;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1hmwnHTXz6m2lr90jo4Z3WUtCGsoyqYBpj9xkitF68=;
        b=wvwTHCtpgHducKEog1J3R+NYEPdbYrkUvn9paPdQqmEnudE/Jb/kuMhj2UuRyTvpq8
         wuthsigqubT7N9/S9SPm8JD9ktFVfjpPyARVei/9B0soN4G7ENxNUzRY1dEMmW6DO2sY
         lWkFRPUsLvyyglam9xR0Cn4ZWM5G8tAplO6V4gMRLbh1K5PtrPjrhJ3NbB99vQ+Xpfpc
         tUovQFd/K7z0zSe0NTcfwT+2tNKY3M3COL9+KFta/r3PjxSybRLki2m4DDGav2z4oh3M
         xAPt8aNunyUoAxlj3s9ltI5Q8zT0/x2idRsa1jJYZDuh5WpUZwAKHaZWCfEnwJnv+GGB
         I4Mg==
X-Gm-Message-State: AOJu0Yx8O+RQdOx7xUnW7GKKgpZ7UpBrcfLs6hZRk0YcC+TQ+8tqHz2p
	tngBfvh/YshlYgSVL3aPOFQgfT2xeKcQ/cg9iLdZKrZdMt0vH16DGnS9/uxggw==
X-Google-Smtp-Source: AGHT+IHm/eHDVBPZ7rHxAmGji/yEGS2AU2o5yw4RJY8uy9vbYZT9ClKH2CdzGND3Hcd6q7W8i9IYgA==
X-Received: by 2002:a05:651c:1ca:b0:2cf:30ee:6472 with SMTP id d10-20020a05651c01ca00b002cf30ee6472mr34019ljn.6.1706110379834;
        Wed, 24 Jan 2024 07:32:59 -0800 (PST)
Message-ID: <855376bd-3744-4663-8fce-264a87465a2c@suse.com>
Date: Wed, 24 Jan 2024 16:32:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/34] xen/lib: introduce generic find next bit
 operations
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <bb47caf6c275d8aea307b96e79828831eab4a703.1703255175.git.oleksii.kurochko@gmail.com>
 <81e5cac4-90f0-4fff-b891-53ca73c61832@suse.com>
 <05d685b0b7ccd329454a336b20351979bdf91ea4.camel@gmail.com>
 <8e60f998-aeb4-4648-a3e9-d083bb8eefde@suse.com>
 <2974faee197b0a60d6e7ac54356639706c2ecb43.camel@gmail.com>
 <b7c58adb-f3e2-4089-bba4-3f7f0740f111@suse.com>
 <d1f0a6d418b228860f2e84b89bcbd18b430e9305.camel@gmail.com>
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
In-Reply-To: <d1f0a6d418b228860f2e84b89bcbd18b430e9305.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.01.2024 16:04, Oleksii wrote:
> On Wed, 2024-01-24 at 12:24 +0100, Jan Beulich wrote:
>> On 24.01.2024 10:34, Oleksii wrote:
>>> On Tue, 2024-01-23 at 14:37 +0100, Jan Beulich wrote:
>>>> On 23.01.2024 13:34, Oleksii wrote:
>>>>> On Tue, 2024-01-23 at 12:14 +0100, Jan Beulich wrote:
>>>>>> On 22.12.2023 16:13, Oleksii Kurochko wrote:
>>>>>>> --- /dev/null
>>>>>>> +++ b/xen/lib/find-next-bit.c
>>>>>>> [...]
>>>>>>
>>>>>> I was going to ask that you convince git to actually present
>>>>>> a
>>>>>> proper
>>>>>> diff, to make visible what changes. But other than the
>>>>>> description
>>>>>> says
>>>>>> you don't really move the file, you copy it. Judging from
>>>>>> further
>>>>>> titles
>>>>>> there's also nowhere you'd make Arm actually use this now
>>>>>> generic
>>>>>> code.
>>>>> I wanted to do it separately, outside this patch series to
>>>>> simplify
>>>>> review and not have Arm specific changes in RISC-V patch
>>>>> series.
>>>>
>>>> Then do it the other way around: Make a separate _prereq_ change
>>>> truly
>>>> moving the file.
>>> So this one patch should be separated by 2? One which moves find-
>>> next-
>>> bit.c from Arm to xen/lib, and second where xen/lib/Makefile is
>>> updated.
>>
>> No, that would break the Arm build. I suggested breaking out this
>> patch from the series, and then doing what the description says:
>> Actually move the file. I don't think I suggested splitting the
>> patch. Even the breaking out of the series was only because you
>> said "I wanted to do it separately, outside this patch series".
> What I meant was that I would like to have a patch which introduces
> generic version of find-next-bit in the current patch series and
> provide a separate patch outside of the current patch series which
> switches Arm to use generic version.

I understand that this is what you meant. Yet I don't like the
duplication of code, even if it's only temporary. The more that iirc
git can show proper history for moved files, while there'll be a
disconnect when you first add a 2nd copy and later purge the original.
If you want this change separate from the series - fine. But then, as
said, please as a prereq patch.

Jan

