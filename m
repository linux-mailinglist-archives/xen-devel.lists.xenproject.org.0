Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 090878B9B92
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 15:24:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715833.1117773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2WQC-0006pT-Kx; Thu, 02 May 2024 13:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715833.1117773; Thu, 02 May 2024 13:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2WQC-0006mN-I7; Thu, 02 May 2024 13:24:24 +0000
Received: by outflank-mailman (input) for mailman id 715833;
 Thu, 02 May 2024 13:24:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/qc=MF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s2WQB-0006mF-CE
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 13:24:23 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49257624-0887-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 15:24:21 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-34d0aa589a4so2868219f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 06:24:21 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 dd3-20020a0560001e8300b0034c9f060a14sm1266076wrb.11.2024.05.02.06.24.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 06:24:20 -0700 (PDT)
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
X-Inumbo-ID: 49257624-0887-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714656261; x=1715261061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XJggx4Oe2H3ZRxBPQOTa7S2IqKQJawSMummjLXb+uhk=;
        b=Pz39zQLVmYQnp24NpH661GXZq6oHHOn4n0W1fzUbIbFibOSljRNZlcWnCjDuLvXeKT
         5DgtAqCDIeEP3j61dNHM8uHHS5e7rKqrSkxT6ASSDCnEFCWOodLS1/bKx+2QNAmO8HID
         foCSdStx0q9438sf4P/t3ZH/4+Md5qTorkUrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714656261; x=1715261061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJggx4Oe2H3ZRxBPQOTa7S2IqKQJawSMummjLXb+uhk=;
        b=ZUDFSndftFGRHAqfSlY/YnqlhdsqNa0/pUkmJ2Gr4sr9SvQKwQtOSStEGHo3/6HKpF
         Q4DiiqrqwtYCu6m3d0XsrcKKRvsldr+CtVHNmJtL+SCEnkCQP1EhG1lLJa2F/Zbh2JHD
         SR5wxGJetoI0bgltmGJoA5E/I7mxEzLKpDe1f5C461XQyLFgAAzsyeaogqiVc4d5yGem
         GsvW8qvAnZAXlgtx6iaimBB5n4L1IHR6X+zkmBV+/hOcGzuTFoQ2yva/J2pl1/XZV5cq
         6JTiu17P4k+/ybQLXtbwQJBetLb6d4Wa7/FEO/6LwFawAUWYtMmD2c8zg47bW9y9vl6C
         QbhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUjpGTzulTfRceu7g+vMwsMO0DK9S5xSpe5CebS38jcdVwhedo7OUyvXHhfdxlLGHBB3+w7IUX7KfRkTMOeSq3ByKzDoJtO/ZxpECb768=
X-Gm-Message-State: AOJu0YxkdoxGgENKynrQPT5PlWGwweV2eMB6my78PKP9MTwA47h1clAS
	/c6zavItsyazJVY+BRAHTVBwehSPS/YPNzYxuQj/pL7wv+hwABNaUn3i1+z0EnA=
X-Google-Smtp-Source: AGHT+IHBCMzuoOZu8ZzsCiTgicmu+FsTYZfOaABcCNpwrd7AaLXDFq2zr4ExxfwaRaiqedtKbGw7IQ==
X-Received: by 2002:adf:fa4a:0:b0:34d:9fb2:5148 with SMTP id y10-20020adffa4a000000b0034d9fb25148mr1581433wrr.31.1714656260758;
        Thu, 02 May 2024 06:24:20 -0700 (PDT)
Message-ID: <b5560120-96c5-4b97-a4cc-36fbcfdd223c@citrix.com>
Date: Thu, 2 May 2024 14:24:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] x86/cpu-policy: Simplify recalculate_xstate()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240429182823.1130436-1-andrew.cooper3@citrix.com>
 <20240429182823.1130436-4-andrew.cooper3@citrix.com>
 <ecd6e142-7a08-46e8-83c0-7d9b0bc6f66f@suse.com>
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
In-Reply-To: <ecd6e142-7a08-46e8-83c0-7d9b0bc6f66f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/05/2024 1:39 pm, Jan Beulich wrote:
> On 29.04.2024 20:28, Andrew Cooper wrote:
>> Make use of the new xstate_uncompressed_size() helper rather than maintaining
>> the running calculation while accumulating feature components.
> xstate_uncompressed_size() isn't really a new function, but the re-work of
> an earlier one. That, aiui, could have been used here, too, just that it
> would have been inefficient to do so. IOW perhaps drop "the new"?

Ok.

