Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B66E1C739F3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 12:07:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166846.1493267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2Va-0000vU-Cb; Thu, 20 Nov 2025 11:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166846.1493267; Thu, 20 Nov 2025 11:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2Va-0000su-9a; Thu, 20 Nov 2025 11:07:26 +0000
Received: by outflank-mailman (input) for mailman id 1166846;
 Thu, 20 Nov 2025 11:07:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DpbD=54=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vM2VY-0000so-F0
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 11:07:24 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1495b693-c601-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 12:07:19 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so7634775e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 03:07:19 -0800 (PST)
Received: from [192.168.1.37] (host-92-29-237-183.as13285.net. [92.29.237.183])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477b831421fsm41120655e9.10.2025.11.20.03.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 03:07:18 -0800 (PST)
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
X-Inumbo-ID: 1495b693-c601-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1763636839; x=1764241639; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lrxvUVj9niTrIJioOd4eIi6MRCKVkUy5Zw3irL6v5CU=;
        b=UzB1WY8XRjzQYv1Aee+N//BNOvVIRbQDkVwJRCJDr8aSHFn3UbKwC98xx0795PW2GV
         IMgHv3qmKveoIfJ842ho+KPlDQVNWxLgSBv+0GZLvkAQXVaOcBffmrcUmwNrOcd8HN78
         lgzKR8PjCL+8raiyvEsGkvzru/Lsi96/9mABk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763636839; x=1764241639;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrxvUVj9niTrIJioOd4eIi6MRCKVkUy5Zw3irL6v5CU=;
        b=Scdlb94YE3/+q6yj6SlO4nQYAFBajqi1T7h3JKpfPJR/dBL1FVTNtInkJeH31sFAnK
         EkgCw1FyPqjMrUYQgqK8KeIO/VvkfWiBctanv3h0XD81ZdrgeJjqnn+Zer2MfuNY9d3c
         uYhjj71GRkgDHFVYbd8920dEz9SbgXs8PvzuItkZT1IOFPHCCSJbNEXIb6jLdhm37fAk
         LtVuRPHZE2+Y7bmnKrHXZdFQGXmK5XArSrlqmqu64ln2MiXQ7Vd2wneoUDotcj8fIpO9
         wXdzK7gQUfNoSXIyK0RK6q/6bbcX6wsELO+tNERG0exmkm/Ym+zrEBLICy85/9sKgf8N
         X2OA==
X-Forwarded-Encrypted: i=1; AJvYcCV+pYF7HLSkbLUKuFxLOv9bcwPPOAc6sJ6cRiEeqjk3aPWX/VAUNsRDgKIX6SCLDHOw+IGd7GcETzU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnNigP+XDpBKApenKalTovoCHibinnnzYc5GC5kBYZBkZ+GR+W
	/Z1YHGMHG0hxjnSp6gZPQ8zzTztsGohmIyeW56PM4zvN2HVJA3XxGUnFRm6hYi3ikY0=
X-Gm-Gg: ASbGncs+zDOnLDYWfqB0dKMj9eR61ZtCvanT96Y/TZppkcEmdLoG+geb75hX38Og/97
	HI+cn412aSiqHvh29piHKFuJz2o/Gy5xY8ttIkE97a88KgD1vgzTOwGWVOC/wmj15Ln0+ox04oB
	KpjUPci7vAxWiRtgDjrWLFMhckQsGVsg1jMc4OBAmRkr8TZ8O15ZsGEQUp8E2RBfKdjNcVNGB40
	4W5iCbJyjslQxDbJcKgHtvYw3t6Ip6HQuSAHsMpvWYxOE6PjlkDze60N0prsO+trTMlnuI6oV4O
	w2uq/VtLll982mYbbzEhT3/Fsp34zN0sYBoUbguTQWArTeqEC1Q+jbbZXE6FmUg+qRcGNvwGScI
	5wtFMXB4cmbZsG7B+DOvUa1xGzXgRi7zFzNylhnm9oZv/Ts6TEk060T4/bCTUd/+3KHSfiM4Lhp
	3RkZ/MM4HZLiiJi1f1Awz8D6RbAuE2+pkjQznCn2z0f3AbQGyardRXl8PhGVkDVAA=
