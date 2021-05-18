Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A613387273
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 08:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128785.241779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litT2-00017Q-Q7; Tue, 18 May 2021 06:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128785.241779; Tue, 18 May 2021 06:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litT2-00013h-M6; Tue, 18 May 2021 06:44:36 +0000
Received: by outflank-mailman (input) for mailman id 128785;
 Tue, 18 May 2021 06:44:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ/V=KN=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1litT1-00010x-6V
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 06:44:35 +0000
Received: from mail-pf1-x429.google.com (unknown [2607:f8b0:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4aa19155-2cc3-42ae-b28e-ed07ba814704;
 Tue, 18 May 2021 06:44:34 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id x188so6684903pfd.7
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 23:44:34 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:f284:b819:54ca:c198])
 by smtp.gmail.com with UTF8SMTPSA id t22sm4382996pfl.50.2021.05.17.23.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 23:44:33 -0700 (PDT)
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
X-Inumbo-ID: 4aa19155-2cc3-42ae-b28e-ed07ba814704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CTSTD7WHMjQLnf+yB2P/0oEkEOIVo79nGE1UI2KUH0Q=;
        b=nAAUAjIfoQT+ak6LjVaVetBSUMNnB6n7A11MZcPIr+b55pauAURqTYLKnD47uanmZJ
         3cJyu/W7zXu7vcXxot+z5bCjTjNShkL3mMnRTemIfV7uSqDhggL5tXTfLRj2IiU5yZER
         EMx5ceT6GrGiYCMKZLVA9T2R6o8FKbKEjkXrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CTSTD7WHMjQLnf+yB2P/0oEkEOIVo79nGE1UI2KUH0Q=;
        b=U3C+XbuKbb2vQfnHOImCv7VVCN2OD+59OxnWq7AQqfIirvWGT3Y+xI2s3ZHAurkhOK
         Alf1QCAa3odyDLY7vUYLKf6I39eRy4fReS8qyWFVDcyCLWFt4YHkN0hkgqK06CVl09kw
         hOGk97Tb5qQckKNNo8yT9rPdHEpMsDJNql+L1nFg5NrkudZEuLpboCfzPVb3lq9DAT0V
         /niTbwMvJlw+bjVxPMYabLxXeYZZxOHh0JyzlSrBpz2FYOPVdkf1aNVZ8G2vVm56unGi
         2ZuI2WHW16vOZ/2Pa5YkaqCTbW4OT3Fy3dV3eRWGDFpQYsGwJxj38H+AZQY/IWB9ytOb
         Y2Pw==
X-Gm-Message-State: AOAM5316GTgHBB9p1rWJE1J+lSSVR8hk95ek50qe1Fs34+bqmx/q/WDa
	MrQz5IQjhMhGhTFTADmhkQDfLw==
X-Google-Smtp-Source: ABdhPJw36g57cjbl14iJOGlbcydmr3R8efhe81FZmLfhunRUCZecqFNQ71U0gUeZm0dYMjJhBmkTmQ==
X-Received: by 2002:aa7:8e0d:0:b029:214:a511:d88b with SMTP id c13-20020aa78e0d0000b0290214a511d88bmr3600961pfr.2.1621320273735;
        Mon, 17 May 2021 23:44:33 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org,
	paulus@samba.org,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	sstabellini@kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	grant.likely@arm.com,
	xypron.glpk@gmx.de,
	Thierry Reding <treding@nvidia.com>,
	mingo@kernel.org,
	bauerman@linux.ibm.com,
	peterz@infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	heikki.krogerus@linux.intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	tfiga@chromium.org,
	bskeggs@redhat.com,
	bhelgaas@google.com,
	chris@chris-wilson.co.uk,
	tientzu@chromium.org,
	daniel@ffwll.ch,
	airlied@linux.ie,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com,
	jxgao@google.com,
	joonas.lahtinen@linux.intel.com,
	linux-pci@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	matthew.auld@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v7 14/15] dt-bindings: of: Add restricted DMA pool
Date: Tue, 18 May 2021 14:42:14 +0800
Message-Id: <20210518064215.2856977-15-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210518064215.2856977-1-tientzu@chromium.org>
References: <20210518064215.2856977-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the new compatible string, restricted-dma-pool, for restricted
DMA. One can specify the address and length of the restricted DMA memory
region by restricted-dma-pool in the reserved-memory node.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 .../reserved-memory/reserved-memory.txt       | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
index e8d3096d922c..284aea659015 100644
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
@@ -51,6 +51,23 @@ compatible (optional) - standard definition
           used as a shared pool of DMA buffers for a set of devices. It can
           be used by an operating system to instantiate the necessary pool
           management subsystem if necessary.
+        - restricted-dma-pool: This indicates a region of memory meant to be
+          used as a pool of restricted DMA buffers for a set of devices. The
+          memory region would be the only region accessible to those devices.
+          When using this, the no-map and reusable properties must not be set,
+          so the operating system can create a virtual mapping that will be used
+          for synchronization. The main purpose for restricted DMA is to
+          mitigate the lack of DMA access control on systems without an IOMMU,
+          which could result in the DMA accessing the system memory at
+          unexpected times and/or unexpected addresses, possibly leading to data
+          leakage or corruption. The feature on its own provides a basic level
+          of protection against the DMA overwriting buffer contents at
+          unexpected times. However, to protect against general data leakage and
+          system memory corruption, the system needs to provide way to lock down
+          the memory access, e.g., MPU. Note that since coherent allocation
+          needs remapping, one must set up another device coherent pool by
+          shared-dma-pool and use dma_alloc_from_dev_coherent instead for atomic
+          coherent allocation.
         - vendor specific string in the form <vendor>,[<device>-]<usage>
 no-map (optional) - empty property
     - Indicates the operating system must not create a virtual mapping
@@ -120,6 +137,11 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
 			compatible = "acme,multimedia-memory";
 			reg = <0x77000000 0x4000000>;
 		};
+
+		restricted_dma_mem_reserved: restricted_dma_mem_reserved {
+			compatible = "restricted-dma-pool";
+			reg = <0x50000000 0x400000>;
+		};
 	};
 
 	/* ... */
@@ -138,4 +160,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
 		memory-region = <&multimedia_reserved>;
 		/* ... */
 	};
+
+	pcie_device: pcie_device@0,0 {
+		memory-region = <&restricted_dma_mem_reserved>;
+		/* ... */
+	};
 };
-- 
2.31.1.751.gd2f1c929bd-goog


