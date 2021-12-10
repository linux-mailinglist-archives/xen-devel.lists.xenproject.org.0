Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBF6470028
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 12:37:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243785.421821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mveCr-0002EB-Bt; Fri, 10 Dec 2021 11:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243785.421821; Fri, 10 Dec 2021 11:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mveCr-0002Bo-8y; Fri, 10 Dec 2021 11:36:53 +0000
Received: by outflank-mailman (input) for mailman id 243785;
 Fri, 10 Dec 2021 11:36:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dYg4=Q3=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mveCq-0002Bi-Ft
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 11:36:52 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77acdc35-59ad-11ec-9d12-4777fae47e2b;
 Fri, 10 Dec 2021 12:36:51 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id b1so17418296lfs.13
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 03:36:51 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id i8sm285074lfl.287.2021.12.10.03.36.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Dec 2021 03:36:50 -0800 (PST)
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
X-Inumbo-ID: 77acdc35-59ad-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=q0EX2c887v+fPFHULPYX+g0HtB41ahOOyTy81jfN7fA=;
        b=QFq3dfEuaC/ZrR9cXElNTzTKqK6fX2+DXYCfLxD1Y9fFygejwQK+MmoAwbRE8J+uOT
         zeS3bSIDwqVavq/FS2H67pebzo4N8j2Px8nUCvx40EmGl6amObvoLXNf7hpJcT333n15
         SmzGx3weO44DWQDIbq4dDvkCKdFM/o4i2eHU5HCEXQ1Bh1hZOshjF+cK20j8Xv7I83O8
         QB9QqLTEy/K3BJcRSgKLRqvQ1bGFrMkYvftxQDZubsW6H0izMf+/mbjN+hAthkKWi+Tg
         fN9x3VjsjO1iDNnQwfbZ5YpGdNwYCqzrxIAYT6ga13p5VY3z61Tq+mmDXiPWI6chDC1B
         9LLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=q0EX2c887v+fPFHULPYX+g0HtB41ahOOyTy81jfN7fA=;
        b=jc+kIMqYD/xFYFwKvfZ41IxdOmV/SGE02Qlbf35jd2pa4eNaPuvXvIaOVnNNbU7BGT
         UZmLXcOBqUOeCcZR/IVy9ym2YXHGQXNDp86JJnrvwdYac7VFHpQ8SS8DooORzeb7yMxA
         W62o/IlfrI2PitO1eGVpRzUIcJffv3wV1dlxn0HwZjBzq6KlI3DZ/xTBDaz8OIOIMP7F
         EEXfDaiSfwUa6ltp58sxyZv8g60e4mVBNXwChc50Hh2C8gW8WO5H9bJpMaOb5oz9ZPdm
         7xtzPJbwEiwTR8suRN7tw6STC/nX9RoOJD243/rCIKqgaaWuatA9GqtQ/5fBsVvAOtQL
         OnFg==
X-Gm-Message-State: AOAM531WduX//t3FIQIdDwvksLyEOlVKsVjq8XuxdWxl7wrOftFnc4/n
	2L2gGuZ38WPsg+y/oz9VW3pO3wpRhzYKCA==
X-Google-Smtp-Source: ABdhPJw5t4mb+80yXTBjzMnq1ZoZI2s9GRnKP6bfIY+UCxPG1pIehe8j8CjKjA9WLpHwTnfsNtCSdA==
X-Received: by 2002:a05:6512:685:: with SMTP id t5mr12006434lfe.84.1639136210663;
        Fri, 10 Dec 2021 03:36:50 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH V4 6/6] dt-bindings: xen: Clarify "reg" purpose
Date: Fri, 10 Dec 2021 13:36:41 +0200
Message-Id: <1639136201-27530-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <35ee3534-9e24-5a11-0bf1-a5dd0b640186@gmail.com>
References: <35ee3534-9e24-5a11-0bf1-a5dd0b640186@gmail.com>

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

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Changes V2 -> V3:
   - new patch

Changes V3 -> V4:
   - add Stefano's R-b and Rob's A-b
   - remove sentence about ACPI for "reg" and "interrupts"
     properties

Changes V4 -> V4.1
   - bring the mentioning of ACPI back which, as was pointed out by Julien,
     fits in the context:
     https://lore.kernel.org/xen-devel/9602b019-6c20-cdc7-23f3-9e4f8fd720f6@xen.org/T/#t
     so technically restore V3 state
   - remove Stefano's R-b and Rob's A-b as I am not 100% sure they are
     happy with that
---
 Documentation/devicetree/bindings/arm/xen.txt | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/xen.txt b/Documentation/devicetree/bindings/arm/xen.txt
index db5c56d..156fe10b 100644
--- a/Documentation/devicetree/bindings/arm/xen.txt
+++ b/Documentation/devicetree/bindings/arm/xen.txt
@@ -7,10 +7,14 @@ the following properties:
 	compatible = "xen,xen-<version>", "xen,xen";
   where <version> is the version of the Xen ABI of the platform.
 
-- reg: specifies the base physical address and size of a region in
-  memory where the grant table should be mapped to, using an
-  HYPERVISOR_memory_op hypercall. The memory region is large enough to map
-  the whole grant table (it is larger or equal to gnttab_max_grant_frames()).
+- reg: specifies the base physical address and size of the regions in memory
+  where the special resources should be mapped to, using an HYPERVISOR_memory_op
+  hypercall.
+  Region 0 is reserved for mapping grant table, it must be always present.
+  The memory region is large enough to map the whole grant table (it is larger
+  or equal to gnttab_max_grant_frames()).
+  Regions 1...N are extended regions (unused address space) for mapping foreign
+  GFNs and grants, they might be absent if there is nothing to expose.
   This property is unnecessary when booting Dom0 using ACPI.
 
 - interrupts: the interrupt used by Xen to inject event notifications.
-- 
2.7.4


