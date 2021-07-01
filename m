Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3977C3B9019
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:57:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148341.274190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRG-0005Yn-Oc; Thu, 01 Jul 2021 09:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148341.274190; Thu, 01 Jul 2021 09:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRG-0005V9-Km; Thu, 01 Jul 2021 09:56:54 +0000
Received: by outflank-mailman (input) for mailman id 148341;
 Thu, 01 Jul 2021 09:56:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytRE-0004r4-FY
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:56:52 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dab754d8-b797-494a-b08a-c551f11e7521;
 Thu, 01 Jul 2021 09:56:49 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619ue5Mh
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:40 +0200 (CEST)
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
X-Inumbo-ID: dab754d8-b797-494a-b08a-c551f11e7521
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133401;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7VCnrhtz6PkcA6hU43Dz4SRyiupndGcq7UxNqTELglw=;
    b=Qn1iK4PuvrSQRmBbDFH3T3UsDMsI+qEEMBs1jKHvz2iCrUS7YTnMSloI4wNLXg9N8K
    xynwKO4T4U863Sc2tP5Oluf6xC3SY7p41f1WZFwVEqeKgQbNwCjmJLa1lcvXpDxusejM
    lHflf7IPDlNibxhWELktw0CVFMUwe794DPg32iF/4E2rdXLUAzBJTl7vYWS4efGoDDY8
    ae7qn5EG4Z+SKtc0cw4+d5w/z1vdqx6DdwXRL0N9QgWIW/AWl7WLs0he0k5kZ0jmIMJk
    qyoNWj82+xBpLqYO4UqvAHveEftafbJUjsuFUEesN2p2VbfNiwHpsAWd7GPOcoG+pT5L
    D9qw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210701 04/40] tools: use integer division in convert-legacy-stream
Date: Thu,  1 Jul 2021 11:55:59 +0200
Message-Id: <20210701095635.15648-5-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A single slash gives a float, a double slash gives an int.

    bitmap = unpack_exact("Q" * ((max_id/64) + 1))
TypeError: can't multiply sequence by non-int of type 'float'

Signed-off-by: Olaf Hering <olaf@aepfle.de>

v02:
- import division to remain compatible with python2.7 (andrew)
- white space in max_id chunk (andrew)
---
 tools/python/scripts/convert-legacy-stream | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/scripts/convert-legacy-stream
index ca93a93848..66ee3d2f5d 100755
--- a/tools/python/scripts/convert-legacy-stream
+++ b/tools/python/scripts/convert-legacy-stream
@@ -6,6 +6,7 @@ Convert a legacy migration stream to a v2 stream.
 """
 
 from __future__ import print_function
+from __future__ import division
 
 import sys
 import os, os.path
@@ -163,7 +164,7 @@ def write_libxc_hvm_params(params):
         raise RuntimeError("Expected even length list of hvm parameters")
 
     write_record(libxc.REC_TYPE_hvm_params,
-                 pack(libxc.HVM_PARAMS_FORMAT, len(params) / 2, 0),
+                 pack(libxc.HVM_PARAMS_FORMAT, len(params) // 2, 0),
                  pack("Q" * len(params), *params))
 
 def write_libxc_static_data_end():
@@ -264,8 +265,8 @@ def read_pv_extended_info(vm):
                           (so_far - total_length, ))
 
 def read_pv_p2m_frames(vm):
-    fpp = 4096 / vm.width
-    p2m_frame_len = (vm.p2m_size - 1) / fpp + 1
+    fpp = 4096 // vm.width
+    p2m_frame_len = (vm.p2m_size - 1) // fpp + 1
 
     info("P2M frames: fpp %d, p2m_frame_len %d" % (fpp, p2m_frame_len))
     write_libxc_pv_p2m_frames(vm, unpack_ulongs(p2m_frame_len))
@@ -405,7 +406,7 @@ def read_chunks(vm):
                                   (max_id, legacy.MAX_VCPU_ID))
 
             vm.max_vcpu_id = max_id
-            bitmap = unpack_exact("Q" * ((max_id/64) + 1))
+            bitmap = unpack_exact("Q" * ((max_id // 64) + 1))
 
             for idx, word in enumerate(bitmap):
                 bit_idx = 0

