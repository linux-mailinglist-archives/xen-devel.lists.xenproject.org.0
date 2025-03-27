Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1148A7367E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 17:15:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929716.1332471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txpsf-0002Ff-26; Thu, 27 Mar 2025 16:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929716.1332471; Thu, 27 Mar 2025 16:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txpse-0002DC-Ud; Thu, 27 Mar 2025 16:14:56 +0000
Received: by outflank-mailman (input) for mailman id 929716;
 Thu, 27 Mar 2025 16:14:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txpsd-0002D4-Bo
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 16:14:55 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9de16378-0b26-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 17:14:53 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso10030975e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 09:14:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d830f5b41sm43568815e9.27.2025.03.27.09.14.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 09:14:52 -0700 (PDT)
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
X-Inumbo-ID: 9de16378-0b26-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743092093; x=1743696893; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KLtvc3BsJ7SCFKZ6CL3SzCgo3YbdZNQjuJ/eiTamoys=;
        b=Q05zvCJiGUaDKW8Y+N2Eq4xObbYQO4KtooZwup2T83TR2jqi+IZm8N0Pch1tm89m94
         WLpN8Nbx8DYIGD/Ip/VucwqRSlxjB2XyeO0WivJyYCh2pHU1bcB0SbSP/0jWWbk5Bg8P
         8sXbg5UH5v4MYsSdm+yNqchCtwT1vYYKgvarc0bbkazwPLNztV2S4ob+vXct0Qzvrfwq
         ++gGiki0HjPxgIiHZs03jhQAcHu+tFrjEAg9QfN1cnnJUkEttvRLVwm1BMtAiaXFnC99
         K0lgZi/2n5OBSW1HEqvb68XEAcSygzN3ZRjO0gTclz4iKse3ak3CK5UV/QcOcB734Osl
         OL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092093; x=1743696893;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLtvc3BsJ7SCFKZ6CL3SzCgo3YbdZNQjuJ/eiTamoys=;
        b=OjFQQVbLRCBFtYB7d6Uvv26TwhDgQOYn5qUdhY6JBNLPOJ9vAryij/LdbYPjSvIBCI
         4c6M2S04sGbY892M2rQHSdCFzjWItP56J+NKHeCboVE5p6T/ZbBPnN2nzlaM4XjhVTid
         q/jicWim2Gg9shKoqfn8ldoG+AH8+TdWYXjiW0V7pEPCqOi/Nrw4/yUjPYvKz146CC7M
         K0tp8VlbqPusT6zqrout2NJ/h8TYtWMFXDIXuqQQSFqjv37k252tEevUoD2zaNeYPR3Q
         +3Dgcm+e5DEmWQpGSHOAF4zs0YKUd6LSem2SVaFylfoN96R42jzygxgDgqaepqLJzati
         62KA==
X-Forwarded-Encrypted: i=1; AJvYcCXASFLtTsKiRUQ9tWOG5GB9mb1sEwc9Niulfhqyw/kQ6K7jhaeW1zM4VjQool1Z32Y0LNoaDWC7DMo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwDSisd8sUD5KRx1AsqjXmX8EprAGmApMar5i71PW32mRFeo18i
	5b6SNyMFbtvj3zjEhnZXlJGivf93zIJhzSD9uEmb+Q8WMmpkVW8PVvwIyKxfjQ==
X-Gm-Gg: ASbGncuJwv1t7yeLBkEynfSs8fcN5ji03jD6tKxgO/WJtWKRggTitsMHmQZf1E8HV7h
	2LotrHmo/kZrS2x5tJLZkLTkyFAs0tRYHEHb686emMUnUwDRuAZ12FX3WVgdn77oVZtKMNeuCXd
	tjmmWr+9jbmIwziQc6snNQ9X4HJn1buzXyTMyc5gqoY9d0MQ4y0xtU3adlQyLuCIujKXpVRtuUC
	r2PLoUEsYLYonuL3UH1lYDkZAqp6LoLWPj3a2YN1bogb1lSoyfmhW7Q9E8dhrNv6gp+dhOnxBg2
	y+buUF6Ei62B47kh+xCESmttTBl4gDZkiZzFO7qnPINt4oh7uRrS8RlboC+13RN/c8giYikAPSu
	w2kVuSIlk6dVvNpHnfDxFHUFm0R/ezKUllVn6mDh/
