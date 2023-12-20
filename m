Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E64819B13
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 10:04:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657460.1026295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsUe-0005gO-UB; Wed, 20 Dec 2023 09:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657460.1026295; Wed, 20 Dec 2023 09:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsUe-0005d8-Rc; Wed, 20 Dec 2023 09:03:56 +0000
Received: by outflank-mailman (input) for mailman id 657460;
 Wed, 20 Dec 2023 09:03:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFsUd-0005d2-Rm
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 09:03:55 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2e3e019-9f16-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 10:03:53 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d3352b525so6159255e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 01:03:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c444800b0040d2e37c06dsm4365776wmn.20.2023.12.20.01.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 01:03:52 -0800 (PST)
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
X-Inumbo-ID: b2e3e019-9f16-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703063033; x=1703667833; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jbpTp+bhvBXZXu2uiBzL+/2Efsmokikw5ozC+4yechU=;
        b=AAC2B13fAhHMJh+UoriZ+hO2HRflbNN6XEJN88xBuJ9jGhRzzPklqJKQInbucNZ611
         8jbreDvvkBtymhF4C4Ja+c2D6bTqNPSgJrgzeo7aAHRFk9uVJFLFEPP5KkP/VK/XI65O
         Xs6RwsYYL8t1lYRkv9QgiRzi2qju5lJrDssQvGzHmNL5oKJfc4AWnM4x85U83jF6GWQi
         UYOlokldoWnxyxolBwkGycA1Mfu0UW0Hqgd6g35RMc/i/KWRspgElSpgd7vc11ZQvRW/
         4+gDSgaqd2jyaTTyE1Oe5ThycYaT8t8B3vGnTrh7WCtxChJU9mBRggWKn6l1PmwzRBh9
         ZBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703063033; x=1703667833;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jbpTp+bhvBXZXu2uiBzL+/2Efsmokikw5ozC+4yechU=;
        b=tIptlOiZWSxRQSfYs1FbsgwA7RNikQWTpQnpH9r5Ktw/lf4GNoSIWs/fnuab8O72mG
         MBocyctmfvWILOPlwsu9aox1NwU87OsCrmDgF0MQ/1nmZdRrtXFDaJE0T02SeamGgDZk
         ZwYDKuT3gfrp+z0ztlPDCgrwnS61NS3tp3d04VQUpk4KQojSV91JZvsPqeksM1hsXEi+
         1KsM5PzgPmtobITXcuBLoiSO6/MqOQH+TDaSDup9PyMUuiUiP356yfwjZbfMaDSWHn7o
         ou+vizDQNl9rTNGGkRg7eZ1SrdGX1adBJ2+J8hG/33CpTzRdm2an9Yq7y7npPCqB/QfY
         XOEA==
X-Gm-Message-State: AOJu0YwrD1akC5Cx3GUPAfRS1vAI9sri8c8npJPSOzRFnhAIyLtQRWNS
	DX9wYSi0iO9hgL1SCju8I4Ps
X-Google-Smtp-Source: AGHT+IFNG6d80U6pJZt57Ee+su+SJtkdz6ZZGMEsiIsMw4yMEGLAo547IBqyl206gDJW0AclaFAOGA==
X-Received: by 2002:a05:600c:538c:b0:40d:3076:1f25 with SMTP id hg12-20020a05600c538c00b0040d30761f25mr622462wmb.151.1703063032963;
        Wed, 20 Dec 2023 01:03:52 -0800 (PST)
Message-ID: <87e185ab-6129-41ea-8424-9484659840d1@suse.com>
Date: Wed, 20 Dec 2023 10:03:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] x86/livepatch: align functions to ensure minimal
 distance between entry points
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231215111842.8009-1-roger.pau@citrix.com>
 <20231215111842.8009-2-roger.pau@citrix.com>
 <bc08ed7e-766d-4f0e-a7ef-994d09d1dbe2@citrix.com> <ZYKmn-lvKQpauL6Z@macbook>
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
In-Reply-To: <ZYKmn-lvKQpauL6Z@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.12.2023 09:32, Roger Pau Monné wrote:
> On Tue, Dec 19, 2023 at 07:46:11PM +0000, Andrew Cooper wrote:
>> On 15/12/2023 11:18 am, Roger Pau Monne wrote:
>>> The minimal function size requirements for livepatch are either 5 bytes (for
>>
>> "for an x86 livepatch", seeing as we're touching multiple architectures
>> worth of files.
>>
>> I know it's at the end of the sentence, but it wants to be earlier to be
>> clearer.
>>
>>> jmp) or 9 bytes (for endbr + jmp) on x86, and always 4 bytes on Arm.  Ensure
>>> that distance between functions entry points is always at least of the minimal
>>> required size for livepatch instruction replacement to be successful.
>>>
>>> Add an additional align directive to the linker script, in order to ensure that
>>> the next section placed after the .text.* (per-function sections) is also
>>> aligned to the required boundary, so that the distance of the last function
>>> entry point with the next symbol is also of minimal size.
>>>
>>> Note that it's possible for the compiler to end up using a higher function
>>> alignment regardless of the passed value, so this change just make sure that
>>> the minimum required for livepatch to work is present.  Different compilers
>>> handle the option differently, as clang will ignore -falign-functions value
>>> if it's smaller than the one that would be set by the optimization level, while
>>> gcc seems to always honor the function alignment passed in -falign-functions.
>>> In order to cope with this behavior and avoid that setting -falign-functions
>>> results in an alignment inferior to what the optimization level would have
>>> selected force x86 release builds to use a function alignment of 16 bytes.
>>
>> Yuck :(
>>
>> The same will be true for all other architectures too?
> 
> I would expect that for gcc I guess.
> 
>> What happens on ARM, which also picks up an explicit choice in livepatch
>> builds?
> 
> Arm AFAICT seems to use a 4 byte function alignment with -O2 (both gcc
> and clang), so that matches what we need to enforce for livepatch.  If
> we ever need a higher alignment for livepatch reasons it would be a
> multiple of the minimum one set by the compiler, so that should be
> fine.

Thinking of it: The forcing of 16-byte alignment in release builds of x86
is based on observations with certain compiler versions, iirc. What if
future versions decide to go lower/higher for, perhaps, very good reasons?
We don't really mean to override the compiler's choice, so maybe further
probing is actually necessary?

Jan

