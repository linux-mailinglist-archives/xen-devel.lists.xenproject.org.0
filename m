Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D35ABFD92
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 21:50:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992498.1376213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHpSj-00038I-FZ; Wed, 21 May 2025 19:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992498.1376213; Wed, 21 May 2025 19:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHpSj-00036c-Cv; Wed, 21 May 2025 19:50:49 +0000
Received: by outflank-mailman (input) for mailman id 992498;
 Wed, 21 May 2025 19:50:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqa2=YF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uHpSi-000333-G8
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 19:50:48 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e312bc5f-367c-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 21:50:46 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so49803235e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 12:50:46 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35e49262fsm20075072f8f.44.2025.05.21.12.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 12:50:45 -0700 (PDT)
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
X-Inumbo-ID: e312bc5f-367c-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747857046; x=1748461846; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3znSiK4nKxXPx+u0aRYNV82e3clJEJVeMpcirc6h1lM=;
        b=OcK5ssz3oyj4iWEYleQkLTL3q85e0kBSNcVEizfxzSCxsHb3Q6uiY7qWOi2o06S73M
         GjQy9GgwSL6WXGBtqvzXQ17EOkp1yk6icFzZryMOqdQAOLZldlGyB9BZIAFLaS55GmLb
         HnQm2hbOb+GXbkUjFeoIzoxsbZyX38rM4D/FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747857046; x=1748461846;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3znSiK4nKxXPx+u0aRYNV82e3clJEJVeMpcirc6h1lM=;
        b=LmPrmrL6RWg9zWXzLjSr6Qs/XE4p1JZLlBfA4JmQOcKKh8o9JkAlXIxCwjOtCaxBtH
         6eZg5GN4/z9L9FPMp935fd9VaLxpy9MdMaj6ll9m6G1JFwrmoeklrvyrZIbAeKlZrpZU
         c6W0WJItm1UxxyQgDKIYuDsfUXONTfSBjdW2E4DRJOuMBk4fby/i/TLhQ/WeYpyC5Kub
         cfzX7+mTMno6zOej+FvW4BW93+ihuzPQXqMoMfgPdVyYVvFWlvk7uRSrhxiQYVjWoi3q
         EngH2bx/LnA1c+cObfhUk/2lnVtvKNSxp9HSTHxR5QazSxWTDPeviHwOncZbHIqr1LRK
         uNpw==
X-Gm-Message-State: AOJu0YzdbIJCCKBqfijJFhzuCNpV0TE9knAyTtoiOTPNNwPp7x+IzhBr
	ErXV6GzViTeyS86KHz5KlwtI4kWY2Gc2plHYLlAJLIZ+OgOe2fQ9pHalZwXtk4GpIYs=
X-Gm-Gg: ASbGncvSkzTgnVdcWzqIj4SbEQJ+rNECo3872BRcCJulokhYG3LHWB273ihwOmTdS4g
	HjoFRFjTsqjX9jE/RUJuYpGjjq2yq3qyoBSLK3j73xkqFXmPsglxekUk7v24HEI//Bz9QWttfTQ
	67Rz0tG5XNUIdEorycU9LHzZoCdThWO1fUGIBFmQC54vUU9PCJ+XxjHqLMF5AsRZbuStnu3SBr+
	cjhrNyEaQBUX2YELU/idh3Sr9M6ah1DY4a4lcqbRlv02X2RoYkOJj/CO25OWUChSABK/Zso+Py6
	KlZcbqNYNWxkNM9i7MsuLSEEKM2pWguY77s5l32OzK1JYQe7x8JrZSXck3s0Bfrf8OOGmuu9Dq8
	xYRUKCNiJNW9aGLuo
X-Google-Smtp-Source: AGHT+IEYvoU2fNkVThUQQkh9VAYt/ug4il28egK3k1kdb0Y/S4hTUymDezxx3RZGHpdMOff8XOWtNQ==
X-Received: by 2002:a05:600c:8a5:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-442f8b7a2b9mr163101705e9.10.1747857045663;
        Wed, 21 May 2025 12:50:45 -0700 (PDT)
