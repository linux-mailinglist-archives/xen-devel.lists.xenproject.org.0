Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD5BA71627
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 13:00:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927702.1330435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txPQF-0003XA-5T; Wed, 26 Mar 2025 11:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927702.1330435; Wed, 26 Mar 2025 11:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txPQF-0003Vq-1i; Wed, 26 Mar 2025 11:59:51 +0000
Received: by outflank-mailman (input) for mailman id 927702;
 Wed, 26 Mar 2025 11:59:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16MU=WN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txPQD-0003Vk-Bs
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 11:59:49 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d03072c9-0a39-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 12:59:47 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so5890383f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 04:59:47 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b26a6sm16378320f8f.44.2025.03.26.04.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 04:59:46 -0700 (PDT)
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
X-Inumbo-ID: d03072c9-0a39-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742990386; x=1743595186; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Upkl5H5UpU6V1VtlufleQT6ZFsXmDzWpDYJbTiBpuZE=;
        b=ONmaRe8uP7BPSxDu6bFGSIqRa2KrcmJD8wHIDhHDweE0syawuZ/cNvUbCrUF8eNGoR
         o2ke5yFXfmIbSE5g1/8Do3NFPN4qPFbUBGrLZ84Dw4D+PkzHvSYKca0u1yO9GYRV4R5w
         9QDdvCsRI94uQc6j6A19NArGLvMM1dsZmwO5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742990386; x=1743595186;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Upkl5H5UpU6V1VtlufleQT6ZFsXmDzWpDYJbTiBpuZE=;
        b=UfPVMoPYBtUecUtQj6jvTjMufesAinKKm66ZGsFoml6FLDZbpXxy8LAof2WXEcWtGg
         Lns9jjGA+45ChYugUgInxzWJp4jYGuGP3RJfRLLz87y3xt+eVwF0osSVy04JqLAYhho9
         zbwOH/GQF37Txj0YAuFv01YAN3iPB0JNINQd31rgrtZdyyEogM2AU9GIXMKZqSy7kZe4
         1wiqKJKjeOxcsfasmzpdzWpEiD5iHP9EUFvOIrDYO2/kWFWlgHfuziJKg4pwj+LkqCpC
         XJCfSUCa8L1VDXp500/b71NjTbgCOIcmcl0qG6uqMeg4gYDZT28n/fQDHpOSi+iIh4UV
         lyXA==
X-Gm-Message-State: AOJu0Yy5IupibrHnaegzPzQvvmwSOKTC4lZRF/PATv693S28XtNxhp7B
	XTLN6QhfW0sSQPXQiF21/9LdF9q11LNGzUqXwu9d28UrtLFXBXy1doZbR+kM4WQ=
X-Gm-Gg: ASbGnct8Rkz4W9ZJftLo5FoiDlJjiDvICMdJHlh06GzCAOS5y56ShNP3aGceqPGDKIe
	E3p235jKtji0bycFPJWHNfdNwgrgoORhmqoxeMzeKkTOH74bXuJQxnKlRNR+pyatok4d+Z6cjm3
	m+jvcCBV9Ke3c/qtN9LcwjXnOXSisGXZFHcC4No/ABDl+imxLiPr6oiXb1cL04erIKEPseSoGzR
	zJvKHm/VXcrds6q1Q+jXHxMlvBUCobRj4VR6mEGr1hwIj0kFGAU6IAHr7PSPA5wtE/VsGVuC5tl
	PYcuUnorLjSpAyEGPMom2nqL1deD9aH9CWtzO2DKmozzMWcHR5Si/V7MyeYXcdkTnIBjy7DNBDo
	9ZSdju64Fng==
X-Google-Smtp-Source: AGHT+IHS3s71zBANj9exyreTbg4YtSgtU9bgCEWpzr1Va0oWbW3qxcCb4TzqRVBE7x2+Oh76DFGR/w==
X-Received: by 2002:a05:6000:178c:b0:391:3207:2e75 with SMTP id ffacd0b85a97d-3997f8fc3cemr15942973f8f.18.1742990386496;
        Wed, 26 Mar 2025 04:59:46 -0700 (PDT)
Message-ID: <967bdc81-6924-4374-9e6a-4bcce1b1fe6b@citrix.com>
Date: Wed, 26 Mar 2025 11:59:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISCV/bitops: Use Zbb to provide arch-optimised bitops
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20250226172050.1300771-1-andrew.cooper3@citrix.com>
 <113b2464-c7b2-4068-a179-707cba4f3835@suse.com>
 <50cd2332-11b7-4b64-85ea-489c416098f9@citrix.com>
 <db2073b0-8585-4518-9467-b7da4cefbbae@suse.com>
 <8dff5fb9-b46f-47bf-a6ee-863282155706@citrix.com>
 <295f59af-ebb8-4ad5-bf27-ec0ea5a2c2fe@gmail.com>
 <927264c2-0b99-4d60-97f8-31bcd0d64aa6@suse.com>
 <a7f05789-cf1a-474f-b619-80a7e890a579@citrix.com>
 <7cfbd773-de4b-459f-8fa9-7c6ed19fe0ad@gmail.com>
 <52bd483a-c5bf-4eba-867f-3476b1b86550@suse.com>
 <a852cb38-79fc-4b9d-b0a0-b69e277c2b82@gmail.com>
 <3014e6b4-0732-4d80-82e5-44dcd517f2b5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3014e6b4-0732-4d80-82e5-44dcd517f2b5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/03/2025 10:15 am, Jan Beulich wrote:
