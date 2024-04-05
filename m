Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A11E899928
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 11:15:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701159.1095345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsfep-0007YJ-PQ; Fri, 05 Apr 2024 09:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701159.1095345; Fri, 05 Apr 2024 09:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsfep-0007Wu-LF; Fri, 05 Apr 2024 09:14:47 +0000
Received: by outflank-mailman (input) for mailman id 701159;
 Fri, 05 Apr 2024 09:14:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUTm=LK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rsfeo-0007WZ-74
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 09:14:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f032e5ff-f32c-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 11:14:43 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id CB51F4EE073E;
 Fri,  5 Apr 2024 11:14:40 +0200 (CEST)
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
X-Inumbo-ID: f032e5ff-f32c-11ee-a1ef-f123f15fe8a2
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
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v2 0/9] address violations of MISRA C Rule 16.2
Date: Fri,  5 Apr 2024 11:14:28 +0200
Message-Id: <cover.1712305581.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Continuing the work done in [1], these patches make this rule clean (i.e., no
residual violation of the rule). Some switches are refactored to avoid
interleaving a case label inside an if statement. In some cases this leads to
some duplication, but the files where this would have had the greatest impact
(the x86 emulator files and svm/emulate.c) are deviated, in order to have a
reasonable balance between code changes and deviations.

[1] https://lore.kernel.org/xen-devel/99114c15a4256e6a0f39bd6de232ee4b8ad9b587.1698239734.git.nicola.vetrini@bugseng.com/

Nicola Vetrini (9):
  x86/vlapic: tidy switch statement and address MISRA violation
  x86/cpuid: address violation of MISRA C Rule 16.2
  x86/irq: tidy switch statement and address MISRA violation
  x86/efi: tidy switch statement and address MISRA violation
  xen/domctl: address violations of MISRA C Rule 16.2
  x86/hvm: address violations of MISRA C Rule 16.2
  xen/xsm: address violation of MISRA C Rule 16.2
  xen/domain: deviate MISRA C Rule 16.2 violation
  eclair_analysis: deviate x86 emulator for Rule 16.2

 .../eclair_analysis/ECLAIR/deviations.ecl     |  7 +++++
 docs/misra/deviations.rst                     |  6 ++++
 docs/misra/safe.json                          |  8 +++++
 xen/arch/x86/cpuid.c                          | 31 +++++++++----------
 xen/arch/x86/efi/efi-boot.h                   |  8 +++--
 xen/arch/x86/hvm/hypercall.c                  | 10 +++---
 xen/arch/x86/hvm/vlapic.c                     | 16 ++--------
 xen/arch/x86/irq.c                            |  9 ++----
 xen/common/domain.c                           |  1 +
 xen/common/domctl.c                           |  8 +++--
 xen/include/xsm/dummy.h                       | 12 +++----
 11 files changed, 64 insertions(+), 52 deletions(-)

-- 
2.34.1

