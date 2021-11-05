Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA0E445FB2
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:33:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222024.384059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1misnD-0002Ba-A3; Fri, 05 Nov 2021 06:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222024.384059; Fri, 05 Nov 2021 06:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1misnD-00023j-55; Fri, 05 Nov 2021 06:33:39 +0000
Received: by outflank-mailman (input) for mailman id 222024;
 Fri, 05 Nov 2021 06:33:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1misnB-0000uf-9c
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:33:37 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e1ba8e0-3e02-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 07:33:36 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id g10so29446069edj.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:33:36 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id e12sm3599870ejs.86.2021.11.04.23.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:33:35 -0700 (PDT)
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
X-Inumbo-ID: 4e1ba8e0-3e02-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=stTfdYmsCC/2Kmn4pDoWefR6cFnWNl9nnA6XN7kP6KA=;
        b=RrUXMZjfuRVcVwWaN83xyLLOv4csdbKiElqWVwCIZByOoI8zw9325+q2N4a37Antnw
         JBSWsmLXh5F3pheSFKHoqulolgtSO1RQT5Ym7U2tvGEdK7DPW1o3ALSFMaCA5sLtMAtO
         VPeuXIu1LANoaf3CKEdmL4UiWDPJ27eqlJCXnnSAbARIoClGPfvHrfrp+iPLNOeburDV
         MplYa1LjpQ1FcOvWC/czuim/YVDtA3i5h+9XtLp5WIiXP3iCNkMlx2Sm/G3cI62ihJ9V
         muZlfDBMz/4U21Cb+9fvPmolf0+ZqELYpzj2hRoWNTnPva8eXxdmm564aTYsj9yB28bI
         1+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=stTfdYmsCC/2Kmn4pDoWefR6cFnWNl9nnA6XN7kP6KA=;
        b=MnUpQjQPeJJMKhfj9hnYBzmUVQ5nPZGJ5FYyH5bfHradQcgmyuZ+DfO9RPTss5joaa
         zrc9ejVxzQcFSJMUBFqGweMZbUwn8gLU4tDiCCsR79TtqGPxnb7N3jaGIm4AF2u75Wiz
         fIASPf7Gwp+eTw9tYlwvE0cpx+RyFoOu7Pn0l0frOYq9lb1T3CQxAlZG1kPM7hbzt6sQ
         qxlsD3Rdh0ymFQsl7a0Xy/ucd345Re7cKjEdXVPpxJGMro+0xv2Nmc1FkmXSL0SL8GEt
         RkTUQzNuRaf541PodpC2hDylYfPF7DQclc0QFfJmTMGjGPYJubAt1ywy12CR5BLAkbyZ
         ST4g==
X-Gm-Message-State: AOAM5307D5ofmX++QbaglSgLhbXTiqJ7qJRLJ22b4/pzArlqReyJLjSs
	Gui1LYU9l4Xh4xRyalS1/LUvh2hge7k2pw==
X-Google-Smtp-Source: ABdhPJxrKjutd4WGx5j5BYryIufBgqCfi+owCQzpGgyAM2oQP58FDlI26VRqE+2qFGV4IRSp83bPTg==
X-Received: by 2002:a17:906:5641:: with SMTP id v1mr19942107ejr.357.1636094015861;
        Thu, 04 Nov 2021 23:33:35 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v6 5/7] xen/arm: do not map IRQs and memory for disabled devices
Date: Fri,  5 Nov 2021 08:33:24 +0200
Message-Id: <20211105063326.939843-6-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105063326.939843-1-andr2000@gmail.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Currently Xen maps all IRQs and memory ranges for all devices except
those marked for passthrough, e.g. it doesn't pay attention to the
"status" property of the node.

According to the device tree specification [1]:
 - "okay"     Indicates the device is operational.
 - "disabled" Indicates that the device is not presently operational,
              but it might become operational in the future (for example,
	      something is not plugged in, or switched off).
	      Refer to the device binding for details on what disabled means
	      for a given device.

So, "disabled" status is device dependent and mapping should be taken by
case-by-case approach with that respect. Although in general Xen should map
IRQs and memory ranges as the disabled devices might become operational it
makes it impossible for the other devices, which are not operational in
any case, to skip the mappings.

This patch disables mapping for the devices with status = "disabled".

[1] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.3/devicetree-specification-v0.3.pdf

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
New in v6
---
 xen/arch/arm/domain_build.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index c7d992456ca7..d3a4c0a173b8 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1837,7 +1837,8 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
     unsigned int i;
     int res;
     u64 addr, size;
-    bool own_device = !dt_device_for_passthrough(dev);
+    bool own_device = !dt_device_for_passthrough(dev) &&
+                      dt_device_is_available(dev);
     /*
      * For PCI passthrough we only need to remap to Dom0 the interrupts
      * and memory ranges from "reg" property which cover controller's
-- 
2.25.1


