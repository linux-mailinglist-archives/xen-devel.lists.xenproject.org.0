Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4B8A64BA3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 12:05:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916558.1321632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu8H6-0006Xc-TI; Mon, 17 Mar 2025 11:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916558.1321632; Mon, 17 Mar 2025 11:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu8H6-0006Vr-Q5; Mon, 17 Mar 2025 11:04:52 +0000
Received: by outflank-mailman (input) for mailman id 916558;
 Mon, 17 Mar 2025 11:04:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kom6=WE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tu8H4-0006Vj-QA
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 11:04:50 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2a1370f-031f-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 12:04:45 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so11346725e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 04:04:45 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffc450esm101972845e9.23.2025.03.17.04.04.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 04:04:44 -0700 (PDT)
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
X-Inumbo-ID: a2a1370f-031f-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742209485; x=1742814285; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SQwlq/YobTs6xwcnrqveeu1Vqu0zCkODslHW8FYCego=;
        b=Fi1iRy5C88T2QX0jwcvpghAJUckYADBwrn2QD+L+PwBvh1qInLI8OgbcxwFjbOO25Q
         XG0ICevNv7uvuXqij94iLPQ+//0vKGywqot8/xOhkTdvooy6WuR60K1LnrBb1Yw0d9Fx
         gVsON+JC1X3O3muyN+rBKs2Z8Ut/mSGbTrBOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742209485; x=1742814285;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQwlq/YobTs6xwcnrqveeu1Vqu0zCkODslHW8FYCego=;
        b=VjBLwNsolyBuWto+zcIAIUDa3RJ+gDNREvoncxSyN0tEp0iMxRpUXe/bAX2EALd+jb
         tLD+XHf4F6RV9jULr113e1R2ycyTHw0Z/fWBDsLwvHycfd0/LkN3POSEmcC1qC6xX86Q
         JqdGIqMAsLxCdXJPw9Uatb6jKA6n4nA5TX97A0LOrinwljnT3c0+B92iiXWfpGygF+z7
         0ccL7BqCxI0Q28/Hd3NHekdlplKzClcD6/8PHqHLnECoMqz7e0oQ2Cwh4+Nvq3Pcf83o
         9KDKqgx7lygv+U56F4+X80gylkxzGB9WgKRa3MyA3RZXWQ9IwFS86tEuGTGdy86/hcc+
         JB8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVl+NvYZmI0aheb3+WrOPmLSRsAgjA8h9s8hgAc+opSaVS5ZzyU3ZG0bGdXzov9M/TsWPoQGImI7XM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxErMQVkPAYZLqo0GTwyTcynBZfKE1pMH7vhr0jfF8WAQhEI4Yq
	rBmVi4oWoydxR8AOgj5JDg4FMu/8WM9TO1swCu2DgZAZV2liNGqwA7f9OSPMIB8=
X-Gm-Gg: ASbGncvHGfJi7f/S082c8NYV2+kvb3ayQK74xkAF+WG2wj+zx3TjceUrzKDMWFq9iUL
	UCKWBwKcRnmD8wUJ/1AMB3HbVAJjCtDByZYfuUh2PhR2opkjdXxZC2eMieBkjBpDyJ9ddcozs/y
	rvMQ0N2rUSHPQJNx/nc8tYk0vi6jkyUqpa0cScj6uTiJrbJWxpMwE9dcyGXyLeauggDD3LM/D1/
	xGJcathG2RNHdUYGLg7j3I+Qy482FS1Vg34/yCO9SAys7kLHQ2tIz0/IaIlmWzkXDSgbWaPtwKD
	ghXAQDS8/4/0pbx/mg5fn8WyjHVlvcuHDLl1443GVE6JvWNknGTM3ERq1oSOZmhi0hc0Mqsyi4w
	8XO/DfP4dEebJx456axY=
X-Google-Smtp-Source: AGHT+IHA54ne1mNEG5LoDoOvo6i2RaGrl55CME2npus2npn9IQ/Zqi+DF9pPiwgC+v82h08UJMLN1Q==
X-Received: by 2002:a05:6000:1867:b0:391:ab2:9e80 with SMTP id ffacd0b85a97d-3971dae8e5emr14291842f8f.24.1742209485126;
        Mon, 17 Mar 2025 04:04:45 -0700 (PDT)
Message-ID: <7066054c-1a8f-438d-893a-dfb7df644643@citrix.com>
Date: Mon, 17 Mar 2025 11:04:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] x86/traps: Avoid OoB accesses to print the data
 selectors
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
 <20250311211043.3629696-4-andrew.cooper3@citrix.com>
 <b031442c-ae27-430f-8fd4-12d15ad5a164@suse.com>
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
In-Reply-To: <b031442c-ae27-430f-8fd4-12d15ad5a164@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/03/2025 11:00 am, Jan Beulich wrote:
> On 11.03.2025 22:10, Andrew Cooper wrote:
>> _show_registers() prints the data selectors from struct cpu_user_regs, but
>> these fields are sometimes out-of-bounds.  See commit 6065a05adf15
>> ("x86/traps: 'Fix' safety of read_registers() in #DF path").
>>
>> There are 3 callers of _show_registers():
>>
>>  1. vcpu_show_registers(), which always operates on a scheduled-out vCPU,
>>     where v->arch.user_regs (or aux_regs on the stack) is always in-bounds.
>>
>>  2. show_registers() where regs is always an on-stack frame.  regs is copied
>>     into a local variable first (which is an OoB read for constructs such as
>>     WARN()), before being modified (so no OoB write).
>>
>>  3. do_double_fault(), where regs is adjacent to the stack guard page, and
>>     written into directly.  This is an out of bounds read and write, with a
>>     bodge to avoid the writes hitting the guard page.
>>
>> Include the data segment selectors in struct extra_state, and use those fields
>> instead of the fields in regs.  This resolves the OoB write on the #DF path.
>>
>> Resolve the OoB read in show_registers() by doing a partial memcpy() rather
>> than full structure copy.  This is temporary until we've finished untangling
>> the vm86 fields fully.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
>> @@ -124,17 +128,23 @@ static void _show_registers(
>>             state->fsb, state->gsb, state->gss);
>>      printk("ds: %04x   es: %04x   fs: %04x   gs: %04x   "
>>             "ss: %04x   cs: %04x\n",
>> -           regs->ds, regs->es, regs->fs,
>> -           regs->gs, regs->ss, regs->cs);
>> +           state->ds, state->es, state->fs,
>> +           state->gs, regs->ss, regs->cs);
>>  }
>>  
>>  void show_registers(const struct cpu_user_regs *regs)
>>  {
>> -    struct cpu_user_regs fault_regs = *regs;
>> +    struct cpu_user_regs fault_regs;
>>      struct extra_state fault_state;
>>      enum context context;
>>      struct vcpu *v = system_state >= SYS_STATE_smp_boot ? current : NULL;
>>  
>> +    /*
>> +     * Don't read beyond the end of the hardware frame.  It is out of bounds
>> +     * for WARN()/etc.
>> +     */
>> +    memcpy(&fault_regs, regs, offsetof(struct cpu_user_regs, es));
> I don't like this (especially the assumption on es being special, much like
> e.g. get_stack_bottom() also does) very much, but I hope this is going to
> disappear at some point anyway.

As noted, it's temporary, and goes away in patch 8.

~Andrew

