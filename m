Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A805B3AEE
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 16:44:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404436.646907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWfEP-0004Uy-6o; Fri, 09 Sep 2022 14:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404436.646907; Fri, 09 Sep 2022 14:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWfEP-0004RY-3t; Fri, 09 Sep 2022 14:43:45 +0000
Received: by outflank-mailman (input) for mailman id 404436;
 Fri, 09 Sep 2022 14:43:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BINJ=ZM=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oWfEO-0004RS-4g
 for xen-devel@lists.xen.org; Fri, 09 Sep 2022 14:43:44 +0000
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [2607:f8b0:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbf431e9-304d-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 16:43:42 +0200 (CEST)
Received: by mail-pg1-x530.google.com with SMTP id h188so1750995pgc.12
 for <xen-devel@lists.xen.org>; Fri, 09 Sep 2022 07:43:42 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 o10-20020a62cd0a000000b00537d0207b30sm591513pfg.184.2022.09.09.07.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 07:43:39 -0700 (PDT)
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
X-Inumbo-ID: cbf431e9-304d-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rV9bJbSRstvz5C/uRqZUoEp5fFMKfqTYvAeMvxSY2Co=;
        b=ceCTl8TH3rhiYlYD66k/hyC7l0cWG9Nm6NxDqDX94bTgZLXREcmk7+MMi+avzK8X86
         aIQXEVdLczjoc1WKHo6ZacVDF+Jnj0VP/GdyATCbMMkOh0QKJ3cgNvGWfVnmSJMhtuL5
         BrMMym1J7rfutqsE3sGbcWfU8jLLYfnEoMSvAa1qqvAa+MFEj9OaGAqrIwZpxBQg3Th3
         78vXhxA9BBdaxAxDxjkem8hdhfQLR0QY+KCkx96iOXBilzbSAjkWKKkShnOMhzjNM+7T
         Q0Lv2Qn5CJlCLhLvLBnNfAhCz6pkkTHOmlBBYHcOLLMpX5+mTEFX9cU/nsV0B1SLkV+g
         6tkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rV9bJbSRstvz5C/uRqZUoEp5fFMKfqTYvAeMvxSY2Co=;
        b=8Py0Lx9gDGwbpqBwjK31x/bUu6EUtAeI5CB4A7eXbP6W9yA70Cx9vy3cWklCSobrUa
         S1c/34qItnuEFPd+/VE3eLCkUZ6HW4q/wlIs4FdE1F5QCt4GL4BjUJrw3TB5jaZA/vcr
         onAappIIlGTj9bouU1td4qJmVyZBncOnIJUeJicFlg/fv9uSq70ms1BzMoIkNIsxUfKn
         n/CNB8zoO2rc7dP3h1eGlSqyPHHBBGCOoP6/7L6Y7PLBADuHK9zwuPVyG73lkjsvKhDI
         hq6BDHOCsOMDA2yYpIAG6sJkxQ/ljvS+j+jvNMMtQeXgH/mTaOYY0Dw1etYcNz3zMO6q
         tvRw==
X-Gm-Message-State: ACgBeo1bQ1C+MlhP53f070rlufwfo1lWcu0hBmLMozW+JOPuWP25i8Ck
	8a6OF1LZaLGAiNLeqeaQQez2p39mvDFVhA==
X-Google-Smtp-Source: AA6agR6eVv5VHUdVBA5nfEBT7WPmj5iAr2z5jyqst7LgPtgNJ0ouvRrR6LJCM11ln6OY8EyisUKXBA==
X-Received: by 2002:a63:d84e:0:b0:42b:5834:fd73 with SMTP id k14-20020a63d84e000000b0042b5834fd73mr12167334pgj.506.1662734620486;
        Fri, 09 Sep 2022 07:43:40 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH V6.1 3/3] libxl: arm: make creation of iommu node independent of disk device
Date: Fri,  9 Sep 2022 20:13:28 +0530
Message-Id: <ebcf40f0d5dfe6bfa27c11dc2fe3e65df48772fe.1662734469.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <099616e1092409fceea4eb30590215310f8c091c.1662626550.git.viresh.kumar@linaro.org>
References: <099616e1092409fceea4eb30590215310f8c091c.1662626550.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The iommu node will be required for other virtio device types too, not
just disk device.

Move the call to make_xen_iommu_node(), out of the disk device specific
block and rename "iommu_created" variable to "iommu_needed", and set it
to true for virtio disk device.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V6->V6.1:
- Initialize iommu_needed at declaration time only.
- Update comment.

 tools/libs/light/libxl_arm.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 55aee15c10b4..fe1c92383dd6 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1157,7 +1157,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
     size_t fdt_size = 0;
     int pfdt_size = 0;
     libxl_domain_build_info *const info = &d_config->b_info;
-    bool iommu_created;
+    bool iommu_needed = false;
     unsigned int i;
 
     const libxl_version_info *vers;
@@ -1265,22 +1265,25 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
 
-        iommu_created = false;
         for (i = 0; i < d_config->num_disks; i++) {
             libxl_device_disk *disk = &d_config->disks[i];
 
             if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
-                if (disk->backend_domid != LIBXL_TOOLSTACK_DOMID &&
-                    !iommu_created) {
-                    FDT( make_xen_iommu_node(gc, fdt) );
-                    iommu_created = true;
-                }
+                if (disk->backend_domid != LIBXL_TOOLSTACK_DOMID)
+                    iommu_needed = true;
 
                 FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
                                            disk->backend_domid) );
             }
         }
 
+        /*
+         * The iommu node should be created only once for all virtio-mmio
+         * devices.
+         */
+        if (iommu_needed)
+            FDT( make_xen_iommu_node(gc, fdt) );
+
         if (pfdt)
             FDT( copy_partial_fdt(gc, fdt, pfdt) );
 
-- 
2.25.1


