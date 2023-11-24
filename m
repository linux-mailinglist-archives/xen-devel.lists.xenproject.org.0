Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B3B7F7A6D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 18:31:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640859.999608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6a0g-0002py-1Z; Fri, 24 Nov 2023 17:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640859.999608; Fri, 24 Nov 2023 17:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6a0f-0002nV-UZ; Fri, 24 Nov 2023 17:30:33 +0000
Received: by outflank-mailman (input) for mailman id 640859;
 Fri, 24 Nov 2023 17:30:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SB6C=HF=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1r6a0d-0002YK-R9
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 17:30:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2861d191-8aef-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 18:30:27 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 4D9794EE073C;
 Fri, 24 Nov 2023 18:30:26 +0100 (CET)
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
X-Inumbo-ID: 2861d191-8aef-11ee-9b0e-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [XEN PATCH v2 0/3] xen: address violations of MISRA C:2012 Rule 13.1
Date: Fri, 24 Nov 2023 18:29:40 +0100
Message-Id: <cover.1700844359.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains some changes and deviation to address
reports of MISRA C:2012 Rule 13.1:
Initializer lists shall not contain persistent side effects

An assignment has been moved outside the initializer lists, other
violations have been deviated with SAF comments.

Function calls do not necessarily have side-effects, in these cases this
patch proposes to add ECLAIR pure, const or noeffect attributes whenever
possible.

ECLAIR pure and const attributes have the same definition of the corresponding
GCC attributes, noeffect attribute has the following definition:
"like pure but can also read volatile variable not triggering side effects"

It has been decided to avoid GCC/clang attributes to avoid potentially
dangerous optimisations from the compiler.

Changes in v2:
- prefer ECLAIR attributes over GCC attributes;
- replace ECL deviations with equivalent SAF deviations;
- deviate violations caused by harmless volatile asm;
- deviate violations caused by debug and logging macros/functions.

Simone Ballarin (3):
  automation/eclair: tag function calls to address violations of MISRA
    C:2012 Rule 13.1
  xen/arm: add SAF deviation for debugging and logging effects
  xen: address violations of MISRA C:2012 Rule 13.1

 .../ECLAIR/call_properties.ecl                | 22 +++++++++++++++++++
 docs/misra/safe.json                          | 16 ++++++++++++++
 xen/arch/arm/device.c                         |  1 +
 xen/arch/arm/guestcopy.c                      |  4 ++++
 xen/arch/x86/hvm/hvm.c                        |  1 +
 xen/common/sched/core.c                       |  3 +++
 xen/drivers/char/ns16550.c                    |  6 +++--
 7 files changed, 51 insertions(+), 2 deletions(-)

-- 
2.34.1


