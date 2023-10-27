Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B940A7D99F7
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 15:34:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624381.972916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwMyl-0000i5-Gy; Fri, 27 Oct 2023 13:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624381.972916; Fri, 27 Oct 2023 13:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwMyl-0000eD-DN; Fri, 27 Oct 2023 13:34:23 +0000
Received: by outflank-mailman (input) for mailman id 624381;
 Fri, 27 Oct 2023 13:34:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bjPi=GJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qwMyk-0000bA-Es
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 13:34:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87c98e81-74cd-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 15:34:19 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id BF64C4EE073E;
 Fri, 27 Oct 2023 15:34:17 +0200 (CEST)
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
X-Inumbo-ID: 87c98e81-74cd-11ee-9b0e-b553b5be7939
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
	Paul Durrant <paul@xen.org>
Subject: [XEN PATCH][for-4.19 v4 0/8] address violations of MISRA C:2012 Rule 10.1
Date: Fri, 27 Oct 2023 15:34:07 +0200
Message-Id: <cover.1698410970.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The widely-used construct
(x & -x), where x is an unsigned integer quantity represented in 2's complement,
does yield the expected result. Since all architectures that are targets for
compliance do fulfill such requirements, the construct is deemed safe and
deviated.

The use of 'DECLARE_BITMAP(features, IOMMU_FEAT_count);' is deviated, to avoid
harming code readability.

On the contrary, other uses of inappropriate types are changed.

Changes in v3:
- Patch [6/8] has already been picked up in Andrew's for-next tree
Changes in v4:
- s/LOWEST_BIT/ISOLATE_LOW_BIT/

Nicola Vetrini (8):
  xen/include: add macro ISOLATE_LOW_BIT
  arm/bitops: encapsulate violation of MISRA C:2012 Rule 10.1
  xen/pdx: amend definition of PDX_GROUP_COUNT
  x86_64/mm: express macro CNT using ISOLATE_LOW_BIT
  x86/io_apic: address violation of MISRA C:2012 Rule 10.1
  x86/mce: Move MC_NCLASSES into the enum mctelem_class
  xen/types: address Rule 10.1 for DECLARE_BITMAP use
  xen/compat: use BUILD_BUG_ON in CHECK_SIZE macros

 automation/eclair_analysis/ECLAIR/deviations.ecl |  7 +++++++
 docs/misra/deviations.rst                        |  8 ++++++++
 docs/misra/safe.json                             |  8 ++++++++
 xen/arch/arm/include/asm/bitops.h                |  6 ++++--
 xen/arch/x86/cpu/mcheck/mctelem.c                |  2 --
 xen/arch/x86/cpu/mcheck/mctelem.h                |  5 +++--
 xen/arch/x86/include/asm/io_apic.h               |  7 ++++---
 xen/arch/x86/x86_64/mm.c                         | 12 ++++++------
 xen/include/xen/compat.h                         | 16 +++++++++++-----
 xen/include/xen/iommu.h                          |  1 +
 xen/include/xen/macros.h                         | 10 ++++++++--
 xen/include/xen/pdx.h                            |  2 +-
 xen/include/xen/types.h                          |  5 +++++
 13 files changed, 66 insertions(+), 23 deletions(-)

-- 
2.34.1

