Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41161F20C7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 22:40:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiOXy-00078C-9C; Mon, 08 Jun 2020 20:39:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iYtX=7V=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jiOXv-000785-Vh
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 20:39:04 +0000
X-Inumbo-ID: 16507110-a9c8-11ea-b7bb-bc764e2007e4
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16507110-a9c8-11ea-b7bb-bc764e2007e4;
 Mon, 08 Jun 2020 20:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591648741;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=MLeNcQsbr99FDR38AxGkMCSTjv8YFEmQTlDcNz7LdfM=;
 b=DmH1n52zT2rcMIv0uNwu5RQxcDAb9NordXZGirLGa2fZag3WPkPsubcZYsltck4UeK
 f1ZZu7v7kmogVQvoJWrqXyG6InjV3pk9PK8lUy4FvR9RyiNM6FaInWCSubMNB0l3aLz/
 MnOih2FuiNmIIw0hXO3kH8ZZQsSUFKBxrytyGypOZsCCIvj4yEN3GTYNIZrq8lTV0JbS
 0alcnggiS07Bw0+5rGO9PxxqgZFTP3CWUSRap1khpP/FHvOnKaJ8AKiSvwerefkCMwdO
 tVsz/WRuoz3BNHBM+oFGM6XFQggYabL/QzIV21PI4l24Wu8zO2iLcrAKvF+tVbL7SIml
 DTKg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3GpKjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.9.2 DYNA|AUTH)
 with ESMTPSA id I09bd2w58KcrHyi
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 8 Jun 2020 22:38:53 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v1] kdd: remove zero-length arrays
Date: Mon,  8 Jun 2020 22:38:48 +0200
Message-Id: <20200608203849.18341-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Olaf Hering <olaf@aepfle.de>,
 Tim Deegan <tim@xen.org>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Struct 'kdd_hdr' already has a member named 'payload[]' to easily
refer to the data after the header.  Remove the payload member from
'kdd_pkt' and always use 'kdd_hdr' to fix the following compile error:

kdd.c: In function 'kdd_tx':
kdd.c:746:30: error: array subscript 65534 is outside the bounds of an interior zero-length array 'uint8_t[0]' {aka 'unsigned char[]'} [-Werror=zero-length-bounds]
  746 |         sum += s->txp.payload[i];
      |                ~~~~~~~~~~~~~~^~~
In file included from kdd.c:53:
kdd.h:326:17: note: while referencing 'payload'
  326 |         uint8_t payload[0];
      |                 ^~~~~~~
cc1: all warnings being treated as errors

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/debugger/kdd/kdd.c | 10 +++++-----
 tools/debugger/kdd/kdd.h |  3 +--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
index 3ebda9b12c..4c6b39c22b 100644
--- a/tools/debugger/kdd/kdd.c
+++ b/tools/debugger/kdd/kdd.c
@@ -249,7 +249,7 @@ static void kdd_log_pkt(kdd_state *s, char *name, kdd_pkt *p)
 
     /* Re-check the checksum */
     for (i = 0; i < p->h.len; i++)
-        sum += p->payload[i];
+        sum += p->h.payload[i];
 
     fprintf(f, "\n"
             "%s: %s type 0x%4.4"PRIx16" len 0x%4.4"PRIx16
@@ -267,8 +267,8 @@ static void kdd_log_pkt(kdd_state *s, char *name, kdd_pkt *p)
             fprintf(f, "%8.8x ", i);
         } else if (i % 8 == 0)
             fprintf(f, " ");
-        fprintf(f, " %2.2x", p->payload[i]);
-        ascii[i % 16] = (isprint(((int)p->payload[i])) ? p->payload[i] : 0x2e);
+        fprintf(f, " %2.2x", p->h.payload[i]);
+        ascii[i % 16] = (isprint(((int)p->h.payload[i])) ? p->h.payload[i] : 0x2e);
         if (i % 16 == 15)
             fprintf(f, "  |%s|\n", ascii);
     }
@@ -743,7 +743,7 @@ static void kdd_tx(kdd_state *s)
 
     /* Fix up the checksum before we send */
     for (i = 0; i < s->txp.h.len; i++)
-        sum += s->txp.payload[i];
+        sum += s->txp.h.payload[i];
     s->txp.h.sum = sum;
 
     kdd_log_pkt(s, "TX", &s->txp);
@@ -1127,7 +1127,7 @@ static void kdd_handle_pkt(kdd_state *s, kdd_pkt *p)
 
     /* Simple checksum: add all the bytes */
     for (i = 0; i < p->h.len; i++)
-        sum += p->payload[i];
+        sum += p->h.payload[i];
     if (p->h.sum != sum) {
         kdd_send_ack(s, p->h.id, KDD_ACK_BAD);
         return;
diff --git a/tools/debugger/kdd/kdd.h b/tools/debugger/kdd/kdd.h
index bfb00ba5c5..57525d36c6 100644
--- a/tools/debugger/kdd/kdd.h
+++ b/tools/debugger/kdd/kdd.h
@@ -68,7 +68,7 @@ typedef struct {
     uint16_t len;     /* Payload length, excl. header and trailing byte */
     uint32_t id;      /* Echoed in responses */
     uint32_t sum;     /* Unsigned sum of all payload bytes */
-    uint8_t payload[0];
+    uint8_t payload[];
 } PACKED kdd_hdr;
 
 #define KDD_PKT_CMD 0x0002      /* Debugger commands (and replies to them) */
@@ -323,7 +323,6 @@ typedef struct {
         kdd_msg msg;
         kdd_reg reg;
         kdd_stc stc;
-        uint8_t payload[0];
     };
 } PACKED kdd_pkt;
 

