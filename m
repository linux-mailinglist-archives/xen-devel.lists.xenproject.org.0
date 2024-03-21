Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C95885791
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 11:41:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696306.1087168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFrU-0003ms-M2; Thu, 21 Mar 2024 10:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696306.1087168; Thu, 21 Mar 2024 10:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFrU-0003fv-Gy; Thu, 21 Mar 2024 10:41:28 +0000
Received: by outflank-mailman (input) for mailman id 696306;
 Thu, 21 Mar 2024 10:28:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=06Wg=K3=bounce.vates.tech=bounce-md_30504962.65fc0bcb.v1-4bf5dabb9933448fb19a3bb31f6c8228@srs-se1.protection.inumbo.net>)
 id 1rnFex-0007vj-Hi
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 10:28:31 +0000
Received: from mail179-23.suw41.mandrillapp.com
 (mail179-23.suw41.mandrillapp.com [198.2.179.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1c6ba1d-e76d-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 11:28:29 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-23.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4V0hWH34BNz35hmZb
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 10:28:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4bf5dabb9933448fb19a3bb31f6c8228; Thu, 21 Mar 2024 10:28:27 +0000
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
X-Inumbo-ID: c1c6ba1d-e76d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1711016907; x=1711277407;
	bh=HdgIKxPjdc3u8Z26L+lDF+6ART3gkpF8tDbHa+2flGw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hevxefiKTH4GmIB1XFzm1KIp10A4MDtR1pWk52jDDDEZrgXlMxsPOtNDx5cPliMiq
	 4HAKa7iwK0/QVGeW4xMxwbE8jRX2NA08l5yVUpEMvtY30vP8WsTpkvUb6hU91b57oR
	 WXX2dpCX+unxiDcJ9cCO3NgbWJBa1eYvdSwDQClA9wnSCPuuCsJu9AG5OwiIvYlFcu
	 grDPWjh7Fijcs5t+0z4vztnk3cVU4MynYleOekcv1HCsBHQqs4WMGvVpC8uqnRcs//
	 jQ5qqY6gMOq6rrYyDXPXR0GNokOnTrWr9dIabEvr7JeWiLHh0rHFpWpYx6kHbvDv35
	 AIKmJ2Ld7YFkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1711016907; x=1711277407; i=teddy.astie@vates.tech;
	bh=HdgIKxPjdc3u8Z26L+lDF+6ART3gkpF8tDbHa+2flGw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Y6M+VqQ8Z6IIIrJA048roxjZ/wbg/Z8m/mYqIYEDHPedv+9Iqp59ucYX81f2Ck5Ep
	 7SQCrFrvbtSAEfzEOm0+pRDY3F2cTxw0NdRjWCuD2SqeBSexsffdnyAQYfzumBx+vX
	 1EnE61auAMUo1dV672xQU9Fax2hn37jK3dvd5x4mNW79DrkpVts8rdr7I0eKT1EfOB
	 vKXwXHuMWHryWiKBRuKzFOhZFF5PdMnwuhb2JXfOBb4EuAHzynczF2VOUzVNi4YF4C
	 VE5cqdVke/4d275rD/vOiT1lNFadfCTbnhYv7sVRzThSGMIMsXB8svflJNRQZA06BL
	 AbBXNuSTOhmXA==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=203/3]=20VT-d:=20Cleanup=20MAP=5FSINGLE=5FDEVICE=20and=20related=20dead=20code.?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1711016906361
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Kevin Tian <kevin.tian@intel.com>
Message-Id: <f68e1b0815c61338652015e7874a480a80970870.1711016106.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1711016106.git.teddy.astie@vates.tech>
References: <cover.1711016106.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4bf5dabb9933448fb19a3bb31f6c8228?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240321:md
Date: Thu, 21 Mar 2024 10:28:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This flag was only used in case cx16 is not available, as those code paths no longer exist, this flag now does basically nothing.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/vtd/iommu.c | 12 +++---------
 xen/drivers/passthrough/vtd/vtd.h   |  5 ++---
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 47b56f37a9..4b15e6da79 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1692,15 +1692,9 @@ static int domain_context_mapping(struct domain *domain, u8 devfn,
         break;
     }
 
-    if ( domain != pdev->domain && pdev->domain != dom_io )
-    {
-        if ( pdev->domain->is_dying )
-            mode |= MAP_OWNER_DYING;
-        else if ( drhd &&
-                  !any_pdev_behind_iommu(pdev->domain, pdev, drhd->iommu) &&
-                  !pdev->phantom_stride )
-            mode |= MAP_SINGLE_DEVICE;
-    }
+    if ( domain != pdev->domain && pdev->domain != dom_io &&
+         pdev->domain->is_dying )
+        mode |= MAP_OWNER_DYING;
 
     switch ( pdev->type )
     {
diff --git a/xen/drivers/passthrough/vtd/vtd.h b/xen/drivers/passthrough/vtd/vtd.h
index cb2df76eed..43f06a353d 100644
--- a/xen/drivers/passthrough/vtd/vtd.h
+++ b/xen/drivers/passthrough/vtd/vtd.h
@@ -28,9 +28,8 @@
  */
 #define MAP_WITH_RMRR         (1u << 0)
 #define MAP_OWNER_DYING       (1u << 1)
-#define MAP_SINGLE_DEVICE     (1u << 2)
-#define MAP_ERROR_RECOVERY    (1u << 3)
-#define UNMAP_ME_PHANTOM_FUNC (1u << 4)
+#define MAP_ERROR_RECOVERY    (1u << 2)
+#define UNMAP_ME_PHANTOM_FUNC (1u << 3)
 
 /* Allow for both IOAPIC and IOSAPIC. */
 #define IO_xAPIC_route_entry IO_APIC_route_entry
-- 
2.44.0



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

