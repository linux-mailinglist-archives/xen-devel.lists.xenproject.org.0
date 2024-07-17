Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E7F934008
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 17:52:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760040.1169755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU6wI-0002ko-AW; Wed, 17 Jul 2024 15:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760040.1169755; Wed, 17 Jul 2024 15:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU6wI-0002j3-61; Wed, 17 Jul 2024 15:51:34 +0000
Received: by outflank-mailman (input) for mailman id 760040;
 Wed, 17 Jul 2024 15:51:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DLSD=OR=bounce.vates.tech=bounce-md_30504962.6697e880.v1-4e3fd89483f24370a40264ad4a06ba88@srs-se1.protection.inumbo.net>)
 id 1sU6wG-0002ix-UY
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 15:51:33 +0000
Received: from mail136-18.atl41.mandrillapp.com
 (mail136-18.atl41.mandrillapp.com [198.2.136.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6edfdc50-4454-11ef-bbfd-fd08da9f4363;
 Wed, 17 Jul 2024 17:51:30 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-18.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4WPL5X6B9gzB5pCjZ
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2024 15:51:28 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4e3fd89483f24370a40264ad4a06ba88; Wed, 17 Jul 2024 15:51:28 +0000
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
X-Inumbo-ID: 6edfdc50-4454-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1721231488; x=1721491988;
	bh=zSidZJjTBmvIyK5wwOQ2bPK/xV9ITMue+D/D4EbPXlU=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=ZhF1S2HOx+Oc14HhBnRjxK01msqlU+RNIO/VFWuJP4eeW7axYCSpBe7K1nBCzVm82
	 sMgYt2h0HNUbq7f+gklwJp683nccojYwGWwsKLdjHdkrGD75EG06BLv1NKwtTjuJQp
	 Dvrj/e4pKbB/y70aQkTxi8/MLQWV0a7NtOIdmlyH3mDztPDXaeanBTjY2dxXC7sXSm
	 YdAQXkMZ+WaK9I1U8fl3UY8qtLqXZgd5vSx+9xwYKLH3MHkxjaWnPIrQhQBNORaLA0
	 Q6EsvstsZ/jl0oGLsP/CDynFmmhz9Q0ScY9Rpg9qG+KrPU7G8R2MSeZI/0lDMsqtYY
	 SBFdYFTKPfdjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1721231488; x=1721491988; i=teddy.astie@vates.tech;
	bh=zSidZJjTBmvIyK5wwOQ2bPK/xV9ITMue+D/D4EbPXlU=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=oqI05zSAtj/6T3oUu2SWtTyzKczaPXjUOlW6r5Ox1t4sFs8kyqfib4n7LQtqZuxzt
	 fnPqeNcd7gNZFYRnJ+gXo+XPtbQI3YOebs+JIrd1iyMwvONJZ1a8QnWyB0VOoEV9Jj
	 mTwaRL/8pbrLwkL3gf7HASEqafyPUW4qsbCQFL0ptC33QevCWnClnp1p5DC932pz4z
	 B3kDHS76JV2Q7wKyo1v8FdY+aUeprFCAxO57WbK83h6ToMbz+a0W8mVxTBO6ALt81y
	 NEKHCwHrZ380FZDnQBwA0lK/4BJHAJs8t+KEj3WR8xxj+Fs37xwVGRMPJGOFTcq0d1
	 D6/KNJ3umV1Xw==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20for-4.19=3F]=20x86/IOMMU:=20Move=20allocation=20in=20iommu=5Fidentity=5Fmapping?=
X-Mailer: git-send-email 2.45.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1721231488178
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Message-Id: <20240717155136.140303-1-teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4e3fd89483f24370a40264ad4a06ba88?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240717:md
Date: Wed, 17 Jul 2024 15:51:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

If for some reason, xmalloc fails after having mapped the
reserved regions, a error is reported, but the regions are
actually mapped in p2m.

Move the allocation before trying to map the regions, in
case the allocation fails, no mapping is actually done
which could allows this operation to be retried with the
same regions without failing due to already existing mappings.

Fixes: c0e19d7c6c ("IOMMU: generalize VT-d's tracking of mapped RMRR regions")
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/x86/iommu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index cc0062b027..b6bc6d71cb 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -267,18 +267,22 @@ int iommu_identity_mapping(struct domain *d, p2m_access_t p2ma,
     if ( p2ma == p2m_access_x )
         return -ENOENT;
 
+    map = xmalloc(struct identity_map);
+    if ( !map )
+        return -ENOMEM;
+
     while ( base_pfn < end_pfn )
     {
         int err = set_identity_p2m_entry(d, base_pfn, p2ma, flag);
 
         if ( err )
+        {
+            xfree(map);
             return err;
+        }
         base_pfn++;
     }
 
-    map = xmalloc(struct identity_map);
-    if ( !map )
-        return -ENOMEM;
     map->base = base;
     map->end = end;
     map->access = p2ma;
-- 
2.45.2



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

