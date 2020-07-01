Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D81210A14
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 13:07:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqaaA-0006no-RU; Wed, 01 Jul 2020 11:07:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T2yc=AM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jqaaA-0006nj-74
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 11:07:14 +0000
X-Inumbo-ID: 040de5bc-bb8b-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 040de5bc-bb8b-11ea-bca7-bc764e2007e4;
 Wed, 01 Jul 2020 11:07:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C3C48AC79;
 Wed,  1 Jul 2020 11:07:12 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Subject: [PATCH v2 0/4] Remove 32-bit Xen PV guest support
Date: Wed,  1 Jul 2020 13:06:46 +0200
Message-Id: <20200701110650.16172-1-jgross@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Deep Shah <sdeep@vmware.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The long term plan has been to replace Xen PV guests by PVH. The first
victim of that plan are now 32-bit PV guests, as those are used only
rather seldom these days. Xen on x86 requires 64-bit support and with
Grub2 now supporting PVH officially since version 2.04 there is no
need to keep 32-bit PV guest support alive in the Linux kernel.
Additionally Meltdown mitigation is not available in the kernel running
as 32-bit PV guest, so dropping this mode makes sense from security
point of view, too.

Changes in V2:
- rebase to 5.8 kernel
- addressed comments to V1
- new patches 3 and 4

Juergen Gross (4):
  x86/xen: remove 32-bit Xen PV guest support
  x86/paravirt: remove 32-bit support from PARAVIRT_XXL
  x86/paravirt: cleanup paravirt macros
  x86/paravirt: use CONFIG_PARAVIRT_XXL instead of CONFIG_PARAVIRT

 arch/x86/entry/entry_32.S                   | 109 +------
 arch/x86/entry/entry_64.S                   |   4 +-
 arch/x86/entry/vdso/vdso32/vclock_gettime.c |   1 +
 arch/x86/include/asm/fixmap.h               |   2 +-
 arch/x86/include/asm/paravirt.h             | 107 +-----
 arch/x86/include/asm/paravirt_types.h       |  21 --
 arch/x86/include/asm/pgtable-3level_types.h |   5 -
 arch/x86/include/asm/proto.h                |   2 +-
 arch/x86/include/asm/required-features.h    |   2 +-
 arch/x86/include/asm/segment.h              |   6 +-
 arch/x86/kernel/cpu/common.c                |   8 -
 arch/x86/kernel/head_32.S                   |  31 --
 arch/x86/kernel/kprobes/core.c              |   1 -
 arch/x86/kernel/kprobes/opt.c               |   1 -
 arch/x86/kernel/paravirt.c                  |  18 --
 arch/x86/kernel/paravirt_patch.c            |  17 -
 arch/x86/xen/Kconfig                        |   3 +-
 arch/x86/xen/Makefile                       |   3 +-
 arch/x86/xen/apic.c                         |  17 -
 arch/x86/xen/enlighten_pv.c                 |  52 +--
 arch/x86/xen/mmu_pv.c                       | 340 +++-----------------
 arch/x86/xen/p2m.c                          |   6 +-
 arch/x86/xen/setup.c                        |  35 +-
 arch/x86/xen/smp_pv.c                       |  18 --
 arch/x86/xen/xen-asm.S                      | 182 ++++++++++-
 arch/x86/xen/xen-asm_32.S                   | 185 -----------
 arch/x86/xen/xen-asm_64.S                   | 181 -----------
 arch/x86/xen/xen-head.S                     |   6 -
 drivers/xen/Kconfig                         |   4 +-
 29 files changed, 232 insertions(+), 1135 deletions(-)
 delete mode 100644 arch/x86/xen/xen-asm_32.S
 delete mode 100644 arch/x86/xen/xen-asm_64.S

-- 
2.26.2


