Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC2D6CFCE6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 09:36:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516436.800506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phmoU-0003wo-Ph; Thu, 30 Mar 2023 07:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516436.800506; Thu, 30 Mar 2023 07:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phmoU-0003uS-Ls; Thu, 30 Mar 2023 07:35:14 +0000
Received: by outflank-mailman (input) for mailman id 516436;
 Thu, 30 Mar 2023 07:35:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u6CU=7W=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1phmoS-0003sp-J7
 for xen-devel@lists.xen.org; Thu, 30 Mar 2023 07:35:12 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 648bc214-cecd-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 09:35:10 +0200 (CEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 lr16-20020a17090b4b9000b0023f187954acso18728875pjb.2
 for <xen-devel@lists.xen.org>; Thu, 30 Mar 2023 00:35:08 -0700 (PDT)
Received: from localhost ([122.172.85.168]) by smtp.gmail.com with ESMTPSA id
 q27-20020a63505b000000b0050bebfe464dsm22584611pgl.53.2023.03.30.00.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 00:35:05 -0700 (PDT)
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
X-Inumbo-ID: 648bc214-cecd-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680161706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WSnfA1xgOrFdrD1/DW7OzeR7rpuxX2XteyLNIaEJqAY=;
        b=mKHZeRK2T67SBQRQnLlCNRWdHicKqCwoQhpM3ylzBn9jEOn8YzHce33QTb3P0pLxTw
         pHojPgD4QgActMYmWuZRqijtUrCo1FkY49EKdd3ibiGtJOQuSfphxxVh8zgok06rhU0N
         vC5j0FNcCg+RlbV4gUTGr8WjpPks+kedZ0KLoFEmf3Tvr/bhM0xmbNz8w7khbOObZEsr
         cQRVIqYSlrhqpr4fgweeETBn5syQnP5zBfvgIQUtoL1Sq4LH9e9xBu6fLzhsNIDJ6MYn
         DBsUtenVWwVrOe11m+9f52K31OdVhtt4qXdP26oYpjsmSjKas9NlN7aR5yEBN4YmRAu/
         +U/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680161706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSnfA1xgOrFdrD1/DW7OzeR7rpuxX2XteyLNIaEJqAY=;
        b=T9NCRpSFlxY3M0Gm7/Fddg286LwAYicA7F0NUSP9xnOyFLWQJiijux205fTuvzRJdY
         wP/1UsiCjf2lzkkcpJGls50XD1mTYy3d+lVBBkzOuF3h7NPj31zMGr1d8kcKGMPNxb0x
         BZMhXx9wqrw7U2COFH9gTn4L/4AW9FtpRn4chlsOHvlkNdtqOZEJbo0Lj/bD1AaIcQwb
         InF6bFFGnvXFUxe55PFrCegrPDu0zhmrwf7ntKKpTYFb2zyn3mg0F3RHlf1zcRtsdpF2
         KfKnyWkMHPs/1rAzOIzpyUrSU7v80veTH8UcJTdPzh+S+Xb6PWQFFxoEToc2Cuanh5Y9
         vheA==
X-Gm-Message-State: AAQBX9fQq/g+9UltuLvhaXmLSaT8CIyNw0lwhmfOzrYLoi+8MPk1ZbMa
	rHlzIKWcdD4aOAvcpoNRujnba/VV0cl+TkV/zbU=
X-Google-Smtp-Source: AKy350akyf7uqfZf0nMu+zqKFWa+fISDa2zCy8RuuYyd57sXyKt8Te3SQUefftZ0budYajOZBItyAg==
X-Received: by 2002:a17:903:5c8:b0:1a1:ad52:4060 with SMTP id kf8-20020a17090305c800b001a1ad524060mr19378730plb.20.1680161706074;
        Thu, 30 Mar 2023 00:35:06 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: [PATCH] libxl: fix matching of generic virtio device
Date: Thu, 30 Mar 2023 13:05:02 +0530
Message-Id: <210b5be4b7e84fce1519663f28ca24f6761fb2cb.1680161663.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The strings won't be an exact match, and we are only looking to match
the prefix here, i.e. "virtio,device". This is already done properly in
libxl_virtio.c file, lets do the same here too.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index ddc7b2a15975..97c80d7ed0fa 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1033,10 +1033,14 @@ static int make_virtio_mmio_node_device(libxl__gc *gc, void *fdt, uint64_t base,
     } else if (!strcmp(type, VIRTIO_DEVICE_TYPE_GPIO)) {
         res = make_virtio_mmio_node_gpio(gc, fdt);
         if (res) return res;
-    } else if (strcmp(type, VIRTIO_DEVICE_TYPE_GENERIC)) {
-        /* Doesn't match generic virtio device */
-        LOG(ERROR, "Invalid type for virtio device: %s", type);
-        return -EINVAL;
+    } else {
+        int len = sizeof(VIRTIO_DEVICE_TYPE_GENERIC) - 1;
+
+        if (strncmp(type, VIRTIO_DEVICE_TYPE_GENERIC, len)) {
+            /* Doesn't match generic virtio device */
+            LOG(ERROR, "Invalid type for virtio device: %s", type);
+            return -EINVAL;
+        }
     }
 
     return fdt_end_node(fdt);
-- 
2.31.1.272.g89b43f80a514


