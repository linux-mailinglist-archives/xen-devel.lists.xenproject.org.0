Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14142A2FCF4
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 23:23:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885019.1294779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thcBM-0004py-8C; Mon, 10 Feb 2025 22:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885019.1294779; Mon, 10 Feb 2025 22:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thcBM-0004od-5U; Mon, 10 Feb 2025 22:23:12 +0000
Received: by outflank-mailman (input) for mailman id 885019;
 Mon, 10 Feb 2025 22:23:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wHzs=VB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1thcBL-0004oX-9A
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 22:23:11 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bba0480-e7fd-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 23:23:10 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4394c192285so4549015e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 14:23:10 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390db1150csm194278055e9.39.2025.02.10.14.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:23:08 -0800 (PST)
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
X-Inumbo-ID: 9bba0480-e7fd-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739226189; x=1739830989; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2dYN3CSQ3mhneErs+2JeC9dlQzH5HJN51Yksotll/yw=;
        b=ew/u4e/suG6BBFgMDqlz6S9SOe5y2xXCdAGP3KLmVZlcBC3cemxNJCU56jwm7VFf00
         Q2scZh3j5TvSWBJ5frmODSF+q/uP2EFjQA1Q6wOvU7ctSMjSu/8Upu3g7GbGWkaXXDFM
         JGd+TL3WnoFGrJ4UXM2YyyznJL31kRsRKEQLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739226189; x=1739830989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dYN3CSQ3mhneErs+2JeC9dlQzH5HJN51Yksotll/yw=;
        b=rH8uA+Q5xerjGzlfdPfl3WpzDH/53haivUhf1RPXlGsrj9lXq19Ky5BYjcEs67eXj4
         iN6fd/WL1UGxVdZLRh4BWXqp77nvFuq3RACTBsbYSuZpFDozLs8IP+urALDVfdgealYq
         85U3U0QEEhSJrsEZGf8IQIWlYKD9a1cV8VJqPbbNlD0Sc5ALq7w3eryA5rUdf2/W98cA
         cfOaHkgIivOSn+WPyErmQjyL6gv5X9CLHMlugrXfMA7P5/JscRnBEuOfr9y4puE1UsTq
         D8qVql3g6/ZFKsC7RzAQwWGdBz3Wd8BVDPKSo7DX+HNMu+3chKEhvaiP3DSGDNQznAQc
         zADg==
X-Forwarded-Encrypted: i=1; AJvYcCUj1kExdRBOSbO3cM7yGvHl9F887HMx+Z2blUKHJbLQsHsV5gZsJ7REo7cRACI3f/BZ6zMO3o7bmDI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNjPXud87VE1gJKvuW5AJpi67i72e7FCpDi/iYMgAMekhNgw9Z
	RxGqDOLp4G7MQUK4ZOKYcRBAX26kxUnPuZmhIcWpJssiPYqRJFzPoIhfYAY/wpU=
X-Gm-Gg: ASbGncvejDVocfmnxPGIT12Ao3n4kz3wTxqq6Pp1SbhUBq274Q+JqxGH2KapmUnd6cV
	85QkivHePNi+8ggaWq0lIOi8idijU1AtXwRnN0EARHxloOSxO6Tu4fN0aeZiE9eXKNmkurqaMr8
	wGJbxuC+v5akKJbUOfhFu/jWeHakJYcX39v9KqFjYSCIXn4+YozD9QsITvSGWCixgaCPtBSzLIF
	gKKe9iy003pbulLqLr96V260qkOj9534C28C7Qv9T4ymK9bXkPoq/C3mAxWXoRQVylSIVwSFykR
	MqrqKpz5Qvut2k5uMaaKicibZvACA6yzc01MPg0ch9+cEIbWJUTVUVo=
X-Google-Smtp-Source: AGHT+IF6Lc8c/5boqEjjMTgGXndnKw1ERrd1Lt6+hMDMke76cRIdzL/qGVz/BlZZ/tCE1Lkdr6yVmw==
X-Received: by 2002:a05:600c:1d0c:b0:42f:7e87:3438 with SMTP id 5b1f17b1804b1-439248c229bmr140937685e9.0.1739226189343;
        Mon, 10 Feb 2025 14:23:09 -0800 (PST)
Message-ID: <55f44ab1-25ed-4756-8621-162e02471fda@citrix.com>
Date: Mon, 10 Feb 2025 22:23:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20? 1/4] ARM32/traps: Fix
 do_trap_undefined_instruction()'s detection of kernel text
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250208000256.431883-1-andrew.cooper3@citrix.com>
 <20250208000256.431883-2-andrew.cooper3@citrix.com>
 <34c2dc12-eb49-4c16-97b5-166b889822a2@xen.org>
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
In-Reply-To: <34c2dc12-eb49-4c16-97b5-166b889822a2@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/02/2025 9:23 pm, Julien Grall wrote:
> Hi Andrew,
>
> On 08/02/2025 00:02, Andrew Cooper wrote:
>> While fixing some common/arch boundaries for UBSAN support on other
>> architectures, the following debugging patch:
>>
>>    diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>    index c1f2d1b89d43..58d1d048d339 100644
>>    --- a/xen/arch/arm/setup.c
>>    +++ b/xen/arch/arm/setup.c
>>    @@ -504,6 +504,8 @@ void asmlinkage __init start_xen(unsigned long
>> fdt_paddr)
>>
>>         system_state = SYS_STATE_active;
>>
>>    +    dump_execution_state();
>>    +
>>         for_each_domain( d )
>>             domain_unpause_by_systemcontroller(d);
>>
>> fails with:
>>
>>    (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to
>> switch input)
>>    (XEN) CPU0: Unexpected Trap: Undefined Instruction
>>    (XEN) ----[ Xen-4.20-rc  arm32  debug=n  Not tainted ]----
>>    (XEN) CPU:    0
>>    <snip>
>>    (XEN)
>>    (XEN) ****************************************
>>    (XEN) Panic on CPU 0:
>>    (XEN) CPU0: Unexpected Trap: Undefined Instruction
>>    (XEN) ****************************************
>>
>> This is because the condition for init text is wrong.  While there's
>> nothing
>> interesting from that point onwards in start_xen(), it's also wrong
>> for any
>> livepatch which brings in an adjusted BUG_FRAME().
>>
>> Use is_active_kernel_text() which is the correct test for this
>> purpose, and is
>> aware of init and livepatch regions too.
>>
>> Commit c8d4b6304a5e ("xen/arm: add support for
>> run_in_exception_handler()"),
>> made run_in_exception_handler() work, but didn't complete the TODO
>> left in
>> commit 3e802c6ca1fb ("xen/arm: Correctly support WARN_ON").  Do so,
>> to make
>> ARM consistent with other architectures.
>
> This was done on purpose. If you look at the current implementation of
> run_in_exception_handler(), it will clobber some registers.
>
> With your patch #2, the function should only clobber one. It is a bit
> better, but it still not great. So I think we need to stick with
> WARN() on Arm (+ maybe a comment explaning why it is implemented
> differently).

I'm sorry but I don't follow.

run_in_exception_handler() only uses 1 register (after patch 2), but
it's fully described to the invoking context, so nothing is clobbered
from the compilers point of view.

Are you concerned about losing r0/x0 in the resulting trace?

I can certainly split the patch in half.  The
do_trap_undefined_instruction() change isn't related, although the
second hunk is needed for patch 3 to consolidate dump_execution_state()
across architectures.

~Andrew

