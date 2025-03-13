Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDD1A5F60A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 14:35:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912182.1318506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsiih-0006TP-RY; Thu, 13 Mar 2025 13:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912182.1318506; Thu, 13 Mar 2025 13:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsiih-0006RC-Os; Thu, 13 Mar 2025 13:35:31 +0000
Received: by outflank-mailman (input) for mailman id 912182;
 Thu, 13 Mar 2025 13:35:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsiig-0006R4-L9
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 13:35:30 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01485605-0010-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 14:35:19 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so12992455e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 06:35:19 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d188bb59esm20966135e9.21.2025.03.13.06.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 06:35:18 -0700 (PDT)
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
X-Inumbo-ID: 01485605-0010-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741872918; x=1742477718; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wVir1xz7wFLlKnunh51uqRXAYZzapdZY+mfLlQtgaTg=;
        b=IPJDgADaOawkqz3EOvB0O2ozWRoA8ccG2tFzT3gjLdrTaYgqc1JiyGeAABqcmxhW9i
         l4oUQz9BSWmaJh2pNHiBByN/N04R58ZDJkddyxrNQkYwPmOA6SvnGWwMOp9dC0ffEIsa
         FoRxREoQ4DtbtPNiHyVoq4i8RGy7u9AbPCKDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741872918; x=1742477718;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVir1xz7wFLlKnunh51uqRXAYZzapdZY+mfLlQtgaTg=;
        b=BBnFEu/RQnysptoiBwnNhxYBd+enaZlVNyAFucf8utllzZRTKEQIn1MwNodTgG6nP8
         SfPmrmkNnQg5KZySi/FKF/Lve5L/1ZJs+xVOMDVduyGaM9VGff6hGT3WuZni0cov2Kx3
         PHG9vGHqo2ZIEDIDreR79DLZavh3lzxEDINlJFCiOjHoz6l6uA6YiADEm0vLTaJ6Jcrb
         4w3cAKBD1NLTLhM04yqu+uv/wza1tE/ENE4Oyqhafh+RCcmvfIXvPV9az87bt/AuO1RX
         wRNbzrKqNu4bn5V5WDkIJVDSbjkDs9Qe4+7g2hivuh8k7XZQ81S4AqYwaC/cuPwYLRqu
         0Mow==
X-Forwarded-Encrypted: i=1; AJvYcCU/JY9Q1SwpQPsSH9C6TEUSdxyUlMAddXl69xOVcjWp9DDheetY5lTwilg79LgLsINNjH4M8YhDxC4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytJmugoTNOQCWkXfePotpp+zkICqsmkKI4gyTr8FXiXwnc1MY6
	ISnQFDSxA1q/OMjjnRlh9oCDd/X7spWaq0nByxHexatbjjDqMSI4xEV/qoyAqJo=
X-Gm-Gg: ASbGncvI3yANEeTgYdH4+F5UwW6cuw9i9ZNadGoD1EoQ5HHr8uzBV9utqo0FOZHJOX7
	3xUNzrIebSCFSeRB2cYqX24EJLUyPqjQ35uNxzpXc8fWry3R9tL4jBc1Mrm/CVa/CN6mz2xSrFQ
	wRNPlXyfyIbDq4PQ0OwFjnBAa2FR7GB5ynje/30Nh1ZXCpkE55UiNlLtBCQkT6O1ro6VHRDzv7i
	r5KTevbJOzg2CN/PoxekU7IT0oYAQ3qNrzVqJCNMjEPoUQBD8NI9Zvl6yl7V/ZH7UqPeZ+HrzFx
	XYL5SIRALLzHXMYbwlvbl00Xe+MJdwZsfgfgKVVJuwL/ASNtIjYU21I2mOQI7/AbVLOA0Iff+Ou
	FpoJLHF+3
X-Google-Smtp-Source: AGHT+IHzsYEqqkUlLMfw9fC4wtS+eI4zn3lqBO1ovTL1Qj7CI+qamcnZQij2qYXhOJYF8G5x0qd6aA==
X-Received: by 2002:a05:6000:1869:b0:38d:df15:2770 with SMTP id ffacd0b85a97d-395b4231bacmr2213796f8f.0.1741872918479;
        Thu, 13 Mar 2025 06:35:18 -0700 (PDT)
