Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 872764375B2
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 12:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214955.373902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mds68-0000K4-Hi; Fri, 22 Oct 2021 10:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214955.373902; Fri, 22 Oct 2021 10:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mds68-0000D6-BQ; Fri, 22 Oct 2021 10:48:28 +0000
Received: by outflank-mailman (input) for mailman id 214955;
 Fri, 22 Oct 2021 10:48:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+2b=PK=citrix.com=lin.liu@srs-us1.protection.inumbo.net>)
 id 1mds66-00063m-Sr
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 10:48:26 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28c6be87-f6ea-42ef-9151-413cd568356b;
 Fri, 22 Oct 2021 10:48:08 +0000 (UTC)
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
X-Inumbo-ID: 28c6be87-f6ea-42ef-9151-413cd568356b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634899688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k/jOhLHPZRA8Ag0Zx9f8hcyG0uLCD9lIG9NbqTmotxQ=;
  b=P5LLaymYDDd7YPzHgw8VO//tiGscp2o2P63uah3hGxrvsMT55ARBFp/p
   9vY++0HNE+WxlPloQuix8r0ZSKovztZH3SQURBpBSCitVnWMzF8/t5gji
   o5PNHYYJU8oLOkSz4/gkHNbReHFwYtR4FnEcJHreivFJ12K1q0Nu9die6
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: FVYnoo/wTcjQj0Hr19f8bSUOfLUjj69j01RWR4xcgBFEKEIcjAhmQYdt6l3l+wjkD6bnW9NPSo
 RCKh2amD6+7hRLEkbwzHJgxBzhwDseJ7E0zbajPN+p73WzP9ErRyq8ztPTUa9rOajkNVLfTE51
 OweUEt8q13ibX5emWvJ2XXWdP8ck9PQCqaX1C2+RwTdBEB/B9t7CQF8ESe24tWbpeluKD/QS3q
 jsBtQgykNf6n/q/n5xcvJlskC5/Rw8Jz2G5lWc+SB1kokBJVWhLrKC8EZolGDmtlbw/Aopu+nB
 lBxSz3aKH919eiSMYH/tCb+6
X-SBRS: 5.1
X-MesageID: 55807254
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7ljUfaiBYtUcWl1AmEunBh4yX1615BcKZh0ujC45NGQN5FlHY01je
 htvWGyAPPzbZWuhf99xbdu1o08H6JSBmIc1QARv+XtkFyIb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Yy24Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1D7t+pTToxZ5fqt707Cj1RFSBhMqNvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHvPYVZvnB95TrYEewnUdbIRKCiCdpwgWpg3p8UQKq2i
 8wxWGssbAnGOExzGVoFJ88En+KlnVTSfGgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSd1D6E/3SEluLJ2yThV+o6C7mQ5vNsxlqJyQQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNzW5v3ysrhMaQ8BXEeAx9EeK0KW8ywSTC3UATzVBQMc7r8JwTjsvv
 mJlhPuwW2Yp6ufMDyvAqPHE9lteJBT5M0cMPmwdSTYduuPFj9gV1zbGSNd8H6Cc24id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuV2JBjPNAhdRIdf/PdTxuAezAeNodd7BFjG8U
 G44d99yBQzkJaqGkzCRW60zFbWt6uft3Nb00AM3QcdJG9hA/ReekWFsDNNWeBgB3iUsI2aBj
 KrvVeV5vsM70JyCNvcfXm5JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZ3zfFjY
 MjLKZ3xXB727JiLKhLsG4/xNpdwnkgDKZ77H8inn3xLL5LODJJqdVv1GATXNb1ohE91iA7U7
 8xeJ6O3J+Z3C4XDjt3s2ddLdzgidCFjbbiv8pA/XrPTc2JORTB6Y9eMkOxJRmCQt/kM/gs+1
 irmAREwJZuWrSCvFDhmnVg6OeqxB84m8CpnVcHuVH7xs0UejU+UxP93X/MKkXMPrYSPFNZ4E
 KsIfduuGPNKRmiV8jgRd8Cl/odjaA6qlUSFOC/8OGozeJtpRgro/N74f1SwqHlSX3Tv7cZu8
 ae90g77QIYYQ1gwBsjhd//ynUi6umIQmbwuUhKQcMVTYkjl7KNjNzf10q0sO8gJJBianmma2
 g+aDA02v+7Ip4NpotDFibrd99WiEvdkH1ocFG7etO7kOS7f92ul4IlBTOfXImyNCDKqoP2vP
 LwHwev9PfsLmEdxn7B9S7s7n7gj49bPpqNBylg2Fnv8cFn2WKhrJWOL3JcTu/QVlKNZowa/R
 mmG5sJeZeeSIMrgHVMceFglY+CE2a1GkzXe961ockDz5Ssx97ubS0RCeRKLjXUFfrdyNYokx
 8YnudIXtFPj2kZ7bI7eg3AG7XmII1wBT74j58MTD4LcgwY2zk1PPM7HASjs7ZDTM9hBPyHG+
 NNPaHYuU1iE+nf/Tg==
