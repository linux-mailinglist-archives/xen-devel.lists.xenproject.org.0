Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0973AF7EDD
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 19:30:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032332.1405989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXNkt-0008S5-Gi; Thu, 03 Jul 2025 17:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032332.1405989; Thu, 03 Jul 2025 17:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXNkt-0008QB-E3; Thu, 03 Jul 2025 17:29:51 +0000
Received: by outflank-mailman (input) for mailman id 1032332;
 Thu, 03 Jul 2025 17:29:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJsU=ZQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uXNks-0008Q5-3E
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 17:29:50 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f347e66-5833-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 19:29:44 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4538bc1cffdso848775e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 10:29:44 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b188d8e6sm3110885e9.36.2025.07.03.10.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 10:29:43 -0700 (PDT)
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
X-Inumbo-ID: 4f347e66-5833-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751563784; x=1752168584; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GhJSHM9/rfzQPiNx6WqMm2HaQJt5q1BbNt0Y2empTy8=;
        b=IEaxFYM/mz62efvE1ZNvvltSZGDKbzO5bRDja40ZwWZ+dFKgWzzkqJeqrlfPc5fl0H
         e4z5mbtLp6AJji2G2dQnVFp7nZeThK/EhmI0AB0ht1zrr+HKC0wJqV1TrItFCU2A3/eq
         Ny4f+pnNptgj2EKobwzqmxdFgkFvoZAz4ZO9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751563784; x=1752168584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhJSHM9/rfzQPiNx6WqMm2HaQJt5q1BbNt0Y2empTy8=;
        b=Tj3olwjm3Yl9uo2ADoQCyjxApK9fL9OgJs4AESr+276QsdLlUECF5iVCbWuBJbJdxJ
         e91yCiRi2OiOkbTjG8R6MVNZotq5DoV0rOUdNnyz+/BgzOFGiBsDgZT0fxlmR5Le/B6I
         /LfmScX8qctMrh3t+hAT6y/YbSoXV04Fckql9f+LC3daXs6NeIhXVQC7L6WlvnF6U66B
         so7YnmJcpeSaSC91KD1KFjxi/LagOFRfBIKztsZzNOA4bi46V2JT4Zr3DCnX5L5tq45B
         7OFufi6rAokJq/HvzYMlQKArYzqPTG1G0Xbt3DmaUkGkdhOL2feNLXu8tBXsl1STxSZ9
         Wy9g==
X-Forwarded-Encrypted: i=1; AJvYcCUV2JUN1AutKGTV/MTlkG2AbwCZijT+YoV3dE0mpYBUtC7v2qGi4iQrsy1GG+60Gt8bACE64UeansQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxa1/tADzDLLQ3Vj8q4lwECDc61YXF2Prtwwmqiki8k25GT/K2V
	NHb3EuY0ziZ9isXBEBmsMkgVFDVG6ZPojluLPjPWkkQTBO12I76wz2AlPyCR447/ndY=
X-Gm-Gg: ASbGnctx79XObu7990KG6UCE+T96V5krHoK377qynNvpWNy+/E5BkFwbxTkP7jITUh/
	puRnTFG0osqiYOjZmVVgPE5XKJLhEPjn4xhf+N6O3xJ8n8btxWDheR3Js/zJGUdkcplgAaHFS12
	bTAwG3rHn/CSsCpOKQRtcm7hhOP0hlIRLo3Fbge6gxnTwRqW12rw9WW9j8GqtYiBUnO9ab6HYlN
	qky8DEzpp2GXEu/NHS2C5mO/7jICX8WNSY3ivVAdJQAloUNHFIpDoLSS53ktxj5g/zerc5bdy0k
	Gzomx+TRCb9NowggtakOazaXIEP9Vg9suucO9B9XMr7Yl/Lw6TAwGvxvsqK0LGL+oFc6g3Khh8A
	9VDzoYvHCLnuU2s28b78Jc7ucz4c=
X-Google-Smtp-Source: AGHT+IHwsTFsVE+IUkopnf6eePMmJX0E6lGMdBpkDdXKYPr2rj+TrDOJOU4ptow5EH6z4DUW86j8ew==
X-Received: by 2002:a05:600c:8b33:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-454a3b33b8bmr82985765e9.15.1751563783859;
        Thu, 03 Jul 2025 10:29:43 -0700 (PDT)
