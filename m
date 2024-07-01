Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACD691DD97
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 13:11:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751471.1159440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOEw9-0002N8-7v; Mon, 01 Jul 2024 11:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751471.1159440; Mon, 01 Jul 2024 11:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOEw9-0002K7-4Q; Mon, 01 Jul 2024 11:11:09 +0000
Received: by outflank-mailman (input) for mailman id 751471;
 Mon, 01 Jul 2024 11:11:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FOPt=OB=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sOEw8-0002K1-DF
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 11:11:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c74d8ee-379a-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 13:11:06 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 58E974EE0746;
 Mon,  1 Jul 2024 13:11:01 +0200 (CEST)
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
X-Inumbo-ID: 9c74d8ee-379a-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 00/17] xen: address violation of MISRA C:2012 Directive 4.10
Date: Mon,  1 Jul 2024 13:10:18 +0200
Message-Id: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Xen sources contain violations of MISRA C:2012 Directive 4.10 whose headline states:
"Precautions shall be taken in order to prevent the contents of a header file
being included more than once".

Following V2 and V3, here are all the rules that have been applied:
- private headers -> <dir>_<filename>_H
- asm-generic headers -> ASM_GENERIC_<filename>_H
- arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
- include/generated/<subdir>/<filename>.h-> GENERATED_<subdir>_<filename>_H
- arch/<architecture>/include/generated/asm/<filename>.h-> <arch>_GENERATED_ASM_<name>_H

Links to the discussions:
https://lists.xenproject.org/archives/html/xen-devel/2023-09/msg01928.html
https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg01784.html
https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg02073.html

Furthermore, the violations arising from the autogenerated header files
include/xen/compile.h and xen/hypercall-defs.h are addressed.

Patch 17/17 adds a new section for CODING_STYLE with the aforementioned naming
conventions. 
this is just a draft, please give us a feedback on whether something similar may
be appreciated. 

Changes in v4:
 add/amend inclusion guards to address violations of the Directive and the new naming convention.
 drop teh XEN_ prefix when needed, according to the feedback received.
 add inclusion guard naming convention section in CODING_STYLE

Changes in v3:
Add/amend inclusion guards to address violations of the Directive and the new naming convention.
Remove trailing underscores.
Modify creation rule for asm-offsets.h to conform to the new standard and to not generate conflicting
guards between architectures (which is a violation of the Directive).

Alessandro Zucchelli (2):
  xen/build: address violation of MISRA C Directive 4.10
  CODING_STYLE: Add a section on header guards naming conventions

Maria Celeste Cesario (3):
  xen/arm: address violations of MISRA C:2012 Directive 4.10
  xen: address violations of MISRA C:2012 Directive 4.10
  xen/x86: rename inclusion guards for consistency

Nicola Vetrini (2):
  xen: add deviations for MISRA C 2012 Dir D4.10
  xen: add SAF deviation for MISRA C Dir 4.10

Simone Ballarin (10):
  misra: add deviation for headers that explicitly avoid guards
  misra: modify deviations for empty and generated headers
  misra: add deviations for direct inclusion guards
  xen/arm: address violations of MISRA C:2012 Directive 4.10
  xen/x86: address violations of MISRA C:2012 Directive 4.10
  x86/EFI: address violations of MISRA C:2012 Directive 4.10
  xen/common: address violations of MISRA C:2012 Directive 4.10
  xen/efi: address violations of MISRA C:2012 Directive 4.10
  xen: address violations of MISRA C:2012 Directive 4.10
  x86/asm: address violations of MISRA C:2012 Directive 4.10

 CODING_STYLE                                  | 19 +++++++++
 .../eclair_analysis/ECLAIR/deviations.ecl     | 12 +++---
 docs/misra/deviations.rst                     |  7 ++++
 docs/misra/safe.json                          | 40 +++++++++++++++++++
 xen/arch/arm/efi/efi-boot.h                   |  6 +++
 xen/arch/arm/efi/runtime.h                    |  1 +
 xen/arch/arm/include/asm/domain.h             |  6 +--
 xen/arch/arm/include/asm/efibind.h            |  5 +++
 xen/arch/arm/include/asm/event.h              |  6 +--
 xen/arch/arm/include/asm/grant_table.h        |  6 +--
 xen/arch/arm/include/asm/hypercall.h          |  1 +
 xen/arch/arm/include/asm/io.h                 |  6 +--
 xen/arch/arm/include/asm/irq.h                |  6 +--
 xen/arch/arm/include/asm/smp.h                |  6 +--
 xen/arch/arm/include/asm/spinlock.h           |  6 +--
 xen/arch/arm/include/asm/system.h             |  6 +--
 xen/arch/x86/Makefile                         |  9 +++--
 xen/arch/x86/cpu/cpu.h                        |  5 +++
 xen/arch/x86/efi/efi-boot.h                   |  7 ++++
 xen/arch/x86/efi/runtime.h                    |  5 +++
 xen/arch/x86/include/asm/compat.h             |  5 +++
 xen/arch/x86/include/asm/cpufeatures.h        |  5 +--
 xen/arch/x86/include/asm/domain.h             |  6 +--
 xen/arch/x86/include/asm/efibind.h            |  5 +++
 xen/arch/x86/include/asm/event.h              |  6 +--
 xen/arch/x86/include/asm/grant_table.h        |  6 +--
 xen/arch/x86/include/asm/hypercall.h          |  1 +
 xen/arch/x86/include/asm/io.h                 |  6 +--
 xen/arch/x86/include/asm/irq.h                |  6 +--
 xen/arch/x86/include/asm/smp.h                |  6 +--
 xen/arch/x86/include/asm/spinlock.h           |  6 +--
 xen/arch/x86/include/asm/system.h             |  6 +--
 xen/arch/x86/x86_64/mmconfig.h                |  5 +++
 xen/arch/x86/x86_emulate/private.h            |  5 +++
 xen/build.mk                                  | 13 ++++--
 xen/common/decompress.h                       |  5 +++
 xen/common/efi/efi.h                          |  5 +++
 xen/common/event_channel.h                    |  5 +++
 xen/include/Makefile                          | 18 +++++++--
 xen/include/public/arch-x86/cpufeatureset.h   |  1 +
 xen/include/public/arch-x86/xen.h             |  1 +
 xen/include/public/errno.h                    |  1 +
 xen/include/xen/err.h                         |  8 ++--
 xen/include/xen/pci_ids.h                     |  5 +++
 xen/include/xen/softirq.h                     |  8 ++--
 xen/include/xen/vmap.h                        |  8 ++--
 xen/scripts/Makefile.asm-generic              |  8 +++-
 47 files changed, 244 insertions(+), 81 deletions(-)

-- 
2.34.1