X-Google-Smtp-Source: AGHT+IG0hTQNsl2MA39Acg+tZyVXMu6rU+mNuvxCRPbKZ7xt/xOJRS353f03F8YnQdKMWAQsuWr7ng==
X-Received: by 2002:a05:600c:1994:b0:477:7b16:5f80 with SMTP id 5b1f17b1804b1-477b8a50f4fmr28452155e9.10.1763636838568;
        Thu, 20 Nov 2025 03:07:18 -0800 (PST)
Message-ID: <4a266547-b058-49c0-8c45-7a80f8ada3b7@citrix.com>
Date: Thu, 20 Nov 2025 11:07:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/guest: move allocation of Xen upcall vector to
 init code
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
 <5ccf9000-9847-40de-838e-cb181633b098@suse.com>
 <943e462f-d948-4f72-8d4c-626febca5b32@citrix.com>
Content-Language: en-GB
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
In-Reply-To: <943e462f-d948-4f72-8d4c-626febca5b32@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/11/2025 11:01 am, Andrew Cooper wrote:
> On 19/11/2025 10:50 am, Jan Beulich wrote:
>> There's no need to do this every time init_evtchn() is called. Just do it
>> once when setting up CPU0. Drop the assertion as well, as
>> alloc_hipriority_vector() (called by alloc_direct_apic_vector()) uses more
>> restrictive BUG_ON() anyway. Then evtchn_upcall_vector can also validly
>> become ro-after-init, just that it needs to move out of init_evtchn().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/guest/xen/xen.c
>> +++ b/xen/arch/x86/guest/xen/xen.c
>> @@ -233,16 +233,12 @@ static void cf_check xen_evtchn_upcall(v
>>      ack_APIC_irq();
>>  }
>>  
>> +static uint8_t __ro_after_init evtchn_upcall_vector;
>> +
>>  static int init_evtchn(void)
>>  {
>> -    static uint8_t evtchn_upcall_vector;
>>      int rc;
>>  
>> -    if ( !evtchn_upcall_vector )
>> -        alloc_direct_apic_vector(&evtchn_upcall_vector, xen_evtchn_upcall);
>> -
>> -    ASSERT(evtchn_upcall_vector);
>> -
>>      rc = xen_hypercall_set_evtchn_upcall_vector(this_cpu(vcpu_id),
>>                                                  evtchn_upcall_vector);
>>      if ( rc )
>> @@ -293,6 +289,8 @@ static void __init cf_check setup(void)
>>                 XEN_LEGACY_MAX_VCPUS);
>>      }
>>  
>> +    alloc_direct_apic_vector(&evtchn_upcall_vector, xen_evtchn_upcall);
>> +
>>      BUG_ON(init_evtchn());
>>  }
>>  
>>
> This patch is fine, but it would be nicer to split init_evtchn() into
> bsp_init_evtchn() and percpu_init_evtchn().
>
> Just out of context in init_evtchn(), there's a check for CPU0 that also
> ought to move into bsp_init_evtchn() (and therefore into __init), at
> which point the percpu simplifies to a single hypercall, and we keep
> subsystem specifics out of setup().

No, scratch that.  HVM_PARAM_CALLBACK_IRQ is not in the list of HVM
Params that migration moves on migrate (see write_hvm_params() in
xg_sr_save_x86_hvm.c).

Everything is awful.

Could you include a comment such as /* HVM_PARAM_CALLBACK_IRQ is not
moved on migrate, so has to be set up again on resume. */ to make it
clear why that piece of logic needs to stay in a non-init function?

~Andrew

