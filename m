Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C802A37FB9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:18:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890004.1299052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyCn-0000Vc-VP; Mon, 17 Feb 2025 10:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890004.1299052; Mon, 17 Feb 2025 10:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyCn-0000OG-NH; Mon, 17 Feb 2025 10:18:25 +0000
Received: by outflank-mailman (input) for mailman id 890004;
 Mon, 17 Feb 2025 10:18:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GlxG=VI=bounce.vates.tech=bounce-md_30504962.67b30ced.v1-b78efb45eff9473c8831e3b16f38586e@srs-se1.protection.inumbo.net>)
 id 1tjyCm-0008Nl-8a
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:18:24 +0000
Received: from mail178-27.suw51.mandrillapp.com
 (mail178-27.suw51.mandrillapp.com [198.2.178.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 840ba84f-ed18-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 11:18:22 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-27.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4YxJWx75CZz6CPyPD
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 10:18:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b78efb45eff9473c8831e3b16f38586e; Mon, 17 Feb 2025 10:18:21 +0000
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
X-Inumbo-ID: 840ba84f-ed18-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1739787502; x=1740057502;
	bh=Unm7kyf0yewx/61zGSD5OTOtKbpaUHiruf6MwrYYcBM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SG8tm9VogyshjU1b25z0O6UNlPkwoMsobD6Ajus3dNmbDTWak4gOB5gCAISiubeKZ
	 JgBpIjN7WwSs+GPEmd166SfIv8ESxpRh6cH4DYp9W8V9iEd0SofQL1f2HBbRTu4NRg
	 ds1nNz24Hdkyh4GOJBG/0Qy9Ley0gAbZdzQf7R+HSpHHvPlCU6BZ+7pDQDH7tWwEn0
	 +IUFmNZ/l4CCmX7/iYHonTyiwdyr8SFSJl91LcSsg4S9JWCehOGteZmnhYPEmex13T
	 HleNij7pimLPsv9MZvrCHujogpJMTnlP/RFPDxngpPJ13F972JipWN+qI125PESf7U
	 utBr/LS14Quuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1739787502; x=1740048002; i=teddy.astie@vates.tech;
	bh=Unm7kyf0yewx/61zGSD5OTOtKbpaUHiruf6MwrYYcBM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=C/GcX6fP7EJhylvOP4pihczVMeMNR1Aj0wrHOFg19Swn/Yyy01V6M8vLPiCy10pe2
	 yIlt1466utkhspApmhpTzrR1bHHWFCBhIfullnq5CDOMlRKWabCG++tnWWCLS8r5J3
	 HPq90Oe1MLJZo0AqprqpsF8J2inrzO+AhbiAx6sa5y6V/NtRifhMtfJcVAnPKm4zyM
	 IiNv6spF3XPhzwA2zM+Gfpk9k4KFYKA5x7QtYWetsj1JOB72Kocud4ixmYufO4wZKu
	 237DiM4qlZAH0OgpQgpf2WE6d+Z1hFl7MAj69mt2mbIcwXxud5JvDZwP0WNwhgzAXF
	 rToR5tAqXgFOA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20RFC=20PATCH=20v6=2006/11]=20vtd:=20Remove=20MAP=5FERROR=5FRECOVERY=20code=20path=20in=20domain=5Fcontext=5Fmapping=5Fone?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1739787501062
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <bfa67676918b9ed468718803552b105cd7f7f9b9.1739785339.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1739785339.git.teddy.astie@vates.tech>
References: <cover.1739785339.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b78efb45eff9473c8831e3b16f38586e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250217:md
Date: Mon, 17 Feb 2025 10:18:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This logic is almost never called as the only possible failures are
- no memory to allocate the pagetable (if it isn't already allocated)
  this is fixed in this patch serie by ensuring that the pagetable is allocated
  when entering this function
- EILSEQ when there is a race condtion with hardware, which should not happen under
  normal circonstances

Remove this logic to simplify the error management of the function.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/vtd/iommu.c | 20 --------------------
 xen/drivers/passthrough/vtd/vtd.h   |  3 +--
 2 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 55562084fc..852994cf97 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1621,26 +1621,6 @@ int domain_context_mapping_one(
     if ( !seg && !rc )
         rc = me_wifi_quirk(domain, bus, devfn, domid, pgd_maddr, mode);
 
-    if ( rc && !(mode & MAP_ERROR_RECOVERY) )
-    {
-        if ( !prev_dom ||
-             /*
-              * Unmapping here means DEV_TYPE_PCI devices with RMRRs (if such
-              * exist) would cause problems if such a region was actually
-              * accessed.
-              */
-             (prev_dom == dom_io && !pdev) )
-            ret = domain_context_unmap_one(domain, iommu, bus, devfn);
-        else
-            ret = domain_context_mapping_one(prev_dom, ctx, iommu, bus, devfn, pdev,
-                                             prev_dom->domain_id,
-                                             iommu_default_context(prev_dom)->arch.vtd.pgd_maddr,
-                                             (mode & MAP_WITH_RMRR) |
-                                             MAP_ERROR_RECOVERY) < 0;
-
-        if ( !ret && pdev && pdev->devfn == devfn )
-            check_cleanup_domid_map(domain, pdev, iommu);
-    }
 
     if ( prev_dom )
         rcu_unlock_domain(prev_dom);
diff --git a/xen/drivers/passthrough/vtd/vtd.h b/xen/drivers/passthrough/vtd/vtd.h
index b95124517b..72aa9a70c9 100644
--- a/xen/drivers/passthrough/vtd/vtd.h
+++ b/xen/drivers/passthrough/vtd/vtd.h
@@ -28,8 +28,7 @@
  */
 #define MAP_WITH_RMRR         (1u << 0)
 #define MAP_OWNER_DYING       (1u << 1)
-#define MAP_ERROR_RECOVERY    (1u << 2)
-#define UNMAP_ME_PHANTOM_FUNC (1u << 3)
+#define UNMAP_ME_PHANTOM_FUNC (1u << 2)
 
 /* Allow for both IOAPIC and IOSAPIC. */
 #define IO_xAPIC_route_entry IO_APIC_route_entry
-- 
2.47.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

