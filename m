Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CEE50BD95
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 18:51:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311116.528192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhwVE-0007MF-AO; Fri, 22 Apr 2022 16:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311116.528192; Fri, 22 Apr 2022 16:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhwVD-0007It-WC; Fri, 22 Apr 2022 16:51:27 +0000
Received: by outflank-mailman (input) for mailman id 311116;
 Fri, 22 Apr 2022 16:51:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hyV/=VA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nhwVB-0006Cr-RY
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 16:51:25 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 721d1434-c25c-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 18:51:25 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id h27so15021693lfj.13
 for <xen-devel@lists.xenproject.org>; Fri, 22 Apr 2022 09:51:25 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a056512310200b0046e2f507a3asm279742lfb.167.2022.04.22.09.51.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Apr 2022 09:51:23 -0700 (PDT)
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
X-Inumbo-ID: 721d1434-c25c-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=99hspxuLODhQpov2wjpLVe38h5x1eJYakvWm7x8e6iI=;
        b=F23kF0eGH2ZVB+UGEjmW9/zKmFnzoAMLghAwzApvwMCcMhtBG9yJPpY4U1QzTxgJqh
         dlRXZHbEg3zZ7nY0RRV+8fUOu1XkZkXeqKyrW16n02fiZBATqOd2CzVkTaqbBEsKlX+6
         r6aK5PoP5QLM42PK/aLq8s/VUKQChEmq/ezbmXtxZxY1a/RDaoMGUVuns/+Ft+exgVHV
         qbfu1h52HdfRiNt9rNvFnhuiPOsYt6N8H7gak3I0DBjmtU3G2m7PdaKAunzdkWOdWVMV
         ovHh6R/nKxeNIZ67iu83BqdSWGokrQ3h7RK4/vcpMr2+xi4nqmoXe2TQmCa8LS8q13oq
         2CTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=99hspxuLODhQpov2wjpLVe38h5x1eJYakvWm7x8e6iI=;
        b=G1zdLWHuUIT2Jjxw6iBc7++vLZ6JOLTf+DSJHtcohudJTHPqHK371eQVRSoMTXxmQa
         ffkp+YUCx/XJ3AP7s1gpvz9JBeDDFtXSJFZn3pjHtQ+Ewbmdk8bGRkMaLh4xLvrJ2Wc5
         7vVdVJGlK3f2bNbsdt8N30T+STZKxjn0i+SAJ8gApRmoggd7gGjitjeeOxc164y7Eder
         6z7uKxrdrOub8TaVbwHEoxwPxHkMF99TBSJLWXJrhqt6Qx/94IsktSL7kjTRDYXGUmRN
         +9mYYOxdZ7iVToMODuLkI0QfEo5Wc5ZIF8BB0/l3F/hwWlI4NULM7+RYfVOPRuCE3J7/
         pRSw==
X-Gm-Message-State: AOAM5333jqtpdcyfEucnJQWov1badj/zMQMpT/5gXcxPlpYHyCwV27sU
	LDUAaKLcFs1dP9RoNt/A0/XSQMaU1oQ=
X-Google-Smtp-Source: ABdhPJxHzbye4XRLnSvBlQObswNpXjTS3XrDqE1jJLqg0maTMcfec1EnyxM49kxDQRnXmTUAz/llKg==
X-Received: by 2002:a05:6512:499:b0:46f:d419:a19b with SMTP id v25-20020a056512049900b0046fd419a19bmr3576799lfq.654.1650646284247;
        Fri, 22 Apr 2022 09:51:24 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	virtualization@lists.linux-foundation.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jason Wang <jasowang@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Julien Grall <julien@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christoph Hellwig <hch@infradead.org>
Subject: [PATCH V1 4/6] dt-bindings: Add xen,dev-domid property description for xen-grant DMA ops
Date: Fri, 22 Apr 2022 19:51:01 +0300
Message-Id: <1650646263-22047-5-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Introduce Xen specific binding for the virtualized device (e.g. virtio)
to be used by Xen grant DMA-mapping layer in the subsequent commit.

This binding indicates that Xen grant mappings scheme needs to be
enabled for the device which DT node contains that property and specifies
the ID of Xen domain where the corresponding backend resides. The ID
(domid) is used as an argument to the grant mapping APIs.

This is needed for the option to restrict memory access using Xen grant
mappings to work which primary goal is to enable using virtio devices
in Xen guests.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Changes RFC -> V1:
   - update commit subject/description and text in description
   - move to devicetree/bindings/arm/
---
 .../devicetree/bindings/arm/xen,dev-domid.yaml     | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/xen,dev-domid.yaml

diff --git a/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
new file mode 100644
index 00000000..ef0f747
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/xen,dev-domid.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xen specific binding for the virtualized device (e.g. virtio)
+
+maintainers:
+  - Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
+
+select: true
+
+description:
+  This binding indicates that Xen grant mappings scheme needs to be enabled
+  for that device and specifies the ID of Xen domain where the corresponding
+  device (backend) resides. This is needed for the option to restrict memory
+  access using Xen grant mappings to work.
+
+properties:
+  xen,dev-domid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The domid (domain ID) of the domain where the device (backend) is running.
+
+additionalProperties: true
+
+examples:
+  - |
+    virtio_block@3000 {
+            compatible = "virtio,mmio";
+            reg = <0x3000 0x100>;
+            interrupts = <41>;
+
+            /* The device is located in Xen domain with ID 1 */
+            xen,dev-domid = <1>;
+    };
-- 
2.7.4


