Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430FF8A2E5D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 14:34:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704625.1101114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvG6S-0001OJ-Bf; Fri, 12 Apr 2024 12:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704625.1101114; Fri, 12 Apr 2024 12:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvG6S-0001Mb-8j; Fri, 12 Apr 2024 12:34:00 +0000
Received: by outflank-mailman (input) for mailman id 704625;
 Fri, 12 Apr 2024 12:33:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w6Y+=LR=bounce.vates.tech=bounce-md_30504962.66192a35.v1-82de3dd6d8ef4c49b3ea33e9723b2d06@srs-se1.protection.inumbo.net>)
 id 1rvG6Q-0000fM-PI
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 12:33:58 +0000
Received: from mail145-16.atl61.mandrillapp.com
 (mail145-16.atl61.mandrillapp.com [198.2.145.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee74e3b4-f8c8-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 14:33:58 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-16.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4VGGFx0QRMz8XRrnB
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 12:33:57 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 82de3dd6d8ef4c49b3ea33e9723b2d06; Fri, 12 Apr 2024 12:33:57 +0000
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
X-Inumbo-ID: ee74e3b4-f8c8-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1712925237; x=1713185737;
	bh=9ykuAdbMKy74rZD6sLaRZCYwlByVWGFeq5PPj63HahY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ITM/LjJr0K9tk830oAu3h18fj6J+i3TjZOs4MIN9kleT/moD/BJ2LkIGkT7+DgBmK
	 mX3yUZThvFQhNmIpmSwaDnAs+f2rd2NZ3wW8eXmmNcRDVQndR7jRskZrO7w6EbSo8z
	 h+ERPa6w0Ld6ZcSslQyZn7wOME18OzU7smlf1Kcd6jzKrM0NxnNA3bEXYEZ0LCkCae
	 eGu2R6Qp8DsHJyYmpAMXX4szbxrp//A0gl0HTYgm2BpRZGCH/x/6SqA9ol2u0DLdBU
	 xT59gZj2RAiMl6P+OQxukjGtMJphmzzDU3vU2AjxaessAS1XX4AYfXWaF0siF2MwID
	 dnFRVHQnZMrvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1712925237; x=1713185737; i=teddy.astie@vates.tech;
	bh=9ykuAdbMKy74rZD6sLaRZCYwlByVWGFeq5PPj63HahY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Venni2eWYrmoL5ckwa+oZNXCJpBpv5KL/baHE/ZyFFonzRY13/pfp7XXFIM+fnu5R
	 yGWJUA/H4wQei47JlRc8kTCYx6ecd+PaFvY9pK6C6eEpRQWHh9KOeELm7HSFVAXUwj
	 XJ0Q0KKFQX2rzTgRQ/flal/mXUSdIf3hsMWRj9WouDL6Ym+u63bpmWgANL5R5cC0U1
	 1Yjziq1kIZx9N6nhub6kBnRI81TcCX5jiSPpTZpc6hUQyjvVouwgsPrG0ublDmWpph
	 rO9htNGOFOECqZpmLLX/IFYpFhccYwmMCOM7GG32mvjdOg8Cmpclt4t6T/HwRoYfBY
	 CB8YdCaqU9LLw==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v3=202/3]=20AMD-Vi:=20Disable=20IOMMU=20if=20cx16=20isn't=20supported?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1712925233452
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Message-Id: <d669d8237d61bbb3f09f846ab9b065be84cab125.1712915011.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1712915011.git.teddy.astie@vates.tech>
References: <cover.1712915011.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.82de3dd6d8ef4c49b3ea33e9723b2d06?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240412:md
Date: Fri, 12 Apr 2024 12:33:57 +0000
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
index f6efd88e36..a213dbea0b 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -312,6 +312,12 @@ static int __init cf_check iov_detect(void)
         return -ENODEV;
     }
 
+    if ( unlikely(!cpu_has_cx16) )
+    {
+        printk("AMD-Vi: CPU doesn't support CMPXCHG16B, disabling\n");
+        return -ENODEV;
+    }
+
     init_done = 1;
 
     if ( !amd_iommu_perdev_intremap )
-- 
2.44.0



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

