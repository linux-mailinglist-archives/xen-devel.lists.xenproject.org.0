Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE9920B4E4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 17:40:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joqSY-0007YA-II; Fri, 26 Jun 2020 15:40:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Q51=AH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1joqSW-0007Y4-Rg
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 15:40:08 +0000
X-Inumbo-ID: 4fb8982a-b7c3-11ea-bca7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fb8982a-b7c3-11ea-bca7-bc764e2007e4;
 Fri, 26 Jun 2020 15:40:07 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /5VOdIWJ0MeIXeWPlncNGlg2m0KLFGjmtBDH4eRiW3TJeFGSGFz7nnYQdJlNXA89nwZZ8hwx4R
 fpWnGtnJx9Zq128WdeIli8yJr3SSUDjF6IHCpOBJng5nrApvWbaRcI9nyOuywyTZobFcO9yKwl
 IzTCButeBh3cThHU6s1ZsRH028/Din4D53VtcAIfe+855VbHpvjh3zh4NU49YneKn0HIREK3hr
 lFpPPyVqoulex0hCys6+Og1VLAbGSmLmSYQw6MsBDYn7ZC7cuhYZaCvebvm679lJ4+fMNK8GiF
 5IY=
X-SBRS: 2.7
X-MesageID: 21380212
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,284,1589256000"; d="scan'208";a="21380212"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 v3] mm: fix public declaration of struct
 xen_mem_acquire_resource
Date: Fri, 26 Jun 2020 17:39:51 +0200
Message-ID: <20200626153951.91301-1-roger.pau@citrix.com>
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
uint64_aligned_t is only to be used by the toolstack. Doing such
change will reduce the size of the structure on 32bit x86 by 4bytes,
since there will be no padding added after the frame_list handle.

This is fine, as users of the previous layout will allocate 4bytes of
padding that won't be read by Xen, and users of the new layout won't
allocate those, which is also fine since Xen won't try to access them.

Note that the structure already has compat handling, and such handling
will take care of copying the right size (ie: minus the padding) when
called from a 32bit x86 context. This is true for the compat code both
before and after this patch, since the structures in the memory.h
compat header are subject to a pragma pack(4), which already removed
the trailing padding that would otherwise be introduced by the
alignment of the frame field to 8 bytes.

Fixes: 3f8f12281dd20 ('x86/mm: add HYPERVISOR_memory_op to acquire guest resources')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Should also be backported.
---
Changes since v2:
 - Remove the tail padding.
 - Expand commit message.

Changes since v1:
 - Add padding on 32bits so structure size matches between arches and
   the previous layout is kept.
---
 xen/include/public/memory.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 850bd72c52..21057ed78e 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -610,6 +610,8 @@ struct xen_reserved_device_memory_map {
 typedef struct xen_reserved_device_memory_map xen_reserved_device_memory_map_t;
 DEFINE_XEN_GUEST_HANDLE(xen_reserved_device_memory_map_t);
 
+#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
+
 /*
  * Get the pages for a particular guest resource, so that they can be
  * mapped directly by a tools domain.
@@ -648,7 +650,7 @@ struct xen_mem_acquire_resource {
      * IN - the index of the initial frame to be mapped. This parameter
      *      is ignored if nr_frames is 0.
      */
-    uint64_aligned_t frame;
+    uint64_t frame;
 
 #define XENMEM_resource_ioreq_server_frame_bufioreq 0
 #define XENMEM_resource_ioreq_server_frame_ioreq(n) (1 + (n))
@@ -669,8 +671,6 @@ struct xen_mem_acquire_resource {
 typedef struct xen_mem_acquire_resource xen_mem_acquire_resource_t;
 DEFINE_XEN_GUEST_HANDLE(xen_mem_acquire_resource_t);
 
-#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
-
 /*
  * XENMEM_get_vnumainfo used by guest to get
  * vNUMA topology from hypervisor.
-- 
2.26.2


