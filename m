Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E49BCA5575D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 21:21:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904008.1311917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqHhI-0002r8-IJ; Thu, 06 Mar 2025 20:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904008.1311917; Thu, 06 Mar 2025 20:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqHhI-0002pg-FP; Thu, 06 Mar 2025 20:20:00 +0000
Received: by outflank-mailman (input) for mailman id 904008;
 Thu, 06 Mar 2025 20:19:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZnl=VZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqHhH-0002op-3D
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 20:19:59 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d8643df-fac8-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 21:19:54 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43bdcd0d97dso6569715e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 12:19:54 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd8dbb2fsm29445785e9.20.2025.03.06.12.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 12:19:53 -0800 (PST)
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
X-Inumbo-ID: 5d8643df-fac8-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741292394; x=1741897194; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QNhuGevp/Q5Oe5jwsfQAWTFma5vvixKS8s/lz47rS/U=;
        b=uLRmBdTHkdaYqHxScyW0AGcusJqvewxBarjEeTJEmua116zU2elcSljof6YYecrzW1
         ZXRQXdcZxvpMMMg+R8Kd97RPYbJF+2cIDcOISQAHc7joAWtMTy9nLWOcUExoLWPT6/ML
         yXH67UQjJ8CgkBMqYuvunvW/4gju0KfcFSsFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741292394; x=1741897194;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNhuGevp/Q5Oe5jwsfQAWTFma5vvixKS8s/lz47rS/U=;
        b=Iw+7lbtV2mMxK4uM8qzuCRO47Jx6mbGbq7nL51h26qYNpIHAdkUJp4t0Q28mp289iz
         qjMva1c0dwatvaNP25bxTVjZlYCQtlHF3BM09bImVIsQ/j4/YmhFwvRR6xhKy+hyqpsP
         cO5eWVLOr/VyU/+v1t9tPr62svVjMRfKxjWRWayZpdked0K07UOGc6Ylzklr2wnh3ZLK
         lGdtAXCUAAUcao4rR5d2BOj1BcsKD9XtZbpY1GrFTJQedHc7qftzbi/OGrjMxQyMo94t
         PN+cdQuUuSedvRKvX96dp/89Bs4zbkiKEyjyEq8iIP993dk62ucZ2qjcKBovqgt3C4ZS
         eWwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAEHiOtpaodm/iewiEv2kmDf4VDWbQO4ri6B6Cd4oh/7JujqdTEZ+w1jNLH9u01Yx/M/10TCTZbs0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhRpNq+V3CLWJL5S8fFguAT111OURY+oK7kqGnj/JO9yNCyHUT
	i2U1Pml016o9SHUJLVvobEPo9Mbs0d7Ug2qvUYFXIg229k0RiHJTS4MOKltPVbUK69nnfb1Tvwc
	O
X-Gm-Gg: ASbGncsCYKup32kPlbpUym9yHn+3i6pv/MsI/1iiy5dRxyIncrlwiur37KpNNR1ALLZ
	6GSe0iUPtMmqXgt1yloBcZNayPNHhJLT+AIMoGPbpcPGO8dJFpSBZ1XPu2tL4LRH9fuuGAB7eWo
	ukXasnqX6dStVH5NIDgY6z2/HTzjEuYrZdd6cijiPBXtYybos0QAowSFz12EcuAhmJ38zW5dvOC
	MhWFWR+10PwYUOEylZzuqYuALm00jmt1Vp9PufaHLrSKi0IR2kHVlg2bfF4fyIkBbSq6M1qd2DS
	AfvDXMj5Ch7J4eQFMmytBmZ5AkkzAFNEUMBPDRdtNHMGBeOlK1JnTPB1ojWbj1vwG3q7yJJrqFg
	fUcnK0sXC
X-Google-Smtp-Source: AGHT+IEjS7dA1ImOAqlpnVtrl5wgMaCGCiVApWb2c6vjh+H68V2XRfqATA1fvjEvAlLF1422eAfc2A==
X-Received: by 2002:a05:600c:3545:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-43c601cdb15mr6501615e9.2.1741292393617;
        Thu, 06 Mar 2025 12:19:53 -0800 (PST)
