Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD93DB1E098
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 04:20:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073904.1436676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukCiF-0006Qh-2b; Fri, 08 Aug 2025 02:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073904.1436676; Fri, 08 Aug 2025 02:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukCiE-0006Oj-UM; Fri, 08 Aug 2025 02:20:06 +0000
Received: by outflank-mailman (input) for mailman id 1073904;
 Fri, 08 Aug 2025 02:20:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hyIc=2U=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ukCiE-0005lR-3K
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 02:20:06 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31e040a1-73fe-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 04:20:04 +0200 (CEST)
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
X-Inumbo-ID: 31e040a1-73fe-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754619603; x=1754878803;
	bh=1lN7KrswBcgK3b8OieY9/AL8KilzLZgi3os/mOWZTtg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=h1UkwJBKFwvWaG9fRq456OB/WC4UJxAEZ+Wp8jqnGg2Dgu2rc1x+9oxPexGhKk+1+
	 shuptePMchUdJVxI8AjpI5+AdtEoXmBzctP9IKZQTzKzMGKsO0MAOELmZznkkdGQTN
	 8tiKSN76yby+oIXLiPxRRN/HKW07TthBsU0TiPYM67mpUTnsTonQJZ4NuNeQBU7P1T
	 vJytRd+OE5BTr9HQ1L4ruDx9s6zRv9wdlherDTucvtuYOFTMgLkhd+LjCwBMg5J06L
	 3whaetW+QfcaU7zZRKFbooeEQxAxh/I1APmjHrHjkgleCDhY7QDVEorP+H6355gGpt
	 A4jAi58go/cvw==
Date: Fri, 08 Aug 2025 02:20:01 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v14 2/4] tools/include: move xc_bitops.h to xen-tools/bitops.h
Message-ID: <20250808021938.669855-3-dmukhin@ford.com>
In-Reply-To: <20250808021938.669855-1-dmukhin@ford.com>
References: <20250808021938.669855-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 4efdcc0a6a1de61435c9134bd34210d95ff3a232
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Move xc_bitops.h to common tools location to be shared between
the toolstack and unit test code.

Adjust the guard in xen-tools/bitops.h

Correct the #include directives and comments referring to the old
xc_bitops.h in the toolstack code.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v13:
- new patch
---
 .../ctrl/xc_bitops.h =3D> include/xen-tools/bitops.h} |  6 +++---
 tools/libs/ctrl/xc_misc.c                           | 13 +++++++------
 tools/libs/guest/xg_dom_elfloader.c                 |  3 ++-
 tools/libs/guest/xg_dom_hvmloader.c                 |  3 ++-
 tools/libs/guest/xg_private.h                       |  2 +-
 tools/libs/guest/xg_sr_common.h                     |  3 +--
 6 files changed, 16 insertions(+), 14 deletions(-)
 rename tools/{libs/ctrl/xc_bitops.h =3D> include/xen-tools/bitops.h} (95%)

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
=20
 /* bitmap operations for single threaded access */
=20
@@ -81,4 +81,4 @@ static inline void bitmap_or(void *_dst, const void *_oth=
er,
         dst[i] |=3D other[i];
 }
=20
-#endif  /* XC_BITOPS_H */
+#endif  /* __XEN_TOOLS_BITOPS_H__ */
diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
index 33e87bac2868..10ddf85667a9 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -17,8 +17,8 @@
  * License along with this library; If not, see <http://www.gnu.org/licens=
es/>.
  */
=20
-#include "xc_bitops.h"
 #include "xc_private.h"
+#include <xen-tools/bitops.h>
 #include <xen/hvm/hvm_op.h>
=20
 int xc_get_max_cpus(xc_interface *xch)
@@ -94,11 +94,12 @@ xc_cpumap_t xc_cpumap_alloc(xc_interface *xch)
 }
=20
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
diff --git a/tools/libs/guest/xg_dom_elfloader.c b/tools/libs/guest/xg_dom_=
elfloader.c
index f17930d98bf7..8531e90f8e21 100644
--- a/tools/libs/guest/xg_dom_elfloader.c
+++ b/tools/libs/guest/xg_dom_elfloader.c
@@ -25,8 +25,9 @@
 #include <stdarg.h>
 #include <inttypes.h>
=20
+#include <xen-tools/bitops.h>
+
 #include "xg_private.h"
-#include "xc_bitops.h"
=20
 #define XEN_VER "xen-3.0"
=20
diff --git a/tools/libs/guest/xg_dom_hvmloader.c b/tools/libs/guest/xg_dom_=
hvmloader.c
index 39e1e5f579a7..0f569c20c522 100644
--- a/tools/libs/guest/xg_dom_hvmloader.c
+++ b/tools/libs/guest/xg_dom_hvmloader.c
@@ -24,8 +24,9 @@
 #include <inttypes.h>
 #include <assert.h>
=20
+#include <xen-tools/bitops.h>
+
 #include "xg_private.h"
-#include "xc_bitops.h"
=20
 /* -----------------------------------------------------------------------=
- */
 /* parse elf binary                                                       =
  */
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index d73947094f2e..285229cf82a3 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -28,9 +28,9 @@
 #include <sys/stat.h>
=20
 #include "xc_private.h"
-#include "xc_bitops.h"
 #include "xenguest.h"
=20
+#include <xen-tools/bitops.h>
 #include <xen/memory.h>
 #include <xen/elfnote.h>
 #include <xen/libelf/libelf.h>
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_commo=
n.h
index 2f058ee3a6ff..2e583f2eac72 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -2,11 +2,10 @@
 #define __COMMON__H
=20
 #include <stdbool.h>
+#include <xen-tools/bitops.h>
=20
 #include "xg_private.h"
 #include "xg_save_restore.h"
-#include "xc_bitops.h"
-
 #include "xg_sr_stream_format.h"
=20
 /* String representation of Domain Header types. */
--=20
2.34.1



