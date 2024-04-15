Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E598A8A4EB9
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 14:17:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706123.1103171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwLGB-0006YN-RF; Mon, 15 Apr 2024 12:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706123.1103171; Mon, 15 Apr 2024 12:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwLGB-0006V3-O7; Mon, 15 Apr 2024 12:16:31 +0000
Received: by outflank-mailman (input) for mailman id 706123;
 Mon, 15 Apr 2024 12:16:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KJp3=LU=bounce.vates.tech=bounce-md_30504962.661d1a9b.v1-8426781ae7c74282b1e6f20712725546@srs-se1.protection.inumbo.net>)
 id 1rwLGA-0006Sb-JU
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 12:16:30 +0000
Received: from mail145-16.atl61.mandrillapp.com
 (mail145-16.atl61.mandrillapp.com [198.2.145.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc1438ec-fb21-11ee-b908-491648fe20b8;
 Mon, 15 Apr 2024 14:16:28 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-16.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4VJ5kM28glz8XRtNL
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 12:16:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8426781ae7c74282b1e6f20712725546; Mon, 15 Apr 2024 12:16:27 +0000
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
X-Inumbo-ID: fc1438ec-fb21-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713183387; x=1713443887;
	bh=pVW5u35fq+zXx1B2L8XZPx9h9eXL6mZato+52jJIsMA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yL1Mr6ZTczaYfHsPFN4XTWjm4qiJyRYGH+LI2gzrNgtb21EgaVN1Y2rRD60uqvrP6
	 zz8C8U7lJLww00F+/SovfYm1qU8w40douXQicu3OTLFpRX9GxxzmjQ1s/KSGNCKeoo
	 EAzhTE9IPIAKv9AUSgJI4itExMJZQ7OwxqHhW+4zuJB6yb8r6sNiaR4NU9KVMZ6roz
	 FiHyKL+Nyve6hHOvGR8d3eDqd6LeQ0dl6I+/ZZUFT0H6Bb3kK+wLEfyfBm7CW3jLC4
	 F5oK+RJtV1TGYNUYQ9sshf2B/RCjG2h6sjkofrnyNMKWngIpsWcaevRILa0Fou5bVG
	 /XhOvT+rB37+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713183387; x=1713443887; i=teddy.astie@vates.tech;
	bh=pVW5u35fq+zXx1B2L8XZPx9h9eXL6mZato+52jJIsMA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=UmfWPwzlkKnvKJo1IhUYm6sd2WMBdqKSDOIpv6g0yAro8eN3OeX6++w3tGaPwCfIi
	 B4ow3VSfkEwdhfmC/wDgeckisISoA0sH8QDNNBkroK59GI1VxSOnY5IllsMxftXa+Z
	 aSAQb9G0yoRTM2zY35HNaF6RukpqjZvp2uQYBvsQkuknSCwnI+Ge1eOqqV5XVZGdb6
	 rLIubdMh0XTUBLIkzH64P3mAqRHZCLsCYfkHMip0E9WwFE0kW32VFCn0HU/oBe6tf/
	 dC1qmenMTMs+95YSzCRSbNGwr95ANQjiEf8Yp7TYTwsa+8LAL93m3dfP2/wYyYDTD7
	 bmVrxXhlJxCFQ==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v4=202/5]=20AMD-Vi:=20Disable=20IOMMU=20if=20cx16=20isn't=20supported?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713183386410
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-Id: <e0aaf39452e274efc558086f3636eccaec241e4c.1713174878.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1713174878.git.teddy.astie@vates.tech>
References: <cover.1713174878.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8426781ae7c74282b1e6f20712725546?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240415:md
Date: Mon, 15 Apr 2024 12:16:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

All hardware with AMD-Vi has CMPXCHG16 support. Check this at initialisation
time, and remove the effectively-dead logic for the non-cx16 case.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/amd/iommu_map.c     | 42 +++++++--------------
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  6 +++
 2 files changed, 20 insertions(+), 28 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index e0f4fe736a..f67975e700 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -167,15 +167,14 @@ int amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
 {
     bool valid = flags & SET_ROOT_VALID;
 
-    if ( dte->v && dte->tv &&
-         (cpu_has_cx16 || (flags & SET_ROOT_WITH_UNITY_MAP)) )
+    if ( dte->v && dte->tv )
     {
         union {
             struct amd_iommu_dte dte;
             uint64_t raw64[4];
             __uint128_t raw128[2];
         } ldte = { .dte = *dte };
-        __uint128_t old = ldte.raw128[0];
+        __uint128_t res, old = ldte.raw128[0];
         int ret = 0;
 
         ldte.dte.domain_id = domain_id;
@@ -185,33 +184,20 @@ int amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
         ldte.dte.paging_mode = paging_mode;
         ldte.dte.v = valid;
 
-        if ( cpu_has_cx16 )
-        {
-            __uint128_t res = cmpxchg16b(dte, &old, &ldte.raw128[0]);
+        res = cmpxchg16b(dte, &old, &ldte.raw128[0]);
 
-            /*
-             * Hardware does not update the DTE behind our backs, so the
-             * return value should match "old".
-             */
-            if ( res != old )
-            {
-                printk(XENLOG_ERR
-                       "Dom%d: unexpected DTE %016lx_%016lx (expected %016lx_%016lx)\n",
-                       domain_id,
-                       (uint64_t)(res >> 64), (uint64_t)res,
-                       (uint64_t)(old >> 64), (uint64_t)old);
-                ret = -EILSEQ;
-            }
-        }
-        else /* Best effort, updating domain_id last. */
+        /*
+         * Hardware does not update the DTE behind our backs, so the
+         * return value should match "old".
+         */
+        if ( res != old )
         {
-            uint64_t *ptr = (void *)dte;
-
-            write_atomic(ptr + 0, ldte.raw64[0]);
-            /* No barrier should be needed between these two. */
-            write_atomic(ptr + 1, ldte.raw64[1]);
-
-            ret = 1;
+            printk(XENLOG_ERR
+                   "Dom%d: unexpected DTE %016lx_%016lx (expected %016lx_%016lx)\n",
+                   domain_id,
+                   (uint64_t)(res >> 64), (uint64_t)res,
+                   (uint64_t)(old >> 64), (uint64_t)old);
+            ret = -EILSEQ;
         }
 
         return ret;
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index f6efd88e36..3a6a23f706 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -305,6 +305,12 @@ static int __init cf_check iov_detect(void)
     if ( !iommu_enable && !iommu_intremap )
         return 0;
 
+    if ( unlikely(!cpu_has_cx16) )
+    {
+        printk("AMD-Vi: CPU doesn't support CMPXCHG16B, disabling\n");
+        return -ENODEV;
+    }
+
     if ( (init_done ? amd_iommu_init_late()
                     : amd_iommu_init(false)) != 0 )
     {
-- 
2.44.0



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

