Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2218F87E8FD
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 12:54:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694610.1083508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBZ7-0001ks-4I; Mon, 18 Mar 2024 11:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694610.1083508; Mon, 18 Mar 2024 11:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBZ6-0001hq-UW; Mon, 18 Mar 2024 11:54:04 +0000
Received: by outflank-mailman (input) for mailman id 694610;
 Mon, 18 Mar 2024 11:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QoDm=KY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rmBZ5-0001F2-Db
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 11:54:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34ff581b-e51e-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 12:53:59 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 2D5FD4EE073E;
 Mon, 18 Mar 2024 12:53:56 +0100 (CET)
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
X-Inumbo-ID: 34ff581b-e51e-11ee-a1ee-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Julien Grall <julien@xen.org>,
	Rahul Singh <rahul.singh@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [XEN PATCH 00/10] address some violations of MISRA C Rule 20.7
Date: Mon, 18 Mar 2024 12:53:43 +0100
Message-Id: <cover.1710762555.git.nicola.vetrini@bugseng.com>
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

Note that the patch on list.h of the earlier series [2] has been intentionally
left out of this series, because it still needs some adjustments.

[1] - Code violating Rule 20.7 is safe when macro parameters are used:
       (1) as function arguments;
       (2) as macro arguments;
       (3) as array indices;
       (4) as lhs in assignments.
       
[2] https://lore.kernel.org/xen-devel/cover.1709896401.git.nicola.vetrini@bugseng.com/

Nicola Vetrini (10):
  x86/cpufeature: add parentheses to comply with Rule 20.7
  AMD/IOMMU: guest: address violations of MISRA C Rule 20.7
  xen/xsm: add parentheses to comply with MISRA C Rule 20.7
  xen/device_tree: address violations of MISRA C Rule 20.7
  EFI: address violations of MISRA C Rule 20.7
  xen/arm: smmu: address violations of MISRA C Rule 20.7
  xen/efi: efibind: address violations of MISRA C Rule 20.7
  xen/notifier: address violations of MISRA C Rule 20.7
  xen/wait: address violations of MISRA C Rule 20.7
  xen/sched: address violations of MISRA C Rule 20.7

 xen/arch/arm/include/asm/arm64/efibind.h  | 4 ++--
 xen/arch/x86/include/asm/cpufeatureset.h  | 2 +-
 xen/arch/x86/include/asm/x86_64/efibind.h | 4 ++--
 xen/common/sched/private.h                | 2 +-
 xen/drivers/passthrough/amd/iommu_guest.c | 2 +-
 xen/drivers/passthrough/arm/smmu.c        | 2 +-
 xen/include/efi/efierr.h                  | 2 +-
 xen/include/xen/device_tree.h             | 2 +-
 xen/include/xen/notifier.h                | 2 +-
 xen/include/xen/wait.h                    | 4 ++--
 xen/include/xsm/dummy.h                   | 4 ++--
 11 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.34.1