X-Google-Smtp-Source: AGHT+IHtp10upFyieDlUwg4wXSaRDgKbYQU+o2F6r6ARXQ5TVITIMJGGEHTrWeDhIEpCJbw2SmfTSQ==
X-Received: by 2002:a05:600c:3d14:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-43d84fb2fbamr49288285e9.14.1743092092903;
        Thu, 27 Mar 2025 09:14:52 -0700 (PDT)
Message-ID: <3cd454c5-f080-41ad-a653-a3ca9d1e0edc@suse.com>
Date: Thu, 27 Mar 2025 17:14:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/config.h: Move BITS_PER_* definitions from
 asm/config.h to xen/config.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <4f085bcbf5b6f1bc42824bfb08724e8a9bbd4918.1743005389.git.oleksii.kurochko@gmail.com>
 <17a808cf-e676-4c30-9068-34a9a4d568d7@citrix.com>
 <c3d6a46c-c372-43f2-81d4-8128ebcb1b2b@gmail.com>
 <14d9be78-39c9-44b2-b6d8-6ff5fe1b8409@suse.com>
 <b9e191b5-9ed6-41bd-b8ec-9843df10d5d1@gmail.com>
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
In-Reply-To: <b9e191b5-9ed6-41bd-b8ec-9843df10d5d1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2025 17:12, Oleksii Kurochko wrote:
> 
> On 3/27/25 2:16 PM, Jan Beulich wrote:
>> On 27.03.2025 13:50, Oleksii Kurochko wrote:
>>> On 3/27/25 1:44 AM, Andrew Cooper wrote:
>>>> On 26/03/2025 5:47 pm, Oleksii Kurochko wrote:
>>>>> diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
>>>>> index d888b2314d..dbbf2fce62 100644
>>>>> --- a/xen/include/xen/config.h
>>>>> +++ b/xen/include/xen/config.h
>>>>> @@ -98,4 +98,13 @@
>>>>>    #define ZERO_BLOCK_PTR ((void *)-1L)
>>>>>    #endif
>>>>>    
>>>>> +#define BYTES_PER_LONG  __SIZEOF_LONG__
>>>>> +
>>>>> +#define BITS_PER_BYTE   __CHAR_BIT__
>>>>> +#define BITS_PER_INT    (__SIZEOF_INT__ << 3)
>>>>> +#define BITS_PER_LONG   (BYTES_PER_LONG << 3)
>>>>> +#define BITS_PER_LLONG  (__SIZEOF_LONG_LONG__ << 3)
>>>>> +
>>>>> +#define POINTER_ALIGN   __SIZEOF_POINTER__
>>>> See how much nicer this is.  This patch possibly wants to wait until
>>>> I've fixed the compiler checks to update to the new baseline, or we can
>>>> just say that staging is staging and corner case error messages are fine.
>>> Do you mean this patch:https://lore.kernel.org/xen-devel/20250320153241.43809-3-andrew.cooper3@citrix.com/?
>>>
>>> I haven't checked clang but if to look at gcc then these builtin macros was introduced in
>>> 024a85aeb6a("c-cppbuiltin.c (builtin_define_type_sizeof): New function.") and it seems like even older then gcc5
>>> contains this patch:
>>> $ git tag --contains 024a85aeb6a912811d917f737eaad39140c2fb0c
>>>     ...
>>>     releases/gcc-4.3.0
>>>     ...
>>>
>>> Am I missing something?
>> The check yet to be adjusted is looking for 4.1, so 4.3 would already be "too new".
> 
> I guess you mean this one check:
>    check-$(gcc) = $(call cc-ver-check,CC,0x040100,"Xen requires at least gcc-4.1")
> 
> Could I ask then why in the link above it is checked different version?

Because we're only in the process of switching to a higher baseline. Some
parts still need bringing back in sync. Which is also why Andrew said what
he said.

Jan

