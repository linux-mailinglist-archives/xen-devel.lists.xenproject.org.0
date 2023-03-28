Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E3F6CB7C6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 09:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515548.798531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph3Wl-0001Zk-5R; Tue, 28 Mar 2023 07:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515548.798531; Tue, 28 Mar 2023 07:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph3Wl-0001Wk-25; Tue, 28 Mar 2023 07:13:55 +0000
Received: by outflank-mailman (input) for mailman id 515548;
 Tue, 28 Mar 2023 07:13:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TlhL=7U=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ph3Wj-0001We-Me
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 07:13:53 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 16ccc776-cd38-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 09:13:50 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 221F3C14;
 Tue, 28 Mar 2023 00:14:34 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 741C63F73F;
 Tue, 28 Mar 2023 00:13:47 -0700 (PDT)
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
X-Inumbo-ID: 16ccc776-cd38-11ed-b464-930f4c7d94ae
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 0/4] P2M improvements for Arm
Date: Tue, 28 Mar 2023 15:13:30 +0800
Message-Id: <20230328071334.2098429-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some clean-up/improvement work that can be done in the
Arm P2M code triggered by [1] and [2]. These were found at the 4.17
code freeze period so the issues were not fixed at that time.
Therefore do the follow-ups here.

Patch#1 addresses one comment in [1]. It was sent earlier and reviewed
once. Pick the updated version, i.e. "[PATCH v2] xen/arm: Reduce
redundant clear root pages when teardown p2m", to this series.

Patch#2 is a new patch based on v1 comments, this is a pre-requisite
patch for patch#3 where the deferring of GICv2 CPU interface mapping
should also be applied for new vGIC.

Patch#3 and #4 addresses the comment in [2] following the discussion
between two possible options.

[1] https://lore.kernel.org/xen-devel/a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org/
[2] https://lore.kernel.org/xen-devel/e6643bfc-5bdf-f685-1b68-b28d341071c1@xen.org/

v2 -> v3:
1. Add Julien's acked-by tag for patch #2.
2. Reword the reason why hwdom extra mappings are not touched by this
   patch in the commit message of patch #3.
3. Rework the address check in stage-2 data abort trap so that larger
   CPU interface size can work fine.
4. Correct a typo in original in-code comment, slightly modify
   the wording to avoid the presence of preemptive/non-preemptive
   p2m_teardown() call assumption.
5. Drop the (now) unnecessary second parameter of p2m_teardown().

v1 -> v2:
1. Move in-code comment for p2m_force_tlb_flush_sync() on top of
   p2m_clear_root_pages().
2. Add a new patch as patch #2.
3. Correct style in in-code comment in patch #3.
4. Avoid open-coding gfn_eq() and gaddr_to_gfn(d->arch.vgic.cbase).
5. Apply same changes for the new vGICv2 implementation, update the
   commit message accordingly.
6. Add in-code comment in old GICv2's vgic_v2_domain_init() and
   new GICv2's vgic_v2_map_resources() to mention the mapping of the
   virtual CPU interface is deferred until first access.
7. Add reviewed-by and acked-by tags accordingly.

Henry Wang (4):
  xen/arm: Reduce redundant clear root pages when teardown p2m
  xen/arm: Rename vgic_cpu_base and vgic_dist_base for new vGIC
  xen/arm: Defer GICv2 CPU interface mapping until the first access
  xen/arm: Clean-up in p2m_init() and p2m_final_teardown()

 xen/arch/arm/domain.c               | 10 ++++-
 xen/arch/arm/include/asm/new_vgic.h | 10 +++--
 xen/arch/arm/include/asm/p2m.h      | 15 +++----
 xen/arch/arm/include/asm/vgic.h     |  2 +
 xen/arch/arm/p2m.c                  | 64 +++++++++++------------------
 xen/arch/arm/traps.c                | 19 +++++++--
 xen/arch/arm/vgic-v2.c              | 25 ++++-------
 xen/arch/arm/vgic/vgic-init.c       |  4 +-
 xen/arch/arm/vgic/vgic-v2.c         | 41 +++++++-----------
 9 files changed, 85 insertions(+), 105 deletions(-)

-- 
2.25.1


