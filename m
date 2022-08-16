Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3D45962C9
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 21:00:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388498.625163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oO1nC-0005CG-Rp; Tue, 16 Aug 2022 18:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388498.625163; Tue, 16 Aug 2022 18:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oO1nC-00059P-Op; Tue, 16 Aug 2022 18:59:58 +0000
Received: by outflank-mailman (input) for mailman id 388498;
 Tue, 16 Aug 2022 18:59:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oO1nB-00059H-Ax
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 18:59:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oO1nB-0004Pk-0e; Tue, 16 Aug 2022 18:59:57 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oO1nA-0001Am-O1; Tue, 16 Aug 2022 18:59:56 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=D98GVDZfQ8TCxXBLkFuwake+DQisiai93uMoMlFu4B0=; b=OISsjH
	fAKMW6PRWj6Oo5hq+5kicslYSUXJO5gJYxnlhM6jKmLnwKEXB4EOjChVZnuq6v3e8WhfzazCXYaZ/
	VtNrkOyX9cwj84dnsexNHlXn48Cu39hLNcSFGuQEzKsom+DjSBJ8AoOnhewGTTA4AsguX5zY55Zzk
	FwFOUrBoARc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for-4.17] xen/arm: Support properly __ro_after_init on Arm
Date: Tue, 16 Aug 2022 19:59:54 +0100
Message-Id: <20220816185954.31945-1-julien@xen.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

__ro_after_init was introduced recently to prevent modifying
some variables after init.

At the moment, on Arm, the variables will still be accessible
because the region permission is not updated.

Address that, but moving the sections .data.ro_after_init
out of .data and then mark the region read-only once we finish
to boot.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

This patch is targeting Xen 4.17. There are quite a few arm
specific variables that could be switch to use __ro_after_init.

This is not addressed by the commit. We could consider to switch
some of them for Xen 4.17. So the benefits for now is any common
variables using __ro_after_init.
---
 xen/arch/arm/include/asm/setup.h |  2 ++
 xen/arch/arm/setup.c             | 14 ++++++++++++++
 xen/arch/arm/xen.lds.S           |  7 +++++++
 3 files changed, 23 insertions(+)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 2bb01ecfa88f..5815ccf8c5cc 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -137,6 +137,8 @@ u32 device_tree_get_u32(const void *fdt, int node,
 int map_range_to_domain(const struct dt_device_node *dev,
                         u64 addr, u64 len, void *data);
 
+extern const char __ro_after_init_start[], __ro_after_init_end[];
+
 #endif
 /*
  * Local variables:
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 500307edc08d..5bde321b9d07 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -75,10 +75,24 @@ domid_t __read_mostly max_init_domid;
 
 static __used void init_done(void)
 {
+    int rc;
+
     /* Must be done past setting system_state. */
     unregister_init_virtual_region();
 
     free_init_memory();
+
+    /*
+     * We have finished to boot. Mark the section .data.ro_after_init
+     * read-only.
+     */
+    rc = modify_xen_mappings((unsigned long)&__ro_after_init_start,
+                             (unsigned long)&__ro_after_init_end,
+                             PAGE_HYPERVISOR_RO);
+    if ( rc )
+        panic("Unable to mark the .data.ro_after_init section read-only (rc = %d)\n",
+              rc);
+
     startup_cpu_idle_loop();
 }
 
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 1e986e211f68..92c298405259 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -83,6 +83,13 @@ SECTIONS
   _erodata = .;                /* End of read-only data */
 
   . = ALIGN(PAGE_SIZE);
+  .data.ro_after_init : {
+      __ro_after_init_start = .;
+      *(.data.ro_after_init)
+      . = ALIGN(PAGE_SIZE);
+      __ro_after_init_end = .;
+  } : text
+
   .data.read_mostly : {
        /* Exception table */
        __start___ex_table = .;
-- 
2.37.1


