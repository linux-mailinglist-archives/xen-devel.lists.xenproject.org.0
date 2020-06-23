Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBB02053E5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 15:53:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnjMF-0005yb-66; Tue, 23 Jun 2020 13:53:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ClC/=AE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jnjME-0005yW-2Z
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 13:53:02 +0000
X-Inumbo-ID: d9ab4310-b558-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9ab4310-b558-11ea-bb8b-bc764e2007e4;
 Tue, 23 Jun 2020 13:53:00 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: cBI9K2iVkwAOJvtSEJkLc9vejSk4/GsGP1TPn9bvwCwuIWGAdwOJKhxKZd0ngnmSSA4RDETZ+I
 hI4RqxGleDqRGJ8gACnqEyXvvK5be1QUNAu/StJc0xq9UT7Y41L6DDOJrZjjyLjgZ46fSl1LBC
 U3wWMIusL9/Jareoxnu3/HGJbvec6QM8iAfAz4MTm8KKtALE3GcpbyrgoSsYPaqH5LsMtoP5Dj
 ck1DzT2FM3dXsuLWEolY6ve+Vov1WEN8LMlUGOVgYbMDiABG9PXWRbAwLwN9BWsBKtZBqdNchW
 pkA=
X-SBRS: 2.7
X-MesageID: 20718358
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,271,1589256000"; d="scan'208";a="20718358"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14] mm: fix public declaration of struct
 xen_mem_acquire_resource
Date: Tue, 23 Jun 2020 15:52:46 +0200
Message-ID: <20200623135246.66170-1-roger.pau@citrix.com>
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
uint64_aligned_t is only to be used by the toolstack. Note that the
layout of the structure will be the same, as the field is already
naturally aligned to a 8 byte boundary.

No functional change expected.

Fixes: 3f8f12281dd20 ('x86/mm: add HYPERVISOR_memory_op to acquire guest resources')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Would be good to get this fixed before the release in order to avoid
shipping bogus headers. Should also be backported.
---
 xen/include/public/memory.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index dbd35305df..1767d7d5f5 100644
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
@@ -666,8 +668,6 @@ struct xen_mem_acquire_resource {
 typedef struct xen_mem_acquire_resource xen_mem_acquire_resource_t;
 DEFINE_XEN_GUEST_HANDLE(xen_mem_acquire_resource_t);
 
-#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
-
 /*
  * XENMEM_get_vnumainfo used by guest to get
  * vNUMA topology from hypervisor.
-- 
2.26.2


