Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B80F609E18
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 11:35:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428790.679291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omtrY-0000IQ-5Z; Mon, 24 Oct 2022 09:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428790.679291; Mon, 24 Oct 2022 09:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omtrY-0000Fe-2Q; Mon, 24 Oct 2022 09:35:16 +0000
Received: by outflank-mailman (input) for mailman id 428790;
 Mon, 24 Oct 2022 09:35:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HqnR=2Z=citrix.com=prvs=28966b5d3=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1omtrW-0000FW-Fp
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 09:35:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27d11433-537f-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 11:35:13 +0200 (CEST)
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
X-Inumbo-ID: 27d11433-537f-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666604112;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GgMa8rYA1ciCZeYPHkS/Somdhm2GHgBCD7eJmLHr/1I=;
  b=Glu7gxaOhq3DVrR6IxRFfAt6hU+tgwjtVkXJzBPmAs5OK7oSUoabSfJ2
   42itbzC+OrhdEOQL7G6XrNJ8kK2avYoGWwjOykfyeRDd+X4QedwtTeH3D
   KNeMBR3CUIGd6VpnopYvN9Q+xXr/HcVc7uyUOy+0a/rFZBLd11z3+BMwT
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 82979779
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SmhODq9vT7KfpjWveVcWDrUDrX6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GIdXzuFM6nYZ2CgLY9zYN+y80MAvMfcydNiSgNtqy48E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOC6UIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv/rRC9H5qyo4mpA5AdmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0ttTW0MUq
 fA4Eh4EdQKkmuX1367mV8A506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w/N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9KobbGpQKwRfwS
 mTu+VakUhQwL9ukmB2b1lKcv9DRpi35R9dHfFG/3qEz2wDCroAJMzUMUkCxu/6+iUiWVNdWK
 khS8S0rxYAt8GS7Q9+7WAe3yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebRwn0
 EWY2ezgAzNHuaeQD3ma89+pQSiaYHZPazVYPGldEFVDs4KLTJwPYgznc/I5MvTpgv3PNzjr0
 ReXq2shm+gOpJtev0mkxmzvjzWpr5nPawc64ATLQ26ohj9EiJ6Zi5+AsgaCs6sZRGqNZhzY5
 SVfxZDChAwbJcvV/BFhVtnhC11ACxytFDTHyWBiEJA6n9hG0y7yJNsAiN2SyaoADyrlRdMLS
 BWC0e+yzMUJVJdPUUOQS9vrY/nGNYC6SbzYugn8N7KimKRZeg6d5z1JbkWNxW3rm0VEufhhZ
 8nGLJ70Ui5EU/sPIN+KqwA1iOFD+8zD7TmLGcCTI+qPjdJym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3Cid540w3bQEKWQGOqdR7BQlTdRATXMmmw/G7g8bee2KK7kl6UKSPqV7gEqQ495loehDgp
 SjlBBcGmACl3hUq62yiMxheVV8mZr4nxVpTAMDmFQzAN6QLCWp30JoiSg==
IronPort-HdrOrdr: A9a23:8TIsV698TzEUBn+UFZRuk+DUI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+MjztCWE7gr5N0tBpTntAsW9qBDnhPtICOsqTNSftWDd0QPCRuxfBOPZslrd8kbFl9K1u5
 0OT0EHMqyTMWRH
X-IronPort-AV: E=Sophos;i="5.95,207,1661832000"; 
   d="scan'208";a="82979779"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>, Anthony PERARD <anthony.perard@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Wei
 Liu" <wl@xen.org>
Subject: [XEN PATCH for-4.17] tools/golang: Remove existing *.gen.go before re-creating them
Date: Mon, 24 Oct 2022 10:34:55 +0100
Message-ID: <20221024093455.39969-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In cases where we don't have permission to write to the existing
*.gen.go, we should be able to remove them and recreate them.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

For 4.17:
    Without this, it is possible that the Gitlab CI got in a state
    where writing to the file would fail, but removing it and creating
    a new one should work.

    This issue have been observed only on `fedora-gcc*` jobs as fedora
    is our only container that have `golang` installed. And it runs
    the build as a `user` instead of `root.
---
 tools/golang/xenlight/gengotypes.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/golang/xenlight/gengotypes.py b/tools/golang/xenlight/gengotypes.py
index 9fec60602d..ed0122874f 100644
--- a/tools/golang/xenlight/gengotypes.py
+++ b/tools/golang/xenlight/gengotypes.py
@@ -45,6 +45,7 @@ def xenlight_golang_generate_types(path = None, types = None, comment = None):
     if path is None:
         path = 'types.gen.go'
 
+    os.unlink(path)
     with open(path, 'w') as f:
         if comment is not None:
             f.write(comment)
@@ -209,6 +210,7 @@ def xenlight_golang_generate_helpers(path = None, types = None, comment = None):
     if path is None:
         path = 'helpers.gen.go'
 
+    os.unlink(path)
     with open(path, 'w') as f:
         if comment is not None:
             f.write(comment)
-- 
Anthony PERARD


