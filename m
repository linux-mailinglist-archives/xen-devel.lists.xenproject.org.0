Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FB287CE3F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 14:48:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693872.1082503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl7v8-0001QR-KL; Fri, 15 Mar 2024 13:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693872.1082503; Fri, 15 Mar 2024 13:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl7v8-0001Nh-HG; Fri, 15 Mar 2024 13:48:26 +0000
Received: by outflank-mailman (input) for mailman id 693872;
 Fri, 15 Mar 2024 13:48:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9knB=KV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rl7v6-0001Nb-QC
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 13:48:24 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b01c2097-e2d2-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 14:48:22 +0100 (CET)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-42a9c21f9ecso10327261cf.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 06:48:22 -0700 (PDT)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t11-20020a05621421ab00b006911fb61126sm2038924qvc.128.2024.03.15.06.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 06:48:20 -0700 (PDT)
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
X-Inumbo-ID: b01c2097-e2d2-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710510501; x=1711115301; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h/4Mx/me5VArnQxnWLftSCzOoO+H22p/BzNzM+Ci27E=;
        b=BO8GPfdLvgmfh/fyYgmfWKMkkQEIpR5WNPDNAbmwy9hQHAvdO/7edYxOAMNBfdSVKj
         CBBxEVkX5RCzZMaYm+HRdPcBTNdtCiqijPOsDAmQVjgiSsx2ADs2HzLsNLfczRzOrWhT
         A2xscho8E1jpYKrjO1lQCtLd2CDOhEidxg5X8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710510501; x=1711115301;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/4Mx/me5VArnQxnWLftSCzOoO+H22p/BzNzM+Ci27E=;
        b=OczTzL27DSyLHjPO7TBM4aQ4iPprvB89prCF+lHpiw6JXw7qkOdSIvJiZDqFJv/KU0
         m1LtOPAWw5x6ejoKbw2UR9CYdcSPO1wLlwxM8RkqpwJUyPVodrs52VYC17BffZPgOMM5
         VRtj2p1R178kfQVvELbrRyL9gFtBokZ7SzljiQh1fm/Z+QpmINMoOLrl/htOb7L7j7hj
         RskYOEvXVFZL4o9FqXow0rECmVD6LRxOYtw/c/7HbqQYxqxdwVGbUGQDhAawHUwlQuyN
         aA3Ucfqtq3D4X/5b5JTcS/qJ5Qugz7XcjU5vhjISpTwTJWJSr6j3dz2dOjClHVuwSsWf
         lhTA==
X-Forwarded-Encrypted: i=1; AJvYcCXh6ytibVpvuZPGXvWVXfQjg7xSQFIv17BtaWVfh+4N0kJGHn+ZiM5kfDHvvAkNpTNlB0AK5sso9U6tGc4AnLHJJo/18Hl1PrOFqWExECE=
X-Gm-Message-State: AOJu0YwIOBNH6vHJN6BIDKR9ssM+eQhBgHWbefDfiyTNYMb9y+7Pe18c
	WU1oS7KX9S8dJf12D2ue92KYGwHGRaYrEFotxhlWYXG7L+vb22kwwBrwrjHDLrk=
X-Google-Smtp-Source: AGHT+IHAAwemSkLEoFF5g1howmL9IWnB5dQ01YgODjpxfaeC5ztWhvpYyXW+FCtyxYraZMe1Mme2Zw==
X-Received: by 2002:a05:6214:1772:b0:690:d247:8a97 with SMTP id et18-20020a056214177200b00690d2478a97mr4441369qvb.4.1710510501345;
        Fri, 15 Mar 2024 06:48:21 -0700 (PDT)
Message-ID: <33ed3c99-65e2-4ba9-9ff8-7934ecdf26f6@citrix.com>
Date: Fri, 15 Mar 2024 13:48:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] xen/bitops: Delete find_first_set_bit()
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
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
 <c2b62892-e534-4674-9869-523403c5fcc1@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c2b62892-e534-4674-9869-523403c5fcc1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/03/2024 5:14 pm, Andrew Cooper wrote:
> On 14/03/2024 3:59 pm, Jan Beulich wrote:
>> On 13.03.2024 18:27, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/include/asm/bitops.h
>>> +++ b/xen/arch/x86/include/asm/bitops.h
>>> @@ -401,18 +401,6 @@ static always_inline unsigned int __scanbit(unsigned long val, unsigned int max)
>>>      r__;                                                                    \
>>>  })
>>>  
>>> -/**
>>> - * find_first_set_bit - find the first set bit in @word
>>> - * @word: the word to search
>>> - * 
>>> - * Returns the bit-number of the first set bit. The input must *not* be zero.
>>> - */
>>> -static inline unsigned int find_first_set_bit(unsigned long word)
>>> -{
>>> -    asm ( "rep; bsf %1,%0" : "=r" (word) : "rm" (word) );
>>> -    return (unsigned int)word;
>>> -}
>> And you think it's okay to no longer use TZCNT like this when available,
>> where the output doesn't have to have its value set up front?
> This is a particularly evil piece of inline asm.
>
> It is interpreted as BSF or TZCNT depending on the BMI instruction set
> (Haswell/Piledriver era).  Furthermore there are errata on some Intel
> systems where REP BSF behaves as per TZCNT *even* when BMI isn't enumerated.
>
> Which means this piece of asm suffers from all of an undefined output
> register, undefined CF behaviour, and differing ZF behaviour (I believe)
> depending on which hardware you're running on.
>
> The only thing the REP prefix is getting you is a deterministic 0 in the
> destination register,

No, it doesn't.

For a zero input, TZCNT yields the operand size, so you get 16/32/64; 64
in this case.

It also means there's no chance of coming up with a useful alternative
for ffs() to use TZCNT when available.

~Andrew

