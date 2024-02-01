Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 282D28455CE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 11:54:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674322.1049190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVUhg-0005El-7S; Thu, 01 Feb 2024 10:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674322.1049190; Thu, 01 Feb 2024 10:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVUhg-0005Ct-3X; Thu, 01 Feb 2024 10:53:56 +0000
Received: by outflank-mailman (input) for mailman id 674322;
 Thu, 01 Feb 2024 10:53:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i6jM=JK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rVUhe-0005Cb-OC
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 10:53:54 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ff1208d-c0f0-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 11:53:52 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33ae4eb360aso460812f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 02:53:52 -0800 (PST)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 cx18-20020a056000093200b0033935779a23sm15819798wrb.89.2024.02.01.02.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 02:53:51 -0800 (PST)
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
X-Inumbo-ID: 2ff1208d-c0f0-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706784832; x=1707389632; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P/7t2W/nuc1bPI8HTUKEuA5/guWmVVdGl+fvEX/9WfI=;
        b=F7AfHFIYSaesCkMjbBcDUbnQQup/J29SqDcBMBr9yriP/QeKJpattuGKiryETd36Gc
         g6i4Cqqidn9nOxq1HtG6ZM2uqYdPf87pIrTR4xAqRbpmxn1dFe7vvGsAMIOzntrfzWxr
         mBBiywqyCes1iCsaLa8kcpRcGhkJd8iLTSWf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706784832; x=1707389632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P/7t2W/nuc1bPI8HTUKEuA5/guWmVVdGl+fvEX/9WfI=;
        b=wHj6zGq7EK00exHYr2GT+wDmgVCZmPvFmu9tMOQJfX2auYacvlyCAebt5qL9z1UUH8
         423cFZnjpE4BatbCrF1+4mLW0nUTJbDQWpiAOki1hooYIx9yj83YGf//taLd7uhTKJg0
         9A6Ci06qhwDguqDNGewC2DgY4JqeZ0aVIFIc0xaD3fsyC4sFclwOkhWXBjvl7UwaryZl
         2HKFPhyk5SirCQRpXOtfr2smSusy0LMZlB/4mQhHfcxNCoIW8N5QVfP9bZvjuSoxP/za
         KORR3dHF3/Q12lh0SEaMwCcUjaLdeSDiP4VMwfI5hevL3+Xz53UaZLFmLDsoaCYBCvj6
         MQyQ==
X-Gm-Message-State: AOJu0Yyq3liQVDqpY1kgANt4K3vTaaXyAVBZ2Vgx67NG+UAHGjd7lbF6
	uCBcWsVRJKe51AcGZ3ntBWHwFJsoG4vKxaomNJqUu/yrUX9aXq4+N+DzD8/RAvQ=
X-Google-Smtp-Source: AGHT+IG0qUNhArOIAClSjVvblXAHmw0o/Fns4eTQZQNNsvsb4fLEMsEMpFPi3EshofloyGkaBfMWmA==
X-Received: by 2002:a5d:4710:0:b0:33a:ee33:ae9b with SMTP id y16-20020a5d4710000000b0033aee33ae9bmr3841202wrq.32.1706784832032;
        Thu, 01 Feb 2024 02:53:52 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUrfGCGQDe/ZzFIomh2xIw9PFGV+W3jUNe4mE3wWF3gp34F77j6V9/1w/zZLFQg3N7a/UtKhcHRCIyk2tA97VsLmjZcvDpm62jCwAvVo712a6Lykv5hQKKVA9SECUD8gnKFvH5RYnyF8VNRUIhQbBMvl9ANtxTcg9k4HZtE9/FXC+pf
