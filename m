Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F34779D520
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 17:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600546.936242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg5Ue-00061Q-6n; Tue, 12 Sep 2023 15:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600546.936242; Tue, 12 Sep 2023 15:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg5Ue-0005yM-40; Tue, 12 Sep 2023 15:40:00 +0000
Received: by outflank-mailman (input) for mailman id 600546;
 Tue, 12 Sep 2023 15:39:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3Pz=E4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qg5Uc-0005yG-7n
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 15:39:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f50888a-5182-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 17:39:55 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id E3F5D4EE0749;
 Tue, 12 Sep 2023 17:39:54 +0200 (CEST)
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
X-Inumbo-ID: 9f50888a-5182-11ee-9b0d-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v6 0/7] xen/x86: address violations of MISRA C:2012 Rule 7.2
Date: Tue, 12 Sep 2023 17:38:57 +0200
Message-Id: <cover.1694532795.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline
states:
"A 'u' or 'U' suffix shall be applied to all integer constants that are
represented in an unsigned type".

These violations are caused by the missing "u" or "U" suffix in unsigned
integer constants, such as:

xen/arch/x86/hvm/hypercall.c:132.17-132.26
if ( (eax & 0x80000000) && is_viridian_domain(currd) )

If a rule is not met, changes are needed in order to achieve compliance.
The patches in this series achieve compliance for MISRA C:2012 Rule 7.2 by
adding the 'U' suffix to integers literals with unsigned type and also to
other
literals used in the same contexts or near violations, when their positive
nature is immediately clear. The latter changes are done for the sake of
uniformity.

This series splits "xen/x86: address violations of MISRA C:2012 Rule 7.2 (v5)"
in several patches, and fixes some issues in v5.

Gianluca Luparini (1):
  x86/vmx: address violations of MISRA C:2012 Rule 7.2

Simone Ballarin (6):
  x86/hvm: address violations of MISRA C:2012 Rule 7.2
  x86/asm: address violations of MISRA C:2012 Rule 7.2
  xen/lib: address violations of MISRA C:2012 Rule 7.2
  xen/x86: address violations of MISRA C:2012 Rule 7.2
  xen/mcheck: address violations of MISRA C:2012 Rule 7.2
  x86/efi: address violations of MISRA C:2012 Rule 7.2

 xen/arch/x86/apic.c                     |   2 +-
 xen/arch/x86/cpu-policy.c               |  18 +--
 xen/arch/x86/cpu/mcheck/mce-apei.c      |   4 +-
 xen/arch/x86/cpu/vpmu_intel.c           |   2 +-
 xen/arch/x86/cpuid.c                    |   8 +-
 xen/arch/x86/efi/efi-boot.h             |   6 +-
 xen/arch/x86/extable.c                  |   2 +-
 xen/arch/x86/hvm/hypercall.c            |   2 +-
 xen/arch/x86/hvm/pmtimer.c              |   4 +-
 xen/arch/x86/hvm/stdvga.c               |  32 ++---
 xen/arch/x86/hvm/vlapic.c               |   6 +-
 xen/arch/x86/hvm/vmx/vmcs.c             |   6 +-
 xen/arch/x86/hvm/vmx/vvmx.c             |   8 +-
 xen/arch/x86/include/asm/apicdef.h      |   2 +-
 xen/arch/x86/include/asm/config.h       |   2 +-
 xen/arch/x86/include/asm/hpet.h         |   2 +-
 xen/arch/x86/include/asm/hvm/trace.h    |   4 +-
 xen/arch/x86/include/asm/hvm/vioapic.h  |   2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  84 +++++------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  16 +--
 xen/arch/x86/include/asm/msi.h          |   2 +-
 xen/arch/x86/include/asm/msr-index.h    | 182 ++++++++++++------------
 xen/arch/x86/include/asm/pci.h          |   8 +-
 xen/arch/x86/include/asm/x86-defns.h    |  22 +--
 xen/arch/x86/percpu.c                   |   2 +-
 xen/arch/x86/psr.c                      |   2 +-
 xen/arch/x86/spec_ctrl.c                |  12 +-
 xen/lib/x86/cpuid.c                     |   8 +-
 xen/lib/x86/policy.c                    |   2 +-
 29 files changed, 226 insertions(+), 226 deletions(-)

-- 
2.34.1


