Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166F589BFCA
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 15:02:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701952.1096620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtodh-0001ji-2T; Mon, 08 Apr 2024 13:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701952.1096620; Mon, 08 Apr 2024 13:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtodg-0001gu-V5; Mon, 08 Apr 2024 13:02:20 +0000
Received: by outflank-mailman (input) for mailman id 701952;
 Mon, 08 Apr 2024 13:02:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XFnD=LN=bounce.vates.tech=bounce-md_30504962.6613eada.v1-e3ed585cd2d543d1b303d19dc598241b@srs-se1.protection.inumbo.net>)
 id 1rtodg-0001Ba-3S
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 13:02:20 +0000
Received: from mail177-6.suw61.mandrillapp.com
 (mail177-6.suw61.mandrillapp.com [198.2.177.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ad6ff3b-f5a8-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 15:02:19 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-6.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4VCq4V2ZQPz2K1s5n
 for <xen-devel@lists.xenproject.org>; Mon,  8 Apr 2024 13:02:18 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e3ed585cd2d543d1b303d19dc598241b; Mon, 08 Apr 2024 13:02:18 +0000
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
X-Inumbo-ID: 3ad6ff3b-f5a8-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1712581338; x=1712841838;
	bh=lmg1wvOs/uJDwssyenqKN9R0+t8h06cxEawQnlJOsho=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=IVb48SzPIFuwyzGHykv5/PkMcXkPLRe2ovW0Ttf7dHs3ERv9oTpUxfys0k6Tj3R25
	 J1A4xf3jl7GP5L15YKQDv2hfydwnkUGlNQXSHfbIFK9p3s77uU5mg8NRFxWKBSCswn
	 f3YSlKjUrHnI8BXu6eIxANRmnd+P5ErMgDeHcQQjRnVrJFqKnBBJmxaGZpz1q8HgCx
	 M+Nu9DR1hKnrdv6Ifen6sMEradDLCW0x2WH5y2RyQf6wM0Em2Hmwqe7IzoFKXdhZq8
	 0z9Mp79nYjFGKa70C7zLKkCLAMmuaKO/uj1vngRapfHbiWr5jirgUpOwHDMGRYeZuP
	 AXbkcp08jVVLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1712581338; x=1712841838; i=teddy.astie@vates.tech;
	bh=lmg1wvOs/uJDwssyenqKN9R0+t8h06cxEawQnlJOsho=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=MC6Xlx3/AJ9bGIKjcLXCrESsQx73xqIin/09TWI6gTDikG4Q54MxXLncT6g96vP/N
	 HHrAmkbRpIxs+6ce1y4H/OxSnNAEFBH0QhXqV10nKBLKnyYDrEjg0FrSgXpS+M6nyx
	 sfLsbHUKSlW7ppOpgZjQgHqB+3N9dSzTGnhdwhuYT3fDZXZXy+W5iLL4l528QHXe88
	 aH0sGVMAtGpopjDZEF4Wqj44U4y1zeLYoET68C2jwzl+oFSOR0CevP2hzTCcQdaOQt
	 0Wqhqxhf9uYhRs3E/mQf5iMPTswHfuBF7c5WznkfSU5raEqQwHu33L7jmRCU7RY0Ui
	 HAfq6V2p+QWxA==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v2=202/3]=20AMD-Vi:=20Disable=20IOMMU=20if=20cx16=20isn't=20supported?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1712581335662
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Message-Id: <80112e79fe7f5c27e685c98f95462b4912770682.1712580356.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1712580356.git.teddy.astie@vates.tech>
References: <cover.1712580356.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e3ed585cd2d543d1b303d19dc598241b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240408:md
Date: Mon, 08 Apr 2024 13:02:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

No hardware has AMD-Vi support while not having cx16 support, disable IOMMU
in this case to avoid potentially buggy code.

Now that IOMMU is only enabled if cx16 is supported, drop dead code that
handles cases where cx16 isn't supported.

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

