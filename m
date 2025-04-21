Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87633A956F0
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 21:53:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961414.1352836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6xC6-0007gM-AQ; Mon, 21 Apr 2025 19:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961414.1352836; Mon, 21 Apr 2025 19:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6xC6-0007eZ-78; Mon, 21 Apr 2025 19:52:42 +0000
Received: by outflank-mailman (input) for mailman id 961414;
 Mon, 21 Apr 2025 19:52:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J93P=XH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u6xC4-0007eT-Vv
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 19:52:41 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dfc47ed-1eea-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 21:52:39 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so39442225e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Apr 2025 12:52:39 -0700 (PDT)
Received: from [192.168.86.29] ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa420816sm13002357f8f.15.2025.04.21.12.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Apr 2025 12:52:37 -0700 (PDT)
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
X-Inumbo-ID: 2dfc47ed-1eea-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745265158; x=1745869958; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pGxCz2toYIC/kff9vdTGqDBP36stBwE/3hjfuO606FU=;
        b=c5cYCdMnd+8HHYJ0JCUWGwDtG+tDxdoiEFHjZ5wj88tYUgbxVLSlcQcRIoVHQvXLn2
         cfR181MyLytiqTPG3VagpTuAW5rgajcZYbtyKJiMljhek+wxWsBKWrbD8uUxA+GtgSqw
         +mklleRcdxfCPoATQbaJwtXNf5PUm1oiN45ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745265158; x=1745869958;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGxCz2toYIC/kff9vdTGqDBP36stBwE/3hjfuO606FU=;
        b=OdhdQ3cHIxjvGGCrjmYO9+sxQYd7pliCNJybAxqHC2d5OlTk4sF6S+1D2N8dasJ6r7
         fzWi95VKDPdjvwyHlFcRWZ2f1vM0oK4JiBKWK+hkjwrlK7csJzd2dSdB3jEfj2qC5DxS
         tSqsa1Q4T4+vGVZ+emh5SeMOa90w3CrgYnbukVSnd/nq7I7U6SgmpFXer8F2t7I9/pGg
         OE8+wvVH5V79QKQnjVmjQamKLzskD+BfyX/DOD9OKKuq7QqHXyludnL0Oh0HhbwJCk5r
         jyW0Js3g/CxE8hOx8+NBpRAYjIzBiZzqbxkRaT18sDx6Z021zjgC2hpqcorij545/mxt
         vIig==
X-Gm-Message-State: AOJu0YyfI5e++ksxzYIvr1JYhbMWvD/YJNqsGFEryS2V+l9CLxhbN/As
	UTABsW9WZ4KOe0xKHOYFPAG6Zloyi8oxriZ/mBFGKerC6sFhfGB3R/Ho0Qp473EuejE2mZlw8G7
	o9Zg=
X-Gm-Gg: ASbGncvvj/gUxK+ZvZIM0CWpZgbAH8/BL6a9Kv9B3UEfY68GL9N4szdtObOj4gmrf48
	u2CIKHVSu2KziJHxdUgRNram+7eMY0i3aKYtmW9vtyMLiMkOP01hqJiUa1MF3Pxv1hoWpJks/BN
	VfIn63k8+KKUtAU+9fPWO9rHJMxBMkn8vzvFqNZaTUx0szF6TxKZGW7qpx3stkT7ENCnMgXsRAH
	LrxhUJL7QTckNOO4X9LyEJhMpGJRfzNGKJr8cxXZWrqvZndfvb4qnIFNV8/9dqDmdxZO4vIMKj4
	RJMO6ZOl5+WHMDEs+ZlJ3OaWoiZs41g8HFYXQY26/ijZ8+7EdHJlYuMrsQQYUb3M
X-Google-Smtp-Source: AGHT+IH06iGEdccTHTqTKoLnZUbhej5PuynSnDgldRuyiEFda0FJZT82zW0sqBs0cNS+lkBHe31wSg==
X-Received: by 2002:a05:6000:2907:b0:39f:d03:f567 with SMTP id ffacd0b85a97d-39f0d03f56amr2597181f8f.16.1745265158372;
        Mon, 21 Apr 2025 12:52:38 -0700 (PDT)
Message-ID: <6fd54b87-1312-46b0-8f5c-ce186f60629f@citrix.com>
Date: Mon, 21 Apr 2025 20:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Assertion failure with vmcb->_vintr.fields.vgif in nested
 SVM
To: xen-devel@lists.xenproject.org, REIMA ISHII <ishiir@g.ecc.u-tokyo.ac.jp>
References: <CA+aCS-EBA38cuP52_tKxomyiyEJani1+9d3HpqpT3BS2sRFECg@mail.gmail.com>
 <CA+aCS-GcAnziL8njhzOo+MoN0w-GfcpG66m4URwO+O4iVEtWDA@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Cc: Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>
In-Reply-To: <CA+aCS-GcAnziL8njhzOo+MoN0w-GfcpG66m4URwO+O4iVEtWDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/04/2025 6:59 pm, REIMA ISHII wrote:
> Hi,
> I would like to follow up on the bug report I sent regarding a nested
> SVM issue in Xen, where an invalid CR4 value in VMCB12 leads to an
> assertion failure during VMRUN.
>
> As I haven't seen any updates or feedback, I wanted to kindly check if
> this issue has been acknowledged internally, or if there are any plans
> for addressing this case in future releases.
>
> Since this issue can potentially cause a hypervisor panic, I believe it
> would be valuable to handle this safely.
>
> Thank you for your time

Sorry, both issues fell between the cracks.

I've opened https://gitlab.com/xen-project/xen/-/issues/215 and so it
doesn't get lost again.

