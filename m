Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01480818604
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 12:06:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656666.1025014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXvP-0003hC-Bt; Tue, 19 Dec 2023 11:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656666.1025014; Tue, 19 Dec 2023 11:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXvP-0003fM-7U; Tue, 19 Dec 2023 11:06:11 +0000
Received: by outflank-mailman (input) for mailman id 656666;
 Tue, 19 Dec 2023 11:06:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Div9=H6=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rFXvN-0003Hq-L3
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 11:06:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b2514f9-9e5e-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 12:06:06 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 98B174EE0738;
 Tue, 19 Dec 2023 12:06:05 +0100 (CET)
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
X-Inumbo-ID: 9b2514f9-9e5e-11ee-98eb-6d05b1d4d9a1
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/6] xen: address violations of MISRA C:2012 Rule 11.8
Date: Tue, 19 Dec 2023 12:05:08 +0100
Message-Id: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
headline states:
"A conversion shall not remove any const, volatile or _Atomic
qualification from the type pointed to by a pointer".

This patch amends or drops casts that unnecessarily
drop const qualifiers.

Example:

int device_tree_for_each_node(const void *fdt);

size_t __init boot_fdt_info(const void *fdt)
{
  int ret = device_tree_for_each_node((void *)fdt); /* Non-compliant */
  int ret = device_tree_for_each_node(fdt);         /* Compliant, proposed change */
}

In this example, the const qualifier is unnecessarily cast away
from the original object, therefore making it non-compliant.

Deviate the following violations:

- removal of const qualifier to comply with function signatures
   A single function could either read or write through a passed in pointer,
   depending on how it is called. It is deemed safe to cast away a const
   qualifier when passing a pointer to such a function, when the other
   parameters guarantee read-only operation.
   A SAF-3-safe comment was added to deviate these violations.

- violations in macro container_of
   Violations caused by this macro are due to pointer arithmetic operations
   with the provided offset. The resulting pointer is then immediately cast back to its
   original type, which preserves the qualifier. This use is deemed safe.

Changes in v2:
- reword SAF-3-safe text;
- merge comments on __hvm_copy;
- add SAF-3-safe comment in x86/hvm.c:3433;
- add SAF-3-safe comment on arm/guestcopy.c raw_copy_to_guest and
  raw_copy_to_guest_flush_dcache;
- remove deviation for function ERR_CAST;
- remove function ERR_CAST;
- move common/version.c to patch xen/common;
- change cast type from const void* to uintptr_t in common/version.c;
- drop redundant cast on fdt.


Maria Celeste Cesario (6):
  xen/arm: address violations of MISRA C:2012 Rule 11.8
  xen/ppc: address violations of MISRA C:2012 Rule 11.8.
  xen: add deviations for Rule 11.8
  xen: add SAF deviation for safe cast removal
  xen: remove unused function ERR_CAST
  xen/common: address violations of MISRA C:2012 Rule 11.8

 automation/eclair_analysis/ECLAIR/deviations.ecl |  7 +++++++
 docs/misra/deviations.rst                        |  7 +++++++
 docs/misra/safe.json                             |  8 ++++++++
 xen/arch/arm/bootfdt.c                           |  6 +++---
 xen/arch/arm/guestcopy.c                         |  2 ++
 xen/arch/arm/include/asm/alternative.h           |  2 +-
 xen/arch/ppc/include/asm/atomic.h                |  2 +-
 xen/arch/x86/hvm/hvm.c                           |  6 ++++--
 xen/common/version.c                             |  2 +-
 xen/include/xen/err.h                            | 13 -------------
 10 files changed, 34 insertions(+), 21 deletions(-)

-- 
2.40.0


