Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C347E971A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 08:38:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631327.984556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2RW6-0000kO-N7; Mon, 13 Nov 2023 07:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631327.984556; Mon, 13 Nov 2023 07:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2RW6-0000hd-KP; Mon, 13 Nov 2023 07:37:54 +0000
Received: by outflank-mailman (input) for mailman id 631327;
 Mon, 13 Nov 2023 07:37:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xrHN=G2=g.ecc.u-tokyo.ac.jp=ishiir@srs-se1.protection.inumbo.net>)
 id 1r2RVO-0000eU-45
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 07:37:11 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f06877e-81f7-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 08:37:01 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9d216597f64so633599866b.3
 for <xen-devel@lists.xenproject.org>; Sun, 12 Nov 2023 23:37:01 -0800 (PST)
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
X-Inumbo-ID: 6f06877e-81f7-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=g.ecc.u-tokyo.ac.jp; s=google; t=1699861020; x=1700465820; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gp9a+BtY34M3nIV6PmJeuR8/15liSy+9pDl3esHa2Ck=;
        b=afTtsbHdsHb9GfkTWeLfuDkktLXg41p/xHal0hGf1pg+fqNyEN2htQO7WJalhHv9iE
         PY1nH7tzkefVeNKRskH9MWTMJPpWEbHFkRXZSx87pZ5qn0iZFvSDi3uEXjn278cW2eDx
         AngmNNR0c++shbAhS1dnC5Cdz3B4SoIfAlFdZS8gmY4t42GI2RXZ62d9XvBrWS7osMe/
         sVCkJauZVUZJ6naCv+y4GtsxyLkWixK9pmqIltx9cyREqVEDxKKLWwLvU/t6ElCWS381
         9PBiVddsP7/ix+CL8uFAZNDggNK925sobOz07Ymln8f2dXcy/9U8MzBaMCmLX/n6T0Qg
         rhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699861020; x=1700465820;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gp9a+BtY34M3nIV6PmJeuR8/15liSy+9pDl3esHa2Ck=;
        b=bvfiHKJW5nK8Rh8NqEtig+2nRvtjJR1YUL64mGjNbskAxn3WUlwEssfy+TO0esR18h
         z/OKqThaHymtb5q10A0v3T+Cx+vsR1MUjf+nspLjjRK74B3NFFSfogzoEoWCBmvcYFbp
         j8VDmofKSYbCcwid5Y7MWX99+8Y/VKk/7SPdvdNbO+NceVPogiky8ATCOk92vkgg2/HA
         ixILzAes0kMw/z8dZM4ikKhcdVUJI2J7q2IfWO5woGqbPMkpC5DwkQfodnedZkG+jHgM
         ORLOXTJmw1OLAm4SjnwuGbpud8g2OZI9WaOZZQYxBf5Y8yVTvIDBBeNfw2rT3n4m2ETx
         Qr8g==
X-Gm-Message-State: AOJu0YzHP+nrkytxZ1MmYz0/aIFd6ldaQKKXL7dHEgrL0xlcSkjxxp9Z
	xHf4Bh2M6rVzS3NNElEZ+ba6OpwUOdXG/MVfVOvavzsMPPdgQNYN4XI=
X-Google-Smtp-Source: AGHT+IE+lintLhBGIpADXLPSKIOupsm46CwCo0K2PXrnefqIr20ds4fOsJgFNkf6WjMv2eqNlPezMMlHUfrtakVfw4s=
X-Received: by 2002:a17:906:e8a:b0:9e0:eb06:2047 with SMTP id
 p10-20020a1709060e8a00b009e0eb062047mr4532911ejf.34.1699861020656; Sun, 12
 Nov 2023 23:37:00 -0800 (PST)
MIME-Version: 1.0
From: Reima ISHII <ishiir@g.ecc.u-tokyo.ac.jp>
Date: Mon, 13 Nov 2023 16:36:50 +0900
Message-ID: <CA+aCS-EBA38cuP52_tKxomyiyEJani1+9d3HpqpT3BS2sRFECg@mail.gmail.com>
Subject: [BUG] Assertion failure with vmcb->_vintr.fields.vgif in nested SVM
To: xen-devel@lists.xenproject.org
Cc: Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>
Content-Type: text/plain; charset="UTF-8"

