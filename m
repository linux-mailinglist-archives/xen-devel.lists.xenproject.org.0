Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD5C62900E
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 03:53:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443634.698297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4G-000068-6F; Tue, 15 Nov 2022 02:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443634.698297; Tue, 15 Nov 2022 02:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4G-0008Vz-2h; Tue, 15 Nov 2022 02:52:56 +0000
Received: by outflank-mailman (input) for mailman id 443634;
 Tue, 15 Nov 2022 02:52:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkVF=3P=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oum4E-0008Vs-7U
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 02:52:54 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 982235b4-6490-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 03:52:51 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEE8B11FB;
 Mon, 14 Nov 2022 18:52:56 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1ECA93F73B;
 Mon, 14 Nov 2022 18:52:46 -0800 (PST)
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
X-Inumbo-ID: 982235b4-6490-11ed-8fd2-01056ac49cbb
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
Subject: [PATCH V1 00/13 for 4.17-post] Follow-up static shared memory
Date: Tue, 15 Nov 2022 10:52:22 +0800
Message-Id: <20221115025235.1378931-1-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some unsolving issues on current 4.17 static shared memory
feature[1], including:
- In order to avoid keeping growing 'membank', having the shared memory
regions in a separate array is preferred. And shared memory region should
have its own structure which would contain a pointer/index to the 'membank'.
- Missing implementation on having the host address optional in
"xen,shared-mem" property
- Missing "xen,offset" feature, which is introduced in Linux DOC[2]

After fixing all above issues, we'd like to make 'UNSUPPORTED' static
shared memory feature 'SUPPORTED'.

[1] https://lore.kernel.org/all/20220908135513.1800511-1-Penny.Zheng@arm.com/
[2] https://www.kernel.org/doc/Documentation/devicetree/bindings/reserved-memory/xen%2Cshared-memory.txt

Penny Zheng (13):
  xen/arm: re-arrange the static shared memory region
  xen/arm: switch to use shm_membank as function parameter
  xen/arm: introduce allocate_domheap_memory and guest_physmap_memory
  xen/arm: expand shm_membank for unprovided host address
  xen/arm: allocate shared memory from heap when host address not
    provided
  xen/arm: assign shared memory to owner when host address not provided
  xen/arm: map shared memory to borrower when host address not provided
  xen/arm: use paddr_assigned to indicate whether host address is
    provided
  xen/arm: refine docs about static shared memory
  xen/arm: introduce "xen,offset" feature
  xen/arm: implement "xen,offset" feature when host address provided
  xen/arm: implement "xen,offset" feature when host address not provided
  xen: make static shared memory supported in SUPPORT.md

 SUPPORT.md                            |   2 +-
 docs/misc/arm/device-tree/booting.txt |  67 ++-
 xen/arch/arm/Kconfig                  |   2 +-
 xen/arch/arm/bootfdt.c                | 137 ++++--
 xen/arch/arm/domain_build.c           | 614 +++++++++++++++++++++-----
 xen/arch/arm/include/asm/kernel.h     |   2 +-
 xen/arch/arm/include/asm/setup.h      |  31 +-
 7 files changed, 685 insertions(+), 170 deletions(-)

-- 
2.25.1


