Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D32531167
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 16:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335918.560142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9P2-0004w6-K2; Mon, 23 May 2022 14:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335918.560142; Mon, 23 May 2022 14:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9P2-0004mp-Dy; Mon, 23 May 2022 14:51:24 +0000
Received: by outflank-mailman (input) for mailman id 335918;
 Mon, 23 May 2022 14:51:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HaIF=V7=citrix.com=prvs=1359a750d=lin.liu@srs-se1.protection.inumbo.net>)
 id 1nt9P1-0004UL-2B
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 14:51:23 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce0dc41e-daa7-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 16:51:21 +0200 (CEST)
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
X-Inumbo-ID: ce0dc41e-daa7-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653317480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fEkEMnPb+q1gLdgxKH7ndanRPUKwGzgXMdy6eBWVxBI=;
  b=DXrPC4QOCwOElkYATr/Js0+vp8foDbv3mXC2e8FsZDQgIwn11qGYvhqP
   9xGx7J7HokoduwJR//7dSxAaRsa+KyFen0rBaV4hYdETcTWCJbs2w38Hu
   m7UZJ8/6GAX88IXOn/wWjDFhAHhA+d9dUFqS0uvm47ngSpNHAUNH6hfuJ
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71952261
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:j3VJc6C6VHKExRVW/33jw5YqxClBgxIJ4kV8jS/XYbTApD0i0DFVm
 GMdWGrXb6yCZmWmeNojbNjg8EgOu5+GxtRlQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Nj2dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh9k
 +hdqZ+BbT0uEZ33ltkyY0JXTQpXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwnLc+tOIICknph0SvYHbAtRpWrr6DiuoYJgW1q2Jkm8fD2O
 escQmpXUxT8fl5Ka0YIIqwbgsuRvyyqG9FfgA3M/vdmi4TJ9yRz36LqK8H9YcGRSINemUPwj
 n3C13T0BFcdLtP34SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOGTeKR0xDkHYgFc
 gpNp3Ro/fNaGFGXosfVU0aFsGKHjzomXPVgKOMHxzHWxfT/ylPMboQbdQKteODKpedvG2Fxj
 ATZz4izbdB8mObLECzAr994uRv3YHFIdjFaOEfoWCNfu7HeTJcPYgUjpzqJOIq8lZXLFD752
 FhmRwBu1uxI3abnO0hWlG0rYg5ARbCTF2bZHi2NAgqYAvpRPeZJnbCA51nB9upnJ42EVFSHt
 3Vss5HAsbtUUc3RzXbVGbVl8FSVCxGtaWC0vLKSN8N5q2TFF4CLI+i8Hw2S1G82a51ZKFcFk
 WfYuB9L5Y87AZdZRfYfXm5FMOxzlfKIPY28Dpj8N4MeCrAsJVTv1Hw/OiatM5XFzRFEfVcXY
 s/LL65BzB8yVMxa8dZBb75CiO96nn1jnDm7qFKS503P7IdyrUW9Ed8tWGZipMhghE9YiG05K
 +piCvY=
IronPort-HdrOrdr: A9a23:r2IBQ6nroQw9VA7sluCIaLrjjkLpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7gr5OUtQ4exoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCFHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="71952261"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 5/6] tools: Use new byteswap helper
Date: Mon, 23 May 2022 10:50:50 -0400
Message-ID: <334994153a7321e733b4234f9d587fc75549c0a0.1653314499.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1653314499.git.lin.liu@citrix.com>
References: <cover.1653314499.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Include new header to use new byteswap helper

No functional change.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
---
 tools/libs/guest/xg_dom_decompress_unsafe_xz.c   | 5 +++++
 tools/libs/guest/xg_dom_decompress_unsafe_zstd.c | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
index fc48198741..493427d517 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
+++ b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
@@ -34,6 +34,11 @@ static inline u32 le32_to_cpup(const u32 *p)
 	return cpu_to_le32(*p);
 }
 
+static inline u32 le32_to_cpu(u32 val)
+{
+   return le32_to_cpup((const u32 *)&val);
+}
+
 #define __force
 #define always_inline
 
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c b/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
index 01eafaaaa6..b06f2e767f 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
+++ b/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
@@ -31,7 +31,8 @@ typedef uint64_t __be64;
 
 #define __BYTEORDER_HAS_U64__
 #define __TYPES_H__ /* xen/types.h guard */
-#include "../../xen/include/xen/byteorder/little_endian.h"
+#define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
+#include "../../xen/include/xen/byteorder.h"
 #define __ASM_UNALIGNED_H__ /* asm/unaligned.h guard */
 #include "../../xen/include/xen/unaligned.h"
 #include "../../xen/include/xen/xxhash.h"
-- 
2.27.0


