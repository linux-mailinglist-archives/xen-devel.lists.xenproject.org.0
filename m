Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D74487C1ED
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 18:14:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693414.1081457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkoet-0005m0-CZ; Thu, 14 Mar 2024 17:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693414.1081457; Thu, 14 Mar 2024 17:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkoet-0005jS-95; Thu, 14 Mar 2024 17:14:23 +0000
Received: by outflank-mailman (input) for mailman id 693414;
 Thu, 14 Mar 2024 17:14:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rR1U=KU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rkoer-0005jM-UN
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 17:14:21 +0000
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [2607:f8b0:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a3f6ab4-e226-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 18:14:18 +0100 (CET)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6e677008501so112009a34.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 10:14:18 -0700 (PDT)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r27-20020a05620a03db00b007883218feb7sm1040991qkm.97.2024.03.14.10.14.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 10:14:16 -0700 (PDT)
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
X-Inumbo-ID: 4a3f6ab4-e226-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710436457; x=1711041257; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0bjRqtas4rx6wxJs5Cs9nm3xTvNnI+odLidhChqnt+k=;
        b=q6Mgczjnv6lMuPL+kfjYJUAVxBRSRIoa3RvuVWfylhIj3/bFJmcpBcazauHr9Sw3M6
         H3VuXvlOyxmGmOO40Hl3or/4eGLhKdLqjaEZ1cATgnDr6WXvYuFMPbuSt+CBmjWyL8Eq
         G84M/SvR6rKyud8HR+asptmN7kflm9mV4TytA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710436457; x=1711041257;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0bjRqtas4rx6wxJs5Cs9nm3xTvNnI+odLidhChqnt+k=;
        b=uGQTHRk4hJgk6oDP+MqS3fjaLm61R9QBXqTc9bOUDF298KYfNz1e2Te5duqCrvjsgv
         yY+yPGgyR6HJGd9mgZjNOwGHTBc/n4s1rRE3Z9lfMn/OvY41UIVX4hpr3UVZNUrOs0bz
         G1VPTovPkuvhXQKkIESQ2xJ/FB7SpkrFaWep3AzbxEazy11+LCGfeWhwbT6e0BB4rBo8
         ItUMIzWFEioAFGswt85+xnp5g0J/oAXgxXn0Ilsi99pmyk4P4opJ1r6BOrmw/QjBUNjL
         BYIfP2NbWfUNHxe22Im7g79vE+XKBaElvYSisfGA3+xtUFi/VvxDaBek93kloCpIocEz
         pRdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm0GfuAtyQdcjKBXkQ3RxbYI4MS5K7RCwA/8ETPXS+IVjc0cgPn649Fih3myOXcQ0iO9kcTKFdpQArCOTik7a4ZVg98OXqlCO/htr/U2M=
X-Gm-Message-State: AOJu0YyvbsiZEE6iqLMQGldxMyWzXi9Dhx4/PvdLXT5s3V7hUBWRN3uF
	tSnwlVEBevxdglrxO69+8DaWKHmU/UVRKtTqUdiTQWD/EZCm7Q6oy9zombA/FZ8=
X-Google-Smtp-Source: AGHT+IH0n0oCBAUFSxkVZ3st5gWbKJ2FG92FqpOtKHEi+D7WTSd9i+RvNKp6RKLaUDFC4/wHAyr4OA==
X-Received: by 2002:a05:6830:1d8b:b0:6e5:34d4:843d with SMTP id y11-20020a0568301d8b00b006e534d4843dmr2309079oti.15.1710436457120;
        Thu, 14 Mar 2024 10:14:17 -0700 (PDT)
Message-ID: <c2b62892-e534-4674-9869-523403c5fcc1@citrix.com>
Date: Thu, 14 Mar 2024 17:14:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] xen/bitops: Delete find_first_set_bit()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
 <20240313172716.2325427-8-andrew.cooper3@citrix.com>
 <926895a0-f777-4e17-951f-6df0cc24b0f2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <926895a0-f777-4e17-951f-6df0cc24b0f2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/03/2024 3:59 pm, Jan Beulich wrote:
> On 13.03.2024 18:27, Andrew Cooper wrote:
>> --- a/xen/arch/x86/include/asm/bitops.h
>> +++ b/xen/arch/x86/include/asm/bitops.h
>> @@ -401,18 +401,6 @@ static always_inline unsigned int __scanbit(unsigned long val, unsigned int max)
>>      r__;                                                                    \
>>  })
>>  
>> -/**
>> - * find_first_set_bit - find the first set bit in @word
>> - * @word: the word to search
>> - * 
>> - * Returns the bit-number of the first set bit. The input must *not* be zero.
>> - */
>> -static inline unsigned int find_first_set_bit(unsigned long word)
>> -{
>> -    asm ( "rep; bsf %1,%0" : "=r" (word) : "rm" (word) );
>> -    return (unsigned int)word;
>> -}
> And you think it's okay to no longer use TZCNT like this when available,
> where the output doesn't have to have its value set up front?

This is a particularly evil piece of inline asm.

It is interpreted as BSF or TZCNT depending on the BMI instruction set
(Haswell/Piledriver era).  Furthermore there are errata on some Intel
systems where REP BSF behaves as per TZCNT *even* when BMI isn't enumerated.

Which means this piece of asm suffers from all of an undefined output
register, undefined CF behaviour, and differing ZF behaviour (I believe)
depending on which hardware you're running on.

The only thing the REP prefix is getting you is a deterministic 0 in the
destination register, on some hardware only, for code which has already
violated the input safety condition.  As a piece of defence in depth,
then perhaps it's useful.

But following up from the other thread,
https://gcc.gnu.org/pipermail/gcc/2024-March/243475.html is form where
the compiler can (and does!) simplify back to the plain BSF form when it
can prove that this is safe.


The only case where using TZCNT is helpful is when we're compiling for
x86_64-v3 and there is no need to work around BSF's undefined behaviour.

Even with x86's arch_ffs() now split nicely based on whether the
compiler knows BSF is safe or not, an alternative to swap between BSF
and TZCNT probably isn't a win; you still have to cover up 6 or 7 bytes
of the -1 setup, which you can't do with leading prefixes on the TZCNT
itself.

All CPUs with BMI can swallow the double-instruction data dependency
without breaking a sweat, at which point you're trading off (at best) a
1-cycle improvement vs the setup costs of the alternative.  If there is
any real improvement to be had here, it's marginal enough that I'm not
sure it's worth doing.

~Andrew

