Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D9E644AA3
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 18:53:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455406.712861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2c7g-0008RB-KH; Tue, 06 Dec 2022 17:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455406.712861; Tue, 06 Dec 2022 17:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2c7g-0008PL-HO; Tue, 06 Dec 2022 17:52:52 +0000
Received: by outflank-mailman (input) for mailman id 455406;
 Tue, 06 Dec 2022 17:52:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WlZ+=4E=citrix.com=prvs=3329fe38d=Per.Bilse@srs-se1.protection.inumbo.net>)
 id 1p2c7e-0008PF-Rh
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 17:52:50 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cae3ae9b-758e-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 18:52:49 +0100 (CET)
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
X-Inumbo-ID: cae3ae9b-758e-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670349169;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eAy052LVGQXRjHRas9sGiJLX5hwm2vKQ2T06dwe1Hts=;
  b=JL8QjHoaXTvvclMumA3SyNFtWXicB5X1S2C7TnMh6l4Am6l2NLE1F4PX
   ZRzDUON3PAZkECyhBb6Z3aP5C93y/Lc6aHwop7ig4qzeLVJiLgL+MNt6C
   ATf6GcPGfxiblIF9D6xWK0qNNe8swKBgh9UDgG/tYIO/J5dCBMTsNMtza
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87290543
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:leJbGq5KCfeYVIulPpwK1QxRtETHchMFZxGqfqrLsTDasY5as4F+v
 jAdXGyEOvjZajf9cotzOtjj/RwHuZLcnNVnGQs4rCBmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKoT4geF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m2
 MQIDjIicwi5lcm5/u6WG+pBl8YeM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAvnTlNRdZrEmYjaE2/3LS3Ep6172F3N/9KoPQFJ0Iwh3wS
 mTupSOnLEwoZfOmjiuqzWKR2NHCswT3cddHfFG/3qEz2wDCroAJMzUOXEa/iem0jAi5Qd03A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52mwJrH8uljDQDJeF3gYNYJg5JReqSEWO
 kGhsuv5Iz5AraWvW1mSyOu5/DCfKCooMjpXDcMbdjct797mqYA1qxvASNd/DaK45uHI9SHML
 yOi93Zn2ehK5SIf/+DipA2c3WrwznTcZlRtjjg7SF5J+e+QiGSNQ4WzoWbW4v9bRGpyZgnQ5
 SNU8yRyAQ1nMH1sqMBvaL9UdF1Kz6zfWNE5vbKIN8dJythV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEoO9jvVp17nfe7SrwJs8w4ifIXMvBMmPKvpnkyNSZ8IUiy+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48gPUwDn0gDKZfobcmjlXyPiOPODEN5vJ9ZaDNimMhltvLbyOgUm
 v4DX/a3J+J3DbWnPXeGrdZNRb3IRFBiba3LRwVsXrbrCmJb9KsJUpc9HZtJl1RZoplo
IronPort-HdrOrdr: A9a23:WVjtTKENRVJzoS6cpLqFRJHXdLJyesId70hD6qkvc31om52j+f
 xGws516fatskdqZJjvo6HYBEDyewKgyXcV2/hbAV7GZmnbUQSTXflfBOfZsljd8k7Fh6RgPM
 VbAtND4bTLZDAQ56qKg3jbLz9K+qjhzEncv5am854bd3ANV0gP1XYcNu+cKCBLbTgDIaB8OI
 uX58JBqTblU28QdN6HCn4MWPWGj8HXlbr9CCR2SyIP2U2rt3eF+bT6Gx+X0lM1SDVU24ov9m
 DDjkjQ+rijifem0RXRvlWjoKi+2eGRhOerNvb8yvT9GQ+cyTpAo74RGYFqiQpF4d1HLmxa1e
 Uk7S1Qe/iboEmhAl1d6SGdpDUIlgxepkMLgTKj8CDeSYeVfkNjNyIJ6LgpNCcwoScbzYtBON
 on5RPfi3MfN2K/oA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIiLH4sJlOP1GkcKp
 gYMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wixJw/r1Wol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdGiSPVPkHqcaPG+lke+/3JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTdaD2ZVamyq9NVlVnQ6duP22y6IJyYEUHoCbQBFrYGpe4/ednw==
X-IronPort-AV: E=Sophos;i="5.96,223,1665460800"; 
   d="scan'208";a="87290543"
From: Per Bilse <per.bilse@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Per Bilse <per.bilse@citrix.com>, Paul Durrant <paul@xen.org>
Subject: [PATCH v2] ioreq_broadcast(): accept partial broadcast success
Date: Tue, 6 Dec 2022 17:52:09 +0000
Message-ID: <9cc56d01a09fcf6e1e3e9d48e60420f435fa34c3.1670348481.git.per.bilse@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Avoid incorrectly triggering an error when a broadcast buffered ioreq
is not handled by all registered clients, as long as the failure is
strictly because the client doesn't handle buffered ioreqs.

Signed-off-by: Per Bilse <per.bilse@citrix.com>
---
v2: Complete rethink with better information. A lot of simplicity was added.
---
 xen/common/ioreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 4617aef29b..568e7aea91 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -1317,7 +1317,8 @@ unsigned int ioreq_broadcast(ioreq_t *p, bool buffered)
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
-        if ( !s->enabled )
+        if ( !s->enabled || (buffered &&
+                    s->bufioreq_handling == HVM_IOREQSRV_BUFIOREQ_OFF) )
             continue;
 
         if ( ioreq_send(s, p, buffered) == IOREQ_STATUS_UNHANDLED )
-- 
2.31.1


