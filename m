Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD53C5248A2
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 11:12:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327490.550306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np4rk-0000Mr-QY; Thu, 12 May 2022 09:12:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327490.550306; Thu, 12 May 2022 09:12:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np4rk-0000KA-NQ; Thu, 12 May 2022 09:12:12 +0000
Received: by outflank-mailman (input) for mailman id 327490;
 Thu, 12 May 2022 09:12:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsCQ=VU=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1np4rk-0000K4-2M
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 09:12:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 99eafa16-d1d3-11ec-a406-831a346695d4;
 Thu, 12 May 2022 11:12:10 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C42B8106F;
 Thu, 12 May 2022 02:12:08 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 36F2A3F73D;
 Thu, 12 May 2022 02:12:04 -0700 (PDT)
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
X-Inumbo-ID: 99eafa16-d1d3-11ec-a406-831a346695d4
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
Subject: [PATCH v3 0/8] static shared memory on dom0less system 
Date: Thu, 12 May 2022 17:11:21 +0800
Message-Id: <20220512091129.2802997-1-Penny.Zheng@arm.com>
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

Penny Zheng (8):
  xen/arm: introduce static shared memory
  xen/arm: allocate static shared memory to the default owner dom_io
  xen/arm: allocate static shared memory to a specific owner domain
  xen/arm: introduce put_page_nr and get_page_nr
  xen/arm: Add additional reference to owner domain when the owner is
    allocated
  xen/arm: set up shared memory foreign mapping for borrower domain
  xen/arm: create shared memory nodes in guest device tree
  xen/arm: enable statically shared memory on Dom0

 docs/misc/arm/device-tree/booting.txt | 120 ++++++++
 xen/arch/arm/Kconfig                  |   6 +
 xen/arch/arm/bootfdt.c                |  68 +++++
 xen/arch/arm/domain_build.c           | 378 +++++++++++++++++++++++++-
 xen/arch/arm/include/asm/kernel.h     |   1 +
 xen/arch/arm/include/asm/mm.h         |   4 +
 xen/arch/arm/include/asm/setup.h      |   4 +
 xen/arch/arm/mm.c                     |  36 ++-
 xen/common/domain.c                   |   5 +
 9 files changed, 612 insertions(+), 10 deletions(-)

-- 
2.25.1