Hi Xen Development Team,

I am reporting a potential bug in the nested SVM implementation of the
Xen hypervisor, observed under specific conditions in a DomU HVM
guest.

L1 on the DomU HVM guest sets a bit in CR4 of the VMCB12 save area
that is not part of hvm_cr4_guest_valid_bits and performs a VMRUN.
Subsequently, hvm_set_cr4 on the xen hypervisor fails and
nsvm_vcpu_vmexit_inject causes an assertion failure.

The environment is as follows:
- Xen Version: Xen-4.18-unstable (commit
290f82375d828ef93f831a5ef028f1283aa1ea47)
- Architecture: x86_64 (AMD)

The potential impact on system stability and release builds remains
uncertain, but this issue might pose a problem and merits attention
for improved robustness in nested virtualization scenarios.

(XEN) arch/x86/hvm/svm/nestedsvm.c:554:d1v0 hvm_set_cr4 failed, rc: 2
(XEN) d1v0[nsvm_vmcb_prepare4vmrun]: CR4: invalid value 0x20020 (valid
0x750fff, rejected 0x20000)
(XEN) arch/x86/hvm/svm/nestedsvm.c:658:d1v0 virtual vmcb invalid
(XEN) arch/x86/hvm/svm/nestedsvm.c:729:d1v0 prepare4vmrun failed, ret = 1
(XEN) arch/x86/hvm/svm/nestedsvm.c:768:d1v0 inject VMEXIT(INVALID)
(XEN) Assertion 'vmcb->_vintr.fields.vgif == 0' failed at
arch/x86/hvm/svm/nestedsvm.c:799
(XEN) Debugging connection not set up.
(XEN) ----[ Xen-4.18-unstable  x86_64  debug=y gcov=y  Tainted:   C    ]----
(XEN) CPU:    2
(XEN) RIP:    e008:[<ffff82d04029bef6>] nsvm_vcpu_switch+0x34e/0x502
(XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d1v0)
(XEN) rax: ffff830839677000   rbx: ffff83083967b000   rcx: 0000000000000030
(XEN) rdx: 0000000000000000   rsi: 0000000000000003   rdi: ffff83083967b000
(XEN) rbp: ffff83083abb7ee8   rsp: ffff83083abb7ed0   r8:  0000000000000010
(XEN) r9:  0000000000750fff   r10: 0000000000040000   r11: 0000000000000000
(XEN) r12: ffff83083abb7ef8   r13: ffffffffffffffff   r14: 0000000000000000
(XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 0000000000f506e0
(XEN) cr3: 00000008397bb000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0033   gs: 0033   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d04029bef6> (nsvm_vcpu_switch+0x34e/0x502):
(XEN)  48 83 05 7a c5 3b 00 01 <0f> 0b 48 83 05 78 c5 3b 00 01 48 83 05 60 c5 3b
(XEN) Xen stack trace from rsp=ffff83083abb7ed0:
(XEN)    ffff83083967b000 0000000000000000 0000000000000000 00007cf7c54480e7
(XEN)    ffff82d0402a49d6 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000126000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000126000
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000012af30
(XEN)    0000beef0000beef 00000000001056f3 000000bf0000beef 0000000000000002
(XEN)    000000000012af60 000000000000beef 800000083abfbeef 800000083abfbeef
(XEN)    800000083abfbeef 800000083abfbeef 0000e01000000002 ffff83083967b000
(XEN)    00000037fa582000 0000000000f506e0 0000000000000000 0000000000000000
(XEN)    8000030300000000 800000083abff100
(XEN) Xen call trace:
(XEN)    [<ffff82d04029bef6>] R nsvm_vcpu_switch+0x34e/0x502
(XEN)    [<ffff82d0402a49d6>] F svm_asm_do_resume+0x16/0x187
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
(XEN) Panic on CPU 2:
(XEN) Assertion 'vmcb->_vintr.fields.vgif == 0' failed at
arch/x86/hvm/svm/nestedsvm.c:799
(XEN) ****************************************

Thanks,

--
Graduate School of Information Science and Technology, The University of Tokyo
Reima Ishii
ishiir@g.ecc.u-tokyo.ac.jp

