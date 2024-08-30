Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F35966A2A
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 22:03:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786618.1196217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk7pr-0001te-LT; Fri, 30 Aug 2024 20:03:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786618.1196217; Fri, 30 Aug 2024 20:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk7pr-0001s4-IV; Fri, 30 Aug 2024 20:03:07 +0000
Received: by outflank-mailman (input) for mailman id 786618;
 Fri, 30 Aug 2024 20:03:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YGfl=P5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sk7pq-0001ry-Bo
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 20:03:06 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dea79372-670a-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 22:03:05 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5343d2af735so2135387e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 13:03:05 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891d8109sm250529666b.174.2024.08.30.13.03.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 13:03:03 -0700 (PDT)
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
X-Inumbo-ID: dea79372-670a-11ef-a0b1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725048185; x=1725652985; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IEzcl/YiJ1rAH/kUkVYmX+0WnDcSPCERYm84t9TlZVI=;
        b=IOYi1CEArp1Var4H2HzFpkEJg2okyevW0sQwrlHzeK1x8a6zxRkFzRCBNE50mU4H4v
         Q1OwdyMxdYBOUlwmxtvtiCUwnl7EwzCfiNVYmFIHYAd7XT3ICud7A3yAaxDGdAmHhH5c
         YUmZ8X3ucOjoRoMM4vm/x043p0Kbz7rj6zePo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725048185; x=1725652985;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEzcl/YiJ1rAH/kUkVYmX+0WnDcSPCERYm84t9TlZVI=;
        b=q6xOVoJufsHupOajtt36niYFfdnClSkkPfeoFK5eZ/C7ctAb5M+u3S456X5ql5LNTz
         SUfpL0khdyW8MQf107px0UkY2oeYYeTT7PYNCZRteA8z05VEgWWokY+0+R33GmRyanUS
         6leqBBgvGD9jPFvKf3ORg2iNzRmEbjQ8t2+9k2Va4aFtxyiCpkrjioDzy8qHrCvx7E7/
         rAr4U/JPTqPOkjEb92LnUTZjhhrPclmI48ECpKYNyTKGZ3J5rgnzUoUoin1AEhjflL50
         7g4lqShk8a2nc0mNUzEnz5eM0Xzm2oBIYb+7pkjIelZT8oWR3BV4jfnfWvX/AWHQ0kBm
         +VIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTt5R+UeSIXiC/wkG5N+9lt3KxIk09LCcX/D2p3ht6VEZOvkurqM10gI5RMeRCGELEu84byvQjM1M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznXnta8lqeyJtcgfoVE8RhFrL9je9DW97WI2q/NGMEtp7KthRL
	hnE6Ie8LZxNhDsTtKKJYKsG3YaZaGpUF3ejr2yix5nF073uLcXJ1tfBQUOgAUHs=
X-Google-Smtp-Source: AGHT+IHZys1vcCxPv6W/WFOruS00mETlobf+qpqkcFkDsWOoH1HbHlWi/YVMLbWelGwU95bi5mZrQQ==
X-Received: by 2002:a05:6512:3f17:b0:52d:b226:9428 with SMTP id 2adb3069b0e04-53546afd97emr2453458e87.6.1725048184231;
        Fri, 30 Aug 2024 13:03:04 -0700 (PDT)
Message-ID: <f661dca1-0583-4a83-89db-662473749df8@citrix.com>
Date: Fri, 30 Aug 2024 21:03:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] x86/bitops: Use the POPCNT instruction when
 available
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
 <20240828220351.2686408-12-andrew.cooper3@citrix.com>
 <48377e77-2458-439c-b594-21bde610ffbb@suse.com>
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
In-Reply-To: <48377e77-2458-439c-b594-21bde610ffbb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/08/2024 3:36 pm, Jan Beulich wrote:
> On 29.08.2024 00:03, Andrew Cooper wrote:
>> It has existed in x86 CPUs since 2008, so we're only 16 years late adding
>> support.  With all the other scafolding in place, implement arch_hweightl()
>> for x86.
>>
>> The only complication is that the call to arch_generic_hweightl() is behind
>> the compilers back.  Address this by writing it in ASM and ensure that it
>> preserves all registers.
>>
>> Copy the code generation from generic_hweightl().  It's not a complicated
>> algorithm, and is easy to regenerate if needs be, but cover it with the same
>> unit tests as test_generic_hweightl() just for piece of mind.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> v2:
>>  * Fix MISRA 8.2 (parameter name) and 8.5 (single declaration) regressions.
>>  * Rename {arch->x86}-generic-hweightl.{S->c}
>>  * Adjust ASM formating
>>
>> The __constructor trick to cause any reference to $foo() to pull in
>> test_$foo() only works when both are in the same TU.  i.e. what I did in
>> v1 (putting test_arch_generic_hweightl() in the regular generic-hweightl.c)
>> didn't work.
> I'm afraid I don't understand this. What exactly didn't work, breaking in which
> way? Presumably as much as you, I don't really like the global asm() in a C
> file, when ideally the same could be written with less clutter in an assembly
> one.

We have lib-y because we wish to not include arch_generic_hweightl() if
it isn't referenced.

But, test_arch_generic_hweightl() unconditionally references
arch_generic_hweightl() (in CONFIG_SELF_TESTS builds).

So, the trick is to have both {test_,}arch_generic_hweightl() together
in the same object file, with test_* being entirely self contained as a
constructor.

That way, if and only if something else references
arch_generic_hweightl() do we pull in this object file, and pick up the
tests as side effect.


v1 of this patch had the test in a separate object file, causing
arch_generic_hweightl() to be referenced based on the inclusion criteria
for regular generic-hweightl.c

This patch causes the x86 build of Xen to no longer reference
generic_hweightl(), so it was excluded along with its own tests, and
test_arch_generic_hweightl().

Therefore, we had arch_generic_hweightl() in use, but the selftests not
included.


Both {test_,}arch_generic_hweightl() do need to be in the same TU for
this to work (nicely), and I'm very uninterested in writing
test_arch_generic_hweightl() in asm.


>
>> This in turn means that arch_generic_hweightl() needs writing in a global asm
>> block, and also that we can't use FUNC()/END().  While we could adjust it to
>> work for GCC/binutils, we can't have CPP macros in Clang-IAS strings.
> What does Clang different from gcc there? I was hoping that at least their pre-
> processors would work in (sufficiently) similar ways.

It's inside a string, not outside, so CPP on the C file does nothing.

Passing CPP over the intermediate .S would work, but we don't have an
intermediate .S with Clang-IAS.

I'm also not particularly interested in doubling up xen/linkage.h with
different quoting in !__ASSEMBLY__ case.


One other option which comes to mind is to have:

    .macro func name
        FUNC(\name)
    .endm

which (I think) could be used as:

    asm (
        "FUNC foo\n\t"
        ...
        "ret\n\t"
        "END foo"
    );

It reads almost the same, and avoids opencoding contents of FUNC, but
even this requires changing the __ASSEMBLY__-ness of linkage.h and I
can't see a nice way of making it happen.

Or we finally bump our minimum toolchain version...  GCC 7 is already
old enough to be out of the recent LTS's...

~Andrew

