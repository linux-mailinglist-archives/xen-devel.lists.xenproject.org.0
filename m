Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDFB4CDBFF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284406.483679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCU5-0002NX-55; Fri, 04 Mar 2022 18:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284406.483679; Fri, 04 Mar 2022 18:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCU4-0002DV-Mb; Fri, 04 Mar 2022 18:16:56 +0000
Received: by outflank-mailman (input) for mailman id 284406;
 Fri, 04 Mar 2022 17:47:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC21-0005R5-KP
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:47:57 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38adf329-9be3-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 18:47:55 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC1y-0008PQ-U7; Fri, 04 Mar 2022 18:47:55 +0100
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
X-Inumbo-ID: 38adf329-9be3-11ec-8539-5f4723681683
From: Marco Solieri <marco.solieri@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Marco Solieri <marco.solieri@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@unimore.it>,
	Andrea Bastoni <andrea.bastoni@minervasys.tech>,
	Luca Miccio <lucmiccio@gmail.com>
Subject: [PATCH 03/36] xen/arm: restore xen_paddr argument in setup_pagetables
Date: Fri,  4 Mar 2022 18:46:28 +0100
Message-Id: <20220304174701.1453977-4-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Coloring support will re-enable part of the Xen relocation since the
underlying idea is to "relocate using coloring" for the hypervisors
itself.
We setup a target region that will be used exclusively from Xen and
it will be mapped using the coloring configuration of the hypervisor.
Part of the relocation we need to bring back is the usage of xen_paddr
variable that will tell us the physical start address where Xen is
located.
Add this variable to the setup_pagetables function and set it properly
when coloring is not enabled.
Later on it will be initialized accordingly whether the coloring support
is enabled or not.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
---
 xen/arch/arm/include/asm/mm.h | 2 +-
 xen/arch/arm/mm.c             | 2 +-
 xen/arch/arm/setup.c          | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 424aaf2823..487be7cf59 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -176,7 +176,7 @@ extern unsigned long total_pages;
 #define PDX_GROUP_SHIFT SECOND_SHIFT
 
 /* Boot-time pagetable setup */
-extern void setup_pagetables(unsigned long boot_phys_offset);
+extern void setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr);
 /* Map FDT in boot pagetable */
 extern void *early_fdt_map(paddr_t fdt_paddr);
 /* Remove early mappings */
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index e6381e46e6..fd7a313d88 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -634,7 +634,7 @@ static void clear_table(void *table)
 
 /* Boot-time pagetable setup.
  * Changes here may need matching changes in head.S */
-void __init setup_pagetables(unsigned long boot_phys_offset)
+void __init setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr)
 {
     uint64_t ttbr;
     lpae_t pte, *p;
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 100b322b3e..b8d4f50d90 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -867,6 +867,7 @@ void __init start_xen(unsigned long boot_phys_offset,
     struct bootmodule *xen_bootmodule;
     struct domain *d;
     int rc;
+    paddr_t xen_paddr = (paddr_t)(_start + boot_phys_offset);
 
     dcache_line_bytes = read_dcache_line_bytes();
 
@@ -893,12 +894,11 @@ void __init start_xen(unsigned long boot_phys_offset,
     cmdline_parse(cmdline);
 
     /* Register Xen's load address as a boot module. */
-    xen_bootmodule = add_boot_module(BOOTMOD_XEN,
-                             (paddr_t)(uintptr_t)(_start + boot_phys_offset),
+    xen_bootmodule = add_boot_module(BOOTMOD_XEN, xen_paddr,
                              (paddr_t)(uintptr_t)(_end - _start + 1), false);
     BUG_ON(!xen_bootmodule);
 
-    setup_pagetables(boot_phys_offset);
+    setup_pagetables(boot_phys_offset, xen_paddr);
 
     setup_mm();
 
-- 
2.30.2


