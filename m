Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2271453E038
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 05:41:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342171.567302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bs-00089x-Ux; Mon, 06 Jun 2022 03:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342171.567302; Mon, 06 Jun 2022 03:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bs-000812-Ku; Mon, 06 Jun 2022 03:40:56 +0000
Received: by outflank-mailman (input) for mailman id 342171;
 Mon, 06 Jun 2022 03:40:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxEH=WN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ny3bq-0006AI-LA
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 03:40:54 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77130317-e54a-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 05:40:53 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CACDB5C0061;
 Sun,  5 Jun 2022 23:40:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 05 Jun 2022 23:40:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Jun 2022 23:40:52 -0400 (EDT)
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
X-Inumbo-ID: 77130317-e54a-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654486852; x=1654573252; bh=evEV0WFYEo
	SI8Y7yrgXC8kLje73u4yjd3P/XL+ndlpo=; b=jmKfYEQRXSaBoyGyjAWh8THlWt
	ptJbuQKMWadP1SntUcRUAnH0ThxD/Buf60iqtrgpDJIFnjaezP9eRttGoJ4J7dtD
	ePiadAXC0EmK4jcf3Ag4O03d1a7izzcEAzjyCSIftnGoh7T8pW2/CMSUpaifutkQ
	HChP6nKlgi8YwaI3hB8sQW95dtEiXTLgd7QjDeJle3zcpRfNa/7GlzOOW1PddmDI
	UaVpnwSR/Y9izc97VBZTalikKbKAn0/RBlAbNwFlosB+X65eOrmnmU6S29NjIYHg
	DcTW1EtSVdGxLUbwl/822LGZA9jS2/kky46TNuGQtlS83v1J14nY4J5mHanA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654486852; x=
	1654573252; bh=evEV0WFYEoSI8Y7yrgXC8kLje73u4yjd3P/XL+ndlpo=; b=k
	l2P84RsPPWV38SKsArP+1S8k4/zLT2OVCv21o7gUF4SBhe4D2yrw8RWnd94KRFTM
	EgFAJ1jlV5qsDKhn/YKSPYeXoOZgU3HNZBrKhvnIduwHNCEzzJ1JpFH8NQFX3FR/
	cYqYW4TB8BfGkspN8aMTqjzfK3FvyDCu4DGEGNFh4Ry4Z9BxhNtX9swLlVg5aUMH
	OxE8hfZrHnyofFNAPN1csOH2SdZ1gueVZC3AJCrRR5DZ/FVowkTstCvwbd3fj9jf
	JZ3sjcrvNbFUlhmfEG3SQ/1BI9AZnbkN/dUhDpIPqeb2KTT5lMC1fhPoIqfRUCVK
	8HEQV/aDa37x3LWA+xQxw==
X-ME-Sender: <xms:RHedYuiDP8j9PiEZlaAcGE3T8B_TEGAebPuypOtOA1SO8aCXGiplzQ>
    <xme:RHedYvC1Y2UFQL0S-rVnUwYqg-tkNeXDkod014z-xyk_7uZdzYT2S19ScPVGTSk_V
    SLZKlTg4llogA>
X-ME-Received: <xmr:RHedYmFvipH6QeZvT-409QghpI18XtWXj5ifjdIv9swDULDwhj6ok5HpnQL-V0E-srmKNVWoKZLofEpSm1VQds2TFF-h6sCk58sGlPr8FCIaxZpmmAM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtuddgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:RHedYnT-UWgnnvkBbhHJ5gzmpkA2PiZ_zYFCh9rCkwu3PVi9C36HIA>
    <xmx:RHedYrxTuXw8OwtiaTnuFdceybjZg_ke8zDqbf329qfZX6pFjN1QQA>
    <xmx:RHedYl4rWlb00izG-xlY-1PjcLTpoB7tULW1QcJWnJ4gYN3hIAcclg>
    <xmx:RHedYpa3Vz5q7_dGHt0tVQ7CWv0_OCEY2o02_x9jsOeOMqANm5eMeA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [RFC PATCH 08/12] IOMMU/VT-d: wire common device reserved memory API
Date: Mon,  6 Jun 2022 05:40:20 +0200
Message-Id: <386e7729069f427c537e2a59eb05f95427504e2e.1654486751.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Re-use rmrr= parameter handling code to handle common device reserved
memory.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/drivers/passthrough/vtd/dmar.c | 201 +++++++++++++++++-------------
 1 file changed, 119 insertions(+), 82 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
index 367304c8739c..661a182b08d9 100644
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -861,111 +861,148 @@ static struct user_rmrr __initdata user_rmrrs[MAX_USER_RMRR];
 
 /* Macro for RMRR inclusive range formatting. */
 #define ERMRRU_FMT "[%lx-%lx]"
