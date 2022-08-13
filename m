Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F95459183A
	for <lists+xen-devel@lfdr.de>; Sat, 13 Aug 2022 03:40:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386023.621933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7d-0002e0-4S; Sat, 13 Aug 2022 01:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386023.621933; Sat, 13 Aug 2022 01:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7c-0002Vj-SE; Sat, 13 Aug 2022 01:39:28 +0000
Received: by outflank-mailman (input) for mailman id 386023;
 Sat, 13 Aug 2022 01:39:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRGa=YR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oMg7a-0000pU-NV
 for xen-devel@lists.xenproject.org; Sat, 13 Aug 2022 01:39:26 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c33da7a2-1aa8-11ed-924f-1f966e50362f;
 Sat, 13 Aug 2022 03:39:25 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id D85805C00C5;
 Fri, 12 Aug 2022 21:39:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 12 Aug 2022 21:39:24 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 21:39:24 -0400 (EDT)
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
X-Inumbo-ID: c33da7a2-1aa8-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660354764; x=1660441164; bh=CFew235jgq
	1Bpcgaw8qOFpTlwBPLlNuYoSmc12fF7k4=; b=p5nSfz8yK1HDowUBvO2anQqvlL
	Tnk+MkZQ8ZllIgxWvVQENDS41Og+mtvxOQD7VCMYw2DfJWFIMFVaU7QASIFgoXRu
	EwPbRHMEe9RBy/x9PVseaplQhkSk9hTsm3IEehRIprMnPVpxqaU1UjqB5mR7V94c
	yiKiwtsyn28/50OxI6ZdlRNuYdbgVkEG0Rrq54OagkuajpGO3D85ULFmP/S+mSko
	F6K6y66Z0xtQGNh+xDUv1mU3e5x5WX0X43VTWPPLrKaVQevtMMUUUIWdTm234lAR
	mOglSDarFeNvEEd2UlEZ5jY8VLxSYuqMtDdl45gcQ/43uMgIvBgpHUOgU7AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660354764; x=
	1660441164; bh=CFew235jgq1Bpcgaw8qOFpTlwBPLlNuYoSmc12fF7k4=; b=l
	Dlbk1vTaY6rnMIn74NbS7SS89iUR5xoulnBwPJhOhwkmCS7ZT7woMMDNBJOcwYez
	1OKnJQZDOSmKJfyPvRNRJTpyDRyc1h62Bujkz+p8hi+P1NCNUw4Z5khQSG/GbiqS
	bVGCLG5WUnAdrMYzpeWj8Hz7ToTLaZIO4RMBfB1O5Ru5XnvJFosdoutFCrR8IPYU
	x6ndQWqlyHd+AbyTiVUWyWiQyTSzK/JQhWHY1qNbZKcSEHA8MkSFirQglP67oTiS
	xuYGo0IBXvw/vysrTUIKBnzu/y2klVfktYwiPkSJZK56KybO3S8XQ4j74BGd1GDq
	fGMNgoqG1IqX/AwJZGVRg==
X-ME-Sender: <xms:zAD3YiXDMXR7ay5wK93uspIQ7taUb40k6Knp5bi-C0BW4C4SsdHXog>
    <xme:zAD3YulwlXJwBXWbxsSe6R8yk3j6XpnbxhdEVA2ZpMxeyx76Rat3AmWy0DPrhRgF7
    GfBmHhR1AwZfw>
X-ME-Received: <xmr:zAD3YmbBPilxQwd6t9hY_p83nnVjt2qOcTQY4tomZI6A_4U_zkcwi2RMImK_XuLAUgIj0eUafdk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegjedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:zAD3YpVoZfRttn5iOpvtzPfhP0VDAogbeQ3P0ZAazLYNHnUUNZJNlA>
    <xmx:zAD3YskpwwZv_9rRbLiKBA-V9TZi3JyCnd0uYtfF5rbIUgmmJN0RVg>
    <xmx:zAD3Yuf81YzsaOvKWjW4Y0-dGn58PqtNSmXiorD3iwFmXoU2a5oMNw>
    <xmx:zAD3YjtlQMHrc6Zb8uS1lRdMW_xQ3WWoyqOATb0bOlGv1tgskkHlfQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v4 07/11] IOMMU/VT-d: wire common device reserved memory API
Date: Sat, 13 Aug 2022 03:38:57 +0200
Message-Id: <e0351406e1cb41460aa050c542bcd24b22a66cd7.1660354597.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
References: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Re-use rmrr= parameter handling code to handle common device reserved
memory.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v3:
- make MAX_USER_RMRR_PAGES applicable only to user-configured RMRR
---
 xen/drivers/passthrough/vtd/dmar.c | 201 +++++++++++++++++-------------
 1 file changed, 119 insertions(+), 82 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
index 367304c8739c..3df5f6b69719 100644
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -861,111 +861,139 @@ static struct user_rmrr __initdata user_rmrrs[MAX_USER_RMRR];
 
 /* Macro for RMRR inclusive range formatting. */
 #define ERMRRU_FMT "[%lx-%lx]"
-#define ERMRRU_ARG(eru) eru.base_pfn, eru.end_pfn
+#define ERMRRU_ARG base_pfn, end_pfn
+
+static int __init add_one_user_rmrr(unsigned long base_pfn,
+                                    unsigned long end_pfn,
+                                    unsigned int dev_count,
+                                    uint32_t *sbdf);
 
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
+                                    uint32_t *sbdf)
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
@@ -1010,7 +1038,7 @@ int __init acpi_dmar_init(void)
     {
         iommu_init_ops = &intel_iommu_init_ops;
 
-        return add_user_rmrr();
+        return add_user_rmrr() || add_extra_rmrr();
     }
 
     return ret;
@@ -1108,6 +1136,15 @@ static int __init cf_check parse_rmrr_param(const char *str)
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

