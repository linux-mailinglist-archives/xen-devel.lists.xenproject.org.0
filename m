Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE537BB31B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 10:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613301.953751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogA7-0006HU-SR; Fri, 06 Oct 2023 08:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613301.953751; Fri, 06 Oct 2023 08:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogA7-0006Fj-PU; Fri, 06 Oct 2023 08:26:19 +0000
Received: by outflank-mailman (input) for mailman id 613301;
 Fri, 06 Oct 2023 08:26:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bl8M=FU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qogA6-0006Fc-W1
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 08:26:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04b871af-6422-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 10:26:16 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 1E29C4EE0738;
 Fri,  6 Oct 2023 10:26:15 +0200 (CEST)
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
X-Inumbo-ID: 04b871af-6422-11ee-9b0d-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Paul Durrant <paul@xen.org>,
	Henry Wang <Henry.Wang@arm.org>
Subject: [XEN PATCH 0/9] address violations of MISRA C:2012 Rule 10.1
Date: Fri,  6 Oct 2023 10:26:03 +0200
Message-Id: <cover.1696514677.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to resolve or deviate various violations of Rule 10.1
(operands of inappropriate essential type).

To do so, the widely-used construct
(x & -x), where x is an unsigned integer quantity represented in 2's complement,
does yield the expected result. Since all architectures that are targets for
compliance do fulfill such requirements, the construct is deemed safe and
deviated.

On the contrary, other uses of inappropriate types are changed.

Patches marked with [for-4.19] are not meant to be included in the current
staging, but they can be picked up for 4.18, if deemed risk-free.

Nicola Vetrini (9):
  xen/include: add macro LOWEST_POW2
  arm/bitops: encapsulate violation of MISRA C:2012 Rule 10.1
  xen/pdx: amend definition of PDX_GROUP_COUNT
  x86_64/mm: express macro CNT using LOWEST_POW2
  x86/cpu-policy: address violations of MISRA C Rule 10.1
  x86/io_apic: address violation of MISRA C:2012 Rule 10.1
  x86/mce: Move MC_NCLASSES into the enum mctelem_class
  xen/types: address Rule 10.1 for DECLARE_BITMAP use
  xen/compat: address Rule 10.1 for macros CHECK_SIZE

 automation/eclair_analysis/ECLAIR/deviations.ecl |  6 ++++++
 xen/arch/arm/include/asm/bitops.h                |  6 ++++--
 xen/arch/x86/cpu/mcheck/mctelem.c                |  2 --
 xen/arch/x86/cpu/mcheck/mctelem.h                |  5 +++--
 xen/arch/x86/include/asm/io_apic.h               |  7 ++++---
 xen/arch/x86/x86_64/mm.c                         | 12 ++++++------
 xen/include/xen/compat.h                         | 10 ++++++----
 xen/include/xen/iommu.h                          |  2 +-
 xen/include/xen/lib/x86/cpu-policy.h             | 13 +++++++------
 xen/include/xen/macros.h                         |  6 ++++--
 xen/include/xen/pdx.h                            |  2 +-
 xen/include/xen/types.h                          |  1 +
 12 files changed, 43 insertions(+), 29 deletions(-)

--
2.34.1

