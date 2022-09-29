Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBBE5EF6AC
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 15:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413794.657695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odtfN-000656-ML; Thu, 29 Sep 2022 13:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413794.657695; Thu, 29 Sep 2022 13:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odtfN-00060z-JI; Thu, 29 Sep 2022 13:33:29 +0000
Received: by outflank-mailman (input) for mailman id 413794;
 Thu, 29 Sep 2022 13:33:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OnIM=2A=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1odtfM-00060d-QC
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 13:33:29 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c300216-3ffb-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 15:33:27 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7111E5C0129;
 Thu, 29 Sep 2022 09:33:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 29 Sep 2022 09:33:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 09:33:25 -0400 (EDT)
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
X-Inumbo-ID: 4c300216-3ffb-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1664458406; x=1664544806; bh=6HSOENZNpW
	S8PT5EAsCWrJ5UsVb56LeYD/1s5PWTopw=; b=JgffH9L3iodrpb6r9ox9HtxaTR
	RctI/YHNwFjgye6EwqqiNRu48qS0vUJYie+QuCanG6/IIKeLwp6fgFuxgPY0bbfm
	wemK5EN6QhaBWJYb7c5BOjlEjZl5hey16d987dvvN1sNWy/a5ARARYhionAkqFKe
	fSvmFpc3ws/OJ2JHe3qvdTjN7eCe+rCj23QlfMzXgh7NYGDZGwOCZ9KBEP8CEa10
	9bd15nBeZ/RLCrF/+T87Ns4r35fxg8nByc42In4NERrjtcIQ+neVQOp2d9DTBXNP
	xLIioQXjy1ZPhsjKt7SG1R856zZadb1+h+tx7MYywrYUt0CC6CteMkp7BfSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664458406; x=
	1664544806; bh=6HSOENZNpWS8PT5EAsCWrJ5UsVb56LeYD/1s5PWTopw=; b=f
	6WbqKIpDEHWE+YijzWQawVUCRhfQ8psn8+9ai1IwJGc4vfpslmI9kpk5OMQ9aNvv
	uqaERAnjRtok6bOveRxqKFxIpTs5aLthT+46YTj8iQzt6l7Sk87OudrfxfrZW5aO
	qkfdq/EGEkjRkSWtuHPSSzB1ENvz9HcT43mrLVrSr4DcdTFvlPhCTLhVhomBC2Y5
	maK0jZeLTRmkREwErkkNdI6Aaq1NvDofgj3lwcNHJyqvccizjnGbWnZ+xd/q5fRr
	3pcFjFFDW2n1AlHcYO5LoBNSGw2ToQ3ETa1G3nvDf9VIUwF8M/IlphHbF9T5V5WU
	JXbeZ/ULIrp1UnfF/ulEw==
X-ME-Sender: <xms:pp41Y6xPjinsFpifOHRzkXR0JMbAJyS_cH5nRgiNYUf5CDW_TDSUdA>
    <xme:pp41Y2SQsm8dImiPZdnjHs4iS8VqBns7AWAdXlpUJjaAqMJx_fwneR7h7BMICwhmo
    X0uXyZo6SPHvA>
X-ME-Received: <xmr:pp41Y8WqUch6BITiFsFsTXv1AyTVOA_8kQXHPVfTtpP40MLqcZ9pKHcANNw_TN8eMjjg-wsAS6iSCJ2U3rRP43jrmUK3kALc89W0mkrVkOB0iZaKo-THXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:pp41YwggsjJH6caJ4t80uMbO6tptAvTlzdyl_7-aJXkEMO9MA3kFhg>
    <xmx:pp41Y8CXQlJLOuGaTGbSxDDT2tJ7SgedTJN3zhGAZji1Rkl8BvPcgA>
    <xmx:pp41YxK5l8Bgcz2IwIR12MWSRYTDm5hu0Vj74wObcSMYu2tTN0HrFg>
    <xmx:pp41Y3p7Xb1L6747m-H2e3hsDcW-E5w4rkk2987V3FLw_wFwRPNTEA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v8 1/2] IOMMU/VT-d: wire common device reserved memory API
