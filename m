Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA673B3361
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 18:02:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146939.270567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwRnj-00075v-Fl; Thu, 24 Jun 2021 16:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146939.270567; Thu, 24 Jun 2021 16:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwRnj-0006yq-BY; Thu, 24 Jun 2021 16:01:59 +0000
Received: by outflank-mailman (input) for mailman id 146939;
 Thu, 24 Jun 2021 16:01:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a5fo=LS=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lwRjg-0002ED-63
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 15:57:48 +0000
Received: from mail-pj1-x1036.google.com (unknown [2607:f8b0:4864:20::1036])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 202d8dac-cb63-4540-813e-498207b93e04;
 Thu, 24 Jun 2021 15:57:19 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso3751583pjb.4
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jun 2021 08:57:19 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:165a:99ec:42d5:d8b])
 by smtp.gmail.com with UTF8SMTPSA id s4sm2950901pjn.31.2021.06.24.08.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 08:57:18 -0700 (PDT)
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
X-Inumbo-ID: 202d8dac-cb63-4540-813e-498207b93e04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YPdZA059qJtBhHo92L+QtxB+I/HHPOi+M+A9tEqXqKY=;
        b=PjlqqBPlZ7HlVzWQ/NG7jUEmdRoSGdDyyhsicywtHJWmlQpajkDrqtejX1sn/5F2sS
         SwwO3EzEcXtbM4jLQSoe8mUbP22ohS6knOWK2YU5Q+OvqR8ORZOMLvrptba985Ay6g72
         468Ys8fEwAI9IAi2Nx5OeG0lVcTQ7r4EAMUuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YPdZA059qJtBhHo92L+QtxB+I/HHPOi+M+A9tEqXqKY=;
        b=R7wc6MgtOu2zi9CbtnXIUU1rxSOs2rcYKFkLA+wm4lBI3W5mlFHyXZgYSQU3f9C9FD
         4EtXErdRL+ixPBltXfk0ftV20tok8xfENNWQv5fH5liIhqaDrqM0ZVsXP+hSll4B5+lr
         kGwwG0b23qzmBu2j2WhaiXCdEGqOhXRedv54GqCgvJDiplYKTQp7PfKPY6IlVeDq5UBN
         5UjMy/uiCB9TcCpsl79M2PkW0y931RerioovIVMaXeWxtdNrCFrxuM0VVSanp6oAHr9g
         1EAsPOUm9ij33dgLst8u/mu7rDUUOSYnhe+XOiJzc/yIf0LtvoOfysm2c9FHxPgjWjo1
         40fw==
X-Gm-Message-State: AOAM530zE3hpnT9barK27/Ckfiz87/NlfFpX0CMjdLLE2p4IEsAAhm+Y
	8JZCMVlCaO312CWeZuCmNFzFHA==
X-Google-Smtp-Source: ABdhPJxRwzuvR6w9vPa8M+gkJy/ziAGvgsthCKYRNma8WFuVe3INiwBpDz8jqeLqK9XJyVskEplkvw==
X-Received: by 2002:a17:90b:1d06:: with SMTP id on6mr5855940pjb.149.1624550238780;
        Thu, 24 Jun 2021 08:57:18 -0700 (PDT)
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
	thomas.hellstrom@linux.intel.com,
	thomas.lendacky@amd.com,
	quic_qiancai@quicinc.com
Subject: [PATCH v15 11/12] dt-bindings: of: Add restricted DMA pool
Date: Thu, 24 Jun 2021 23:55:25 +0800
Message-Id: <20210624155526.2775863-12-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210624155526.2775863-1-tientzu@chromium.org>
References: <20210624155526.2775863-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the new compatible string, restricted-dma-pool, for restricted
DMA. One can specify the address and length of the restricted DMA memory
region by restricted-dma-pool in the reserved-memory node.

Signed-off-by: Claire Chang <tientzu@chromium.org>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Will Deacon <will@kernel.org>
---
 .../reserved-memory/reserved-memory.txt       | 36 +++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
index e8d3096d922c..39b5f4c5a511 100644
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
+		memory-region = <&restricted_dma_reserved>;
+		/* ... */
+	};
 };
-- 
2.32.0.288.g62a8d224e6-goog


