Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D263C6D711F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 02:13:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518194.804475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjqli-0003Fi-Mh; Wed, 05 Apr 2023 00:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518194.804475; Wed, 05 Apr 2023 00:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjqli-0003Cj-Jt; Wed, 05 Apr 2023 00:12:54 +0000
Received: by outflank-mailman (input) for mailman id 518194;
 Wed, 05 Apr 2023 00:12:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=enMU=74=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pjqlh-0002xi-H7
 for xen-devel@lists.xen.org; Wed, 05 Apr 2023 00:12:53 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a5e91b4-d346-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 02:12:51 +0200 (CEST)
Received: by mail-pj1-x102d.google.com with SMTP id j13so32305906pjd.1
 for <xen-devel@lists.xen.org>; Tue, 04 Apr 2023 17:12:51 -0700 (PDT)
Received: from localhost ([122.172.85.8]) by smtp.gmail.com with ESMTPSA id
 z3-20020a170902ee0300b001a1ea1d6d6esm8851436plb.290.2023.04.04.17.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 17:12:48 -0700 (PDT)
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
X-Inumbo-ID: 9a5e91b4-d346-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680653570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYxdQefgqzq2X8Q8qR8DL2/WAeN3DrYXWhA7psmOG80=;
        b=tzmH9TBXP3GLNCGLUPpOx4TttKCBmol8VdJA6+UQj486ul/mT6/7hcIp6NJQc4wMbq
         WfrnQHg0d5FE8BoZ+pORuig9piAflF/mel91+K1+Mb5MkgBp+E4vzEupCjnuuiRSeaUX
         sRR6x0OfIml2X7W/sZqZrwDJ4uIL2NfsQ/4s72WUpB43/9QfiBpV2M2YUJw11AtvFYEW
         nv66L+qr4kJQ5ganRgEFds/KFds1DLRrf5fFhiu/A2+2UYdPxH258Q/hzgiOn2wWIwM/
         1Ldud6iAarCJ2TmueSghvBXJ4lUdwxT03TM96N4q02SHBzvW0L4kDw1EnL6wqlCOOWMF
         KQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680653570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYxdQefgqzq2X8Q8qR8DL2/WAeN3DrYXWhA7psmOG80=;
        b=GUu6wSDAMyEFpzl5D4lur6Bfuwm6xfpmJQLDL1YaXjXiVvyTFG5+yiIBOj844Ak61W
         fCa6+JA4NyN6mhUg99UajP5Y8dB1H5k32NmOph+pTDIlZeHwuXi+Axb5SKVimS70tlHb
         umRuMFVdNVBzNWCUI2KhAhjqBkFC66Aw+ZqNcVbc7zcQdmqDHDMQXAlrSC7yw7n8Uf/w
         vg5U3w9KtMn+6ug6Llo4VGaieK5Tsy26ufecm6OD1HEMrQVsxsdYigTmbaoxGoEpzSUy
         D6yajaSofqK0QlqBLKXDLLCgeuM2V6yV8ipBGiPWjNIXePZACicGgcD+IcCnNXciBHAH
         cFfw==
X-Gm-Message-State: AAQBX9cwOIOvRrRqV5v25Tv2wxT49ySgIeZtpcTvCM0rlkkbO7c5KqqR
	Aeedze2Kq57twibw7hPeizJDyeIYu3MtMNsOX8E=
X-Google-Smtp-Source: AKy350b5vjoTBYkLa2izjFoNXcHxKSMw3SrIT5qvguVpK4gjXabDgou1jc1K8ftTFJBNnxwFcqQy9w==
X-Received: by 2002:a17:90b:3b8a:b0:237:161d:f5ac with SMTP id pc10-20020a17090b3b8a00b00237161df5acmr4435401pjb.36.1680653570386;
        Tue, 04 Apr 2023 17:12:50 -0700 (PDT)
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
Subject: [PATCH V2 2/2] libxl: fix matching of generic virtio device
Date: Wed,  5 Apr 2023 05:42:36 +0530
Message-Id: <62f2603d8b3fba1efb236063a0819fb95285b0ae.1680653504.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <c5d2ab978255ca84197c980cbfb9a504e7c625f8.1680653504.git.viresh.kumar@linaro.org>
References: <c5d2ab978255ca84197c980cbfb9a504e7c625f8.1680653504.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The strings won't be an exact match, as we are only looking to match the
prefix here, i.e. "virtio,device". This is already done properly in
libxl_virtio.c file, lets do the same here too.

Fixes: 43ba5202e2ee ("libxl: add support for generic virtio device")
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V1->V2: Add the missing fixes tag.

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


