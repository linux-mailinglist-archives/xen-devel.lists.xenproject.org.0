Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6623891580
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 10:12:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699277.1091983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq8H2-0000zc-PW; Fri, 29 Mar 2024 09:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699277.1091983; Fri, 29 Mar 2024 09:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq8H2-0000x8-Mj; Fri, 29 Mar 2024 09:11:44 +0000
Received: by outflank-mailman (input) for mailman id 699277;
 Fri, 29 Mar 2024 09:11:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LGMC=LD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rq8H1-0000ww-Cc
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 09:11:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aeb5857-edac-11ee-a1ef-f123f15fe8a2;
 Fri, 29 Mar 2024 10:11:41 +0100 (CET)
Received: from nico.bugseng.com (unknown [176.206.12.122])
 by support.bugseng.com (Postfix) with ESMTPSA id C1AE34EE073F;
 Fri, 29 Mar 2024 10:11:38 +0100 (CET)
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
X-Inumbo-ID: 5aeb5857-edac-11ee-a1ef-f123f15fe8a2
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
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [XEN PATCH v3 0/7] address violations of MISRA C Rule 20.7 
Date: Fri, 29 Mar 2024 10:11:28 +0100
Message-Id: <cover.1711700095.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

this series aims to refactor some macros that cause violations of MISRA C Rule
20.7 ("Expressions resulting from the expansion of macro parameters shall be
enclosed in parentheses"). All the macros touched by these patches are in some
way involved in violations, and the strategy adopted to bring them into
compliance is to add parentheses around macro arguments where needed.

Deviations from the rule have been amended to encompass also direct use in
initializer lists of macro arguments.

Patch 1 is taken, with adjustments, from the earlier series (which was
incorrectly tagged as v1). All other patches are new in this series and are
pairwise indipendent.

Nicola Vetrini (7):
  x86/msi: address violation of MISRA C Rule 20.7 and coding style
  arm/public: address violations of MISRA C Rule 20.7
  x86/vPMU: address violations of MISRA C Rule 20.7
  x86/hvm: address violations of MISRA C Rule 20.7
  automation/eclair: add deviations for Rule 20.7
  xen/mm: address violations of MISRA C Rule 20.7
  x86/amd: address violations of MISRA C Rule 20.7

 .../eclair_analysis/ECLAIR/deviations.ecl     | 25 +++++++++-
 docs/misra/deviations.rst                     | 14 +++++-
 docs/misra/rules.rst                          |  2 +-
 xen/arch/x86/hvm/domain.c                     |  6 +--
 xen/arch/x86/include/asm/amd.h                |  3 +-
 xen/arch/x86/include/asm/msi.h                | 49 ++++++++++---------
 xen/arch/x86/include/asm/vpmu.h               |  4 +-
 xen/include/public/arch-arm.h                 |  2 +-
 xen/include/xen/mm.h                          | 14 +++---
 9 files changed, 77 insertions(+), 42 deletions(-)

-- 
2.34.1


