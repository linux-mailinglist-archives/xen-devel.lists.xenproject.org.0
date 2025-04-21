Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6225AA9559B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 20:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961391.1352825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6vRH-00018x-OY; Mon, 21 Apr 2025 18:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961391.1352825; Mon, 21 Apr 2025 18:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6vRH-00016J-Le; Mon, 21 Apr 2025 18:00:15 +0000
Received: by outflank-mailman (input) for mailman id 961391;
 Mon, 21 Apr 2025 18:00:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k4Vt=XH=g.ecc.u-tokyo.ac.jp=ishiir@srs-se1.protection.inumbo.net>)
 id 1u6vRF-00016C-Ov
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 18:00:13 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 771cb765-1eda-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 20:00:10 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac3b12e8518so725768366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Apr 2025 11:00:10 -0700 (PDT)
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
X-Inumbo-ID: 771cb765-1eda-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=g.ecc.u-tokyo.ac.jp; s=google; t=1745258409; x=1745863209; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4OyooXtAMJ7RI/dNOEQze6eeOWbdYtFYMmHJPS1Oqs=;
        b=LYsHmhpTtm9m3pBajSAwumCFVrH21B1yr5evv9c86ljQyMxGvKWcil7EEAjCXIlZun
         CO/WLoW7P3RcwMvKZG6LND+N92kV/NLvB2yV6p9wQaB38udb6mSvekyDtG7OnKYkOk+M
         NMUpilCUItJAjvJFdTOmRkfxdvhJ4n5DqAprXLSl6htDq1X+YRPviBPoKMKFOeVgO+mc
         WSoiOSyciypcsDXxL+r2j8YE4CdVIGNkky9w3JwgeH3SrcH/ye2ya+Ux+zyMDYKz+l63
         jYZ5SwAsH8myNDM1SM3uiC+CcG0TEqjsQLcJ3tc0ybhiPfSZMgnyTAwQ6n0e7qd2KeBh
         qG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745258409; x=1745863209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4OyooXtAMJ7RI/dNOEQze6eeOWbdYtFYMmHJPS1Oqs=;
        b=oRAtnbYjDuyWaYlx73QLIxbz71R2AUv4urvmfnkfxpdgcEVopJzXepneuqS59HmYsR
         x8AmuGuM4owkTdQbY52rAsf8CO8aG6fWPJ0sdlMpulIWHs9s5aLWkA5WBCUt8TELjeSH
         qfG11JQlzKI83VOVHxZXK2ga/tAKXtuJyGaIRrSRRkZtlCrNZjVDjPwh1ab70wpvN3L5
         4IeS0KH0MURP+sIq3U6Stf/0g7gyWB11P8Xyf6ZdED/hyJFq5QOSbu24YdDcI1IzylOt
         FgIKnwGFqolT8nv3vX37TQ13nWl7G+F38bMnlxk6JvaXu8DW0wCsIibzvvMRzDgTXuLR
         cSEQ==
X-Gm-Message-State: AOJu0YwfjLs2XXqLimu0eQDftxYYek+q05kfbi8iGvX8Uu31M8A2oex/
	3JHovXpYvrUrp7GfHAFKrDeWN/7NEoGqwtbKHK0nvBCOKVjls9xpyiiMbCraFvy3wmg8vyljdRT
	Vx0lj7hO3Z/XaQ+iPU1Pck8972Dqoqld1Q04B6hLqUZFAYmBoeRlG+A==
X-Gm-Gg: ASbGncuxqgLU8jWr9QtllJrKmzxACtdNuYHaFt0niWr46WL9frYW4fDBitMI7HU5UfU
	G8EYwg6rat5H95C9y/dJsUSqkjaTKKm5VEr2HDXzSbDh72LmlhpFyY4P8FMVuMqmfS5z3VptERv
	tdAb62cxmEAuTRPHnwdeCo5LOca0yuTfYqYhc6JPQcFbseiynXAobXwCg=
X-Google-Smtp-Source: AGHT+IGBpFHdtBo42Gsb/jsTSeYUUYqNGICeBdtbW2oUo1UabPrAvkrZo9WRcq7uunm0KVe+4dj+ChDtKW0P5vvcqP4=
X-Received: by 2002:a17:906:c10b:b0:acb:6081:14ec with SMTP id
 a640c23a62f3a-acb74e8da8amr1117388366b.61.1745258409029; Mon, 21 Apr 2025
 11:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <CA+aCS-EBA38cuP52_tKxomyiyEJani1+9d3HpqpT3BS2sRFECg@mail.gmail.com>
In-Reply-To: <CA+aCS-EBA38cuP52_tKxomyiyEJani1+9d3HpqpT3BS2sRFECg@mail.gmail.com>
From: REIMA ISHII <ishiir@g.ecc.u-tokyo.ac.jp>
Date: Tue, 22 Apr 2025 02:59:58 +0900
X-Gm-Features: ATxdqUHGLZnMGn7xcFOyjaeCTfLIqFAAOeB441VIDe90xGBEcPrXL9yWz1TB6d4
Message-ID: <CA+aCS-GcAnziL8njhzOo+MoN0w-GfcpG66m4URwO+O4iVEtWDA@mail.gmail.com>
Subject: Re: [BUG] Assertion failure with vmcb->_vintr.fields.vgif in nested SVM
To: xen-devel@lists.xenproject.org
Cc: Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
I would like to follow up on the bug report I sent regarding a nested
SVM issue in Xen, where an invalid CR4 value in VMCB12 leads to an
assertion failure during VMRUN.

As I haven't seen any updates or feedback, I wanted to kindly check if
this issue has been acknowledged internally, or if there are any plans
for addressing this case in future releases.

