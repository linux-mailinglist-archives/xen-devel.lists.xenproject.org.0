Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BB85B17BF
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 10:53:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402882.644845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDHt-0004y6-CS; Thu, 08 Sep 2022 08:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402882.644845; Thu, 08 Sep 2022 08:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDHt-0004u3-7p; Thu, 08 Sep 2022 08:53:29 +0000
Received: by outflank-mailman (input) for mailman id 402882;
 Thu, 08 Sep 2022 08:53:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jDMa=ZL=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oWDHs-00041V-0U
 for xen-devel@lists.xen.org; Thu, 08 Sep 2022 08:53:28 +0000
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [2607:f8b0:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3829a88-2f53-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 10:53:26 +0200 (CEST)
Received: by mail-pg1-x52d.google.com with SMTP id 78so16054808pgb.13
 for <xen-devel@lists.xen.org>; Thu, 08 Sep 2022 01:53:26 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 k15-20020aa7998f000000b0053e9c04757dsm2067450pfh.169.2022.09.08.01.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 01:53:24 -0700 (PDT)
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
X-Inumbo-ID: b3829a88-2f53-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=KvygtE56N8zYKSJxBlMmn0X+tKsUv5sphCjxV3H2TI4=;
        b=WohkmT1BeCvS0E8Wetu+Zk37tJlFt2oJSQpKV+b3jFHbACkodyw/hJgyGjsoSZlxXq
         rHcd2Roec+M4LP+J/u6QvlYY4x3kECdQHjPklUMGK+3Q9Iz91AR8NtYD2JeMvplDNfJa
         zC4lBxO7izl7baxR2DE52F2OonJlXP4oKQDr1bTFAb7Zcb4iChJEf7MuUqYU7XKS1sKY
         46+/i1+6VS8YfaWjE2YN2Zc/0t6tuqcElgIBVISus5FIC2E5CO3E3cDuhgVs47cCWGLI
         p8clqR40EALUIXkcklT2O4Qw5vB/I6ymUus+26KLIOip7ydmb6sWVsArmkjh0V2VSIi5
         YSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=KvygtE56N8zYKSJxBlMmn0X+tKsUv5sphCjxV3H2TI4=;
        b=N+/zuVXR7rOH/Yp8lE3wCfgXBOE+zzBNi2ouAxrJH54+tnpSsnlIDvUKDtVSkrv3tl
         1OflqWe/mziM2nrAeBy3l034IURryV5i3oP8RVFR08HgLc/l28zUtoi2dEO2NfVnXXqc
         F2TtiipVuhl71X+u3vXsvxfsLXBaSgs3X8gwVPr5amx9t4o3iQ1Xb1tSeOknwzhfQn+w
         mqImg9YwXFeOO40upSRnUdLFZ0++bwCK46yB2ylH4TNsiNcdM/RmQBXix8yYnANz5t74
         FBuVdKp2lquu3sb2pGen/0N2JPwx37jDyqmrQQcVeDfUkSJ1Hgxml7d+db7vlKsK90e7
         4c8Q==
X-Gm-Message-State: ACgBeo1rYXXHjwgoG6AeuBpjjmAV72hzo26GrHWjXoIEveJ/HhGiqrb/
	KlqRC0XpTT3p6kwDUuyXJXQsn04OqVTPKg==
X-Google-Smtp-Source: AA6agR7rTh0qzn+h0YaGzImMjv1sCcTEZWC+LMNk7f8DZa4Jdj1plGLmSf7Cz36sRy94uaxwxeYcug==
X-Received: by 2002:a63:d114:0:b0:429:f039:ccfc with SMTP id k20-20020a63d114000000b00429f039ccfcmr7090714pgg.95.1662627205408;
        Thu, 08 Sep 2022 01:53:25 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH V6 3/3] libxl: arm: make creation of iommu node independent of disk device
Date: Thu,  8 Sep 2022 14:23:01 +0530
Message-Id: <099616e1092409fceea4eb30590215310f8c091c.1662626550.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1662626550.git.viresh.kumar@linaro.org>
References: <cover.1662626550.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The iommu node will be required for other virtio device types too, not
just disk device.

Move the call to make_xen_iommu_node(), out of the disk device specific
block and rename "iommu_created" variable to "iommu_needed", and set it
to true for virtio disk device.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 55aee15c10b4..2637acafa358 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1157,7 +1157,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
     size_t fdt_size = 0;
     int pfdt_size = 0;
     libxl_domain_build_info *const info = &d_config->b_info;
-    bool iommu_created;
+    bool iommu_needed;
     unsigned int i;
 
     const libxl_version_info *vers;
@@ -1265,22 +1265,26 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
 
-        iommu_created = false;
+        iommu_needed = false;
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
+         * Note, this should be only called after creating all virtio-mmio
+         * device nodes
+         */
+        if (iommu_needed)
+            FDT( make_xen_iommu_node(gc, fdt) );
+
         if (pfdt)
             FDT( copy_partial_fdt(gc, fdt, pfdt) );
 
-- 
2.31.1.272.g89b43f80a514


