Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C0D51B634
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 04:54:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321315.542291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmRdH-0000kb-4M; Thu, 05 May 2022 02:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321315.542291; Thu, 05 May 2022 02:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmRdH-0000eK-01; Thu, 05 May 2022 02:54:23 +0000
Received: by outflank-mailman (input) for mailman id 321315;
 Thu, 05 May 2022 02:54:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1YwP=VN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nmRdG-0000cH-BW
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 02:54:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a9c3d604-cc1e-11ec-a406-831a346695d4;
 Thu, 05 May 2022 04:54:21 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9E201042;
 Wed,  4 May 2022 19:54:20 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 51FF83FA35;
 Wed,  4 May 2022 19:54:19 -0700 (PDT)
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
X-Inumbo-ID: a9c3d604-cc1e-11ec-a406-831a346695d4
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org,
	Julien Grall <julien@xen.org>,
	Wei Chen <Wei.Chen@arm.com>
Subject: [PATCH 1/2] xen/arm: Defer request_irq on secondary CPUs after local_irq_enable
Date: Thu,  5 May 2022 10:54:06 +0800
Message-Id: <20220505025407.919988-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505025407.919988-1-Henry.Wang@arm.com>
References: <20220505025407.919988-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the enhanced ASSERT_ALLOC_CONTEXT, calling request_irq before
local_irq_enable on secondary cores will lead to

(XEN) Xen call trace:
(XEN) [<000000000021d86c>] alloc_xenheap_pages+0x74/0x194 (PC)
(XEN) [<000000000021d864>] alloc_xenheap_pages+0x6c/0x194 (LR)
(XEN) [<0000000000229e90>] xmalloc_tlsf.c#xmalloc_pool_get+0x1c/0x28
(XEN) [<000000000022a270>] xmem_pool_alloc+0x21c/0x448
(XEN) [<000000000022a8dc>] _xmalloc+0x8c/0x290
(XEN) [<000000000026b57c>] request_irq+0x40/0xb8
(XEN) [<0000000000272780>] init_timer_interrupt+0x74/0xcc
(XEN) [<000000000027212c>] start_secondary+0x1b4/0x238
(XEN) [<0000000084000200>] 0000000084000200
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 4:
(XEN) Assertion '!in_irq() && (local_irq_is_enabled() ||
num_online_cpus() <= 1)' failed at common/page_alloc.c:2212
(XEN) ****************************************

on systems without a big enough pool for xmalloc() to cater the
requested size.

Reported-by: Wei Chen <Wei.Chen@arm.com>
Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Change-Id: Iebdde81f52785b0c6e037c981ff68922db016d08
---
 xen/arch/arm/smpboot.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7bfd0a73a7..a057e85ac1 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -361,9 +361,6 @@ void start_secondary(void)
 
     init_secondary_IRQ();
 
-    init_maintenance_interrupt();
-    init_timer_interrupt();
-
     set_current(idle_vcpu[cpuid]);
 
     setup_cpu_sibling_map(cpuid);
@@ -380,6 +377,10 @@ void start_secondary(void)
     cpumask_set_cpu(cpuid, &cpu_online_map);
 
     local_irq_enable();
+
+    init_maintenance_interrupt();
+    init_timer_interrupt();
+
     local_abort_enable();
 
     check_local_cpu_errata();
-- 
2.25.1


