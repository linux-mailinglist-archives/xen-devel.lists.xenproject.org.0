Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4964D5AB144
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 15:18:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397606.638278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6YV-0001JU-GW; Fri, 02 Sep 2022 13:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397606.638278; Fri, 02 Sep 2022 13:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6YV-0001BX-A3; Fri, 02 Sep 2022 13:17:55 +0000
Received: by outflank-mailman (input) for mailman id 397606;
 Fri, 02 Sep 2022 13:17:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uHR5=ZF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oU6YT-0000AI-2E
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 13:17:53 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4951c85-2ac1-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 15:17:50 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id BF1135C00F3;
 Fri,  2 Sep 2022 09:17:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 02 Sep 2022 09:17:49 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Sep 2022 09:17:48 -0400 (EDT)
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
X-Inumbo-ID: a4951c85-2ac1-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1662124669; x=1662211069; bh=CFew235jgq
	1Bpcgaw8qOFpTlwBPLlNuYoSmc12fF7k4=; b=XtOZzwiMiVGfW6+CoBAjZ4Uo6X
	tvxpY/LPPAsVsNMRZAAQVyF1bV47FsVpmHd52WN2N6zZB5lvN7I5qSDqHx5qUSIG
	5bEyi02C+QjRHOvbCokzrf7syz/9XoL9dZJwjNcwv+NfIGUK6UvllAdOc0c8Nsss
	sXSvzuHliCX6+5JmucScY/DLtPIwmUAoBcxUiH9PVILegPza8jiPZmIW8a/G4EVU
	bkCYDKZIjbXoR/Uc5ILk9vfzWLgvd87+M6wwN26om6dunIyqpg5SXyiplKAp0jZJ
	SBPha4bTMCh3639cJ36SLA0k3AHZeESTRgGQh0UZ9l6ezEryB5lU0N2veT9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1662124669; x=
	1662211069; bh=CFew235jgq1Bpcgaw8qOFpTlwBPLlNuYoSmc12fF7k4=; b=4
	JAZKhhsAkNrCxSv//GVGt+/ktf+0G3DOthLxxNvX8+qjHV60ywWSjTP+Tvk1zcD4
	reVd6UUeGzFzk5Xt3a0OV6G+l1rPKcGhAZRoGjwuoUp7rHesEOlp7S5YpqW2Ir/M
	Me8x4E6VlgUSeYeks1xHXsgH3EPIxsHGmL8FeGliTcYpOBrZsZ1kwVH4uW+icukI
	4QEpWwFV4pRybLnP8M7V3K7vvlgYGx8kF57tlGA6IdEaang70g17S7PTsdLW2rqz
	Xw/4DGKtMDI1zoc+mP3wmp/OHBhz3dGXCopY//gp6eDyxhMbNhNFNrjj/y1eBiOw
	Ybgt74Y5aWhBkpOfTxTzg==
X-ME-Sender: <xms:fQISY07mFYdcnd_LBPsF5htOGpFmFZeGpy5Qp0C5C2YP74uj-zEK9Q>
    <xme:fQISY14_G23oxKn3vOdf013jCv01sc5pS9fhsspSm-LV4C31j9PsYXipDabtCKaON
    YOjJ0Y_QHhYkQ>
X-ME-Received: <xmr:fQISYzfHkNUJ8wNzn-ej-mz-r06bEct0cJTCRP51U5ZxGk63fXCLIfGLNKbxTugW5ZY8tzH3itXywzCAkD21JHrfeAJs7BYD6k3xpotwzXk5VpmMrT6WoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeltddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:fQISY5KoN597WBVycfy3EdGO9zTzj5rR2JSidTjXM74rjjJoKeiKkg>
    <xmx:fQISY4K2AQsZBSN4SjX-LUdbiliqUwv9Vg1073k2_8MqYjVMVRViBg>
    <xmx:fQISY6wdcrZraGPA2IJDxzsjtt1uCRtsles8H2zExivvCrsLHGjRMQ>
    <xmx:fQISYyz0pI8mQOLlAPknvWzNywkc4qgFBhJ5Rtp_xi4k8aktkGT3Ug>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v6 04/10] IOMMU/VT-d: wire common device reserved memory API
Date: Fri,  2 Sep 2022 15:17:25 +0200
Message-Id: <5cf39b7b1990a8b1e8fe679cb46a4d5ec7ee3034.1662124370.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
References: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
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

