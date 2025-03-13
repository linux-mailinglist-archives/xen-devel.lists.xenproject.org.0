Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3320CA601A6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 20:55:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913445.1319485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsoe8-000688-0f; Thu, 13 Mar 2025 19:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913445.1319485; Thu, 13 Mar 2025 19:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsoe7-00065F-U0; Thu, 13 Mar 2025 19:55:11 +0000
Received: by outflank-mailman (input) for mailman id 913445;
 Thu, 13 Mar 2025 19:55:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsoe6-000659-IE
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 19:55:10 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0efb2391-0045-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 20:55:05 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so12175015e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 12:55:05 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a27sm3162440f8f.31.2025.03.13.12.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 12:55:04 -0700 (PDT)
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
X-Inumbo-ID: 0efb2391-0045-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741895705; x=1742500505; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a44fw/F2HGwdq2h81Ek/Ls18K/R8p8oxMCM7kSCc0a8=;
        b=up5EUtXDRyVD6ueoWjsAasSJOX6V2qE175ycMGFgaDZ2nG9Cx/rtcWN2htQPjaeOOx
         qdByrtR3pkFk85f5zH/xufyb6apw33uCFIxO5uNHKeN9C9yS+Sy34yaARBLbKN+WAnl+
         Wl4VOgLY2AVOqF8gPO+jub21c02QJDXzuyQps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741895705; x=1742500505;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a44fw/F2HGwdq2h81Ek/Ls18K/R8p8oxMCM7kSCc0a8=;
        b=sg35mrxOo/ukQBZilsb4s6f7iHaaQulmfb/PPBf6UfM99eZrdPihCQSGPYoczXfjmP
         3w2qrD5GibN3KUo22W64uN4tjuPmiS9igZXKgr5hj1VgOktxlU7J7USHnz72QkuSRL9E
         AqIGrFsiLGYjbUgMOrvVFmaLyg31qGBfBYrT++dtFWgQsld3Yoq+SWrv9Gb2yL1Woj9w
         IflVvwxjNfUiPMxTO3hMDcGXl+tQKST0l0R+i3ufut6n7ac6ATww3s8MCQADFCe3WY1Q
         njQoWJC/jk9pjwoESqikXWFU+qO5dld/qyYmAj0zBKBrImz1mFsrxv3rmOH++deHCfQB
         /jsA==
X-Forwarded-Encrypted: i=1; AJvYcCVwGIQ3pT4va+brcAvSUQN+8F/fZ+s5s+qoKJxOW27sySO8i+7wDGQ/1xBdLYgraqzZULWfpX3fsmw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxG04I1CSFEEgx+pU6T/YVNnGozc3Iqr2azsHvCANsDaymQPYYr
	yj8D5u5aFSuyzlh0fQJOOL4idEbm3wYbRW1b17k3XYOH0IFjwvtdiiURzuNRrOg=
X-Gm-Gg: ASbGncuk8I/gY/cwH1rx1ajbmrlTu9e/92dwGFxnDB4AlxPJCQDBgCYFPyALnVKRFBi
	vIbTQrp8scdfT/UbocYF8vXrW6na+m4fTjMnrOeB1T3W6Ty7FzCUNUZnD4UxnbkfnayMijf92F1
	apwAsQuSg1UXBpz0fq5r2GSci0RrmZq1uhjq8j/POgZiAPFsKcw2+A3s8Nsu+L2jkW8gCdMSgzv
	5XXhBgaUMmNEdCtDS7aAiwfJ1KR76VWQ6P2ZmVzFBx3gBpz4PNBrShT19JwhBsq5Auj+J81aItT
	Pc8voSENpPcUmwe8V+75G7AL3+J+I8nmMrwroRfr7zSLqrQ7OFs6MpmLKxnds50t5oIJYDITqtI
	EQOuh4coYJN3i7GjkxO4=
X-Google-Smtp-Source: AGHT+IFxgMgi+l/baY85TO8T73vTaDfVfxpdu3fVcV/jdl7EL+ak9pxFRAHeA87zCxkSVDbkicCLsg==
X-Received: by 2002:a05:600c:3584:b0:43c:f597:d582 with SMTP id 5b1f17b1804b1-43d1d87dae6mr8672435e9.1.1741895704752;
        Thu, 13 Mar 2025 12:55:04 -0700 (PDT)
