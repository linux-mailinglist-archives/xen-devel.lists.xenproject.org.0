Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EE2876317
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 12:21:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690219.1075998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYHo-00069a-Uo; Fri, 08 Mar 2024 11:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690219.1075998; Fri, 08 Mar 2024 11:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYHo-00067T-S1; Fri, 08 Mar 2024 11:21:12 +0000
Received: by outflank-mailman (input) for mailman id 690219;
 Fri, 08 Mar 2024 11:21:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PBuc=KO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1riYHn-00067H-C8
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 11:21:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f65b130e-dd3d-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 12:21:09 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 02CC04EE0738;
 Fri,  8 Mar 2024 12:21:06 +0100 (CET)
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
X-Inumbo-ID: f65b130e-dd3d-11ee-a1ee-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [XEN PATCH v2 0/7] address some violations of MISRA C Rule 20.7
Date: Fri,  8 Mar 2024 12:20:57 +0100
Message-Id: <cover.1709896401.git.nicola.vetrini@bugseng.com>
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
an assignment in statement expressions), but in some cases (most notably in
patch 3) such adjustments have been made for consistency.

This series fixes a significant portion of the violations on Arm
(from ~14000 to ~2500). On x86, though there is one patch touching it, there are
still many more; they will be part of a later series.

Changes in v2:
- Removed a hunk of patch 1 touching __config_enabled (will be deviated in a
  subsequent series).
- Split patch 1 into three patches, for easier reviewing.
- Made minor adjustments to "xen-arm-address-some...".
- Dropped GUARD(1) hunk from the x86 patch.
- Dropped patch 4, 5 and 10: they will be subject to a deviation in the future.
- Patch 7, 8, 9 have been committed already. 

Nicola Vetrini (7):
  xen/spinlock: address violations of MISRA C Rule 20.7
  xen/include: address violations of MISRA C Rule 20.7
  xen/list: address violations of MISRA C Rule 20.7
  xen/param: address violations of MISRA C Rule 20.7
  xen/arm: address some violations of MISRA C Rule 20.7
  x86/irq: parenthesize negative constants
  arm/smmu: address some violations of MISRA C Rule 20.7

 xen/arch/arm/arm64/cpufeature.c          | 14 ++--
 xen/arch/arm/cpuerrata.c                 |  8 +--
 xen/arch/arm/include/asm/arm64/sysregs.h |  2 +-
 xen/arch/arm/include/asm/guest_atomics.h |  4 +-
 xen/arch/arm/include/asm/mm.h            |  2 +-
 xen/arch/arm/include/asm/smccc.h         | 36 +++++-----
 xen/arch/arm/include/asm/vgic-emul.h     |  8 +--
 xen/arch/arm/vcpreg.c                    |  5 +-
 xen/arch/x86/include/asm/irq.h           |  8 +--
 xen/drivers/passthrough/arm/smmu.c       |  4 +-
 xen/include/xen/bug.h                    |  2 +-
 xen/include/xen/init.h                   |  4 +-
 xen/include/xen/list.h                   | 83 ++++++++++++------------
 xen/include/xen/param.h                  | 22 +++----
 xen/include/xen/spinlock.h               |  2 +-
 15 files changed, 102 insertions(+), 102 deletions(-)

-- 
2.34.1

