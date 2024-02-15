Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 813CA855CA2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 09:39:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681395.1060157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raXHV-0006Em-Iz; Thu, 15 Feb 2024 08:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681395.1060157; Thu, 15 Feb 2024 08:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raXHV-0006Bz-FL; Thu, 15 Feb 2024 08:39:45 +0000
Received: by outflank-mailman (input) for mailman id 681395;
 Thu, 15 Feb 2024 08:39:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raXHU-0006Bp-As
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 08:39:44 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3d007e2-cbdd-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 09:39:43 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33cf6266c76so354826f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 00:39:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i6-20020a5d5226000000b0033940016d6esm1027881wra.93.2024.02.15.00.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 00:39:42 -0800 (PST)
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
X-Inumbo-ID: c3d007e2-cbdd-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707986382; x=1708591182; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v1/Q95sj4WA2FF9J6ud+YMn0QgbGrf4qbedowJ2Con4=;
        b=gkVgqdQj1X/8DXitT5Z8cO3/UuDrtupO5SjNdlo7+tUJ9lHgZZ6JBPQyk5rUnzzmqU
         CjPkEMMDEFSexAMPF14+F2OUrpmWN/HLs9vb3Nfoeknt/FNlhmn1DLdZbyYpMEz+4Cnr
         hRuQJfqUCoiRHWMpkADm4zy6O2/idqbgtBlFmiv38LYnG27CLRZ4GHQLk/fDIMHkN3be
         lohh277K9Y10aOeA1PaMM0jPKJr/BxVQK0uK02HG71RqRK79o4YzUxn3ZqUakVJQuddL
         s0asBmRiKdKPdR/S6JrlD5+vNsPcur3qtv3dPry40mm4JGO+/BNmnbXP3bgGWyJ/JygY
         dXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707986382; x=1708591182;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1/Q95sj4WA2FF9J6ud+YMn0QgbGrf4qbedowJ2Con4=;
        b=tEYoVgHYcTrrE/K9FrQAKguRBEf/gEP9jPdrfvlSGt9Apjpf79dlzIfcfxPp0vMoV0
         GNavF2ML/dtJibPWAXcE6cAhb6LLzo0RW8b3qUqNOBxzCMO3ogvUGjLgWhmy2y56F+9k
         cvY11xYrX5syjqk2pagXNGGe6cHj7jhT8u34tcLRPGPrVmq+GPO3x6GRqP/sKOq0JIFY
         tWLW7Bgng1YMj3R+7zhlPceIbJk6KrblzAnMQMmvwDpCmGAxZcRy+we2wpFay+tcizD6
         QIbUoJf03u/u5CVdgz6S++pXZAvz4W3OWCQNAAt+UHDRXgJQ1zQRHzYklJc5elhXKYaq
         uaSA==
X-Forwarded-Encrypted: i=1; AJvYcCXVjL5VJt1Wnx0xeNEjHtrWzvUnjLAWOiCEx+sCf6rggqYv+tQNTMluna0GX1QusR6XIMsnE62QMcVmiwn9KgDbtR3Bq/YwjvfQx7ZpIf0=
X-Gm-Message-State: AOJu0YzMC+/LnEXCCmECYmMaQes+ivuPjuRbCPmXtz6osd72zpGJRvXz
	920/8cMPtP5xCvxHOAaEFePxEavi8p/sEyjVhs4YPt+2RnGtbgVdkojl2tl7VA==
X-Google-Smtp-Source: AGHT+IGOW30j0aeCwbqfiKfzN6D8QEHzDpFUPdT8rVTsOH6aSMYzYKa5RBJmGf69RzhMTCNx2EKkvw==
X-Received: by 2002:adf:fd43:0:b0:33c:efad:c6a2 with SMTP id h3-20020adffd43000000b0033cefadc6a2mr860687wrs.61.1707986382439;
        Thu, 15 Feb 2024 00:39:42 -0800 (PST)
Message-ID: <6dbb77a9-0a2d-4eb2-a484-d43d007e4182@suse.com>
Date: Thu, 15 Feb 2024 09:39:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] serial: fake IRQ-regs context in poll handlers
Content-Language: en-US
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
 <893be03d-22cc-4b8c-8a54-6479961c5aa2@suse.com>
 <b591cd2a-2b49-436e-9cf7-788d9064a778@xen.org>
 <4530606b-1b5e-47a4-aa41-e12e9178b06d@suse.com> <ZcrlcuNU9y8WymiK@mail-itl>
 <817ceec4-ed12-4360-a6ce-f87732f62251@suse.com> <ZcuCTnMpFib4ArHW@mail-itl>
 <b52fa3fa-4e33-4211-af18-f00aaa0b365b@suse.com> <ZcuGo_vQhiTAQep0@mail-itl>
 <23bcd506-f843-42f7-a541-0d8db7c319ab@suse.com> <Zc10vFQtG40isDHK@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <Zc10vFQtG40isDHK@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.02.2024 03:19, Marek Marczykowski wrote:
