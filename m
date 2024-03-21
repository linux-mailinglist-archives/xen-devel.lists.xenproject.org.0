Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E03885793
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 11:41:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696309.1087178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFrV-0003ul-6g; Thu, 21 Mar 2024 10:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696309.1087178; Thu, 21 Mar 2024 10:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFrU-0003n1-R8; Thu, 21 Mar 2024 10:41:28 +0000
Received: by outflank-mailman (input) for mailman id 696309;
 Thu, 21 Mar 2024 10:28:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Er8=K3=bounce.vates.tech=bounce-md_30504962.65fc0bcb.v1-1ab3eb7cf37d49e2920d69fec3c63cc9@srs-se1.protection.inumbo.net>)
 id 1rnFey-0007vj-T9
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 10:28:32 +0000
Received: from mail135-12.atl141.mandrillapp.com
 (mail135-12.atl141.mandrillapp.com [198.2.135.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2ed98ba-e76d-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 11:28:31 +0100 (CET)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-12.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4V0hWH1Pjkz705xhf
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 10:28:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1ab3eb7cf37d49e2920d69fec3c63cc9; Thu, 21 Mar 2024 10:28:27 +0000
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
X-Inumbo-ID: c2ed98ba-e76d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1711016907; x=1711277407;
	bh=UcgkDzCzOUOiX6VvY3JJILSsBP2Bao7DTLrKO5nVeps=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=meB+PneUevspbTzSFXPNB89japidW+EyBe5i5/uY9XH/WP9XfqtiigR/GaSPOygzz
	 oyLm6xylrF4wzdjo7XTKy/24tv0JM0buy2Xkw58DE5/fiLo87c75lgpVeLox9jP5GJ
	 Mdmxdxc8JgOcB4egrZrzqDZl4f28m+XLdCpWGL6BOHxWOIVVYnrk8wsk87MLbDwOaK
	 D33SnHYB+sYN3f5/ST6ge3BRkpLx0BnbI8h0nhRZDNgG1BkjWFcREl2CwYp80h9bNj
	 jRABcYBLOnYieexd91r5vdorWvR71anP3Tr5RKbqisr9XxfMDn+y8quEskVHCcLIqB
	 vp7lGfesbATVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1711016907; x=1711277407; i=teddy.astie@vates.tech;
	bh=UcgkDzCzOUOiX6VvY3JJILSsBP2Bao7DTLrKO5nVeps=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KfF6dPK0WX7L30znmepadvH8riiTA39u0cK24nT/UQG1J2UzgddHd3doC8lDIogLd
	 ZSw8VgzMkqbqS53UDa8yNXIjB9em3kz2Nqtf7DbNyLPq0aYuwEHaCSEtpLwIlKv7cj
	 3hIU26EY1LMZLQCMI8LbRAhacNdoM+ejm1zHXTw1F0QNvoi3ALWGmvaayX2PlDPkYJ
	 wzZifqD5xhEPiEhNXlCwI2uAlbgAYvkt8QoCC+Boo1TFA8k+yApsxJp98BBHwYjxZc
	 P85p14QAft2Gbjp0CODYhvu8TlFQXylmrEasVpATUiSM9agFvfU8W7lQimr+fVKNWf
	 N463shyL/ILOg==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=202/3]=20AMD-Vi:=20Disable=20IOMMU=20if=20cx16=20isn't=20supported?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1711016906041
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-Id: <9c825255af5d3973b29c85cb6856c67b69aa0e4a.1711016106.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1711016106.git.teddy.astie@vates.tech>
References: <cover.1711016106.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1ab3eb7cf37d49e2920d69fec3c63cc9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240321:md
Date: Thu, 21 Mar 2024 10:28:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

No hardware has VT-d support while not having cx16 support, consider disabling IOMMU in this case to avoid potentially buggy code.

Now that IOMMU is only enabled if cx16 is supported, drop dead code that handles cases where cx16 isn't supported.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/amd/iommu_map.c     | 43 +++++++--------------
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  6 +++
 2 files changed, 21 insertions(+), 28 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index e0f4fe736a..c8c1c0cfae 100644
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
@@ -185,33 +184,21 @@ int amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
         ldte.dte.paging_mode = paging_mode;
         ldte.dte.v = valid;
 
-        if ( cpu_has_cx16 )
-        {
-            __uint128_t res = cmpxchg16b(dte, &old, &ldte.raw128[0]);
+    
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
index f6efd88e36..656c5eda5d 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -312,6 +312,12 @@ static int __init cf_check iov_detect(void)
         return -ENODEV;
     }
 
+    if ( unlikely(!cpu_has_cx16) )
+    {
+        printk("AMD-Vi: CPU doesn't support CMPXCHG16B, disabling\n");
+        return -ENOSYS;
+    }
+
     init_done = 1;
 
     if ( !amd_iommu_perdev_intremap )
-- 
2.44.0



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

