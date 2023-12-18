Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7652816AD0
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:17:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655801.1023590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAgv-00057p-U7; Mon, 18 Dec 2023 10:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655801.1023590; Mon, 18 Dec 2023 10:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAgv-00055W-RW; Mon, 18 Dec 2023 10:17:41 +0000
Received: by outflank-mailman (input) for mailman id 655801;
 Mon, 18 Dec 2023 10:17:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mejk=H5=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rFAgu-00055P-ON
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:17:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab9dfe7b-9d8e-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 11:17:38 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 7C6EB4EE0742;
 Mon, 18 Dec 2023 11:17:36 +0100 (CET)
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
X-Inumbo-ID: ab9dfe7b-9d8e-11ee-9b0f-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2 0/7] address violations of MISRA C:2012 Rule 2.1
Date: Mon, 18 Dec 2023 11:17:26 +0100
Message-Id: <cover.1702891792.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C:2012 Rule 2.1 states: "A project shall not contain unreachable code".
As such, this series eliminates various instances of unreachable code found in
Xen, by providing equivalent compliant constructs.

This series is loosely based on my earlier series [1], but the overall approach
has changed since; for instance, declarations without initialization are now
ignored, as detailed in docs/misra/deviations.rst.

[1] https://lore.kernel.org/xen-devel/cover.1690985045.git.nicola.vetrini@bugseng.com/

Changes in v2:
- Patch 4 has been committed;
- Drop Patch 7/7;
- Add two new patches:
  - "xen/arm: vcpreg: address violation of MISRA C Rule 2.1"
  - "automation/eclair_analysis: avoid violation of MISRA Rule 2.1"
- Reworked all other patches.

Nicola Vetrini (7):
  xen/shutdown: address MISRA C:2012 Rule 2.1
  x86/mm: address MISRA C:2012 Rule 2.1
  xen/arm: address MISRA C:2012 Rule 2.1
  xen/arm: traps: add ASSERT_UNREACHABLE() where needed
  x86/platform: removed break to address MISRA C:2012 Rule 2.1
  xen/arm: vcpreg: address violation of MISRA C Rule 2.1
  automation/eclair_analysis: avoid violation of MISRA Rule 2.1

 automation/eclair_analysis/ECLAIR/deviations.ecl |  7 ++++++-
 xen/arch/arm/mm.c                                |  1 +
 xen/arch/arm/traps.c                             |  3 ++-
 xen/arch/arm/vcpreg.c                            | 10 ++++++++--
 xen/arch/arm/vgic-v3-its.c                       |  1 +
 xen/arch/x86/mm.c                                |  2 --
 xen/arch/x86/platform_hypercall.c                |  1 -
 xen/common/shutdown.c                            | 15 ++++-----------
 8 files changed, 22 insertions(+), 18 deletions(-)

-- 
2.34.1