-#define ERMRRU_ARG(eru) eru.base_pfn, eru.end_pfn
+#define ERMRRU_ARG base_pfn, end_pfn
+
+static int __init add_one_user_rmrr(unsigned long base_pfn,
+                                    unsigned long end_pfn,
+                                    unsigned int dev_count,
+                                    u32 *sbdf);
 
 static int __init add_user_rmrr(void)
 {
+    unsigned int i;
+    int ret;
+
+    for ( i = 0; i < nr_rmrr; i++ )
+    {
+        ret = add_one_user_rmrr(user_rmrrs[i].base_pfn,
+                                user_rmrrs[i].end_pfn,
+                                user_rmrrs[i].dev_count,
+                                user_rmrrs[i].sbdf);
+        if ( ret < 0 )
+            return ret;
+    }
+    return 0;
+}
+
+/* Returns 1 on success, 0 when ignoring and < 0 on error. */
+static int __init add_one_user_rmrr(unsigned long base_pfn,
+                                    unsigned long end_pfn,
+                                    unsigned int dev_count,
+                                    u32 *sbdf)
+{
     struct acpi_rmrr_unit *rmrr, *rmrru;
-    unsigned int idx, seg, i;
-    unsigned long base, end;
+    unsigned int idx, seg;
+    unsigned long base_iter;
     bool overlap;
 
-    for ( i = 0; i < nr_rmrr; i++ )
+    if ( iommu_verbose )
+        printk(XENLOG_DEBUG VTDPREFIX
+               "Adding RMRR for %d device ([0]: %#x) range "ERMRRU_FMT"\n",
+               dev_count, sbdf[0], ERMRRU_ARG);
+
+    if ( base_pfn > end_pfn )
+    {
+        printk(XENLOG_ERR VTDPREFIX
+               "Invalid RMRR Range "ERMRRU_FMT"\n",
+               ERMRRU_ARG);
+        return 0;
+    }
+
+    if ( (end_pfn - base_pfn) >= MAX_USER_RMRR_PAGES )
     {
-        base = user_rmrrs[i].base_pfn;
-        end = user_rmrrs[i].end_pfn;
+        printk(XENLOG_ERR VTDPREFIX
+               "RMRR range "ERMRRU_FMT" exceeds "\
+               __stringify(MAX_USER_RMRR_PAGES)" pages\n",
+               ERMRRU_ARG);
+        return 0;
+    }
 
-        if ( base > end )
+    overlap = false;
+    list_for_each_entry(rmrru, &acpi_rmrr_units, list)
+    {
+        if ( pfn_to_paddr(base_pfn) <= rmrru->end_address &&
+             rmrru->base_address <= pfn_to_paddr(end_pfn) )
         {
             printk(XENLOG_ERR VTDPREFIX
-                   "Invalid RMRR Range "ERMRRU_FMT"\n",
-                   ERMRRU_ARG(user_rmrrs[i]));
-            continue;
+                   "Overlapping RMRRs: "ERMRRU_FMT" and [%lx-%lx]\n",
+                   ERMRRU_ARG,
+                   paddr_to_pfn(rmrru->base_address),
+                   paddr_to_pfn(rmrru->end_address));
+            overlap = true;
+            break;
         }
+    }
+    /* Don't add overlapping RMRR. */
+    if ( overlap )
+        return 0;
 
-        if ( (end - base) >= MAX_USER_RMRR_PAGES )
+    base_iter = base_pfn;
+    do
+    {
+        if ( !mfn_valid(_mfn(base_iter)) )
         {
             printk(XENLOG_ERR VTDPREFIX
-                   "RMRR range "ERMRRU_FMT" exceeds "\
-                   __stringify(MAX_USER_RMRR_PAGES)" pages\n",
-                   ERMRRU_ARG(user_rmrrs[i]));
-            continue;
+                   "Invalid pfn in RMRR range "ERMRRU_FMT"\n",
+                   ERMRRU_ARG);
+            break;
         }
+    } while ( base_iter++ < end_pfn );
 
-        overlap = false;
-        list_for_each_entry(rmrru, &acpi_rmrr_units, list)
-        {
-            if ( pfn_to_paddr(base) <= rmrru->end_address &&
-                 rmrru->base_address <= pfn_to_paddr(end) )
-            {
-                printk(XENLOG_ERR VTDPREFIX
-                       "Overlapping RMRRs: "ERMRRU_FMT" and [%lx-%lx]\n",
-                       ERMRRU_ARG(user_rmrrs[i]),
-                       paddr_to_pfn(rmrru->base_address),
-                       paddr_to_pfn(rmrru->end_address));
-                overlap = true;
-                break;
-            }
-        }
-        /* Don't add overlapping RMRR. */
-        if ( overlap )
-            continue;
+    /* Invalid pfn in range as the loop ended before end_pfn was reached. */
+    if ( base_iter <= end_pfn )
+        return 0;
 