IronPort-HdrOrdr: A9a23:Rh3HMaB6h2VVMLvlHemW55DYdb4zR+YMi2TC1yhKKCC9Ffbo7/
 xG/c5rrCMc5wxhO03I9eruBEDEewK5yXcX2/h2AV7BZniFhILAFugLhuGOrwEIWReOkdK1vZ
 0QCJSWY+eRMbEVt6jHCXGDYrMd/OU=
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="55807254"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 6/7] xen: Switch to byteswap.h
Date: Fri, 22 Oct 2021 10:47:27 +0000
Message-ID: <f5a79881bfdcef06aa950632250f551e0ec26458.1634897942.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1634897942.git.lin.liu@citrix.com>
References: <cover.1634897942.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Update to use byteswap.h to swap bytes.

No functional chagne.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
 xen/common/bitmap.c                |  2 +-
 xen/common/gdbstub.c               |  2 +-
 xen/common/libelf/libelf-private.h |  8 ++++----
 xen/common/lz4/defs.h              |  2 +-
 xen/common/lzo.c                   |  2 +-
 xen/common/unlzo.c                 |  2 +-
 xen/common/xz/private.h            |  4 ++--
 xen/drivers/char/ehci-dbgp.c       |  2 +-
 xen/include/asm-x86/msi.h          |  2 +-
 xen/include/xen/bitmap.h           |  2 +-
 xen/include/xen/device_tree.h      |  2 +-
 xen/include/xen/unaligned.h        | 14 +++++++-------
 xen/lib/divmod.c                   |  2 +-
 13 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index 7d4551f782..be274ca04a 100644
--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -9,10 +9,10 @@
 #include <xen/errno.h>
 #include <xen/bitmap.h>
 #include <xen/bitops.h>
+#include <xen/byteswap.h>
 #include <xen/cpumask.h>
 #include <xen/guest_access.h>
 #include <xen/lib.h>
-#include <asm/byteorder.h>
 
 /*
  * bitmaps provide an array of bits, implemented using an an
diff --git a/xen/common/gdbstub.c b/xen/common/gdbstub.c
index 848c1f4327..3c8ed52d6b 100644
--- a/xen/common/gdbstub.c
+++ b/xen/common/gdbstub.c
@@ -33,6 +33,7 @@
 /* Resuming after we've stopped used to work, but more through luck
    than any actual intention.  It doesn't at the moment. */
 
+#include <xen/byteswap.h>
 #include <xen/lib.h>
 #include <xen/spinlock.h>
 #include <xen/serial.h>
@@ -45,7 +46,6 @@
 #include <xen/console.h>
 #include <xen/errno.h>
 #include <xen/delay.h>
-#include <asm/byteorder.h>
 
 /* Printk isn't particularly safe just after we've trapped to the
    debugger. so avoid it. */
diff --git a/xen/common/libelf/libelf-private.h b/xen/common/libelf/libelf-private.h
index 47db679966..b7089cb31b 100644
--- a/xen/common/libelf/libelf-private.h
+++ b/xen/common/libelf/libelf-private.h
@@ -17,10 +17,10 @@
 
 #ifdef __XEN__
 
