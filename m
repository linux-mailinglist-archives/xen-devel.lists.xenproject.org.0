Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9F78A2E5E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 14:34:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704626.1101124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvG6V-0001fp-II; Fri, 12 Apr 2024 12:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704626.1101124; Fri, 12 Apr 2024 12:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvG6V-0001dv-FI; Fri, 12 Apr 2024 12:34:03 +0000
Received: by outflank-mailman (input) for mailman id 704626;
 Fri, 12 Apr 2024 12:34:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3O8t=LR=bounce.vates.tech=bounce-md_30504962.66192a36.v1-7f450573211144e0aec62194d55493a9@srs-se1.protection.inumbo.net>)
 id 1rvG6U-0001cV-45
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 12:34:02 +0000
Received: from mail5.us4.mandrillapp.com (mail5.us4.mandrillapp.com
 [205.201.136.5]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef6bb7f3-f8c8-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 14:33:59 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail5.us4.mandrillapp.com (Mailchimp) with ESMTP id 4VGGFy4x2RzDRHxKP
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 12:33:58 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7f450573211144e0aec62194d55493a9; Fri, 12 Apr 2024 12:33:58 +0000
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
X-Inumbo-ID: ef6bb7f3-f8c8-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1712925238; x=1713185738;
	bh=jU9EIjA+Qc+4GFuonLz2lNzv0PHDDy6bVljleTMmQTg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nc8xqp/35GetuhBJQJjPLkLi5tZMDM5mTqP/1CBTduxPpxHIlJjnNlY1rNjvqWciG
	 bBhx1yX6noYaZBoUegxslF3VJAS55GONBjiNIjzY5f0CGRQj8KFBjm2iECXP037DWx
	 Q/1NozbBaxJYbF80rDfF3bxmigkeXMuwZaHvkf5GWulJ+k85X6CycjqKqjM1IDN4OE
	 RxaGvbOGAcs1RxaCl7V9kuMi/61xJS0H/Uz4autL/xE6ydPvIcrzfMC37gZ0ESnYyL
	 n3slKQcSrpqxxkx9YSsblx4G6aSWWRA33AUqBozXV6AIajxtP3QJJayGoDB/558Lke
	 J2chHzpDf9QCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1712925238; x=1713185738; i=teddy.astie@vates.tech;
	bh=jU9EIjA+Qc+4GFuonLz2lNzv0PHDDy6bVljleTMmQTg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=w9XJtm9zyllT/y7qrGykkrvF7yakOvKued0Su6x2MT/S38R5WB+YX+PMsD7iu+/q/
	 xNcHSh2KglsUpe09TJPy3F0baHQ0llhaSuq4UjBkz4E0Kx0Bnky89HdQkaNE4+JEnC
	 sctCXNfTrH5vJBxh/OLH4gN4wAvoXI6YkgcA15auPz8y6CH7IE+tKwNmTk3N2wJ0H9
	 1CU1KiES9YRD44bofE++1Jp8KuYvbSzN9tVr4v5nE+DzygF68dpXOIL5uG6V4RIOma
	 RUVIWQ2b7SRF/UWdsP83YMMaYUqzwZFvRCflqnpoNNmAFn1zM926nhCsOaSGOPy4JU
	 M6LKXNXR5J1EA==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v3=203/3]=20VT-d:=20Cleanup=20MAP=5FSINGLE=5FDEVICE=20and=20related=20code?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1712925235934
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Message-Id: <71875378aca7cbd6a03655c48a741060ff20cf2a.1712915011.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1712915011.git.teddy.astie@vates.tech>
References: <cover.1712915011.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7f450573211144e0aec62194d55493a9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240412:md
Date: Fri, 12 Apr 2024 12:33:58 +0000
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
index ef9380ed6a..a1bd3c5ff6 100644
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

