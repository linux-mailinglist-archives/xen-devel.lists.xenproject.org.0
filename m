Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE4E621883
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 16:40:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440164.694306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQhZ-0007zu-IQ; Tue, 08 Nov 2022 15:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440164.694306; Tue, 08 Nov 2022 15:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQhZ-0007x5-BU; Tue, 08 Nov 2022 15:39:49 +0000
Received: by outflank-mailman (input) for mailman id 440164;
 Tue, 08 Nov 2022 15:39:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osQhX-0007Fx-E5
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 15:39:47 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91702d13-5f7b-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 16:39:46 +0100 (CET)
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
X-Inumbo-ID: 91702d13-5f7b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667921986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UQCDfSuDGc6oIDdjMFWDCU+FRf1yoH/+ae5j3IlKjWg=;
  b=cb4uysJXM8hmUWa/EZCf780aMSck0hGU4QeoO8cv1+/62sCKXtLILboG
   L6IYUWvFW5eWCa4DpClXvG6q/HKdqxesLJFiNGNT8PtdDWPjBFKbnPBOG
   ib7kPQHvHbGfPLtvjcX+zdnMrOlWdAEASbA8fa3XuC8/MfmDYCEZcfmMu
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 86935395
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:34ZUBK2BNTwjMjyOovbD5d9xkn2cJEfYwER7XKvMYLTBsI5bpz0Hz
 zMdXWqGMqvbamPweYp2bIrn/UpXvsfRzoBiTQtkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVmNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfPDpu0
 dsbI2g3V1PS16W6n7XiDbFCiZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWkeu2h3+5bzpCr1G9rqsr+WnDigd21dABNfKFJI3RGJ4Ewy50o
 ErIvF7/LR1BOeXYihTY23mM3N7tpDL0Ddd6+LqQqacx3Qz7KnYoIAISfUu2p7++kEHWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyAyL0LuS3A+fCUANVDsHY9sj3Oc6TCIn/
 kWElNToAXpoqrL9dJ6G3u7K93XoY3FTdDJcI39fJecY3zX9iLxorjboTd07Kpf2342yFW73m
 nfSgidr0t3/kvU3/6m8+FnGhRelqZ7IUhM5623rY4610u9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 BDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0O5eJ1cFg
 2eJ42u9AaO/21P7BZKbm6rrV6wXIVHITLwIlpn8N7KimKRZeg6d5z1JbkWNxW3rm0VEufhhZ
 8jLLZj1VS5AV/QPIN+KqwA1iOFD+8zD7TmLGcCTI+qPjdJym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3Cid540w3bQA/CwGJmbMuwacidClmWsqt8JQHL4Zu4GNOQQkcNhMY+pt5E6QNokifvr2gE
 q2VMqOA9GfCuA==
IronPort-HdrOrdr: A9a23:7SkhmKg8emYRfWRr/q9ESkII+nBQXgoji2hC6mlwRA09TyX4rb
 HMoB1173XJYVoqNU3I+urhBEDjex3hHPdOiOF7AV7FZmXbUQCTTb2KmrGSoQEIdReQysdtkY
 99bqlzD8DxB1Bmgcu/3BO1CL8bsb66GGTCv5am85+rJjsaDZ1I3kNBBgiSLEtsRk1mDZ01EZ
 b03Lsjm9PaQwVyUviG
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="86935395"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.17 v3 12/15] tools/ocaml/xenstored: log live update issues at warning level
Date: Tue, 8 Nov 2022 15:34:04 +0000
Message-ID: <550a0bc27c19a6d64d43cdee1f8cc3230d6ff55e.1667920496.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667920496.git.edvin.torok@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

During live update oxenstored tries a best effort approach to recover as
many domains and information as possible even if it encounters errors
restoring some domains.
This defensive approach has already proven useful to recover domains
after a bug in oxenstored.

However the default log level is warning, which means that problems during live
update were not logged at all, unless you've changes oxenstored.conf
prior to live-update.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Reason for inclusion in 4.17:
- makes live update issues debuggable (live update can be used to apply
  security updates to 4.17)

Changes since v2:
- new in v3
---
 tools/ocaml/xenstored/xenstored.ml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index d4ff24b440..78177b116f 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -184,9 +184,9 @@ module DB = struct
               (Perms.Node.of_string (unhexify perms ^ "\000"))
               (unhexify value)
           | _ ->
-            info "restoring: ignoring unknown line: %s" line
+            warn "restoring: ignoring unknown line: %s" line
         with exn ->
-          info "restoring: ignoring unknown line: %s (exception: %s)"
+          warn "restoring: ignoring unknown line: %s (exception: %s)"
             line (Printexc.to_string exn);
           ()
       with End_of_file ->
-- 
2.34.1


