Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B0D89BFC9
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 15:02:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701953.1096630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtodi-0001zI-AC; Mon, 08 Apr 2024 13:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701953.1096630; Mon, 08 Apr 2024 13:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtodi-0001wa-6f; Mon, 08 Apr 2024 13:02:22 +0000
Received: by outflank-mailman (input) for mailman id 701953;
 Mon, 08 Apr 2024 13:02:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MFGa=LN=bounce.vates.tech=bounce-md_30504962.6613eadc.v1-a3802b0a34d545169485f79ab33fff0c@srs-se1.protection.inumbo.net>)
 id 1rtodh-0001Ba-8n
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 13:02:21 +0000
Received: from mail177-6.suw61.mandrillapp.com
 (mail177-6.suw61.mandrillapp.com [198.2.177.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bf99a28-f5a8-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 15:02:20 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-6.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4VCq4X2hWGz2K1ttS
 for <xen-devel@lists.xenproject.org>; Mon,  8 Apr 2024 13:02:20 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a3802b0a34d545169485f79ab33fff0c; Mon, 08 Apr 2024 13:02:20 +0000
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
X-Inumbo-ID: 3bf99a28-f5a8-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1712581340; x=1712841840;
	bh=nCr/dQ7MOvz4AtUAz90cOrY6iTnWRg80lBBHOoVQiPc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hSZXAVC6IirS3MMUs7cOjAbhOVYpnI7RrQu17ul5SuEcYktNz8yxGCBmKNFNeRNXv
	 98kC/Cs7fN0Y4NRcG0kOtlsp7yVjVl3UGMaEsuVv+1YMpj0pbKuiCdqrbJnmqIbo0v
	 uFgAjiDoyZBlR3/b68B8TsgCDLBqVG5iAJGlUdzMgAjK9YShDUJgx4gpHk5DmQ6zKe
	 8KTi+udlN0eihp3vrd448BB3NTT7jol1OTPBs3DTyPKs4+8HuLiO/VSw5M4OmWSb5N
	 D0vrvi5dpHb9bL9OmhSYMEVd05lhG7m//60c3qKXrISrbX8k5xIECuRi/jMfr2NAi2
	 +3fRgVH/wl4AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1712581340; x=1712841840; i=teddy.astie@vates.tech;
	bh=nCr/dQ7MOvz4AtUAz90cOrY6iTnWRg80lBBHOoVQiPc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=m7xAmt2QSFYru2Wp0XMobiPlRPmmJSPCVlm4j6phcKLPmWYgNdslduMxuF+BaDinS
	 mR+/31IQ97caHtcGB6PjFUfpCU1lZNN3qTBCQSc2Q3fI/RhCD4YFPyCHxqmlWHTlyM
	 Uz2epdGoR0csT7l1xjbqL+VQ1LN22PytPVyrV6APVxD+rw6PR5pWA8Ruhp6RDFPpLI
	 SA7JvYU4G9tTEkLYOBsmbE2kh8FFR+NyJG1CtVt99r4vBZHc44su/2sS+y6DIbILLv
	 6O0xSBp/yYZ8GcWQgaOtREMIVTgxyNWCHf7jUjBHtd2ZOBGz4FWAgQqXstFCOuW3DH
	 9kFsCrQnAoPGA==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v2=203/3]=20VT-d:=20Cleanup=20MAP=5FSINGLE=5FDEVICE=20and=20related=20code?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1712581337631
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Message-Id: <aa25e23417145c6819b34728900c904b99cb8a59.1712580356.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1712580356.git.teddy.astie@vates.tech>
References: <cover.1712580356.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a3802b0a34d545169485f79ab33fff0c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240408:md
Date: Mon, 08 Apr 2024 13:02:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This flag was only used in case cx16 is not available, as those code paths no
longer exist, this flag now does basically nothing.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
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

