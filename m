Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C43F3309631
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 16:23:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78926.143676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5s4n-00068l-Oh; Sat, 30 Jan 2021 15:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78926.143676; Sat, 30 Jan 2021 15:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5s4n-00068M-L9; Sat, 30 Jan 2021 15:22:17 +0000
Received: by outflank-mailman (input) for mailman id 78926;
 Sat, 30 Jan 2021 15:22:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l5s4l-00068H-QN
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 15:22:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5s4k-0001PM-4Y; Sat, 30 Jan 2021 15:22:14 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5s4j-00030l-Oc; Sat, 30 Jan 2021 15:22:13 +0000
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
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=qOiXMDevhm0RwhWScyWMR1qp3ZEzs7jvG4bra0f+F5U=; b=KGZxHa+0vhdA5t1dbUcS453QU3
	PIMUpECWtLnCmdTZV7uRuOxUXNue0cza96861OZQ/uwh1Z5H1juxruv6EiLmxhTVtVVEiBt16WQIY
	ptJz5G8n3hvHRBWETCyAESS+N9+sFxkXvE3SKhQkE7DBpFyWopDwmE/wdDWqFLb2jzYs=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH for-4.15] xen/mm: Fix build when CONFIG_HVM=n and CONFIG_COVERAGE=y
Date: Sat, 30 Jan 2021 15:22:10 +0000
Message-Id: <20210130152210.17503-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Xen is heavily relying on the DCE stage to remove unused code so the
linker doesn't throw an error because a function is not implemented
yet we defined a prototype for it.

On some GCC version (such as 9.4 provided by Debian sid), the compiler
will DCE stage will not managed to figure that out for
xenmem_add_to_physmap_batch():

ld: ld: prelink.o: in function `xenmem_add_to_physmap_batch':
/xen/xen/common/memory.c:942: undefined reference to `xenmem_add_to_physmap_one'
/xen/xen/common/memory.c:942:(.text+0x22145): relocation truncated
to fit: R_X86_64_PLT32 against undefined symbol `xenmem_add_to_physmap_one'
prelink-efi.o: in function `xenmem_add_to_physmap_batch':
/xen/xen/common/memory.c:942: undefined reference to `xenmem_add_to_physmap_one'
make[2]: *** [Makefile:215: /root/xen/xen/xen.efi] Error 1
make[2]: *** Waiting for unfinished jobs....
ld: /xen/xen/.xen-syms.0: hidden symbol `xenmem_add_to_physmap_one' isn't defined
ld: final link failed: bad value

It is not entirely clear why the compiler DCE is not detecting the
unused code. However, moving the permission check from do_memory_op()
to xenmem_add_to_physmap_batch() does the trick.

Note that this required to move the implementation of
xapt_permision_check() earlier on so it can be called in
xemem_add_to_physmap_batch().

No functional change intended.

Fixes: d4f699a0df6c ("x86/mm: p2m_add_foreign() is HVM-only")
Reported-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

This also resolves a randconfig issue on the gitlab CI.

The gitlab CI is used to provide basic testing on a per-series basis. So
I would like to request this patch to be merged in Xen 4.15 in order to
reduce the number of failure not related to the series tested.

Note that there are a few more randconfig issues that needs to be
addressed.
---
 xen/common/memory.c | 44 +++++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 01cab7e4930e..b047a93a703a 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -898,11 +898,32 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
     return rc;
 }
 
+static long xatp_permission_check(struct domain *d, unsigned int space)
+{
+    if ( !paging_mode_translate(d) )
+        return -EACCES;
+
+    /*
+     * XENMAPSPACE_dev_mmio mapping is only supported for hardware Domain
+     * to map this kind of space to itself.
+     */
+    if ( (space == XENMAPSPACE_dev_mmio) &&
+         (!is_hardware_domain(d) || (d != current->domain)) )
+        return -EACCES;
+
+    return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
+}
+
 static int xenmem_add_to_physmap_batch(struct domain *d,
                                        struct xen_add_to_physmap_batch *xatpb,
                                        unsigned int extent)
 {
     union add_to_physmap_extra extra = {};
+    int rc;
+
+    rc = xatp_permission_check(d, xatpb->space);
+    if ( rc )
+        return rc;
 
     if ( unlikely(xatpb->size < extent) )
         return -EILSEQ;
@@ -1038,22 +1059,6 @@ static int get_reserved_device_memory(xen_pfn_t start, xen_ulong_t nr,
 }
 #endif
 
-static long xatp_permission_check(struct domain *d, unsigned int space)
-{
-    if ( !paging_mode_translate(d) )
-        return -EACCES;
-
-    /*
-     * XENMAPSPACE_dev_mmio mapping is only supported for hardware Domain
-     * to map this kind of space to itself.
-     */
-    if ( (space == XENMAPSPACE_dev_mmio) &&
-         (!is_hardware_domain(d) || (d != current->domain)) )
-        return -EACCES;
-
-    return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
-}
-
 unsigned int ioreq_server_max_frames(const struct domain *d)
 {
     unsigned int nr = 0;
@@ -1442,13 +1447,6 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( d == NULL )
             return -ESRCH;
 
-        rc = xatp_permission_check(d, xatpb.space);
-        if ( rc )
-        {
-            rcu_unlock_domain(d);
-            return rc;
-        }
-
         rc = xenmem_add_to_physmap_batch(d, &xatpb, start_extent);
 
         rcu_unlock_domain(d);
-- 
2.17.1


