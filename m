Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B77CAC3403
	for <lists+xen-devel@lfdr.de>; Sun, 25 May 2025 12:54:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997107.1378102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJ8yW-0006Gv-Ou; Sun, 25 May 2025 10:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997107.1378102; Sun, 25 May 2025 10:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJ8yW-0006EX-MH; Sun, 25 May 2025 10:53:04 +0000
Received: by outflank-mailman (input) for mailman id 997107;
 Sun, 25 May 2025 10:53:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ik4Y=YJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uJ8yU-0006EQ-VG
 for xen-devel@lists.xenproject.org; Sun, 25 May 2025 10:53:02 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d442096-3956-11f0-a2fb-13f23c93f187;
 Sun, 25 May 2025 12:53:01 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a376ba6f08so817578f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 25 May 2025 03:53:01 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f7baaf2asm205144295e9.34.2025.05.25.03.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 May 2025 03:53:00 -0700 (PDT)
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
X-Inumbo-ID: 6d442096-3956-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748170381; x=1748775181; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mh5to5YPyXW4Cyj+AC3f58IlxOZ7WUyFpM4CaU07C9U=;
        b=vPBHMkwtwV2V/vqGrX2wN4Oi54uZ/Fafgc4RXjAKlThVxNY88mka5F97ZkEfYJUjWr
         g5wLVJYsGN77HGAUfsgp6npAZNTAoXNFs7Y0w0DgM4h8SI0FQkQ3fU5sr54qXF9s5JT/
         wy5QjrONyepPDq9eCpD8ovp9Q9DPM3MRT096U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748170381; x=1748775181;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mh5to5YPyXW4Cyj+AC3f58IlxOZ7WUyFpM4CaU07C9U=;
        b=ZaesBscm5m/SPiBzlDh283beFda7NYbd84w5oUl8chAiSIa9NaQSTmaykyi4RRUUoB
         gONyGBMiBSKAyimVehCb40yb2Xia1y6HLkyw67i/1B0vZeBIU2TroqtQeFJRczJBNQof
         v8TbmRRS1APCTqt33Q5Jel+3SiYcfl76HN/xdq9DvuIHXvga8ekzB02gzhkdnXR3zgul
         HmKWpqC17e/t+0vPC2ilrrXyycubnM7YTLg6feBxlG5b8wm6c8PN6xOlRMoU4QXmgDn3
         zMS1N49rxO4kpf83umIOB6SzEMpsKdocXBgbCA3aZYwsejivAJZ3hTqHHWoq7OJOvGwg
         KLdg==
X-Gm-Message-State: AOJu0Yz80n99je5UmoRrSbyeLnhcFFc99t9XPMY9eO9gOCn68UxpHu0+
	3/LXy43tgiJkZt8UK/iNaZxHO2DIhzj1swlde3L/3O2/P3cnEoqmUUldBSLpm0nirIs=
X-Gm-Gg: ASbGnctHH1JdmJQFNtNfnQ3N+hf5cED2FDGFF6uIoVpafWs0PTHZF+YznK9Qe8NN0Eb
	R3Bsc2lCcGS4sjOpzaig1A/++3w3vf8iXvrhOPM0y42VxxaDd42AqOJLWVrT2i6hFKjlFZZqY3o
	GJJmYT3phPWGd1JcbhbQfgiYHR9/ejV5stux0eR9+thdjXrjLWzvp5n0kzrpBBaaMP64o3NfLhb
	2H1vwJYRvwcNc+YSvt7mZsVNNwl3acEenyl3KzYtNKEfQEPR6hxGl1TZx81awTghGY+CycFqQOn
	5reEfiYtpfcwo1d8zoc0sg0W5RqFPGSvKGonaPRCfC4pvwpqmy79Isb7NF3KAU057pEte7Tg6qY
	7jSCyEAV3Jm5vBkO55wh1bs5dixk=
X-Google-Smtp-Source: AGHT+IHdvnY5R5zaPGuM50cVRKBB0Ktbe2nMagFCYQR94N4ssT1LrVUaVOglyTLV8qv+KP8nMHvapg==
X-Received: by 2002:a05:6000:2388:b0:3a4:d83a:eb2a with SMTP id ffacd0b85a97d-3a4d83aed39mr401447f8f.55.1748170380716;
        Sun, 25 May 2025 03:53:00 -0700 (PDT)
Message-ID: <a1fe2c69-b10b-41cb-9aaf-c21159248ad5@citrix.com>
Date: Sun, 25 May 2025 11:52:59 +0100
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
 <e25858b4fedaa40d8934e5fe6bc40c01@bugseng.com>
 <49f092f9-c0fb-4b66-af20-368c736dde91@citrix.com>
 <526fe46bf2e4b5985d1b8cd3361e5730@bugseng.com>
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
In-Reply-To: <526fe46bf2e4b5985d1b8cd3361e5730@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/05/2025 8:34 am, Nicola Vetrini wrote:
> On 2025-05-22 15:49, Andrew Cooper wrote:
>> On 22/05/2025 1:45 pm, Nicola Vetrini wrote:
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
>>>
>>> That has been fixed upstream. I'll reach out to you when that fix
>>> trickles down to the runners, so that you're able to test and push
>>> that change.
>>
>> Oh, fantastic thanks.
>>
>> I'll hold off pushing until then.
>>
>> ~Andrew
>
> Hi Andrew,
>
> both runners are now updated with the new images, so you can rerun the
> tests.

Both Eclair runs are unhappy, and not even completing analysis.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1835567532

This is the same branch as before, plus your config change for R1.1

~Andrew

