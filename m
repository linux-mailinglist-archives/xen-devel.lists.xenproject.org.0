Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA30659C2B3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 17:27:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391472.629343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9L0-00045O-Rb; Mon, 22 Aug 2022 15:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391472.629343; Mon, 22 Aug 2022 15:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9L0-000435-N2; Mon, 22 Aug 2022 15:27:38 +0000
Received: by outflank-mailman (input) for mailman id 391472;
 Mon, 22 Aug 2022 15:27:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YSJC=Y2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oQ9Kz-0003Dm-7m
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 15:27:37 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f28729ce-222e-11ed-bd2e-47488cf2e6aa;
 Mon, 22 Aug 2022 17:27:36 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 69A0C3200A53;
 Mon, 22 Aug 2022 11:27:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Aug 2022 11:27:34 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Aug 2022 11:27:33 -0400 (EDT)
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
X-Inumbo-ID: f28729ce-222e-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1661182053; x=1661268453; bh=CFew235jgq
	1Bpcgaw8qOFpTlwBPLlNuYoSmc12fF7k4=; b=o/NyVVyxQsKSvsIwwHbm86kFAI
	JuFzawp8i1NDqsNOPB/+wFkaojCVyqdtGvZnAT1YYh1yHoZfiYBxJn/8hPrSpdi9
	cP6yd4BE3c7Za7w1w676D2jE7yHFUYs8ug2x4DHX0csgbMpfsNp9W7K4LG7tDHhq
	iUX9gvU/ZBKiTPsA5X77WavXzf4khTexvjzPlX0NEgjGBxytB3W0lzrHTi0HdeQ/
	WAhyNVwAAUi2W/JT3oq6pbMgS66oOmMA1N7f6fIQzDsR1c5RqzaJ8BpPKGZ2M0f+
	HgpD9AMK4u1DaOT1gQwZXjLHVCndJRozr/HH9Ikp0EBfDZ8XU23joDQJUEqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661182053; x=
	1661268453; bh=CFew235jgq1Bpcgaw8qOFpTlwBPLlNuYoSmc12fF7k4=; b=n
	1FeZ1iIpaZ5G+/yaA+86taF2ZTger+q0FMxQ4/8AiHpTb21Qrc1ve6jpL6+Fnkbw
	2I4It26jx+xyK2BJC/5A5ioY7ierIntrZCyEu6YJGDkbeQQhKFTpo1uSil0rfS98
	pT177fw6pqrexAkb4FuA4H9zz1ZMaqEV7YhwV/oDfgVBTIOtywHM/4X0W2KfMHdu
	dyRC148Jj7Q8qzFlcZPd5lYl/v0gXL5vHJoV/VW1suZeSwD78vZfQKEu846AKGMs
	Qdcx/RHJI+V40/U0ZMoRNITNgJWNKcZAWmm+t5jnTUSEumCAcF+rUhhDptatLw/a
	4TD/XVRATPnS4qVrCUnHA==
X-ME-Sender: <xms:ZaADY1aCJt2UTwwH9qVAQ7ZVkpFbEkp9q6OFrwD6RbIjNImRQDtyeg>
    <xme:ZaADY8bevMXj_Bum3R3evtu_RNCFI_jp33gv5z0apDV0j61lYQqQOmEkNc4gYw5ur
    yVYXLcnYDWH9w>
X-ME-Received: <xmr:ZaADY38WeeucEoloa3c3UTOp7g_YXIOYof1urxxfurU18oM9mdidm9Xngai3kXiy_6_mwU1pgEWszoTTNycZMEZQqUAXt6aFqF06JzN_z63k9Uy1nbGqxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeijedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ZaADYzoavDDyKvU4pChAECkuj-DHWidSwSAiGsbaIUbBWvFRhlKZmg>
    <xmx:ZaADYwoLY3WY3zmVkz1U-PKy576ZvhsknBuudyVdPxFyTJol5LXLKw>
    <xmx:ZaADY5RLNVGC3oqCb7G2SQONsEeneeBeuaMBxjJWzvggiFG6PFW9zA>
    <xmx:ZaADY3TkPNkzrmyk_PzV5zXqVsXNZ-nwDEi7ACWOiOZkfw23dYTj9Q>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v5 4/9] IOMMU/VT-d: wire common device reserved memory API
Date: Mon, 22 Aug 2022 17:27:04 +0200
Message-Id: <85675b8ddc09661b92f089459431f59081b4b1bc.1661181584.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
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

