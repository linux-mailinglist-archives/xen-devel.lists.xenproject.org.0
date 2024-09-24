Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F00984993
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:27:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803139.1213582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8NH-0001G5-2V; Tue, 24 Sep 2024 16:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803139.1213582; Tue, 24 Sep 2024 16:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8NG-0001Dy-VF; Tue, 24 Sep 2024 16:26:50 +0000
Received: by outflank-mailman (input) for mailman id 803139;
 Tue, 24 Sep 2024 16:26:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5PF=QW=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1st8LK-0005nz-MG
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:24:50 +0000
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [2607:f8b0:4864:20::b2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83bfcb5a-7a91-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 18:24:47 +0200 (CEST)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e02c4983bfaso5148974276.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 09:24:47 -0700 (PDT)
Received: from gmail.com ([168.243.189.171]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-505a9efb4a3sm1023237e0c.3.2024.09.24.09.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 09:24:45 -0700 (PDT)
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
X-Inumbo-ID: 83bfcb5a-7a91-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727195085; x=1727799885; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLI4kKkgQKzQsFANk7z1TUU4nn0G0MAxu+0mTyaXmA8=;
        b=XrZn8pxFj/bTqPZk72wgMp6TvsE3r0zT/QoI/IG+ggrJEY0MSXaLLriF4/9vAxX6Qc
         YDqbikn7E5iYyOfJW5FKajz2Sl5K7N6oKzFFO7BemlxmsdrQ9D/DzhSW5slMTZe0M20i
         IZScQ2BcD0dKhb8M9SwD5/YPR4rqDh+jb/ncdiKYVQ6IGlt7Htpp9xfsQXsx+hNLA6GD
         hanvZRfOpxlJrBvrSEjasqlfEDn1+fzFZ8xr/hwg0rspVFU1/VTAMPHJH1KHOTSzWj5t
         A0HHCq7mnummuVYS4kelF+ga/pNZqZIfkNfHx1Hy8WwjpQViDGPIxHY0/uppV25+Fq+m
         RGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727195085; x=1727799885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLI4kKkgQKzQsFANk7z1TUU4nn0G0MAxu+0mTyaXmA8=;
        b=Sbps4xGhoelGpCq8dA8aboUTwWqsV2B2HhpRisZC5Qq4/rPDPqHrs9beEp58ouv8o1
         a9BVkMKCE0BzaiHdKM4L8H3wyU8gLoau4yGPmBOkTUQ19+bDiAWOVqgRYVOUsEMsnEO5
         NtBouRvPRyt/e4qAqoaLNXRph6UCbOArnmneHzoSjKay3sKGxtYyvuHnfbuGJ6ybT06x
         FPJA+rOVnCVZuswr402DSUx5aR+LSmmqe0GFbRQ4oOt79TfviWGZdDAApPJa9sgC5eIj
         PMZIMNyBN0x0yZAKpKPCuJYxvC73tnqxwdEO4fxvNjtUcZNGbzY80qCPW3TZI9GqGiEY
         6LDw==
X-Gm-Message-State: AOJu0YzVEPXSlLRsUyB5m94rvSOVBHWQ/oCJKrQmUZYLS6k9O5Z88e4L
	MkzOU2LjxkaQPZ9K/+30+nBv97IIAVn5LHhQ98HMIaLXLMvAugDW6AVtZO8o
X-Google-Smtp-Source: AGHT+IEYLv6/HzhBlE9NW/AuH+xm6fvDwlR+mdLkGxpus9cOgrYa/DTirHn+Hjd+Cm6b8Ug3fPZB6g==
X-Received: by 2002:a25:d856:0:b0:e22:5db2:a947 with SMTP id 3f1490d57ef6-e225db2aa8emr7938369276.34.1727195085555;
        Tue, 24 Sep 2024 09:24:45 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	dpsmith@apertussolutions.com,
	edgar.iglesias@amd.com
Subject: [PATCH v1 6/6] xen/arm: dom0less: Add a background PCI ECAM mmio region
Date: Tue, 24 Sep 2024 18:23:59 +0200
Message-ID: <20240924162359.1390487-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add a background PCI ECAM mmio region always reading as all ones.
This indicates to the OS that there are no PCI devices on the bus.
Once the device-model's IOREQ client connects, the OS can rescan
the bus and find PV and emulated devices.

This avoids a race where domU's come up before the device models,
causing domU to crash into a data-abort when accessing ECAM.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/arch/arm/dom0less-build.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index dab24fa9e2..bc5285e7fa 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -1015,6 +1015,16 @@ static int __init construct_domU(struct domain *d,
             kinfo.virtio_pci.mem.base = GUEST_VIRTIO_PCI_MEM_BASE;
             kinfo.virtio_pci.pf_mem.base = GUEST_VIRTIO_PCI_PREFETCH_MEM_BASE;
         }
+
+        /*
+         * Register a background PCI ECAM region returning ~0. This indicates
+         * to the OS that there are no PCI devices on the bus. Once an IOREQ
+         * client connects, the OS can rescan the bus and find devices.
+         */
+        register_mmio_bg_handler(d, true, &mmio_read_const_writes_ignored,
+                                 kinfo.virtio_pci.ecam.base,
+                                 GUEST_VIRTIO_PCI_ECAM_SIZE,
+                                 (void *) ULONG_MAX);
     }
 
     rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
-- 
2.43.0


