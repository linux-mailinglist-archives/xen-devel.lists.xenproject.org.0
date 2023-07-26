Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB2876347A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 13:04:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570304.892052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOcJU-0005p9-Nl; Wed, 26 Jul 2023 11:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570304.892052; Wed, 26 Jul 2023 11:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOcJU-0005mI-Kg; Wed, 26 Jul 2023 11:04:16 +0000
Received: by outflank-mailman (input) for mailman id 570304;
 Wed, 26 Jul 2023 11:04:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0A2=DM=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qOcJT-0005mC-5m
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 11:04:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27719c83-2ba4-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 13:04:13 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.163.26.92])
 by support.bugseng.com (Postfix) with ESMTPSA id C98084EE0738;
 Wed, 26 Jul 2023 13:04:11 +0200 (CEST)
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
X-Inumbo-ID: 27719c83-2ba4-11ee-b242-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 0/4] xen: address violations of MISRA C:2012 Rule 7.2
Date: Wed, 26 Jul 2023 13:03:35 +0200
Message-Id: <cover.1690368810.git.simone.ballarin@bugseng.com>
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
adding the 'U' suffix to integers literals with unsigned type and also to other
literals used in the same contexts or near violations, when their positive
nature is immediately clear. The latter changes are done for the sake of
uniformity.

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
 xen/arch/x86/hvm/stdvga.c                    |  50 +++---
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
 xen/arch/x86/include/asm/msr-index.h         | 180 +++++++++----------
 xen/arch/x86/include/asm/pci.h               |   8 +-
 xen/arch/x86/include/asm/x86-defns.h         |  24 +--
 xen/arch/x86/percpu.c                        |   2 +-
 xen/arch/x86/psr.c                           |   2 +-
 xen/arch/x86/spec_ctrl.c                     |   8 +-
 xen/arch/x86/x86_64/pci.c                    |   2 +-
 xen/arch/x86/x86_emulate/x86_emulate.h       |   2 +-
 xen/drivers/vpci/msi.c                       |   2 +-
 xen/drivers/vpci/msix.c                      |   2 +-
 xen/drivers/vpci/vpci.c                      |   6 +-
 xen/lib/x86/cpuid.c                          |   8 +-
 xen/lib/x86/policy.c                         |   2 +-
 36 files changed, 255 insertions(+), 255 deletions(-)

-- 
2.34.1


