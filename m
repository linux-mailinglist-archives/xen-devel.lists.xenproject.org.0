Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B879A72B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 12:17:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599234.934553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfdxj-0001ov-UK; Mon, 11 Sep 2023 10:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599234.934553; Mon, 11 Sep 2023 10:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfdxj-0001mV-RM; Mon, 11 Sep 2023 10:16:11 +0000
Received: by outflank-mailman (input) for mailman id 599234;
 Mon, 11 Sep 2023 10:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AVcC=E3=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qfdxi-0001mP-6r
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 10:16:10 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 340e78cc-508c-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 12:16:00 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E9A7F5C0105;
 Mon, 11 Sep 2023 06:15:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 11 Sep 2023 06:15:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Sep 2023 06:15:54 -0400 (EDT)
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
X-Inumbo-ID: 340e78cc-508c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1694427358; x=1694513758; bh=aPzNQ+neXMm/yZ8qPUfmvxpeUP/0YW8350J
	wnOmxA2U=; b=2cwVvj//HfqSw1BDYvqOm8bLc9HeElkkJaqyQUKBO49US2sU9LF
	NEtEYBw9eVxpCC28K5RoNobou1hWE7Byvsu/xd/Uj61muJOTNJNg4CIC9Qufgta2
	VklRWmKdC8wcj1H/ZKhKjt25SuqiJb8XirSH0Q+6PvsaHDKUFddSATNjOQbOB0uL
	kcQwxcbhpaA+S9JIRqp579GCRn74TfUpNf64O4P1vJCPIKUC9cVpArvVI9vb5sPu
	dclYJ9RAcC0+i9r8kaBRxneHd2ZpNieSadzX6bvhPSOC+tafAEyS/Nllgy8Vt+ed
	AFYQMHi+pP23zx3UcMuF4NOwdYbkDF0vuCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1694427358; x=1694513758; bh=aPzNQ+neXMm/y
	Z8qPUfmvxpeUP/0YW8350JwnOmxA2U=; b=LVV0DzKq28a52Dy6mMn6bz7aPyrGo
	Vcb6Sha0hlGIBIAcAERoURHdDzVaP0igJHCBUaOhyTX2D1lFUdmXgNqFeBAhRnE1
	NLZaNoKuvW6w5PZJ3B+9Idfu2UAlw01+6EvRIduIZDpiKZpepmdARs1wF+Uw3kip
	C68CvvmII1UsheFfw3MGuT1HjedoH4DQM7fZbJotnA6euaM8GJ0aEHURopKqSfdl
	7NNsg401HMpq2/8JQmTXVzX2WFXKjFJPhjyOLmU3t7U6eZNnDD8lLN/6R2fuNS99
	B5mQKZnrrl25Z8zQz81e/1cwtjXFPZbwFBZuSR8L7z5wIrDScXT/GxM6A==
X-ME-Sender: <xms:3uj-ZBxkinvba8H-wlggmyA34L3-V5GAmkVKidRhpXR0Qp9yYAktaQ>
    <xme:3uj-ZBTko8lMSefSPV7zRb7THkd7Kz5szNigKn_NofvhsmznCPgH20dFk0RmlRQuS
    fzDfhz7BRkM4ss>
X-ME-Received: <xmr:3uj-ZLVsgqtMUabgCeM8WOioizKuMx74kHYKieZdoflh3rtB4AR8kimQfNKrNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeigedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufhimhhonhcu
    ifgrihhsvghruceoshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpefghfeikedtkeeuveelkefhvdevhfelleekfefhudet
    heefhfeikeeludetfeevueenucffohhmrghinhepuhgvfhhirdhorhhgpdhkvghrnhgvlh
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:3uj-ZDhT8qUUXHb-ww2Ha2p4l0DY4SFe4XAZXP6UH3CQkeH9l-7IPg>
    <xmx:3uj-ZDCD1eLifgaoK4zM7gCeqwBOMILHaOrw0kzRnbbPvgxZcHOO2g>
    <xmx:3uj-ZMKX7Hmkr0o_6hGWuC-xEvDRC6pBcH9s_wCn0KvahN4EXUJ73w>
    <xmx:3uj-ZO9N5AMSYrT4WdR5lzIYMqPK2Od9hBxX-OLWw015yaVwkXBBfg>