>
>> The rest of the CPUID data can come direct from the raw cpu policy.  All
>> per-component data form an ABI through the behaviour of the X{SAVE,RSTOR}*
>> instructions.
>>
>> Use for_each_set_bit() rather than opencoding a slightly awkward version of
>> it.  Mask the attributes in ecx down based on the visible features.  This
>> isn't actually necessary for any components or attributes defined at the time
>> of writing (up to AMX), but is added out of an abundance of caution.
> As to this, ...
>
>> @@ -206,61 +205,47 @@ static void recalculate_xstate(struct cpu_policy *p)
>>          return;
>>  
>>      if ( p->basic.avx )
>> -    {
>>          xstates |= X86_XCR0_YMM;
>> -        xstate_size = max(xstate_size,
>> -                          xstate_offsets[X86_XCR0_YMM_POS] +
>> -                          xstate_sizes[X86_XCR0_YMM_POS]);
>> -    }
>>  
>>      if ( p->feat.mpx )
>> -    {
>>          xstates |= X86_XCR0_BNDREGS | X86_XCR0_BNDCSR;
>> -        xstate_size = max(xstate_size,
>> -                          xstate_offsets[X86_XCR0_BNDCSR_POS] +
>> -                          xstate_sizes[X86_XCR0_BNDCSR_POS]);
>> -    }
>>  
>>      if ( p->feat.avx512f )
>> -    {
>>          xstates |= X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM;
>> -        xstate_size = max(xstate_size,
>> -                          xstate_offsets[X86_XCR0_HI_ZMM_POS] +
>> -                          xstate_sizes[X86_XCR0_HI_ZMM_POS]);
>> -    }
>>  
>>      if ( p->feat.pku )
>> -    {
>>          xstates |= X86_XCR0_PKRU;
>> -        xstate_size = max(xstate_size,
>> -                          xstate_offsets[X86_XCR0_PKRU_POS] +
>> -                          xstate_sizes[X86_XCR0_PKRU_POS]);
>> -    }
>>  
>> -    p->xstate.max_size  =  xstate_size;
>> +    /* Subleaf 0 */
>> +    p->xstate.max_size =
>> +        xstate_uncompressed_size(xstates & ~XSTATE_XSAVES_ONLY);
>>      p->xstate.xcr0_low  =  xstates & ~XSTATE_XSAVES_ONLY;
>>      p->xstate.xcr0_high = (xstates & ~XSTATE_XSAVES_ONLY) >> 32;
>>  
>> +    /* Subleaf 1 */
>>      p->xstate.Da1 = Da1;
>> +    if ( p->xstate.xsavec )
>> +        ecx_mask |= XSTATE_ALIGN64;
>> +
>>      if ( p->xstate.xsaves )
>>      {
>> +        ecx_mask |= XSTATE_XSS;
>>          p->xstate.xss_low   =  xstates & XSTATE_XSAVES_ONLY;
>>          p->xstate.xss_high  = (xstates & XSTATE_XSAVES_ONLY) >> 32;
>>      }
>> -    else
>> -        xstates &= ~XSTATE_XSAVES_ONLY;
>>  
>> -    for ( i = 2; i < min(63UL, ARRAY_SIZE(p->xstate.comp)); ++i )
>> +    /* Subleafs 2+ */
>> +    xstates &= ~XSTATE_FP_SSE;
>> +    BUILD_BUG_ON(ARRAY_SIZE(p->xstate.comp) < 63);
>> +    for_each_set_bit ( i, &xstates, 63 )
>>      {
>> -        uint64_t curr_xstate = 1UL << i;
>> -
>> -        if ( !(xstates & curr_xstate) )
>> -            continue;
>> -
>> -        p->xstate.comp[i].size   = xstate_sizes[i];
>> -        p->xstate.comp[i].offset = xstate_offsets[i];
>> -        p->xstate.comp[i].xss    = curr_xstate & XSTATE_XSAVES_ONLY;
>> -        p->xstate.comp[i].align  = curr_xstate & xstate_align;
> ... for this bit, isn't the move from this ...
>
>> +        /*
>> +         * Pass through size (eax) and offset (ebx) directly.  Visbility of
>> +         * attributes in ecx limited by visible features in Da1.
>> +         */
>> +        p->xstate.raw[i].a = raw_cpu_policy.xstate.raw[i].a;
>> +        p->xstate.raw[i].b = raw_cpu_policy.xstate.raw[i].b;
>> +        p->xstate.raw[i].c = raw_cpu_policy.xstate.raw[i].c & ecx_mask;
> ... to this changing what guests get to see, i.e. (mildly?) incompatible?

No.

The only "rows" in leaf 0xd we expose to guests are AVX, MPX, AVX512 and
PKU  (higher up in this hunk, selecting valid bits in xstates).  None of
these have a non-zero value in ecx.

This is a latent bug until we offer AMX or CET, hence why I wanted to
complete this series before your AMX series goes in.

~Andrew

