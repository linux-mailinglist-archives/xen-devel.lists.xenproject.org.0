Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A84591832
	for <lists+xen-devel@lfdr.de>; Sat, 13 Aug 2022 03:40:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386025.621939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7d-0002mX-Lo; Sat, 13 Aug 2022 01:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386025.621939; Sat, 13 Aug 2022 01:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7d-0002dx-E4; Sat, 13 Aug 2022 01:39:29 +0000
Received: by outflank-mailman (input) for mailman id 386025;
 Sat, 13 Aug 2022 01:39:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRGa=YR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oMg7b-0000pU-Ne
 for xen-devel@lists.xenproject.org; Sat, 13 Aug 2022 01:39:27 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3ec8fec-1aa8-11ed-924f-1f966e50362f;
 Sat, 13 Aug 2022 03:39:26 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 036DF5C00C6;
 Fri, 12 Aug 2022 21:39:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 12 Aug 2022 21:39:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 21:39:25 -0400 (EDT)
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
X-Inumbo-ID: c3ec8fec-1aa8-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660354765; x=1660441165; bh=/pD4K+B9L0
	ba8VyhoGCQP8h4YWebGtRYWp1NDk3Q7sk=; b=diNItfgK74VOCJwyO79Plry05B
	ZFlXT2k5kM6LIypntwjnTMiUT6BxtvN6Ta1s1csEAQpF/fCbjLjvquTtSegNIm38
	5ioCssdiXWCFhtVx/rQC4zXo6bj1LCqPvtWcQ0hKtWJdZHpezdXa+plBHyBdX/Dg
	troi3toPwFayu0u3klQg3KwDoQAZ2Qqv88ZFMtYwtWrK7dbzmuvbY6EVHQGKShR3
	GjjIqV+nVrkEIaISn3NqqOAiu+dzZSbm9ul1HhK54I/IKuOQ7XUlSGF/G7Y8xVzm
	GMF4a2mJP2tJBD0EShHSpB7b6supFfFFem5PdWUX977/Hd/IW3/cZIIpdusw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660354765; x=
	1660441165; bh=/pD4K+B9L0ba8VyhoGCQP8h4YWebGtRYWp1NDk3Q7sk=; b=r
	2o1z9ttuXA3mgwewAB7DzWWVC2RXwxu1IJBOm0gEpmwgHv/8LeVZeM6Gok8lDF77
	f5jCwlPt9McjrUVoLM8mBV3rBFMSPVKmf4mdcObQnqsAyT7v40A2zTzngpCuV9rH
	gDCgcWkGfypwsBVVuNDJkJPkBRNoJKR1vpmn6hzh6wZURRMQ+kpOrunkoSZ67Ioy
	P7gi/4SFjKu7FmXk1qwhGVdB23ieUD8lFlO/ZQ7iWFBKvwg/fhaoJlYmqhfKnS4K
	SPtp26+midjuyYIgrGTjXXCRFUdyAzVumQbDNu+jMKW9V4YNDU18phQCbaJnBn0y
	Ab1ZWkTgHTzvEWXMcBLIQ==
X-ME-Sender: <xms:zQD3YrCKrmFAm--cP1qrxEQK08NnoBrZvn_4LQXVsdbN24GOyiwJgA>
    <xme:zQD3YhhJISpuwGjf4no3pki2M5NI6m6N-0yCoTxdI14kZ6biPycLK6OSQ08gnmFys
    z6rWxX-thXfFQ>
X-ME-Received: <xmr:zQD3YmkHWAEfNEUooE3drMnCorO8yvlBt6BP9lr8KEsRuYpfUfFcTOn3a2BXFook8NaqaBBOYrY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegjedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:zQD3Ytzp0tD_8u3ClYZ1mmZcnxGqrTElWzqf2xEltgeyiHHKcuak0g>
    <xmx:zQD3YgT__AKMGFJBpTQFakVGXXlZuwUcHlg-enNCyVxpYtFhgaRBXw>
    <xmx:zQD3YgbJbKOr_9sEsaw5Kav9skEl3sLVI9XscjZo0TmKTFwJCdN22A>
    <xmx:zQD3YrLUkna-pDzzL01WGDUYFP_OvHunpbPPi5VMjHcf3r84gaSb1w>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v4 08/11] IOMMU/AMD: wire common device reserved memory API
Date: Sat, 13 Aug 2022 03:38:58 +0200
Message-Id: <9b33fd752990bd88106659134dd76c447ff99b88.1660354597.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
References: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
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