-        do
-        {
-            if ( !mfn_valid(_mfn(base)) )
-            {
-                printk(XENLOG_ERR VTDPREFIX
-                       "Invalid pfn in RMRR range "ERMRRU_FMT"\n",
-                       ERMRRU_ARG(user_rmrrs[i]));
-                break;
-            }
-        } while ( base++ < end );
+    rmrr = xzalloc(struct acpi_rmrr_unit);
+    if ( !rmrr )
+        return -ENOMEM;
 
-        /* Invalid pfn in range as the loop ended before end_pfn was reached. */
-        if ( base <= end )
-            continue;
+    rmrr->scope.devices = xmalloc_array(u16, dev_count);
+    if ( !rmrr->scope.devices )
+    {
+        xfree(rmrr);
+        return -ENOMEM;
+    }
 
-        rmrr = xzalloc(struct acpi_rmrr_unit);
-        if ( !rmrr )
-            return -ENOMEM;
+    seg = 0;
+    for ( idx = 0; idx < dev_count; idx++ )
+    {
+        rmrr->scope.devices[idx] = sbdf[idx];
+        seg |= PCI_SEG(sbdf[idx]);
+    }
+    if ( seg != PCI_SEG(sbdf[0]) )
+    {
+        printk(XENLOG_ERR VTDPREFIX
+               "Segments are not equal for RMRR range "ERMRRU_FMT"\n",
+               ERMRRU_ARG);
+        scope_devices_free(&rmrr->scope);
+        xfree(rmrr);
+        return 0;
+    }
 
-        rmrr->scope.devices = xmalloc_array(u16, user_rmrrs[i].dev_count);
-        if ( !rmrr->scope.devices )
-        {
-            xfree(rmrr);
-            return -ENOMEM;
-        }
+    rmrr->segment = seg;
+    rmrr->base_address = pfn_to_paddr(base_pfn);
+    /* Align the end_address to the end of the page */
+    rmrr->end_address = pfn_to_paddr(end_pfn) | ~PAGE_MASK;
+    rmrr->scope.devices_cnt = dev_count;
 
-        seg = 0;
-        for ( idx = 0; idx < user_rmrrs[i].dev_count; idx++ )
-        {
-            rmrr->scope.devices[idx] = user_rmrrs[i].sbdf[idx];
-            seg |= PCI_SEG(user_rmrrs[i].sbdf[idx]);
-        }
-        if ( seg != PCI_SEG(user_rmrrs[i].sbdf[0]) )
-        {
-            printk(XENLOG_ERR VTDPREFIX
-                   "Segments are not equal for RMRR range "ERMRRU_FMT"\n",
-                   ERMRRU_ARG(user_rmrrs[i]));
-            scope_devices_free(&rmrr->scope);
-            xfree(rmrr);
-            continue;
-        }
+    if ( register_one_rmrr(rmrr) )
+        printk(XENLOG_ERR VTDPREFIX
+               "Could not register RMMR range "ERMRRU_FMT"\n",
+               ERMRRU_ARG);
 
-        rmrr->segment = seg;
-        rmrr->base_address = pfn_to_paddr(user_rmrrs[i].base_pfn);
-        /* Align the end_address to the end of the page */
-        rmrr->end_address = pfn_to_paddr(user_rmrrs[i].end_pfn) | ~PAGE_MASK;
-        rmrr->scope.devices_cnt = user_rmrrs[i].dev_count;
+    return 1;
+}
 
-        if ( register_one_rmrr(rmrr) )
-            printk(XENLOG_ERR VTDPREFIX
-                   "Could not register RMMR range "ERMRRU_FMT"\n",
-                   ERMRRU_ARG(user_rmrrs[i]));
-    }
+static int __init cf_check add_one_extra_rmrr(xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt)
+{
+    u32 sbdf_array[] = { id };
+    return add_one_user_rmrr(start, start+nr, 1, sbdf_array);
+}
 
-    return 0;
+static int __init add_extra_rmrr(void)
+{
+    return iommu_get_extra_reserved_device_memory(add_one_extra_rmrr, NULL);
 }
 
 #include <asm/tboot.h>
@@ -1010,7 +1047,7 @@ int __init acpi_dmar_init(void)
     {
         iommu_init_ops = &intel_iommu_init_ops;
 
-        return add_user_rmrr();
+        return add_user_rmrr() || add_extra_rmrr();
     }
 
     return ret;
-- 
git-series 0.9.1

