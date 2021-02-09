Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2BD3148AB
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 07:23:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83139.154111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MQi-0003Hz-7l; Tue, 09 Feb 2021 06:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83139.154111; Tue, 09 Feb 2021 06:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MQi-0003HF-3V; Tue, 09 Feb 2021 06:23:20 +0000
Received: by outflank-mailman (input) for mailman id 83139;
 Tue, 09 Feb 2021 06:23:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyDg=HL=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1l9MQg-0003Ge-UH
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 06:23:18 +0000
Received: from mail-pf1-x434.google.com (unknown [2607:f8b0:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d39c7deb-f1b9-4f4a-86ee-faa0d136912d;
 Tue, 09 Feb 2021 06:23:18 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id q131so11244161pfq.10
 for <xen-devel@lists.xenproject.org>; Mon, 08 Feb 2021 22:23:18 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id a8sm1160332pjs.40.2021.02.08.22.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:23:16 -0800 (PST)
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
X-Inumbo-ID: d39c7deb-f1b9-4f4a-86ee-faa0d136912d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eRi8Yzf5Y8qG5991xxXPsSC5LTyacs0FIIEghf5qlqE=;
        b=I1pOI9d2uMAOj25XXD6wAuAIs02PiqHn3vYbrTGQfRLUalLAaaWHj4AP66p1gZRw6c
         B3Fs+yS4m4TscPVDCU+jECnoKxyq5OcojOQ3UlsKgJX/2bKZw0g3cUyt8Lb9tyEzB+I7
         d4RC5Ezyz3o4oj5hhy8N+DKnKQ48mOYCkG1WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eRi8Yzf5Y8qG5991xxXPsSC5LTyacs0FIIEghf5qlqE=;
        b=YGeVkwiyi/hMIWbhrBxfc/HSto4FqmnAkeJzXlNIajKTfcQUJcsI6Te5eN2zP4vfb+
         cEB6U4QCYfjqjUMLDNBppzdC6FAlnpFjlNPmF6Rov12s9N61trtvqOzKoO+RfrsMM/ZC
         2h1RHsbHUBnII/YX7brG7tgtowuXpr2lu/X7eBIuD1kZ+2byTIYWdS5/wUEbzEdK4oCv
         7A8qOA2m3kXzIV2tWvlu+V63Gt1rWqGfTvrqc5X5hOlwFYs2AzrBK6tGY8JHY/KNQFrW
         H4DFNOV9KoonQWg6YSecCw2x7B7JgXfYTzSJ4eZ/sF2wYRKM7eMvOLtTfYMcb9mDV3aF
         /gNA==
X-Gm-Message-State: AOAM533VDtqziwmTUMOH+kczEh6R8xBFjnRyeUjWV/3bf643q0Uh0uEl
	bdSk+B+Ws7eh+aQ2MRbFFOb6SQ==
X-Google-Smtp-Source: ABdhPJxkt3Ed7T7cJDKzmZe4wszjCxFAf1leiOQT2ICOasIg3V/FKQTBEDaG8y6oYK6K58aSdM216A==
X-Received: by 2002:a05:6a00:a8d:b029:1ba:71d1:fe3c with SMTP id b13-20020a056a000a8db02901ba71d1fe3cmr21262398pfl.51.1612851797444;
        Mon, 08 Feb 2021 22:23:17 -0800 (PST)
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
	Claire Chang <tientzu@chromium.org>
Subject: [PATCH v4 13/14] dt-bindings: of: Add restricted DMA pool
Date: Tue,  9 Feb 2021 14:21:30 +0800
Message-Id: <20210209062131.2300005-14-tientzu@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
In-Reply-To: <20210209062131.2300005-1-tientzu@chromium.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the new compatible string, restricted-dma-pool, for restricted
DMA. One can specify the address and length of the restricted DMA memory
region by restricted-dma-pool in the reserved-memory node.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 .../reserved-memory/reserved-memory.txt       | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
index e8d3096d922c..fc9a12c2f679 100644
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
@@ -51,6 +51,20 @@ compatible (optional) - standard definition
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
+          the memory access, e.g., MPU.
         - vendor specific string in the form <vendor>,[<device>-]<usage>
 no-map (optional) - empty property
     - Indicates the operating system must not create a virtual mapping
@@ -120,6 +134,11 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
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
@@ -138,4 +157,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
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
2.30.0.478.g8a0d178c01-goog


