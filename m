Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D78ADA6BEF4
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 17:01:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924254.1327544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tveof-00014r-Cc; Fri, 21 Mar 2025 16:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924254.1327544; Fri, 21 Mar 2025 16:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tveof-000128-9k; Fri, 21 Mar 2025 16:01:49 +0000
Received: by outflank-mailman (input) for mailman id 924254;
 Fri, 21 Mar 2025 16:01:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tcq=WI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tveoe-000122-7z
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 16:01:48 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cac5146a-066d-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 17:01:47 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39727fe912cso837395f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 09:01:47 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f995423sm2684464f8f.20.2025.03.21.09.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 09:01:45 -0700 (PDT)
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
X-Inumbo-ID: cac5146a-066d-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742572907; x=1743177707; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cysste13bfccSTnoc0kpZHpSKLeW95jO3mqyfHCpIS8=;
        b=jk+75KDYxGZelIrCQJcMof5bVtJNTmO9iXn3qyFa2wzoY5EK6VAP14Hhh5bnp85O2s
         zh79zr91nLaO3jqZxtxKtu5+6PlNKiLfaggTF0W6yD9QLx9nLSSv7Pqj/ovH1QJyvZMk
         wqI+XPVxvvFm4NExF2NKtd/kFvY5/EnYzf4X8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572907; x=1743177707;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cysste13bfccSTnoc0kpZHpSKLeW95jO3mqyfHCpIS8=;
        b=rx8fKez1PLKuPY7szVsXNvBzGsHp+VqNxAHi3eTBcFxdrUCeWsGnJEBLkFhbdimlYp
         naNs+ak/yLhNELNbVX/jx/+eaxdZQ8P9s9CZSx2FU1+fG3531eGOI49ice6r/zvabyiS
         ues5v6x9MVqcE5Dj4XNXXHaNTMtf1zkbz2Vth5Lcx5jh4Y0E8nTalSqmPgJnUiMfxl/q
         JIgatduFSujCvHil2xuMmo7hnHJ2+x+qcOm8o4aq5vAfwxh42hIXbVzV7rSu0vblHoi9
         O489x+mlf9lay1l8j0r76HS2uPM9UCQzpWPxUqSMJLvr9Qku+HEsvl69SetVU4X6axBD
         SdeQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/ODbBnfdS/V2cpSQD8/QM4I0oCCnTAOsKHZF2zo+8XX0oLgBLL77xgvKJOnx1PuGMpv96AlefzeY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy17BwJ5e7nt80uEtORlXHz20XwH1VjKjSO4Ebq0YeWrsumj7xR
	jWxB6A1qn2t3K+1xjJ54fhoIUSV4pAbqPeLkhqPwdUs49TF1tuVJf0Qf5rtJe6T0nNOSQ7dFQnc
	r
X-Gm-Gg: ASbGnct3NIsfLb0Vweh7RDq50LtvQc08ehWRiPDYycSeJQrZjdXRZAvm8/MFmQCUqnK
	/pX1s0pFV7SbofteGdekuqw0ZSbj+F3lHBDaNTI25tR1tI86h85hIMv/7ZZEc6s2DRC1tCM+sPO
	GoNiTtmC1uun2B+nvgKuk50gvTkAFy+oVrvKIH+TsLJQJ4k3Vx+cxcXDDQ6KeU3c/AWAOC6sfoN
	RTU127KmTdOCMjpC2j0ZoEatsb8yy14BOZ9IxWoIhmO7v2p3prZsoU1x4VKcXSRYQv1Zq930s+8
	DuH9ukqwAE6Mz4W89ZpYTrG1uW0o6mzx1mexDqG/oUNIbLejsZoBAWmwJlOJ8JUIPyfQhRLtwPR
	0DIoAX04tJA==
X-Google-Smtp-Source: AGHT+IEmx39GD6Xel0I+OOsZHaLeKTzjt6unvx8EW4gA6ruw+Ac+y2kgC1Ft+8pO/u57C0e0GLObkA==
X-Received: by 2002:a5d:64e3:0:b0:391:3f64:ed00 with SMTP id ffacd0b85a97d-3997f903a7fmr3358235f8f.26.1742572906408;
        Fri, 21 Mar 2025 09:01:46 -0700 (PDT)
Message-ID: <9385c155-eb01-4247-8bf5-6e0758f79749@citrix.com>
Date: Fri, 21 Mar 2025 16:01:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] x86/domctl: Stop using XLAT_cpu_user_regs()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
 <20250311211043.3629696-6-andrew.cooper3@citrix.com>
 <703471bf-d5e7-4f97-b17e-61dffdcb828d@suse.com>
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
In-Reply-To: <703471bf-d5e7-4f97-b17e-61dffdcb828d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/03/2025 11:38 am, Jan Beulich wrote:
> On 11.03.2025 22:10, Andrew Cooper wrote:
>> In order to support FRED, we're going to have to remove the {ds..gs} fields
>> from struct cpu_user_regs, meaning that it is going to have to become a
>> different type to the structure embedded in vcpu_guest_context_u.
>>
>> In both arch_{get,set}_info_guest(), expand the memcpy()/XLAT_cpu_user_regs()
>> to copy the fields individually.  This will allow us to eventually make them
>> different types.
>>
>> No practical change.  The compat cases are identical, while the non-compat
>> cases no longer copy _pad fields.
> That's fine for "set", but potentially not for "get": Someone simply doing
> memcmp() on two pieces of output might then break.

