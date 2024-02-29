Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FA086CCEB
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 16:28:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687190.1070219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiKR-0008AD-4Q; Thu, 29 Feb 2024 15:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687190.1070219; Thu, 29 Feb 2024 15:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiKR-00087p-0y; Thu, 29 Feb 2024 15:28:11 +0000
Received: by outflank-mailman (input) for mailman id 687190;
 Thu, 29 Feb 2024 15:28:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ot4I=KG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rfiKP-00087e-2B
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 15:28:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 239fe54f-d717-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 16:28:07 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 87D254EE0737;
 Thu, 29 Feb 2024 16:28:05 +0100 (CET)
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
X-Inumbo-ID: 239fe54f-d717-11ee-afd8-a90da7624cb6
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [XEN PATCH 00/10] address some violations of MISRA C Rule 20.7
Date: Thu, 29 Feb 2024 16:27:52 +0100
Message-Id: <cover.1709219010.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

this series aims to refactor some macros that cause violations of MISRA C Rule
20.7 ("Expressions resulting from the expansion of macro parameters shall be
enclosed in parentheses"). All the macros touched by these patches are in some
way involved in violations, and the strategy adopted to bring them into
compliance is to add parentheses around macro arguments where needed.

Given that the community has previously requested a deviation from the rule, as
stated in docs/misra/deviations.rst, and reported below for convenience [1],
some macro parameters do not need any adjusting (e.g., when used as lhs to
an assignment in statement expressions).

This series fixes a significant portion of the violations on Arm
(from ~14000 to ~2500). On x86, though there is one patch touching it, there are
still many more; they will be part of a later series.

[1] - Code violating Rule 20.7 is safe when macro parameters are used:
       (1) as function arguments;
       (2) as macro arguments;
       (3) as array indices;
       (4) as lhs in assignments.

Nicola Vetrini (10):
  xen/include: address violations of MISRA C Rule 20.7
  xen/arm: address some violations of MISRA C Rule 20.7
  x86: address some violations of MISRA C Rule 20.7
  xen/public: address violations of MISRA C Rule 20.7
  xen/perfc: address violations of MISRA C Rule 20.7
  arm/smmu: address some violations of MISRA C Rule 20.7
  xen/arm: smmuv3: address violations of MISRA C Rule 20.7
  xen/errno: address violations of MISRA C Rule 20.7
  xen/include: tasklet: address violations of MISRA C Rule 20.7
  xen/keyhandler: address violations of MISRA C Rule 20.7

 xen/arch/arm/arm64/cpufeature.c          | 14 +++---
 xen/arch/arm/cpuerrata.c                 |  4 +-
 xen/arch/arm/include/asm/arm64/sysregs.h |  2 +-
 xen/arch/arm/include/asm/guest_atomics.h |  4 +-
 xen/arch/arm/include/asm/mm.h            |  2 +-
 xen/arch/arm/include/asm/smccc.h         |  8 ++--
 xen/arch/arm/include/asm/vgic-emul.h     |  8 ++--
 xen/arch/arm/vcpreg.c                    |  5 +-
 xen/arch/x86/include/asm/irq.h           |  6 +--
 xen/arch/x86/usercopy.c                  |  2 +-
 xen/common/keyhandler.c                  |  4 +-
 xen/common/perfc.c                       |  8 ++--
 xen/drivers/passthrough/arm/smmu-v3.c    |  2 +-
 xen/drivers/passthrough/arm/smmu.c       |  4 +-
 xen/include/public/xen.h                 |  2 +-
 xen/include/xen/bug.h                    |  2 +-
 xen/include/xen/errno.h                  |  2 +-
 xen/include/xen/init.h                   |  4 +-
 xen/include/xen/kconfig.h                |  2 +-
 xen/include/xen/list.h                   | 59 ++++++++++++------------
 xen/include/xen/param.h                  | 22 ++++-----
 xen/include/xen/spinlock.h               |  2 +-
 xen/include/xen/tasklet.h                |  2 +-
 23 files changed, 85 insertions(+), 85 deletions(-)

-- 
2.34.1

