Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F87D3EA2A8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 12:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166240.303547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE7Y4-0003g5-6S; Thu, 12 Aug 2021 10:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166240.303547; Thu, 12 Aug 2021 10:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE7Y4-0003d8-3G; Thu, 12 Aug 2021 10:02:52 +0000
Received: by outflank-mailman (input) for mailman id 166240;
 Thu, 12 Aug 2021 10:02:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EyNM=ND=citrix.com=Jane.Malalane@srs-us1.protection.inumbo.net>)
 id 1mE7Y2-0003d2-W7
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 10:02:51 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 727e195f-fb54-11eb-a143-12813bfff9fa;
 Thu, 12 Aug 2021 10:02:49 +0000 (UTC)
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
X-Inumbo-ID: 727e195f-fb54-11eb-a143-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628762568;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=itNvF37HisPGqME7wUhpuGr7Ake5JLmxHXB6g8r082c=;
  b=GombGYj+C1x3BEH/WlVvKMG5Vklx6jWSoqF0m/r5SzM96jynl4qHqbqb
   sl0IhMmryLsFF/SS5FgjnQN9WD1aCjWsxK3WzKLnSukbLBnND9+4kH7zS
   Kd+muGKnC5JrjOgxMajTp0Tuu9cnDz0Oma9j5aq8cxfh4dlKcPZabbg9W
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lEVOfWRU9cVk+zbyFsdbwMuJ9kCSBxsoUEssdCPbRiJcDa7AzqsWe9LW8GWGAKW2BZmg2ee2PJ
 C42yd60bOT+xs06L4Lh7CbJ/ktUlDPyCSpG5u+Lac9mpZEpzysGoYBpQQvkmEhMykpMss/aCSR
 atulQyVufSEJEAw2y58tMIH9Fkf2RTtv8UsUJf6YTQ4MEfU21JURfz20EcMK28ORsBl28JyK63
 wXcFeucqQ7oGgK81GNfixvbEwNbFE9jYLREfAZAN3il5Ajv3SA42UboUNvsq2lxhgr1Bnn7RXn
 XDef6EIAkpiuLQBl+5+UZnsD
X-SBRS: 5.1
X-MesageID: 50673457
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:kIDnR6qQHQO1du11pmC6+rcaV5ojeYIsimQD101hICG8cqSj9v
 xG/c5rsyMc5wxhO03I9eruBEDiewK6yXcW2/hyAV7KZmCP0wHEQL2KhbGSpwEIcBefygcy78
 ldmtBFebjNMWQ=
X-IronPort-AV: E=Sophos;i="5.84,315,1620705600"; 
   d="scan'208";a="50673457"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2] xen/bitmap: Don't open code DIV_ROUND_UP()
Date: Thu, 12 Aug 2021 11:02:25 +0100
Message-ID: <20210812100225.20037-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Also, change bitmap_long_to_byte() and bitmap_byte_to_long() to take
'unsigned int' instead of 'int' number of bits, to match the type of
their callers.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>

v2:
 * Reorder #include and wrap text
---
 xen/common/bitmap.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index bbc3554ae1..7d4551f782 100644
--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -11,6 +11,7 @@
 #include <xen/bitops.h>
 #include <xen/cpumask.h>
 #include <xen/guest_access.h>
+#include <xen/lib.h>
 #include <asm/byteorder.h>
 
 /*
@@ -338,7 +339,8 @@ EXPORT_SYMBOL(bitmap_allocate_region);
 
 #ifdef __BIG_ENDIAN
 
-static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp, int nbits)
+static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
+				unsigned int nbits)
 {
 	unsigned long l;
 	int i, j, b;
@@ -354,7 +356,8 @@ static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp, int nbits)
 	clamp_last_byte(bp, nbits);
 }
 
-static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp, int nbits)
+static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
+				unsigned int nbits)
 {
 	unsigned long l;
 	int i, j, b;
@@ -371,18 +374,20 @@ static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp, int nbits)
 
 #elif defined(__LITTLE_ENDIAN)
 
-static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp, int nbits)
+static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
+				unsigned int nbits)
 {
-	memcpy(bp, lp, (nbits+7)/8);
+	memcpy(bp, lp, DIV_ROUND_UP(nbits, BITS_PER_BYTE));
 	clamp_last_byte(bp, nbits);
 }
 
-static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp, int nbits)
+static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
+				unsigned int nbits)
 {
 	/* We may need to pad the final longword with zeroes. */
 	if (nbits & (BITS_PER_LONG-1))
 		lp[BITS_TO_LONGS(nbits)-1] = 0;
-	memcpy(lp, bp, (nbits+7)/8);
+	memcpy(lp, bp, DIV_ROUND_UP(nbits, BITS_PER_BYTE));
 }
 
 #endif
@@ -393,13 +398,14 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
     unsigned int guest_bytes, copy_bytes, i;
     uint8_t zero = 0;
     int err = 0;
-    uint8_t *bytemap = xmalloc_array(uint8_t, (nbits + 7) / 8);
+    unsigned int xen_bytes = DIV_ROUND_UP(nbits, BITS_PER_BYTE);
+    uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
 
     if ( !bytemap )
         return -ENOMEM;
 
-    guest_bytes = (xenctl_bitmap->nr_bits + 7) / 8;
-    copy_bytes  = min(guest_bytes, (nbits + 7) / 8);
+    guest_bytes = DIV_ROUND_UP(xenctl_bitmap->nr_bits, BITS_PER_BYTE);
+    copy_bytes  = min(guest_bytes, xen_bytes);
 
     bitmap_long_to_byte(bytemap, bitmap, nbits);
 
@@ -422,13 +428,14 @@ int xenctl_bitmap_to_bitmap(unsigned long *bitmap,
 {
     unsigned int guest_bytes, copy_bytes;
     int err = 0;
-    uint8_t *bytemap = xzalloc_array(uint8_t, (nbits + 7) / 8);
+    unsigned int xen_bytes = DIV_ROUND_UP(nbits, BITS_PER_BYTE);
+    uint8_t *bytemap = xzalloc_array(uint8_t, xen_bytes);
 
     if ( !bytemap )
         return -ENOMEM;
 
-    guest_bytes = (xenctl_bitmap->nr_bits + 7) / 8;
-    copy_bytes  = min(guest_bytes, (nbits + 7) / 8);
+    guest_bytes = DIV_ROUND_UP(xenctl_bitmap->nr_bits, BITS_PER_BYTE);
+    copy_bytes  = min(guest_bytes, xen_bytes);
 
     if ( copy_bytes )
     {
-- 
2.11.0


