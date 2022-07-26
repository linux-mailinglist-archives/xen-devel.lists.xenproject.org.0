Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A11D5809E9
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 05:23:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374941.607228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGBAb-0005RY-O8; Tue, 26 Jul 2022 03:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374941.607228; Tue, 26 Jul 2022 03:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGBAb-0005MB-Iy; Tue, 26 Jul 2022 03:23:41 +0000
Received: by outflank-mailman (input) for mailman id 374941;
 Tue, 26 Jul 2022 03:23:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zoO2=X7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oGBAZ-0003P0-6Q
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 03:23:39 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56b4385f-0c92-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 05:23:38 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9AB7A5C00C4;
 Mon, 25 Jul 2022 23:23:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 25 Jul 2022 23:23:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Jul 2022 23:23:36 -0400 (EDT)
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
X-Inumbo-ID: 56b4385f-0c92-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1658805817; x=1658892217; bh=I6siKunDYx
	GQP0S8ZLOM5K5jIoXt/ZQrNSId/g+ijJY=; b=pElV3R8p4/TAoXjNMneelUeSOc
	WzEfG7cV2LTGPTH5QUdU3X2zdZnYZ7lpbS2L1kKeQDktgzMeMC0bFZ16UUniqLyt
	OcwIWGF+C6WlrsxSM558fb3eMAo04E6i/k9oX0Vg8CSLyUljlCJ/5kDMOIm844NP
	OFzJmg06dEgY3qUfYSjZzL6RLJkpQ/DtAgsJCKUBnzBHtHNhXkLayicD5fXNhhXE
	JVPMBCppJsRSJyaPrD9yk1+ykL9CuKh3WRkCo/zM0dyA73jOxZnrxU7XBVO29imL
	PDW8qfhRZQaHeceit3TqT+nqM8786vqrK20InMlzuVEj0xb3uqom3kNn9ATw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658805817; x=
	1658892217; bh=I6siKunDYxGQP0S8ZLOM5K5jIoXt/ZQrNSId/g+ijJY=; b=c
	nKHTVFf4cw8/jsjUXCGdJyxr3HQe1zCGUfYCoUnvjjdYpPLXwtxK+pU6M0s8rKoE
	do8tg3kb8w/nAz+XYNIChEwqwOPk6CTQ9I5UJt+5ztjFS9ESOVwq1d5bZexMqLdP
	gqSf9wSlFQFBvuxvG0Ye9O1l6BefvnrLnigrRY22IomrRpZkNlRss3IwLS26XHrm
	YEgkhLIdpoeFTG6b+A3YWaP1uabR8dW/EHn1+W3zNY8tJePb2rhJulea3dtAXgXa
	wquOpYjsM18IvQyFz0GuwIN668vaA+pS0AZIhMt3J9nfQFiTX+9apQ7VgXiHTFgy
	Es7zc8z/biUfSFY/Pd6+Q==
X-ME-Sender: <xms:OV7fYgxbASjXXbEAa8whqlk_qTMCGWk_dtzZbuXdSd6VILBxrdEQjQ>
    <xme:OV7fYkSoZt_yKKZ8eM-YyjPEMTWev4EvAdqkRqPoafQq8bX8RjtGyT8kn_ZRm270z
    cXzdiHyei43sQ>
X-ME-Received: <xmr:OV7fYiUV82eU-k91apb0SDM96PQyv-JZhpogbEV-7K4uxMf4gsAGrTDiaMWarcALuZVV3JB_Q1C5IBxD6s9HuQpZEZcOZWLCiaRt2i7v66RqYr8U86VlPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtledgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:OV7fYuiqfoAMnqWe0RD4ZGIslGD7nc-ekN3rVfEOe1Pn-322ac6mig>
    <xmx:OV7fYiD5nn3F6wyiUpGtVRHYOxprCxP-7ysg3VViEdN2PtiFsb3Mpg>
    <xmx:OV7fYvJu6TqWBIhxR6UNUC4EdgD2sxUEcRkUJ1HZS1rKwDtZ_-ivFQ>
    <xmx:OV7fYj4rWSMFkhB1ViXvOKCCIPtxW5Dr2XHTPXKywN7KrYO_TK4ofA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 07/10] IOMMU/AMD: wire common device reserved memory API
Date: Tue, 26 Jul 2022 05:23:12 +0200
Message-Id: <68b7a172fcdad2495fb928e47f33ebe5bafcf953.1658804819.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Register common device reserved memory similar to how ivmd= parameter is
handled.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
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

