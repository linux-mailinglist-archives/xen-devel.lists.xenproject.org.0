Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E32BE59C2B0
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 17:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391473.629365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9L3-0004gI-Er; Mon, 22 Aug 2022 15:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391473.629365; Mon, 22 Aug 2022 15:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9L3-0004ce-9w; Mon, 22 Aug 2022 15:27:41 +0000
Received: by outflank-mailman (input) for mailman id 391473;
 Mon, 22 Aug 2022 15:27:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YSJC=Y2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oQ9L1-0003iu-6A
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 15:27:39 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3c97865-222e-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 17:27:38 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 678203200A71;
 Mon, 22 Aug 2022 11:27:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 22 Aug 2022 11:27:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Aug 2022 11:27:35 -0400 (EDT)
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
X-Inumbo-ID: f3c97865-222e-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1661182055; x=1661268455; bh=/pD4K+B9L0
	ba8VyhoGCQP8h4YWebGtRYWp1NDk3Q7sk=; b=cgOWQej6yYZdOw6e1uLcBlA9jX
	VtPx8obQkof4ie+8oTH9GXL4yGl0MwfkC+0FXdyDOq0sKafaZ2kUlXvidJfFcWrK
	MDSwFoL/SZX9Kf1+D7DkjyF88zGsgmoRb6gPGmiO+m2a8qouFCpxt/DVpQSvlpLD
	JzZ2+KWBFfIlonsEkK0W+NcGyh3mF22+bp33vgAkCYP+hA3K5g4CauIEE9a+n9Ku
	rRQmKaIHotD9itNLCPzt15HaJpzRsJ+0pJU5t5WqoGop2vUWJ7MgfYnL6EudrlJ2
	KxPJHOO02rxlvqTh53CxUIR1nAfF+9IhlirXkzdjOz+bvjJEdLWS+asa8DKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661182055; x=
	1661268455; bh=/pD4K+B9L0ba8VyhoGCQP8h4YWebGtRYWp1NDk3Q7sk=; b=0
	DRb/8cbJHaCze5PP+YEFv7WHH23TTnZgUb5otB9yxLpZdOHq5klj/s3Apo4zN4dL
	EVy41M/EUQo/MY2BJC/3JkF0ARDVWf5Plu47w0Lq0/ISre2JRaz8inkpKgtdfYdz
	mNHu4dmvrmOiv7tvdTc+tMXE4pGkxaUQVIQt2KK94LZkLg4LTdg55Ztyx+UuIeoo
	zNpRwoH/mtt2aOl5ofUW+f2xwCea2KgVGCFBoY3Fc/awR72tDqCcd/i/8q5Azeqf
	lpAV/RxkJxxko8TXS5Dssnj8QnyxzQI6rZMCveSuKWWALsLkYSqZAJsBNKqUScAt
	GTETI8v9eDcpTLavhuuXg==
X-ME-Sender: <xms:Z6ADY-B_8w6cvekPm4Q4t7s47-63C5DwsLuxpdhx8qyKit1DuVs3IA>
    <xme:Z6ADY4jOBo0qCGQwM-OcZcxNIpn7nsGIJJ28_C-7HifVo5pkq7shhR_nouCL1Pc12
    933FXAzdT4zOA>
X-ME-Received: <xmr:Z6ADYxl4NHYniR9_7cIsHFl9IPXyxp9WkCivAHJWml-jc1HuRN6vYy5scKScdRrgDqNm-COVvPOWdnaoKYLndPR1yLQOuhHP-U8XgqW4V9ARDIB3VDtQ8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeijedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Z6ADY8wELSIEaEMrfMIutzJvM3hQdbfYsB5ZnnEN-Mbg0LRVcvTGfw>
    <xmx:Z6ADYzQXzo9LBxtAom6Zj6oJJfVytM2pOcwj-8I8xM74FlSg4bVQxw>
    <xmx:Z6ADY3Y1b2Ae7DwiCeK4bauV9SVFriNM0ihqtFQ8lvx2QXm2sob0LA>
    <xmx:Z6ADY6Jdm95QkXcbOQctLDRyiGwL6SCcazDk7ayCUlBnShWeXBQfsg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v5 5/9] IOMMU/AMD: wire common device reserved memory API
Date: Mon, 22 Aug 2022 17:27:05 +0200
Message-Id: <725db95e13a7006d55ead9bfb584dce206eaa86c.1661181584.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Register common device reserved memory similar to how ivmd= parameter is
handled.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - use variable initializer
 - use pfn_to_paddr()
---
 xen/drivers/passthrough/amd/iommu_acpi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index ac6835225bae..3b577c9b390c 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -1078,6 +1078,25 @@ static inline bool_t is_ivmd_block(u8 type)
             type == ACPI_IVRS_TYPE_MEMORY_IOMMU);
 }
 
+static int __init cf_check add_one_extra_ivmd(unsigned long start,
+                                              unsigned long nr,
+                                              uint32_t id, void *ctxt)
+{
+    struct acpi_ivrs_memory ivmd = {
+        .header = {
+            .length = sizeof(ivmd),
+            .flags = ACPI_IVMD_UNITY | ACPI_IVMD_READ | ACPI_IVMD_WRITE,
+            .device_id = id,
+            .type = ACPI_IVRS_TYPE_MEMORY_ONE,
+        },
+    };
+
+    ivmd.start_address = pfn_to_paddr(start);
+    ivmd.memory_length = pfn_to_paddr(nr);
+
+    return parse_ivmd_block(&ivmd);
+}
+
 static int __init cf_check parse_ivrs_table(struct acpi_table_header *table)
 {
     const struct acpi_ivrs_header *ivrs_block;
@@ -1121,6 +1140,8 @@ static int __init cf_check parse_ivrs_table(struct acpi_table_header *table)
         AMD_IOMMU_DEBUG("IVMD: %u command line provided entries\n", nr_ivmd);
     for ( i = 0; !error && i < nr_ivmd; ++i )
         error = parse_ivmd_block(user_ivmds + i);
+    if ( !error )
+        error = iommu_get_extra_reserved_device_memory(add_one_extra_ivmd, NULL);
 
     /* Each IO-APIC must have been mentioned in the table. */
     for ( apic = 0; !error && iommu_intremap && apic < nr_ioapics; ++apic )
-- 
git-series 0.9.1

