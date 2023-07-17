Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA2375662E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 16:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564620.882166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLP3A-0003gf-Ad; Mon, 17 Jul 2023 14:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564620.882166; Mon, 17 Jul 2023 14:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLP3A-0003eZ-78; Mon, 17 Jul 2023 14:18:08 +0000
Received: by outflank-mailman (input) for mailman id 564620;
 Mon, 17 Jul 2023 14:18:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=peYT=DD=citrix.com=prvs=555f7cff5=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qLP39-0003RA-3m
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 14:18:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be727ee2-24ac-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 16:18:05 +0200 (CEST)
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
X-Inumbo-ID: be727ee2-24ac-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689603485;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UJMyvEEmIjIbPLQ3Zyo8P65ouEn3wRNR82i0jvI+GIc=;
  b=e3ks1QkPVNhsuXV7iCj23GIhTnb0tzz7TDzioTOSMTArrW1DvcKoTLJe
   1q50RBj9AzKWEept4tfDullHO1fL7mLouvSV3YiteRiF4fJLQplDPKXbP
   mhrKsjKrBX9pYxPfO4QJ+CZIRc396BilV+85D4pfLYplWSLac3r4zOMfK
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 116488458
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:GpzE46NwYgZ8AyPvrR3/l8FynXyQoLVcMsEvi/4bfWQNrUog3jEHy
 2NLC2+Ba/qCY2Lzetsjat6/oE8GusWEytJmSwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tH5wNmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vRoBENvz
 OAqFDlORRKsiu6b/rHqF8A506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXTG5kFzhrF9
 goq+UzWDhs9D5uQwwCq61CJicDzsHzme6Q7QejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxa5UgU0AoQKVbdgsUfUl/SSulzCboQZctJfQM45se0XfCAY6
 lbKtNHGCDBCjr7EFFvIo994sgiO1TgpwX4qPHFUHFZfsoW98OnfnTqUEI89TffdYsndXGipn
 mvU9HVWa6A715Zj6kmtwbzQb9tATLDtRxV92AjYV3nNAuhRNN/8PNzABbQ2AJ99wGelorqp5
 iJsdzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pS7yINsKvG0jeho0WirhRdMOS
 BaO0T69GbcJZCf6BUOJS9nZ5zsWIVjISo2+C6G8gitmaZltbg6XlByClmbJt10BZHMEyPllU
 b/CKJbEMJrvIfg/pNZAb7tHgOBDK+FX7T+7eK0XODz8i+XDOyHOEO1t3ZnnRrlR0Z5oaT79q
 753X/ZmAT0GOAEiSkE7KbIuEG0=
IronPort-HdrOrdr: A9a23:aNZ2iq5bZS7mtu0qCwPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: 9a23:32ys5mzOszD0gQWaK4nrBgUGBcUHU0TB/kvZYGS6JmtlZYOWGAK5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3A0ETYXA5ny30zm7/1JmZvigDSxoxH766JMwcCm68?=
 =?us-ascii?q?pouuhOgNMFmiArxKeF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,211,1684814400"; 
   d="scan'208";a="116488458"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [OSSTEST PATCH] ts-xen-build-prep: force use of git protocol v2
Date: Mon, 17 Jul 2023 15:17:45 +0100
Message-ID: <20230717141745.33470-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Recent version of QEMU (to be 8.1) started to use meson subproject to
clone extra repo. With the example of the subproject "dtc", they do a
shallow clone with a sha1. Meson end up running:

    git fetch --depth 1 origin b6910bec11614980a21e46fbccc35934b671bd81

This command fails. I think the error message is something like "the
remote end hung up unexpectedly", on Debian Buster. A more useful
message with more recent version of git seems to be "couldn't find
remote ref".

If we allow git to communicate with the protocol v2, then the shallow
clone works. But git on buster still use v1 by default. Force it to
use v2.

This needs a git-cache-proxy version that can allow to switch to v2 of
the protocol. A bug is open upstream to track this change:
    https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1040476

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    I've already apply the patch to our git-cache-proxy version in the
    testlab.
    
    Also, I've been using this osstest patch a few times, and none of my
    flights broke because if it, so I guess git-protocol v2 work well enough
    in buster, even if it isn't the default yet in this git version.

 Osstest/TestSupport.pm | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 360cfdea..f0e087aa 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -3254,6 +3254,14 @@ sub gitcache_setup ($) {
         insteadOf = ${proxy}$urlprefix
 END
     }
+
+    # Adding mandadory use of Git protocol v2
+    # necessary on buster when building QEMU v8.1
+    $gitcfg .= <<END;
+[protocol]
+	version = 2
+END
+
     target_putfilecontents_stash($ho,30,$gitcfg,"/home/osstest/.gitconfig",
                                  'home-osstest-gitconfig');
 }
-- 
Anthony PERARD


