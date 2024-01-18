Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E3B83182F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 12:12:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668726.1041126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQQJS-0003a1-Uy; Thu, 18 Jan 2024 11:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668726.1041126; Thu, 18 Jan 2024 11:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQQJS-0003XP-Rg; Thu, 18 Jan 2024 11:11:58 +0000
Received: by outflank-mailman (input) for mailman id 668726;
 Thu, 18 Jan 2024 11:11:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bYS5=I4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rQQJR-0003XJ-7n
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 11:11:57 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64151252-b5f2-11ee-98f2-6d05b1d4d9a1;
 Thu, 18 Jan 2024 12:11:56 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-337c4f0f9daso1220877f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 03:11:56 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r6-20020a5d4986000000b00337c6819af6sm2493618wrq.51.2024.01.18.03.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 03:11:55 -0800 (PST)
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
X-Inumbo-ID: 64151252-b5f2-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705576316; x=1706181116; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OFdxeABCVXiS+gOfeqbPbtAo2kXFzO1rv5WslpzpwB0=;
        b=ThztL7GlVgHOMekRy5kNE6LDNCbw4FBVaVr1F7S9Pfl9Jt2JzAN0g3VRKIq433gazh
         B2YPZhueWExJz2VIYmxYKjy4s6KhDKafiGa6jn+Cseg7XFP116Or+Em1WerFc/i5ePIE
         J4DSgUDSJslBcZRFows+k0ag2dzQGiPEF+Zc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705576316; x=1706181116;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFdxeABCVXiS+gOfeqbPbtAo2kXFzO1rv5WslpzpwB0=;
        b=NRCfKzBTylkIWqzsRszfQxmWYkdj3Ml6+kz2bqtTqktOILe8xOqahVQdduT0VYQZ6D
         e19T2Fu6cAWDrdXLG0IN8haGei4X/5a09RmeD/newFeajMgy2N/UUweM0qbxqQpl6L4G
         tkIJxyq86eFaplBgRjbbcGZWveqh7LIoIVu6nthojNz4yRQ1X93kEo6wE0KVeizeMwTI
         1HL2m9/etNcjXiShZd/jxOVXsqnrYkrC1PgBB61CUAAA8ebYIobgsoTRY4QuSW+TyJiC
         /Qa+ofZ/nU60tDcYQpn53wdtnjo/eTcRz0pauEdxpIxfLpn7i5+J0gP7Dej+VCLeWPeG
         i25A==
X-Gm-Message-State: AOJu0YxQtbhxJvQ1Rsm8tWk9nm6fKSdBQ4Y29YtQg3e6eWu4NmSefyrj
	Bh5dXZnegqMTYS8EGSDSjhxCiWxHUDOIocQjM5Nv5U7s9F4bhgGQY+uN7yp+N1U=
X-Google-Smtp-Source: AGHT+IGucdEnnhLRUu4bJ8nNiQ5Z5NihmXaZWs2LV5Oy42f++r+DndM7ya7PWHImxlCwz91RaMdSKw==
X-Received: by 2002:a5d:5392:0:b0:337:8fd0:e612 with SMTP id d18-20020a5d5392000000b003378fd0e612mr374302wrv.68.1705576315692;
        Thu, 18 Jan 2024 03:11:55 -0800 (PST)
Message-ID: <14ad2b63-f455-4a5d-bba2-a73b88f188ce@citrix.com>
Date: Thu, 18 Jan 2024 11:11:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/PV: avoid indirect call for I/O emulation quirk
 hook
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <28b46611-ff98-45cd-a2b0-ffe36b8f0ccf@suse.com>
 <9ea43cac-e1f2-4585-b1e0-a64ac6952df9@citrix.com>
 <b62bd658-6c84-40af-9518-57d88857479b@suse.com>
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
In-Reply-To: <b62bd658-6c84-40af-9518-57d88857479b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/01/2024 11:09 am, Jan Beulich wrote:
> On 18.01.2024 12:04, Andrew Cooper wrote:
>> On 17/01/2024 9:37 am, Jan Beulich wrote:
>>> --- a/xen/arch/x86/ioport_emulate.c
>>> +++ b/xen/arch/x86/ioport_emulate.c
>>> @@ -8,11 +8,10 @@
>>>  #include <xen/sched.h>
>>>  #include <xen/dmi.h>
>>>  
>>> -unsigned int (*__read_mostly ioemul_handle_quirk)(
>>> -    uint8_t opcode, char *io_emul_stub, struct cpu_user_regs *regs);
>>> +bool __ro_after_init ioemul_handle_quirk;
>>>  
>>> -static unsigned int cf_check ioemul_handle_proliant_quirk(
>>> -    u8 opcode, char *io_emul_stub, struct cpu_user_regs *regs)
>>> +unsigned int ioemul_handle_proliant_quirk(
>>> +    uint8_t opcode, char *io_emul_stub, const struct cpu_user_regs *regs)
>>>  {
>>>      static const char stub[] = {
>>>          0x9c,       /*    pushf           */
>> Something occurred to me.
>>
>> diff --git a/xen/arch/x86/ioport_emulate.c b/xen/arch/x86/ioport_emulate.c
>> index 23cba842b22e..70f94febe255 100644
>> --- a/xen/arch/x86/ioport_emulate.c
>> +++ b/xen/arch/x86/ioport_emulate.c
>> @@ -13,7 +13,7 @@ bool __ro_after_init ioemul_handle_quirk;
>>  unsigned int ioemul_handle_proliant_quirk(
>>      uint8_t opcode, char *io_emul_stub, const struct cpu_user_regs *regs)
>>  {
>> -    static const char stub[] = {
>> +    const char stub[] = {
>>          0x9c,       /*    pushf           */
>>          0xfa,       /*    cli             */
>>          0xee,       /*    out %al, %dx    */
>>
>> is an improvement, confirmed by bloat-o-meter:
>>
>> add/remove: 0/1 grow/shrink: 1/0 up/down: 1/-9 (-8)
>> Function                                     old     new   delta
>> ioemul_handle_proliant_quirk                  58      59      +1
>> stub                                           9       -      -9
>>
>> The reason is that we've got a 9 byte object that's decomposed into two
>> rip-relative accesses.  i.e. we've got more pointer than data in this case.
> I wouldn't mind this as a separate change, but I don't see how it would
> fit right here.

I'm not suggesting changing this patch.  I just linked here because I
noticed it because of this patch.

We've got similar patterns elsewhere, so I was intending to do a patch
covering all of them.

>
>> But this adjustment seems to tickle a GCC bug.  With that change in
>> place, GCC emits:
>>
>> <ioemul_handle_proliant_quirk>:
>>        48 83 ec 10             sub    $0x10,%rsp
>>        ...
>>        48 83 c4 10             add    $0x10,%rsp
>>        c3                      retq
>>
>> i.e. we get a stack frame (space at least, no initialisation) despite
>> the object having been converted entirely to instruction immediates.
>>
>> Or in other words, there's a further 12 byte saving available when GCC
>> can be persuaded to not even emit the stack frame.
>>
>> What is even more weird is that I see this GCC-10, and a build of gcc
>> master from last week, but not when I try to reproduce in
>> https://godbolt.org/z/PnachbznW so there's probably some other setting
>> used by Xen which tickles this bug.
> Yeah, I've observed such pointless frame allocation elsewhere as well,
> so far without being able what exactly triggers it.

Ok - more experimentation required, I guess.

~Andrew

