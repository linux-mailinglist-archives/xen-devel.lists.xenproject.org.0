Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A50498FED0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 10:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810092.1222787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVK-0007UP-WA; Fri, 04 Oct 2024 08:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810092.1222787; Fri, 04 Oct 2024 08:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVK-0007Gk-E0; Fri, 04 Oct 2024 08:17:38 +0000
Received: by outflank-mailman (input) for mailman id 810092;
 Fri, 04 Oct 2024 08:17:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=njpt=RA=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swdVH-0005Vm-5i
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 08:17:35 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bd3abf5-8229-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 10:17:34 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so232194766b.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 01:17:34 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99102858a4sm189829366b.49.2024.10.04.01.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 01:17:33 -0700 (PDT)
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
X-Inumbo-ID: 1bd3abf5-8229-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728029854; x=1728634654; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wa3ZmXvbNT3cVq7/5R5qVXzdHrXKzTt2KbYl/Ig19/Y=;
        b=ez5XvvY4n6DvPa0XJKLxQK+9sK2dgwErJzHXvCu0QB3XWUrEGHdlgfjo2OZW9UvIMi
         gmlRmfoI7tkFrYxI1+/FAs7kCBrR8VH+iR7XDLdQnzD09eRZZoqcktwSkNs8NSJ5A906
         EXMqViOEql4covQO6tGYSIfHQTA9tdBQ/5Ols=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029854; x=1728634654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wa3ZmXvbNT3cVq7/5R5qVXzdHrXKzTt2KbYl/Ig19/Y=;
        b=FMy2D5DigUCYbdx9Df/n/RihMvSkbhuw/z7LkC9SuK7ec5ZAxrQT3N11w+6TyNjvmV
         Vg5njxP6tPx6QcbEWhE7Z8C1qdvrzROkoL+g0pu0cadzjS78XZ6DIflCQMTIx25IKa3+
         efsSVBpsMKAgHCG2LHLMInBbJOPVLmKG+qwV/iWXkPkO5wUximCSdKIqCMxRgt6WM2C2
         ezlyqobMQEwSK0tANKd+Wyzyh/85c6dVtQIo4TSgA5vEDKEVcfEouDAOB1GADUoXYUDE
         sF0mN9GvULsuSxvmtwPbGb4rqQgwPvq/Sb7i36inVd44TLc2xVcFeTs+/xiRBl58R6sX
         9v5g==
X-Gm-Message-State: AOJu0YzzaOm1hRvueFYNDXv5i5321FZyzkZmfYo6cIWUqMKOMa9pG0v7
	pTYyDD1byuichhcddHf6tnMcQjWEWt561mmAAJ6ErldwJfXxbXjIoZdwfRHjiqxXtPlQ/FLptGL
	c
X-Google-Smtp-Source: AGHT+IHFvf6CP3Kqoi0jScp5aHubGVRmq1MSswP/f6TwUzxpsvWgy69gfXi3ygyTjT/ucb/PrNPCuw==
X-Received: by 2002:a17:907:3dac:b0:a8a:9246:7f57 with SMTP id a640c23a62f3a-a991bd1371emr200053566b.4.1728029853717;
        Fri, 04 Oct 2024 01:17:33 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 10/19] xen: Update header guards - I/O MMU
Date: Fri,  4 Oct 2024 09:17:04 +0100
Message-Id: <20241004081713.749031-11-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241004081713.749031-1-frediano.ziglio@cloud.com>
References: <20241004081713.749031-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to I/O MMU.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/drivers/passthrough/amd/iommu-defs.h | 6 +++---
 xen/drivers/passthrough/amd/iommu.h      | 6 +++---
 xen/drivers/passthrough/ats.h            | 6 +++---
 xen/drivers/passthrough/vtd/dmar.h       | 6 +++---
 xen/drivers/passthrough/vtd/extern.h     | 6 +++---
 xen/drivers/passthrough/vtd/iommu.h      | 4 ++--
 xen/drivers/passthrough/vtd/vtd.h        | 6 +++---
 xen/include/xen/iommu.h                  | 6 +++---
 8 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu-defs.h b/xen/drivers/passthrough/amd/iommu-defs.h
index c145248f9a..30b094f187 100644
--- a/xen/drivers/passthrough/amd/iommu-defs.h
+++ b/xen/drivers/passthrough/amd/iommu-defs.h
@@ -17,8 +17,8 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef AMD_IOMMU_DEFS_H
-#define AMD_IOMMU_DEFS_H
+#ifndef DRIVERS__PASSTHROUGH__AMD__IOMMU_DEFS_H
+#define DRIVERS__PASSTHROUGH__AMD__IOMMU_DEFS_H
 
 /* IOMMU Event Log entries: in power of 2 increments, minimum of 256 */
 #define IOMMU_EVENT_LOG_DEFAULT_ENTRIES     512
