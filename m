Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 660F1960BED
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 15:25:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784014.1193368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwCS-0001Bk-9U; Tue, 27 Aug 2024 13:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784014.1193368; Tue, 27 Aug 2024 13:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwCS-00019W-6Q; Tue, 27 Aug 2024 13:25:32 +0000
Received: by outflank-mailman (input) for mailman id 784014;
 Tue, 27 Aug 2024 13:25:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovuO=P2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1siwCQ-00019Q-M3
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 13:25:30 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d39ff5ef-6477-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 15:25:28 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a83597ce5beso854444366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 06:25:28 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e549cf94sm109969366b.80.2024.08.27.06.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 06:25:26 -0700 (PDT)
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
X-Inumbo-ID: d39ff5ef-6477-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724765128; x=1725369928; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eMp28LvFTtxeR9SpDuL8luPgVO/0eKtg5UQmM1UbdnI=;
        b=Orx+KP5mTywqnBD3NRcE5i4J4GLFADQavi7B6v5RENRjKxYwY0EeAZF0GA9T3hPCKq
         0X4PSjWVmWBnSzcdT5m73nbiAlQEZAOlNwgXPcfkiuIZDN0Cyte6+XznjLUc89ttgWHT
         oJP407Pjs9l+mwGsTYuUWiIft9b2PuQ2EAcE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724765128; x=1725369928;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMp28LvFTtxeR9SpDuL8luPgVO/0eKtg5UQmM1UbdnI=;
        b=Bv4UmsPY2Noj//Y86FqtUluK81S68I0zoMatQfQ4KEU0KniHgTI8170cLJmFhloTQb
         Ib/jD/fsWrYgGALrww2zmVgVzTUZQZVgH5zA20pMp/8lBFN3u6mYeNZMITTJKmG+2rd7
         TY1DDpYBbVCHI9dGwKqI1wOXJz1GobOoJZMcNgevvALptnnFYh0zHJJPpKfC9xIa4gJt
         uS+naiTEIWNPQ8R2/2phSX92eYpcQUscn8IzhlOKurFSzqph+NElr1WUhF5CJlbLzp8j
         sOKlpZ39GSv4Lcmsz9kQs/GiQ7kdb4N/XtJmDJJ3UbgiJhhfciLOuHeYFptu/IVN+Kpl
         R0OA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ934yD7kSTxb/KDo0gRiU6HXs7+gf+NNJtQxXZ4dxv0HXND8sW6uEbRanKoqPsNj/kHTR6Pqzq8g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwChpOfiA3hWm8ok6KcCtf5Ng2PJXKzBtd8eIoz6WsBV6CIXZun
	KCZGHGeBMzecPJWYwle7ACE0GNZeUsRG7o+Meeio16flqveV3xGYstxlS5b9BwY=
X-Google-Smtp-Source: AGHT+IErAg85D29MFl4VhFuhl5pDD3AT25FLnwyxZcAb/5OcKC52ac/2BQjmxnjB/Zwgny4JAKKvVQ==
X-Received: by 2002:a17:907:724a:b0:a86:9e85:2619 with SMTP id a640c23a62f3a-a86e2aa70ddmr332847066b.25.1724765127759;
        Tue, 27 Aug 2024 06:25:27 -0700 (PDT)
Message-ID: <c54f7015-abe1-4834-83e3-29a2cc854d85@citrix.com>
Date: Tue, 27 Aug 2024 14:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] xen/bitops: Implement hweight64() in terms of
 hweightl()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-8-andrew.cooper3@citrix.com>
 <11da1350-095f-49c8-bdf0-f5c83e9f0d39@suse.com>
 <70047ef7-ca22-4eeb-9510-09ccdf0871c0@citrix.com>
 <73309650-3912-418b-b2e6-a60676519911@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <73309650-3912-418b-b2e6-a60676519911@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/08/2024 2:00 pm, Jan Beulich wrote:
> On 27.08.2024 13:50, Andrew Cooper wrote:
>> On 26/08/2024 12:55 pm, Jan Beulich wrote:
>>> On 23.08.2024 01:06, Andrew Cooper wrote:
>>>> --- a/xen/include/xen/bitops.h
>>>> +++ b/xen/include/xen/bitops.h
>>>> @@ -302,6 +302,14 @@ static always_inline __pure unsigned int hweightl(unsigned long x)
>>>>  #endif
>>>>  }
>>>>  
>>>> +static always_inline __pure unsigned int hweight64(uint64_t x)
>>>> +{
>>>> +    if ( BITS_PER_LONG == 64 )
>>>> +        return hweightl(x);
>>>> +    else
>>>> +        return hweightl(x >> 32) + hweightl(x);
>>> This assume BITS_PER_LONG == 32, which of course is true right now, but
>>> doesn't need to be in general. Better add an explicit cast to uint32_t
>>> (or masking by 0xffffffffU)?
>> This is part of the point of putting in the self-tests.  They're
>> intended to catch things like this in new build environments.
> I don't think I saw any testcase where the result would be wrong if
> this split didn't truncate x to the low 32 bits on the rhs of the +.

That's arguably an error in the choice of test cases.

Although, they're just my best guesses at some

>
>> Although, I think we've got enough cases which will #error on
>> BITS_PER_LONG not being 32 or 64.
> My take on this is: Such checks (#error or whatever else precaution)
> should like in every single place where violating the assumptions
> made would matter. Or else - how do you locate all the places that
> need changing?

Whomever gets to add RISCV-128 support will have to inspect every use of
BITS_PER_LONG, irrespective of #error/BUILD_BUG_ON()/etc.

So, the answer is `grep`.

I'm not advocating that we stop helping out with #error, but it's
unrealistic to expect that only addressing the build errors will result
in a working Xen for BITS_PER_LONG==128.

>
>> Again, this is modelled after f[fl]s64() which have the same
>> expectations about the BITS_PER_LONG != 64 case.
> Both of them are fine afaict. fls64() has an explicit intermediate
> variable of type uint32_t, and ffs64() has a (uint32_t)x as part
> of the conditional expression achieving the intended effect.
>
> Anyway, why not use hweight32() instead of hweightl() here? That'll
> make things very explicit.

hweight32() doesn't exist until the next patch in the series.

Although looking at the end result, I can't figure out why I thought it
was necessary to transform hweight64 first.

I'll swap this patch and the next one, and then use hweight32().

~Andrew

