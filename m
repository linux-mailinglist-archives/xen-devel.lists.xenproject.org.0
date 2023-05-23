Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E3670E1F3
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 18:38:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538555.838608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V1y-0007MW-Bf; Tue, 23 May 2023 16:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538555.838608; Tue, 23 May 2023 16:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V1y-0007Jo-5y; Tue, 23 May 2023 16:38:38 +0000
Received: by outflank-mailman (input) for mailman id 538555;
 Tue, 23 May 2023 16:38:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1V1w-0006Dr-3m
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 16:38:36 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 415f2f5f-f988-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 18:38:34 +0200 (CEST)
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
X-Inumbo-ID: 415f2f5f-f988-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684859914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IEGR3JC5y7uEKhXS+Y9a7VtCNob5XWmUbPOoOUvPi10=;
  b=cDkzbdqIILspKHeRoP+W1aLY9tz8Pt3L99A2u5Lx2rOsepGySQEUneJk
   G1c9gnb+mIYXGzxpg0lGW3M5ACERAWmYWBIktrhCmyKI9fEv95a3viToL
   CfOVdgsTtVX/QSi5BLtBTadJDwfsaMtkGR4m7TdQKh7UQFWQLwjwcqLbj
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112568309
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:GKpitKNvQsKLJbnvrR2tl8FynXyQoLVcMsEvi/4bfWQNrUomhDZTy
 jYXXGyAPfqNZjH3L953bd/j8RhS6pfcy9c1TQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tF5AdmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uBQGlgV6
 N4REhZTcTuGi/Ky8buJYPY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXTH5gLzh3A9
 woq+UynEwgTN9ux4gG5rHaGp8KMkyShdYQdQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxassgYHXttME8Uz8AyX1rfP+AGdG3QFSThaLtchsacLqScCj
 wHT2YmzXHo27ePTECjGnluJkd+sES4yNlZZeA0Ndy1b/PLmrJE3vxv9ZMk2RcZZkebJMT33x
 jmLqg03iLMSkdMH2s2HwLzXv96/jsOXF1Bov207Skrgt1okP9D9O+RE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFRz3oxZPnqgKulmSwXuF1e5aEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQMsQuJFfbp3A3PRL4M4XRfK8EyPtXB
 HtmWZz0USZy5VpPl1JauNvxIZd0n3tjlAs/tLjwzgi90Kr2WUN5vYwtaQPUBshgtfPsnekg2
 4oHXyd840kFAbKWj+i+2dJ7EG3m2lBgXcqn9JMPJr/fSuekcUl4Y8LsLXoaU9QNt8xoei3gp
 RlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:ZH80mahGIJG3ZyMc8MxBHr1FMnBQXrkji2hC6mlwRA09TyX4ra
 CTdZEgviMc5wx9ZJhNo7q90cq7IE80i6Qb3WB5B97LYOCMggeVxe9Zg7ff/w==
X-Talos-CUID: 9a23:BCGbFG/R8fdHfma3dIaVv0gzAfl+b1/U9lGOPGS9BXZtebSnY0DFrQ==
X-Talos-MUID: 9a23:U3QjYwnkB/TNRTWZubgZdno8Jd5h4KOAI3sxz5EsmuTHOysqFjGS2WE=
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="112568309"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [XEN PATCH 04/15] build: hide policy.bin commands
Date: Tue, 23 May 2023 17:38:00 +0100
Message-ID: <20230523163811.30792-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523163811.30792-1-anthony.perard@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Instead, show only when "policy.bin" is been updated.

We still have the full command from the flask/policy Makefile, but we
can't change that Makefile.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/xsm/flask/Makefile | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 3fdcf7727e..fc44ad684f 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -48,10 +48,15 @@ targets += flask-policy.S
 FLASK_BUILD_DIR := $(abs_objtree)/$(obj)
 POLICY_SRC := $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
 
+policy_chk = \
+    $(Q)if ! cmp -s $(POLICY_SRC) $@; then \
+        $(kecho) '  UPD     $@'; \
+        cp $(POLICY_SRC) $@; \
+    fi
 $(obj)/policy.bin: FORCE
-	$(MAKE) -f $(XEN_ROOT)/tools/flask/policy/Makefile.common \
+	$(Q)$(MAKE) -f $(XEN_ROOT)/tools/flask/policy/Makefile.common \
 	        -C $(XEN_ROOT)/tools/flask/policy \
 	        FLASK_BUILD_DIR=$(FLASK_BUILD_DIR) POLICY_FILENAME=$(POLICY_SRC)
-	cmp -s $(POLICY_SRC) $@ || cp $(POLICY_SRC) $@
+	$(call policy_chk)
 
 clean-files := policy.* $(POLICY_SRC)
-- 
Anthony PERARD


