Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A27D0A18196
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 17:00:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875512.1285957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taGfs-0007dt-2X; Tue, 21 Jan 2025 16:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875512.1285957; Tue, 21 Jan 2025 16:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taGfr-0007bn-VE; Tue, 21 Jan 2025 16:00:19 +0000
Received: by outflank-mailman (input) for mailman id 875512;
 Tue, 21 Jan 2025 16:00:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQWO=UN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1taGfq-0007Ym-KB
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 16:00:18 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd8404ae-d810-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 17:00:15 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso41011895e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 08:00:15 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3278f06sm13798367f8f.70.2025.01.21.08.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 08:00:14 -0800 (PST)
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
X-Inumbo-ID: cd8404ae-d810-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737475214; x=1738080014; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=06ttZ+7H3gBYv4ATiGOvO1zrwnLepB8AqgnXNCXx4Lg=;
        b=P5jn1yY67UvBJBq0/76SQBUip/cmF+7/yulCoAyuzXjB387xwgWN8m3MWtJ9yivTEJ
         KAsmEPHcXIayX+tn43QVDGFzL8m3mSNFiBFRCcyaiMlMfA3gm3AqNiYuzJDPkzmrhBBr
         unYFVrzhPVOrvsA3pPQo5Ci3hK692t1PQttZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737475214; x=1738080014;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06ttZ+7H3gBYv4ATiGOvO1zrwnLepB8AqgnXNCXx4Lg=;
        b=MDSSmy6sAGRZaQyWGN/LPROlJm8mBZoM1bQN7+GgJ3TwWAKpPAIj/L82ULO4LFG1qL
         oygs0dPtkdFdgLK8LHOkcOG3pYFQajdwBtbNVbBNLAlRmqUNipEXiOMweRboHFdM+XwE
         og0wC6imYEwNaUFbvPkRJQYp5qhd9/CRipKdDpUTUUypYgphi3kGzi2r3wjE1wHwZik5
         kTt7qAuL20HhEHMyybwim2AUSVnAuZZBjtCIet8mUz4clqcCweOv4GOKubf7TZTzsPF3
         XpdIrQJ8U5bUcdg+qyH5/vktMwxX4AoOvzrW9XM0O0UTu2s6CNuHfbcL0XUkvYYqrPGf
         ng4A==
X-Forwarded-Encrypted: i=1; AJvYcCX2gGl3Egsek0cldBds71Pt2nt92jnS5KieW8ibQlCRkRtOPCALQ1aiILo33ZV0u/YH1N4oJhSfHi8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypMm57k51xe4MPgwLrjf2SqUKU8Rv64Qazd8FBsOdhWMkX/1+e
	UQA5mKIRbuVID85L2jAUgl75YI4pNNvWYwDAMIKuvm2WNvj7/ve9qyIKoBLZNH0=
X-Gm-Gg: ASbGncstnqZWtKU9lyEYvuZ/iEPAaW36apObjk5NHiNc4bRUvaU9h8UZi8kDdPQpwJ5
	HaNb11mdcWDW8rOaa+yQVSeeuLtdiYPBR79A8zIlut36ieFDYu2JCz2GRTi5IWCUM7wNA9uul2V
	+jwYUiUex5MB4qQApC120uoMOeUUet8TNCd25184Kai0uAlaMBKLFrzQSir/UkuoyRwTKaTSqjS
	ydD1Fm/+B33Kmk1WzKPfnMfP4yPm58vB1pAjm32Js7xhuBYbdHIkAumWlP35lM7B5ilMx2ZO/SD
	5P5NVSfMnTfAembnTIrlXucbDSQ6yUAp6Q==
X-Google-Smtp-Source: AGHT+IGnRwftRQsynKWeKoCMkaN6QpepNctWssTFe3BfWf1ikj8/+KyesEjed0/FsD2FQDLMiY1a8g==
X-Received: by 2002:a05:600c:5486:b0:436:51bb:7a52 with SMTP id 5b1f17b1804b1-438913c9c93mr169542795e9.7.1737475214593;
        Tue, 21 Jan 2025 08:00:14 -0800 (PST)
Message-ID: <9d7a1ee2-e7cc-497e-899a-028d739a1b7a@citrix.com>
Date: Tue, 21 Jan 2025 16:00:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/intel: Fix PERF_GLOBAL fixup when
 virtualised
To: Jan Beulich <jbeulich@suse.com>
Cc: Jonathan Katz <jonathan.katz@aptar.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250121142510.358996-1-andrew.cooper3@citrix.com>
 <2b36d54d-88fb-4ad4-b0e4-cfa837872b14@suse.com>
 <ae54889d-ae82-4df3-a35f-ea09f3972eec@citrix.com>
 <445f93d3-626e-40ca-9acd-db3af83be1e5@suse.com>
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
In-Reply-To: <445f93d3-626e-40ca-9acd-db3af83be1e5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/01/2025 3:58 pm, Jan Beulich wrote:
> On 21.01.2025 16:23, Andrew Cooper wrote:
>> On 21/01/2025 3:03 pm, Jan Beulich wrote:
>>> On 21.01.2025 15:25, Andrew Cooper wrote:
>>>> +         !(val & MSR_IA32_MISC_ENABLE_PERF_AVAIL) )
>>>> +        return;
>>>> +
>>>> +    eax = cpuid_eax(10);
>>>> +    ver = eax & 0xff;
>>>> +    nr_cnt = (eax >> 8) & 0xff;
>>>> +
>>>> +    if ( ver && nr_cnt > 1 && nr_cnt <= 32 )
>>>> +    {
>>>> +        unsigned int cnt_mask = (1UL << nr_cnt) - 1;
>>>> +
>>>> +        /*
>>>> +         * On (some?) Sapphire/Emerald Rapids platforms each package-BSP
>>>> +         * starts with all the enable bits for the general-purpose PMCs
>>>> +         * cleared.  Adjust so counters can be enabled from EVNTSEL.
>>>> +         */
>>>> +        rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, val);
>>>> +
>>>> +        if ( (val & cnt_mask) != cnt_mask )
>>>> +        {
>>>> +            printk("FIRMWARE BUG: CPU%u invalid PERF_GLOBAL_CTRL: %#"PRIx64" adjusting to %#"PRIx64"\n",
>>>> +                   smp_processor_id(), val, val | cnt_mask);
>>>> +            wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, val | cnt_mask);
>>>> +        }
>>>> +    }
>>>> +
>>>> +    __set_bit(X86_FEATURE_ARCH_PERFMON, c->x86_capability);
>>> This moved, without the description suggesting the move is intentional.
>>> It did live at the end of the earlier scope before, ...
>> Final paragraph of the commit message?
>>
>> If PERF_AVAIL is clear, we don't have ARCH_PERFMON, whatever the CPUID
>> leaves say.
> Hmm, the final paragraph in the posting that I got in my inbox was:
>
> "This also limits setting X86_FEATURE_ARCH_PERFMON, although oprofile (the only
>  consumer of this flag) cross-checks too."
>
> Which says quite the opposite: You now set the bit in more cases, i.e.
> when nr_cnt is out of range or when ver is zero.

Oh, right.  Yeah, that was unintentional.  I'll adjust.

~Andrew

