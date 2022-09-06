Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA985AE3A3
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 10:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399665.640901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVUQV-0007d5-R3; Tue, 06 Sep 2022 08:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399665.640901; Tue, 06 Sep 2022 08:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVUQV-0007aO-OG; Tue, 06 Sep 2022 08:59:23 +0000
Received: by outflank-mailman (input) for mailman id 399665;
 Tue, 06 Sep 2022 08:59:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YUvx=ZJ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oVUQU-0007aG-Pk
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 08:59:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 323a60c6-2dc2-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 10:59:21 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADD3E139F;
 Tue,  6 Sep 2022 01:59:26 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 146843F7B4;
 Tue,  6 Sep 2022 01:59:16 -0700 (PDT)
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
X-Inumbo-ID: 323a60c6-2dc2-11ed-a016-b9edf5238543
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 0/9] static shared memory on dom0less system
Date: Tue,  6 Sep 2022 16:58:53 +0800
Message-Id: <20220906085902.944529-1-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In safety-critical environment, it is not considered safe to
dynamically change important configurations at runtime. Everything
should be statically defined and statically verified.

In this case, if the system configuration knows a priori that there are
only 2 VMs and they need to communicate over shared memory, it is safer
to pre-configure the shared memory at build time rather than let the VMs
attempt to share memory at runtime. And it is faster too.

Furthermore, on dom0less system, the legacy way to build up communication
channels between domains, like grant table, are normally absent there.

So this patch serie introduces a set of static shared memory device tree nodes
to allow users to statically set up shared memory on dom0less system, enabling
domains to do shm-based communication.

The only way to trigger this static shared memory configuration should
be via device tree, which is at the same level as the XSM rules.

It was inspired by the patch serie of ["xl/libxl-based shared mem](
https://marc.info/?l=xen-devel&m=154404821731186ory").

Looking into related [design link](
https://lore.kernel.org/all/a50d9fde-1d06-7cda-2779-9eea9e1c0134@xen.org/T/)
for more details.

Penny Zheng (9):
  xen/arm: introduce static shared memory
  xen/arm: assign static shared memory to the default owner dom_io
  xen/arm: allocate static shared memory to a specific owner domain
  xen/arm: introduce put_page_nr and get_page_nr
  xen/arm: Add additional reference to owner domain when the owner is
    allocated
  xen/arm: set up shared memory foreign mapping for borrower domain
  xen/arm: create shared memory nodes in guest device tree
  xen/arm: enable statically shared memory on Dom0
  xen: Add static memory sharing in SUPPORT.md

 SUPPORT.md                            |   7 +
 docs/misc/arm/device-tree/booting.txt | 132 +++++++++
 xen/arch/arm/Kconfig                  |   6 +
 xen/arch/arm/bootfdt.c                | 165 +++++++++++
 xen/arch/arm/domain_build.c           | 408 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/kernel.h     |   1 +
 xen/arch/arm/include/asm/mm.h         |   4 +
 xen/arch/arm/include/asm/setup.h      |   7 +
 xen/arch/arm/mm.c                     |  42 ++-
 xen/common/domain.c                   |   3 +
 10 files changed, 766 insertions(+), 9 deletions(-)

-- 
2.25.1