> On Mon, Nov 13, 2023 at 4:36 PM Reima ISHII <ishiir@g.ecc.u-tokyo.ac.jp> wrote:
>> Hi Xen Development Team,
>>
>> I am reporting a potential bug in the nested SVM implementation of the
>> Xen hypervisor, observed under specific conditions in a DomU HVM
>> guest.
>>
>> L1 on the DomU HVM guest sets a bit in CR4 of the VMCB12 save area
>> that is not part of hvm_cr4_guest_valid_bits and performs a VMRUN.
>> Subsequently, hvm_set_cr4 on the xen hypervisor fails and
>> nsvm_vcpu_vmexit_inject causes an assertion failure.
>>
>> The environment is as follows:
>> - Xen Version: Xen-4.18-unstable (commit
>> 290f82375d828ef93f831a5ef028f1283aa1ea47)
>> - Architecture: x86_64 (AMD)
>>
>> The potential impact on system stability and release builds remains
>> uncertain, but this issue might pose a problem and merits attention
>> for improved robustness in nested virtualization scenarios.
>>
>> (XEN) arch/x86/hvm/svm/nestedsvm.c:554:d1v0 hvm_set_cr4 failed, rc: 2
>> (XEN) d1v0[nsvm_vmcb_prepare4vmrun]: CR4: invalid value 0x20020 (valid
>> 0x750fff, rejected 0x20000)
>> (XEN) arch/x86/hvm/svm/nestedsvm.c:658:d1v0 virtual vmcb invalid
>> (XEN) arch/x86/hvm/svm/nestedsvm.c:729:d1v0 prepare4vmrun failed, ret = 1
>> (XEN) arch/x86/hvm/svm/nestedsvm.c:768:d1v0 inject VMEXIT(INVALID)
>> (XEN) Assertion 'vmcb->_vintr.fields.vgif == 0' failed at
>> arch/x86/hvm/svm/nestedsvm.c:799
>> (XEN) Debugging connection not set up.
>> (XEN) ----[ Xen-4.18-unstable  x86_64  debug=y gcov=y  Tainted:   C    ]----
>> (XEN) CPU:    2
>> (XEN) RIP:    e008:[<ffff82d04029bef6>] nsvm_vcpu_switch+0x34e/0x502
>> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d1v0)
>> (XEN) rax: ffff830839677000   rbx: ffff83083967b000   rcx: 0000000000000030
>> (XEN) rdx: 0000000000000000   rsi: 0000000000000003   rdi: ffff83083967b000
>> (XEN) rbp: ffff83083abb7ee8   rsp: ffff83083abb7ed0   r8:  0000000000000010
>> (XEN) r9:  0000000000750fff   r10: 0000000000040000   r11: 0000000000000000
>> (XEN) r12: ffff83083abb7ef8   r13: ffffffffffffffff   r14: 0000000000000000
>> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 0000000000f506e0
>> (XEN) cr3: 00000008397bb000   cr2: 0000000000000000
>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>> (XEN) ds: 0000   es: 0000   fs: 0033   gs: 0033   ss: 0000   cs: e008
>> (XEN) Xen code around <ffff82d04029bef6> (nsvm_vcpu_switch+0x34e/0x502):
>> (XEN)  48 83 05 7a c5 3b 00 01 <0f> 0b 48 83 05 78 c5 3b 00 01 48 83 05 60 c5 3b
>> (XEN) Xen stack trace from rsp=ffff83083abb7ed0:
>> (XEN)    ffff83083967b000 0000000000000000 0000000000000000 00007cf7c54480e7
>> (XEN)    ffff82d0402a49d6 0000000000000000 0000000000000000 0000000000000000
>> (XEN)    0000000000000000 0000000000126000 0000000000000000 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000126000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 000000000012af30
>> (XEN)    0000beef0000beef 00000000001056f3 000000bf0000beef 0000000000000002
>> (XEN)    000000000012af60 000000000000beef 800000083abfbeef 800000083abfbeef
>> (XEN)    800000083abfbeef 800000083abfbeef 0000e01000000002 ffff83083967b000
>> (XEN)    00000037fa582000 0000000000f506e0 0000000000000000 0000000000000000
>> (XEN)    8000030300000000 800000083abff100
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d04029bef6>] R nsvm_vcpu_switch+0x34e/0x502
>> (XEN)    [<ffff82d0402a49d6>] F svm_asm_do_resume+0x16/0x187
>> (XEN)
>> (XEN) debugtrace_dump() global buffer starting
>> 1 cpupool_create(pool=0,sched=6)
>> 2 Created cpupool 0 with scheduler SMP Credit Scheduler rev2 (credit2)
>> 3 cpupool_add_domain(dom=0,pool=0) n_dom 1 rc 0
>> 4-14 p2m: p2m_alloc_table(): allocating p2m table
>> 15 cpupool_add_domain(dom=1,pool=0) n_dom 2 rc 0
>> (XEN) wrap: 0
>> (XEN) debugtrace_dump() global buffer finished
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 2:
>> (XEN) Assertion 'vmcb->_vintr.fields.vgif == 0' failed at
>> arch/x86/hvm/svm/nestedsvm.c:799
>> (XEN) ****************************************

This is fun.  The ASSERT() is incorrect, but that's also not the real
issue here.

The real bug is trying to raise #GP in the virtual vmentry path because
of bad control register state.  It should trigger a virtual vmexit
reporting VMEXIT_INVALID.

As for the ASSERT(), (v)GIF blocks external interrupts (inc INIT, NMI
and any #MC which can be delayed).  It does not block exceptions, so a
#GP ought to be able to be injected like this.


The real issue here is the reuse of the helpers for main `MOV CR`.  They
simply don't behave correctly for nested virt. 

Unfortunately, this is going to be quite complicated to fix.  I have no
idea when I'm going to have enough time to look into this.

~Andrew

