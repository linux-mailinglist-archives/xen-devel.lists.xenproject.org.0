Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B28FBA8552E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 09:13:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946668.1344472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u38Z6-0002WQ-F6; Fri, 11 Apr 2025 07:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946668.1344472; Fri, 11 Apr 2025 07:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u38Z6-0002U1-CG; Fri, 11 Apr 2025 07:12:40 +0000
Received: by outflank-mailman (input) for mailman id 946668;
 Fri, 11 Apr 2025 07:12:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8esB=W5=gmail.com=npiggin@srs-se1.protection.inumbo.net>)
 id 1u38Z5-0002Tv-FO
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 07:12:39 +0000
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [2607:f8b0:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58724771-16a4-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 09:12:37 +0200 (CEST)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-af5a4cd980dso1259429a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 00:12:37 -0700 (PDT)
Received: from localhost ([220.253.99.94]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306dd171942sm4948139a91.33.2025.04.11.00.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 00:12:35 -0700 (PDT)
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
X-Inumbo-ID: 58724771-16a4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744355555; x=1744960355; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzShCwppEme7OMOnT5z5FD+rJw9aaKOfx1ISsPkjuh4=;
        b=m7N655dXREtApFKttX0G4028arbSmwSal0RkViShQbHMYhP5+4gMUYfsV1Ew0P2jv/
         Oo1KopnuHkxAKRyq6IehN8GNUa0bm9KeiBXb20EUj9/zA3esLLsPLABck/YAYasStGGN
         O9i/fQjuVvXZO+0xYtJRao3DV6CCHbFnGQMTM6ACAzQNDelgywRi28o8t5JY13/jc8xt
         6GsJ37+KP68fsr1ppacZuKJkvTFjHVp+CGdJPYbsdw5SYVCcdwyTNt+1bSpUG+jCsKMs
         3FwHm4Oo0p8SXS3ZH4E4svl6OQwat3sn/0BvMRIdKqsPCa5GgADh7duaD3m3AlpqCvQN
         B+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744355555; x=1744960355;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KzShCwppEme7OMOnT5z5FD+rJw9aaKOfx1ISsPkjuh4=;
        b=OfCfcjfROtNwMd1lsKPT3i5VuThS8knabfwsGZUhLobjMF9X4jYTI3LHUCUcerrpnO
         Ne1GxIgl6golKKxee7QEYuY4nQo6ySvmkMZ9B7z3I2q5fJQXjVe0YpIu3k6cEs+TYVc1
         Hc0dP5938qjVyjlccerS5qRAuR298I4IrgpA9IrLOPZxOC/JXwNU/ldU3aNuc5+D/JVn
         HOUfcyx7Tf6u7kDlBW+jEU4IzcT60OVbb1RYqZU2R5bQRK7aHEtSyybF4c56r0RLG3xW
         OHeQ/p35MKuEQ6HslK7/IQ/CbH11tyZEr6+QLOjhWx43ZJeLvIwwBOa7lQyrk2mPFKTx
         Ofzg==
X-Forwarded-Encrypted: i=1; AJvYcCXMpmL0/9lFCl+JgoVHUC/PSkVwEAPuhPGoAUaUtAiLDP8GCzugiKFJjc1GLZwvRUzOB7aB2iFEMeo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZvvdavf8X5neidBE5DCwNHJ1ODWNiuzbDhI9bB+NQZd76eHMh
	RiUO37XQfvSjmERioxFoLtSJuwk6FSOKH7CGHsFAMNwCpWKuHta9
X-Gm-Gg: ASbGncsGjzjCENQyDzz/UVnhglo2WeUtTtgiOsocgbQ2PTXkYSer2Rx2Ad4cnPcdPGI
	tcSSOHNWlqU8YGMz0ETnF4CNqMze/gACclx6GevQswup5Ucjj/bS7h5UEZjbwRzn0l/09+EQhx2
	Xq9XVgNwmHi9fMe/lWQ6+o/DQTLYmoEMTsPUHPa47u/O0BQQ76mJFoPkfXOI7qUArnASMSp2L+m
	5Me9HFSuhr9iQBToJmzjxwPZwJDavwT50AEVi5WQaOc0PWLSyfnvsXIXqwDAo1bVFqVcd2unNV6
	TcdEnVYKL6LP22RemEeOA0IF3VuIkr651w==
X-Google-Smtp-Source: AGHT+IHpSOk8rGIiMZXty/hbuCSKlXyveZLgB4pNTJ04Shha/BPkKtAvaM61qadHeDDYt8o+ld2JZA==
X-Received: by 2002:a17:90b:5245:b0:2ff:784b:ffe with SMTP id 98e67ed59e1d1-3082377c271mr2980340a91.11.1744355555591;
        Fri, 11 Apr 2025 00:12:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 17:12:28 +1000
Message-Id: <D93MFO5IGN4M.2FWKFWQ9G807P@gmail.com>
Cc: "Hugh Dickins" <hughd@google.com>, "Guenter Roeck" <linux@roeck-us.net>,
 "Juergen Gross" <jgross@suse.com>, "Jeremy Fitzhardinge" <jeremy@goop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <kasan-dev@googlegroups.com>, <sparclinux@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-s390@vger.kernel.org>
Subject: Re: [PATCH v1 0/4] mm: Fix apply_to_pte_range() vs lazy MMU mode
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Alexander Gordeev" <agordeev@linux.ibm.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>
X-Mailer: aerc 0.19.0
References: <cover.1744037648.git.agordeev@linux.ibm.com>
In-Reply-To: <cover.1744037648.git.agordeev@linux.ibm.com>

On Tue Apr 8, 2025 at 1:11 AM AEST, Alexander Gordeev wrote:
> Hi All,
>
> This series is an attempt to fix the violation of lazy MMU mode context
> requirement as described for arch_enter_lazy_mmu_mode():
>
>     This mode can only be entered and left under the protection of
>     the page table locks for all page tables which may be modified.
>
> On s390 if I make arch_enter_lazy_mmu_mode() -> preempt_enable() and
> arch_leave_lazy_mmu_mode() -> preempt_disable() I am getting this:
>
>     [  553.332108] preempt_count: 1, expected: 0
>     [  553.332117] no locks held by multipathd/2116.
>     [  553.332128] CPU: 24 PID: 2116 Comm: multipathd Kdump: loaded Taint=
ed:
>     [  553.332139] Hardware name: IBM 3931 A01 701 (LPAR)
>     [  553.332146] Call Trace:
>     [  553.332152]  [<00000000158de23a>] dump_stack_lvl+0xfa/0x150
>     [  553.332167]  [<0000000013e10d12>] __might_resched+0x57a/0x5e8
>     [  553.332178]  [<00000000144eb6c2>] __alloc_pages+0x2ba/0x7c0
>     [  553.332189]  [<00000000144d5cdc>] __get_free_pages+0x2c/0x88
>     [  553.332198]  [<00000000145663f6>] kasan_populate_vmalloc_pte+0x4e/=
0x110
>     [  553.332207]  [<000000001447625c>] apply_to_pte_range+0x164/0x3c8
>     [  553.332218]  [<000000001448125a>] apply_to_pmd_range+0xda/0x318
>     [  553.332226]  [<000000001448181c>] __apply_to_page_range+0x384/0x76=
8
>     [  553.332233]  [<0000000014481c28>] apply_to_page_range+0x28/0x38
>     [  553.332241]  [<00000000145665da>] kasan_populate_vmalloc+0x82/0x98
>     [  553.332249]  [<00000000144c88d0>] alloc_vmap_area+0x590/0x1c90
>     [  553.332257]  [<00000000144ca108>] __get_vm_area_node.constprop.0+0=
x138/0x260
>     [  553.332265]  [<00000000144d17fc>] __vmalloc_node_range+0x134/0x360
>     [  553.332274]  [<0000000013d5dbf2>] alloc_thread_stack_node+0x112/0x=
378
>     [  553.332284]  [<0000000013d62726>] dup_task_struct+0x66/0x430
>     [  553.332293]  [<0000000013d63962>] copy_process+0x432/0x4b80
>     [  553.332302]  [<0000000013d68300>] kernel_clone+0xf0/0x7d0
>     [  553.332311]  [<0000000013d68bd6>] __do_sys_clone+0xae/0xc8
>     [  553.332400]  [<0000000013d68dee>] __s390x_sys_clone+0xd6/0x118
>     [  553.332410]  [<0000000013c9d34c>] do_syscall+0x22c/0x328
>     [  553.332419]  [<00000000158e7366>] __do_syscall+0xce/0xf0
>     [  553.332428]  [<0000000015913260>] system_call+0x70/0x98
>
> This exposes a KASAN issue fixed with patch 1 and apply_to_pte_range()
> issue fixed with patches 2-3. Patch 4 is a debug improvement on top,
> that could have helped to notice the issue.
>
> Commit b9ef323ea168 ("powerpc/64s: Disable preemption in hash lazy mmu
> mode") looks like powerpc-only fix, yet not entirely conforming to the
> above provided requirement (page tables itself are still not protected).
> If I am not mistaken, xen and sparc are alike.

Huh. powerpc actually has some crazy code in __switch_to() that is
supposed to handle preemption while in lazy mmu mode. So we probably
don't even need to disable preemption, just use the raw per-cpu
accessors (or keep disabling preemption and remove the now dead code
from context switch).

IIRC all this got built up over a long time with some TLB flush
rules changing at the same time, we could probably stay in lazy mmu
mode for a longer time until it was discovered we really need to
flush before dropping the PTL.

ppc64 and sparc I think don't even need lazy mmu mode for kasan (TLBs
do not require flushing) and will function just fine if not in lazy
mode (they just flush one TLB at a time), not sure about xen. We could
actually go the other way and require that archs operate properly when
not in lazy mode (at least for kernel page tables) and avoid it for
apply_to_page_range()?

Thanks,
Nick

