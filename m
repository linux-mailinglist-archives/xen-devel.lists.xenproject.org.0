Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4D1C53150
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:38:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160077.1488302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCv2-0007xk-NJ; Wed, 12 Nov 2025 15:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160077.1488302; Wed, 12 Nov 2025 15:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCv2-0007vO-KL; Wed, 12 Nov 2025 15:38:00 +0000
Received: by outflank-mailman (input) for mailman id 1160077;
 Wed, 12 Nov 2025 15:37:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zpN+=5U=bounce.vates.tech=bounce-md_30504962.6914a9d3.v1-ca881e3520284e09af5a0d4a5edb2e05@srs-se1.protection.inumbo.net>)
 id 1vJCv1-0007vC-3g
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 15:37:59 +0000
Received: from mail136-17.atl41.mandrillapp.com
 (mail136-17.atl41.mandrillapp.com [198.2.136.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fdb73a7-bfdd-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 16:37:57 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4d66x00Lp0zPm0XnY
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 15:37:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ca881e3520284e09af5a0d4a5edb2e05; Wed, 12 Nov 2025 15:37:55 +0000
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
X-Inumbo-ID: 8fdb73a7-bfdd-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762961876; x=1763231876;
	bh=J9x4ke0xLc2x3x8APrrN6CRsBsF1UIlxpCMJLxJb3Gg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bobo2YqkI0DN8lMnubvtH1DhxBMTxBW1NrqIN7Lmp0AJPCJPs+6F0c78+p2oxCmbS
	 2TM+11FnYMk5iLKgSq+yFhTZ6HKKxpG+U8WmarnxO7H+sC4635ODuOiq4hl/BWT2yw
	 mIitzn23mvugWJoW8BTvtSIpQsYdrSZXW4zYAFUXoKmzUE5UgoID5tT8oDzTu2Ud3H
	 5H4IIJFuaL8F5SV5x5ln1sHfY4DRKLk8HAhAgOmFX8YC/fmfl+QKFeDF/RSVDh6mXT
	 XPosCKqZCOHhi08fAp+q7YXJLBKFFn8RqrDmeK6JIMVYPkQr81XqHKPqoInPsyJNUW
	 mYvTghtoe2sPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762961876; x=1763222376; i=teddy.astie@vates.tech;
	bh=J9x4ke0xLc2x3x8APrrN6CRsBsF1UIlxpCMJLxJb3Gg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Shcu5diDseLfdZWVYNHW0OzCuKA6bHs4szVgFdQq5vHIdxo8Gtq0enZ3W0g8+43cJ
	 ODwph8ONPm5R+yXvZFya7gG6ne+lV6wrpkcdXx9a2Wtk91jAtBcz/99jgY/oEUzom7
	 y3PKVYiaAjiszWAse8A8l4TaPEwdbTsxiydjCw7gGfJogb1J0k9yibw1QfuQsA8NdJ
	 axExwtIx7F3X7iC68muDARKne+CZlEm+70O9L5L2fKDlGM4rQ2WAXsP4+P8ukkGWHQ
	 E+3mELp47+ZlSefKHEMu9QPo1EcJ8pwQs2qT8jwfjb0rSCLOP+8XFDnxWWwzjOce/Y
	 Si74+KyEynDrg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=201/2]=20amd/iommu:=20Always=20atomically=20update=20DTE?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762961874465
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>
Message-Id: <a14812d39743f5f49614d099bdac6720bf7c4fae.1762961527.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1762961527.git.teddy.astie@vates.tech>
References: <cover.1762961527.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ca881e3520284e09af5a0d4a5edb2e05?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251112:md
Date: Wed, 12 Nov 2025 15:37:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

amd_iommu_set_root_page_table chooses between updating atomically
and non-atomically depending on whether the DTE is active or not.

This choice existed mostly because cx16 wasn't supposed always available
until [1]. Thus we don't need to threat the non-atomic path in a special
way anymore.

By rearranging slightly the atomic path, we can make it cover all the cases
which improves the code generation at the expense of systematically performing
cmpxchg16b.

Also remove unused raw64 fields of ldte, and the deprecated comment as the
function actually behaves in a more usual way and can't return >0.

[1] 2636fcdc15c7 "x86/iommu: check for CMPXCHG16B when enabling IOMMU"

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/amd/iommu_map.c | 78 ++++++++-----------------
 1 file changed, 25 insertions(+), 53 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index 320a2dc64c..e3165d93aa 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -154,69 +154,41 @@ static void set_iommu_ptes_present(unsigned long pt_mfn,
     unmap_domain_page(table);
 }
 
-/*
- * This function returns
- * - -errno for errors,
- * - 0 for a successful update, atomic when necessary
- * - 1 for a successful but non-atomic update, which may need to be warned
- *   about by the caller.
- */
 int amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
                                   uint64_t root_ptr, uint16_t domain_id,
                                   uint8_t paging_mode, unsigned int flags)
 {
     bool valid = flags & SET_ROOT_VALID;
 
-    if ( dte->v && dte->tv )
-    {
-        union {
-            struct amd_iommu_dte dte;
-            uint64_t raw64[4];
-            __uint128_t raw128[2];
-        } ldte = { .dte = *dte };
-        __uint128_t res, old = ldte.raw128[0];
-        int ret = 0;
-
-        ldte.dte.domain_id = domain_id;
-        ldte.dte.pt_root = paddr_to_pfn(root_ptr);
-        ldte.dte.iw = true;
-        ldte.dte.ir = true;
-        ldte.dte.paging_mode = paging_mode;
-        ldte.dte.v = valid;
-
-        res = cmpxchg16b(dte, &old, &ldte.raw128[0]);
-
-        /*
-         * Hardware does not update the DTE behind our backs, so the
-         * return value should match "old".
-         */
-        if ( res != old )
-        {
-            printk(XENLOG_ERR
-                   "Dom%d: unexpected DTE %016lx_%016lx (expected %016lx_%016lx)\n",
-                   domain_id,
-                   (uint64_t)(res >> 64), (uint64_t)res,
-                   (uint64_t)(old >> 64), (uint64_t)old);
-            ret = -EILSEQ;
-        }
+    union {
+        struct amd_iommu_dte dte;
+        __uint128_t raw128[2];
+    } ldte = { .dte = *dte };
+    __uint128_t res, old = ldte.raw128[0];
 
-        return ret;
-    }
+    ldte.dte.domain_id = domain_id;
+    ldte.dte.pt_root = paddr_to_pfn(root_ptr);
+    ldte.dte.iw = true;
+    ldte.dte.ir = true;
+    ldte.dte.paging_mode = paging_mode;
+    ldte.dte.tv = true;
+    ldte.dte.v = valid;
+
+    res = cmpxchg16b(dte, &old, &ldte.raw128[0]);
 
-    if ( valid || dte->v )
+    /*
+     * Hardware does not update the DTE behind our backs, so the
+     * return value should match "old".
+     */
+    if ( res != old )
     {
-        dte->tv = false;
-        dte->v = true;
-        smp_wmb();
+        printk(XENLOG_ERR
+                "Dom%d: unexpected DTE %016lx_%016lx (expected %016lx_%016lx)\n",
+                domain_id,
+                (uint64_t)(res >> 64), (uint64_t)res,
+                (uint64_t)(old >> 64), (uint64_t)old);
+        return -EILSEQ;
     }
-    dte->domain_id = domain_id;
-    dte->pt_root = paddr_to_pfn(root_ptr);
-    dte->iw = true;
-    dte->ir = true;
-    dte->paging_mode = paging_mode;
-    smp_wmb();
-    dte->tv = true;
-    dte->v = valid;
 
     return 0;
 }
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


