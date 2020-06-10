Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CDD1F5BE4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 21:18:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj6De-0006wx-Le; Wed, 10 Jun 2020 19:17:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tsn8=7X=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1jj6Dc-0006ws-VL
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 19:17:00 +0000
X-Inumbo-ID: f50f06be-ab4e-11ea-bb8b-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f50f06be-ab4e-11ea-bb8b-bc764e2007e4;
 Wed, 10 Jun 2020 19:17:00 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1jj6DZ-000I6A-Uq; Wed, 10 Jun 2020 19:16:57 +0000
Date: Wed, 10 Jun 2020 20:16:57 +0100
From: Tim Deegan <tim@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] kdd: remove zero-length arrays
Message-ID: <20200610191657.GA69414@deinos.phlegethon.org>
References: <20200608203849.18341-1-olaf@aepfle.de>
 <005001d63e3b$c85059f0$58f10dd0$@xen.org>
 <20200609121549.GA90841@deinos.phlegethon.org>
 <20200609152233.039cfc86.olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200609152233.039cfc86.olaf@aepfle.de>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
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
Cc: xen-devel@lists.xenproject.org, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Wei Liu' <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

At 15:22 +0200 on 09 Jun (1591716153), Olaf Hering wrote:
> Am Tue, 9 Jun 2020 13:15:49 +0100
> schrieb Tim Deegan <tim@xen.org>:
> 
> > Olaf, can you try dropping the 'payload' field from the header and replacing the payload[0] in pkt with payload[] ?
> 
> In file included from kdd.c:53:
> kdd.h:325:17: error: flexible array member in union
>   325 |         uint8_t payload[];

How tedious.  Well, the only place we actually allocate one of these
we already leave enough space for a max-size packet, so how about
this?

kdd: stop using [0] arrays to access packet contents.

GCC 10 is unhappy about this, and we already use 64k buffers
in the only places where packets are allocated, so move the
64k size into the packet definition.

Reported-by: Olaf Hering <olaf@aepfle.de>
Signed-off-by: Tim Deegan <tim@xen.org>
---
 tools/debugger/kdd/kdd.c | 4 ++--
 tools/debugger/kdd/kdd.h | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git tools/debugger/kdd/kdd.c tools/debugger/kdd/kdd.c
index 3ebda9b12c..a7d0976ea4 100644
--- tools/debugger/kdd/kdd.c
+++ tools/debugger/kdd/kdd.c
@@ -79,11 +79,11 @@ typedef struct {
 /* State of the debugger stub */
 typedef struct {
     union {
-        uint8_t txb[sizeof (kdd_hdr) + 65536];   /* Marshalling area for tx */
+        uint8_t txb[sizeof (kdd_pkt)];           /* Marshalling area for tx */
         kdd_pkt txp;                 /* Also readable as a packet structure */
     };
     union {
-        uint8_t rxb[sizeof (kdd_hdr) + 65536];   /* Marshalling area for rx */
+        uint8_t rxb[sizeof (kdd_pkt)];           /* Marshalling area for rx */
         kdd_pkt rxp;                 /* Also readable as a packet structure */
     };
     unsigned int cur;       /* Offset into rx where we'll put the next byte */
diff --git tools/debugger/kdd/kdd.h tools/debugger/kdd/kdd.h
index bfb00ba5c5..b9a17440df 100644
--- tools/debugger/kdd/kdd.h
+++ tools/debugger/kdd/kdd.h
@@ -68,7 +68,6 @@ typedef struct {
     uint16_t len;     /* Payload length, excl. header and trailing byte */
     uint32_t id;      /* Echoed in responses */
     uint32_t sum;     /* Unsigned sum of all payload bytes */
-    uint8_t payload[0];
 } PACKED kdd_hdr;
 
 #define KDD_PKT_CMD 0x0002      /* Debugger commands (and replies to them) */
@@ -323,7 +322,7 @@ typedef struct {
         kdd_msg msg;
         kdd_reg reg;
         kdd_stc stc;
-        uint8_t payload[0];
+        uint8_t payload[65536];
     };
 } PACKED kdd_pkt;
 
-- 
2.26.2


