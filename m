Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D26608A4EB8
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 14:17:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706125.1103192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwLGE-000738-C0; Mon, 15 Apr 2024 12:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706125.1103192; Mon, 15 Apr 2024 12:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwLGE-0006x9-76; Mon, 15 Apr 2024 12:16:34 +0000
Received: by outflank-mailman (input) for mailman id 706125;
 Mon, 15 Apr 2024 12:16:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=73UA=LU=bounce.vates.tech=bounce-md_30504962.661d1a9c.v1-76c1b1f5afb645dab066be61273b0aca@srs-se1.protection.inumbo.net>)
 id 1rwLGC-0006Sb-K2
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 12:16:32 +0000
Received: from mail145-16.atl61.mandrillapp.com
 (mail145-16.atl61.mandrillapp.com [198.2.145.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd3dd77f-fb21-11ee-b908-491648fe20b8;
 Mon, 15 Apr 2024 14:16:30 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-16.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4VJ5kN3c36z8XRt03
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 12:16:28 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 76c1b1f5afb645dab066be61273b0aca; Mon, 15 Apr 2024 12:16:28 +0000
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
X-Inumbo-ID: fd3dd77f-fb21-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713183388; x=1713443888;
	bh=sMGoHoVGbP7Qy7MkWN2iK9K6d7d7gexdPaWo2on0a1c=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KzzGEhegveDaeiTGgoeXGg+dPBsltLt76hyczkdN3PNQ/MEhwoecclNdYNncAfuG/
	 jLYe3sIoljv6ztptFwIzNlOK4JxB4f/CG1qEvtGK5LYKWfKoBtDLc0vFfBuo89l6uS
	 rUe2nGlDco/p4RbGZyp5tFYnTx+pNwh1tNhv2Tz+9aD2Bl33n3a8lVqmINysY3vBzo
	 A0Ye/QyNoXdsPqaAw/EE5xjZH19/+J4vy0c5QgyOGYew+P5uewligMcWTpLjqL+1WP
	 Z4Xjdx5szzFG12/tStu3OV1bUz0a58tRmWhlKantQJii7wk6OR0Mlx644rJIRuQizC
	 LU2c6qNlM1wsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713183388; x=1713443888; i=teddy.astie@vates.tech;
	bh=sMGoHoVGbP7Qy7MkWN2iK9K6d7d7gexdPaWo2on0a1c=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mkL8Ez9Jous7q8NJSw2rwxYryhuAlCuYTHx9tJgyYgC00E/rc1Cf+A0UXUO1mWnuH
	 0yjymdb83KJTCUffjpbcIUUE2mSK1Gb2QqP64AciQ9XPkjOvCfdlUzHdoQyOo5XbPa
	 6ckdIBY/3MUldQBm01R9CzlSw2Tn7PfF4ZqIP7U1SZA/zgPylqp2X/XUMHhy3JSVto
	 81oSoPs0jgZYjtefNAkC9MSiuxEwRGb43OdiRiDzFR53FDPtE1/v/dpXHAOAVOXViE
	 aofqdKJQbZlzhSqAAlK0RKsQzdhwRUlR+yaVDFHHP+FyDGXP8gxhQRafKmdBja19d6
	 6siWdcv93AOKw==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v4=201/5]=20VT-d:=20Disable=20IOMMU=20if=20cx16=20isn't=20supported?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713183386062
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-Id: <4d229d23a0d4ece607e0d0b9f685c1e5e7a19c95.1713174878.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1713174878.git.teddy.astie@vates.tech>
References: <cover.1713174878.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.76c1b1f5afb645dab066be61273b0aca?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240415:md
Date: Mon, 15 Apr 2024 12:16:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

All hardware with VT-d has CMPXCHG16B support. Check this at initialisation
time, and remove the effectively-dead logic for the non-cx16 case.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/vtd/iommu.c | 73 ++++++++++-------------------
 1 file changed, 25 insertions(+), 48 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index c7110af7c9..9c787ba9eb 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1482,7 +1482,7 @@ int domain_context_mapping_one(
 {
     struct domain_iommu *hd = dom_iommu(domain);
     struct context_entry *context, *context_entries, lctxt;
-    __uint128_t old;
+    __uint128_t res, old;
     uint64_t maddr;
     uint16_t seg = iommu->drhd->segment, prev_did = 0;
     struct domain *prev_dom = NULL;
@@ -1580,55 +1580,23 @@ int domain_context_mapping_one(
         ASSERT(!context_fault_disable(lctxt));
     }
 
-    if ( cpu_has_cx16 )
-    {
-        __uint128_t res = cmpxchg16b(context, &old, &lctxt.full);
-
-        /*
-         * Hardware does not update the context entry behind our backs,
-         * so the return value should match "old".
-         */
-        if ( res != old )
-        {
-            if ( pdev )
-                check_cleanup_domid_map(domain, pdev, iommu);
-            printk(XENLOG_ERR
-                   "%pp: unexpected context entry %016lx_%016lx (expected %016lx_%016lx)\n",
-                   &PCI_SBDF(seg, bus, devfn),
-                   (uint64_t)(res >> 64), (uint64_t)res,
-                   (uint64_t)(old >> 64), (uint64_t)old);
-            rc = -EILSEQ;
-            goto unlock;
-        }
-    }
-    else if ( !prev_dom || !(mode & MAP_WITH_RMRR) )
-    {
-        context_clear_present(*context);
-        iommu_sync_cache(context, sizeof(*context));
+    res = cmpxchg16b(context, &old, &lctxt.full);
 
-        write_atomic(&context->hi, lctxt.hi);
-        /* No barrier should be needed between these two. */
-        write_atomic(&context->lo, lctxt.lo);
-    }
-    else /* Best effort, updating DID last. */
+    /*
+     * Hardware does not update the context entry behind our backs,
+     * so the return value should match "old".
+     */
+    if ( res != old )
     {
-         /*
-          * By non-atomically updating the context entry's DID field last,
-          * during a short window in time TLB entries with the old domain ID
-          * but the new page tables may be inserted.  This could affect I/O
-          * of other devices using this same (old) domain ID.  Such updating
-          * therefore is not a problem if this was the only device associated
-          * with the old domain ID.  Diverting I/O of any of a dying domain's
-          * devices to the quarantine page tables is intended anyway.
-          */
-        if ( !(mode & (MAP_OWNER_DYING | MAP_SINGLE_DEVICE)) )
-            printk(XENLOG_WARNING VTDPREFIX
-                   " %pp: reassignment may cause %pd data corruption\n",
-                   &PCI_SBDF(seg, bus, devfn), prev_dom);
-
-        write_atomic(&context->lo, lctxt.lo);
-        /* No barrier should be needed between these two. */
-        write_atomic(&context->hi, lctxt.hi);
+        if ( pdev )
+            check_cleanup_domid_map(domain, pdev, iommu);
+        printk(XENLOG_ERR
+                "%pp: unexpected context entry %016lx_%016lx (expected %016lx_%016lx)\n",
+                &PCI_SBDF(seg, bus, devfn),
+                (uint64_t)(res >> 64), (uint64_t)res,
+                (uint64_t)(old >> 64), (uint64_t)old);
+        rc = -EILSEQ;
+        goto unlock;
     }
 
     iommu_sync_cache(context, sizeof(struct context_entry));
@@ -2630,6 +2598,15 @@ static int __init cf_check vtd_setup(void)
     int ret;
     bool reg_inval_supported = true;
 
+    if ( unlikely(!cpu_has_cx16) )
+    {
+        printk(XENLOG_ERR VTDPREFIX
+               "IOMMU: CPU doesn't support CMPXCHG16B, disabling\n");
+
+        ret = -ENODEV;
+        goto error;
+    }
+
     if ( list_empty(&acpi_drhd_units) )
     {
         ret = -ENODEV;
-- 
2.44.0



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