Since this issue can potentially cause a hypervisor panic, I believe it
would be valuable to handle this safely.

Thank you for your time


On Mon, Nov 13, 2023 at 4:36=E2=80=AFPM Reima ISHII <ishiir@g.ecc.u-tokyo.a=
c.jp> wrote:
>
> Hi Xen Development Team,
>
> I am reporting a potential bug in the nested SVM implementation of the
> Xen hypervisor, observed under specific conditions in a DomU HVM
> guest.
>
> L1 on the DomU HVM guest sets a bit in CR4 of the VMCB12 save area
> that is not part of hvm_cr4_guest_valid_bits and performs a VMRUN.
> Subsequently, hvm_set_cr4 on the xen hypervisor fails and
> nsvm_vcpu_vmexit_inject causes an assertion failure.
>
> The environment is as follows:
> - Xen Version: Xen-4.18-unstable (commit
> 290f82375d828ef93f831a5ef028f1283aa1ea47)
> - Architecture: x86_64 (AMD)
>
> The potential impact on system stability and release builds remains
> uncertain, but this issue might pose a problem and merits attention
> for improved robustness in nested virtualization scenarios.
>
> (XEN) arch/x86/hvm/svm/nestedsvm.c:554:d1v0 hvm_set_cr4 failed, rc: 2
> (XEN) d1v0[nsvm_vmcb_prepare4vmrun]: CR4: invalid value 0x20020 (valid
> 0x750fff, rejected 0x20000)
> (XEN) arch/x86/hvm/svm/nestedsvm.c:658:d1v0 virtual vmcb invalid
> (XEN) arch/x86/hvm/svm/nestedsvm.c:729:d1v0 prepare4vmrun failed, ret =3D=
 1
> (XEN) arch/x86/hvm/svm/nestedsvm.c:768:d1v0 inject VMEXIT(INVALID)
> (XEN) Assertion 'vmcb->_vintr.fields.vgif =3D=3D 0' failed at
> arch/x86/hvm/svm/nestedsvm.c:799
> (XEN) Debugging connection not set up.
> (XEN) ----[ Xen-4.18-unstable  x86_64  debug=3Dy gcov=3Dy  Tainted:   C  =
  ]----
> (XEN) CPU:    2
> (XEN) RIP:    e008:[<ffff82d04029bef6>] nsvm_vcpu_switch+0x34e/0x502
> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d1v0)
> (XEN) rax: ffff830839677000   rbx: ffff83083967b000   rcx: 00000000000000=
30
> (XEN) rdx: 0000000000000000   rsi: 0000000000000003   rdi: ffff83083967b0=
00
> (XEN) rbp: ffff83083abb7ee8   rsp: ffff83083abb7ed0   r8:  00000000000000=
10
> (XEN) r9:  0000000000750fff   r10: 0000000000040000   r11: 00000000000000=
00
> (XEN) r12: ffff83083abb7ef8   r13: ffffffffffffffff   r14: 00000000000000=
00
> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 0000000000f506=
e0
> (XEN) cr3: 00000008397bb000   cr2: 0000000000000000
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 00000000000000=
00
> (XEN) ds: 0000   es: 0000   fs: 0033   gs: 0033   ss: 0000   cs: e008
> (XEN) Xen code around <ffff82d04029bef6> (nsvm_vcpu_switch+0x34e/0x502):
> (XEN)  48 83 05 7a c5 3b 00 01 <0f> 0b 48 83 05 78 c5 3b 00 01 48 83 05 6=
0 c5 3b
> (XEN) Xen stack trace from rsp=3Dffff83083abb7ed0:
> (XEN)    ffff83083967b000 0000000000000000 0000000000000000 00007cf7c5448=
0e7
> (XEN)    ffff82d0402a49d6 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000126000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000126=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 000000000012a=
f30
> (XEN)    0000beef0000beef 00000000001056f3 000000bf0000beef 0000000000000=
002
> (XEN)    000000000012af60 000000000000beef 800000083abfbeef 800000083abfb=
eef
> (XEN)    800000083abfbeef 800000083abfbeef 0000e01000000002 ffff83083967b=
000
> (XEN)    00000037fa582000 0000000000f506e0 0000000000000000 0000000000000=
000
> (XEN)    8000030300000000 800000083abff100
> (XEN) Xen call trace:
> (XEN)    [<ffff82d04029bef6>] R nsvm_vcpu_switch+0x34e/0x502
> (XEN)    [<ffff82d0402a49d6>] F svm_asm_do_resume+0x16/0x187
> (XEN)
> (XEN) debugtrace_dump() global buffer starting
> 1 cpupool_create(pool=3D0,sched=3D6)
> 2 Created cpupool 0 with scheduler SMP Credit Scheduler rev2 (credit2)
> 3 cpupool_add_domain(dom=3D0,pool=3D0) n_dom 1 rc 0
> 4-14 p2m: p2m_alloc_table(): allocating p2m table
> 15 cpupool_add_domain(dom=3D1,pool=3D0) n_dom 2 rc 0
> (XEN) wrap: 0
> (XEN) debugtrace_dump() global buffer finished
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 2:
> (XEN) Assertion 'vmcb->_vintr.fields.vgif =3D=3D 0' failed at
> arch/x86/hvm/svm/nestedsvm.c:799
> (XEN) ****************************************
>
> Thanks,
>
> --
> Graduate School of Information Science and Technology, The University of =
Tokyo
> Reima Ishii
> ishiir@g.ecc.u-tokyo.ac.jp



--=20
Graduate School of Information Science and Technology, The University of To=
kyo
Reima Ishii
ishiir@g.ecc.u-tokyo.ac.jp

