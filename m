Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC07D501BAD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 21:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305048.519887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf50L-0005ss-DQ; Thu, 14 Apr 2022 19:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305048.519887; Thu, 14 Apr 2022 19:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf50L-0005qZ-9D; Thu, 14 Apr 2022 19:19:45 +0000
Received: by outflank-mailman (input) for mailman id 305048;
 Thu, 14 Apr 2022 19:19:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RCiM=UY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nf50J-0005Nh-TZ
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 19:19:44 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6233aba-bc27-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 21:19:42 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id k5so10752364lfg.9
 for <xen-devel@lists.xenproject.org>; Thu, 14 Apr 2022 12:19:42 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a194943000000b0046b928d2795sm85001lfj.67.2022.04.14.12.19.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:19:41 -0700 (PDT)
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
X-Inumbo-ID: d6233aba-bc27-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=R46jQ8Mh8wQzPdylSEViVF+ujde6F3v3VBI24iINPTM=;
        b=QRWLAqmejMzVP/VaSSlfrFYwEo3OK4Yf6F7LquH6LbczOkSkbq/vAsvvcBkQZ3ISuO
         wk/F7z7KZoaZjO6jJEtsC8Z8u0HmEeGUEZBJ+5uIIL8d4EZc/Xy5CV+958+05d7Oh+3w
         0MTx5F+/q1lMyyGoE/T8SwKtQsZ+ljloGYnRMXgZR3RSh42S3JxNeguRIyZ8pSqxFcSJ
         lbwOzjD3LaDkuMdE7Vsq66i//JMVvHCxYJln9faVJVA4/8+FWK/0SSS5ZAme/0sNPB8x
         GZApoZF4cbZLwHjguo+2oIvkWDrnYDqQpErg124vnNNbbDISEkGcSHd43FjTBLZC5Hys
         u53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=R46jQ8Mh8wQzPdylSEViVF+ujde6F3v3VBI24iINPTM=;
        b=4meuLF+S9MkKvDqe43qsESqN0ZDAdkVh/zFlh/fZ+qUky8MXYmSJa3Za3beYLuBdBa
         J13zkytivl8kUaWkwQOV+8oPY8IxRXfNnpBJZ9lda0rp239knQXcrL2EY9M/2IB09Qdb
         hnsGOCzgBY6AVjoeFd33jcJpNC7InRQcbwQCm72ZsliKwZu6Le5d4fz7iqIkEtgD58Mp
         0t62GnmvNX0bkwpgMB0KPLpgVGoSI+0vUX0+P8zLYbDFuTLKmNy6N8YSA0XxvsDaWiyf
         b1UDYdOzKRAqS52sri4L2Z83g2oxd1OXlCCPtdGAqrdKwqaZRYgaEZwIlElpLZPIR5dN
         sRLA==
X-Gm-Message-State: AOAM533tWmRIG6r012KBsptJ6Zb7IgifwiAx5YO/QP9NYYm4/H8UelyR
	+l9vuQu+9tmQWHPzYK9t4USloLOTvg8=
X-Google-Smtp-Source: ABdhPJwDFkGrudp03NZzkhnvIn/IK69FMZdjURZkh3p/wuKd/xnIHAcuOjWitfBhsfM9796bR6Fn5A==
X-Received: by 2002:a05:6512:169a:b0:44a:fea7:50a5 with SMTP id bu26-20020a056512169a00b0044afea750a5mr2825082lfb.498.1649963981876;
        Thu, 14 Apr 2022 12:19:41 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	virtualization@lists.linux-foundation.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Julien Grall <julien@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH 3/6] dt-bindings: xen: Add xen,dev-domid property description for xen-virtio layer
Date: Thu, 14 Apr 2022 22:19:30 +0300
Message-Id: <1649963973-22879-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Introduce Xen specific binding for the virtio-mmio device to be used
by Xen virtio support driver in a subsequent commit.

This binding specifies the ID of Xen domain where the corresponding
device (backend) resides. This is needed for the option to restrict
memory access using Xen grant mappings to work.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 .../devicetree/bindings/virtio/xen,dev-domid.yaml  | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/virtio/xen,dev-domid.yaml

diff --git a/Documentation/devicetree/bindings/virtio/xen,dev-domid.yaml b/Documentation/devicetree/bindings/virtio/xen,dev-domid.yaml
new file mode 100644
index 00000000..78be993
--- /dev/null
+++ b/Documentation/devicetree/bindings/virtio/xen,dev-domid.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/virtio/xen,dev-domid.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xen specific binding for the virtio device
+
+maintainers:
+  - Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
+
+select: true
+
+description:
+  This binding specifies the ID of Xen domain where the corresponding device
+  (backend) resides. This is needed for the option to restrict memory access
+  using Xen grant mappings to work.
+
+  Note that current and generic "iommus" bindings are mutually exclusive, since
+  the restricted memory access model on Xen behaves as a kind of software IOMMU.
+
+properties:
+  xen,dev-domid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Should contain the ID of device's domain.
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