Message-ID: <8dff5fb9-b46f-47bf-a6ee-863282155706@citrix.com>
Date: Thu, 6 Mar 2025 20:19:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISCV/bitops: Use Zbb to provide arch-optimised bitops
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250226172050.1300771-1-andrew.cooper3@citrix.com>
 <113b2464-c7b2-4068-a179-707cba4f3835@suse.com>
 <50cd2332-11b7-4b64-85ea-489c416098f9@citrix.com>
 <db2073b0-8585-4518-9467-b7da4cefbbae@suse.com>
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
In-Reply-To: <db2073b0-8585-4518-9467-b7da4cefbbae@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/03/2025 7:34 am, Jan Beulich wrote:
> On 28.02.2025 17:24, Andrew Cooper wrote:
>> On 27/02/2025 8:11 am, Jan Beulich wrote:
>>> On 26.02.2025 18:20, Andrew Cooper wrote:
>>>> --- a/xen/arch/riscv/include/asm/bitops.h
>>>> +++ b/xen/arch/riscv/include/asm/bitops.h
>>>> @@ -125,6 +125,13 @@ static inline void clear_bit(int nr, volatile void *p)
>>>>  #undef NOT
>>>>  #undef __AMO
>>>>  
>>>> +#define arch_ffs(x)     ((x) ? 1 + __builtin_ctz(x) : 0)
>>>> +#define arch_ffsl(x)    ((x) ? 1 + __builtin_ctzl(x) : 0)
>>>> +#define arch_fls(x)     ((x) ? 32 - __builtin_clz(x) : 0)
>>> I fear you won't like me to say this, but can't we avoid baking in yet
>>> another assumption on sizeof(int) == 4, by using at least sizeof(int) * 8
>>> here (yet better might be sizeof(int) * BITS_PER_BYTE)?
>> Yes and no.
>>
>> No, because 32 here is consistent with ARM and PPC when it comes to
>> arch_fls().  Given the effort it took to get these consistent, I'm not
>> interested in letting them diverge.
>>
>> But, if someone wants to introduce BITS_PER_INT to mirror BITS_PER_LONG
>> and use it consistently, then that would be ok too.

Oleksii: I see your patch is committed, but when I said "use it
consistently", I meant "patch ARM and PPC too".
> I was actually hoping to eliminate BITS_PER_LONG at some point, in favor
> of using sizeof(long) * BITS_PER_BYTE. (Surely in common code we could
> retain a shorthand of that name, if so desired, but I see no reason why
> each arch would need to provide all three BITS_PER_{BYTE,INT,LONG}.)

The concern is legibility and clarity.

This:

    ((x) ? 32 - __builtin_clz(x) : 0)

is a clear expression in a way that this:

    ((x) ? (sizeof(int) * BITS_PER_BYTE) - __builtin_clz(x) : 0)

is not.  The problem is the extra binary expression, and this:

    ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)

is still clear, because the reader doesn't have to perform a multiply to
just to figure out what's going on.


It is definitely stupid to have each architecture provide their own
BITS_PER_*.  The compiler is in a superior position to provide those
details, and it should be in a common location.

I don't particularly mind how those constants are derived, but one key
thing that BITS_PER_* can do which sizeof() can't is be used in #ifdef/etc.

The following files use BITS_PER_LONG preprocessing:

arch/arm/include/asm/div64.h
arch/x86/cpu/mcheck/mce.c
arch/x86/smpboot.c
common/bitops.c
common/coverage/gcov.h
common/coverage/llvm.c
common/cpu.c
common/event_channel.c
common/time.c
common/ubsan/ubsan.c
include/asm-generic/div64.h
include/xen/cpumask.h
include/xen/inttypes.h
include/xen/nodemask.h
include/xen/sched.h
include/xen/xxhash.h
lib/find-next-bit.c
lib/generic-ffsl.c
lib/generic-flsl.c
lib/generic-hweightl.c

And I really don't think they can be replaced with a sizeof().

~Andrew