@@ -486,7 +486,7 @@ union amd_iommu_pte {
 #define IOMMU_REG_BASE_ADDR_HIGH_MASK               0x000FFFFFU
 #define IOMMU_REG_BASE_ADDR_HIGH_SHIFT              0
 
-#endif /* AMD_IOMMU_DEFS_H */
+#endif /* DRIVERS__PASSTHROUGH__AMD__IOMMU_DEFS_H */
 
 /*
  * Local variables:
diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 8d6f63d87f..c32e9e9a16 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -16,8 +16,8 @@
  * You should have received a copy of the GNU General Public License
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef AMD_IOMMU_H
-#define AMD_IOMMU_H
+#ifndef DRIVERS__PASSTHROUGH__AMD__IOMMU_H
+#define DRIVERS__PASSTHROUGH__AMD__IOMMU_H
 
 #include <xen/init.h>
 #include <xen/types.h>
@@ -372,4 +372,4 @@ static inline void iommu_set_addr_hi_to_reg(uint32_t *reg, uint32_t addr)
                          IOMMU_REG_BASE_ADDR_HIGH_SHIFT, reg);
 }
 
-#endif /* AMD_IOMMU_H */
+#endif /* DRIVERS__PASSTHROUGH__AMD__IOMMU_H */
diff --git a/xen/drivers/passthrough/ats.h b/xen/drivers/passthrough/ats.h
index f5e1d254e0..68b1c600eb 100644
--- a/xen/drivers/passthrough/ats.h
+++ b/xen/drivers/passthrough/ats.h
@@ -12,8 +12,8 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _ATS_H_
-#define _ATS_H_
+#ifndef DRIVERS__PASSTHROUGH__ATS_H
+#define DRIVERS__PASSTHROUGH__ATS_H
 
 #include <xen/pci_regs.h>
 
@@ -50,5 +50,5 @@ static inline int pci_ats_device(int seg, int bus, int devfn)
                                    PCI_EXT_CAP_ID_ATS);
 }
 
-#endif /* _ATS_H_ */
+#endif /* DRIVERS__PASSTHROUGH__ATS_H */
 
diff --git a/xen/drivers/passthrough/vtd/dmar.h b/xen/drivers/passthrough/vtd/dmar.h
index 61f71ca5e6..0ff4f36535 100644
--- a/xen/drivers/passthrough/vtd/dmar.h
+++ b/xen/drivers/passthrough/vtd/dmar.h
@@ -17,8 +17,8 @@
  * Copyright (C) Shaohua Li <shaohua.li@intel.com>
  */
 
-#ifndef _DMAR_H_
-#define _DMAR_H_
+#ifndef DRIVERS__PASSTHROUGH__VTD__DMAR_H
+#define DRIVERS__PASSTHROUGH__VTD__DMAR_H
 
 #include <xen/list.h>
 #include <xen/iommu.h>
@@ -171,4 +171,4 @@ int vtd_hw_check(void);
 void disable_pmr(struct vtd_iommu *iommu);
 int is_igd_drhd(struct acpi_drhd_unit *drhd);
 
-#endif /* _DMAR_H_ */
+#endif /* DRIVERS__PASSTHROUGH__VTD__DMAR_H */
diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
index 667590ee52..c16583c951 100644
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -17,8 +17,8 @@
  * Copyright (C) Weidong Han <weidong.han@intel.com>
  */
 
-#ifndef _VTD_EXTERN_H_
-#define _VTD_EXTERN_H_
+#ifndef DRIVERS__PASSTHROUGH__VTD__EXTERN_H
+#define DRIVERS__PASSTHROUGH__VTD__EXTERN_H
 
 #include "dmar.h"
 #include <xen/keyhandler.h>
@@ -114,4 +114,4 @@ void quirk_iommu_caps(struct vtd_iommu *iommu);
 bool platform_supports_intremap(void);
 bool platform_supports_x2apic(void);
 
-#endif // _VTD_EXTERN_H_
+#endif // DRIVERS__PASSTHROUGH__VTD__EXTERN_H
diff --git a/xen/drivers/passthrough/vtd/iommu.h b/xen/drivers/passthrough/vtd/iommu.h
index 78aa8a96f5..29d350b23d 100644
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -16,8 +16,8 @@
  * Copyright (C) Ashok Raj <ashok.raj@intel.com>
  */
 
-#ifndef _INTEL_IOMMU_H_
-#define _INTEL_IOMMU_H_
+#ifndef DRIVERS__PASSTHROUGH__VTD__IOMMU_H
+#define DRIVERS__PASSTHROUGH__VTD__IOMMU_H
 
 #include <xen/iommu.h>
 #include <asm/msi.h>
diff --git a/xen/drivers/passthrough/vtd/vtd.h b/xen/drivers/passthrough/vtd/vtd.h
index cb2df76eed..8aeff8c1f2 100644
--- a/xen/drivers/passthrough/vtd/vtd.h
+++ b/xen/drivers/passthrough/vtd/vtd.h
@@ -17,8 +17,8 @@
  * Copyright (C) Weidong Han <weidong.han@intel.com>
  */
 
-#ifndef _VTD_H_
-#define _VTD_H_
+#ifndef DRIVERS__PASSTHROUGH__VTD__VTD_H
+#define DRIVERS__PASSTHROUGH__VTD__VTD_H
 
 #include <xen/iommu.h>
 
@@ -72,4 +72,4 @@ struct msi_msg_remap_entry {
     u32	data;		/* msi message data */
 };
 
-#endif // _VTD_H_
+#endif // DRIVERS__PASSTHROUGH__VTD__VTD_H
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 442ae5322d..b928c67e19 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -16,8 +16,8 @@
  * Copyright (C) Allen Kay <allen.m.kay@intel.com>
  */
 
-#ifndef _IOMMU_H_
-#define _IOMMU_H_
+#ifndef XEN__IOMMU_H
+#define XEN__IOMMU_H
 
 #include <xen/mm-frame.h>
 #include <xen/init.h>
@@ -440,7 +440,7 @@ static inline int iommu_update_ire_from_msi(
 }
 #endif
 
-#endif /* _IOMMU_H_ */
+#endif /* XEN__IOMMU_H */
 
 /*
  * Local variables:
-- 
2.34.1


