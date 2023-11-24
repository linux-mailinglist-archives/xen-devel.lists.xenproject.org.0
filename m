Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4237A7F78F8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 17:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640820.999528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Z4B-0000sJ-Jg; Fri, 24 Nov 2023 16:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640820.999528; Fri, 24 Nov 2023 16:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Z4B-0000ol-Fk; Fri, 24 Nov 2023 16:30:07 +0000
Received: by outflank-mailman (input) for mailman id 640820;
 Fri, 24 Nov 2023 16:30:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SB6C=HF=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1r6Z4A-0000du-HZ
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 16:30:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7fca036-8ae6-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 17:30:03 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id C4A2F4EE073C;
 Fri, 24 Nov 2023 17:30:01 +0100 (CET)
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
X-Inumbo-ID: b7fca036-8ae6-11ee-9b0e-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	maria.celeste.cesario@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/5] xen: address violations of MISRA C:2012 Rule 11.8
Date: Fri, 24 Nov 2023 17:29:14 +0100
Message-Id: <cover.1700842832.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 11.8 whose headline
states:
"A conversion shall not remove any const, volatile or Atomic qualification
from the type pointed to by a pointer".

This patch amends or removes casts that unnecessarily drop const qualifiers.
Example:

  static inline int atomic_read(const atomic_t *v)
  {
    return *(volatile int *)&v->counter;    /* Non-compliant */
  }

In this example, the const qualifier is unnnecessarily removed from
the original object, therefore making it non-compliant.

Maria Celeste Cesario (5):
  x86/platform_hypercall: address violations of MISRA C:2012 Rule 11.8
  x86/boot/reloc: address violations of MISRA C:2012 Rule 11.8
  AMD/IOMMU: address violations of MISRA C:2012 Rule 11.8
  x86/atomic: address violations of MISRA C:2012 Rule 11.8
  xen/arm: address violations of MISRA C:2012 Rule 11.8

 xen/arch/arm/domain_build.c              | 2 +-
 xen/arch/arm/include/asm/atomic.h        | 2 +-
 xen/arch/arm/include/asm/regs.h          | 2 +-
 xen/arch/x86/boot/reloc.c                | 2 +-
 xen/arch/x86/include/asm/atomic.h        | 8 ++++----
 xen/arch/x86/platform_hypercall.c        | 2 +-
 xen/drivers/passthrough/amd/iommu_acpi.c | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.40.0


