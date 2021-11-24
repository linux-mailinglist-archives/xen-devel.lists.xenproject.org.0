Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5546345CE7A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 21:54:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230552.398590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpzHF-0007Gi-IJ; Wed, 24 Nov 2021 20:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230552.398590; Wed, 24 Nov 2021 20:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpzHF-00079N-AB; Wed, 24 Nov 2021 20:54:01 +0000
Received: by outflank-mailman (input) for mailman id 230552;
 Wed, 24 Nov 2021 20:53:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMcq=QL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mpzHD-0006Ij-Hw
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 20:53:59 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a551efa8-4d68-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 21:53:58 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id l9so8085216ljq.5
 for <xen-devel@lists.xenproject.org>; Wed, 24 Nov 2021 12:53:58 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j11sm97608ljc.9.2021.11.24.12.53.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Nov 2021 12:53:58 -0800 (PST)
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
X-Inumbo-ID: a551efa8-4d68-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4IyNvYikGx/k9tdDU8szk4MiN32bXrdjaPGV4oWEMDs=;
        b=n18cstBkdjX7c+UShE1M0pp9AYFZa32iOb6HZ8rdrt8352PocjOxC7sjVmfskpFFXJ
         cP7FvZ6BWua0oznO+XQuZiW0mLUpmRy/h+zuw8dCqT/V+JNfFBCfu/u5oiBnVWhVtKiD
         R0+SnwDYwNlsoJhw/nYxYgSSU94QG+gmJGIwNvZB7CPivO3tHkuFA7PMxidgOT42knwb
         8+rQr70H2QlDBFrCqfUR21+P6rOWVBDezxc6r+nKLjN9Sgrj8z8x9gKvTIgM25fwD6pT
         f/T2ppOTcyjYvVgFEMcfRXKpWsQYSP/Q7CFluriF7V92BmHfr0hnGQmJkYIyOT12Uqji
         MVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4IyNvYikGx/k9tdDU8szk4MiN32bXrdjaPGV4oWEMDs=;
        b=U+ASQf4MLyhXy33AQZd4Hx1OcUXwDeKc1XNGkjrTAlT4Uo+tBxU42BG/DIFgi8UJ++
         xOrH9XLA56VP6/+JT0pLr8JzP1RupLOWwJYI/p9j/tF1aZCfYK9hdU135kmAs9v5iJo4
         3H7avEUXm4V/bAL/0UReNLu6IFe9Deh9WthwT/uLFbphjS1QN6d+45LH6+A+Rlq1jhec
         lQHexPRfOtSh7k6KiTUdnc6iEeZbmSOh+riljtiSW/0UVD0Mru4wLW1B6a50A3Djqa8S
         imv+YHp1L9wmQBUMdzmcLC7dw/o19Xzx6JrmWwyL5gSij91LZgMwz+Wy6KZET1gA+2nD
         RWaw==
X-Gm-Message-State: AOAM532jFepp36erTlN8Yob6Xcol3Q92ovG21Yvzr6s1FvvFXYCpn/Oz
	xbFTrdOa+p5k28g9VupdNI9mXIw/NkMFpA==
X-Google-Smtp-Source: ABdhPJzbg9X4RTlpGwA/0nX9yg4bi5EiUdsWZuy6cXGIhElPKfsHllDQlnKAQo4feHXv3B9QBwXKpA==
X-Received: by 2002:a2e:3c0c:: with SMTP id j12mr19053688lja.402.1637787238288;
        Wed, 24 Nov 2021 12:53:58 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH V3 6/6] dt-bindings: xen: Clarify "reg" purpose
Date: Wed, 24 Nov 2021 22:53:43 +0200
Message-Id: <1637787223-21129-7-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637787223-21129-1-git-send-email-olekstysh@gmail.com>
References: <1637787223-21129-1-git-send-email-olekstysh@gmail.com>

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
According to the recent update to Xen's guest.txt:
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob_plain;f=docs/misc/arm/device-tree/guest.txt;hb=refs/heads/master

Changes V2 -> V3:
   - new patch
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


