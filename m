Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C1B79E1C2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 10:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601054.936957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgL2M-0003Vu-S7; Wed, 13 Sep 2023 08:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601054.936957; Wed, 13 Sep 2023 08:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgL2M-0003TK-Om; Wed, 13 Sep 2023 08:15:50 +0000
Received: by outflank-mailman (input) for mailman id 601054;
 Wed, 13 Sep 2023 08:15:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mepq=E5=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qgL2L-0003TD-C4
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 08:15:49 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcffa0cb-520d-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 10:15:46 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C4C155C0156;
 Wed, 13 Sep 2023 04:15:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 13 Sep 2023 04:15:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Sep 2023 04:15:42 -0400 (EDT)
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
X-Inumbo-ID: bcffa0cb-520d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1694592945; x=1694679345; bh=wl3XoHRysLnRaKHxjTCrQLQfcIoXI//uRg3
	RIhX89ws=; b=sgfOmbWwyI6xJIfLrMWG4dlxFYZkIXBRv4YsHapbpKDKLdYtAri
	8BjfIRf5oN8T/bxcxNoawGOvQnElHWi3sbAPm5mR7gHVgookfbVlujgD9dtglCAS
	dicIx78w12yyZ2yeNzucZ9dHClvQnMorRL0fqrakzIVGyxcqmpdc+D9dsJ6RC7wm
	fNW2tmjjbcDcYNCZohH0tFW9oHz/nc+7u4TzRdQ3mJq2e0iE694ljUIKABEk6Udn
	6OGKp5gMKj8g9VdTZRBoUij24QkidZv57AvFCHupjO942vudr74QOV6hx/jBFJNN
	zPtxsPFw0tplU7Gdz4a6+OW3Coja7bGWrZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1694592945; x=1694679345; bh=wl3XoHRysLnRa
	KHxjTCrQLQfcIoXI//uRg3RIhX89ws=; b=V/IFXNhnV6vy+mNUprs9+KE+NBBms
	kGyqiIjsEwiQAoZOS2iTFFlnY1go+KaS7z1eq0DxF4xErn0MUWAuqYOA+6m+tTEf
	HNKWN/E1Q8lS1EO7lWaoY+3eSlGMhoF+Fghd2YQ9ibAj4fnM+mrJVZf7klzdMT6R
	ybdP5uahnsLXWTm4FlWmqfsFx0LrDfdNCEpBIG0KIxJkxqgOGzwhpHM+f+u6WOPy
	n5VvqFEzRqwf7Pq/5brfbx8gQ4JkcEyxawT4RZymC9tG9m4R7pgKCaAowWiZFZVj
	E2sALH/rn5RnRgHXKTHFUyJB2QYo7vE4JlMA4snxY4rq1j4VD+tW3jHcA==
X-ME-Sender: <xms:sW8BZbDNI95L14RAgAZPow6_PGdeXFz6HXCoLwD9nZxtmZZfYHP6ag>
    <xme:sW8BZRjQQEb8s_UaK_ml4t61PTUVeH5wtLapimVBZSDP3pfPDFnHMrfT0qnPDUeP-
    Csw6DiSYDR3wO0>
X-ME-Received: <xmr:sW8BZWmCDsIXOOcOiYt_txuF2SjVDxtEGo74G1-xzwcPNOzQb2eF0v8tdXs7BrRmAexUQsOk1FTNkD8ocvYlC45VscvUQwddTUzc90eH47AeFLhzQdXjXICk_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeikedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufhimhhonhcu
    ifgrihhsvghruceoshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeeuveehgedtfeegfeduvdefudeuudffffffjeevueeg
    fedufeeiudegudegvedugfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhimhhonhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:sW8BZdxIBzXQWKtKP_UwF0K5LT6BygAcvGGNQ6B9m7z0yQp59WJT3Q>
    <xmx:sW8BZQRyo0504ecRz7PT-spLY6FyU9LuSBIkYaHQmSRXADsUvZfkQg>
    <xmx:sW8BZQbAnWgvG0CN6Z4wA-ciLIGBTXUWo4ApM38UK4CdZBga3bYGEw>
    <xmx:sW8BZWO1tkVu647D4BBX4hG7HR17ZO1zmbiEwiyvCUQorFX1Bj_mdg>
