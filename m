Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7084F20A0B4
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 16:17:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joSgX-0007jt-At; Thu, 25 Jun 2020 14:17:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTrP=AG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1joSgV-0007jg-Vs
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 14:17:00 +0000
X-Inumbo-ID: 87646b58-b6ee-11ea-81cf-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87646b58-b6ee-11ea-81cf-12813bfff9fa;
 Thu, 25 Jun 2020 14:16:58 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: EqW+1j5bkr9fnOD2kB1so+dXq6NAG8gpKPl7tJHqY3zrRXb9WZ63oKOlAOV5E6CbaldIP/UBWy
 ZWWkWBcI60A7fct9aS1b77grPoYM5x5mPXKxR9AGxqw/yqjsl2RPny6SJo/GHexFpucJrG4jr4
 bfE1Bf5UhT8u01/YHFSJF37aUxblWZfyNiCSPNstE+9K6t1gmyk2u6zdkiwgIJnbXPkcB6Fyp1
 kMwddKqVP6+e8L/teeDfroCResPyR74rVAakkwBJnIeB0ujQkvI62VlmwKvvCK0hMVTxHWACYe
 vGg=
X-SBRS: 2.7
X-MesageID: 21232246
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,279,1589256000"; d="scan'208";a="21232246"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 v2] mm: fix public declaration of struct
 xen_mem_acquire_resource
Date: Thu, 25 Jun 2020 16:16:43 +0200
Message-ID: <20200625141643.82822-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

XENMEM_acquire_resource and it's related structure is currently inside
a __XEN__ or __XEN_TOOLS__ guarded section to limit it's scope to the
hypervisor or the toolstack only. This is wrong as the hypercall is
already being used by the Linux kernel at least, and as such needs to
be public.

Also switch the usage of uint64_aligned_t to plain uint64_t, as
uint64_aligned_t is only to be used by the toolstack. Note that a
padding field is added on 32bit x86, so that the size of the structure
is the same.

No layout structure change. The structure doesn't need to be adjusted
on 32bit Arm, because guest handlers are already expanded to 64bits.

Fixes: 3f8f12281dd20 ('x86/mm: add HYPERVISOR_memory_op to acquire guest resources')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Should also be backported.
---
Changes since v1:
 - Add padding on 32bits so structure size matches between arches and
   the previous layout is kept.
---
 xen/include/public/memory.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index dbd35305df..b6d3587cfa 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -607,6 +607,8 @@ struct xen_reserved_device_memory_map {
 typedef struct xen_reserved_device_memory_map xen_reserved_device_memory_map_t;
 DEFINE_XEN_GUEST_HANDLE(xen_reserved_device_memory_map_t);
 
+#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
+
 /*
  * Get the pages for a particular guest resource, so that they can be
  * mapped directly by a tools domain.
@@ -645,7 +647,7 @@ struct xen_mem_acquire_resource {
      * IN - the index of the initial frame to be mapped. This parameter
      *      is ignored if nr_frames is 0.
      */
-    uint64_aligned_t frame;
+    uint64_t frame;
 
 #define XENMEM_resource_ioreq_server_frame_bufioreq 0
 #define XENMEM_resource_ioreq_server_frame_ioreq(n) (1 + (n))
@@ -662,12 +664,14 @@ struct xen_mem_acquire_resource {
      *          This parameter may be NULL if nr_frames is 0.
      */
     XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
+
+#ifdef __i386__
+    uint32_t pad2;
+#endif
 };
 typedef struct xen_mem_acquire_resource xen_mem_acquire_resource_t;
 DEFINE_XEN_GUEST_HANDLE(xen_mem_acquire_resource_t);
 
-#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
-
 /*
  * XENMEM_get_vnumainfo used by guest to get
  * vNUMA topology from hypervisor.
-- 
2.26.2