> On 25.03.2025 18:04, Oleksii Kurochko wrote:
>> On 3/25/25 5:46 PM, Jan Beulich wrote:
>>> On 25.03.2025 17:35, Oleksii Kurochko wrote:
>>>> On 3/7/25 1:12 PM, Andrew Cooper wrote:
>>>>> On 07/03/2025 12:01 pm, Jan Beulich wrote:
>>>>>> On 07.03.2025 12:50, Oleksii Kurochko wrote:
>>>>>>> On 3/6/25 9:19 PM, Andrew Cooper wrote:
>>>>>>>> On 05/03/2025 7:34 am, Jan Beulich wrote:
>>>>>>>>> I was actually hoping to eliminate BITS_PER_LONG at some point, in favor
>>>>>>>>> of using sizeof(long) * BITS_PER_BYTE. (Surely in common code we could
>>>>>>>>> retain a shorthand of that name, if so desired, but I see no reason why
>>>>>>>>> each arch would need to provide all three BITS_PER_{BYTE,INT,LONG}.)
>>>>>>>> The concern is legibility and clarity.
>>>>>>>>
>>>>>>>> This:
>>>>>>>>
>>>>>>>>        ((x) ? 32 - __builtin_clz(x) : 0)
>>>>>>>>
>>>>>>>> is a clear expression in a way that this:
>>>>>>>>
>>>>>>>>        ((x) ? (sizeof(int) * BITS_PER_BYTE) - __builtin_clz(x) : 0)
>>>>>>>>
>>>>>>>> is not.  The problem is the extra binary expression, and this:
>>>>>>>>
>>>>>>>>        ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)
>>>>>>>>
>>>>>>>> is still clear, because the reader doesn't have to perform a multiply to
>>>>>>>> just to figure out what's going on.
>>>>>>>>
>>>>>>>>
>>>>>>>> It is definitely stupid to have each architecture provide their own
>>>>>>>> BITS_PER_*.  The compiler is in a superior position to provide those
>>>>>>>> details, and it should be in a common location.
>>>>>>>>
>>>>>>>> I don't particularly mind how those constants are derived, but one key
>>>>>>>> thing that BITS_PER_* can do which sizeof() can't is be used in #ifdef/etc.
>>>>>>> What about moving them to xen/config.h? (if it isn't the best one place, any suggestion which is better?)
>>>>>>>
>>>>>>> #define BYTES_PER_INT  (1 << INT_BYTEORDER)
>>>>>>> #define BITS_PER_INT  (BYTES_PER_INT << 3)
>>>>>>>
>>>>>>> #define BYTES_PER_LONG (1 << LONG_BYTEORDER)
>>>>>>> #define BITS_PER_LONG (BYTES_PER_LONG << 3)
>>>>>>> #define BITS_PER_BYTE 8
>>>>> The *_BYTEORDER's are useless indirection.  BITS_PER_* should be defined
>>>>> straight up, and this will simplify quite a lot of preprocessing.
>>>> Could we really drop *_BYTEORDER?
>>>>
>>>> For example, LONG_BYTEORDER for Arm could be either 2 or 3 depends on Arm32 or Arm64 is used.
>>> The can still #define BITS_PER_LONG to 32 or 64 respectively, can't they?
>> Yes, but then if we want to move it to xen/config.h then it will be needed to:
>> in Arm's asm/config.h to have something like:
>>    #ifdef CONFIG_ARM_32
>>        #define BITS_PER_LONG 32
>>    #endif
>>
>> and then in xen/config.h
>>    #ifndef BITS_PER_LONG
>>        #define BITS_PER_LONG 64
>>    #endif
>>
>> But I wanted to not have #ifndef BITS_PER_LONG in xen/config.h. (or using CONFIG_ARM_32 in xen/config.h)
> Whatever the fundamental definitions that can vary per arch - those should
> imo live in asm/config.h. For the case here, if we deem *_BYTEORDER as
> fundamental, they go there (and BITS_PER_* go into xen/config.h). If we deem
> BITS_PER_* fundamental, they go into asm/config.h.
>
> Stuff that we expect to remain uniform across ports (BITS_PER_BYTE, possibly
> also BITS_PER_INT BITS_PER_LLONG) may also go into xen/config.h, as long as
> we're okay with the possible future churn if a port appeared that has
> different needs.
>
> I agree that there better wouldn't be #ifndef for such in xen/config.h.

With a new toolchain baseline, we get both of these concepts directly
from the compiler environment.

I don't see any need for arch-specific overrides to these.  They
ultimately come from the -march used.

~Andrew

