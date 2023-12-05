Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD74F80568C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 14:52:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647903.1011622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVqR-0006C6-EO; Tue, 05 Dec 2023 13:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647903.1011622; Tue, 05 Dec 2023 13:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVqR-0006AF-B9; Tue, 05 Dec 2023 13:52:15 +0000
Received: by outflank-mailman (input) for mailman id 647903;
 Tue, 05 Dec 2023 13:52:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sj5z=HQ=g.ecc.u-tokyo.ac.jp=ishiir@srs-se1.protection.inumbo.net>)
 id 1rAVqP-000690-L4
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 13:52:14 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b9e07f0-9375-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 14:52:09 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a1cee2c1620so37824166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 05:52:09 -0800 (PST)
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
X-Inumbo-ID: 7b9e07f0-9375-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=g.ecc.u-tokyo.ac.jp; s=google; t=1701784328; x=1702389128; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9BfGcZinPd4wP7BbUerFSAXuXjqp24nzPF9aWovC7ks=;
        b=McccP7xnroXTHrXbHugu7UxBQ+BZORhIXCm/JMnzmcznRecIcvLVOehTqpVjD2E0RV
         Wryk6bk00wxugg3luzzaulHtKy+zLg1kNSV3pWMekASeKUuLMAU6V4YQANKHsQimZUoW
         lnQ3V5oisDaZH6MgImALkTzgdphwjuvwZ3slaSyo1d7LDkkwAwN5b+y0CUeaexBsS+KJ
         hV2X2bWTkBXKRNgyij2l1VYrBcAvTBqM9ZsCjIlYbyfYvVrY0aHbfVRS1+BOMSryazZl
         T/ZpkJryK3d/qzWiEQa5Cdcunn484LtJLCaA9MDsS9ohXrU5pkNlbz/pS+gw0dWbn0sV
         KIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701784328; x=1702389128;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9BfGcZinPd4wP7BbUerFSAXuXjqp24nzPF9aWovC7ks=;
        b=tge1h8qKRUh+oodvSIosEDeglLtSsODSLEqjWRK5zSlZ4HeF2PyCtDj4z7yDj6c6JL
         rvkIIJtkztPjWRxD0mh4caR5DfNfOlbgDrwmKD8aZC1nLK/CZLsbf3I4sXQBJUiRoZof
         84ga+bquL8IgYIA9UaDqL6rVMEVh8sUkQXyy3zM32OFfSqUFoePHMBaDgoNOBylDOVZL
         aTa9g/HIZcLcP6A45NwIAoBl7YQc8Ygs3LHL3YhZynbpME2rV6bX0pa03kcP3NamQ0T7
         ncNxZ6hAdOsYvThy1STlz1YaD9FDsPaoPujVKwuu5Kb2WUGU8VHTJ2JLAFnZTNot4HeD
         HlFQ==
X-Gm-Message-State: AOJu0YxqEq76Y70cIoi4z2zk7yAWFr8POkSX2QmYd/y76JkiX5dtwHko
	q19OslC09AA2TbtbA7HUrhsVb003RpF7y8oepFGNNNDwkqVemqsD4oB0GQ==
X-Google-Smtp-Source: AGHT+IFcJQqkdHteiLnbJEcH2VFM/jqJ/PhF0efb3QVwYBRNQAc4ECA7jueAmC7NPX0vjxfPD72wXIz9S0FDxHPMI+U=
X-Received: by 2002:a17:906:338b:b0:a19:a1ba:baab with SMTP id
 v11-20020a170906338b00b00a19a1babaabmr1725406eja.81.1701784328126; Tue, 05
 Dec 2023 05:52:08 -0800 (PST)
MIME-Version: 1.0
From: Reima ISHII <ishiir@g.ecc.u-tokyo.ac.jp>
Date: Tue, 5 Dec 2023 22:51:56 +0900
Message-ID: <CA+aCS-Ha4jSYFfxhOwMGiGJPdCOtgBJLt=3Q=v9dfp6SQJys4w@mail.gmail.com>
Subject: [BUG] Nested Virtualization Bug on x86-64 AMD CPU
To: xen-devel@lists.xenproject.org
Cc: Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>
Content-Type: text/plain; charset="UTF-8"

Dear Xen Development Team,

I am writing to report a bug that I have encountered in a Xen HVM
guest with nested virtualization.
Below is a detailed description of the bug, its potential impact, and
the environment in which it was observed.

[Bug Description]
The issue emerges when operating an HVM guest with nested
virtualization on an x86-64 AMD CPU, specifically in 64-bit mode (Long
Mode). The sequence to reproduce the bug is as follows:

1. Enable nestedhvm on an HVM guest.
2. In the L1 guest hypervisor, set CR0.PE, PG to 1 in VMCB12 and
execute  VMRUN, correctly resulting in a VM entry into the L2 guest.
3. In the L2 guest, perform a vmcall, which returns control back to
the L1 hypervisor.
4. Subsequently, while still in 64-bit mode, the L1 hypervisor just
changes the CR0.PG to 0 in VMCB12 and then executes VMRUN.

