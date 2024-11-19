Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFC89D2DD4
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 19:23:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840731.1256222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDSsE-0005yN-3Y; Tue, 19 Nov 2024 18:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840731.1256222; Tue, 19 Nov 2024 18:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDSsE-0005vH-0W; Tue, 19 Nov 2024 18:22:50 +0000
Received: by outflank-mailman (input) for mailman id 840731;
 Tue, 19 Nov 2024 18:22:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydLn=SO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tDSsC-0005vB-HI
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 18:22:48 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 447c090d-a6a3-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 19:22:43 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9e8522c10bso9210066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 10:22:43 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e08625asm685108766b.187.2024.11.19.10.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2024 10:22:42 -0800 (PST)
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
X-Inumbo-ID: 447c090d-a6a3-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzEiLCJoZWxvIjoibWFpbC1lajEteDYzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ0N2MwOTBkLWE2YTMtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDQwNTYzLjIyNjUyNiwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732040563; x=1732645363; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+L9M5rjRulALgCVbmT+2eWrSNIu/UFYXBmq/PL8Nj1I=;
        b=IjzUM3cZho2wzzAVMrc6zIe9FWrJ2rL0A3DHb8i82vHMdstv+vjYDCFvnigrajZYla
         szQVqvbQVEC71KoLHru06AGk03ouRMk9EVPyzEVegZlCr/Px/n16oajZTMS3FHzytjzP
         M6GbW1SGV+oE9HIBKaa58Y0gXKVa6OwfCNMBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732040563; x=1732645363;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+L9M5rjRulALgCVbmT+2eWrSNIu/UFYXBmq/PL8Nj1I=;
        b=LRrYXlqq7Rz6n4YwujhOrJxyhif0zzP3bjRz7BRRcD7MbeREcqAQScdUCJ2UxB8TNH
         YtAULZToKmfabE62p2AQiE4/NlSSw5tohrdV5AaPLjgKPNyWlEq+YOm+0ZhmEaZKPQPH
         fapFsi74PpyLw5JMSdu5jogJrmRckcwU39J44A+OmLrRVDhqVImxhx9dvt0hVkhPXOTO
         1NuuRJu5cL5QRo0/oisSBFUhv7plGGYx5yl3HbmDHliZUMfUkZu8PzrPbnSw+ggB6hyw
         toB2KhWYv5QRg11fLShRIR1ZvvrUclxwUYIYdhcH+Kbp9+waNxGsljeOvoS+6e0G8uBX
         bw0w==
X-Forwarded-Encrypted: i=1; AJvYcCVEZVs1IDWqlxdNq1QNekGd/yCjOq+5LLL6fnstfcHlp9p5ESEXc6lOZU12g/mcRrvS/5pVqeZYBc0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBJG0sMnt30t4+Mgs2CYlNDSi4Rq4WWb4hK0yUqp7PgODIjXe5
	ddjPUZ7814p1hrd5XeKAxj9TISmN9DVfR+1QLkk9fyEf21AOJnIi1Q6GZKvADGI=
X-Google-Smtp-Source: AGHT+IHaSnxBlT/qgX4iMVlPIDK7xIuc/feJ3keDRwgE/raE+GcU+8BUmkJeqa7juEZrydTJlIl0Ow==
X-Received: by 2002:a17:907:268e:b0:a99:fbb6:4972 with SMTP id a640c23a62f3a-aa4dcd5dd20mr1762866b.25.1732040562703;
        Tue, 19 Nov 2024 10:22:42 -0800 (PST)
Message-ID: <00fa3d65-d598-474f-b9ee-7b63db2d3b40@citrix.com>
Date: Tue, 19 Nov 2024 18:22:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mce: Compile do_mca() for CONFIG_PV only
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241119125904.2681402-1-andrew.cooper3@citrix.com>
 <d92cf59a-a798-4223-9439-85ae215b7daa@suse.com>
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
In-Reply-To: <d92cf59a-a798-4223-9439-85ae215b7daa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/11/2024 2:34 pm, Jan Beulich wrote:
> On 19.11.2024 13:59, Andrew Cooper wrote:
>> Eclair reports a Misra Rule 8.4 violation; that do_mca() can't see it's
>> declaration.  It turns out that this is a consequence of do_mca() being
>> PV-only, and the declaration being compiled out in !PV builds.
>>
>> Therefore, arrange for do_mca() to be compiled out in !PV builds.  This in
>> turn requires a number of static functions to become static inline.
> Which generally we advocate against.

It's `static inline` or `static __maybe_unused`, but I refer you to to
the Matrix conversation on June 24th on the matter.


>  The #ifdef variant you pointed at on
> Matrix wasn't all that bad.

It worked as a test, but ifdefary like that is a maintenance nightmare.

>  Plus ...
>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: consulting@bugseng.com <consulting@bugseng.com>
>>
>> Bloat-o-meter on a !PV build reports:
>>
>>   add/remove: 0/6 grow/shrink: 0/0 up/down: 0/-3717 (-3717)
>>   Function                                     old     new   delta
>>   x86_mc_mceinject                              31       -     -31
>>   do_mca.cold                                  117       -    -117
>>   x86_mc_msrinject                             147       -    -147
>>   x86_mc_msrinject.cold                        230       -    -230
>>   do_mc_get_cpu_info                           500       -    -500
>>   do_mca                                      2692       -   -2692
> ... what's the effect of the addition of "inline" on a PV=y build? By
> using the keyword, we may end up talking the compiler into inlining of
> code that better wouldn't be inlined.

xen.git/xen$ ../scripts/bloat-o-meter xen-syms-{before,after}
add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
Function                                     old     new   delta
Total: Before=3901801, After=3901801, chg +0.00%
xen.git/xen$ diff -u dis-{before,after}
--- dis-before    2024-11-19 18:08:02.284091931 +0000
+++ dis-after    2024-11-19 18:08:24.491035756 +0000
@@ -1,5 +1,5 @@
 
-xen-syms-before:     file format elf64-x86-64
+xen-syms-after:     file format elf64-x86-64
 
 
 Disassembly of section .text:

xen.git/xen$


Which is not surprising because at -O2, the keyword is effectively
ignored because of the various -finline-*

~Andrew