It's not a fastpath, and I'm not looking to not break things, but I was
expecting it to be safe.

The pad fields for cs (inc saved_upcall_mask) and ss get lost on the
first exit-from-guest, and the pad fields for the data segment get lost
on the first schedule.

So while there is a change here, I don't think it's anything that
current code could plausibly be relying on.

Furthermore, when we get rid of the vm86 fields, we don't even store the
pad fields anywhere in Xen, so they're going, one way or another, by the
end of the series.

Finally, disaggregation or not, this is an unstable interface so we do
have some wiggle room.

I guess I should discuss this more in the commit message?

>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Should we really be copying error_code/entry_vector?  They're already listed
>> as explicitly private fields, and I don't think anything good can come of
>> providing/consuming them.
> I don't see a reason why we'd need to copy them in arch_set_info_guest();
> arch_set_info_hvm_guest() doesn't copy them either. For
> arch_get_info_guest() it's less clear - toolstack components may have
> grown a dependency on them (e.g. introspection?), so I'd err on the side
> of retaining prior behavior. (Of course there's then the corner case of
> someone calling "get" right after "set", expecting the two fields to come
> back unchanged.)

Introspection doesn't use this interface.  Regs are sent in the ring,
and don't contain these fields either.

Also, for HVM guests, we set the vmexit rsp to &error_code so we only
push the GPRs, without the IRET frame above it.

These fields, (inc saved_upcall_mask) have different behaviours under
FRED.  I don't think we can get away without them changing, and for
these at least, they were clearly marked as internal.

>
>> @@ -1204,7 +1223,26 @@ int arch_set_info_guest(
>>  #ifdef CONFIG_COMPAT
>>      else
>>      {
>> -        XLAT_cpu_user_regs(&v->arch.user_regs, &c.cmp->user_regs);
>> +        v->arch.user_regs.ebx               = c.cmp->user_regs.ebx;
>> +        v->arch.user_regs.ecx               = c.cmp->user_regs.ecx;
>> +        v->arch.user_regs.edx               = c.cmp->user_regs.edx;
>> +        v->arch.user_regs.esi               = c.cmp->user_regs.esi;
>> +        v->arch.user_regs.edi               = c.cmp->user_regs.edi;
>> +        v->arch.user_regs.ebp               = c.cmp->user_regs.ebp;
>> +        v->arch.user_regs.eax               = c.cmp->user_regs.eax;
>> +        v->arch.user_regs.error_code        = c.cmp->user_regs.error_code;
>> +        v->arch.user_regs.entry_vector      = c.cmp->user_regs.entry_vector;
>> +        v->arch.user_regs.eip               = c.cmp->user_regs.eip;
>> +        v->arch.user_regs.cs                = c.cmp->user_regs.cs;
>> +        v->arch.user_regs.saved_upcall_mask = c.cmp->user_regs.saved_upcall_mask;
>> +        v->arch.user_regs.eflags            = c.cmp->user_regs.eflags;
>> +        v->arch.user_regs.esp               = c.cmp->user_regs.esp;
>> +        v->arch.user_regs.ss                = c.cmp->user_regs.ss;
>> +        v->arch.user_regs.es                = c.cmp->user_regs.es;
>> +        v->arch.user_regs.ds                = c.cmp->user_regs.ds;
>> +        v->arch.user_regs.fs                = c.cmp->user_regs.fs;
>> +        v->arch.user_regs.gs                = c.cmp->user_regs.gs;
> Just to mention it (there's no change in behavior here afaict): Us writing
> only half of the register fields looks like a latent (but perhaps only
> theoretical) problem to me. A dis-aggregated toolstack may set 64-bit PV
> context, then toggle address size, then set 32-bit context. That'll leave
> the high halves of respective fields non-zero. I didn't check whether any
> badness could result from that, as for the time being
> XEN_DOMCTL_set_address_size isn't marked dis-aggregation-safe, and hence
> this at least isn't of immediate concern.

Hmm, gnarly.  The naive way to do 64-bit set, toggle, 32-bit set doesn't
work, because set of either bitness involves:

    cr3_page = get_page_from_mfn(cr3_mfn, d);

while toggle requires no memory in the domain, owing to the different
typeref rules.

But, because the hypercall isn't atomic, you can make a 64-bit set which
intentionally fails later (e.g. bad vm_assist setting), at which point
the switch will work too.

Breaking the switch vs no-memory limitation has been on my wishlist
(probably never going to happen), to break the a-priori dependency which
prevents pvgrub64 from booting a 32bit guest, which in turn is the major
reason why pygrub is still the incumbent.

Stale high bits will be lost when we schedule the vCPU, because of how
RESTORE_ALL currently works, although I still intend to switch to plain
pop's because that is a fastpath.


Either way, I think it would be prudent to zero v->arch.user_regs in a
prep patch and backport that.

~Andrew

