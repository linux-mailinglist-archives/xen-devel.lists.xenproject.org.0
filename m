Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F85C73A26
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 12:10:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166862.1493338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2Y4-0002x4-22; Thu, 20 Nov 2025 11:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166862.1493338; Thu, 20 Nov 2025 11:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2Y3-0002sU-TJ; Thu, 20 Nov 2025 11:09:59 +0000
Received: by outflank-mailman (input) for mailman id 1166862;
 Thu, 20 Nov 2025 11:09:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5t6=54=bounce.vates.tech=bounce-md_30504962.691ef704.v1-d71239346bcd49868e89efb5fc5acd64@srs-se1.protection.inumbo.net>)
 id 1vM2Y1-0001PI-OX
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 11:09:57 +0000
Received: from mail128-17.atl41.mandrillapp.com
 (mail128-17.atl41.mandrillapp.com [198.2.128.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72b87bbb-c601-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 12:09:57 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4dBwc46VMbzCf9PPb
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 11:09:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d71239346bcd49868e89efb5fc5acd64; Thu, 20 Nov 2025 11:09:56 +0000
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
X-Inumbo-ID: 72b87bbb-c601-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763636996; x=1763906996;
	bh=IB8SiWp3cnHfGEHVz8f7L6lwm7yItLzdTN6a/r1KsBo=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fwPCa3hu2hOsSHeXJ4nMj7oVo3/TXVVHKUlnrxC3A8y3Cb8LhFPP/saDmj8UwFqiS
	 XDfoYnZDJ6R1vbkCu9hTbZ71yN8NAEs4VvUxgy9OLpL9IPLWI3mV6lysBLy7hzwS1u
	 PCtzIQIiJZpwo810F/LV3hys0KDVcaNQfLayYNyd/Q7IxF3awrnoO1NWk4njp9Yws3
	 PbuJqyJhyDtQ1rKGfqdOTxNLdIKc7Wk/pn8/Md6POMum2w3weYrSH57tKrp9iHnsTr
	 J5YU305sczW5PCIIa8nNB8r06DQ7AaMlHdH02VNrqP5epDLD7QRWjf8J8l602xk9iQ
	 sozRMLicDu8AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763636996; x=1763897496; i=teddy.astie@vates.tech;
	bh=IB8SiWp3cnHfGEHVz8f7L6lwm7yItLzdTN6a/r1KsBo=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1dXOugXmB9ixtIA5mLfGYMcvAuO0IQ823Ep53dWgvJEcdGxV7EXvmrD9FKyIU6g5V
	 e+QjMhuubAKjBKqTnzKWd1s3x7rbzx425P4kNjdXIYry7Ja+goWBWQwKwb3yPYyq55
	 sPEl30pE+3Vca9kZi3hrzYUCSSzOCGBv3PRzG6uafraD3ZG5T4hI4cRsogszRen1wL
	 9pg4SJ2UU+Or4dxpuuX4aQluLkTkW++jjE3g0X/GqjLTeygzTfIDxm6LGvFEhhFYM8
	 jCmq1vPd2ZicwB2kuOiTfkvEZfq+GU0MOLiKCS6OLMJuv0iVdPeDWrmcwwRvc3A3eY
	 lC5yjDaR9E21A==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v7=2006/14]=20vtd:=20Remove=20MAP=5FERROR=5FRECOVERY=20code=20path=20in=20domain=5Fcontext=5Fmapping=5Fone?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763636996032
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <149e3a765a5a55792be7af0a4d9c0ca9fb5098c6.1763569135.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1763569135.git.teddy.astie@vates.tech>
References: <cover.1763569135.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d71239346bcd49868e89efb5fc5acd64?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251120:md
Date: Thu, 20 Nov 2025 11:09:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This logic is basically never called as the only possible failures are
- no memory to allocate the pagetable (if it isn't already allocated)
  this is fixed in this patch serie by ensuring that the pagetable is allocated
  when entering this function
- EILSEQ when there is a race condtion with hardware, which should not happen under
  normal circonstances

Remove this logic to simplify the error management of the function.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
This is fairly similar to [1], although we don't check for -EILSEQ.
Such failures can happen through me_wifi_quirk which can recursively
calls domain_context_mapping_one.

[1] https://lore.kernel.org/xen-devel/b0e81bd67c3f135a4102d12ed95a52ce56482992.1762961527.git.teddy.astie@vates.tech/
---
 xen/drivers/passthrough/vtd/iommu.c | 20 --------------------
 xen/drivers/passthrough/vtd/vtd.h   |  3 +--
 2 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index f269fca9bf..986b05b9dd 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1627,26 +1627,6 @@ int domain_context_mapping_one(
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
index f0286b40c3..0178214929 100644
--- a/xen/drivers/passthrough/vtd/vtd.h
+++ b/xen/drivers/passthrough/vtd/vtd.h
@@ -28,8 +28,7 @@
  */
 #define MAP_WITH_RMRR         (1u << 0)
 #define MAP_OWNER_DYING       (1u << 1)
-#define MAP_ERROR_RECOVERY    (1u << 2)
-#define UNMAP_ME_PHANTOM_FUNC (1u << 3)
+#define UNMAP_ME_PHANTOM_FUNC (1u << 2)
 
 struct IO_APIC_route_remap_entry {
     union {
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


