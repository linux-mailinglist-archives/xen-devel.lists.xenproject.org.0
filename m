Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D6F714207
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 04:27:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540493.842304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3Sbn-0004tC-Co; Mon, 29 May 2023 02:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540493.842304; Mon, 29 May 2023 02:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3Sbn-0004l6-5p; Mon, 29 May 2023 02:27:43 +0000
Received: by outflank-mailman (input) for mailman id 540493;
 Mon, 29 May 2023 02:27:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x08u=BS=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1q3SUh-0006GL-IW
 for xen-devel@lists.xenproject.org; Mon, 29 May 2023 02:20:23 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5ce5dd70-fdc7-11ed-8611-37d641c3527e;
 Mon, 29 May 2023 04:20:22 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3C84AB6;
 Sun, 28 May 2023 19:21:06 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0BE463F64C;
 Sun, 28 May 2023 19:20:18 -0700 (PDT)
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
X-Inumbo-ID: 5ce5dd70-fdc7-11ed-8611-37d641c3527e
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v5 14/17] xen/arm: use CONFIG_NUMA to gate node_online_map in smpboot
Date: Mon, 29 May 2023 10:19:18 +0800
Message-Id: <20230529021921.2606623-15-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230529021921.2606623-1-Henry.Wang@arm.com>
References: <20230529021921.2606623-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

node_online_map in smpboot is still needed for Arm when NUMA is
turned off by Kconfig.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v4 -> v5:
1. No change.
v3 -> v4:
1. No change.
v2 -> v3:
1. No change.
v1 -> v2:
1. No change.
---
 xen/arch/arm/smpboot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7506085540..eedbb57291 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -41,8 +41,10 @@ integer_param("maxcpus", max_cpus);
 /* CPU logical map: map xen cpuid to an MPIDR */
 register_t __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = MPIDR_INVALID };
 
+#ifndef CONFIG_NUMA
 /* Fake one node for now. See also asm/numa.h */
 nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
+#endif
 
 /* Xen stack for bringing up the first CPU. */
 static unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
-- 
2.25.1


