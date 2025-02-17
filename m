Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B0CA37FBF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890008.1299098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyCs-0001kz-9m; Mon, 17 Feb 2025 10:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890008.1299098; Mon, 17 Feb 2025 10:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyCr-0001ec-Ti; Mon, 17 Feb 2025 10:18:29 +0000
Received: by outflank-mailman (input) for mailman id 890008;
 Mon, 17 Feb 2025 10:18:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=056W=VI=bounce.vates.tech=bounce-md_30504962.67b30cef.v1-0b3be3f917cc4109bfb1d6d54bfdd02d@srs-se1.protection.inumbo.net>)
 id 1tjyCp-0008Nl-8x
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:18:27 +0000
Received: from mail178-27.suw51.mandrillapp.com
 (mail178-27.suw51.mandrillapp.com [198.2.178.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 861780a1-ed18-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 11:18:25 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-27.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4YxJWz3Wf3z6CPyQP
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 10:18:23 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0b3be3f917cc4109bfb1d6d54bfdd02d; Mon, 17 Feb 2025 10:18:23 +0000
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
X-Inumbo-ID: 861780a1-ed18-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1739787503; x=1740057503;
	bh=gXb3wUVO5oKXKkBCZARASVXNl7WclyPN6YadW2p3Vio=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=2DN702Xxo5b15o1FfO5cWPPO8ZFH20Iq3E21m5DpGIuLIUqcith/VMajomMM1Sk2Z
	 rfc2zUp00DqGaBx0ZfCJihaxdfZXvzkfKQw+jkcsxEVJIEF53MJ/IvFDEzmjfFklLV
	 GQejxcZ6EIUQSwQAqgtWBdtRg8nRwwuUNg4M5t+A3YvmDpzQzPm+OMHnCMrvdeMjOI
	 KEf0xRuUYoJEzHy7bDm8csCtn2CVfywYOWTG8T7otF/5mIyUZnTv4IB12OSyU0SsUe
	 xxe8sCckIEm39nScwzM6zCuyKp9fR+v5C7TQQ9klDnmL4EkVIe6vqZNixcFRk9bIRc
	 ZJKM2I/zpXR9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1739787503; x=1740048003; i=teddy.astie@vates.tech;
	bh=gXb3wUVO5oKXKkBCZARASVXNl7WclyPN6YadW2p3Vio=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=EBfgtgH6T162c1dLEThxISHY/VP9+Dw2nJuoTtsytkSS0nu3aMkSPzBcwdn6d3Kcp
	 K9RJC2tThFwC1ZdXfpGobi+xGUXPWNmzZRGqftAfSbZMS841UhEXukj8wVbjqxzzpT
	 ZAMrEhkvUgalfh4vd8TRtvWfLF5GbeGcjEqtbIrZJ8/hxzNfM6CVVPaViVXP88ILfz
	 En/0fzA4RCh14rc9Kh1n76muCA7qTbRFLYQ5KxwLc++msILLZnIo+fhaJvGSC6Cgs3
	 s9g3JZaSlgMCkT9sNBE9APBpiGRN6fJV2fOf/DrY1L3jEyR0fj8IJCeHnyuXZP4R5z
	 MMLMdmpExg7Nw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20RFC=20PATCH=20v6=2011/11]=20iommu:=20Introduce=20no-dma=20feature?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1739787502340
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <998adb8e82b0b4610d800b12b89d47e6341e565a.1739785339.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1739785339.git.teddy.astie@vates.tech>
References: <cover.1739785339.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0b3be3f917cc4109bfb1d6d54bfdd02d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250217:md
Date: Mon, 17 Feb 2025 10:18:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This feature exposed through `dom0-iommu=no-dma` prevents the devices
of default context to have access to domain's memory.
This basically enforces DMA protection by default. The domain will
need to prepare a specific IOMMU context to do DMA.

This feature needs the guest to provide a PV-IOMMU driver.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/common/pv-iommu.c               |  3 +++
 xen/drivers/passthrough/iommu.c     | 10 ++++++++++
 xen/drivers/passthrough/x86/iommu.c |  4 ++++
 xen/include/xen/iommu.h             |  3 +++
 4 files changed, 20 insertions(+)

diff --git a/xen/common/pv-iommu.c b/xen/common/pv-iommu.c
index a1315bf582..9c7d04b4c7 100644
--- a/xen/common/pv-iommu.c
+++ b/xen/common/pv-iommu.c
@@ -99,6 +99,9 @@ static long capabilities_op(struct pv_iommu_capabilities *cap, struct domain *d)
     cap->max_pasid = 0; /* TODO */
     cap->cap_flags = 0;
 
+    if ( !dom_iommu(d)->no_dma )
+        cap->cap_flags |= IOMMUCAP_default_identity;
+
     cap->pgsize_mask = PAGE_SIZE_4K;
 
     return 0;
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index c26a2160f9..59a4c64915 100644
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
 
@@ -329,6 +332,13 @@ int iommu_domain_init(struct domain *d, unsigned int opts)
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
index 79efc6ad47..174c218b9b 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -529,6 +529,10 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
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
index e115642b86..fb38c1be86 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -106,6 +106,7 @@ extern bool iommu_debug;
 extern bool amd_iommu_perdev_intremap;
 
 extern bool iommu_hwdom_strict, iommu_hwdom_passthrough, iommu_hwdom_inclusive;
+extern bool iommu_hwdom_no_dma;
 extern int8_t iommu_hwdom_reserved;
 
 extern unsigned int iommu_dev_iotlb_timeout;
@@ -411,6 +412,8 @@ struct domain_iommu {
     /* SAF-2-safe enum constant in arithmetic operation */
     DECLARE_BITMAP(features, IOMMU_FEAT_count);
 
+    /* Do the IOMMU block all DMA on default context (implies !has_pt_share) ? */
+    bool no_dma;
 
     /* Is the domain allowed to use PV-IOMMU ? */
     bool allow_pv_iommu;
-- 
2.47.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

