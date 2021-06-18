Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFE83AC7A9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 11:32:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144372.265731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luAqa-0006kE-AT; Fri, 18 Jun 2021 09:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144372.265731; Fri, 18 Jun 2021 09:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luAqa-0006iA-7C; Fri, 18 Jun 2021 09:31:32 +0000
Received: by outflank-mailman (input) for mailman id 144372;
 Fri, 18 Jun 2021 09:31:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ygMg=LM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1luAqY-0006i4-DC
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 09:31:31 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.216])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1f67fb9-c2f4-4d48-a458-f099cfa18c62;
 Fri, 18 Jun 2021 09:31:29 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.3 AUTH)
 with ESMTPSA id x0a371x5I9VJ2tW
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 18 Jun 2021 11:31:19 +0200 (CEST)
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
X-Inumbo-ID: b1f67fb9-c2f4-4d48-a458-f099cfa18c62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624008679;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=05YuHSmc3XDXNtUyxlgGBQ2DoWZwTzlzuec6EKXLOIg=;
    b=K2H8vukW6GTnZqw7GaRI0PSTtLgdE8+IAOfnXrwWpqOPOTQsN7b+k/DY50/4GbCAvA
    GbMmiyImj1iYSx1l8eFMgSViroWH3C5UVppgVzmzAUzRg6ZJwSjO1Sz5skuc5dYFML0L
    izDs54b6gHww/Ez2PFZ6bL0kyMzwD4SgJnM5EboTxFIDoglksSArGiExk1KVmd7Qw98o
    NFke+82GRTsMYP/wol50CjFKpK7emGYLdssPfzceCxAC/i7FyjcpruQ13kb4R2lzAU+q
    D0G+bc2ev/fhY7s1fQ4WY7hSNOFY2sREwtWSTJ/ha7cDHqMXSDNCxCWc1fY5dYlv//z0
    GrnA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] tools: use integer division in convert-legacy-stream
Date: Fri, 18 Jun 2021 11:31:14 +0200
Message-Id: <20210618093114.1640-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A single slash gives a float, a double slash gives an int.

    bitmap = unpack_exact("Q" * ((max_id/64) + 1))
TypeError: can't multiply sequence by non-int of type 'float'

This is broken for unknown reasons since 4.14.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/python/scripts/convert-legacy-stream | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/scripts/convert-legacy-stream
index ca93a93848..a04c6e4165 100755
--- a/tools/python/scripts/convert-legacy-stream
+++ b/tools/python/scripts/convert-legacy-stream
@@ -163,7 +163,7 @@ def write_libxc_hvm_params(params):
         raise RuntimeError("Expected even length list of hvm parameters")
 
     write_record(libxc.REC_TYPE_hvm_params,
-                 pack(libxc.HVM_PARAMS_FORMAT, len(params) / 2, 0),
+                 pack(libxc.HVM_PARAMS_FORMAT, len(params) // 2, 0),
                  pack("Q" * len(params), *params))
 
 def write_libxc_static_data_end():
@@ -264,8 +264,8 @@ def read_pv_extended_info(vm):
                           (so_far - total_length, ))
 
 def read_pv_p2m_frames(vm):
-    fpp = 4096 / vm.width
-    p2m_frame_len = (vm.p2m_size - 1) / fpp + 1
+    fpp = 4096 // vm.width
+    p2m_frame_len = (vm.p2m_size - 1) // fpp + 1
 
     info("P2M frames: fpp %d, p2m_frame_len %d" % (fpp, p2m_frame_len))
     write_libxc_pv_p2m_frames(vm, unpack_ulongs(p2m_frame_len))
@@ -405,7 +405,7 @@ def read_chunks(vm):
                                   (max_id, legacy.MAX_VCPU_ID))
 
             vm.max_vcpu_id = max_id
-            bitmap = unpack_exact("Q" * ((max_id/64) + 1))
+            bitmap = unpack_exact("Q" * ((max_id//64) + 1))
 
             for idx, word in enumerate(bitmap):
                 bit_idx = 0

