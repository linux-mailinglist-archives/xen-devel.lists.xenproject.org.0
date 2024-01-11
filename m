Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3975B82B1B5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 16:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666388.1036996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwvM-0006PX-Oy; Thu, 11 Jan 2024 15:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666388.1036996; Thu, 11 Jan 2024 15:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwvM-0006MY-L4; Thu, 11 Jan 2024 15:24:52 +0000
Received: by outflank-mailman (input) for mailman id 666388;
 Thu, 11 Jan 2024 15:24:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPRU=IV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rNwvL-0006LE-8P
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 15:24:51 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ee191c7-b095-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 16:24:49 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e613b6afbso6375515e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 07:24:49 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q15-20020adfea0f000000b00336e6014263sm1449850wrm.98.2024.01.11.07.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 07:24:48 -0800 (PST)
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
X-Inumbo-ID: 8ee191c7-b095-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704986688; x=1705591488; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yf50IBpvMi8DXqICcJcUpkaMEphxZmsxQnrWLsFQjYs=;
        b=bEy0Admg7HnN+YFCWiVLtnxPMJpxFOBrHarFlQzy6RFu8y79c2pHGN6MpvKlvJEbGJ
         GBHFFlZgiCFr2onDAo14cisungnXc96TgvkDt2ekjDXEzLDKPOJqxU1qOOmCIRQudG8K
         18hOoGntG3zeqIW0I/g/XcjTvNhp16CaZHxqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704986688; x=1705591488;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yf50IBpvMi8DXqICcJcUpkaMEphxZmsxQnrWLsFQjYs=;
        b=ReQCD96qsBgQlLofYpjCfuYMIOzTiR7fppRT2jmKiE7UHAkM45HW9JLU09aH4UO5JS
         63MxltBcYBpCdzKCNQzuvCau1kaPSmymz6MQy8NhjrF8/AWshU1C597AOnAvD3hhrCxA
         6nApUePG0tkI6PUKBZa8OCvASqqabk9KAIKyhPGzjUNA4/8zg8Fp23aeYfEeK9s7i1vc
         0LKfjOrai+2a7QCuP8AvaxRpTU7fUN5RGnjEr5/I9ZcbidJbDSD5DExjSK4C0sozG/Na
         bPWGSVZOm75+OGaOSeRA/SI59rv4f5nSC1M1hpB+XX3kcw2aIKTvK5wSQy/aDKR4aehR
         0A0g==
X-Gm-Message-State: AOJu0Ywtxme+ljIA/T9AHB0qhu61/eKiG7m7O6ojdslzy/aMdRqJ/X8w
	4S04P+A0Q3uEbXnCAdROZg6BrMgDQI9L+j3rBsPoYYzD9UkqZA==
X-Google-Smtp-Source: AGHT+IE8Ryl0G01eKyI9vtOupmlu3FQo0p281JZzZ76Tcsq5PikG/iLYMHA1KHRJBZjDVnShCbb2kg==
X-Received: by 2002:a05:600c:5247:b0:40d:484e:935 with SMTP id fc7-20020a05600c524700b0040d484e0935mr497782wmb.12.1704986688416;
        Thu, 11 Jan 2024 07:24:48 -0800 (PST)
Message-ID: <ea5c4f94-e4eb-471e-aa45-cf4b8a3a3763@citrix.com>
Date: Thu, 11 Jan 2024 15:24:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] keyhandler: don't pass cpu_user_regs around
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
 <dd1c24ec-4054-43e1-b0c9-6c2044b84046@suse.com>
 <7d21e38d-d1f8-46df-89ef-809dd9c5a38b@citrix.com>
 <aa0a0b1c-ffe0-456f-933f-2e62c9a47f82@suse.com>
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
In-Reply-To: <aa0a0b1c-ffe0-456f-933f-2e62c9a47f82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/01/2024 12:11 pm, Jan Beulich wrote:
>>> Have
>>> handle_keypress() make the pointer available via a per-CPU variable,
>>> thus eliminating the need to pass it to all IRQ key handlers, making
>>> sure that a console-invoked key's handling can still nest inside a
>>> sysctl-invoked one's.
>> I know this is the current behaviour, and I'm not suggesting altering it
>> in this patch, but the sysctl was added so you had a way of using debug
>> keys without necessarily having a working serial connection.
>>
>> It was never expected or intended for both mechanisms to work
>> concurrently, and I don't think we need to take any care to make/keep it
>> working.
> Well, all it takes is the saving and restoring of keypress_regs in
> handle_keypress(). You you really think it would be better to risk
> a cash, but not doing that tiny bit of extra work?

I presume you mean crash?

I'm not advocating for leaving something explicitly unsafe, but I'm also
looking to see if we can avoid having keypress_regs to begin with.  i.e.
I think we've already got unnecessary complexity, and it would be good
to reduce it.
>> Trap to debugger is an x86-ism for gdbstub only.  I'm tempted to drop
>> all the gdbstub code.  I've never encountered it working in 13y, and the
>> number of build fixes I've done personally, I don't believe the code can
>> plausibly be in a non-bitrotten state.
>>
>> Nevertheless, an explicit trap-to-debugger which isn't a manually
>> inserted debugger_trap_{immediate,fatal}() is a weird construct in the
>> first place, not least because an attached debugger can do this on its
>> own anyway.
> Not sure here, and I'd hope purging of that (if so wanted) can be dealt
> with separately.

It can, yes.

It was just if there was an easy way to avoid introducing keypress_regs
then it would have been better to remove this first, than to refactor
and then delete.

> I have a vague recollection of such "on its own" wasn't
> very reliable, when trying to use such elsewhere (in the distant past,
> before I started working on Xen). That's not to say that I have proof
> that our debug-key is any more reliable.

This really comes back to whether gdbstub works or not.

Frankly, if you really do need to debug Xen these days, you'd be better
off running it under Qemu and using the qemu gdbstub.  If nothing else
it's more likely to work, and it does not need an alive-enough Xen to
have a working irq/serial subsystem.

>
>> The more I think about this, the more I think we should just remove 'D',
>> even if we don't go for dropping gdbstub.  It's the only place where
>> gdbstub really escapes out of x86 into common code.  (I see there's a
>> new one in bug.h but that is abstracted with a macro.)
>>
>> Also, `xl debug-keys D` was clearly something that just got swept up
>> with "make all debug keys usable via sysctl", not because it was a
>> plausibly useful construct.
> Did you really mean D (EPT table dump), not %? If the latter, then yes,
> that may better be filtered out of what can be done via sysctl.

I did mean %, yes.

>
>> This just leaves dump regs, which I think can safely use get_irq_regs()
>> || guest_cpu_user_regs().  All it wants is something to dump_execstate()
>> to, which just wants to be the start of the path which led here.
> I don't think so - consider the case of 'd' hitting while handling an
> interrupt (and, say, stuck there in an infinite loop with IRQs enabled).
> We'd then wrongly dump the context of what the earlier IRQ interrupted.

The serial IRQ producing the 'd' keypress will push a irq frame, which
is what will be returned by get_irq_regs().

It does occur to me that we're trying to accommodate for two behaviours
here.

For a real keypress, we want to dump from the the point the interrupt
hit because that's the interesting bit of stack to see.  For a SYSCTL,
there's nothing, and we're using BUGFRAME_run_fn to generate one.

So actually we just simply want "regs = get_irq_regs();" here and retain
prior NULL check, don't we?

~Andrew

