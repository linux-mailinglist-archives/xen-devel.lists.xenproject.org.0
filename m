Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B970632079D
	for <lists+xen-devel@lfdr.de>; Sun, 21 Feb 2021 00:22:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87365.164532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDbZy-0005ho-AN; Sat, 20 Feb 2021 23:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87365.164532; Sat, 20 Feb 2021 23:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDbZy-0005hP-7G; Sat, 20 Feb 2021 23:22:26 +0000
Received: by outflank-mailman (input) for mailman id 87365;
 Sat, 20 Feb 2021 23:22:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1lDbZw-0005hK-91
 for xen-devel@lists.xenproject.org; Sat, 20 Feb 2021 23:22:24 +0000
Received: from mail-pg1-x532.google.com (unknown [2607:f8b0:4864:20::532])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e67292e3-7505-40b0-a2bb-4595ec173f73;
 Sat, 20 Feb 2021 23:22:23 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id m2so7780988pgq.5
 for <xen-devel@lists.xenproject.org>; Sat, 20 Feb 2021 15:22:23 -0800 (PST)
Received: from sc2-haas01-esx0118.eng.vmware.com ([66.170.99.1])
 by smtp.gmail.com with ESMTPSA id 4sm13171538pjc.23.2021.02.20.15.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 15:22:21 -0800 (PST)
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
X-Inumbo-ID: e67292e3-7505-40b0-a2bb-4595ec173f73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ep1/hKudadrnwSmy7i9Qe1zqNMv0dz/lqPo/OEzQBLY=;
        b=Y5+H14gHGZgi0CNqllBjsnLBOhgoLpbYiHYC+nT+ktigN+4Fl8meG6ozXsst06ueyg
         FvbGHjyqEVyTHPB3Zp/v5zJBgju0J3MTawqo26iPtMIljoyQw5J1tDi3JCN/LxouS/67
         klSfhyjA0WlAiqToMlFX0eaeULuKmwtYr35j93DM4SArIGeRTKUvjtZCTmu8pQtz95mc
         zKlmH9HYQzFlX11KOMI08PJmn+exU7ZbXRN94aN7hiSJOXTCbgGEPd/DA5A9MX4Ou19E
         nctzTNhjKFOM2GpCZEVJiLc58qMaRY5BfZIfIevPc9WwHjjM/vaTFeQkkKNfQuiwZ549
         HuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ep1/hKudadrnwSmy7i9Qe1zqNMv0dz/lqPo/OEzQBLY=;
        b=CjJTn8wNBhUk68nIj4j8Y3SGAf/mXrI2CsEIWTnXv0OKdsO3LEQH2rP9TLXYTf3xqN
         jF3LsbekDuWV26oId5sxGdscBfUHE7AN++qOzNRAnzl2hRSSj71NtGKMEht1qV/tcNA5
         hk3d2F06yGS0h17CnygChHGwgNZV8OxjKashIFsfUfgYEotUphiE4LP5lwGU2m7WXgLi
         G0eh1pus3mdk6eMCC8ZjzpWzuelyhEBnNtVCP1o6/MjhOEHpaVk6b2Wta0tEhfYHM/lD
         H9wDr/6lrPUsAgjwg/Td5raoSAuE7iHkH3HBcDWoWzaTpuJ14bG0UWruP8lxAZvEgeHj
         NHuQ==
X-Gm-Message-State: AOAM532FMvxRrj5eLcGkr9V5vT37K/6KQMx9T8+4Fuygzu7xvXgjKz/W
	7v+6rxay7zuK/t9lnCJ6t54=
X-Google-Smtp-Source: ABdhPJxpOmWYOapxv+6DBYdb/cvr1/vWkG8h2RXX9Og2ITBxnK+Xono/2zD2+h9CTxu3Wx35RZTQdA==
X-Received: by 2002:a63:1648:: with SMTP id 8mr14414133pgw.392.1613863342154;
        Sat, 20 Feb 2021 15:22:22 -0800 (PST)
From: Nadav Amit <nadav.amit@gmail.com>
X-Google-Original-From: Nadav Amit
To: linux-kernel@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nadav Amit <namit@vmware.com>,
	Borislav Petkov <bp@alien8.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
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
Subject: [PATCH v6 0/9] x86/tlb: Concurrent TLB flushes
Date: Sat, 20 Feb 2021 15:17:03 -0800
Message-Id: <20210220231712.2475218-1-namit@vmware.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nadav Amit <namit@vmware.com>

The series improves TLB shootdown by flushing the local TLB concurrently
with remote TLBs, overlapping the IPI delivery time with the local
flush. Performance numbers can be found in the previous version [1].

v5 was rebased on 5.11 (long time after v4), and had some bugs and
embarrassing build errors. Peter Zijlstra and Christoph Hellwig had some
comments as well. These issues were addressed (excluding one 82-chars
line that I left). Based on their feedback, an additional patch was also
added to reuse on_each_cpu_cond_mask() code and avoid unnecessary calls
by inlining.

KernelCI showed RCU stalls on arm64, which I could not figure out from
the kernel splat. If this issue persists, I would appreciate it someone
can assist in debugging or at least provide the output when running the
kernel with CONFIG_CSD_LOCK_WAIT_DEBUG=Y.

[1] https://lore.kernel.org/lkml/20190823224153.15223-1-namit@vmware.com/

v5 -> v6:
* Address build warnings due to rebase mistakes
* Reuse code from on_each_cpu_cond_mask() and inline [PeterZ]
* Fix some style issues [Hellwig]

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

Nadav Amit (9):
  smp: Run functions concurrently in smp_call_function_many_cond()
  x86/mm/tlb: Unify flush_tlb_func_local() and flush_tlb_func_remote()
  x86/mm/tlb: Open-code on_each_cpu_cond_mask() for tlb_is_not_lazy()
  x86/mm/tlb: Flush remote and local TLBs concurrently
  x86/mm/tlb: Privatize cpu_tlbstate
  x86/mm/tlb: Do not make is_lazy dirty for no reason
  cpumask: Mark functions as pure
  x86/mm/tlb: Remove unnecessary uses of the inline keyword
  smp: inline on_each_cpu_cond() and on_each_cpu()

 arch/x86/hyperv/mmu.c                 |  10 +-
 arch/x86/include/asm/paravirt.h       |   6 +-
 arch/x86/include/asm/paravirt_types.h |   4 +-
 arch/x86/include/asm/tlbflush.h       |  48 ++++---
 arch/x86/include/asm/trace/hyperv.h   |   2 +-
 arch/x86/kernel/alternative.c         |   2 +-
 arch/x86/kernel/kvm.c                 |  11 +-
 arch/x86/kernel/paravirt.c            |   2 +-
 arch/x86/mm/init.c                    |   2 +-
 arch/x86/mm/tlb.c                     | 176 +++++++++++++----------
 arch/x86/xen/mmu_pv.c                 |  11 +-
 include/linux/cpumask.h               |   6 +-
 include/linux/smp.h                   |  50 +++++--
 include/trace/events/xen.h            |   2 +-
 kernel/smp.c                          | 196 +++++++++++---------------
 15 files changed, 278 insertions(+), 250 deletions(-)

-- 
2.25.1


