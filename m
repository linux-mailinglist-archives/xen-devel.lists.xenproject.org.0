Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C18A6D9228
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 10:58:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518776.805630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkLRw-00046N-SW; Thu, 06 Apr 2023 08:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518776.805630; Thu, 06 Apr 2023 08:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkLRw-00043z-PR; Thu, 06 Apr 2023 08:58:32 +0000
Received: by outflank-mailman (input) for mailman id 518776;
 Thu, 06 Apr 2023 08:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozA9=75=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pkLRv-0003pI-NJ
 for xen-devel@lists.xen.org; Thu, 06 Apr 2023 08:58:31 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32127944-d459-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 10:58:30 +0200 (CEST)
Received: by mail-pj1-x102a.google.com with SMTP id x15so36653780pjk.2
 for <xen-devel@lists.xen.org>; Thu, 06 Apr 2023 01:58:28 -0700 (PDT)
Received: from localhost ([122.172.85.8]) by smtp.gmail.com with ESMTPSA id
 x22-20020aa793b6000000b0062d85a1df56sm837151pff.178.2023.04.06.01.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 01:58:26 -0700 (PDT)
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
X-Inumbo-ID: 32127944-d459-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680771507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJIrzTwFQA01WlKUp5gnPqmqgvFFVnJLpG/b7bte7e8=;
        b=fYj9IhtspZTO1c45rT5cqb2UnaJWejpmy/I7Jb3yPwkHvmLkvAK3m4181eanFeguwO
         SeDbDT7dPWprn5RlScKWm3FaPgdvFky7QhW80ffdPOLiGzm6WXwdxWZ5U6S3Bb+e9l/C
         Yi9H5wbFVxuyI7f7PvJiQ53X9ftCPgmsswvAfuG7TrwuGfHnbsaQdLLhq64h8suekOuZ
         xFYPfQMLzF64xH5EDGcAkqzG9axCSQa/U81f3qPm1ffOGvWlAJDiOl7wbH+xqAPVDvmH
         Sk+CfT78gQcLg9hXyuQ6pdRjvJuz12Ukytnr2gkEZYB8s4Wxf3qOK9F5AyqYTgzgfoI0
         DYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680771507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJIrzTwFQA01WlKUp5gnPqmqgvFFVnJLpG/b7bte7e8=;
        b=TzD7GvWb5wFXdWAICq7MDrGRuVOX163coNn3cs4vWx6+xDoSnJnqVDo2oYV3B+TdeM
         M6QIYJt0uLeDPqVfa1qRg+hoTNi+bEx/jCAYqaV1JXwdkPuaqlnJ/VNKW+0w4QPJZwx+
         +CCdh+R0+BDOWwoiqnt7zzAtax0bdFPfnX9aAFmzebKT+AcvoVFBdL7miw/vKJvDgxvP
         eWxVaNyNHemVtcZXWqqCQw/aNcYcRv31yfFv37/u5yJsFganXFRCW2YhGztVqQiTu1gR
         rCvHTRHh4BRXRNCKxhiwhfM8WRfcOaDVYvO0FLv5YKWw+53LZAqYx9alOtLstEJrjK/K
         ZILw==
X-Gm-Message-State: AAQBX9cO677LMLjxtf9H/ch+OtZ5HkZ1Z4Nm0UsGdP9BvLmg2BRfs0yi
	eCQWw2qGLVhiFlJTOEzMcwrYDAGFf7mR9vGKkQw=
X-Google-Smtp-Source: AKy350aan+Rv6En7fZ329g/XSQU5SCipZqx70PrdyPW+xTyx5BJ0yf8Nh3iuU7/nwLuqljfErs6vsw==
X-Received: by 2002:a05:6a20:ba9c:b0:d9:4d77:643e with SMTP id fb28-20020a056a20ba9c00b000d94d77643emr2166510pzb.4.1680771506861;
        Thu, 06 Apr 2023 01:58:26 -0700 (PDT)
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
	Erik Schilling <erik.schilling@linaro.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V3 2/2] libxl: fix matching of generic virtio device
Date: Thu,  6 Apr 2023 14:28:18 +0530
Message-Id: <888e60d2ec49f53230bc82df393b6bed4180cb8a.1680771422.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <18458fa39433ce4ac950a0a20cc64da93db0b03a.1680771422.git.viresh.kumar@linaro.org>
References: <18458fa39433ce4ac950a0a20cc64da93db0b03a.1680771422.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The strings won't be an exact match, as we are only looking to match the
prefix here, i.e. "virtio,device". This is already done properly in
libxl_virtio.c file, lets do the same here too.

Fixes: 43ba5202e2ee ("libxl: add support for generic virtio device")
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
V2->V3:
- Tag from Oleksandr.

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