Message-ID: <89fbb5ac-242a-4271-96ad-ea1bc8f77691@citrix.com>
Date: Thu, 13 Mar 2025 13:35:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] xen/common: Split tlb-clock.h out of mm.h
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
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
In-Reply-To: <6d910ac4-cf1d-48ee-b088-17254d2272ab@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 12:59 pm, Jan Beulich wrote:
> On 12.03.2025 18:45, Andrew Cooper wrote:
>> xen/mm.h includes asm/tlbflush.h almost at the end, which creates a horrible
>> tangle.  This is in order to provide two common files with an abstraction over
>> the x86-specific TLB clock logic.
>>
>> First, introduce CONFIG_HAS_TLB_CLOCK, selected by x86 only.  Next, introduce
>> xen/tlb-clock.h, providing empty stubs, and include this into memory.c and
>> page_alloc.c
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
>>
>> There is still a mess here with the common vs x86 split, but it's better
>> contained than before.
>> ---
>>  xen/arch/x86/Kconfig        |  1 +
>>  xen/common/Kconfig          |  3 +++
>>  xen/common/memory.c         |  1 +
>>  xen/common/page_alloc.c     |  1 +
>>  xen/include/xen/mm.h        | 27 --------------------
>>  xen/include/xen/tlb-clock.h | 49 +++++++++++++++++++++++++++++++++++++
>>  6 files changed, 55 insertions(+), 27 deletions(-)
>>  create mode 100644 xen/include/xen/tlb-clock.h
>>
>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
>> index 6e41bc0fb435..e9a166ee3dd0 100644
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -28,6 +28,7 @@ config X86
>>  	select HAS_PCI_MSI
>>  	select HAS_PIRQ
>>  	select HAS_SCHED_GRANULARITY
>> +	select HAS_TLB_CLOCK
>>  	select HAS_UBSAN
>>  	select HAS_VMAP
>>  	select HAS_VPCI if HVM
>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
>> index 6166327f4d14..dcf7d9d00d0a 100644
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -83,6 +83,9 @@ config HAS_PMAP
>>  config HAS_SCHED_GRANULARITY
>>  	bool
>>  
>> +config HAS_TLB_CLOCK
>> +	bool
>> +
>>  config HAS_UBSAN
>>  	bool
>>  
>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>> index 61a94b23abae..9138fd096696 100644
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -24,6 +24,7 @@
>>  #include <xen/perfc.h>
>>  #include <xen/sched.h>
>>  #include <xen/sections.h>
>> +#include <xen/tlb-clock.h>
>>  #include <xen/trace.h>
>>  
>>  #include <asm/current.h>
>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
>> index bc029ea797a2..b90c3d7988b4 100644
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -137,6 +137,7 @@
>>  #include <xen/sections.h>
>>  #include <xen/softirq.h>
>>  #include <xen/spinlock.h>
>> +#include <xen/tlb-clock.h>
>>  #include <xen/vm_event.h>
>>  #include <xen/xvmalloc.h>
>>  
>> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
>> index 45000cc3f64b..fff36ff903d6 100644
>> --- a/xen/include/xen/mm.h
>> +++ b/xen/include/xen/mm.h
>> @@ -588,33 +588,6 @@ unsigned long get_upper_mfn_bound(void);
>>  
>>  #include <asm/flushtlb.h>
>>  
>> -static inline void accumulate_tlbflush(bool *need_tlbflush,
>> -                                       const struct page_info *page,
>> -                                       uint32_t *tlbflush_timestamp)
>> -{
>> -    if ( page->u.free.need_tlbflush &&
>> -         page->tlbflush_timestamp <= tlbflush_current_time() &&
>> -         (!*need_tlbflush ||
>> -          page->tlbflush_timestamp > *tlbflush_timestamp) )
>> -    {
>> -        *need_tlbflush = true;
>> -        *tlbflush_timestamp = page->tlbflush_timestamp;
>> -    }
>> -}
>> -
>> -static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp)
>> -{
>> -    cpumask_t mask;
>> -
>> -    cpumask_copy(&mask, &cpu_online_map);
>> -    tlbflush_filter(&mask, tlbflush_timestamp);
>> -    if ( !cpumask_empty(&mask) )
>> -    {
>> -        perfc_incr(need_flush_tlb_flush);
>> -        arch_flush_tlb_mask(&mask);
>> -    }
>> -}
>> -
>>  enum XENSHARE_flags {
>>      SHARE_rw,
>>      SHARE_ro,
>> diff --git a/xen/include/xen/tlb-clock.h b/xen/include/xen/tlb-clock.h
>> new file mode 100644
>> index 000000000000..796c0be7fbef
>> --- /dev/null
>> +++ b/xen/include/xen/tlb-clock.h
>> @@ -0,0 +1,49 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef XEN_TLB_CLOCK_H
>> +#define XEN_TLB_CLOCK_H
>> +
>> +#include <xen/types.h>
>> +
>> +#ifdef CONFIG_HAS_TLB_CLOCK
>> +
>> +#include <xen/mm.h>
>> +
>> +#include <asm/flushtlb.h>
>> +
>> +static inline void accumulate_tlbflush(
>> +    bool *need_tlbflush, const struct page_info *page,
>> +    uint32_t *tlbflush_timestamp)
>> +{
>> +    if ( page->u.free.need_tlbflush &&
>> +         page->tlbflush_timestamp <= tlbflush_current_time() &&
>> +         (!*need_tlbflush ||
>> +          page->tlbflush_timestamp > *tlbflush_timestamp) )
>> +    {
>> +        *need_tlbflush = true;
>> +        *tlbflush_timestamp = page->tlbflush_timestamp;
>> +    }
>> +}
>> +
>> +static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp)
>> +{
>> +    cpumask_t mask;
>> +
>> +    cpumask_copy(&mask, &cpu_online_map);
>> +    tlbflush_filter(&mask, tlbflush_timestamp);
>> +    if ( !cpumask_empty(&mask) )
>> +    {
>> +        perfc_incr(need_flush_tlb_flush);
> Would this perf counter then perhaps also want to become dependent upon
> HAS_TLB_CLOCK=y (or become an arch-specific one)? It's used elsewhere in x86,
> but not for any of the other arch-es.

There's nothing inherently x86-specific about our tlb-clk implementation.

I don't have time to do it, but if another arch wants to add support,
then it's probably just a case of shuffling some bits out of
asm/flushtlb.h into tlb-clock.h.

>
> However, see below.
>
>> +        arch_flush_tlb_mask(&mask);
>> +    }
>> +}
>> +
>> +#else /* !CONFIG_HAS_TLB_CLOCK */
>> +
>> +struct page_info;
>> +static inline void accumulate_tlbflush(
>> +    bool *need_tlbflush, const struct page_info *page,
>> +    uint32_t *tlbflush_timestamp) {}
>> +static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp) {}
> Is doing nothing here correct?

