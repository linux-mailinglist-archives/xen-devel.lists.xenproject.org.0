Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9427C73A3F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 12:10:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166879.1493398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2YH-0005no-01; Thu, 20 Nov 2025 11:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166879.1493398; Thu, 20 Nov 2025 11:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2YG-0005gs-NZ; Thu, 20 Nov 2025 11:10:12 +0000
Received: by outflank-mailman (input) for mailman id 1166879;
 Thu, 20 Nov 2025 11:10:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mqCo=54=bounce.vates.tech=bounce-md_30504962.691ef70f.v1-e256d5f039384ed8a42fd4c1aa3b0daf@srs-se1.protection.inumbo.net>)
 id 1vM2YE-0001P8-70
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 11:10:10 +0000
Received: from mail180-15.suw31.mandrillapp.com
 (mail180-15.suw31.mandrillapp.com [198.2.180.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78f00f05-c601-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 12:10:08 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-15.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4dBwcH1sDpzPm0bxt
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 11:10:07 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e256d5f039384ed8a42fd4c1aa3b0daf; Thu, 20 Nov 2025 11:10:07 +0000
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
X-Inumbo-ID: 78f00f05-c601-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763637007; x=1763907007;
	bh=1JvgRf0rexS39lvXSQ6h0vAJOtgrDkxsYnUvnyHod10=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1wD2iR8HuZyStwZtwpeBjEqMxgilcuNR1GImEOBdsTUU9g7ZdkGB3MGBaHG8UIJ9t
	 bq1QSpMdo+bb0/lBDRUliTCyv/BRQrQy6qRMKn3D3MKjFMpUKQU2udDJ9xhXtPTeR0
	 C/8GYqybRlrkBWT9cMT694PBoD2dhxhJMzoZVqIfkFJaFjPGJW41Emqy8SlI4+Tlvz
	 PFVus8lk/J75MrBPY7IQ8MPi1JfPX+H4vi02RpmdRCC3UDLKbLvMDRI45hj8X1xw+K
	 MSnSCGQemhbymieRs2tQQfx1nDtl+5xltJi513N1kUqz43lRKSNI8C/Q7cB8tfPH0l
	 BgqzyZZEw3ypQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763637007; x=1763897507; i=teddy.astie@vates.tech;
	bh=1JvgRf0rexS39lvXSQ6h0vAJOtgrDkxsYnUvnyHod10=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SPNktnjj9asuiNq2pvXHP4WmqwJWKdU1aTRYBphxZuIjRTVH/HZfDuVK/R2YdmnBM
	 2rwV5EU7Rwag2xAzuVFJktnqGG6+wOuCcDJONQqJkclQEA/vJ5x7qbZKrz00Opktc8
	 Q9Oh+wmTwCkcYHC1Bso3Eg3SpiczXXh84Bzb9c2gtth3zbhV/5C31deym9YxOy+2vq
	 PycWM6u+9RhUy0RbNm/wyPt4v/RRVSr+tfherFU6pEVxoYhI1hieReDBCCpUw2/pye
	 6gDCoepM0SxhasP/f86WiddSe9tZbeNY3pDw3MXSSV9qAmn10uRwefyagTD6wMHQhM
	 qC8rzshe9QiTg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v7=2014/14]=20iommu:=20Introduce=20no-dma=20feature?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763637006009
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <6e1cb09c1543e9f2ca913f1cb6eecaaca7b7a13b.1763569135.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1763569135.git.teddy.astie@vates.tech>
References: <cover.1763569135.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e256d5f039384ed8a42fd4c1aa3b0daf?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251120:md
Date: Thu, 20 Nov 2025 11:10:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This feature exposed through `dom0-iommu=no-dma` prevents the devices
of default context to have access to domain's memory.
This basically enforces DMA protection by default. The domain will
need to prepare a specific IOMMU context to do DMA.

This feature needs the guest to provide a PV-IOMMU driver.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
 docs/misc/xen-command-line.pandoc   | 16 +++++++++++++++-
 xen/arch/x86/x86_64/mm.c            |  3 ++-
 xen/common/pv-iommu.c               |  3 +++
 xen/drivers/passthrough/iommu.c     | 13 +++++++++++++
 xen/drivers/passthrough/x86/iommu.c |  4 ++++
 xen/include/xen/iommu.h             |  3 +++
 6 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 34004ce282..b528f626a7 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -941,7 +941,7 @@ is necessary to fix an issue, please report a bug.
 
 ### dom0-iommu
     = List of [ passthrough=<bool>, strict=<bool>, map-inclusive=<bool>,
-                map-reserved=<bool>, none ]
+                map-reserved=<bool>, dma=<bool>, none ]
 
 Controls for the dom0 IOMMU setup.
 
@@ -992,6 +992,20 @@ Controls for the dom0 IOMMU setup.
     subset of the correction by only mapping reserved memory regions rather
     than all non-RAM regions.
 
