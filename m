Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98481A2FCAE
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 23:10:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885006.1294769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thbz5-0002LC-3t; Mon, 10 Feb 2025 22:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885006.1294769; Mon, 10 Feb 2025 22:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thbz4-0002I6-Vj; Mon, 10 Feb 2025 22:10:30 +0000
Received: by outflank-mailman (input) for mailman id 885006;
 Mon, 10 Feb 2025 22:10:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wHzs=VB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1thbz2-0002Hr-RV
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 22:10:28 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5705649-e7fb-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 23:10:27 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so48684355e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 14:10:27 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dfd8448sm158665005e9.38.2025.02.10.14.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:10:26 -0800 (PST)
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
X-Inumbo-ID: d5705649-e7fb-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739225427; x=1739830227; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lCmXPP/SRDMorkAy5nlfgjxuqK5K8X0YKMp2DhtqBoE=;
        b=cIjsGiPbIMkdeQECHHIzLWkQTvWoMv9PSiGBGa/uwkZblxDPtEHSBKZn7rI2tXvk9F
         JYQVJV60oBWyqBs3+mQ24fPyxFMFEVZC9TiX19zocDFk0CmE1S2sNhPyRtu316pJ/d30
         I+kSgNwQZHHVb1XPop3GPTkWI16BiStuS20wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225427; x=1739830227;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCmXPP/SRDMorkAy5nlfgjxuqK5K8X0YKMp2DhtqBoE=;
        b=ZMx6rlzltU8S3faUtt9zOafiu9CrAA+P710UAVteHEr3U0ZWXPi3XCETSpNo0HPFGO
         noOK7x22UI5uqft1ay1IjOClH2o0OYFRXmPjnip8L3AyHl0DZbvH8FFXu4ebzYppKpe+
         Wk/sahkPne6/DcBUl6x2M1u8WokhQNMrPzHaTzVXN61IfaQLGWep/RDo6piqnDoJiYYp
         HIAAPB7Evec3fbZjVLSQp2MGh5aXcrMoUrPM3g21HLa4H3XNMI5MfV7ztYxspcUgJx4F
         q93p1B9OEn/HSEk/iGDahc5PF+1v1/UeHAieQFFk6k+MTAKkvbcSjqpmTsgGn6rzg3eb
         2mhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc6qlBvzS66HidHRwwcUI3jm/K/Y5YgHqXhMAHfAVf9en7bHvATjE4fgyiw5e5ODHCpFWoZvb7Yg4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoZd+zj6UcDwgn5hw8TG5amR9hL8ijezmvZ5XlSUbjdamVKoP/
	74eFEey7Om+B93cmHmnkRN8J1SjcGK3MEDM/p8qA5ablpIUy5yunsa0KSfcxDro=
X-Gm-Gg: ASbGncu0bYbv1RZervzrITeIl2iJsL9wchGdzSltsJH8N1xqUDt1nBIAX1jhcxKoQd5
	WN7cKkPgISYNmbtDWCIe+rzuNelqGdLmYH/pw0OgknMEmU3t7QHvE/gI3r5YgXhzuq6WIgE0Tg1
	yubickUYZCrhclws8CLQRnwXjR4sIpULdLILSZT8o9SyELEMlJQvtNrqJ70pZGsYnpqms/ESt6a
	aQgsuZ9ZHj7mXd74rEl8cgpvkcHiM6fEG5vOfiBOgjNIyZr+It36Q52iPu/CXsaOx/OOCxDrUIP
	0dARg8EDvWrXZDNLAre3EXOCQwDNX2vg3lTdY8kT+cdElJW+kii/4SQ=
X-Google-Smtp-Source: AGHT+IHqLxiEAxNJ3UreZRwS2XiPKHB/0xwaWxU4DH17EPfUuBqt4OsawBMLZMPmGs0KpmZTLgktDQ==
X-Received: by 2002:a05:600c:1f85:b0:436:30e4:459b with SMTP id 5b1f17b1804b1-4392499962dmr134942205e9.18.1739225427142;
        Mon, 10 Feb 2025 14:10:27 -0800 (PST)
Message-ID: <b1f9fdd5-0d5c-4a01-be9c-0ace72d07d9b@citrix.com>
Date: Mon, 10 Feb 2025 22:10:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM: Fix register constraints in
 run_in_exception_handler()
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250208000256.431883-1-andrew.cooper3@citrix.com>
 <20250208000256.431883-3-andrew.cooper3@citrix.com>
 <e46af210-4e99-4324-aaae-d531e88c4792@xen.org>
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
In-Reply-To: <e46af210-4e99-4324-aaae-d531e88c4792@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/02/2025 9:29 pm, Julien Grall wrote:
> Hi,
>
> On 08/02/2025 00:02, Andrew Cooper wrote:
>> Right now, run_in_exception_handler() takes an input in an arbitrary
>> register,
>> and clobbers BUG_FN_REG.  This causes the compiler to calculate fn in
>> the
>> wrong regsiter.
>
> Just to confirm, you mean, the compiler is not clever enough to notice
> that the value should be in the register BUG_FN_REG and therefore, two
> registers will be clobbered. Is that correct?

Not quite.

The clobbered register set is always disjoint from inputs and outputs,
so the combination of one clobbered + one input always means two
different registers.

For "here's an input but it gets modified", you need to express that as
an output into a variable which isn't subsequently used.

For ARM, that is best spelt "+r" (foo) so it can also be used with
register asm() to tie to a single register.  On x86, you can use "=a"
(tmp) : "a" (input).  In principle you can do it with named parameters,
so [fn] "=r" (tmp) : "[fn]" (input) I believe works too.

Here is a contrived example https://godbolt.org/z/WjqTKjWWb showing how
the output (discard only) is forced into r0, causing the compiler to
copy a into r3 around the asm block.  Notice that GCC and Clang pick the
input operand differently, as both r0 and r3 are valid candidates in
this case.


However, for run_in_exception_handler(), "fn" isn't even modified
(AFAICT), so it's correct to describe it as an input only.

~Andrew

