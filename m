Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A5946F49D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 21:06:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243314.420937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvPfq-0005xW-C0; Thu, 09 Dec 2021 20:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243314.420937; Thu, 09 Dec 2021 20:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvPfq-0005p0-7h; Thu, 09 Dec 2021 20:05:50 +0000
Received: by outflank-mailman (input) for mailman id 243314;
 Thu, 09 Dec 2021 20:05:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3OcP=Q2=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mvPfo-0004Xd-D9
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 20:05:48 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65e21947-592b-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 21:05:47 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id l22so14131942lfg.7
 for <xen-devel@lists.xenproject.org>; Thu, 09 Dec 2021 12:05:47 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id o12sm87371lft.134.2021.12.09.12.05.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Dec 2021 12:05:46 -0800 (PST)
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
X-Inumbo-ID: 65e21947-592b-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=g9AJiL9uTfpDDMd7SS4C6nAmWL0XZo0V0ZfDFdYmLjY=;
        b=COAXXVLnmQmpr5BGzCN9BcuqWFvHw2ocxZLxo6ryJ5Lhw+xJPSJQG8U5fyMK+rUwSi
         EYiKUFWwRjqcCV5YBfFzHQXgooJ8gBMmNeHvmX/AgiZxPAVXkq9PVW+yvKPlmzOl4aYu
         W2uDd1pXtu8UqzUIkvBXbL2Ch/O5tKOkr88Ei7WEG/HFl30t6yY/I9V2vtZteJYlrLxv
         iWHYSmmfEP5O8RSy/8n2R2GZzIGviX+SR5pmTvEBaL0XRT/AWDwa2km8xegEcMSEcF2l
         kf/OIUNJdOMax5XXVTNReI1Ic72Mf3qeSkVeziNzAaC0ItMUN+asYzsXxndrXbw7kj4E
         Rwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=g9AJiL9uTfpDDMd7SS4C6nAmWL0XZo0V0ZfDFdYmLjY=;
        b=kwxC+Y06fyr8qJJEaemTlwwXroHsQQ1xisJW6/ckrM6izx9N7ZJ0oKpfVWuoIZ3So0
         LG3tPtxB8dm6LRrZvgna2sJX1fSTzB0HRD6pdYA4g2ZCoRy5MeDSRkaO5VMirWtcuVrp
         9UrkcyPcVtapoBN87xc2tXFujDb5ygL4D1HfGHnhJHn48ulV3YrGuYohPo8Uv5y8cWjX
         ktFzUtZbSxgfIcsfAciDbNSSqtYwW+UZOtXqrmQpRJ3B48YdbPSqu8R9itdRAbRmPP7i
         WZktHzUYM8VzqFnlqC1xEpo9o+dtzlrP5yysc3tuF48rDBmNjAZ17yRbWHvDqE1r2cuF
         x/GQ==
X-Gm-Message-State: AOAM533fPKy5lTXikQskfbvFrkBZ9qyyhdLH9bIucQWzEpvn053goim6
	WmL2aEt112UuKUoLz5vkH0rUDS+5JpIK0g==
X-Google-Smtp-Source: ABdhPJyxDwm4qD0w1ssRjatqaxocOTEkFxXrsK+gDNk3bFfYXhmsC90Kh+C73THhn+OlTC99iNMRWQ==
X-Received: by 2002:a05:6512:ea2:: with SMTP id bi34mr8469336lfb.12.1639080346992;
        Thu, 09 Dec 2021 12:05:46 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH V4 6/6] dt-bindings: xen: Clarify "reg" purpose
Date: Thu,  9 Dec 2021 22:05:36 +0200
Message-Id: <1639080336-26573-7-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639080336-26573-1-git-send-email-olekstysh@gmail.com>
References: <1639080336-26573-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Xen on Arm has gained new support recently to calculate and report
extended regions (unused address space) safe to use for external
mappings. These regions are reported via "reg" property under
"hypervisor" node in the guest device-tree. As region 0 is reserved
for grant table space (always present), the indexes for extended
regions are 1...N.

No device-tree bindings update is needed (except clarifying the text)
as guest infers the presence of extended regions from the number
of regions in "reg" property.

While at it, remove the following sentence:
"This property is unnecessary when booting Dom0 using ACPI."
for "reg" and "interrupts" properties as the initialization is not
done via device-tree "hypervisor" node in that case anyway.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes V2 -> V3:
   - new patch

Changes V3 -> V4:
   - add Stefano's R-b and Rob's A-b
   - remove sentence about ACPI for "reg" and "interrupts"
     properties
---
 Documentation/devicetree/bindings/arm/xen.txt | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/xen.txt b/Documentation/devicetree/bindings/arm/xen.txt
index db5c56d..61d77ac 100644
--- a/Documentation/devicetree/bindings/arm/xen.txt
+++ b/Documentation/devicetree/bindings/arm/xen.txt
@@ -7,15 +7,17 @@ the following properties:
 	compatible = "xen,xen-<version>", "xen,xen";
   where <version> is the version of the Xen ABI of the platform.
 
-- reg: specifies the base physical address and size of a region in
-  memory where the grant table should be mapped to, using an
-  HYPERVISOR_memory_op hypercall. The memory region is large enough to map
-  the whole grant table (it is larger or equal to gnttab_max_grant_frames()).
-  This property is unnecessary when booting Dom0 using ACPI.
+- reg: specifies the base physical address and size of the regions in memory
+  where the special resources should be mapped to, using an HYPERVISOR_memory_op
+  hypercall.
+  Region 0 is reserved for mapping grant table, it must be always present.
+  The memory region is large enough to map the whole grant table (it is larger
+  or equal to gnttab_max_grant_frames()).
+  Regions 1...N are extended regions (unused address space) for mapping foreign
+  GFNs and grants, they might be absent if there is nothing to expose.
 
 - interrupts: the interrupt used by Xen to inject event notifications.
   A GIC node is also required.
-  This property is unnecessary when booting Dom0 using ACPI.
 
 To support UEFI on Xen ARM virtual platforms, Xen populates the FDT "uefi" node
 under /hypervisor with following parameters:
-- 
2.7.4