Message-ID: <3589afd0-3087-4817-9523-e52c7d9d8b1c@citrix.com>
Date: Thu, 13 Mar 2025 19:55:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] xen/common: Split tlb-clock.h out of mm.h
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
 <20250312174513.4075066-5-andrew.cooper3@citrix.com>
 <6d910ac4-cf1d-48ee-b088-17254d2272ab@suse.com>
 <89fbb5ac-242a-4271-96ad-ea1bc8f77691@citrix.com>
 <8d8cdb19fc6eabc05329ad0e16da4d1a@bugseng.com>
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
In-Reply-To: <8d8cdb19fc6eabc05329ad0e16da4d1a@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 7:43 pm, Nicola Vetrini wrote:
> On 2025-03-13 14:35, Andrew Cooper wrote:
>> On 13/03/2025 12:59 pm, Jan Beulich wrote:
>>> On 12.03.2025 18:45, Andrew Cooper wrote:
>>>> xen/mm.h includes asm/tlbflush.h almost at the end, which creates a
>>>> horrible
>>>> tangle.  This is in order to provide two common files with an
>>>> abstraction over
>>>> the x86-specific TLB clock logic.
>>>>
>>>> First, introduce CONFIG_HAS_TLB_CLOCK, selected by x86 only.  Next,
>>>> introduce
>>>> xen/tlb-clock.h, providing empty stubs, and include this into
>>>> memory.c and
>>>> page_alloc.c
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>>> CC: Michal Orzel <michal.orzel@amd.com>
>>>> CC: Jan Beulich <jbeulich@suse.com>
>>>> CC: Julien Grall <julien@xen.org>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
>>>>
>>>> There is still a mess here with the common vs x86 split, but it's
>>>> better
>>>> contained than before.
>>>> ---
>>>>  xen/arch/x86/Kconfig        |  1 +
>>>>  xen/common/Kconfig          |  3 +++
>>>>  xen/common/memory.c         |  1 +
>>>>  xen/common/page_alloc.c     |  1 +
>>>>  xen/include/xen/mm.h        | 27 --------------------
>>>>  xen/include/xen/tlb-clock.h | 49
>>>> +++++++++++++++++++++++++++++++++++++
>>>>  6 files changed, 55 insertions(+), 27 deletions(-)
>>>>  create mode 100644 xen/include/xen/tlb-clock.h
>>>>
>
>
>>> However, see below.
>>>
>>>> +        arch_flush_tlb_mask(&mask);
>>>> +    }
>>>> +}
>>>> +
>>>> +#else /* !CONFIG_HAS_TLB_CLOCK */
>>>> +
>>>> +struct page_info;
>>>> +static inline void accumulate_tlbflush(
>>>> +    bool *need_tlbflush, const struct page_info *page,
>>>> +    uint32_t *tlbflush_timestamp) {}
>>>> +static inline void filtered_flush_tlb_mask(uint32_t
>>>> tlbflush_timestamp) {}
>>> Is doing nothing here correct?
>>
>> Yeah, it's not, but this only occurred to me after sending the series.
>>
>> Interestingly, CI is green across the board for ARM, which suggests to
>> me that this logic isn't getting a workout.
>>
>>>  mark_page_free() can set a page's
>>> ->u.free.need_tlbflush. And with that flag set the full
>>>
>>> static inline void accumulate_tlbflush(
>>>     bool *need_tlbflush, const struct page_info *page,
>>>     uint32_t *tlbflush_timestamp)
>>> {
>>>     if ( page->u.free.need_tlbflush &&
>>>          page->tlbflush_timestamp <= tlbflush_current_time() &&
>>>          (!*need_tlbflush ||
>>>           page->tlbflush_timestamp > *tlbflush_timestamp) )
>>>     {
>>>         *need_tlbflush = true;
>>>         *tlbflush_timestamp = page->tlbflush_timestamp;
>>>     }
>>> }
>>>
>>> reduces to (considering that tlbflush_current_time() resolves to
>>> constant 0,
>>> which also implies every page's ->tlbflush_timestamp is only ever 0)
>>>
>>> static inline void accumulate_tlbflush(
>>>     bool *need_tlbflush, const struct page_info *page,
>>>     uint32_t *tlbflush_timestamp)
>>> {
>>>     if ( !*need_tlbflush )
>>>         *need_tlbflush = true;
>>> }
>>>
>>> which means a not-stubbed-out filtered_flush_tlb_mask(), with
>>> tlbflush_filter()
>>> doing nothing, would actually invoke arch_flush_tlb_mask() (with all
>>> online CPUs
>>> set in the mask) when called. And arch_flush_tlb_mask() isn't a
>>> no-op on Arm.
>>
>> Yes.  Sadly, fixing this (without Eclair complaining in the middle of
>> the series) isn't as easy as I'd hoped.
>>
>
> Hi Andrew,
>
> I didn't quite follow the whole thread (been busy the last couple of
> days), but could you explain briefly what's the issue here? Just a
> link to a failing pipeline should be fine as well.

There isn't one.

But to untangle this the easy way, I'd need to have a duplicate
declaration for arch_flush_tlb_mask() for a patch of two.

Which I know Eclair would complain about, and therefore I need to find a
different way to untangle it.

~Andrew

