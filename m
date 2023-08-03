Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC2C76E586
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 12:23:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576176.902031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVU0-0004UI-1V; Thu, 03 Aug 2023 10:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576176.902031; Thu, 03 Aug 2023 10:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVTz-0004Ry-UH; Thu, 03 Aug 2023 10:23:03 +0000
Received: by outflank-mailman (input) for mailman id 576176;
 Thu, 03 Aug 2023 10:23:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYgs=DU=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qRVTy-0004Rp-Du
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 10:23:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9381d91-31e7-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 12:23:01 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 97D464EE0737;
 Thu,  3 Aug 2023 12:22:59 +0200 (CEST)
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
X-Inumbo-ID: b9381d91-31e7-11ee-b268-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Paul Durrant <paul@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [XEN PATCH 00/13] xen: address violations of MISRA C:2012 Rule 7.3
Date: Thu,  3 Aug 2023 12:22:15 +0200
Message-Id: <cover.1691053438.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to address some violations ofMISRA C:2012 Rule 7.3:
"The lowercase character 'l' shall not be used in a literal suffix".

This patch replaces "l" suffixes with "L", to comply with the rule.
If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.

Gianluca Luparini (13):
  AMD/IOMMU: address violations of MISRA C:2012 Rule 7.3
  x86/svm: address violations of MISRA C:2012 Rule 7.3
  xen/arm: address violations of MISRA C:2012 Rule 7.3
  x86/IOMMU: address violations of MISRA C:2012 Rule 7.3
  xen/ioreq: address violations of MISRA C:2012 Rule 7.3
  xen/mem_access: address violations of MISRA C:2012 Rule 7.3
  xen/vpci: address violations of MISRA C:2012 Rule 7.3
  xen/hvm: address violations of MISRA C:2012 Rule 7.3
  x86/mm: address violations of MISRA C:2012 Rule 7.3
  x86/viridian: address violations of MISRA C:2012 Rule 7.3
  xen/x86: address violations of MISRA C:2012 Rule 7.3
  xen/common: address violations of MISRA C:2012 Rule 7.3
  xen: address violations of MISRA C:2012 Rule 7.3

 xen/arch/arm/include/asm/processor.h        |  6 +++---
 xen/arch/arm/vtimer.c                       |  2 +-
 xen/arch/x86/cpu-policy.c                   |  4 ++--
 xen/arch/x86/dom0_build.c                   |  2 +-
 xen/arch/x86/e820.c                         |  2 +-
 xen/arch/x86/hpet.c                         |  2 +-
 xen/arch/x86/hvm/emulate.c                  |  2 +-
 xen/arch/x86/hvm/hpet.c                     |  6 +++---
 xen/arch/x86/hvm/hvm.c                      |  6 +++---
 xen/arch/x86/hvm/io.c                       |  2 +-
 xen/arch/x86/hvm/stdvga.c                   |  2 +-
 xen/arch/x86/hvm/svm/svm.c                  |  4 ++--
 xen/arch/x86/hvm/viridian/synic.c           |  2 +-
 xen/arch/x86/hvm/viridian/time.c            | 10 +++++-----
 xen/arch/x86/include/asm/apicdef.h          |  4 ++--
 xen/arch/x86/include/asm/debugreg.h         | 16 ++++++++--------
 xen/arch/x86/include/asm/guest_pt.h         | 16 ++++++++--------
 xen/arch/x86/include/asm/pv/domain.h        |  2 +-
 xen/arch/x86/mm.c                           |  4 ++--
 xen/arch/x86/mm/p2m-pt.c                    |  6 +++---
 xen/arch/x86/mm/p2m.c                       | 20 ++++++++++----------
 xen/arch/x86/mm/physmap.c                   |  4 ++--
 xen/arch/x86/msr.c                          |  2 +-
 xen/arch/x86/nmi.c                          |  2 +-
 xen/arch/x86/psr.c                          |  8 ++++----
 xen/arch/x86/spec_ctrl.c                    |  6 +++---
 xen/arch/x86/x86_64/mm.c                    |  4 ++--
 xen/arch/x86/xstate.c                       |  2 +-
 xen/common/ioreq.c                          |  2 +-
 xen/common/mem_access.c                     |  4 ++--
 xen/common/page_alloc.c                     |  6 +++---
 xen/common/rangeset.c                       |  2 +-
 xen/common/softirq.c                        |  8 ++++----
 xen/common/vsprintf.c                       |  2 +-
 xen/drivers/passthrough/amd/iommu_guest.c   |  2 +-
 xen/drivers/passthrough/amd/iommu_map.c     |  2 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  2 +-
 xen/drivers/passthrough/x86/iommu.c         |  8 ++++----
 xen/drivers/vpci/header.c                   |  2 +-
 xen/drivers/vpci/msi.c                      |  2 +-
 xen/drivers/vpci/msix.c                     | 10 +++++-----
 xen/include/xen/bitops.h                    |  8 ++++----
 xen/include/xen/ioreq.h                     |  2 +-
 xen/include/xen/tasklet.h                   |  4 ++--
 xen/include/xen/time.h                      |  4 ++--
 xen/lib/x86/cpuid.c                         |  4 ++--
 46 files changed, 111 insertions(+), 111 deletions(-)

-- 
2.34.1


