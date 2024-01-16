Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C5782EE8D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 12:55:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667714.1039248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPi2H-0000Oy-NO; Tue, 16 Jan 2024 11:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667714.1039248; Tue, 16 Jan 2024 11:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPi2H-0000M7-Jp; Tue, 16 Jan 2024 11:55:17 +0000
Received: by outflank-mailman (input) for mailman id 667714;
 Tue, 16 Jan 2024 11:55:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rPi2G-00009j-Ej
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 11:55:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPi2G-00087M-2C; Tue, 16 Jan 2024 11:55:16 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPi2F-0007ED-Oq; Tue, 16 Jan 2024 11:55:15 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=Vg9wt2C8p9IZLdVpC0c8HQykip9na6+1kKIeLfSU34o=; b=t/gab+thHGymI9zQJ2+Z+jkSZU
	cJtDcFNZ1nytiSYeTr7FHIJaAFIMfJWK+BWiMb1+jjHqXyy1X/NV5hW0/FLa9cIdRRoLX72ElZOBT
	ny3nbj7CaPmaWoFegJQIrjikPQ+ESEL7BZR1QobX8FRKmqBFigclpPzf/xeC/3Kg4bTo=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: carlo.nonato@minervasys.tech,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/3] arm/smpboot: Move smp_up_cpu to a new section .data.idmap
Date: Tue, 16 Jan 2024 11:55:07 +0000
Message-Id: <20240116115509.77545-2-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116115509.77545-1-julien@xen.org>
References: <20240116115509.77545-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

With the upcoming work to color Xen, the binary will not be anymore
physically contiguous. This will be a problem during boot as the
assembly code will need to work out where each piece of Xen reside.

An easy way to solve the issue is to have all code/data accessed
by the secondary CPUs while the MMU is off within a single page.

Right now, smp_up_cpu is used by secondary CPUs to wait there turn for
booting before the MMU is on. Yet it is currently in .data which is
unlikely to be within the same page as the rest of the idmap.

Move smp_up_cpu to the recently create section .data.idmap. The idmap is
currently part of the text section and therefore will be mapped read-onl
executable. This means that we need to temporarily remap
smp_up_cpu in order to update it.

Introduce a new function set_smp_up_cpu() for this purpose so the code
is not duplicated between when opening and closing the gate.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/smpboot.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7110bc11fc05..8d508a1bb258 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -29,6 +29,10 @@
 #include <asm/psci.h>
 #include <asm/acpi.h>
 
+/* Override macros from asm/page.h to make them work with mfn_t */
+#undef virt_to_mfn
+#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
+
 cpumask_t cpu_online_map;
 cpumask_t cpu_present_map;
 cpumask_t cpu_possible_map;
@@ -56,7 +60,7 @@ struct init_info init_data =
 };
 
 /* Shared state for coordinating CPU bringup */
-unsigned long smp_up_cpu = MPIDR_INVALID;
+unsigned long __section(".data.idmap") smp_up_cpu = MPIDR_INVALID;
 /* Shared state for coordinating CPU teardown */
 static bool cpu_is_dead;
 
@@ -429,6 +433,28 @@ void stop_cpu(void)
         wfi();
 }
 
+static void set_smp_up_cpu(unsigned long mpidr)
+{
+    /*
+     * smp_up_cpu is part of the identity mapping which is read-only. So
+     * We need to re-map the region so it can be updated.
+     */
+    void *ptr = map_domain_page(virt_to_mfn(&smp_up_cpu));
+
+    ptr += PAGE_OFFSET(&smp_up_cpu);
+
+    *(unsigned long *)ptr = mpidr;
+
+    /*
+     * init_ttbr will be accessed with the MMU off, so ensure the update
+     * is visible by cleaning the cache.
+     */
+    clean_dcache(ptr);
+
+    unmap_domain_page(ptr);
+
+}
+
 int __init cpu_up_send_sgi(int cpu)
 {
     /* We don't know the GIC ID of the CPU until it has woken up, so just
@@ -460,8 +486,7 @@ int __cpu_up(unsigned int cpu)
     init_data.cpuid = cpu;
 
     /* Open the gate for this CPU */
-    smp_up_cpu = cpu_logical_map(cpu);
-    clean_dcache(smp_up_cpu);
+    set_smp_up_cpu(cpu_logical_map(cpu));
 
     rc = arch_cpu_up(cpu);
 
@@ -497,8 +522,9 @@ int __cpu_up(unsigned int cpu)
      */
     init_data.stack = NULL;
     init_data.cpuid = ~0;
-    smp_up_cpu = MPIDR_INVALID;
-    clean_dcache(smp_up_cpu);
+
+    set_smp_up_cpu(MPIDR_INVALID);
+
     arch_cpu_up_finish();
 
     if ( !cpu_online(cpu) )
-- 
2.40.1


