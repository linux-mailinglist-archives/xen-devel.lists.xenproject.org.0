Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCFE8A4EB7
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 14:17:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706127.1103215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwLGG-0007gs-32; Mon, 15 Apr 2024 12:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706127.1103215; Mon, 15 Apr 2024 12:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwLGF-0007cq-VD; Mon, 15 Apr 2024 12:16:35 +0000
Received: by outflank-mailman (input) for mailman id 706127;
 Mon, 15 Apr 2024 12:16:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=28no=LU=bounce.vates.tech=bounce-md_30504962.661d1a9b.v1-bdf670edfcd74494a0a1568848e67be1@srs-se1.protection.inumbo.net>)
 id 1rwLGE-0006tb-IR
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 12:16:34 +0000
Received: from mail145-16.atl61.mandrillapp.com
 (mail145-16.atl61.mandrillapp.com [198.2.145.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd3bc35b-fb21-11ee-94a3-07e782e9044d;
 Mon, 15 Apr 2024 14:16:30 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-16.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4VJ5kM3bNpz8XRtln
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 12:16:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 bdf670edfcd74494a0a1568848e67be1; Mon, 15 Apr 2024 12:16:27 +0000
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
X-Inumbo-ID: fd3bc35b-fb21-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713183387; x=1713443887;
	bh=RRod8nx7vQ+DrBaq1mB+2iQAFOffxbEGL4R3xb8mHC8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GSJUHtN2i4nhoX29yCMABYqzwrKKDs/yaoOmcpEiR53Z3FpPs+J1q7Mgag9qSOCtC
	 ePfIq8NjXtscDhdK1LrW3+iMoLhtI9xxrvCPKWpnLfDOIoCs/C4L8C05uEc2hIauEr
	 ZekO0K+ek6lWSvlcL5oDthIERcjvJO8oYvHsHZc6VlzX8M/xTooQzjkmBYDFSSX6PR
	 AKn3oRJQD7MGZsozwSJpQMHT9JrAScgXUrY7gx1Gtbn7x2e8PfTrdUxOIKfdiZa6Nt
	 taUM6V/s9AxzJ0ajANlR3Fg2DioEsYj4qlp8RNNVpYOPLddXQiNXnT+qeK73XrAzB2
	 9q1gAzgnw81Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713183387; x=1713443887; i=teddy.astie@vates.tech;
	bh=RRod8nx7vQ+DrBaq1mB+2iQAFOffxbEGL4R3xb8mHC8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fqyN5yuwC0m/N/enB11o7oyguyV0J7Etf9vE3o0BbkSODelsxyVWGOCD4rmisW9iT
	 bgA8VUp3FipV1o7TIC4GEUdIHwqCNJr3xRGS6a2U2bI+3kTuFQWqUOvmD9A4188DeN
	 ERP7zZIAftJvXP88LCiD+rUSiM2cFcR1CiVneXPftlauhFn5tLXVHWpj/XA0G6v/Ae
	 GFLOzjcQO+jbYh0aT6wRkDqwGy3xx7Fs/coggxlGf1KXAEZfC0ARslVCdRj4qLnErG
	 uYGLltLKxlIEPzBhYEg6LbX6IcYiFkfO7l0jhpGA6fFvhVu1q2bbi4HnUZjnQ5Aq6b
	 72CAcele30zzA==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v4=203/5]=20VT-d:=20Cleanup=20MAP=5FSINGLE=5FDEVICE=20and=20related=20code?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713183386723
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>
Message-Id: <43876112df408c6f11fa399337db4f3104a969a2.1713174878.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1713174878.git.teddy.astie@vates.tech>
References: <cover.1713174878.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.bdf670edfcd74494a0a1568848e67be1?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240415:md
Date: Mon, 15 Apr 2024 12:16:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This flag was only used in case cx16 is not available, as those code paths no
longer exist, this flag now does basically nothing.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/vtd/iommu.c | 12 +++---------
 xen/drivers/passthrough/vtd/vtd.h   |  5 ++---
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 9c787ba9eb..7c6bae0256 100644
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

