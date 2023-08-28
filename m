Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B41D78AE60
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 13:04:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591450.923854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaa24-0001Jg-0B; Mon, 28 Aug 2023 11:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591450.923854; Mon, 28 Aug 2023 11:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaa23-0001Hz-TY; Mon, 28 Aug 2023 11:03:43 +0000
Received: by outflank-mailman (input) for mailman id 591450;
 Mon, 28 Aug 2023 11:03:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ5s=EN=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qaa22-0001Hn-5d
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 11:03:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b0e1bd2-4592-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 13:03:39 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 97F544EE0738;
 Mon, 28 Aug 2023 13:03:38 +0200 (CEST)
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
X-Inumbo-ID: 8b0e1bd2-4592-11ee-9b0c-b553b5be7939
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
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [XEN PATCH v5 0/4] xen: address violations of MISRA C:2012 Rule 7.2
Date: Mon, 28 Aug 2023 13:02:58 +0200
Message-Id: <cover.1693219887.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Only patch 4/4 contains real changes, patch 2/4 just adds an "Acked-by",
the others patches (1/4 and 3/4) are untouched.

Gianluca Luparini (4):
  x86/vmx: address violations of MISRA C:2012 Rule 7.2
  xen/vpci: address violations of MISRA C:2012 Rule 7.2
  x86/viridian: address violations of MISRA C:2012 Rule 7.2
  xen/x86: address violations of MISRA C:2012 Rule 7.2

 xen/arch/x86/apic.c                          |   2 +-
 xen/arch/x86/cpu-policy.c                    |  18 +-
 xen/arch/x86/cpu/mcheck/mce-apei.c           |   4 +-
 xen/arch/x86/cpu/vpmu_intel.c                |   2 +-
 xen/arch/x86/cpuid.c                         |   8 +-
 xen/arch/x86/efi/efi-boot.h                  |   6 +-
 xen/arch/x86/extable.c                       |   2 +-
 xen/arch/x86/hvm/hypercall.c                 |   2 +-
 xen/arch/x86/hvm/pmtimer.c                   |   4 +-
 xen/arch/x86/hvm/stdvga.c                    |  49 ++---
 xen/arch/x86/hvm/viridian/viridian.c         |   2 +-
 xen/arch/x86/hvm/vlapic.c                    |   6 +-
 xen/arch/x86/hvm/vmx/vmcs.c                  |   6 +-
 xen/arch/x86/hvm/vmx/vvmx.c                  |   8 +-
 xen/arch/x86/include/asm/apicdef.h           |   2 +-
 xen/arch/x86/include/asm/config.h            |   2 +-
 xen/arch/x86/include/asm/guest/hyperv-tlfs.h |  28 +--
 xen/arch/x86/include/asm/hpet.h              |   2 +-
 xen/arch/x86/include/asm/hvm/trace.h         |   4 +-
 xen/arch/x86/include/asm/hvm/vioapic.h       |   2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h      |  84 ++++-----
 xen/arch/x86/include/asm/hvm/vmx/vmx.h       |  16 +-
 xen/arch/x86/include/asm/msi.h               |   2 +-
 xen/arch/x86/include/asm/msr-index.h         | 182 +++++++++----------
 xen/arch/x86/include/asm/pci.h               |   8 +-
 xen/arch/x86/include/asm/x86-defns.h         |  24 +--
 xen/arch/x86/percpu.c                        |   2 +-
 xen/arch/x86/psr.c                           |   2 +-
 xen/arch/x86/spec_ctrl.c                     |  12 +-
 xen/arch/x86/x86_64/pci.c                    |   2 +-
 xen/arch/x86/x86_emulate/x86_emulate.h       |   2 +-
 xen/drivers/vpci/msi.c                       |   2 +-
 xen/drivers/vpci/msix.c                      |   2 +-
 xen/drivers/vpci/vpci.c                      |   6 +-
 xen/lib/x86/cpuid.c                          |   8 +-
 xen/lib/x86/policy.c                         |   2 +-
 36 files changed, 258 insertions(+), 257 deletions(-)

-- 
2.34.1


