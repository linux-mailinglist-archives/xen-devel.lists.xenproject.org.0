Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B862364EB46
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 13:18:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464574.723088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69es-0000zU-Vv; Fri, 16 Dec 2022 12:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464574.723088; Fri, 16 Dec 2022 12:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69es-0000jM-7t; Fri, 16 Dec 2022 12:17:46 +0000
Received: by outflank-mailman (input) for mailman id 464574;
 Fri, 16 Dec 2022 12:17:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69ek-0007M6-5n
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 12:17:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69ek-00035J-3O; Fri, 16 Dec 2022 12:17:38 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69DK-0004sN-J4; Fri, 16 Dec 2022 11:49:18 +0000
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
	bh=Fh/+Yu2IVhcS+oFNJd/xfdw1K28l8x0te4dRw3BaaIo=; b=NXmxWhqOxfDRQJ/rW5WuU3OJ5s
	vMl2K4A1hRxKwHrWg3G08Rp4Qg4ldVys3xXHuuAxC6LgWtm76+LLv248VGkTcSG3zdqk2n6zZzcNF
	+boDbASPWG/EK7ni00T4BnJUbLmgMquxER9VoZRGv/lP/F5XzH3s1wXypmXAKinjwa2s=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Hongyan Xia <hongyxia@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH 16/22] x86/setup: leave early boot slightly earlier
Date: Fri, 16 Dec 2022 11:48:47 +0000
Message-Id: <20221216114853.8227-17-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216114853.8227-1-julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyan Xia <hongyxia@amazon.com>

When we do not have a direct map, memory for metadata of heap nodes in
init_node_heap() is allocated from xenheap, which needs to be mapped and
unmapped on demand. However, we cannot just take memory from the boot
allocator to create the PTEs while we are passing memory to the heap
allocator.

To solve this race, we leave early boot slightly sooner so that Xen PTE
pages are allocated from the heap instead of the boot allocator. We can
do this because the metadata for the 1st node is statically allocated,
and by the time we need memory to create mappings for the 2nd node, we
already have enough memory in the heap allocator in the 1st node.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/x86/setup.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2cb051c6e4e7..ec5a7448a225 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1648,6 +1648,22 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     numa_initmem_init(0, raw_max_page);
 
+    /*
+     * When we do not have a direct map, memory for metadata of heap nodes in
+     * init_node_heap() is allocated from xenheap, which needs to be mapped and
+     * unmapped on demand. However, we cannot just take memory from the boot
+     * allocator to create the PTEs while we are passing memory to the heap
+     * allocator during end_boot_allocator().
+     *
+     * To solve this race, we need to leave early boot before
+     * end_boot_allocator() so that Xen PTE pages are allocated from the heap
+     * instead of the boot allocator. We can do this because the metadata for
+     * the 1st node is statically allocated, and by the time we need memory to
+     * create mappings for the 2nd node, we already have enough memory in the
+     * heap allocator in the 1st node.
+     */
+    system_state = SYS_STATE_boot;
+
     if ( max_page - 1 > virt_to_mfn(HYPERVISOR_VIRT_END - 1) )
     {
         unsigned long limit = virt_to_mfn(HYPERVISOR_VIRT_END - 1);
@@ -1677,8 +1693,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     else
         end_boot_allocator();
 
-    system_state = SYS_STATE_boot;
-
     bsp_stack = cpu_alloc_stack(0);
     if ( !bsp_stack )
         panic("No memory for BSP stack\n");
-- 
2.38.1


