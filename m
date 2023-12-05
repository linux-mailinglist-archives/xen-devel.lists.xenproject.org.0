Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1208057A4
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:43:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647976.1011812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWdv-0005k5-Ju; Tue, 05 Dec 2023 14:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647976.1011812; Tue, 05 Dec 2023 14:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWdv-0005i8-Gr; Tue, 05 Dec 2023 14:43:23 +0000
Received: by outflank-mailman (input) for mailman id 647976;
 Tue, 05 Dec 2023 14:43:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmhw=HQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rAWdu-0005i2-Aq
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:43:22 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2b68f23-937c-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 15:43:21 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40c09fcfa9fso27453005e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 06:43:21 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bg36-20020a05600c3ca400b003fe1fe56202sm19205399wmb.33.2023.12.05.06.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 06:43:20 -0800 (PST)
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
X-Inumbo-ID: a2b68f23-937c-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701787400; x=1702392200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AVqXJd8SoXzjXF1oteqKlI3xNcd39qeXf1oX7YvYlR0=;
        b=vCNoyytxohepsrU+bjKf0Ae2R0fLVRXTlHVAHRf2eyxJo/w1mcq+GNjFOvPX13MZtX
         mB7fEZ9em8XW3UTKXgdJYIM1sq3dXhISFKcm+rBegK0bwNpH/8HPFnqp7l4ihDwbVYUx
         b7H59ap4w1+kqmYtE2vIpEf1zymJNqlBqjIhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701787400; x=1702392200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVqXJd8SoXzjXF1oteqKlI3xNcd39qeXf1oX7YvYlR0=;
        b=Dl8wPw4m+QUgtSroAgtN0yoD4PCPNfGQOZBmHR9fJFfGWygp8pDPUy2gPiWq0uCt53
         s+CWDGjfgS5av+aw5rUPUbvGmn9HUqa+jPKv5PK9B8da60xeCSv6q2inSMk2tnP4u4Bp
         lnnbACLi0xfHChEwqQV1cAR+D/BrM9H9JhhZtzPiRd9OEjOFGK6SGYkmYDTykgWzXFHE
         mbNPVIbk+asYxPGo91V9Yg0VbcBRnuEhCKohnNgVDhmyN8qYojlxobC5/MyTXeteax+B
         QjVYPKBtqahPiW5SNcpnI5oDTwTZwFbK4EWEpqVt2o2TvKi9N7fh+Si3dsI2+hQmWBJL
         b3Mw==
X-Gm-Message-State: AOJu0YxmyrxODX16rrXPsYOEk+uI+hrAifM2aIqS9JcZ5xP05FY+MX25
	yU9qK5UvxZrWQsB7Y3dbKZJGYw==
X-Google-Smtp-Source: AGHT+IFL5yenk8V+e6+S1qVJol+vTZKt96nMmA6xbrxhA/zmfrysAHgn94N6ADEuFIF6eJUHxs6KbQ==
X-Received: by 2002:a1c:7418:0:b0:40b:5e59:f726 with SMTP id p24-20020a1c7418000000b0040b5e59f726mr1690182wmc.152.1701787400518;
        Tue, 05 Dec 2023 06:43:20 -0800 (PST)
Message-ID: <1415ddc9-81f3-4d50-b735-7e44a7f656d5@citrix.com>
Date: Tue, 5 Dec 2023 14:43:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Nested Virtualization Bug on x86-64 AMD CPU
Content-Language: en-GB
To: Reima ISHII <ishiir@g.ecc.u-tokyo.ac.jp>, xen-devel@lists.xenproject.org
Cc: Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>
References: <CA+aCS-Ha4jSYFfxhOwMGiGJPdCOtgBJLt=3Q=v9dfp6SQJys4w@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CA+aCS-Ha4jSYFfxhOwMGiGJPdCOtgBJLt=3Q=v9dfp6SQJys4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/12/2023 1:51 pm, Reima ISHII wrote:
> Dear Xen Development Team,
>
> I am writing to report a bug that I have encountered in a Xen HVM
> guest with nested virtualization.
> Below is a detailed description of the bug, its potential impact, and
> the environment in which it was observed.
>
> [Bug Description]
> The issue emerges when operating an HVM guest with nested
> virtualization on an x86-64 AMD CPU, specifically in 64-bit mode (Long
> Mode). The sequence to reproduce the bug is as follows:
>
> 1. Enable nestedhvm on an HVM guest.
> 2. In the L1 guest hypervisor, set CR0.PE, PG to 1 in VMCB12 and
> execute  VMRUN, correctly resulting in a VM entry into the L2 guest.
> 3. In the L2 guest, perform a vmcall, which returns control back to
> the L1 hypervisor.
> 4. Subsequently, while still in 64-bit mode, the L1 hypervisor just
> changes the CR0.PG to 0 in VMCB12 and then executes VMRUN.

Thankyou for the bug report.

Who is still in 64-bit mode ?

It is legal for a 64-bit L1 to VMRUN into a 32-bit L2 with PG=0.

But I'm guessing that you mean L2 is also 64-bit, and we're clearing PG,
thus creating an illegal state (LMA=1 && PG=0) in VMCB12.

And yes, in that case (virtual) VMRUN at L1 ought to fail with
VMEXIT_INVALID.

