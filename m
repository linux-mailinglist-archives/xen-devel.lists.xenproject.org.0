Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2474B1ADE8F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 15:41:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPRFZ-0003jK-Ie; Fri, 17 Apr 2020 13:41:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8vtN=6B=gmail.com=brendank310@srs-us1.protection.inumbo.net>)
 id 1jPRAw-0002wX-2P
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 13:36:58 +0000
X-Inumbo-ID: 82311876-80b0-11ea-b58d-bc764e2007e4
Received: from mail-qv1-xf44.google.com (unknown [2607:f8b0:4864:20::f44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82311876-80b0-11ea-b58d-bc764e2007e4;
 Fri, 17 Apr 2020 13:36:57 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id p13so845385qvt.12
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2020 06:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HRPWWtofqA3WxdWb6Pe4buRoU0c+5z8FPddggNV3kGg=;
 b=Ez+/LioiTpBc2aMj08gzjWR1kkaHMuAwKEfggRF0eTANv28Gwf/3GMz/f3wtRvYGda
 GDLIPdlp/fpivgsB+lVj9k6a9TKmu/beQtukKKZfhfbuYR1qzhh4Jk3sYCLkq8SYfIER
 BQ81qnCPKDEFijPmkSqlHDDUn/KXaBzxNc7K1XQSWju+ZuQxYmS6AEGXJLGliFJrsm75
 jDWkXSXP2FUhVZjL/F0S5ongusEvg8WZK9vCLllTd2T/bqoSFNLbrKICmtlBFeRZ1Aft
 PcDG4WmPnja4yoLeKaOAWGNM1E6rAoXUEfPF2KoyyJPUh+JPZ+KaZiZDcb4EyIUEfPef
 tJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HRPWWtofqA3WxdWb6Pe4buRoU0c+5z8FPddggNV3kGg=;
 b=RPDLaiT0Pq7L/M6ZC6aLiQ1fSFUd9OGtJ9aznblSqRxHITJ69ZZ5rh8uxO6f62g/mn
 FEGHSOVlO8/PAXXXbQLnMIIvJ3Simo11a3RcfX0ttdiIB8cWqswO5n+4GIRxegkvk3P5
 YdihHZ2CeUSQOSGSrTl6FCF1aLIpBE/WYttEedfttpQehQUmeEsxyLs8DeVflF1Cavi6
 LjYwkQkA3Gbdmr/IqbD46E930Uy+gE9GRz8293TjipUexCYj72YQEdk8J0pU2SPcW8u5
 ahhC1E8ODeSSdI88aSNzqzauObjNppxyldKH16gAJ7v0isIyyA8igNBkPMWjmlmNUlXM
 5aAA==
X-Gm-Message-State: AGi0PuZwt9uwnHjn/XHo+IHg8Tl1C81BczkTSVgwkiS4x0KF3QQf0aFA
 iLGQ0XDNfQwBVPNQUVF3A2yTqGMF1QrbNg==
X-Google-Smtp-Source: APiQypJvxlV1pk2XCy0Fb3ndgKfkRrg3cavj5ggAli2VEjBjAnaK65Ii8wvKWFtSFosYmV2b4Qc3qw==
X-Received: by 2002:ad4:57b0:: with SMTP id g16mr2716362qvx.161.1587130616978; 
 Fri, 17 Apr 2020 06:36:56 -0700 (PDT)
Received: from ubuntu.localdomain
 (pool-96-249-236-140.nrflva.fios.verizon.net. [96.249.236.140])
 by smtp.gmail.com with ESMTPSA id s15sm18140737qtc.31.2020.04.17.06.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 06:36:56 -0700 (PDT)
From: Brendan Kerrigan <brendank310@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 1/1] x86/vtd: Mask DMAR faults for IGD devices
Date: Fri, 17 Apr 2020 09:36:26 -0400
Message-Id: <20200417133626.72302-2-brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200417133626.72302-1-brendank310@gmail.com>
References: <20200417133626.72302-1-brendank310@gmail.com>
X-Mailman-Approved-At: Fri, 17 Apr 2020 13:41:44 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: kevin.tian@intel.com, Brendan Kerrigan <kerriganb@ainfosec.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Brendan Kerrigan <kerriganb@ainfosec.com>

The Intel graphics device records DMAR faults regardless
of the Fault Process Disable bit being set. When this fault
occurs, enable the Interrupt Mask (IM) bit in the Fault
Event Control (FECTL) register to prevent the continued
recording of the fault.

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 xen/drivers/passthrough/vtd/iommu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 07d40b37fe..288399d816 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -41,6 +41,8 @@
 #include "vtd.h"
 #include "../ats.h"
 
+#define IS_IGD(seg, id) (0 == seg && 0 == PCI_BUS(id) && 2 == PCI_SLOT(id) && 0 == PCI_FUNC(id))
+
 struct mapped_rmrr {
     struct list_head list;
     u64 base, end;
@@ -872,6 +874,13 @@ static int iommu_page_fault_do_one(struct vtd_iommu *iommu, int type,
     printk(XENLOG_G_WARNING VTDPREFIX "%s: reason %02x - %s\n",
            kind, fault_reason, reason);
 
+    if ( DMA_REMAP == fault_type && type && IS_IGD(seg, source_id) ) {
+        u32 fectl = dmar_readl(iommu->reg, DMAR_FECTL_REG);
+        fectl |= DMA_FECTL_IM;
+        dmar_writel(iommu->reg, DMAR_FECTL_REG, fectl);
+        printk(XENLOG_G_WARNING VTDPREFIX "Disabling DMAR faults for IGD\n");
+    }
+
     if ( iommu_verbose && fault_type == DMA_REMAP )
         print_vtd_entries(iommu, PCI_BUS(source_id), PCI_DEVFN2(source_id),
                           addr >> PAGE_SHIFT);
-- 
2.17.1