It is this specific action - executing VMRUN with CR0.PG set to 0 in
Long Mode - that triggers the BUG() within the
nsvm_vmcb_guest_intercepts_exitcode function in
arch/x86/hvm/svm/nestedsvm.c.
For an unknown reason, a vmexit occurs with the code 0x402, which is
flagged as an illegal exitcode, thus triggering the BUG().

[Potential Impact]
This bug presents a vulnerability that could allow a DoS attack from
the guest VM to the host hypervisor.

[Environment Details]
Here are the specs of the environment where the bug occurred:
- Xen Version: Xen-4.18-unstable (commit
290f82375d828ef93f831a5ef028f1283aa1ea47)
- Architecture: x86_64 (intel)

[Error Log]
(XEN) d1v0 Unexpected nested vmexit: reason 0x66
(XEN) d1v0 Unexpected nested vmexit: reason 0x7b
(XEN) d1v0 Unexpected nested vmexit: reason 0x7b
(XEN) d1v0 Unexpected nested vmexit: reason 0x7b
(XEN) d1v0 Unexpected nested vmexit: reason 0x7b
(XEN) arch/x86/hvm/svm/nestedsvm.c:982:d1v0 Illegal exitcode 0x402
(XEN) Xen BUG at arch/x86/hvm/svm/nestedsvm.c:983
(XEN) Debugging connection not set up.
(XEN) ----[ Xen-4.18-unstable  x86_64  debug=y gcov=y  Tainted:   C    ]----
(XEN) CPU:    10
(XEN) RIP:    e008:[<ffff82d0402997b8>]
arch/x86/hvm/svm/nestedsvm.c#nsvm_vmcb_guest_intercepts_exitcode+0x29e/0x4c1
(XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d1v0)
(XEN) rax: ffff830839bdd040   rbx: ffff83084f593000   rcx: 0000000000000008
(XEN) rdx: ffff830839bd7fff   rsi: ffff830839be5da8   rdi: ffff830839be5da0
(XEN) rbp: ffff830839bd7e48   rsp: ffff830839bd7e30   r8:  0000000000000001
(XEN) r9:  ffff830839be5da0   r10: 0000000000000001   r11: 0000000000000010
(XEN) r12: ffff83084f593000   r13: ffff83084f583000   r14: ffff83084f593000
(XEN) r15: 0000000000000001   cr0: 000000008005003b   cr4: 0000000000f506e0
(XEN) cr3: 000000084f6d4000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: ffff888490140000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d0402997b8>
(arch/x86/hvm/svm/nestedsvm.c#nsvm_vmcb_guest_intercepts_exitcode+0x29e/0x4c1):
(XEN)  48 83 05 e0 ee 3b 00 01 <0f> 0b 48 83 05 de ee 3b 00 01 48 83 05 96 ee 3b
(XEN) Xen stack trace from rsp=ffff830839bd7e30:
(XEN)    0000000000000402 ffff83084f593000 ffff83084f583000 ffff830839bd7e70
(XEN)    ffff82d04029b052 0000000000000402 ffff830839bd7ef8 ffff83084f583000
(XEN)    ffff830839bd7ee8 ffff82d0402a1121 ffff82d0402a4afa ffff82d0402a4b00
(XEN)    ffff82d0402a4afa ffff82c0002d8000 ffff82d0402a4afa ffff82d0402a4b00
(XEN)    ffff82d0402a4afa ffff82d0402a4b00 ffff83084f593000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 00007cf7c64280e7
(XEN)    ffff82d0402a4b4c 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 000000001f4604f7 0000000000000006 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000002040
(XEN)    00000000000004f7 0000000000000000 0000000000000000 000000001f467473
(XEN)    0000beef0000beef 000000000000ffff 000000bf0000beef 0000000000000082
(XEN)    0000000000000c62 000000000000beef 000000000000beef 000000000000beef
(XEN)    00000000ffffbeef 000000000000beef 0000e0100000000a ffff83084f593000
(XEN)    00000037f95a2000 0000000000f506e0 0000000000000000 0000000000000000
(XEN)    0000030300000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d0402997b8>] R
arch/x86/hvm/svm/nestedsvm.c#nsvm_vmcb_guest_intercepts_exitcode+0x29e/0x4c1
(XEN)    [<ffff82d04029b052>] F nestedsvm_check_intercepts+0x29/0x214
(XEN)    [<ffff82d0402a1121>] F svm_vmexit_handler+0x351/0x2502
(XEN)    [<ffff82d0402a4b4c>] F svm_stgi_label+0x5/0x15
(XEN)
(XEN) debugtrace_dump() global buffer starting
1 cpupool_create(pool=0,sched=6)
2 Created cpupool 0 with scheduler SMP Credit Scheduler rev2 (credit2)
3 cpupool_add_domain(dom=0,pool=0) n_dom 1 rc 0
4-14 p2m: p2m_alloc_table(): allocating p2m table
15 cpupool_add_domain(dom=1,pool=0) n_dom 2 rc 0
(XEN) wrap: 0
(XEN) debugtrace_dump() global buffer finished
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 10:
(XEN) Xen BUG at arch/x86/hvm/svm/nestedsvm.c:983
(XEN) ****************************************
(XEN)

-- 
Graduate School of Information Science and Technology, The University of Tokyo
Reima Ishii
ishiir@g.ecc.u-tokyo.ac.jp