Feedback-ID: idc5945a3:Fastmail
From: Simon Gaiser <simon@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [XEN PATCH] x86/ACPI: Fix logging of MADT entries
Date: Wed, 13 Sep 2023 10:13:35 +0200
Message-Id: <20230913081335.28493-1-simon@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recent change to ignore MADT entries with invalid APIC IDs also
affected logging of MADT entries. That's not desired [1] [2], so restore
the old behavior.

Fixes: 47342d8f490c ("x86/ACPI: Ignore entries with invalid APIC IDs when parsing MADT")
Link: https://lore.kernel.org/xen-devel/0bd3583c-a55d-9a68-55b1-c383499d46d8@suse.com/ # [1]
Link: https://lore.kernel.org/xen-devel/f780d40e-c828-c57a-b19c-16ee15c1454a@suse.com/ # [2]
Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
---
 xen/arch/x86/acpi/boot.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
index ead41bd535..170f9783c5 100644
--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -87,21 +87,22 @@ acpi_parse_x2apic(struct acpi_subtable_header *header, const unsigned long end)
 	if (BAD_MADT_ENTRY(processor, end))
 		return -EINVAL;
 
-	/* Ignore entries with invalid x2APIC ID */
-	if (processor->local_apic_id == 0xffffffff)
-		return 0;
-
 	/* Don't register processors that cannot be onlined. */
 	if (madt_revision >= 5 &&
 	    !(processor->lapic_flags & ACPI_MADT_ENABLED) &&
 	    !(processor->lapic_flags & ACPI_MADT_ONLINE_CAPABLE))
 		return 0;
 
-	if ((processor->lapic_flags & ACPI_MADT_ENABLED) || opt_cpu_info) {
+	if ((processor->lapic_flags & ACPI_MADT_ENABLED) ||
+	    processor->local_apic_id != 0xffffffff || opt_cpu_info) {
 		acpi_table_print_madt_entry(header);
 		log = true;
 	}
 
+	/* Ignore entries with invalid x2APIC ID */
+	if (processor->local_apic_id == 0xffffffff)
+		return 0;
+
 	/* Record local apic id only when enabled and fitting. */
 	if (processor->local_apic_id >= MAX_APICS ||
 	    processor->uid >= MAX_MADT_ENTRIES) {
@@ -146,19 +147,20 @@ acpi_parse_lapic(struct acpi_subtable_header * header, const unsigned long end)
 	if (BAD_MADT_ENTRY(processor, end))
 		return -EINVAL;
 
-	/* Ignore entries with invalid APIC ID */
-	if (processor->id == 0xff)
-		return 0;
-
 	/* Don't register processors that cannot be onlined. */
 	if (madt_revision >= 5 &&
 	    !(processor->lapic_flags & ACPI_MADT_ENABLED) &&
 	    !(processor->lapic_flags & ACPI_MADT_ONLINE_CAPABLE))
 		return 0;
 
-	if ((processor->lapic_flags & ACPI_MADT_ENABLED) || opt_cpu_info)
+	if ((processor->lapic_flags & ACPI_MADT_ENABLED) ||
+	    processor->id != 0xff || opt_cpu_info)
 		acpi_table_print_madt_entry(header);
 
+	/* Ignore entries with invalid APIC ID */
+	if (processor->id == 0xff)
+		return 0;
+
 	/* Record local apic id only when enabled */
 	if (processor->lapic_flags & ACPI_MADT_ENABLED) {
 		x86_acpiid_to_apicid[processor->processor_id] = processor->id;
-- 
2.40.1


