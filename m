Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20129245506
	for <lists+xen-devel@lfdr.de>; Sun, 16 Aug 2020 02:22:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k76Pp-0006to-Vi; Sun, 16 Aug 2020 00:20:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wo2=B2=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1k76Po-0006tj-NE
 for xen-devel@lists.xenproject.org; Sun, 16 Aug 2020 00:20:49 +0000
X-Inumbo-ID: 50649bde-563c-4c89-9910-90e2b66bf571
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50649bde-563c-4c89-9910-90e2b66bf571;
 Sun, 16 Aug 2020 00:20:47 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B568C510;
 Sat, 15 Aug 2020 20:20:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 15 Aug 2020 20:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=A0mrph
 MNQJCIq8PAlAuE6KRh99jtx5MpPqdv/o0PurU=; b=FVsjzKBaVYthGLFB9Wz2lx
 bZkwMhC/GNcdlUM4IvbhMHFkDZI2Q/I9QuBeNDZN429u2QcHqr8N3D5e2gd95RVS
 MdCNs9H265X5gE42M3CjOVhdHApfdvuKDMMkWc80lUo1dwrTbWzCClECGfefoByF
 KY7SZas/foU7HgFpiouN81fQB4HUEOokQKkewIBUj7bC8+614oHP6Ii18GFW44GA
 cbiSJyXrpLMaRCRv+XnF2npCZKhzRjd4UxkCG3/yWiD8v1ajkmBtoqRuoO69BFCu
 bh6qsLiUta4Hd0OHezdSUyVWuB+RqH13f4Dce3v4oQvnxkBODdKL48IGS+/XtM5A
 ==
X-ME-Sender: <xms:3Hs4X7FmxD9_gGHwye4o5HenW7DUR1D5h1raZxFEriEdiT4Xd1IoDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddttddgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtohfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetgeet
 keeukeffhfejueeludehtedtkeeuiedtgffgtdfhveefueeiiefhudehgeenucfkpheple
 durdeigedrudejtddrkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
 drtghomh
X-ME-Proxy: <xmx:3Hs4X4XbBAzqs-NWG2VeNwy4myd_AWRp2G0JqPqVGCxu1cu-NlbUEQ>
 <xmx:3Hs4X9JNRydVz4SPURvDioivXTWl_xmNPScufBuykqkfbV_5HNAW4w>
 <xmx:3Hs4X5E6wudnksFsi-3tqKdCML5Aw3whZS-vZt6BYHCeBlr4450gGQ>
 <xmx:3Xs4XwentSPrJe04T-NV5FtkhH49NCWiqq6vFnShW10izUXvpyS5bA>
Received: from localhost.localdomain (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0D67C3060067;
 Sat, 15 Aug 2020 20:20:43 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Ard Biesheuvel <ardb@kernel.org>,
	linux-efi@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, norbert.kaminski@3mdeb.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] efi: discover ESRT table on Xen PV too
Date: Sun, 16 Aug 2020 02:19:49 +0200
Message-Id: <20200816001949.595424-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In case of Xen PV dom0, Xen passes along info about system tables (see
arch/x86/xen/efi.c), but not the memory map from EFI. This makes sense
as it is Xen responsible for managing physical memory address space.
In this case, it doesn't make sense to condition using ESRT table on
availability of EFI memory map, as it isn't Linux kernel responsible for
it. Skip this part on Xen PV (let Xen do the right thing if it deems
necessary) and use ESRT table normally.

This is a requirement for using fwupd in PV dom0 to update UEFI using
capsules.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 drivers/firmware/efi/esrt.c | 47 ++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/efi/esrt.c b/drivers/firmware/efi/esrt.c
index d5915272141f..5c49f2aaa4b1 100644
--- a/drivers/firmware/efi/esrt.c
+++ b/drivers/firmware/efi/esrt.c
@@ -245,36 +245,38 @@ void __init efi_esrt_init(void)
 	int rc;
 	phys_addr_t end;
 
-	if (!efi_enabled(EFI_MEMMAP))
+	if (!efi_enabled(EFI_MEMMAP) && !efi_enabled(EFI_PARAVIRT))
 		return;
 
 	pr_debug("esrt-init: loading.\n");
 	if (!esrt_table_exists())
 		return;
 
-	rc = efi_mem_desc_lookup(efi.esrt, &md);
-	if (rc < 0 ||
-	    (!(md.attribute & EFI_MEMORY_RUNTIME) &&
-	     md.type != EFI_BOOT_SERVICES_DATA &&
-	     md.type != EFI_RUNTIME_SERVICES_DATA)) {
-		pr_warn("ESRT header is not in the memory map.\n");
-		return;
-	}
+	if (efi_enabled(EFI_MEMMAP)) {
+		rc = efi_mem_desc_lookup(efi.esrt, &md);
+		if (rc < 0 ||
+		    (!(md.attribute & EFI_MEMORY_RUNTIME) &&
+		     md.type != EFI_BOOT_SERVICES_DATA &&
+		     md.type != EFI_RUNTIME_SERVICES_DATA)) {
+			pr_warn("ESRT header is not in the memory map.\n");
+			return;
+		}
 
-	max = efi_mem_desc_end(&md);
-	if (max < efi.esrt) {
-		pr_err("EFI memory descriptor is invalid. (esrt: %p max: %p)\n",
-		       (void *)efi.esrt, (void *)max);
-		return;
-	}
+		max = efi_mem_desc_end(&md);
+		if (max < efi.esrt) {
+			pr_err("EFI memory descriptor is invalid. (esrt: %p max: %p)\n",
+			       (void *)efi.esrt, (void *)max);
+			return;
+		}
 
-	size = sizeof(*esrt);
-	max -= efi.esrt;
+		size = sizeof(*esrt);
+		max -= efi.esrt;
 
-	if (max < size) {
-		pr_err("ESRT header doesn't fit on single memory map entry. (size: %zu max: %zu)\n",
-		       size, max);
-		return;
+		if (max < size) {
+			pr_err("ESRT header doesn't fit on single memory map entry. (size: %zu max: %zu)\n",
+			       size, max);
+			return;
+		}
 	}
 
 	va = early_memremap(efi.esrt, size);
@@ -331,7 +333,8 @@ void __init efi_esrt_init(void)
 
 	end = esrt_data + size;
 	pr_info("Reserving ESRT space from %pa to %pa.\n", &esrt_data, &end);
-	if (md.type == EFI_BOOT_SERVICES_DATA)
+
+	if (efi_enabled(EFI_MEMMAP) && md.type == EFI_BOOT_SERVICES_DATA)
 		efi_mem_reserve(esrt_data, esrt_data_size);
 
 	pr_debug("esrt-init: loaded.\n");
-- 
2.25.4