>
> It is this specific action - executing VMRUN with CR0.PG set to 0 in
> Long Mode - that triggers the BUG() within the
> nsvm_vmcb_guest_intercepts_exitcode function in
> arch/x86/hvm/svm/nestedsvm.c.
> For an unknown reason, a vmexit occurs with the code 0x402, which is
> flagged as an illegal exitcode, thus triggering the BUG().
>
> [Potential Impact]
> This bug presents a vulnerability that could allow a DoS attack from
> the guest VM to the host hypervisor.
>
> [Environment Details]
> Here are the specs of the environment where the bug occurred:
> - Xen Version: Xen-4.18-unstable (commit
> 290f82375d828ef93f831a5ef028f1283aa1ea47)
> - Architecture: x86_64 (intel)
>
> [Error Log]
> (XEN) d1v0 Unexpected nested vmexit: reason 0x66
> (XEN) d1v0 Unexpected nested vmexit: reason 0x7b
> (XEN) d1v0 Unexpected nested vmexit: reason 0x7b
> (XEN) d1v0 Unexpected nested vmexit: reason 0x7b
> (XEN) d1v0 Unexpected nested vmexit: reason 0x7b
> (XEN) arch/x86/hvm/svm/nestedsvm.c:982:d1v0 Illegal exitcode 0x402
> (XEN) Xen BUG at arch/x86/hvm/svm/nestedsvm.c:983
> (XEN) Debugging connection not set up.
> (XEN) ----[ Xen-4.18-unstable  x86_64  debug=y gcov=y  Tainted:   C    ]----
> (XEN) CPU:    10
> (XEN) RIP:    e008:[<ffff82d0402997b8>]
> arch/x86/hvm/svm/nestedsvm.c#nsvm_vmcb_guest_intercepts_exitcode+0x29e/0x4c1
> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d1v0)
> (XEN) rax: ffff830839bdd040   rbx: ffff83084f593000   rcx: 0000000000000008
> (XEN) rdx: ffff830839bd7fff   rsi: ffff830839be5da8   rdi: ffff830839be5da0
> (XEN) rbp: ffff830839bd7e48   rsp: ffff830839bd7e30   r8:  0000000000000001
> (XEN) r9:  ffff830839be5da0   r10: 0000000000000001   r11: 0000000000000010
> (XEN) r12: ffff83084f593000   r13: ffff83084f583000   r14: ffff83084f593000
> (XEN) r15: 0000000000000001   cr0: 000000008005003b   cr4: 0000000000f506e0
> (XEN) cr3: 000000084f6d4000   cr2: 0000000000000000
> (XEN) fsb: 0000000000000000   gsb: ffff888490140000   gss: 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> (XEN) Xen code around <ffff82d0402997b8>
> (arch/x86/hvm/svm/nestedsvm.c#nsvm_vmcb_guest_intercepts_exitcode+0x29e/0x4c1):
> (XEN)  48 83 05 e0 ee 3b 00 01 <0f> 0b 48 83 05 de ee 3b 00 01 48 83 05 96 ee 3b
> (XEN) Xen stack trace from rsp=ffff830839bd7e30:
> (XEN)    0000000000000402 ffff83084f593000 ffff83084f583000 ffff830839bd7e70
> (XEN)    ffff82d04029b052 0000000000000402 ffff830839bd7ef8 ffff83084f583000
> (XEN)    ffff830839bd7ee8 ffff82d0402a1121 ffff82d0402a4afa ffff82d0402a4b00
> (XEN)    ffff82d0402a4afa ffff82c0002d8000 ffff82d0402a4afa ffff82d0402a4b00
> (XEN)    ffff82d0402a4afa ffff82d0402a4b00 ffff83084f593000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 00007cf7c64280e7
> (XEN)    ffff82d0402a4b4c 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 000000001f4604f7 0000000000000006 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000002040
> (XEN)    00000000000004f7 0000000000000000 0000000000000000 000000001f467473
> (XEN)    0000beef0000beef 000000000000ffff 000000bf0000beef 0000000000000082
> (XEN)    0000000000000c62 000000000000beef 000000000000beef 000000000000beef
> (XEN)    00000000ffffbeef 000000000000beef 0000e0100000000a ffff83084f593000
> (XEN)    00000037f95a2000 0000000000f506e0 0000000000000000 0000000000000000
> (XEN)    0000030300000000 0000000000000000
> (XEN) Xen call trace:
> (XEN)    [<ffff82d0402997b8>] R
> arch/x86/hvm/svm/nestedsvm.c#nsvm_vmcb_guest_intercepts_exitcode+0x29e/0x4c1
> (XEN)    [<ffff82d04029b052>] F nestedsvm_check_intercepts+0x29/0x214
> (XEN)    [<ffff82d0402a1121>] F svm_vmexit_handler+0x351/0x2502
> (XEN)    [<ffff82d0402a4b4c>] F svm_stgi_label+0x5/0x15
> (XEN)
> (XEN) debugtrace_dump() global buffer starting
> 1 cpupool_create(pool=0,sched=6)
> 2 Created cpupool 0 with scheduler SMP Credit Scheduler rev2 (credit2)
> 3 cpupool_add_domain(dom=0,pool=0) n_dom 1 rc 0
> 4-14 p2m: p2m_alloc_table(): allocating p2m table
> 15 cpupool_add_domain(dom=1,pool=0) n_dom 2 rc 0
> (XEN) wrap: 0
> (XEN) debugtrace_dump() global buffer finished
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 10:
> (XEN) Xen BUG at arch/x86/hvm/svm/nestedsvm.c:983
> (XEN) ****************************************
> (XEN)

As an incidental observation, that function is particularly absurd and
the two switches should be merged.

VMExit reason 0x402 is AVIC_NOACCEL and Xen has no support for AVIC in
the slightest right now.  i.e. Xen shouldn't have AVIC active in the
VMCB, and should never any AVIC related VMExits.

It is possible that we've got memory corruption, and have accidentally
activated AVIC in the VMCB.

But, is this by any chance all running nested under KVM in your fuzzer?

~Andrew

