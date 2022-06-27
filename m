Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7954055B9C9
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 15:16:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356600.584845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ob4-0005KL-PW; Mon, 27 Jun 2022 13:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356600.584845; Mon, 27 Jun 2022 13:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ob4-0005HS-Mf; Mon, 27 Jun 2022 13:16:10 +0000
Received: by outflank-mailman (input) for mailman id 356600;
 Mon, 27 Jun 2022 13:16:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXPS=XC=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o5ob3-0005HM-Gf
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 13:16:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4adb00ea-f61b-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 15:16:02 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 238DD1758;
 Mon, 27 Jun 2022 06:16:06 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.42.186])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 905533F5A1;
 Mon, 27 Jun 2022 06:16:01 -0700 (PDT)
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
X-Inumbo-ID: 4adb00ea-f61b-11ec-b725-ed86ccbb4733
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
Subject: [PATCH 0/7] xen/arm: use unsigned int instead of plain unsigned
Date: Mon, 27 Jun 2022 15:15:36 +0200
Message-Id: <20220627131543.410971-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is done purely for cosmetic/style reasons (as we tend to use unsigned int
more often than just unsigned) and not to waste changes made as part of [1]
series that contained invalid justification (this is not fixing MISRA 8.1 rule).

Most of these patches have already been reviewed/acked but because of changing
the commit messages/titles the tags are dropped now.

[1] https://lore.kernel.org/all/e6c10adc-27a8-2f31-7d84-6aee916c56bf@suse.com/t/


Michal Orzel (7):
  xen/arm: Use unsigned int instead of plain unsigned
  xen/domain: Use unsigned int instead of plain unsigned
  xen/common: Use unsigned int instead of plain unsigned
  include/xen: Use unsigned int instead of plain unsigned
  include/public: Use uint32_t instead of unsigned (int)
  xsm/flask: Use unsigned int instead of plain unsigned
  drivers/acpi: Drop the unneeded casts to unsigned

 xen/arch/arm/domain_build.c             |  2 +-
 xen/arch/arm/guestcopy.c                | 13 +++++++------
 xen/arch/arm/include/asm/arm32/bitops.h |  8 ++++----
 xen/arch/arm/include/asm/fixmap.h       |  4 ++--
 xen/arch/arm/include/asm/guest_access.h |  8 ++++----
 xen/arch/arm/include/asm/mm.h           |  2 +-
 xen/arch/arm/irq.c                      |  2 +-
 xen/arch/arm/kernel.c                   |  2 +-
 xen/arch/arm/mm.c                       |  4 ++--
 xen/common/domain.c                     |  2 +-
 xen/common/grant_table.c                |  6 +++---
 xen/common/gunzip.c                     |  8 ++++----
 xen/common/sched/cpupool.c              |  4 ++--
 xen/common/trace.c                      |  2 +-
 xen/drivers/acpi/tables/tbfadt.c        |  6 +++---
 xen/drivers/acpi/tables/tbutils.c       |  1 -
 xen/include/public/physdev.h            |  4 ++--
 xen/include/public/sysctl.h             | 10 +++++-----
 xen/include/xen/domain.h                |  2 +-
 xen/include/xen/perfc.h                 |  2 +-
 xen/include/xen/sched.h                 |  2 +-
 xen/xsm/flask/ss/avtab.c                |  2 +-
 22 files changed, 48 insertions(+), 48 deletions(-)

-- 
2.25.1


