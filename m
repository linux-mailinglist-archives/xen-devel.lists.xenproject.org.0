Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 889BA80C694
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 11:31:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651594.1017315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCdYb-0005D6-DR; Mon, 11 Dec 2023 10:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651594.1017315; Mon, 11 Dec 2023 10:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCdYb-0005BM-8O; Mon, 11 Dec 2023 10:30:37 +0000
Received: by outflank-mailman (input) for mailman id 651594;
 Mon, 11 Dec 2023 10:30:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtsV=HW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rCdYZ-00059V-GZ
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 10:30:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 508176d3-9810-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 11:30:33 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 584A64EE073E;
 Mon, 11 Dec 2023 11:30:31 +0100 (CET)
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
X-Inumbo-ID: 508176d3-9810-11ee-98e8-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [XEN PATCH 0/7] address violations of MISRA C:2012 Rule 2.1
Date: Mon, 11 Dec 2023 11:30:21 +0100
Message-Id: <cover.1702283415.git.nicola.vetrini@bugseng.com>
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

Nicola Vetrini (7):
  xen/shutdown: address MISRA C:2012 Rule 2.1
  x86/mm: address MISRA C:2012 Rule 2.1
  xen/arm: address MISRA C:2012 Rule 2.1
  xen/sched: address MISRA C:2012 Rule 2.1
  xen/arm: traps: add ASSERT_UNREACHABLE() where needed
  x86/platform: removed break to address MISRA C:2012 Rule 2.1
  x86/xstate: move BUILD_BUG_ON to address MISRA C:2012 Rule 2.1

 xen/arch/arm/mm.c                 |  2 +-
 xen/arch/arm/traps.c              |  6 +++---
 xen/arch/arm/vgic-v3-its.c        | 10 +++++-----
 xen/arch/x86/mm.c                 |  6 +++---
 xen/arch/x86/platform_hypercall.c |  1 -
 xen/arch/x86/xstate.c             |  3 ++-
 xen/common/sched/core.c           |  1 -
 xen/common/shutdown.c             | 11 ++---------
 xen/include/xen/shutdown.h        |  2 +-
 9 files changed, 17 insertions(+), 25 deletions(-)

-- 
2.34.1

