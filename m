Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5893B73DBCD
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 11:53:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555379.867104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDitg-0000S8-7j; Mon, 26 Jun 2023 09:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555379.867104; Mon, 26 Jun 2023 09:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDitg-0000P1-4r; Mon, 26 Jun 2023 09:52:36 +0000
Received: by outflank-mailman (input) for mailman id 555379;
 Mon, 26 Jun 2023 09:52:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rDFh=CO=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qDite-0000Ov-Kt
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 09:52:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a8e5802-1407-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 11:52:31 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.163.27.55])
 by support.bugseng.com (Postfix) with ESMTPSA id 2E3904EE0738;
 Mon, 26 Jun 2023 11:52:28 +0200 (CEST)
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
X-Inumbo-ID: 2a8e5802-1407-11ee-8611-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH v3 0/6] fix violations of MISRA C:2012 Rule 8.3 on parameter names.
Date: Mon, 26 Jun 2023 11:52:12 +0200
Message-Id: <cover.1687771796.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To comply with Rule 8.3 ("All declarations of an object or function
shall use the same names and type qualifiers") change the parameter
names in order to have function declarations consistent with the
corresponding definitions.

Changes in v3:
  - split previous patch in multiple parts to facilitate review.
Changes in v2:
  - adapted parameter names in function definitions to the names used
    in function declarations when the context requires it;
  - reflected changes to the function identifier in order to maintain
    consistency with modifications on parameter names;
  - extended changes to definitions under xen/arch/arm/vgic

Federico Serafini (6):
  xen/arm: change names in function access_guest_memory_by_ipa().
  xen/arm: change parameter name 'vcpu' in domain() function definition.
  xen/arm: change parameter name 'pa' in ioremap_addr() definition.
  xen/arm: vgic: change parameter name in 'init' and 'free' functions.
  xen/arm: make parameter names of function declarations consistent.
  xen/arm: change parameter names in replace_grant_host_mapping().

 xen/arch/arm/domain.c                   | 10 +++++-----
 xen/arch/arm/guest_walk.c               |  6 +++---
 xen/arch/arm/guestcopy.c                |  2 +-
 xen/arch/arm/include/asm/fixmap.h       |  2 +-
 xen/arch/arm/include/asm/gic.h          |  2 +-
 xen/arch/arm/include/asm/gic_v3_its.h   |  5 +++--
 xen/arch/arm/include/asm/grant_table.h  |  4 ++--
 xen/arch/arm/include/asm/guest_access.h |  4 ++--
 xen/arch/arm/include/asm/irq.h          |  2 +-
 xen/arch/arm/include/asm/regs.h         |  2 +-
 xen/arch/arm/include/asm/vgic.h         |  4 ++--
 xen/arch/arm/mm.c                       | 20 ++++++++++----------
 xen/arch/arm/tee/optee.c                | 10 +++++-----
 xen/arch/arm/vgic-v3-its.c              | 16 ++++++++--------
 xen/arch/arm/vgic/vgic-init.c           | 12 ++++++------
 15 files changed, 51 insertions(+), 50 deletions(-)

-- 
2.34.1