Feedback-ID: idc5945a3:Fastmail
From: Simon Gaiser <simon@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [XEN PATCH] x86/ACPI: Ignore entries marked as unusable when parsing MADT
Date: Mon, 11 Sep 2023 12:12:38 +0200
Message-Id: <20230911101238.18005-1-simon@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Up to version 6.2 Errata B [2] the ACPI spec only defines
ACPI_MADT_ENABLE as:

    If zero, this processor is unusable, and the operating system
    support will not attempt to use it.

The bit that later will be ACPI_MADT_ONLINE_CAPABLE is reserved with
"Must be zero".

Version 6.3 [3] then adds ACPI_MADT_ONLINE_CAPABLE and changes the
meaning of ACPI_MADT_ENABLE:

    Enabled
        If this bit is set the processor is ready for use. If this bit
        is clear and the Online Capable bit is set, system hardware
        supports enabling this processor during OS runtime. If this bit
        is clear and the Online Capable bit is also clear, this
        processor is unusable, and OSPM shall ignore the contents of the
        Processor Local APIC Structure.

    Online Capbable
        The information conveyed by this bit depends on the value of the
        Enabled bit. If the Enabled bit is set, this bit is reserved and
        must be zero. Otherwise, if this this bit is set, system
        hardware supports enabling this processor during OS runtime.

So with conforming firmwares it should be safe to simply ignore the
entry if !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE

As a precaution against buggy firmwares this change, like Linux [4],
ignores ACPI_MADT_ONLINE_CAPABLE completely if MADT revision < 5. Note
that the MADT revision was already increased to 5 with spec version 6.2
Errata A [1], so before introducing the online capable flag. But it
wasn't changed for the new flag, so this is the best we can do here.

For previous discussion see thread [5].

Link: http://www.uefi.org/sites/default/files/resources/ACPI%206_2_A_Sept29.pdf # [1]
Link: https://uefi.org/sites/default/files/resources/ACPI_6_2_B_final_Jan30.pdf # [2]
Link: https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pdf # [3]
Link: https://git.kernel.org/torvalds/c/e2869bd7af608c343988429ceb1c2fe99644a01f # [4]
Link: https://lore.kernel.org/xen-devel/80bae614-052e-0f90-cf13-0e5e4ed1a5cd@invisiblethingslab.com/ # [5]
Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
---
 xen/arch/x86/acpi/boot.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
index 4a62822fa9..2d0b8a9afc 100644
--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -77,6 +77,17 @@ static int __init cf_check acpi_parse_madt(struct acpi_table_header *table)
 	return 0;
 }
 
+static bool __init acpi_is_processor_usable(uint32_t lapic_flags)
+{
+	if (lapic_flags & ACPI_MADT_ENABLED)
+		return true;
+
+	if (madt_revision >= 5 && (lapic_flags & ACPI_MADT_ONLINE_CAPABLE))
+		return true;
+
+	return false;
+}
+
 static int __init cf_check
 acpi_parse_x2apic(struct acpi_subtable_header *header, const unsigned long end)
 {
@@ -92,9 +103,7 @@ acpi_parse_x2apic(struct acpi_subtable_header *header, const unsigned long end)
 		return 0;
 
 	/* Don't register processors that cannot be onlined. */
-	if (madt_revision >= 5 &&
-	    !(processor->lapic_flags & ACPI_MADT_ENABLED) &&
-	    !(processor->lapic_flags & ACPI_MADT_ONLINE_CAPABLE))
+	if (!acpi_is_processor_usable(processor->lapic_flags))
 		return 0;
 
 	if ((processor->lapic_flags & ACPI_MADT_ENABLED) || opt_cpu_info) {
@@ -151,9 +160,7 @@ acpi_parse_lapic(struct acpi_subtable_header * header, const unsigned long end)
 		return 0;
 
 	/* Don't register processors that cannot be onlined. */
-	if (madt_revision >= 5 &&
-	    !(processor->lapic_flags & ACPI_MADT_ENABLED) &&
-	    !(processor->lapic_flags & ACPI_MADT_ONLINE_CAPABLE))
+	if (!acpi_is_processor_usable(processor->lapic_flags))
 		return 0;
 
 	if ((processor->lapic_flags & ACPI_MADT_ENABLED) || opt_cpu_info)
-- 
2.40.1


