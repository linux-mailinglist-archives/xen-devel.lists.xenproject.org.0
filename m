Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC236A5EAE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 19:23:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503668.776011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX4cm-0008W9-Go; Tue, 28 Feb 2023 18:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503668.776011; Tue, 28 Feb 2023 18:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX4cm-0008Tm-E8; Tue, 28 Feb 2023 18:22:52 +0000
Received: by outflank-mailman (input) for mailman id 503668;
 Tue, 28 Feb 2023 18:22:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UJ3u=6Y=citrix.com=prvs=4169be7e0=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pX4ck-0008Tg-Vi
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 18:22:50 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e614bcd4-b794-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 19:22:48 +0100 (CET)
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
X-Inumbo-ID: e614bcd4-b794-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677608568;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jxy6VqGGgAbo5pReyA89z5N5RetTLCK9bUegkJqrGKc=;
  b=c17hCiQ4DM4SrkHj8rGQshcE40s4/YA5uV0Z2e4U4f6ITY3+XUGdwbfs
   gFDAxSwbtMqpaF0Sj9oCgmS6qBNMM8t/JysE3TpLiUGBw4UEXqx8apQ6U
   yUzjVa/E9ggwp3vXAe4KCz44319847kfb/VBFj+iRQ/qzNl6R0dYP7m/C
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101319307
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Qv32vqOsOpuVcaHvrR2Al8FynXyQoLVcMsEvi/4bfWQNrUp00GQHx
 2sXWmnSOK2JYGT1fYtzO43k805Su5LXmoVlTAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tC5AxmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0udHLT53z
 8YcERxOVEu+3s3twYm+F/Y506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXSHJ4Mzx3A+
 Qoq+UzTBhAmD8eewAGp9yqumtbQsCn4A787QejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxastRcGV91dO+Yz8g2Kx+zf5APxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHjVGOYSvDrPHO92r0YHVLazZYPkfoUDfp/fHikK1styj1Su9PU5Tus4TaQjDLx
 m2V+X1Wa6ooseYH0KCy/Fbiij2qp4TUQgNd2jg7Tl5J/SsiOtf7OtXABUzzqK8Zcd3HFgXpU
 G0swZD20QwYMX2aeMVhqs0pFarh2fuKOSa0bbVHT8h4rGTFF5JOkOltDNBCyKVBaJtsldzBO
 hW7VeZtCHh7bROXgVdfOd7ZNijT5fGI+S7Zfv7VdMFSRZN6aRWK+ipjDWbJgT+yzRJ2wPlja
 MvKGSpJMZr9If46pAdaus9HieN7rszA7Ti7qW/HI+SPjuPFOS/9pUYtO1qSdOEphJ5oUy2Mm
 +uzw/Cikk0FOMWnO3m/zGLmBQxSRZTNLcys+pM/my/qClYOJVzN/NeKmeNwJtw0xP8K/goKl
 1nkMnJlJJPErSWvAW23hrpLMu6HsUpXxZ7jARERAA==
IronPort-HdrOrdr: A9a23:+LgFGK4L+eo1pMEbiQPXwN3XdLJyesId70hD6qkXc203TiX4ra
 CTdZEgviMc5wx+ZJhRo7q90cW7LE80jKQFg7X5Xo3CYOCFghrMEGgK1+KL/9SKIULDH4BmuZ
 tdTw==
X-IronPort-AV: E=Sophos;i="5.98,222,1673931600"; 
   d="scan'208";a="101319307"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH] automation: Always pull base image when building a container
Date: Tue, 28 Feb 2023 18:22:26 +0000
Message-ID: <20230228182226.52201-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Ask docker to check if there's an update of the base image to avoid
using an old container cached locally.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 automation/build/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/build/Makefile b/automation/build/Makefile
index f1d56ce532..4df43b0407 100644
--- a/automation/build/Makefile
+++ b/automation/build/Makefile
@@ -16,7 +16,7 @@ help:
 include yocto/yocto.inc
 
 %: %.dockerfile ## Builds containers
-	$(DOCKER_CMD) build -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
+	$(DOCKER_CMD) build --pull -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
 	@if [ ! -z $${PUSH+x} ]; then \
 		$(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
 	fi
-- 
Anthony PERARD