> On Tue, Feb 13, 2024 at 04:44:04PM +0100, Jan Beulich wrote:
>> On 13.02.2024 16:11, Marek Marczykowski wrote:
>>> On Tue, Feb 13, 2024 at 04:00:32PM +0100, Jan Beulich wrote:
>>>> On 13.02.2024 15:53, Marek Marczykowski wrote:
>>>>> Generally provides sensible output, for example during boot (it is using
>>>>> idle vCPU then, right?).
>>>>
>>>> Before Dom0 is started: Yes. With the exception of the phase where PV
>>>> Dom0's page tables are constructed, albeit in that time window
>>>> guest_cpu_user_regs() shouldn't yield sensible data either. I can only
>>>> say I'm surprised; since I have no way to properly test with an XHCI
>>>> debug port, I'd have to see about faking something to convince myself
>>>> (unless you were to supply example output).
>>>
>>> Would you like me to test this series with xhci console?
>>
>> The behavior shouldn't really be connected to this series. But yes, 'd'
>> debug key output (just the part for the CPU the key handling was
>> actually invoked from) with the xhci debug console would be of
>> interest, for the case where that CPU at that time runs an idle vCPU.
> 
> I managed to press 'd' before dom0 started. Full output at
> https://gist.github.com/marmarek/a495cd666f4aafed3a5cfcb8393f515b (it's
> Alder Lake, and smt=off, so CPU numbering is weird).
> Interestingly, I do _not_ see output for CPU0, where I'd expect the
> key handler to run... I see all the idle ones, plus one doing memory
> scrubbing.

Which is precisely the problem, just in not exactly the manifestation
I expected. In dump_execstate() we dump host state only if the
incoming regs don't indicate guest state. Yet for the idle vCPU they
(wrongly) do here - see how guest_mode() calculates the delta to what
guest_cpu_user_regs() returns, i.e. 0 when what guest_cpu_user_regs()
returned is passed in.

Guest state dumping is suppressed for idle vCPU-s. Hence no output
at all for the CPU where the key processing was actually invoked
from.

