Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ABF3A7FFC
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 15:32:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142076.262333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt9Ab-0005jB-Sp; Tue, 15 Jun 2021 13:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142076.262333; Tue, 15 Jun 2021 13:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt9Ab-0005em-Mo; Tue, 15 Jun 2021 13:31:57 +0000
Received: by outflank-mailman (input) for mailman id 142076;
 Tue, 15 Jun 2021 13:31:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=62sT=LJ=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lt98O-0000bS-PH
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 13:29:40 +0000
Received: from mail-pj1-x102a.google.com (unknown [2607:f8b0:4864:20::102a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a923bd6-c1a6-4d10-a60f-47eb06fa6abb;
 Tue, 15 Jun 2021 13:29:00 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id g24so11780066pji.4
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jun 2021 06:29:00 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:1846:5274:e444:139e])
 by smtp.gmail.com with UTF8SMTPSA id y205sm15379907pfb.53.2021.06.15.06.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 06:28:59 -0700 (PDT)
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
X-Inumbo-ID: 3a923bd6-c1a6-4d10-a60f-47eb06fa6abb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GymVnULBeJ03m5EPo7c7VEX7DSqoBwMT6L2fMWoeeEc=;
        b=WOU8IVzg+iYvk6N5b67KD5CKh5Wgn355zu5PCMe6mPVyyUQjES9RmEtfXkhuQMaXmA
         hHjDKIazD9xu9BtywBAgsYVdsMG3DqbHBxwCuAdZqvctaQSD9keTHyqXNfZ2Km99muyW
         YJc+kW7TLNcpm9kWU0l/wPI+emgUC6NSvuBJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GymVnULBeJ03m5EPo7c7VEX7DSqoBwMT6L2fMWoeeEc=;
        b=fDFB/OtSWGheeEYv48Cd2meyG0HKuGXoqG6Jyvqb4DitAM7GvL6/84M9Twv6q6FHDB
         0KIbBcRRDjwa7WIICMcKelt4IKW5kTmcB0o12KwVD1sXOghqtpr+FayYNsygF+TXN2v1
         ILCXP6OmbTmeLLOOp5hWdHP/cDGh70qpI3j8bhzJQdEHMIdbcGoZn1NOUBaEjOWt4Qj5
         ZESiy24qkbR/JL/bQr7P2UGpksTVENFQMXJlSmBBgKMr0UfDF4qKJk2LOH1Iaq9NGQxG
         vmxbzpucLE4yct+6SvmaxSACQneXg5jMQE1ar/z2iI8FPkG/R+CcWMfIbMTr73utVUuN
         Vhbw==
X-Gm-Message-State: AOAM53030CDENpt8PNcP+ksgkj1w6m4mWFjbgSodXIyDNxy6vWeKBp/o
	OrCQytzURfy2OKigXqgBO/fkZg==
X-Google-Smtp-Source: ABdhPJwFBj2pKeWU+1SEbsBI+u3Jw3SyjbFfiN066dPovK3+ci3+q1oZRASaC88XjKL/ShDd5jcc2w==
X-Received: by 2002:a17:90a:a116:: with SMTP id s22mr24962655pjp.218.1623763739540;
        Tue, 15 Jun 2021 06:28:59 -0700 (PDT)
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
Subject: [PATCH v10 11/12] dt-bindings: of: Add restricted DMA pool
Date: Tue, 15 Jun 2021 21:27:10 +0800
Message-Id: <20210615132711.553451-12-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210615132711.553451-1-tientzu@chromium.org>
References: <20210615132711.553451-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the new compatible string, restricted-dma-pool, for restricted
DMA. One can specify the address and length of the restricted DMA memory
region by restricted-dma-pool in the reserved-memory node.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 .../reserved-memory/reserved-memory.txt       | 36 +++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
index e8d3096d922c..46804f24df05 100644
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
@@ -85,10 +102,11 @@ memory-region-names (optional) - a list of names, one for each corresponding
 
 Example
 -------
-This example defines 3 contiguous regions are defined for Linux kernel:
+This example defines 4 contiguous regions for Linux kernel:
 one default of all device drivers (named linux,cma@72000000 and 64MiB in size),
-one dedicated to the framebuffer device (named framebuffer@78000000, 8MiB), and
-one for multimedia processing (named multimedia-memory@77000000, 64MiB).
+one dedicated to the framebuffer device (named framebuffer@78000000, 8MiB),
+one for multimedia processing (named multimedia-memory@77000000, 64MiB), and
+one for restricted dma pool (named restricted_dma_reserved@0x50000000, 64MiB).
 
 / {
 	#address-cells = <1>;
@@ -120,6 +138,11 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
 			compatible = "acme,multimedia-memory";
 			reg = <0x77000000 0x4000000>;
 		};
+
+		restricted_dma_reserved: restricted_dma_reserved {
+			compatible = "restricted-dma-pool";
+			reg = <0x50000000 0x4000000>;
+		};
 	};
 
 	/* ... */
@@ -138,4 +161,11 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
 		memory-region = <&multimedia_reserved>;
 		/* ... */
 	};
+
+	pcie_device: pcie_device@0,0 {
+		reg = <0x83010000 0x0 0x00000000 0x0 0x00100000
+		       0x83010000 0x0 0x00100000 0x0 0x00100000>;
+		memory-region = <&restricted_dma_mem_reserved>;
+		/* ... */
+	};
 };
-- 
2.32.0.272.g935e593368-goog


