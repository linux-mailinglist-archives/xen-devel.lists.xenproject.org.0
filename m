Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB2F5510E0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:03:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352418.579179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRH-0001aa-H7; Mon, 20 Jun 2022 07:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352418.579179; Mon, 20 Jun 2022 07:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRH-0001Yz-Df; Mon, 20 Jun 2022 07:03:11 +0000
Received: by outflank-mailman (input) for mailman id 352418;
 Mon, 20 Jun 2022 07:03:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k7+S=W3=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o3BRF-0001Yr-Qn
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:03:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 0981acb4-f067-11ec-bd2d-47488cf2e6aa;
 Mon, 20 Jun 2022 09:03:07 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2382C1042;
 Mon, 20 Jun 2022 00:03:07 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.35.125])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FEC63F5A1;
 Mon, 20 Jun 2022 00:03:03 -0700 (PDT)
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
X-Inumbo-ID: 0981acb4-f067-11ec-bd2d-47488cf2e6aa
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 0/9] MISRA C 2012 8.1 rule fixes
Date: Mon, 20 Jun 2022 09:02:36 +0200
Message-Id: <20220620070245.77979-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes all the findings for MISRA C 2012 8.1 rule, reported by
cppcheck 2.7 with misra addon, for Arm (arm32/arm64 - target allyesconfig).
Fixing this rule comes down to replacing implicit 'unsigned' with explicit
'unsigned int' type as there are no other violations being part of that rule
in the Xen codebase.

The last three patches contain fixes for files that originated from other
projects like Linux kernel or libfdt, therefore they are rather not applicable
to be fixed in Xen (they can be dropped). Nevertheless they act as a sign to
what should be added to a deviation list.

Some important notes:
Static analyzers are not perfect. Cppcheck generates internal AST error for some
of the files resulting in skipping all the checks. For these files, one need to
manually check if there are no findings.

Recently there was a release of a new Cppcheck 2.8 version. However it contains
a regression bug with misra addon. Therefore do not use that version for now.

Michal Orzel (9):
  xen/arm: Use explicitly specified types
  xen/domain: Use explicitly specified types
  xen/common: Use explicitly specified types
  include/xen: Use explicitly specified types
  include/public: Use explicitly specified types
  xsm/flask: Use explicitly specified types
  common/libfdt: Use explicitly specified types
  common/inflate: Use explicitly specified types
  drivers/acpi: Use explicitly specified types

 xen/arch/arm/domain_build.c             |   2 +-
 xen/arch/arm/guestcopy.c                |  13 +-
 xen/arch/arm/include/asm/arm32/bitops.h |   8 +-
 xen/arch/arm/include/asm/fixmap.h       |   4 +-
 xen/arch/arm/include/asm/guest_access.h |   8 +-
 xen/arch/arm/include/asm/mm.h           |   2 +-
 xen/arch/arm/irq.c                      |   2 +-
 xen/arch/arm/kernel.c                   |   2 +-
 xen/arch/arm/mm.c                       |   4 +-
 xen/common/domain.c                     |   2 +-
 xen/common/grant_table.c                |   6 +-
 xen/common/gunzip.c                     |   8 +-
 xen/common/inflate.c                    | 166 ++++++++++++------------
 xen/common/libfdt/fdt_ro.c              |   4 +-
 xen/common/libfdt/fdt_rw.c              |   2 +-
 xen/common/libfdt/fdt_sw.c              |   2 +-
 xen/common/libfdt/fdt_wip.c             |   2 +-
 xen/common/sched/cpupool.c              |   4 +-
 xen/common/trace.c                      |   2 +-
 xen/drivers/acpi/tables/tbfadt.c        |   2 +-
 xen/drivers/acpi/tables/tbutils.c       |   2 +-
 xen/include/public/physdev.h            |   4 +-
 xen/include/public/sysctl.h             |  10 +-
 xen/include/xen/domain.h                |   2 +-
 xen/include/xen/perfc.h                 |   2 +-
 xen/include/xen/sched.h                 |   6 +-
 xen/xsm/flask/ss/avtab.c                |   2 +-
 27 files changed, 137 insertions(+), 136 deletions(-)

-- 
2.25.1