> But also, I don't see info about the handling CPU when doing `xl
> debug-key d`.

I'm afraid I'm confused, ...

> At one time, with `xl debug-key d` I got this:
> 
> (XEN) *** Dumping CPU6 guest state (d0v7): ***
> (XEN) ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:  M     ]----
> (XEN) CPU:    6
> (XEN) RIP:    e033:[<ffffffff81e1546a>]
> (XEN) RFLAGS: 0000000000000286   EM: 0   CONTEXT: pv guest (d0v7)
> (XEN) rax: 0000000000000023   rbx: 0000000000000005   rcx: ffffffff81e1546a
> (XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 000079147611e010
> (XEN) rbp: ffff88810db53200   rsp: ffffc90041c6bde0   r8:  0000000000000000
> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000286
> (XEN) r12: 0000000000305000   r13: 00007ffc61097f40   r14: ffff88810db53200
> (XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 0000000000b526e0
> (XEN) cr3: 00000004ae2a7000   cr2: 00000000006d3118
> (XEN) fsb: 0000791475b8a380   gsb: ffff8881897c0000   gss: 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e02b   cs: e033
> (XEN) Guest stack trace from rsp=ffffc90041c6bde0:
> (XEN)    0000000000000001 0000000000000000 ffffffffc02905a6 0000000000000023
> (XEN)    000079147611e010 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 8064129fc747f100 ffffffffc0291568 0000000000305000
> (XEN)    8064129fc747f100 0000000000000005 ffffffff813f7d4d ffffc90041c6bf58
> (XEN)    ffffc90041c6bf48 0000000000000000 0000000000000000 0000000000000000
> (XEN)    ffffffff81e16158 00000000006d3118 ffffc90041c6bf58 0000000000000040
> (XEN)    ffffffff8132f6bb 0000000000000006 ffffc90041c6bf58 00000000006d3118
> (XEN)    0000000000000255 ffff888102cf8880 ffff888102cf88f0 ffffffff8108746f
> (XEN)    0000000000000000 0000000000000002 ffffc90041c6bf58 ffffc90041c6bf58
> (XEN)    00000000006d3118 0000000000000000 0000000000000006 0000000000000000
> (XEN)    0000000000000000 ffffffff81e1a975 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 ffffffff8200009b 000000000043d9b0
> (XEN)    000000000043d990 00007ffc61097f90 00007ffc61097fc0 00007ffc61099d16
> (XEN)    00000000006cab40 0000000000000246 0000000000000001 0000000000000000
> (XEN)    0000000000000006 ffffffffffffffda 0000791475f1ed6f 00007ffc61097f40
> (XEN)    0000000000305000 0000000000000005 0000000000000010 0000791475f1ed6f
> (XEN)    0000000000000033 0000000000000246 00007ffc61097ed0 000000000000002b
> (XEN)     Fault while accessing guest memory.
> (XEN) 
> (XEN) *** Dumping CPU0 host state: ***
> (XEN) ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:  M     ]----
> (XEN) CPU:    0
> (XEN) RIP:    e008:[<ffff82d04022c07e>] _spin_unlock_irqrestore+0x21/0x27
> (XEN) RFLAGS: 0000000000000206   CONTEXT: hypervisor
> (XEN) rax: ffff82d0405c1038   rbx: 0000000000000200   rcx: 0000000000000008
> (XEN) rdx: ffff830856d07fff   rsi: ffff8308529d5b28   rdi: ffff8308529d5b20
> (XEN) rbp: ffff830856d07dc8   rsp: ffff830856d07dc0   r8:  0000000000000001
> (XEN) r9:  ffff8308529d5b20   r10: ffff82d0405c13a0   r11: 000000d091e62221
> (XEN) r12: ffff82d040476898   r13: 0000000000000296   r14: ffff82d040476918
> (XEN) r15: ffff82cffff04700   cr0: 0000000080050033   cr4: 0000000000b526e0
> (XEN) cr3: 000000082e7ff000   cr2: ffff888109538618
> (XEN) fsb: 0000000000000000   gsb: ffff888189600000   gss: 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> (XEN) Xen code around <ffff82d04022c07e> (_spin_unlock_irqrestore+0x21/0x27):
> (XEN)  fd ff ff 48 09 1c 24 9d <48> 8b 5d f8 c9 c3 0f b7 47 04 66 25 ff 0f 66 3d
> (XEN) Xen stack trace from rsp=ffff830856d07dc0:
> (XEN)    ffff82d0405d0c80 ffff830856d07e08 ffff82d040257c3f 0000000040476898
> (XEN)    ffff82d0405c1280 ffff82d040257bca ffff82d040476898 000000d0911fcbc4
> (XEN)    0000000000000000 ffff830856d07e30 ffff82d04022d55c ffff82d0405c1280
> (XEN)    ffff8308529d5f00 ffff82d0405d0d68 ffff830856d07e70 ffff82d04022de59
> (XEN)    ffff830856d07ef8 ffff82d0405c7f00 ffffffffffffffff ffff82d0405c7f00
> (XEN)    ffff830856d07fff 0000000000000000 ffff830856d07ea8 ffff82d04022b53e
> (XEN)    0000000000000000 0000000000007fff ffff82d0405c7f00 ffff82d0405c11d0
> (XEN)    ffff82d0405db2a0 ffff830856d07eb8 ffff82d04022b5d1 ffff830856d07ef0
> (XEN)    ffff82d0402fcd15 ffff82d0402fcc88 ffff8308528cb000 ffff830856d07ef8
> (XEN)    ffff830856ce2000 0000000000000000 ffff830856d07e18 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 ffffffff82c1aa40
> (XEN)    0000000000000000 0000000000000246 0000000000007ff0 0000000000000000
> (XEN)    000000000fd109eb 0000000000000000 ffffffff81e153aa 4000000000000000
> (XEN)    deadbeefdeadf00d deadbeefdeadf00d 0000010000000000 ffffffff81e153aa
> (XEN)    000000000000e033 0000000000000246 ffffffff82c03dd0 000000000000e02b
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000e01000000000 ffff830856ce1000 0000000000000000 0000000000b526e0
> (XEN)    0000000000000000 0000000000000000 0006030300000000 0000000000000000
> (XEN) Xen call trace:
> (XEN)    [<ffff82d04022c07e>] R _spin_unlock_irqrestore+0x21/0x27
> (XEN)    [<ffff82d040257c3f>] F xhci-dbc.c#dbc_uart_poll+0x75/0x17c
> (XEN)    [<ffff82d04022d55c>] F timer.c#execute_timer+0x45/0x5c
> (XEN)    [<ffff82d04022de59>] F timer.c#timer_softirq_action+0x71/0x275
> (XEN)    [<ffff82d04022b53e>] F softirq.c#__do_softirq+0x94/0xbe
> (XEN)    [<ffff82d04022b5d1>] F do_softirq+0x13/0x15
> (XEN)    [<ffff82d0402fcd15>] F domain.c#idle_loop+0x8d/0xe6

... this looks to be the issuing CPU. What I don't understand is why we
are in _spin_unlock_irqrestore() here, called out of dbc_uart_poll().

Btw - was any/all of this with or without the series here applied?

Jan

