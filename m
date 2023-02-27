Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E356A4585
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 16:03:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502687.774595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWf1z-0001ee-Oe; Mon, 27 Feb 2023 15:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502687.774595; Mon, 27 Feb 2023 15:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWf1z-0001bq-LI; Mon, 27 Feb 2023 15:03:11 +0000
Received: by outflank-mailman (input) for mailman id 502687;
 Mon, 27 Feb 2023 15:03:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mutd=6X=citrix.com=prvs=4152eaadc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pWf1x-0001bg-GO
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 15:03:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5d33d67-b6af-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 16:03:06 +0100 (CET)
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
X-Inumbo-ID: d5d33d67-b6af-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677510186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rrL3Wu2IJ8sfJxppcHVkKMnrvdeQ+P9GKvNTiTI6A64=;
  b=GY+1FOpjY35ERl016x4GnZbDjlUtn3sT5PJRqZbg76QSDIEV5XJs2aVP
   jquWzCn0/bloKehvP7baN1y6OfGN7ZnRMMH//7Ve1tiHkaJ/5c+9sJryY
   V1/rg5d0BCAQyGmHkozwMEnjaRvaNXWtJ+hKorAZJor/AlR4j3AqcU4YJ
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97521943
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:pFmJd63q1cTKnOnyD/bD5dBxkn2cJEfYwER7XKvMYLTBsI5bpzMFm
 GQbWWvSaP6DY2P2eo8gb97joBsCu8OAz9A3TFE+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gZkOqgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfIUtW0
 fdENxw2UyuOoMG4zbGLW7NBv5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiFJoIxB/J+
 jmuE2LRIw4WaoWH+xO/7WuLosDurXz8AJIyLejtnhJtqALKnTFCYPEMbnO5ruO+kVWWQM9EJ
 gof/S9Ghbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6k6nMsF2AbLoZ87YlvGGJsj
 wXS9z/0OdBxmJ2/UVaWqqi4lg6JNA82I2IBVT5eYDJQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r/tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBd7fb1UwYnY1RfHNEghBHFbyFb28GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510kve8Toq5CKCFMIQmjn1NmOivpnwGWKJt9zq1zBhEfV8XZ
 f93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcmT8vhT6pLHPCT9Ye5cYDOzghURsPvsTPP9r
 4wOaKNnCnx3DIXDX8Ug2dJKdA1acCViWMGeRg4+XrfrHzeK0VoJU5f5qY7NsaQ4z/Q9ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:8Rz1+6lY7d91x4LZcLpVGhsTWV3pDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-IronPort-AV: E=Sophos;i="5.98,219,1673931600"; 
   d="scan'208";a="97521943"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edwin.torok@cloud.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH] libs/guest: Fix resource leaks in xc_core_arch_map_p2m_tree_rw()
Date: Mon, 27 Feb 2023 15:00:57 +0000
Message-ID: <20230227150057.2858898-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <c721e627bc74047c0c5e55c0aeae7d72bbc3ce0e.1677245356.git.edwin.torok@cloud.com>
References: <c721e627bc74047c0c5e55c0aeae7d72bbc3ce0e.1677245356.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Edwin, with the help of GCC's -fanalyzer, identified that p2m_frame_list_list
gets leaked.  What fanalyzer can't see is that the live_p2m_frame_list_list
and live_p2m_frame_list foreign mappings are leaked too.

Rework the logic so the out path is executed unconditionally, which cleans up
all the intermediate allocations/mappings appropriately.

Fixes: bd7a29c3d0b9 ("tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m table")
Reported-by: Edwin Török <edwin.torok@cloud.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/guest/xg_core_x86.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tools/libs/guest/xg_core_x86.c b/tools/libs/guest/xg_core_x86.c
index 61106b98b877..c5e4542ccccc 100644
--- a/tools/libs/guest/xg_core_x86.c
+++ b/tools/libs/guest/xg_core_x86.c
@@ -229,11 +229,11 @@ xc_core_arch_map_p2m_tree_rw(xc_interface *xch, struct domain_info_context *dinf
                              uint32_t dom, shared_info_any_t *live_shinfo)
 {
     /* Double and single indirect references to the live P2M table */
-    xen_pfn_t *live_p2m_frame_list_list;
+    xen_pfn_t *live_p2m_frame_list_list = NULL;
     xen_pfn_t *live_p2m_frame_list = NULL;
     /* Copies of the above. */
     xen_pfn_t *p2m_frame_list_list = NULL;
-    xen_pfn_t *p2m_frame_list;
+    xen_pfn_t *p2m_frame_list = NULL;
 
     int err;
     int i;
@@ -297,8 +297,6 @@ xc_core_arch_map_p2m_tree_rw(xc_interface *xch, struct domain_info_context *dinf
 
     dinfo->p2m_frames = P2M_FL_ENTRIES;
 
-    return p2m_frame_list;
-
  out:
     err = errno;
 
@@ -312,7 +310,7 @@ xc_core_arch_map_p2m_tree_rw(xc_interface *xch, struct domain_info_context *dinf
 
     errno = err;
 
-    return NULL;
+    return p2m_frame_list;
 }
 
 static int
-- 
2.30.2