Message-ID: <338413e6-7917-4dfd-bee6-7518125d7824@citrix.com>
Date: Wed, 21 May 2025 20:50:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Eclair false positive] Re: [PATCH] x86/msr: Rework wrmsr_safe()
 using asm goto()
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250521143658.312514-1-andrew.cooper3@citrix.com>
 <8504aab1-c48a-4981-a502-93a2fd18880b@citrix.com>
 <70f8e278921685e39eec6656a529b31b@bugseng.com>
 <5eda4958-0eb8-4b52-8ae4-297206c29803@citrix.com>
 <a5b12ada8bb70e5abc876d289e965b88@bugseng.com>
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
In-Reply-To: <a5b12ada8bb70e5abc876d289e965b88@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/05/2025 8:48 pm, Nicola Vetrini wrote:
> On 2025-05-21 21:43, Andrew Cooper wrote:
>> On 21/05/2025 8:21 pm, Nicola Vetrini wrote:
>>> On 2025-05-21 20:00, Andrew Cooper wrote:
>>>> On 21/05/2025 3:36 pm, Andrew Cooper wrote:
>>>>> diff --git a/xen/arch/x86/include/asm/msr.h
>>>>> b/xen/arch/x86/include/asm/msr.h
>>>>> index 0d3b1d637488..4c4f18b3a54d 100644
>>>>> --- a/xen/arch/x86/include/asm/msr.h
>>>>> +++ b/xen/arch/x86/include/asm/msr.h
>>>>> @@ -69,20 +69,20 @@ static inline void wrmsr_ns(uint32_t msr,
>>>>> uint32_t lo, uint32_t hi)
>>>>>  /* wrmsr with exception handling */
>>>>>  static inline int wrmsr_safe(unsigned int msr, uint64_t val)
>>>>>  {
>>>>> -    int rc;
>>>>> -    uint32_t lo, hi;
>>>>> -    lo = (uint32_t)val;
>>>>> -    hi = (uint32_t)(val >> 32);
>>>>> -
>>>>> -    __asm__ __volatile__(
>>>>> -        "1: wrmsr\n2:\n"
>>>>> -        ".section .fixup,\"ax\"\n"
>>>>> -        "3: movl %5,%0\n; jmp 2b\n"
>>>>> -        ".previous\n"
>>>>> -        _ASM_EXTABLE(1b, 3b)
>>>>> -        : "=&r" (rc)
>>>>> -        : "c" (msr), "a" (lo), "d" (hi), "0" (0), "i" (-EFAULT));
>>>>> -    return rc;
>>>>> +    uint32_t lo = val, hi = val >> 32;
>>>>> +
>>>>> +    asm_inline goto (
>>>>> +        "1: wrmsr\n\t"
>>>>> +        _ASM_EXTABLE(1b, %l[fault])
>>>>> +        :
>>>>> +        : "a" (lo), "c" (msr), "d" (hi)
>>>>> +        :
>>>>> +        : fault );
>>>>> +
>>>>> +    return 0;
>>>>> +
>>>>> + fault:
>>>>> +    return -EFAULT;
>>>>>  }
>>>>
>>>> It turns out this is the first piece of Eclair-scanned code using asm
>>>> goto.
>>>>
>>>> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/10108558677
>>>> (The run also contained an equivalent change to xsetbv())
>>>>
>>>> We're getting R1.1 and R2.6 violations.
>>>>
>>>> R1.1 complains about [STD.adrslabl] "label address" not being valid
>>>> C99.
>>>>
>>>> R2.6 complains about unused labels.
>>>>
>>>> I expect this means that Eclair doesn't know how to interpret asm
>>>> goto()
>>>> yet.  The labels listed are reachable from inside the asm block.
>>>>
>>>> From a qualification point of view, this allows for some extensive
>>>> optimisations dropping emitted code.
>>>>
>>>
>>> Hi Andrew,
>>>
>>> R1.1 is easy to fix, I'll send a patch myself. On R2.6 you are
>>> probably right. I suggest marking the rule not clean to unblock while
>>> we investigate. It should not be hard to fix this FP.
>>
>> I've not committed the patch yet, so staging is still green.
>>
>> But, it occurs to me that this is not the first asm goto() to be scanned
>> by Eclair.  There's wrmsr_amd_safe() in amd.c (c/s b3d8b3e3f3aa from ~6w
>> ago) using exactly the same pattern, which has been passing just fine.
>>
>> Clearly something else is relevant in terms of triggering violations.
>>
>> ~Andrew
>
> I think the reason it's simply that file being out of scope due to
> being imported from Linux (whether that is still true I don't know),
> which is unfortunate. We ought to revise that list
> (docs/misra/exclude-list.json).
>

Oh, that.  Anyone who takes a cursory look at amd.c will find it has
diverged entirely from Linux.

If I were an examiner, I wouldn't accept such a claim for being out of
scope...

~Andrew