+#include <xen/byteswap.h>
 #include <xen/lib.h>
 #include <xen/libelf.h>
 #include <xen/softirq.h>
-#include <asm/byteorder.h>
 #include <public/elfnote.h>
 
 /* we would like to use elf->log_callback but we can't because
@@ -31,9 +31,9 @@
    printk(fmt, ## args )
 
 #define strtoull(str, end, base) simple_strtoull(str, end, base)
-#define bswap_16(x) swab16(x)
-#define bswap_32(x) swab32(x)
-#define bswap_64(x) swab64(x)
+#define bswap_16(x) bswap16(x)
+#define bswap_32(x) bswap32(x)
+#define bswap_64(x) bswap64(x)
 
 #else /* !__XEN__ */
 
diff --git a/xen/common/lz4/defs.h b/xen/common/lz4/defs.h
index 10609f5a53..1ce4476478 100644
--- a/xen/common/lz4/defs.h
+++ b/xen/common/lz4/defs.h
@@ -9,7 +9,7 @@
  */
 
 #ifdef __XEN__
-#include <asm/byteorder.h>
+#include <xen/byteswap.h>
 #include <asm/unaligned.h>
 #else
 
diff --git a/xen/common/lzo.c b/xen/common/lzo.c
index a87c76dded..17be9675f4 100644
--- a/xen/common/lzo.c
+++ b/xen/common/lzo.c
@@ -96,7 +96,7 @@
 
 #ifdef __XEN__
 #include <xen/lib.h>
-#include <asm/byteorder.h>
+#include <xen/byteswap.h>
 #include <asm/unaligned.h>
 #else
 #define get_unaligned_le16(_p) (*(u16 *)(_p))
diff --git a/xen/common/unlzo.c b/xen/common/unlzo.c
index 74056778eb..f908d2a61f 100644
--- a/xen/common/unlzo.c
+++ b/xen/common/unlzo.c
@@ -33,7 +33,7 @@
 #include <xen/lzo.h>
 
 #ifdef __XEN__
-#include <asm/byteorder.h>
+#include <xen/byteswap.h>
 #include <asm/unaligned.h>
 #else
 
diff --git a/xen/common/xz/private.h b/xen/common/xz/private.h
index 511343fcc2..647f9699a7 100644
--- a/xen/common/xz/private.h
+++ b/xen/common/xz/private.h
@@ -12,7 +12,7 @@
 
 #ifdef __XEN__
 #include <xen/kernel.h>
-#include <asm/byteorder.h>
+#include <xen/byteswap.h>
 #include <asm/unaligned.h>
 #else
 
@@ -28,7 +28,7 @@ static inline void put_unaligned_le32(u32 val, void *p)
 
 #endif
 
-#define get_le32(p) le32_to_cpup((const uint32_t *)(p))
+#define get_le32(p) le32_to_cpu(*(const uint32_t *)(p))
 
 #define false 0
 #define true 1
diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index c893d246de..8412da1b11 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -5,13 +5,13 @@
  * Linux; see the Linux source for authorship and copyrights.
  */
 
+#include <xen/byteswap.h>
 #include <xen/console.h>
 #include <xen/delay.h>
 #include <xen/errno.h>
 #include <xen/param.h>
 #include <xen/pci.h>
 #include <xen/serial.h>
-#include <asm/byteorder.h>
 #include <asm/io.h>
 #include <asm/fixmap.h>
 #include <public/physdev.h>
diff --git a/xen/include/asm-x86/msi.h b/xen/include/asm-x86/msi.h
index e228b0f3f3..277375183c 100644
--- a/xen/include/asm-x86/msi.h
+++ b/xen/include/asm-x86/msi.h
@@ -1,9 +1,9 @@
 #ifndef __ASM_MSI_H
 #define __ASM_MSI_H
 
+#include <xen/byteswap.h>
 #include <xen/cpumask.h>
 #include <xen/pci.h>
