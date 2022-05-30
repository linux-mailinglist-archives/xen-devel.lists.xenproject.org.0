Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE843538868
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 23:01:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338748.563607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvmV8-0008Uv-Sv; Mon, 30 May 2022 21:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338748.563607; Mon, 30 May 2022 21:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvmV8-0008Jy-IL; Mon, 30 May 2022 21:00:34 +0000
Received: by outflank-mailman (input) for mailman id 338748;
 Mon, 30 May 2022 21:00:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pxv1=WG=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nvmV6-0007Ks-Ip
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 21:00:32 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8adee398-e05b-11ec-bd2c-47488cf2e6aa;
 Mon, 30 May 2022 23:00:31 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id 5so4109011lju.10
 for <xen-devel@lists.xenproject.org>; Mon, 30 May 2022 14:00:31 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a2ea275000000b0025550e2693asm581541ljm.38.2022.05.30.14.00.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 May 2022 14:00:30 -0700 (PDT)
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
X-Inumbo-ID: 8adee398-e05b-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+FJSf1vwMYB6K1+IygWHYLgdHKsQ/Ri86qwFQ7er7r4=;
        b=qQaEnEqIn8+KVCu3pPRo+BDQrdzTpsLMqbypvWjSdP/zBsAUHoF+Gerr5XT7DNRZW1
         0bpkwfkPu1hMKNckTJkbfqyHKTvvxPuLi2IZmXv8DMFMNKXEOakkweh7lNNBTtPOBInP
         RK0XWq87slLWTrLyJGGcQJqd8OW+B3LmN9XSCB6PL+8FmxkWI4gWNWUhuz5hn/0OLywc
         FmS2FjqsGyViA9Q3hUbKnJx84AOsuqZKFmqJuUPb+jKs+WQqtD/joiFjLBoJ8UGFL5xq
         t9Y57ac2D/yaMy2ErqyyoxRbxwDkBaU13uHKzvKFZmAcaFPptLb+oQOVf2CD+OnQqqDE
         qNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+FJSf1vwMYB6K1+IygWHYLgdHKsQ/Ri86qwFQ7er7r4=;
        b=c4g6Ih0YxDA5gCZ5C1V9JOf4wdMUapS8pQ0CpEjDRrfxArWTZC6UMCDKWGh+5LXUqR
         mC7/sWLk6eUlJ6De4zH/+3sZjFMV9E2J11TLBgPGjlVYxdxX00fg6e7btPdP6SQlHLl3
         5RtXpjt9RPGrP2YfTfKy0QoaBVVUHymX6JQm80Jvz3QM0Tjur7rnwTtD7E7MQ1ILJJB0
         5yZ2wXdUWaYAe4qUaIO4J0VJnXw7cKRpOQVxUSE/E+2zLMmXOcRgHY5Qq+Ei+aMp8pnb
         nLC77Dy26mIkdLa+MSU1I9svHu+wDkrmo0ncBuOz//c1cY7pFrjg9djcGd+98089u6W1
         pccA==
X-Gm-Message-State: AOAM533Nd+5YsCPcyrAFpjVJKWEl3WNg2pS2cJBAee6ONsRZcKJeqxzg
	YnB7X8rnW0HZ5CeTu++c8wE1FS+PdLQ=
X-Google-Smtp-Source: ABdhPJy1j0CZ8u38C6o5Ly2O9aBU8Z/J0PR4IPWipSyv2hmVKkIJPggqQZ4sM6kw/XDqJU3SD8VYcQ==
X-Received: by 2002:a2e:a36f:0:b0:253:d948:731c with SMTP id i15-20020a2ea36f000000b00253d948731cmr32005387ljn.159.1653944431239;
        Mon, 30 May 2022 14:00:31 -0700 (PDT)
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
Subject: [PATCH V3 5/8] dt-bindings: Add xen,grant-dma IOMMU description for xen-grant DMA ops
Date: Tue, 31 May 2022 00:00:14 +0300
Message-Id: <1653944417-17168-6-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1653944417-17168-1-git-send-email-olekstysh@gmail.com>
References: <1653944417-17168-1-git-send-email-olekstysh@gmail.com>

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
---
 .../devicetree/bindings/iommu/xen,grant-dma.yaml   | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml

diff --git a/Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml b/Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
new file mode 100644
index 00000000..ab5765c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
@@ -0,0 +1,49 @@
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
+  The reference to Xen specific IOMMU node using "iommus" property indicates
+  that Xen grant mappings need to be enabled for the device, and it specifies
+  the ID of the domain where the corresponding backend resides.
+  The binding is required to restrict memory access using Xen grant mappings.
+
+properties:
+  compatible:
+    const: xen,grant-dma
+
+  '#iommu-cells':
+    const: 1
+    description:
+      Xen specific IOMMU is multiple-master IOMMU device.
+      The single cell describes the domid (domain ID) of the domain where
+      the backend is running.
+
+required:
+  - compatible
+  - "#iommu-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    xen_iommu {
+        compatible = "xen,grant-dma";
+        #iommu-cells = <1>;
+    };
+
+    virtio@3000 {
+        compatible = "virtio,mmio";
+        reg = <0x3000 0x100>;
+        interrupts = <41>;
+
+        /* The backend is located in Xen domain with ID 1 */
+        iommus = <&xen_iommu 1>;
+    };
-- 
2.7.4


