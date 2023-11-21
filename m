Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2CA7F2D03
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 13:21:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637793.993834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5PkO-0001Ql-2m; Tue, 21 Nov 2023 12:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637793.993834; Tue, 21 Nov 2023 12:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5PkN-0001NW-Vs; Tue, 21 Nov 2023 12:20:55 +0000
Received: by outflank-mailman (input) for mailman id 637793;
 Tue, 21 Nov 2023 12:20:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qy+O=HC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5PkN-0001Lf-C3
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 12:20:55 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69fa6490-8868-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 13:20:53 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4083f61322fso24771395e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 04:20:53 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a1c6a13000000b0040a4751efaasm16501776wmc.17.2023.11.21.04.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 04:20:52 -0800 (PST)
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
X-Inumbo-ID: 69fa6490-8868-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700569252; x=1701174052; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MahRkEGNfJPBGAlUAnhnOpqCYt9BpTnl59IRNr4aPsM=;
        b=OGRrIGIBFA6kAENvjCY8ddBLXtiU7cX4V7vhM0o7z3+wEfonVHImesTtL9ZAx4OAtX
         rc2w2xMZhpuQi6Kg9h/RNhdcPwHJ6XLfRk1Zur+hwiPxQ1iuz8cr5XNob7xutgHf+Na9
         1ephUoODQz2pfhb0b+sHbx3iATKEO66b8dmZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700569252; x=1701174052;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MahRkEGNfJPBGAlUAnhnOpqCYt9BpTnl59IRNr4aPsM=;
        b=bHI5ZF/2Wg9TNls4CzaG+lhep4mgj9p03RdgNafi4EGGlgPIPDXOLJ+6cWDm96/6Cb
         nnLW5sbun2fLvqoL5o7qC9/2kyR04FezirSEUUrYubP+ucOLDPCqargk4WGGoJyC58u2
         lIsWjiD9tMZ1gDTW/zg/FRiyWYbAp76zXbnO5WD3nCorjjZeqQsGL5do71tMwyk9mEBG
         onWgUgMNxLJ0wt5hmPTLdQJq0PrRul0Kh/BJniIQvxbH7BIHKwlxOVBwJgRW4F6PBvJ/
         ADpNwWbEeoLd5qN3yHH1oFcqLLfu2oZ2VxwGnl2i5mWTwprX00AQPnza5xtxtFNVLy2x
         kzqg==
X-Gm-Message-State: AOJu0Yxbj5+sI/11BmlD+DehlincIS8hWo4uQ7Ye+lQCC9Ytlj6+u5oX
	QsTd0Im0hnR5TSH0h/gSUUAFHw==
X-Google-Smtp-Source: AGHT+IHbANNujRxzYh+bJo8gwAe4fLim1Zj8GHeO+ZjrphnQo0SbUkCXlO/JTsDKKlaa0REeHFVHWg==
X-Received: by 2002:a05:600c:46c6:b0:40a:3750:46ff with SMTP id q6-20020a05600c46c600b0040a375046ffmr8040675wmo.11.1700569252646;
        Tue, 21 Nov 2023 04:20:52 -0800 (PST)
Message-ID: <7b7338de-7d34-4f27-b1ec-05bee833844d@citrix.com>
Date: Tue, 21 Nov 2023 12:20:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/entry: Use 32bit XOR in handle_ist_exception
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231120195742.1343677-1-andrew.cooper3@citrix.com>
 <28128f10-1381-462f-9eeb-7c43aec6abb9@suse.com>
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
In-Reply-To: <28128f10-1381-462f-9eeb-7c43aec6abb9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/11/2023 8:56 am, Jan Beulich wrote:
> On 20.11.2023 20:57, Andrew Cooper wrote:
>> This is a micro-optimsiation for Silvermont microarchitectures, which don't
>> recognise the 64bit form as a zeroing idiom.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> For my education, ...
>
>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -1027,7 +1027,7 @@ handle_ist_exception:
>>           * Interrupted guest context. Clear the restore value for xen_cr3
>>           * and copy the context to stack bottom.
>>           */
>> -        xor   %r15, %r15
>> +        xor   %r15d, %r15d
>>          xor   %ebx, %ebx
>>          GET_CPUINFO_FIELD(guest_cpu_user_regs,di)
>>          movq  %rsp,%rsi
>>
>> base-commit: fa2da5bce90b3777aa7a323e1cf201c97b56d278
> ... while I understand this, what ...
>
>> prerequisite-patch-id: a9e4e1e34d08e876d1fcb3299c6d563086768722
>> prerequisite-patch-id: 703590f2c99382f6509c94bb5955f47ab2d7c57d
> ... are these about? They look like they would be naming prereq changes
> which aren't committed yet, but (a) base-commit names the tip of the
> staging branch and (b) the hashes would be meaningless without a repo
> reference if they pointed at something that wasn't committed yet.

It's a slightly irritating side-effect of the functionality that
generates base-commit.

What it means was that this patch was 2 commits deep into a branch and I
haven't sent out the other two patches.

In this case, misc debugging that's not relevant to the change at all.

I try to strip it when I remember, but I forgot in this case.

~Andrew