-#include <asm/byteorder.h>
 #include <asm/hvm/vmx/vmcs.h>
 
 /*
diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index e9175ab54a..c44a1cb63c 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -229,7 +229,7 @@ static inline int bitmap_weight(const unsigned long *src, int nbits)
 	return __bitmap_weight(src, nbits);
 }
 
-#include <asm/byteorder.h>
+#include <xen/byteswap.h>
 
 #ifdef __LITTLE_ENDIAN
 #define BITMAP_MEM_ALIGNMENT 8
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index fd6cd00b43..4921e6b142 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -10,10 +10,10 @@
 #ifndef __XEN_DEVICE_TREE_H__
 #define __XEN_DEVICE_TREE_H__
 
-#include <asm/byteorder.h>
 #include <asm/device.h>
 #include <public/xen.h>
 #include <public/device_tree_defs.h>
+#include <xen/byteswap.h>
 #include <xen/kernel.h>
 #include <xen/string.h>
 #include <xen/types.h>
diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
index 0a2b16d05d..8a9ec8a0ac 100644
--- a/xen/include/xen/unaligned.h
+++ b/xen/include/xen/unaligned.h
@@ -11,8 +11,8 @@
 #define __XEN_UNALIGNED_H__
 
 #ifdef __XEN__
+#include <xen/byteswap.h>
 #include <xen/types.h>
-#include <asm/byteorder.h>
 #endif
 
 #define get_unaligned(p) (*(p))
@@ -20,7 +20,7 @@
 
 static inline uint16_t get_unaligned_be16(const void *p)
 {
-	return be16_to_cpup(p);
+	return be16_to_cpu(*(uint16_t*)p);
 }
 
 static inline void put_unaligned_be16(uint16_t val, void *p)
@@ -30,7 +30,7 @@ static inline void put_unaligned_be16(uint16_t val, void *p)
 
 static inline uint32_t get_unaligned_be32(const void *p)
 {
-	return be32_to_cpup(p);
+	return be32_to_cpu(*(uint32_t*)p);
 }
 
 static inline void put_unaligned_be32(uint32_t val, void *p)
@@ -40,7 +40,7 @@ static inline void put_unaligned_be32(uint32_t val, void *p)
 
 static inline uint64_t get_unaligned_be64(const void *p)
 {
-	return be64_to_cpup(p);
+	return be64_to_cpu(*(uint64_t*)p);
 }
 
 static inline void put_unaligned_be64(uint64_t val, void *p)
@@ -50,7 +50,7 @@ static inline void put_unaligned_be64(uint64_t val, void *p)
 
 static inline uint16_t get_unaligned_le16(const void *p)
 {
-	return le16_to_cpup(p);
+	return le16_to_cpu(*(uint16_t*)p);
 }
 
 static inline void put_unaligned_le16(uint16_t val, void *p)
@@ -60,7 +60,7 @@ static inline void put_unaligned_le16(uint16_t val, void *p)
 
 static inline uint32_t get_unaligned_le32(const void *p)
 {
-	return le32_to_cpup(p);
+	return le32_to_cpu(*(uint32_t*)p);
 }
 
 static inline void put_unaligned_le32(uint32_t val, void *p)
@@ -70,7 +70,7 @@ static inline void put_unaligned_le32(uint32_t val, void *p)
 
 static inline uint64_t get_unaligned_le64(const void *p)
 {
-	return le64_to_cpup(p);
+	return le64_to_cpu(*(uint64_t*)p);
 }
 
 static inline void put_unaligned_le64(uint64_t val, void *p)
diff --git a/xen/lib/divmod.c b/xen/lib/divmod.c
index 0be6ccc700..dfc1129cfe 100644
--- a/xen/lib/divmod.c
+++ b/xen/lib/divmod.c
@@ -1,6 +1,6 @@
+#include <xen/byteswap.h>
 #include <xen/lib.h>
 #include <xen/types.h>
-#include <asm/byteorder.h>
 
 /*
  * A couple of 64 bit operations ported from FreeBSD.
-- 
2.27.0


