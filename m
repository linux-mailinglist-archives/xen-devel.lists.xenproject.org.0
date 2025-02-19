Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A68EA3B83C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 10:22:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892519.1301497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkgHu-0000UO-1p; Wed, 19 Feb 2025 09:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892519.1301497; Wed, 19 Feb 2025 09:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkgHt-0000Se-U3; Wed, 19 Feb 2025 09:22:37 +0000
Received: by outflank-mailman (input) for mailman id 892519;
 Wed, 19 Feb 2025 09:22:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQLC=VK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tkgHs-0000F4-UX
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 09:22:36 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b991080-eea3-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 10:22:32 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-21c2f1b610dso164346425ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 01:22:32 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d545d621sm100543165ad.136.2025.02.19.01.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 01:22:30 -0800 (PST)
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
X-Inumbo-ID: 0b991080-eea3-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739956951; x=1740561751; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjpV/rOsBTZhvMzmuINLNFZE/6rbEow5DAVU2rYU1PQ=;
        b=XEnyaCUfIjFXll9bREoZGqfc4z9/J7rgCRy454ENM6JpQTlrvF3okEDKQAgZSVqv+S
         psYHHMLV/miaJ+YwNM9iypsvkxhL3mEcwpM0T/dOfWAxSy+TjzgqWRxoC50z4SG8QL72
         1m5BQEi1RKKlqcYq2l2zvUvnAl7eB442M6m8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739956951; x=1740561751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjpV/rOsBTZhvMzmuINLNFZE/6rbEow5DAVU2rYU1PQ=;
        b=RmITKc0LiI9e/FU/SzUUxNNI5TKEBt7BHcF7NHlr2JT/yCtTP2IEk+yljA2mO15xl/
         bmXf4pUJpH2QATBsG24UUGdFyZkoSauqPrQfdOelALE6OLroRpUsLeMTjLbUluHerENT
         ZA+I9fHzO5a2ZMlvZgOvHRiIGAYinHOgsI6L99ps74/K1OWZhhxk2CXHrqCeZnP7ZkQ8
         azFiXFrGE53Z/MTD8o+7HrqevasGXZRl2/R98bFFwsB4B1wGpVE74/BJXHFLbPyZ66n8
         4+7GJH7yB0+1FBawub9JuwmZ3ZorAn+8ztTMz6xZUSPf13TECpujcjvNmzwqRTd7dbkn
         glCg==
X-Forwarded-Encrypted: i=1; AJvYcCXmP74j4w9nq0UshI8zgPHGy1bOhwfg75wYnvbLM87SOE7CTJse5xvY7IzgkOIXNevUeQPkBShnolk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwByYsLaiTcoaterswnKsX+hZiONmfvx3yqsfx7B1hvu2wGQU1t
	Y/j8x/hE4h+lhmVHQg3paosIiFMmMt0iZJvh57ob/2C3N+/hyAulaT5/GcUbsHc=
X-Gm-Gg: ASbGncu6D1hSpitAvSkdYtmQ1E4JO8O+Cq0wZLzZdOojhxXVPjDEsnOlVsaQIlwJc0P
	mJQPP1TO1IrbY8Y4JpMxMS8/OpGKSqbaZSPPkxgQZWaT07i1raO4Cv2Y8CPa0wm6U3mGRJpRh9W
	WZEgKPuQToe4ALvAQEwULb/M63RvYqXQDKV4f3RNl+Yhal66//gc7XjgCdPMpYCN9ID5+5D0D2d
	Y/pkAxsa8UrA346zX7ievlGiM3wz1eLzKRUfEJzdKVmji+kUOv8oflmjYEc921DdPHmCdxMLIDT
	pV6DeDH6FiZPYF5uJjNm
X-Google-Smtp-Source: AGHT+IEJm44nEb0TxcOjkAjrcsD0xsD/CPlwgrhHME8dtzpc5/4Onda8YE7jAeRTGmWr+ZG5phmDmw==
X-Received: by 2002:a17:902:ce87:b0:21f:85ee:f2df with SMTP id d9443c01a7336-22103f16b56mr276089045ad.15.1739956950796;
        Wed, 19 Feb 2025 01:22:30 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v3 2/3] PCI: vmd: Disable MSI remapping bypass under Xen
Date: Wed, 19 Feb 2025 10:20:56 +0100
Message-ID: <20250219092059.90850-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250219092059.90850-1-roger.pau@citrix.com>
References: <20250219092059.90850-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MSI remapping bypass (directly configuring MSI entries for devices on the
VMD bus) won't work under Xen, as Xen is not aware of devices in such bus,
and hence cannot configure the entries using the pIRQ interface in the PV
case, and in the PVH case traps won't be setup for MSI entries for such
devices.

Until Xen is aware of devices in the VMD bus prevent the
VMD_FEAT_CAN_BYPASS_MSI_REMAP capability from being used when running as
any kind of Xen guest.

The MSI remapping bypass is an optional feature of VMD bridges, and hence
when running under Xen it will be masked and devices will be forced to
redirect its interrupts from the VMD bridge.  That mode of operation must
always be supported by VMD bridges and works when Xen is not aware of
devices behind the VMD bridge.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Adjust patch subject.
 - Adjust code comment.

Changes since v1:
 - Add xen header.
 - Expand comment.
---
 drivers/pci/controller/vmd.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
index 9d9596947350..e619accca49d 100644
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -17,6 +17,8 @@
 #include <linux/rculist.h>
 #include <linux/rcupdate.h>
 
+#include <xen/xen.h>
+
 #include <asm/irqdomain.h>
 
 #define VMD_CFGBAR	0
@@ -970,6 +972,24 @@ static int vmd_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	struct vmd_dev *vmd;
 	int err;
 
+	if (xen_domain()) {
+		/*
+		 * Xen doesn't have knowledge about devices in the VMD bus
+		 * because the config space of devices behind the VMD bridge is
+		 * not known to Xen, and hence Xen cannot discover or configure
+		 * them in any way.
+		 *
+		 * Bypass of MSI remapping won't work in that case as direct
+		 * write by Linux to the MSI entries won't result in functional
+		 * interrupts, as Xen is the entity that manages the host
+		 * interrupt controller and must configure interrupts.  However
+		 * multiplexing of interrupts by the VMD bridge will work under
+		 * Xen, so force the usage of that mode which must always be
+		 * supported by VMD bridges.
+		 */
+		features &= ~VMD_FEAT_CAN_BYPASS_MSI_REMAP;
+	}
+
 	if (resource_size(&dev->resource[VMD_CFGBAR]) < (1 << 20))
 		return -ENOMEM;
 
-- 
2.46.0


