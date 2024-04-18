Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07288A992E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 13:57:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708256.1106963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxQOM-0003cG-SO; Thu, 18 Apr 2024 11:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708256.1106963; Thu, 18 Apr 2024 11:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxQOM-0003a0-PH; Thu, 18 Apr 2024 11:57:26 +0000
Received: by outflank-mailman (input) for mailman id 708256;
 Thu, 18 Apr 2024 11:57:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v+vc=LX=bounce.vates.tech=bounce-md_30504962.66210aa1.v1-f68d84e8813a4a2198022ec68ca0a248@srs-se1.protection.inumbo.net>)
 id 1rxQOL-0003Zj-GU
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 11:57:25 +0000
Received: from mail145-32.atl61.mandrillapp.com
 (mail145-32.atl61.mandrillapp.com [198.2.145.32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d05a2dfb-fd7a-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 13:57:22 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-32.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4VKx8x1nDhzP0JySY
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 11:57:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f68d84e8813a4a2198022ec68ca0a248; Thu, 18 Apr 2024 11:57:21 +0000
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
X-Inumbo-ID: d05a2dfb-fd7a-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713441441; x=1713701941;
	bh=RRod8nx7vQ+DrBaq1mB+2iQAFOffxbEGL4R3xb8mHC8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=2EonAvxCWUy08oOe7MiAB2ptIQVu4ef7UhJvWDWfIy5vLrOnCHzkWXAFv/HVVvgXD
	 NSgNOVbtrQ/IKSJxWVyh+YuiLohEy+Ux/kVdAW0w0uS2FlP+2R9xoRmAz8U+C9BKjl
	 SuZgZRW9dB8Q7GIUAeQPmkqNn0cc08aoBA/tHKxu4Tc4Tx3L3FUOJi+7vykOduaYtH
	 R8odiFlXTdpJHQ8UgnerokLdiEQPOQAHOhKpTExUCImJz8IWuJp0gLrCFqZSyV1Fy9
	 eYN3GgRBWq9Fy7Y2Z1IwZn3mKbyuK12niaMXcsyru9rg4ZBr6Uz+88pfzb7ymy7xFB
	 6x7RByuBYNCmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713441441; x=1713701941; i=teddy.astie@vates.tech;
	bh=RRod8nx7vQ+DrBaq1mB+2iQAFOffxbEGL4R3xb8mHC8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HYzxdGJM78QI8S5hIZ7TWPIUDTdrcg/PUDNGfcQtJL8IXRm7/vKa6rCrE+++4NMxI
	 Fl5jw+FllEKgQIbBMyEK6MwTTPj3B9M7jHx/vKERwpqzYDP1HD1o0T6HJdHnZzk6ZX
	 OfWrfI4y0EPDqfYq9B0oho4jiDsGCEJq8T/j4gCm4dUVYAE/ZBesfDGfCvvTdfDAWm
	 mln0haTuWW9l3Kl7+w8SKvIhWXIGV0DHGKvB9wjvS/srq/3ER541h6UGSWg3F8OZqy
	 60fPqpe6uJIbmXC9Y85vAYhcVT315JMrDEx+OxWT1zlmLSiH7DQA8UME/1nAEXYnKq
	 UPRWFR7aDUQbQ==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v5=202/3]=20VT-d:=20Cleanup=20MAP=5FSINGLE=5FDEVICE=20and=20related=20code?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713441440224
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Message-Id: <12fac50372885315273f09eca00590bea6758288.1713433029.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1713433029.git.teddy.astie@vates.tech>
References: <cover.1713433029.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f68d84e8813a4a2198022ec68ca0a248?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240418:md
Date: Thu, 18 Apr 2024 11:57:21 +0000
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

