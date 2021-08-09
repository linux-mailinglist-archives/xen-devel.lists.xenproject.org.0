Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDF83E47E5
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 16:48:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165013.301539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD6Ys-00053H-Sb; Mon, 09 Aug 2021 14:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165013.301539; Mon, 09 Aug 2021 14:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD6Ys-000500-PP; Mon, 09 Aug 2021 14:47:30 +0000
Received: by outflank-mailman (input) for mailman id 165013;
 Mon, 09 Aug 2021 14:47:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d5/i=NA=citrix.com=Jane.Malalane@srs-us1.protection.inumbo.net>)
 id 1mD6Ys-0004zu-1b
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 14:47:30 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2aab887f-9dcd-45a1-8665-73468072cdab;
 Mon, 09 Aug 2021 14:47:28 +0000 (UTC)
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
X-Inumbo-ID: 2aab887f-9dcd-45a1-8665-73468072cdab
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628520448;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=lI54ebPD69iRvQCJxW37L6hdjlQXYG1LHRjeX6u/umM=;
  b=fO9kD6JR1fbPh/5aoXT/m+Dxw/YduLrpa2wer7fP/vmqx8mvdCjcyd7v
   HjrrM8+1OIHT2GzaqXy/fcWi4eFnyEl+FUqc8nkr16wqdospdQlZDx29B
   fIgShEQ450LC5junGYUwQfsfZZbzmQYUiljT98oCN+EMuXhOY5cWDU7RL
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: mrpmcRUwC74Sgsf87I9JP6PW3R7TQY1WnTswKMLSvNQJwfngp06qs60jXUL74tKNBvV7HUUf6T
 So+dAR+s7qRd38cDTQiynw6KUdH/8xD8BsswCP2C5oFE+E486gdpHxNXnTZAPxAYKc/G6GVD1F
 nBhOa6t85WmBoLcYU4ukMqbs/p1X68pRh5THcQbJ+yJwYNYS1efRWDXnPmRpZ/AbFqELROVpmt
 tYE/Oak3dsVwjHt1DM3A5j+vvQ50OQPGP65E67/cP/G4Cfu4hCXlxtadTHFzsQ84phzUCQVgQP
 WgL87vqREbBiA/XB2PqYGghb
X-SBRS: 5.1
X-MesageID: 50068812
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JFbOdK7VgIQRpB02DAPXwN7XdLJyesId70hD6qhwISY6TiX4rb
 HIoB1173/JYVoqNE3I+urwXJVoI0mslqKdiLN5VdzJMTUO0FHYSb2KhrGC/9SPIULDH5ZmpM
 VdT5Q=
X-IronPort-AV: E=Sophos;i="5.84,307,1620705600"; 
   d="scan'208";a="50068812"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] xen/bitmap: Make bitmap_long_to_byte() and bitmap_byte_to_long() static
Date: Mon, 9 Aug 2021 15:41:14 +0100
Message-ID: <20210809144114.21077-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Functions made static as there are no external callers.

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
---
 xen/common/bitmap.c      | 8 ++++----
 xen/include/xen/bitmap.h | 3 ---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index b7aa2db7c7..bbc3554ae1 100644
--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -338,7 +338,7 @@ EXPORT_SYMBOL(bitmap_allocate_region);
 
 #ifdef __BIG_ENDIAN
 
-void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp, int nbits)
+static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp, int nbits)
 {
 	unsigned long l;
 	int i, j, b;
@@ -354,7 +354,7 @@ void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp, int nbits)
 	clamp_last_byte(bp, nbits);
 }
 
-void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp, int nbits)
+static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp, int nbits)
 {
 	unsigned long l;
 	int i, j, b;
@@ -371,13 +371,13 @@ void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp, int nbits)
 
 #elif defined(__LITTLE_ENDIAN)
 
-void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp, int nbits)
+static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp, int nbits)
 {
 	memcpy(bp, lp, (nbits+7)/8);
 	clamp_last_byte(bp, nbits);
 }
 
-void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp, int nbits)
+static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp, int nbits)
 {
 	/* We may need to pad the final longword with zeroes. */
 	if (nbits & (BITS_PER_LONG-1))
diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index 634a259645..e9175ab54a 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -270,9 +270,6 @@ static inline void bitmap_clear(unsigned long *map, unsigned int start,
 #undef bitmap_switch
 #undef bitmap_bytes
 
-void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp, int nbits);
-void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp, int nbits);
-
 struct xenctl_bitmap;
 int xenctl_bitmap_to_bitmap(unsigned long *bitmap,
                             const struct xenctl_bitmap *xenctl_bitmap,
-- 
2.11.0


