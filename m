Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EA364F0EE
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 19:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464885.723438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FP3-0007JP-Hz; Fri, 16 Dec 2022 18:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464885.723438; Fri, 16 Dec 2022 18:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FP3-0007Ey-Dz; Fri, 16 Dec 2022 18:25:49 +0000
Received: by outflank-mailman (input) for mailman id 464885;
 Fri, 16 Dec 2022 18:25:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdjE=4O=citrix.com=prvs=342889366=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p6FP2-0006tv-7M
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 18:25:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e10201a-7d6f-11ed-8fd4-01056ac49cbb;
 Fri, 16 Dec 2022 19:25:46 +0100 (CET)
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
X-Inumbo-ID: 0e10201a-7d6f-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671215146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JzedIushnEAoBB/aqG3wzgKioYrhoToXkaMaNhgUGsU=;
  b=PhbKH+WU6J653zQepTGHCW8os6EfYriOwaSd3Nkz7UwawKu8CRVCVCoB
   E4dWsHhGlfqrqXD3/fB8cDuKTsk6ntVXwAOGXiNwamdwVKrNFmPUxQX/t
   y6BJDCpmNhF35wssHdD8jOtiP4TKEO/kfyNeJ+vQIT0AKpVKABtdX8HmQ
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 89196122
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MG65u6+5bRtEDdps0tCBDrUDjn6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 jcXXW6EOvzbY2XxfI0lb4iy8hlUv8LXndJnSldqrS88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnP6kV5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklMy
 MZbFQsPZSu7rOmtz6zrT8dSuJkseZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+limf+dXtEr0iSpoI84nTJzRw327/oWDbQUozbHJQLxxzCz
 o7A12/QGgkXFPqv8gWq/WyroObKhH7Dd6tHQdVU8dY12QbOlwT/EiY+Sl+TsfS/zEmkVLp3J
 0UK9wI0oKM19UjtScPyNzWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOiSMtbWV0j
 BnTxYqvXGEx9u3OIZ6AyluKhTGPA2soFm0JXhcvRhAK/Ynmjr8N0x2aG76PD5WJptHyHDjxx
 RWDoy4/m6gfgKY36kmrwbzUq2ny/8aUF2bZ8i2SBzv4tV0hOOZJcqTysTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/bF7r1xBGFb5J+i8BQ2Sw283WvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKMYMXOMkoJV/foH8GiausM4fFyRhErE3CE
 c3DLZbE4YgyV8yLMwZat89CiOR2l0jSNEvYRIzhzgTP7FZtTCf9dFvxC3PXNrpRxPrd8G3oH
 yN3a5PiJ+N3DLevPUE6MOc7cTg3EJTMLcyu+pEKKrPdfVoO9aNII6a5/I7NsrdNx8x9/tokN
 FnkMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:XxpKRaq5cSRJb2ZpIQOLyakaV5oleYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.96,249,1665460800"; 
   d="scan'208";a="89196122"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 09/11] tools/ocaml/libs/xb: check for unmapped ring before accessing it
Date: Fri, 16 Dec 2022 18:25:18 +0000
Message-ID: <828df3206de4f956498a46e41b2a3472fd9bac9e.1671214525.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671214525.git.edwin.torok@cloud.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Xenmmap can unmap the ring, check for this condition before accessing it
to avoid crashing on an unmapped page.

Note that we cannot use the usual OCaml finalizers (like bigarray would) to
perform the unmap, because that might keep a reference count to a foreign
domain's memory that we want to release before destroying the domain.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Changes:
* new patch
---
 tools/ocaml/libs/xb/xs_ring_stubs.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/ocaml/libs/xb/xs_ring_stubs.c b/tools/ocaml/libs/xb/xs_ring_stubs.c
index 1e472d0bbf..28c79ee139 100644
--- a/tools/ocaml/libs/xb/xs_ring_stubs.c
+++ b/tools/ocaml/libs/xb/xs_ring_stubs.c
@@ -35,7 +35,14 @@
 #include <sys/mman.h>
 #include "mmap_stubs.h"
 
-#define GET_C_STRUCT(a) ((struct mmap_interface *) Data_abstract_val(a))
+static struct mmap_interface* check_addr(struct mmap_interface *interface)
+{
+    if (!interface->addr || interface->addr == MAP_FAILED)
+        caml_failwith("ring is not mapped");
+    return interface;
+}
+
+#define GET_C_STRUCT(a) check_addr((struct mmap_interface *) Data_abstract_val(a))
 
 /*
  * Bytes_val has been introduced by Ocaml 4.06.1. So define our own version
@@ -167,8 +174,6 @@ CAMLprim value ml_interface_set_server_features(value interface, value v)
 {
     CAMLparam2(interface, v);
     struct xenstore_domain_interface *intf = GET_C_STRUCT(interface)->addr;
-    if (intf == (void*)MAP_FAILED)
-        caml_failwith("Interface closed");
 
     intf->server_features = Int_val(v);
 
-- 
2.34.1


