Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 815BE53BEAE
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 21:24:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341184.566414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwqQk-00019k-O3; Thu, 02 Jun 2022 19:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341184.566414; Thu, 02 Jun 2022 19:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwqQk-000173-FA; Thu, 02 Jun 2022 19:24:26 +0000
Received: by outflank-mailman (input) for mailman id 341184;
 Thu, 02 Jun 2022 19:24:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2EeJ=WJ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nwqQi-0000dK-6i
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 19:24:24 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9baf920f-e2a9-11ec-bd2c-47488cf2e6aa;
 Thu, 02 Jun 2022 21:24:23 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id y19so11826897ejq.6
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jun 2022 12:24:23 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 eg13-20020a056402288d00b0042dce73168csm2938301edb.13.2022.06.02.12.24.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Jun 2022 12:24:21 -0700 (PDT)
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
X-Inumbo-ID: 9baf920f-e2a9-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JATYvLe48LS2H6IM0secvITvXQRFYJatDO7tIGdxKew=;
        b=VTT0OBaJLQkU0DXmYjkEMy4pAELAV+jBlguhxMn7A/UqRxOPNmS5CHgPtJ8qEHZ37t
         dJchUBQgCQYu0sVoQ3XZJeZMu/D3NfZmgNzNcTSM6d3mQgW/gfiuwtDFZ3C/zopEft70
         53psImCdfXqfPzsfnsJ0x1WX2TilCTwWqqoFx42M3g540JOK5MIBPNJ4HDu3rtPd0NvR
         Q9zPUyeZA5Hv2CYInUh8MlFvL4nmj/eO1LHolt3AXfJI734JjCLw7bSnIYS5ZeZ4TIuR
         W3MaS7EEAi42acDU5NxK7pTxBgmMuOOT0q63i2Wpbh1F/ySWKn407asxBaQC4EJYFYUB
         ZPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JATYvLe48LS2H6IM0secvITvXQRFYJatDO7tIGdxKew=;
        b=sikCSiT7VNwQ2CGBqHKTY68QomlhyeNdB7nsn3XWEiFcCRMzcfqrCLptjtX9iNvJEk
         Kwmj+O/2kH9rgOim7CRPhkIhXu3LrorEW7uM0JmpiNrssZlmODLD1z2Nxk7KmDNq6XY1
         +VTHJMrvX5yGkLsQZq0vEqb+oRVGIfDmlgwn7p2dlSVSF16Jj/q5SZHadUeR2JNZ+uw+
         4m3tbBuOTJBSxgYNP9pitEzY6RaukOTab0xLJww8v5nj+3K94XeeKmS0yZ2dXraKQAwH
         RuY/c4XWT9Hiw1rDH0v171bMW7b0hCtGEUiH94UpePstY3kwQg4HMQ4wOekbr8p3Zo2w
         q7Uw==
X-Gm-Message-State: AOAM5308JzgloSop9IBc8CI4xqlbcvoxkEIVoCSOpT2uiOAogRPAbSsH
	/xYHS/xSUH5JokG1RfkY5izhS91B0mI=
X-Google-Smtp-Source: ABdhPJwiCOLciOxN6TBYEcpArcIF1bwM/jhBDOJnBMmkSZAOupAwiR+Hr2XzW8lOBJHN2sRoLEmt4Q==
X-Received: by 2002:a17:906:8146:b0:6ff:119c:881f with SMTP id z6-20020a170906814600b006ff119c881fmr5659395ejw.38.1654197862292;
        Thu, 02 Jun 2022 12:24:22 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux-foundation.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Rob Herring <robh+dt@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Julien Grall <julien@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH V4 5/8] dt-bindings: Add xen,grant-dma IOMMU description for xen-grant DMA ops
Date: Thu,  2 Jun 2022 22:23:50 +0300
Message-Id: <1654197833-25362-6-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1654197833-25362-1-git-send-email-olekstysh@gmail.com>
References: <1654197833-25362-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The main purpose of this binding is to communicate Xen specific
information using generic IOMMU device tree bindings (which is
a good fit here) rather than introducing a custom property.

Introduce Xen specific IOMMU for the virtualized device (e.g. virtio)
to be used by Xen grant DMA-mapping layer in the subsequent commit.

The reference to Xen specific IOMMU node using "iommus" property
indicates that Xen grant mappings need to be enabled for the device,
and it specifies the ID of the domain where the corresponding backend
resides. The domid (domain ID) is used as an argument to the Xen grant
mapping APIs.

This is needed for the option to restrict memory access using Xen grant
mappings to work which primary goal is to enable using virtio devices
in Xen guests.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes RFC -> V1:
   - update commit subject/description and text in description
   - move to devicetree/bindings/arm/

Changes V1 -> V2:
   - update text in description
   - change the maintainer of the binding
   - fix validation issue
   - reference xen,dev-domid.yaml schema from virtio/mmio.yaml

Change V2 -> V3:
   - Stefano already gave his Reviewed-by, I dropped it due to the changes (significant)
   - use generic IOMMU device tree bindings instead of custom property
     "xen,dev-domid"
   - change commit subject and description, was
     "dt-bindings: Add xen,dev-domid property description for xen-grant DMA ops"

Changes V3 -> V4:
   - add Stefano's R-b
   - remove underscore in iommu node name
   - remove consumer example virtio@3000
   - update text for two descriptions
---
 .../devicetree/bindings/iommu/xen,grant-dma.yaml   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml

diff --git a/Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml b/Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
new file mode 100644
index 00000000..be1539d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/xen,grant-dma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xen specific IOMMU for virtualized devices (e.g. virtio)
+
+maintainers:
+  - Stefano Stabellini <sstabellini@kernel.org>
+
+description:
+  The Xen IOMMU represents the Xen grant table interface. Grant mappings
+  are to be used with devices connected to the Xen IOMMU using the "iommus"
+  property, which also specifies the ID of the backend domain.
+  The binding is required to restrict memory access using Xen grant mappings.
+
+properties:
+  compatible:
+    const: xen,grant-dma
+
+  '#iommu-cells':
+    const: 1
+    description:
+      The single cell is the domid (domain ID) of the domain where the backend
+      is running.
+
+required:
+  - compatible
+  - "#iommu-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    iommu {
+        compatible = "xen,grant-dma";
+        #iommu-cells = <1>;
+    };
-- 
2.7.4


