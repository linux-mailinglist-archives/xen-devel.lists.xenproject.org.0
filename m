Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE15887032
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 17:02:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696950.1088183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnhLN-0000Yb-OP; Fri, 22 Mar 2024 16:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696950.1088183; Fri, 22 Mar 2024 16:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnhLN-0000WN-Lh; Fri, 22 Mar 2024 16:02:09 +0000
Received: by outflank-mailman (input) for mailman id 696950;
 Fri, 22 Mar 2024 16:02:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kYs8=K4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rnhLL-0000W5-OI
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 16:02:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87438b5f-e865-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 17:02:05 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 6171E4EE0742;
 Fri, 22 Mar 2024 17:02:03 +0100 (CET)
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
X-Inumbo-ID: 87438b5f-e865-11ee-a1ee-f123f15fe8a2
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
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 00/11] address some violations of MISRA C Rule 20.7
Date: Fri, 22 Mar 2024 17:01:49 +0100
Message-Id: <cover.1711118582.git.nicola.vetrini@bugseng.com>
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

Patch 1 is taken, with adjustments, from [2]. Patches 2 and 3 are taken from [3]
without any modifications. All other patches are new in this series and are
pairwise indipendent.

[1] - Code violating Rule 20.7 is safe when macro parameters are used:
       (1) as function arguments;
       (2) as macro arguments;
       (3) as array indices;
       (4) as lhs in assignments.

[2] https://lore.kernel.org/xen-devel/b93a64b93ef4210f5fe96368c2522e5e71e9c87c.1709896401.git.nicola.vetrini@bugseng.com/
[3] https://lore.kernel.org/xen-devel/cover.1710762555.git.nicola.vetrini@bugseng.com/

Nicola Vetrini (11):
  xen/list: address violations of MISRA C Rule 20.7
  xen/xsm: add parentheses to comply with MISRA C Rule 20.7
  xen/efi: efibind: address violations of MISRA C Rule 20.7
  xentrace: address violation of MISRA C Rule 20.7
  xen: address MISRA C Rule 20.7 violation in generated hypercall
  xen/efi: address violations of MISRA C Rule 20.7
  xen/page_alloc: address violations of MISRA C Rule 20.7
  x86/altcall: address violations of MISRA C Rule 20.7
  x86/msi: address violation of MISRA C Rule 20.7 and coding style
  x86/hvm: address violations of Rule 20.7
  x86/public: hvm: address violations of MISRA C Rule 20.7

 xen/arch/arm/include/asm/arm64/efibind.h  |   4 +-
 xen/arch/x86/hvm/hvm.c                    |   6 +-
 xen/arch/x86/include/asm/alternative.h    |  76 ++++++------
 xen/arch/x86/include/asm/hvm/save.h       |   4 +-
 xen/arch/x86/include/asm/msi.h            |  47 +++----
 xen/arch/x86/include/asm/x86_64/efibind.h |   4 +-
 xen/common/page_alloc.c                   |   2 +-
 xen/include/efi/efiapi.h                  |   3 +-
 xen/include/public/arch-x86/xen.h         |   2 +-
 xen/include/public/trace.h                |   2 +-
 xen/include/xen/list.h                    | 143 +++++++++++-----------
 xen/include/xsm/dummy.h                   |   4 +-
 xen/scripts/gen_hypercall.awk             |   4 +-
 13 files changed, 151 insertions(+), 150 deletions(-)

-- 
2.34.1