Message-ID: <7b6e70a9-f19b-4487-ae92-6480ff0edfd5@citrix.com>
Date: Thu, 1 Feb 2024 10:53:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/bitmap: Consistently use unsigned bits values
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240201103339.549307-1-andrew.cooper3@citrix.com>
 <88b0e4bb-7f1c-4dc6-a22b-42c5dcd2ca46@suse.com>
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
In-Reply-To: <88b0e4bb-7f1c-4dc6-a22b-42c5dcd2ca46@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/02/2024 10:45 am, Jan Beulich wrote:
> On 01.02.2024 11:33, Andrew Cooper wrote:
>> Right now, most of the static inline helpers take an unsigned nbits quantity,
>> and most of the library functions take a signed quanity.  Because
>> BITMAP_LAST_WORD_MASK() is expressed as a divide, the compiler is forced to
>> emit two different paths to get the correct semantics for signed division.
>>
>> Swap all signed bit-counts to being unsigned bit-counts for the simple cases.
>> This includes the return value of bitmap_weight().
>>
>> Bloat-o-meter for a random x86 build reports:
>>   add/remove: 0/0 grow/shrink: 8/19 up/down: 167/-413 (-246)
>>
>> which all comes from compiler not emitting "dead" logic paths for negative bit
>> counts.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> albeit with a question at the bottom.
>
>> There is much more wanting cleaning up here, but we have to start somewhere.
>> Some observations:
>>
>>  * Various of the boolean-like return values have -1 for zero-length bitmaps.
>>    I can't spot any callers which care, so this seems like a waste.
>>  * bitmap_zero() and similar clear predate us switching to use
>>    __builtin_memset(), because there's no need for bitmap_switch().
>>  * Should we consolidate 'bits' vs 'nbits'?
> This looks desirable to me.
>
>>  * The internals of these helpers want converting too.  Other helpers need
>>    more than just a parameter conversion.
> This may or may not relate to my question; it's not exactly clear what you
> mean here.
>
>> --- a/xen/include/xen/bitmap.h
>> +++ b/xen/include/xen/bitmap.h
>> @@ -66,25 +66,25 @@
>>   * lib/bitmap.c provides these functions:
>>   */
>>  
>> -extern int __bitmap_empty(const unsigned long *bitmap, int bits);
>> -extern int __bitmap_full(const unsigned long *bitmap, int bits);
>> -extern int __bitmap_equal(const unsigned long *bitmap1,
>> -                	const unsigned long *bitmap2, int bits);
>> -extern void __bitmap_complement(unsigned long *dst, const unsigned long *src,
>> -			int bits);
>> -extern void __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
>> -			const unsigned long *bitmap2, int bits);
>> -extern void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
>> -			const unsigned long *bitmap2, int bits);
>> -extern void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
>> -			const unsigned long *bitmap2, int bits);
>> -extern void __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
>> -			const unsigned long *bitmap2, int bits);
>> -extern int __bitmap_intersects(const unsigned long *bitmap1,
>> -			const unsigned long *bitmap2, int bits);
>> -extern int __bitmap_subset(const unsigned long *bitmap1,
>> -			const unsigned long *bitmap2, int bits);
>> -extern int __bitmap_weight(const unsigned long *bitmap, int bits);
>> +int __bitmap_empty(const unsigned long *bitmap, unsigned int bits);
>> +int __bitmap_full(const unsigned long *bitmap, unsigned int bits);
>> +int __bitmap_equal(const unsigned long *bitmap1,
>> +                   const unsigned long *bitmap2, unsigned int bits);
>> +void __bitmap_complement(unsigned long *dst, const unsigned long *src,
>> +                         unsigned int bits);
>> +void __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
>> +                  const unsigned long *bitmap2, unsigned int bits);
>> +void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
>> +                 const unsigned long *bitmap2, unsigned int bits);
>> +void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
>> +                  const unsigned long *bitmap2, unsigned int bits);
>> +void __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
>> +                     const unsigned long *bitmap2, unsigned int bits);
>> +int __bitmap_intersects(const unsigned long *bitmap1,
>> +                        const unsigned long *bitmap2, unsigned int bits);
>> +int __bitmap_subset(const unsigned long *bitmap1,
>> +                    const unsigned long *bitmap2, unsigned int bits);
>> +unsigned int __bitmap_weight(const unsigned long *bitmap, unsigned int bits);
>>  extern void __bitmap_set(unsigned long *map, unsigned int start, int len);
>>  extern void __bitmap_clear(unsigned long *map, unsigned int start, int len);
> What about these two, and the subsequent (in the .c file at least)
> bitmap_*_region()? That last remark above may mean you deliberately
> left them out for now (which is okay - as you say, this is merely a
> 1st step).

They want map->bitmap and int len -> unsigned int bits for consistency,
which is more than just a typechange.

I also wasn't totally certain of the correctness of the internal logic. 
I don't have time to investigate further in the immediate future, so
left it unchanged out of caution.

~Andrew

