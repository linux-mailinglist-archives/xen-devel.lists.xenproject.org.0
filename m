Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDCC315946
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 23:21:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83449.155356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9bNm-0000kt-Ma; Tue, 09 Feb 2021 22:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83449.155356; Tue, 09 Feb 2021 22:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9bNm-0000kU-JN; Tue, 09 Feb 2021 22:21:18 +0000
Received: by outflank-mailman (input) for mailman id 83449;
 Tue, 09 Feb 2021 22:21:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1l9bNl-0000k6-2v
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 22:21:17 +0000
Received: from mail-pf1-x435.google.com (unknown [2607:f8b0:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9dc70a99-fe7e-4d42-bda6-f1e1e43f412c;
 Tue, 09 Feb 2021 22:21:15 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id t29so12793874pfg.11
 for <xen-devel@lists.xenproject.org>; Tue, 09 Feb 2021 14:21:15 -0800 (PST)
Received: from sc2-haas01-esx0118.eng.vmware.com ([66.170.99.1])
 by smtp.gmail.com with ESMTPSA id v9sm58601pju.33.2021.02.09.14.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 14:21:13 -0800 (PST)
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
X-Inumbo-ID: 9dc70a99-fe7e-4d42-bda6-f1e1e43f412c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HjSiRe9FHCVaGCF52pKJiLElvBu049No/wtLMDAICXE=;
        b=ZPccq1cXTR6T3lt5wME8WuvLAa5mZge5Mw8wXRyQz0ElTK2dM1mAnAYXOysMgOvFTF
         M1Xw0/LEh9dW5Qkrenqg0x0Lv+vYZsYEyKugTwXm+DqKUU9BR7UzcXPZmO9XadLkecQv
         ApW9qLmbiPGG6qIUhUfOsDjkvmBBT3d1bIuWRorvesu1dHc8b0GYSrflEf1HFbYKj3Ps
         33QK4jBS3ZO5kHS9hN+Jy1KJAsWXHDkIkgvZxzA1ZM4RRCcfTprdS7m3wectpcSsxT5g
         gsp5xUecBmhB2lJcNcmkxhi49e7wSClMUrfkE5Gmy18NkLMWcoXbkUDEDX4QE6sQ9x5B
         IO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HjSiRe9FHCVaGCF52pKJiLElvBu049No/wtLMDAICXE=;
        b=OQSl+fzNLuOpPgz9/JjDmEf58dw18DjOmum3B4/NoJtKVzwgpXsARqWj01NBYtDvr0
         8UarNOWyW8DdVZcA05hGQKiokrWS//Cp9XvuPerw0p1zvr2SQSUOcGQe7C+FOJTvcnoS
         tqCE/MMQWaS171gk4EGeczk5tYJTEah6Ien7F2PDaNfof/IYMma1a2yMSkFS6u1GFahG
         HBCDIg6eQVRTvvyhgIpXDOBuZnfYq7fpDFd6o49SuyKXqQ8ewrTsO+0QWZp123UTnDi+
         UGKj+rqp7l9JheFwEbLk6LSGFV/0Vpw3dS43bqpUGXeZO8UWt0X9MHjQS9AL+vkiKwlC
         MJtg==
X-Gm-Message-State: AOAM532jGkbMuqIeLUGm97DqhG0vuNt4F+YCznY3JGilUTBfzJTcjgV1
	1+ZvmdTfu2PIIV8DetofyPQ=
X-Google-Smtp-Source: ABdhPJz3LfnWDYq7JINpREZUWfE+W5NwAF3qi+h7lRxojWAtxXFLj2+kpLvcsoQwwfGFKhWJBLAhPg==
X-Received: by 2002:a63:545f:: with SMTP id e31mr136017pgm.212.1612909274776;
        Tue, 09 Feb 2021 14:21:14 -0800 (PST)
From: Nadav Amit <nadav.amit@gmail.com>
X-Google-Original-From: Nadav Amit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Nadav Amit <namit@vmware.com>,
	Borislav Petkov <bp@alien8.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Rik van Riel <riel@surriel.com>,
	Sasha Levin <sashal@kernel.org>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	kvm@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v5 0/8] x86/tlb: Concurrent TLB flushes
Date: Tue,  9 Feb 2021 14:16:45 -0800
Message-Id: <20210209221653.614098-1-namit@vmware.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nadav Amit <namit@vmware.com>

This is a respin of a rebased version of an old series, which I did not
follow, as I was preoccupied with personal issues (sorry).

The series improve TLB shootdown by flushing the local TLB concurrently
with remote TLBs, overlapping the IPI delivery time with the local
flush. Performance numbers can be found in the previous version [1].

The patches are essentially the same, but rebasing on the last version
required some changes. I left the reviewed-by tags - if anyone considers
it inappropriate, please let me know (and you have my apology).

[1] https://lore.kernel.org/lkml/20190823224153.15223-1-namit@vmware.com/

v4 -> v5:
* Rebase on 5.11
* Move concurrent smp logic to smp_call_function_many_cond() 
* Remove SGI-UV patch which is not needed anymore

v3 -> v4:
* Merge flush_tlb_func_local and flush_tlb_func_remote() [Peter]
* Prevent preemption on_each_cpu(). It is not needed, but it prevents
  concerns. [Peter/tglx]
* Adding acked-, review-by tags

v2 -> v3:
* Open-code the remote/local-flush decision code [Andy]
* Fix hyper-v, Xen implementations [Andrew]
* Fix redundant TLB flushes.

v1 -> v2:
* Removing the patches that Thomas took [tglx]
* Adding hyper-v, Xen compile-tested implementations [Dave]
* Removing UV [Andy]
* Adding lazy optimization, removing inline keyword [Dave]
* Restructuring patch-set

RFCv2 -> v1:
* Fix comment on flush_tlb_multi [Juergen]
* Removing async invalidation optimizations [Andy]
* Adding KVM support [Paolo]

Cc: Andy Lutomirski <luto@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: Sasha Levin <sashal@kernel.org>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: kvm@vger.kernel.org
Cc: linux-hyperv@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org
Cc: x86@kernel.org
Cc: xen-devel@lists.xenproject.org

Nadav Amit (8):
  smp: Run functions concurrently in smp_call_function_many_cond()
  x86/mm/tlb: Unify flush_tlb_func_local() and flush_tlb_func_remote()
  x86/mm/tlb: Open-code on_each_cpu_cond_mask() for tlb_is_not_lazy()
  x86/mm/tlb: Flush remote and local TLBs concurrently
  x86/mm/tlb: Privatize cpu_tlbstate
  x86/mm/tlb: Do not make is_lazy dirty for no reason
  cpumask: Mark functions as pure
  x86/mm/tlb: Remove unnecessary uses of the inline keyword

 arch/x86/hyperv/mmu.c                 |  10 +-
 arch/x86/include/asm/paravirt.h       |   6 +-
 arch/x86/include/asm/paravirt_types.h |   4 +-
 arch/x86/include/asm/tlbflush.h       |  48 +++----
 arch/x86/include/asm/trace/hyperv.h   |   2 +-
 arch/x86/kernel/alternative.c         |   2 +-
 arch/x86/kernel/kvm.c                 |  11 +-
 arch/x86/mm/init.c                    |   2 +-
 arch/x86/mm/tlb.c                     | 177 +++++++++++++++-----------
 arch/x86/xen/mmu_pv.c                 |  11 +-
 include/linux/cpumask.h               |   6 +-
 include/trace/events/xen.h            |   2 +-
 kernel/smp.c                          | 148 +++++++++++----------
 13 files changed, 242 insertions(+), 187 deletions(-)

-- 
2.25.1