Yeah, it's not, but this only occurred to me after sending the series.

Interestingly, CI is green across the board for ARM, which suggests to
me that this logic isn't getting a workout.

>  mark_page_free() can set a page's
> ->u.free.need_tlbflush. And with that flag set the full
>
> static inline void accumulate_tlbflush(
>     bool *need_tlbflush, const struct page_info *page,
>     uint32_t *tlbflush_timestamp)
> {
>     if ( page->u.free.need_tlbflush &&
>          page->tlbflush_timestamp <= tlbflush_current_time() &&
>          (!*need_tlbflush ||
>           page->tlbflush_timestamp > *tlbflush_timestamp) )
>     {
>         *need_tlbflush = true;
>         *tlbflush_timestamp = page->tlbflush_timestamp;
>     }
> }
>
> reduces to (considering that tlbflush_current_time() resolves to constant 0,
> which also implies every page's ->tlbflush_timestamp is only ever 0)
>
> static inline void accumulate_tlbflush(
>     bool *need_tlbflush, const struct page_info *page,
>     uint32_t *tlbflush_timestamp)
> {
>     if ( !*need_tlbflush )
>         *need_tlbflush = true;
> }
>
> which means a not-stubbed-out filtered_flush_tlb_mask(), with tlbflush_filter()
> doing nothing, would actually invoke arch_flush_tlb_mask() (with all online CPUs
> set in the mask) when called. And arch_flush_tlb_mask() isn't a no-op on Arm.

Yes.  Sadly, fixing this (without Eclair complaining in the middle of
the series) isn't as easy as I'd hoped.

> I therefore think that while moving stuff into a separate header makes sense,
> HAS_TLB_CLOCK isn't overly useful to introduce.

It takes a cpumask_t off the stack, because we can pass cpu_online_mask
straight into arch_flush_tlb_mask(), and it removes a bitmap_copy that
the compiler can't optimise out.

~Andrew

