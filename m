Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 155BD2EB98E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 06:43:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62306.110354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx1bF-0001Cm-17; Wed, 06 Jan 2021 05:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62306.110354; Wed, 06 Jan 2021 05:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx1bE-0001BI-Mi; Wed, 06 Jan 2021 05:43:12 +0000
Received: by outflank-mailman (input) for mailman id 62306;
 Wed, 06 Jan 2021 03:42:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBi8=GJ=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1kwzi7-0005he-3a
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 03:42:11 +0000
Received: from mail-pl1-x632.google.com (unknown [2607:f8b0:4864:20::632])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b505af66-e4ae-4d63-a98a-e23d4e1b6bb8;
 Wed, 06 Jan 2021 03:42:10 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id e2so862388plt.12
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jan 2021 19:42:10 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:3e52:82ff:fe5e:cc9d])
 by smtp.gmail.com with ESMTPSA id f7sm581725pjs.25.2021.01.05.19.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 19:42:09 -0800 (PST)
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
X-Inumbo-ID: b505af66-e4ae-4d63-a98a-e23d4e1b6bb8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FZGRSIKNWZAaAhyn9I46mv2qEvPmwpxpVmXsznFggAw=;
        b=gGxBXOihHsm3ZVDHLv31fDSdj1SXhYQbdn9k5cmAoncGt12QQUfM/c3IHcaEnDkA5J
         ocQxp+U8gmPg/aUt1mhhV6zZJ8VXZG4qoywct4SKLATrpd2CnwkRGzp6iVjwWvWh4uPB
         8z3i8pIB+5J9HuYE/Sxl8iNS0nIPHFjKwJX1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FZGRSIKNWZAaAhyn9I46mv2qEvPmwpxpVmXsznFggAw=;
        b=PxIIMV7mvAGib28GROplbU9zOmNqgVJNWB4KrGiSEmmvqaxJr9Wc55JIePDtR//9W9
         wLCo7HHIoVdiH8RiMFr+WIqGURNEH5AhJOULUj00ZUmONwe5+z0QJVlbFLwH1wzoM7dK
         zHLxksbYOPDdzrgi0irw+fFtSbor/7uHFUZVghgaCpKViu6A6jopZqJTgs7pAA0Ujfn/
         Fgypd7UlAKSimtb1n9RaGbe6vkY8WOeXzeUID21J9eSA8h4MowyigNVfdb+1Kig0z5Sl
         /WijGUFEHI5LZ7jUgnKpPn2HiyEhiHbDZKhroI6ZSu++ADPtnnYcEnGE6vG+GrjfYksF
         g6MQ==
X-Gm-Message-State: AOAM530EbNUxqif5zJaxUL3IGs4ywLN3FhWpIWamcdGrolLhHiPsBOLp
	jtotZ3GZX5OQbIRK59vUSbQgQQ==
X-Google-Smtp-Source: ABdhPJz3c69cs7bN5kIpvTYTxsM3wMIyOYfyNKD7ypyEM9IFVwp2OokHNuXw3jIYJjMTgHoQH4pU0Q==
X-Received: by 2002:a17:90a:5802:: with SMTP id h2mr2368082pji.68.1609904529594;
        Tue, 05 Jan 2021 19:42:09 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: robh+dt@kernel.org,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	joro@8bytes.org,
	will@kernel.org,
	frowand.list@gmail.com,
	konrad.wilk@oracle.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Cc: grant.likely@arm.com,
	xypron.glpk@gmx.de,
	treding@nvidia.com,
	mingo@kernel.org,
	bauerman@linux.ibm.com,
	peterz@infradead.org,
	gregkh@linuxfoundation.org,
	saravanak@google.com,
	rafael.j.wysocki@intel.com,
	heikki.krogerus@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	rdunlap@infradead.org,
	dan.j.williams@intel.com,
	bgolaszewski@baylibre.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	tfiga@chromium.org,
	drinkcat@chromium.org,
	Claire Chang <tientzu@chromium.org>
Subject: [RFC PATCH v3 5/6] dt-bindings: of: Add restricted DMA pool
Date: Wed,  6 Jan 2021 11:41:23 +0800
Message-Id: <20210106034124.30560-6-tientzu@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210106034124.30560-1-tientzu@chromium.org>
References: <20210106034124.30560-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the new compatible string, restricted-dma-pool, for restricted
DMA. One can specify the address and length of the restricted DMA memory
region by restricted-dma-pool in the device tree.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 .../reserved-memory/reserved-memory.txt       | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
index e8d3096d922c..44975e2a1fd2 100644
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
+          system memory corruption, the system needs to provide way to restrict
+          the DMA to a predefined memory region.
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
2.29.2.729.g45daf8777d-goog


