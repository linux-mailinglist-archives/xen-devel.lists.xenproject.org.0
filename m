Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E198877C1E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 10:00:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691260.1077035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW1-0006lZ-7M; Mon, 11 Mar 2024 09:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691260.1077035; Mon, 11 Mar 2024 09:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW1-0006j0-4G; Mon, 11 Mar 2024 09:00:13 +0000
Received: by outflank-mailman (input) for mailman id 691260;
 Mon, 11 Mar 2024 09:00:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWeI=KR=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rjbW0-0006iu-Ip
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 09:00:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c42047f1-df85-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 10:00:11 +0100 (CET)
Received: from beta.station (net-93-144-106-196.cust.vodafonedsl.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id E48FD4EE0C90;
 Mon, 11 Mar 2024 10:00:09 +0100 (CET)
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
X-Inumbo-ID: c42047f1-df85-11ee-afdc-a90da7624cb6
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v3 00/16] xen: address violation of MISRA C:2012 Directive 4.10
Date: Mon, 11 Mar 2024 09:59:09 +0100
Message-Id: <cover.1710145041.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Xen sources contain violations of MISRA C:2012 Directive 4.10 whose headline states:
"Precautions shall be taken in order to prevent the contents of a header file
being included more than once".

As stated in v2, the following naming convention has been estabilished:
- arch/.../include/asm/ headers -> ASM_<filename>_H
- private headers -> <dir>_<filename>_H
- asm-generic headers -> ASM_GENERIC_<filename>_H

Since there would have been conflicting guards between architectures (which is a violation
of the directive), there has been a need for ASM headers to specify  if the inclusion guard
referred to ARM or X86. Hence it has been decided to adopt instead:
- arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H

The subdir used is the smallest possible to avoid collisions. For example, it has been
observed that in "xen/arch/arm/include/asm/arm32" and "xen/arch/arm/include/asm/arm64" there
are plenty of header files with the same name, hence  _ARMxx_ was added as subdirectory.

There has been a need to define a standard for generated headers too:
 - include/generated/<subdir>/<filename>.h-> GENERATED_<subdir>_<filename>_H
 - arch/<architecture>/include/generated/asm/<filename>.h-> <arch>_GENERATED_ASM_<name>_H

To summarize, here are all the rules that have been applied:
- private headers -> <dir>_<filename>_H
- asm-generic headers -> ASM_GENERIC_<filename>_H
- arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
- include/generated/<subdir>/<filename>.h-> GENERATED_<subdir>_<filename>_H
- arch/<architecture>/include/generated/asm/<filename>.h-> <arch>_GENERATED_ASM_<name>_H

Links to the discussions:
https://lists.xenproject.org/archives/html/xen-devel/2023-09/msg01928.html
https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg01784.html
https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg02073.html

Changes in v3:
Add/amend inclusion guards to address violations of the Directive and the new naming convention.
Remove trailing underscores.
Modify creation rule for asm-offsets.h to conform to the new standard and to not generate conflicting
guards between architectures (which is a violation of the Directive).

Maria Celeste Cesario (6):
  xen/arm: address violations of MISRA C:2012 Directive 4.10
  xen: address violations of MISRA C:2012 Directive 4.10
  xen: add deviations for MISRA C.2012 Directive 4.10
  xen/x86: address violations of MISRA C:2012 Directive 4.10
  x86/mtrr: address violations of MISRA C:2012 Directive 4.10
  xen/lz4: address violations of MISRA C:2012 Directive 4.10

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
 xen/arch/x86/Makefile                         | 10 +++--
 xen/arch/x86/cpu/cpu.h                        |  5 +++
 xen/arch/x86/cpu/mtrr/mtrr.h                  |  4 ++
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
 xen/build.mk                                  |  6 ++-
 xen/common/decompress.h                       |  5 +++
 xen/common/efi/efi.h                          |  5 +++
 xen/common/event_channel.h                    |  5 +++
 xen/common/lz4/defs.h                         |  5 +++
 xen/include/Makefile                          | 12 ++++--
 xen/include/public/arch-x86/cpufeatureset.h   |  1 +
 xen/include/public/arch-x86/xen.h             |  1 +
 xen/include/public/errno.h                    |  1 +
 xen/include/xen/err.h                         |  8 ++--
 xen/include/xen/pci_ids.h                     |  5 +++
 xen/include/xen/softirq.h                     |  8 ++--
 xen/include/xen/vmap.h                        |  8 ++--
 xen/scripts/Makefile.asm-generic              | 16 +++++++-
 48 files changed, 233 insertions(+), 78 deletions(-)

-- 
2.34.1


