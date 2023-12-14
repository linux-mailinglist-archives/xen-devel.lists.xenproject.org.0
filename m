Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EF9812FBB
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 13:09:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654518.1021474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDkWG-0000vm-67; Thu, 14 Dec 2023 12:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654518.1021474; Thu, 14 Dec 2023 12:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDkWG-0000tO-3H; Thu, 14 Dec 2023 12:08:48 +0000
Received: by outflank-mailman (input) for mailman id 654518;
 Thu, 14 Dec 2023 12:08:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWU9=HZ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rDkWE-0000tC-MS
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 12:08:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87b94610-9a79-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 13:08:45 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 436BB4EE073A;
 Thu, 14 Dec 2023 13:08:44 +0100 (CET)
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
X-Inumbo-ID: 87b94610-9a79-11ee-98e9-6d05b1d4d9a1
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 0/9]  xen: address violations of MISRA C:2012 Rule 11.8
Date: Thu, 14 Dec 2023 13:07:42 +0100
Message-Id: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
headline states:
"A conversion shall not remove any const, volatile or _Atomic
qualification from the type pointed to by a pointer".

This patch amends or removes casts that unnecessarily drop
const and volatile qualifiers.

Example:

 static always_inline bool int_##name(volatile void *p)
 {
    volatile uint32_t *ptr = (uint32_t *)p;             /* Non-compliant */
    volatile uint32_t *ptr = (volatile uint32_t *)p;    /* Compliant, proposed change */
 }

In this example, the volatile qualifier is unnecessarily removed
from the original object, therefore making it non-compliant.


Deviate the following violations:

- removal of const qualifier to comply with function signature
  It is safe to cast away const qualifiers to comply with function
  signature if the function does not modify the pointee.
  A SAF-3-safe comment was added to deviate this violation.

- violations in macro container_of
  Violations caused by this macro are due to pointer arithmetic operations
  with the provided offset. The resulting pointer is then immediately cast back to its
  original type, which preserves the qualifier. This use can be deemed as safe.

- violations in function ERR_CAST
  This function is made to explicitly cast an error-valued pointer to a void
  pointer type to make it clear that's what's going on, so the violation is deliberate.


Maria Celeste Cesario (9):
  xen/arm64: address violations of MISRA C:2012 Rule 11.8
  xen/arm: address violations of MISRA C:2012 Rule 11.8
  xen/efi: address violations of MISRA C:2012 Rule 11.8
  ACPI: address violations of MISRA C:2012 Rule 11.8
  xen/x86: address violations of MISRA C:2012 Rule 11.8
  xen/ppc: address violations of MISRA C:2012 Rule 11.8.
  x86/hvm: address violations of MISRA C:2012 Rule 11.8
  xen: add deviations for Rule 11.8
  xen: add SAF deviation for safe cast removal.

 automation/eclair_analysis/ECLAIR/deviations.ecl | 12 ++++++++++++
 docs/misra/deviations.rst                        | 13 +++++++++++++
 docs/misra/safe.json                             |  8 ++++++++
 xen/arch/arm/arm64/lib/bitops.c                  |  6 ++++--
 xen/arch/arm/bootfdt.c                           |  6 +++---
 xen/arch/arm/include/asm/alternative.h           |  2 +-
 xen/arch/arm/include/asm/arm64/cmpxchg.h         | 10 +++++-----
 xen/arch/ppc/include/asm/atomic.h                |  2 +-
 xen/arch/x86/boot/reloc.c                        |  4 ++--
 xen/arch/x86/hvm/hvm.c                           |  3 ++-
 xen/common/efi/boot.c                            |  6 +++---
 xen/common/version.c                             |  2 +-
 xen/include/acpi/acmacros.h                      |  2 +-
 13 files changed, 56 insertions(+), 20 deletions(-)

-- 
2.40.0


