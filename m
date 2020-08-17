Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D387247235
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 20:40:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7k3l-0006Ou-TO; Mon, 17 Aug 2020 18:40:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mm75=B3=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1k7k3k-0006K5-KR
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 18:40:40 +0000
X-Inumbo-ID: fcc229d5-ca6f-41e9-84e3-c5de8102445d
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcc229d5-ca6f-41e9-84e3-c5de8102445d;
 Mon, 17 Aug 2020 18:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597689631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YT4HghR0/mQiuB+0ZHbTT8P7/FFGJ4MPWIY1ryiFPUA=;
 b=h5vowcE3AmbbboBk0fw8JSuGG4cfvyjmQvx6wUzpEiJaTCfoQOBs+mpX
 F1YhOiEfWXka4Tykjq8mXoh0+ALKILMNvsJ2p3HHZqv41wmkVxWdchTJY
 SNk5QDUYp8KFO3rKM80jtFYxP6RVMfb1Z4i7TveU2LxosE7dO7HQOP+WL c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: VDHxz6P3BjGSpSDtzFGRuqkP0gIMNM1QvMuADnRgT0xS5/FZHGlhxDURPyxgXOE+yfKZCD0oi9
 7mC1CqoeuvuQ/NLxe2mjBsPlJ+COekzzi6khj4ADUo8k92XQ0lRWHLEBQp5lLP/eiz4W4wEyRu
 AJQFlRgsvMtmh2A7n32oTazJo0Vl/DmOQBbtmd6vSP9SNKyKH8bDFM+T48J+kAJRGK0o6Iabm7
 kxxvHVMjT5J4sECPWDf1Gy3E4ThRo9Y+CVMPM65KPiqsRTbWP+v1d9K1Oz9/+hYPJCFgCM5b1e
 FJw=
X-SBRS: 2.7
X-MesageID: 24867844
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="24867844"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/6] tools/ocaml/xenstored: fix deprecation warning
Date: Mon, 17 Aug 2020 19:39:50 +0100
Message-ID: <334f84f96ccd4adbbb84b6c01b690c9118fbd613.1597689211.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1597689211.git.edvin.torok@citrix.com>
References: <cover.1597689211.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

```
File "xenstored/disk.ml", line 33, characters 9-23:
33 | 	let c = Char.lowercase c in
              ^^^^^^^^^^^^^^
(alert deprecated): Stdlib.Char.lowercase
Use Char.lowercase_ascii instead.
```

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/disk.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/xenstored/disk.ml b/tools/ocaml/xenstored/disk.ml
index 4739967b61..1ca0e2a95e 100644
--- a/tools/ocaml/xenstored/disk.ml
+++ b/tools/ocaml/xenstored/disk.ml
@@ -30,7 +30,7 @@ let undec c =
 	| _          -> raise (Failure "undecify")
 
 let unhex c =
-	let c = Char.lowercase c in
+	let c = Char.lowercase_ascii c in
 	match c with
 	| '0' .. '9' -> (Char.code c) - (Char.code '0')
 	| 'a' .. 'f' -> (Char.code c) - (Char.code 'a') + 10
-- 
2.25.1


