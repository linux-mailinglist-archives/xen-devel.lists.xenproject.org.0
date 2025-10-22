Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D082FBFB382
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 11:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147744.1479921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVVE-0007EA-Bf; Wed, 22 Oct 2025 09:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147744.1479921; Wed, 22 Oct 2025 09:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVVE-0007C0-8M; Wed, 22 Oct 2025 09:51:32 +0000
Received: by outflank-mailman (input) for mailman id 1147744;
 Wed, 22 Oct 2025 09:51:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BD1N=47=bounce.vates.tech=bounce-md_30504962.68f8a919.v1-d0027f5a90814dada2a9af600a2f7328@srs-se1.protection.inumbo.net>)
 id 1vBVVD-0007BN-3e
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 09:51:31 +0000
Received: from mail187-3.suw11.mandrillapp.com
 (mail187-3.suw11.mandrillapp.com [198.2.187.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa2c1a93-af2c-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 11:51:22 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-3.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4cs4Dn3tS7zDRHxTs
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 09:51:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d0027f5a90814dada2a9af600a2f7328; Wed, 22 Oct 2025 09:51:21 +0000
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
X-Inumbo-ID: aa2c1a93-af2c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761126681; x=1761396681;
	bh=+LDeJfp4Fui1L+MoS/fNpSswgos6OApNk3YD5WlQ4s0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bkTAEZ3Hkt1bK3S6oRGi1eTN1o9wwmG0skjWC/tjqKh8SUnEmgZfjMOJIvjiGyfA4
	 dyvtmLvSg+1aLjpwHNvexAERPb04YibRnooBn7urnkibJc50BVGNCjBDu4cOFiNSbf
	 du0XHBDMGdygeCDXwy9Wx5pkTdiO5qvFbq9BCagHynVeBPk76N2ULqrcaTRLqHaGKB
	 YDvA8w5c/D0+iGIz+MlFBkYyamc1eRm6/ZiRNT/6ff+tQQ56VkmZ2SJolf39HVOBN8
	 phrL/Yypo4gGtr2AswFNHZaxT8d2gNNxvt+8YDCoBj7QsECtvD4YMnYvHLhD/AfHLw
	 ncl0AqZ+vEVOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761126681; x=1761387181; i=teddy.astie@vates.tech;
	bh=+LDeJfp4Fui1L+MoS/fNpSswgos6OApNk3YD5WlQ4s0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=JlrepnyzKPqdmChY2/UGevb/AK5a/1wsIEAyJ0hki3aYS165JlFQVAmLdfYIkWZQr
	 dpdtqsbBb6K/sD0n4HTK5gFY1J7vrfbRrBpbuIoKz/Znh/UonyaTDKkcT2Q+OSIZew
	 sYSFSVDyW7nlYZXT4wmrLBc52JL1d4YCMDL9UWlZ3rxyIpubsVH9IUSCgbQwEpInow
	 A0f56z+mUvEhjTCEop2sEeFwQF5a1FKVBPJCvscmsQmyE42MAzvIqNA6ktBMe0i+xl
	 1i9mGJi/AsXhagZTGRXQosn7xfPV4W4FDkG6nkXOHVsyfBIsH+G4bZV+V++yL/emyf
	 9rZvAy1T44Sjg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=202/4]=20vtd:=20Collapse=20x86=20subdirectory?=
X-Mailer: git-send-email 2.51.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761126680586
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>
Message-Id: <0b9cda94fc8b69563a5f8783d6bc3ed22b0531d9.1761124632.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1761124632.git.teddy.astie@vates.tech>
References: <cover.1761124632.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d0027f5a90814dada2a9af600a2f7328?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251022:md
Date: Wed, 22 Oct 2025 09:51:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

As VT-d only exists on x86, it doesn't make sense to have a x86-specific
subdirectory. Moreover, now that vtd.c empty (once we moved the deprecated
iommu_inclusive_mapping parameter), only ats.c remain which could be moved to
the upper directory.

Collapse this directory to make the driver structure clearer.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
Do we care much about iommu_inclusive_mapping ?

 xen/drivers/passthrough/iommu.c             | 10 ++++++
 xen/drivers/passthrough/vtd/Makefile        |  3 +-
 xen/drivers/passthrough/vtd/{x86 => }/ats.c | 10 +++---
 xen/drivers/passthrough/vtd/x86/Makefile    |  2 --
 xen/drivers/passthrough/vtd/x86/vtd.c       | 38 ---------------------
 5 files changed, 16 insertions(+), 47 deletions(-)
 rename xen/drivers/passthrough/vtd/{x86 => }/ats.c (97%)
 delete mode 100644 xen/drivers/passthrough/vtd/x86/Makefile
 delete mode 100644 xen/drivers/passthrough/vtd/x86/vtd.c

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index c9425d6971..2e2037502d 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -57,6 +57,16 @@ bool __read_mostly iommu_hwdom_passthrough;
 bool __hwdom_initdata iommu_hwdom_inclusive;
 int8_t __hwdom_initdata iommu_hwdom_reserved = -1;
 
+#ifdef CONFIG_X86
+/*
+ * Deprecated
+ *
+ * iommu_inclusive_mapping: when set, all memory below 4GB is included in dom0
+ * 1:1 iommu mappings except xen and unusable regions.
+ */
+boolean_param("iommu_inclusive_mapping", iommu_hwdom_inclusive);
+#endif
+
 #ifndef iommu_hap_pt_share
 bool __read_mostly iommu_hap_pt_share = true;
 #endif
diff --git a/xen/drivers/passthrough/vtd/Makefile b/xen/drivers/passthrough/vtd/Makefile
index fde7555fac..328a014016 100644
--- a/xen/drivers/passthrough/vtd/Makefile
+++ b/xen/drivers/passthrough/vtd/Makefile
@@ -1,5 +1,4 @@
-obj-$(CONFIG_X86) += x86/
-
+obj-y += ats.o
 obj-y += iommu.o
 obj-y += dmar.o
 obj-y += utils.o
diff --git a/xen/drivers/passthrough/vtd/x86/ats.c b/xen/drivers/passthrough/vtd/ats.c
similarity index 97%
rename from xen/drivers/passthrough/vtd/x86/ats.c
rename to xen/drivers/passthrough/vtd/ats.c
index 61052ef580..d481eff6d7 100644
--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ b/xen/drivers/passthrough/vtd/ats.c
@@ -22,11 +22,11 @@
 #include <xen/pci.h>
 #include <xen/pci_regs.h>
 #include <asm/msi.h>
-#include "../iommu.h"
-#include "../dmar.h"
-#include "../vtd.h"
-#include "../extern.h"
-#include "../../ats.h"
+#include "iommu.h"
+#include "dmar.h"
+#include "vtd.h"
+#include "extern.h"
+#include "../ats.h"
 
 static LIST_HEAD(ats_dev_drhd_units);
 
diff --git a/xen/drivers/passthrough/vtd/x86/Makefile b/xen/drivers/passthrough/vtd/x86/Makefile
deleted file mode 100644
index fe20a0b019..0000000000
--- a/xen/drivers/passthrough/vtd/x86/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-obj-y += ats.o
-obj-y += vtd.o
diff --git a/xen/drivers/passthrough/vtd/x86/vtd.c b/xen/drivers/passthrough/vtd/x86/vtd.c
deleted file mode 100644
index b0798dc6a1..0000000000
--- a/xen/drivers/passthrough/vtd/x86/vtd.c
+++ /dev/null
@@ -1,38 +0,0 @@
-/*
- * Copyright (c) 2008, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
- *
- * Copyright (C) Allen Kay <allen.m.kay@intel.com>
- * Copyright (C) Weidong Han <weidong.han@intel.com>
- */
-
-#include <xen/param.h>
-#include <xen/sched.h>
-#include <xen/softirq.h>
-#include <xen/domain_page.h>
-#include <asm/paging.h>
-#include <xen/iommu.h>
-#include <xen/irq.h>
-#include <xen/numa.h>
-#include <asm/fixmap.h>
-#include "../iommu.h"
-#include "../dmar.h"
-#include "../vtd.h"
-#include "../extern.h"
-
-/*
- * iommu_inclusive_mapping: when set, all memory below 4GB is included in dom0
- * 1:1 iommu mappings except xen and unusable regions.
- */
-boolean_param("iommu_inclusive_mapping", iommu_hwdom_inclusive);
-- 
2.51.1



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