+*   The `dma` option determines if the IOMMU is configured to identity map
+    the "default IOMMU context". If set to false, all devices of the Dom0 get
+    their DMA blocked until the IOMMU is properly configured by the guest (aside
+    special reserved regions).
+
+    Disabling this can slightly improve performance by removing the need to synchronize
+    p2m modifications with the IOMMU subsystem, moreover, disabling it provides DMA
+    protection that some operating systems can expect in order to securely handle some
+    devices (e.g Thunderbolt).
+
+    Disabling this requires guest support for PV-IOMMU for devices to behave properly.
+
+    This option is enabled by default.
+
 *   The `none` option is intended for development purposes only, and skips
     certain safety checks pertaining to the correct IOMMU configuration for
     dom0 to boot.
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index d4e6a9c0a2..00ff5d0b71 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1315,7 +1315,8 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
      */
     if ( is_iommu_enabled(hardware_domain) &&
          !iommu_use_hap_pt(hardware_domain) &&
-         !need_iommu_pt_sync(hardware_domain) )
+         !need_iommu_pt_sync(hardware_domain) &&
+         !iommu_hwdom_no_dma )
     {
         for ( i = spfn; i < epfn; i++ )
             if ( iommu_legacy_map(hardware_domain, _dfn(i), _mfn(i),
diff --git a/xen/common/pv-iommu.c b/xen/common/pv-iommu.c
index 4cdb30a031..a1d0552a66 100644
--- a/xen/common/pv-iommu.c
+++ b/xen/common/pv-iommu.c
@@ -107,6 +107,9 @@ static long capabilities_op(struct pv_iommu_capabilities *cap, struct domain *d)
     cap->max_pasid = 0; /* TODO */
     cap->cap_flags = 0;
 
+    if ( !dom_iommu(d)->no_dma )
+        cap->cap_flags |= IOMMUCAP_default_identity;
+
     cap->pgsize_mask = PAGE_SIZE_4K;
 
     return 0;
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 5c6b272697..81d4cb87cf 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -55,6 +55,7 @@ static bool __hwdom_initdata iommu_hwdom_none;
 bool __hwdom_initdata iommu_hwdom_strict;
 bool __read_mostly iommu_hwdom_passthrough;
 bool __hwdom_initdata iommu_hwdom_inclusive;
+bool __read_mostly iommu_hwdom_no_dma = false;
 int8_t __hwdom_initdata iommu_hwdom_reserved = -1;
 
 #ifndef iommu_hap_pt_share
@@ -172,6 +173,8 @@ static int __init cf_check parse_dom0_iommu_param(const char *s)
             iommu_hwdom_reserved = val;
         else if ( !cmdline_strcmp(s, "none") )
             iommu_hwdom_none = true;
+        else if ( (val = parse_boolean("dma", s, ss)) >= 0 )
+            iommu_hwdom_no_dma = !val;
         else
             rc = -EINVAL;
 
@@ -292,7 +295,10 @@ int iommu_domain_init(struct domain *d, unsigned int opts)
     int ret = 0;
 
     if ( is_hardware_domain(d) )
+    {
         check_hwdom_reqs(d); /* may modify iommu_hwdom_strict */
+        hd->no_dma = iommu_hwdom_no_dma;
+    }
 
     if ( !is_iommu_enabled(d) )
         return 0;
@@ -329,6 +335,13 @@ int iommu_domain_init(struct domain *d, unsigned int opts)
     if ( !is_hardware_domain(d) || iommu_hwdom_strict )
         hd->need_sync = !iommu_use_hap_pt(d);
 
+    if ( hd->no_dma )
+    {
+        /* No-DMA mode is exclusive with HAP and sync_pt. */
+        hd->hap_pt_share = false;
+        hd->need_sync = false;
+    }
+
     ASSERT(!(hd->need_sync && hd->hap_pt_share));
 
     hd->allow_pv_iommu = true;
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index ac339a2ed3..b100c55e69 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -542,6 +542,10 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
     if ( iommu_hwdom_reserved == -1 )
         iommu_hwdom_reserved = 1;
 
+    if ( iommu_hwdom_no_dma )
+        /* Skip special mappings with no-dma mode */
+        return;
+
     if ( iommu_hwdom_inclusive )
     {
         printk(XENLOG_WARNING
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 3c77dfaf41..55bd9c9704 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -108,6 +108,7 @@ extern bool iommu_debug;
 extern bool amd_iommu_perdev_intremap;
 
 extern bool iommu_hwdom_strict, iommu_hwdom_passthrough, iommu_hwdom_inclusive;
+extern bool iommu_hwdom_no_dma;
 extern int8_t iommu_hwdom_reserved;
 
 extern unsigned int iommu_dev_iotlb_timeout;
@@ -487,6 +488,8 @@ struct domain_iommu {
     /* SAF-2-safe enum constant in arithmetic operation */
     DECLARE_BITMAP(features, IOMMU_FEAT_count);
 
+    /* Do the IOMMU block all DMA on default context (implies !has_pt_share) ? */
+    bool no_dma;
 
     /* Is the domain allowed to use PV-IOMMU ? */
     bool allow_pv_iommu;
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