Message-ID: <f1517b77-de88-44ed-a659-614ad2fb8217@citrix.com>
Date: Thu, 3 Jul 2025 18:29:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] x86/idle: Implement a new MWAIT IPI-elision algorithm
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-5-andrew.cooper3@citrix.com>
 <0309f4d6-fa2a-4be3-a313-d6b4ebe362a2@suse.com>
 <947761f1-d474-421b-ac39-6926d8fdde56@citrix.com>
 <fa38e755-8796-4ba1-9f41-07382f3f62b6@suse.com>
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
In-Reply-To: <fa38e755-8796-4ba1-9f41-07382f3f62b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/07/2025 3:07 pm, Jan Beulich wrote:
> On 03.07.2025 13:59, Andrew Cooper wrote:
>> On 03/07/2025 10:01 am, Jan Beulich wrote:
>>> On 02.07.2025 16:41, Andrew Cooper wrote:
>>>> @@ -452,6 +466,10 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
>>>>          mwait(eax, ecx);
>>>>          spec_ctrl_exit_idle(info);
>>>>      }
>>>> +
>>>> +    alternative_io("movb $0, %[in_mwait]",
>>>> +                   "", X86_BUG_MONITOR,
>>>> +                   [in_mwait] "=m" (stat->in_mwait));
>>> This doesn't strictly need to be an alternative, does it? We can save a
>>> memory write in the buggy case, but that likely makes at most a marginal
>>> difference.
>> It doesn't *need* to be an alternative.  It could be:
>>
>> if ( !cpu_bug_monitor )
>>     ACCESS_ONCE(stat->in_mwait) = true;
>>
>> but getting rid of the branch is an advantage too.
> That's the other alternative blob. What I mean that here it could simply
> be
>
>     ACCESS_ONCE(stat->in_mwait) = false;
>
> without any conditional.

It could.  Or it could be consistent with it's other half.

>
>>>> --- a/xen/arch/x86/include/asm/hardirq.h
>>>> +++ b/xen/arch/x86/include/asm/hardirq.h
>>>> @@ -5,7 +5,19 @@
>>>>  #include <xen/types.h>
>>>>  
>>>>  typedef struct {
>>>> -    unsigned int __softirq_pending;
>>>> +    /*
>>>> +     * The layout is important.  Any CPU can set bits in __softirq_pending,
>>>> +     * but in_mwait is a status bit owned by the CPU.  softirq_mwait_raw must
>>>> +     * cover both, and must be in a single cacheline.
>>>> +     */
>>>> +    union {
>>>> +        struct {
>>>> +            unsigned int __softirq_pending;
>>>> +            bool in_mwait;
>>>> +        };
>>>> +        uint64_t softirq_mwait_raw;
>>>> +    };
>>> To guard against someone changing e.g. __softirq_pending to unsigned long
>>> while ignoring the comment, how about adding a BUILD_BUG_ON() checking both
>>> parts of the union are the same size (which of course would require naming
>>> either the union field within the containing struct or its struct member)?
>> That turns out to be very hard because of the definition of
>> softirq_pending() being common.  More below.
> Hmm, yes, I see. Then maybe
>
>     BUILD_BUG_ON(offsetof(irq_cpustat_t, in_mwait) +
>                    sizeof(irq_stat[0].in_mwait) >
>                  offsetof(irq_cpustat_t, softirq_mwait_raw) +
>                    sizeof(irq_stat[0].softirq_mwait_raw));
>
> (or something substantially similar using e.g. typeof())?
>
>>>> @@ -9,4 +11,36 @@
>>>>  #define HVM_DPCI_SOFTIRQ       (NR_COMMON_SOFTIRQS + 4)
>>>>  #define NR_ARCH_SOFTIRQS       5
>>>>  
>>>> +/*
>>>> + * Ensure softirq @nr is pending on @cpu.  Return true if an IPI can be
>>>> + * skipped, false if the IPI cannot be skipped.
>>>> + *
>>>> + * We use a CMPXCHG covering both __softirq_pending and in_mwait, in order to
>>>> + * set softirq @nr while also observing in_mwait in a race-free way.
>>>> + */
>>>> +static always_inline bool arch_pend_softirq(unsigned int nr, unsigned int cpu)
>>>> +{
>>>> +    uint64_t *ptr = &irq_stat[cpu].softirq_mwait_raw;
>>>> +    uint64_t old, new;
>>>> +    unsigned int softirq = 1U << nr;
>>>> +
>>>> +    old = ACCESS_ONCE(*ptr);
>>>> +
>>>> +    do {
>>>> +        if ( old & softirq )
>>>> +            /* Softirq already pending, nothing to do. */
>>>> +            return true;
>>>> +
>>>> +        new = old | softirq;
>>>> +
>>>> +    } while ( (old = cmpxchg(ptr, old, new)) != new );
>>> Don't you mean
>>>
>>>     } while ( (new = cmpxchg(ptr, old, new)) != old );
>>>
>>> here
>> No. I'm pretty sure I don't.
>>
>>> (with new latched ahead of the loop and old set from new inside it),
>>> like we have it elsewhere when we avoid the use of yet another variable,
>>> e.g. in inc_linear_{entries,uses}()?
>> Eww, no.  Having new and old backwards like that is borderline
>> obfucation, and is unnecessary cognitive complexity for the reader.
> Why backwards? You want to compare the (original) value read against the
> expected old value. The way you wrote it you'll do at least one extra
> loop iteration, as you wait for the fetched (original) value to equal
> "new".

Hmm, yes, that's not quite what I intended, but I'm also not happy
writing anything of the form "new = cmpxchg()".  It's plain wrong for
the semantics of cmpxchg.

~Andrew