Date: Thu, 29 Sep 2022 15:33:12 +0200
Message-Id: <ecee2217151efd08b2bae58166efcdd319ec82c8.1664458360.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.9762b1190a6fd8f0232c26cbace1b2c4f8555818.1664458360.git-series.marmarek@invisiblethingslab.com>
References: <cover.9762b1190a6fd8f0232c26cbace1b2c4f8555818.1664458360.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Re-use rmrr= parameter handling code to handle common device reserved
memory.

Move MAX_USER_RMRR_PAGES limit enforcement to apply only to
user-configured ranges, but not those from internal callers.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
Changes in v8:
- move add_one_user_rmrr() function earlier
- extend commit message
Changes in v3:
- make MAX_USER_RMRR_PAGES applicable only to user-configured RMRR
---
 xen/drivers/passthrough/vtd/dmar.c | 196 +++++++++++++++++-------------
 1 file changed, 114 insertions(+), 82 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
index 367304c8739c..78c8bad1515a 100644
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -861,113 +861,136 @@ static struct user_rmrr __initdata user_rmrrs[MAX_USER_RMRR];
 
 /* Macro for RMRR inclusive range formatting. */
 #define ERMRRU_FMT "[%lx-%lx]"
-#define ERMRRU_ARG(eru) eru.base_pfn, eru.end_pfn
+#define ERMRRU_ARG base_pfn, end_pfn
 
-static int __init add_user_rmrr(void)
+/* Returns 1 on success, 0 when ignoring and < 0 on error. */
+static int __init add_one_user_rmrr(unsigned long base_pfn,
+                                    unsigned long end_pfn,
+                                    unsigned int dev_count,
+                                    uint32_t *sbdf)
 {
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
     {
-        base = user_rmrrs[i].base_pfn;
-        end = user_rmrrs[i].end_pfn;
+        printk(XENLOG_ERR VTDPREFIX
+               "Invalid RMRR Range "ERMRRU_FMT"\n",
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
+static int __init add_user_rmrr(void)
+{
+    unsigned int i;
+    int ret;
 
+    for ( i = 0; i < nr_rmrr; i++ )
+    {
+        ret = add_one_user_rmrr(user_rmrrs[i].base_pfn,
+                                user_rmrrs[i].end_pfn,
+                                user_rmrrs[i].dev_count,
+                                user_rmrrs[i].sbdf);
+        if ( ret < 0 )
+            return ret;
+    }
     return 0;
 }
 
+static int __init cf_check add_one_extra_rmrr(xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt)
+{
+    u32 sbdf_array[] = { id };
+    return add_one_user_rmrr(start, start+nr, 1, sbdf_array);
+}
+
+static int __init add_extra_rmrr(void)
+{
+    return iommu_get_extra_reserved_device_memory(add_one_extra_rmrr, NULL);
+}
+
 #include <asm/tboot.h>
 /* ACPI tables may not be DMA protected by tboot, so use DMAR copy */
 /* SINIT saved in SinitMleData in TXT heap (which is DMA protected) */
@@ -1010,7 +1033,7 @@ int __init acpi_dmar_init(void)
     {
         iommu_init_ops = &intel_iommu_init_ops;
 
-        return add_user_rmrr();
+        return add_user_rmrr() || add_extra_rmrr();
     }
 
     return ret;
@@ -1108,6 +1131,15 @@ static int __init cf_check parse_rmrr_param(const char *str)
         else
             end = start;
 
+        if ( (end - start) >= MAX_USER_RMRR_PAGES )
+        {
+            printk(XENLOG_ERR VTDPREFIX
+                    "RMRR range "ERMRRU_FMT" exceeds "\
+                    __stringify(MAX_USER_RMRR_PAGES)" pages\n",
+                    start, end);
+            return -E2BIG;
+        }
+
         user_rmrrs[nr_rmrr].base_pfn = start;
         user_rmrrs[nr_rmrr].end_pfn = end;
 
-- 
git-series 0.9.1

