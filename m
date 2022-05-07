Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AA051E925
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 20:20:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323759.545620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnP1f-0007va-HS; Sat, 07 May 2022 18:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323759.545620; Sat, 07 May 2022 18:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnP1f-0007s4-Bv; Sat, 07 May 2022 18:19:31 +0000
Received: by outflank-mailman (input) for mailman id 323759;
 Sat, 07 May 2022 18:19:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y6lb=VP=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nnP1c-0006Tm-SQ
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 18:19:28 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b384a03-ce32-11ec-a406-831a346695d4;
 Sat, 07 May 2022 20:19:28 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 k126-20020a1ca184000000b003943fd07180so6133137wme.3
 for <xen-devel@lists.xenproject.org>; Sat, 07 May 2022 11:19:28 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a5d4d8a000000b0020c5253d8f3sm8198457wru.63.2022.05.07.11.19.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 07 May 2022 11:19:26 -0700 (PDT)
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
X-Inumbo-ID: 3b384a03-ce32-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=f9eTxQwBpqmyE5YQv8y/mSGc6BFKrmx/9RtbXRM94yk=;
        b=q0QvHmJEV199SvJxS8MMwMhMnT/+xhVpVqbOLeHgkt06Xhs2dBC0jVTbeKOwr91pvR
         ndKaasEP0xJG1RLgJyqL7ROM0gZzZQdJc/q0MNhHsXPKClgmJU88UwkBbKhnyLTjrxeH
         akHWUnH51O7ewtusDhyChb/efNbilF+VAy0f52Ter98LqUPNVkvzci9eD41asZ+qZHI8
         cxd6Fw0R6dR9XKl9hBhot2Ml9a+SI7h0b6qTcC3h1dkFbCIGTfD57A7X/PwLBhWUviLJ
         RMrUlN4pHsO1OCXg4EHqgP/3qgV4jfWL/K1p0l8arjpAUs+e6MkOmajqxI/Xjre5TUMj
         SXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=f9eTxQwBpqmyE5YQv8y/mSGc6BFKrmx/9RtbXRM94yk=;
        b=LYgk0x+raOODGwiaT56Bckp+VpV5v1BOi1404LdMTQ/ChmyNXG42wSudv1HzGWKID3
         la1nsWxioDaBF3M6MbGXVVe+mcmlDfKaJmwKbbRfxwXWDns1aVVnHArVnMG4IQVJ16cs
         gE+cD371rgL7Kh5IrIHUdWmOsf9y2U/gICyCS+K0d5YqcsxZ4xovUHg/xWIB1KWTut+b
         faqOzAhFP9sKNigRBTwqrq+VOfPnPVIApQgD5fUs22wVt1C0/YWghNMZiym7+XABdvtE
         SH+XwUs8Fw1X1MTeMSEiTkVRjNjIhZqAu5jV8jm/kibShwLSQCgYXNwDy/yd6HG+SrXT
         s1OQ==
X-Gm-Message-State: AOAM532XRnqaesVbMTR1nMmglkUxpNn/OCIFE7FQXgVDuyB3rPKo6DZU
	F0PoxK1ZfTwfR8EOgAJ8ys7lO7iQ/1s=
X-Google-Smtp-Source: ABdhPJzhvjQBg6LQrWKFmAkWoYNYrT/dAdUxxfWwxE0Fo8ocoWuRQNu1extz5NXA4crK+Rzl3m2uBw==
X-Received: by 2002:a05:600c:4f03:b0:394:6499:21c7 with SMTP id l3-20020a05600c4f0300b00394649921c7mr8976554wmq.103.1651947566943;
        Sat, 07 May 2022 11:19:26 -0700 (PDT)
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
	Christoph Hellwig <hch@infradead.org>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH V2 5/7] dt-bindings: Add xen,dev-domid property description for xen-grant DMA ops
Date: Sat,  7 May 2022 21:19:06 +0300
Message-Id: <1651947548-4055-6-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>

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

Changes V1 -> V2:
   - update text in description
   - change the maintainer of the binding
   - fix validation issue
   - reference xen,dev-domid.yaml schema from virtio/mmio.yaml
---
 .../devicetree/bindings/arm/xen,dev-domid.yaml     | 37 ++++++++++++++++++++++
 Documentation/devicetree/bindings/virtio/mmio.yaml |  7 ++++
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/xen,dev-domid.yaml

diff --git a/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
new file mode 100644
index 00000000..750e89e
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/xen,dev-domid.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xen specific binding for virtualized devices (e.g. virtio)
+
+maintainers:
+  - Stefano Stabellini <sstabellini@kernel.org>
+
+select: true
+
+description:
+  This binding indicates that Xen grant mappings need to be enabled for
+  the device, and it specifies the ID of the domain where the corresponding
+  device (backend) resides. The property is required to restrict memory
+  access using Xen grant mappings.
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
+    virtio@3000 {
+            compatible = "virtio,mmio";
+            reg = <0x3000 0x100>;
+            interrupts = <41>;
+
+            /* The device is located in Xen domain with ID 1 */
+            xen,dev-domid = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/virtio/mmio.yaml b/Documentation/devicetree/bindings/virtio/mmio.yaml
index 10c22b5..29a0932 100644
--- a/Documentation/devicetree/bindings/virtio/mmio.yaml
+++ b/Documentation/devicetree/bindings/virtio/mmio.yaml
@@ -13,6 +13,9 @@ description:
   See https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=virtio for
   more details.
 
+allOf:
+  - $ref: /schemas/arm/xen,dev-domid.yaml#
+
 properties:
   compatible:
     const: virtio,mmio
@@ -33,6 +36,10 @@ properties:
     description: Required for devices making accesses thru an IOMMU.
     maxItems: 1
 
+  xen,dev-domid:
+    description: Required when Xen grant mappings need to be enabled for device.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
 required:
   - compatible
   - reg
-- 
2.7.4


