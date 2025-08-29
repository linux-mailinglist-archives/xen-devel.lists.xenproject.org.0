Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F94B3C590
	for <lists+xen-devel@lfdr.de>; Sat, 30 Aug 2025 01:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102358.1454995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us8Pd-00087l-Io; Fri, 29 Aug 2025 23:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102358.1454995; Fri, 29 Aug 2025 23:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us8Pd-00085R-FZ; Fri, 29 Aug 2025 23:21:41 +0000
Received: by outflank-mailman (input) for mailman id 1102358;
 Fri, 29 Aug 2025 23:21:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1us8Pc-0007yd-F7
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 23:21:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1us8Pb-00CpQV-09;
 Fri, 29 Aug 2025 23:21:39 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1us8Pb-008JlN-03;
 Fri, 29 Aug 2025 23:21:39 +0000
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
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=SmK1a8qSk8xhhylhd/KkmU691XlhHEf3wjfBWdZ2Vac=; b=VORaCYDDKEOr8aqvkbCaL8DI9V
	3CSxIxWlVdTTHzO+94B5CoKAbhVOSKhWxtj/TE5T59TnlwDQHnKBw+oM6LGT4Px3bY97Awufgu0ig
	P4IeAoWrK1NruQJisYebUVAUWHsa8v0bYSDPH0RYAneOlyqkD3XOTu/a9ppX4+GyX0UQ=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v17 2/4] tools/include: move xc_bitops.h to xen-tools/bitops.h
Date: Fri, 29 Aug 2025 16:21:30 -0700
Message-ID: <20250829232132.3460081-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829232132.3460081-1-dmukhin@ford.com>
References: <20250829232132.3460081-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Move xc_bitops.h to common tools location to be shared between
the toolstack and unit test code.

Adjust the guard in xen-tools/bitops.h

Correct the #include directives and comments referring to the old
xc_bitops.h in the toolstack code.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
---
Changes since v16:
- dropped unneeded includes
- added Anthony's A-b
---
 .../ctrl/xc_bitops.h => include/xen-tools/bitops.h} |  6 +++---
 tools/libs/ctrl/xc_misc.c                           | 13 +++++++------
 tools/libs/guest/xg_dom_elfloader.c                 |  1 -
 tools/libs/guest/xg_dom_hvmloader.c                 |  1 -
 tools/libs/guest/xg_private.h                       |  2 +-
 tools/libs/guest/xg_sr_common.h                     |  2 --
 6 files changed, 11 insertions(+), 14 deletions(-)
 rename tools/{libs/ctrl/xc_bitops.h => include/xen-tools/bitops.h} (95%)

diff --git a/tools/libs/ctrl/xc_bitops.h b/tools/include/xen-tools/bitops.h
similarity index 95%
rename from tools/libs/ctrl/xc_bitops.h
rename to tools/include/xen-tools/bitops.h
index 4a776dc3a57f..681482f6759f 100644
--- a/tools/libs/ctrl/xc_bitops.h
+++ b/tools/include/xen-tools/bitops.h
@@ -1,5 +1,5 @@
-#ifndef XC_BITOPS_H
-#define XC_BITOPS_H 1
+#ifndef __XEN_TOOLS_BITOPS_H__
+#define __XEN_TOOLS_BITOPS_H__
 
 /* bitmap operations for single threaded access */
 
@@ -81,4 +81,4 @@ static inline void bitmap_or(void *_dst, const void *_other,
         dst[i] |= other[i];
 }
 
-#endif  /* XC_BITOPS_H */
+#endif  /* __XEN_TOOLS_BITOPS_H__ */
diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
index 33e87bac2868..10ddf85667a9 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -17,8 +17,8 @@
  * License along with this library; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "xc_bitops.h"
 #include "xc_private.h"
+#include <xen-tools/bitops.h>
 #include <xen/hvm/hvm_op.h>
 
 int xc_get_max_cpus(xc_interface *xch)
@@ -94,11 +94,12 @@ xc_cpumap_t xc_cpumap_alloc(xc_interface *xch)
 }
 
 /*
- * xc_bitops.h has macros that do this as well - however they assume that
- * the bitmask is word aligned but xc_cpumap_t is only guaranteed to be
- * byte aligned and so we need byte versions for architectures which do
- * not support misaligned accesses (which is basically everyone
- * but x86, although even on x86 it can be inefficient).
+ * <xen-tools/bitops.h> has macros that do this as well - however they
+ * assume that the bitmask is word aligned but xc_cpumap_t is only
+ * guaranteed to be byte aligned and so we need byte versions for
+ * architectures which do not support misaligned accesses (which is
+ * basically everyone but x86, although even on x86 it can be
+ * inefficient).
  *
  * NOTE: The xc_bitops macros now use byte alignment.
  * TODO: Clean up the users of this interface.
diff --git a/tools/libs/guest/xg_dom_elfloader.c b/tools/libs/guest/xg_dom_elfloader.c
index f17930d98bf7..a55b5e8c3caf 100644
--- a/tools/libs/guest/xg_dom_elfloader.c
+++ b/tools/libs/guest/xg_dom_elfloader.c
@@ -26,7 +26,6 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xc_bitops.h"
 
 #define XEN_VER "xen-3.0"
 
diff --git a/tools/libs/guest/xg_dom_hvmloader.c b/tools/libs/guest/xg_dom_hvmloader.c
index 39e1e5f579a7..a98c7fe5d877 100644
--- a/tools/libs/guest/xg_dom_hvmloader.c
+++ b/tools/libs/guest/xg_dom_hvmloader.c
@@ -25,7 +25,6 @@
 #include <assert.h>
 
 #include "xg_private.h"
-#include "xc_bitops.h"
 
 /* ------------------------------------------------------------------------ */
 /* parse elf binary                                                         */
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index d73947094f2e..285229cf82a3 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -28,9 +28,9 @@
 #include <sys/stat.h>
 
 #include "xc_private.h"
-#include "xc_bitops.h"
 #include "xenguest.h"
 
+#include <xen-tools/bitops.h>
 #include <xen/memory.h>
 #include <xen/elfnote.h>
 #include <xen/libelf/libelf.h>
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 2f058ee3a6ff..0e419c3a96a0 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -5,8 +5,6 @@
 
 #include "xg_private.h"
 #include "xg_save_restore.h"
-#include "xc_bitops.h"
-
 #include "xg_sr_stream_format.h"
 
 /* String representation of Domain Header types. */
-- 
2.51.0


