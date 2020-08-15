Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC3C2450D9
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 12:07:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6t5O-0007VG-CH; Sat, 15 Aug 2020 10:06:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ceF6=BZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k6t5M-0007V6-ER
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2020 10:06:48 +0000
X-Inumbo-ID: e55ec133-29c4-4c93-9e9b-6f4cca59e64c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e55ec133-29c4-4c93-9e9b-6f4cca59e64c;
 Sat, 15 Aug 2020 10:06:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 01972B042;
 Sat, 15 Aug 2020 10:07:10 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Deep Shah <sdeep@vmware.com>, "VMware, Inc." <pv-drivers@vmware.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v4 0/6] x86/paravirt: cleanup after 32-bit PV removal
Date: Sat, 15 Aug 2020 12:06:35 +0200
Message-Id: <20200815100641.26362-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

A lot of cleanup after removal of 32-bit Xen PV guest support in
paravirt code.

Changes in V4:
- dropped patches 1-3, as already committed
- addressed comments to V3
- added new patches 5+6

Changes in V3:
- addressed comments to V2
- split patch 1 into 2 patches
- new patches 3 and 7

Changes in V2:
- rebase to 5.8 kernel
- addressed comments to V1
- new patches 3 and 4

Juergen Gross (6):
  x86/paravirt: remove 32-bit support from PARAVIRT_XXL
  x86/paravirt: cleanup paravirt macros
  x86/paravirt: use CONFIG_PARAVIRT_XXL instead of CONFIG_PARAVIRT
  x86/entry/32: revert "Fix XEN_PV build dependency"
  x86/paravirt: remove set_pte_at pv-op
  x86/paravirt: avoid needless paravirt step clearing page table entries

 arch/x86/entry/entry_64.S                   |   4 +-
 arch/x86/entry/vdso/vdso32/vclock_gettime.c |   1 +
 arch/x86/include/asm/fixmap.h               |   2 +-
 arch/x86/include/asm/idtentry.h             |   4 +-
 arch/x86/include/asm/paravirt.h             | 151 +++-----------------
 arch/x86/include/asm/paravirt_types.h       |  23 ---
 arch/x86/include/asm/pgtable-3level_types.h |   5 -
 arch/x86/include/asm/pgtable.h              |   7 +-
 arch/x86/include/asm/required-features.h    |   2 +-
 arch/x86/include/asm/segment.h              |   4 -
 arch/x86/kernel/cpu/common.c                |   8 --
 arch/x86/kernel/kprobes/core.c              |   1 -
 arch/x86/kernel/kprobes/opt.c               |   1 -
 arch/x86/kernel/paravirt.c                  |  19 ---
 arch/x86/kernel/paravirt_patch.c            |  17 ---
 arch/x86/xen/enlighten_pv.c                 |   6 -
 arch/x86/xen/mmu_pv.c                       |   8 --
 include/trace/events/xen.h                  |  20 ---
 18 files changed, 27 insertions(+), 256 deletions(-)

-- 
2.26.2


