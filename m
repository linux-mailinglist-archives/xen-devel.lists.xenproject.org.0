Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 682C65F012A
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 01:03:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413933.657939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oe2YQ-0005vC-Q6; Thu, 29 Sep 2022 23:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413933.657939; Thu, 29 Sep 2022 23:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oe2YQ-0005rH-LA; Thu, 29 Sep 2022 23:02:54 +0000
Received: by outflank-mailman (input) for mailman id 413933;
 Thu, 29 Sep 2022 23:02:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N23a=2A=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oe2YP-0005K5-Nz
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 23:02:53 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d86dea90-404a-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 01:02:52 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E78175C00D0;
 Thu, 29 Sep 2022 19:02:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 29 Sep 2022 19:02:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 19:02:51 -0400 (EDT)
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
X-Inumbo-ID: d86dea90-404a-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1664492571; x=1664578971; bh=XZWfM4q7thLJRlIL5LnhobWSY3gDTnmsDKZ
	GlT+eoxU=; b=CDfcAP8wxrv+yGaGY/hgh8nOq8xIjHWFytgIF58pO3FJayIaXxB
	WeYKUZGE7d8fQfMSvaZuSFYKQ8fFxC4IdUIxWnKW9O4/ojiXtmTWTqS24+TzP35I
	ofRbuBpkds4F0EslcpT0IXbD3wHJB7KN5lSGHt3P5/y17f8RKHyJBG8vWt22dlqC
	FDmjfp6qqgtvBwDItPyFemGkb3w+xJo7DK2lEw444jsbfKaOoDcst8SEeMRg/Zkt
	gPst1/tk7hVJ4SRB02ktkYfO1Br0ZR+rxwwUhUIHtl9V4mB8Qrsu9rChOcczf3l2
	JkwrCMD+K2cq8kodNdqjD8BLNkWnbf9Gw+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1664492571; x=1664578971; bh=XZWfM4q7thLJR
	lIL5LnhobWSY3gDTnmsDKZGlT+eoxU=; b=Vl6NCdiZc+gz2Ku60HaxtUtPNiwBb
	URRhV82z1PM/85XgMqFqjDLuGhS0OTCzjlkUzFphL515COHxZNNHMUshccNa3vSb
	LQ5URwP15JvAS5TzO6MlkIFhncp9hoKnRwy8i6IDrRMpGltkqUbAAqlXNfhy7/5k
	FccgNXMpJAd1A/fffa6p/pZiS+kh1jGAIINf2Uh+bA9UZYaE/3JbKuvjR6awcKgd
	g3CLbVNm3IdpMRZ8sV4jdbb9Q/6SiIF/vKWk8sJT4qIFidKm+Grlo2b2wJ3JMYHZ
	T+eQ5xzVkJSNtEku5+wnExs+PqBcH4fPaNNm5AesR/Y1jMQY1dlK1WdkA==
X-ME-Sender: <xms:GyQ2Y_Ke_pIX-T7aIMKBcOu-StBD5rSKfDipWIO8b-dHOKKahEXibA>
    <xme:GyQ2YzI1RQRTa5LJraKX5DLU07zOO766ikoQvdnQlY_WEYslEhq37MCcRKQGE4aid
    CSNjFJUn-vGLuI>
X-ME-Received: <xmr:GyQ2Y3vqulyPEulL9T8h2UbeTlj7So_ob4iM3Envh5kI5k0EirHMgJ-pHsv61J77EanrkpkX2bxv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehuddgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeffjefggfeugeduvedvjeekgfeh
    gffhhfffjeetkeelueefffetfffhtdduheetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:GyQ2Y4bEh4IuZXk5E0UGCramJdK6sGdCmiW6y0mpX828czs8CY5CsA>
    <xmx:GyQ2Y2bVKiq1NvDnyhopYp1DiENAuY7eMht2gFns59QjLcBt7XluSg>
    <xmx:GyQ2Y8Ac5R4rT1-1LV_q1usGjI_YD4qZ-F8R3c5yl8qsWf074iCEAA>
    <xmx:GyQ2YzSNKY0iWca7g-vLQMcF0au3cyS-Z4UXZAZCECfU0Q7O-vmPwQ>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Anton Vorontsov <anton@enomsg.org>,
	Colin Cross <ccross@android.com>,
	Tony Luck <tony.luck@intel.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: [PATCH v4 2/2] Support ESRT in Xen dom0
Date: Thu, 29 Sep 2022 19:02:04 -0400
Message-Id: <5649176eacda434267f68676f1733d06c572d19e.1664298147.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1664298147.git.demi@invisiblethingslab.com>
References: <cover.1664298147.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fwupd requires access to the EFI System Resource Table (ESRT) to
discover which firmware can be updated by the OS.  Currently, Linux does
not expose the ESRT when running as a Xen dom0.  Therefore, it is not
possible to use fwupd in a Xen dom0, which is a serious problem for e.g.
Qubes OS.

Before Xen 4.17, this was not fixable due to hypervisor limitations.
The UEFI specification requires the ESRT to be in EfiBootServicesData
memory, which Xen will use for whatever purposes it likes.  Therefore,
Linux cannot safely access the ESRT, as Xen may have overwritten it.

Starting with Xen 4.17, Xen checks if the ESRT is in EfiBootServicesData
or EfiRuntimeServicesData memory.  If the ESRT is in EfiBootServicesData
memory, Xen replaces the ESRT with a copy in memory that it has
reserved.  Such memory is currently of type EFI_RUNTIME_SERVICES_DATA,
but in the future it will be of type EFI_ACPI_RECLAIM_MEMORY.  This
ensures that the ESRT can safely be accessed by the OS.

When running as a Xen dom0, use the new
xen_config_table_memory_region_max() function to determine if Xen has
reserved the ESRT and, if so, find the end of the memory region
containing it.  This allows programs such as fwupd which require the
ESRT to run under Xen, and so makes fwupd support in Qubes OS possible.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 drivers/firmware/efi/esrt.c | 43 ++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/efi/esrt.c b/drivers/firmware/efi/esrt.c
index 2a2f52b017e736dd995c69e8aeb5fbd7761732e5..a0642bc161b4b1f94f818b8c9f46511fe2424bb2 100644
--- a/drivers/firmware/efi/esrt.c
+++ b/drivers/firmware/efi/esrt.c
@@ -243,27 +243,44 @@ void __init efi_esrt_init(void)
 	void *va;
 	struct efi_system_resource_table tmpesrt;
 	size_t size, max, entry_size, entries_size;
-	efi_memory_desc_t md;
-	int rc;
 	phys_addr_t end;
-
-	if (!efi_enabled(EFI_MEMMAP))
-		return;
+	u32 type;
 
 	pr_debug("esrt-init: loading.\n");
 	if (!esrt_table_exists())
 		return;
 
-	rc = efi_mem_desc_lookup(efi.esrt, &md);
-	if (rc < 0 ||
-	    (!(md.attribute & EFI_MEMORY_RUNTIME) &&
-	     md.type != EFI_BOOT_SERVICES_DATA &&
-	     md.type != EFI_RUNTIME_SERVICES_DATA)) {
-		pr_warn("ESRT header is not in the memory map.\n");
+	if (efi_enabled(EFI_MEMMAP)) {
+		efi_memory_desc_t md;
+
+		if (efi_mem_desc_lookup(efi.esrt, &md) < 0 ||
+		    (!(md.attribute & EFI_MEMORY_RUNTIME) &&
+		     md.type != EFI_BOOT_SERVICES_DATA &&
+		     md.type != EFI_RUNTIME_SERVICES_DATA)) {
+			pr_warn("ESRT header is not in the memory map.\n");
+			return;
+		}
+
+		type = md.type;
+		max = efi_mem_desc_end(&md);
+#ifdef CONFIG_XEN_EFI
+	} else if (efi_enabled(EFI_PARAVIRT)) {
+		max = xen_config_table_memory_region_max(efi.esrt);
+		/*
+		 * This might be wrong, but it doesn't matter.
+		 * xen_config_table_memory_region_max() checks the type
+		 * of the memory region, and if it returns 0, the code
+		 * below will fail without looking at the type.  Choose
+		 * a value that will not cause * subsequent code to try
+		 * to reserve the memory containing the ESRT, as either
+		 * Xen or the firmware has done so already.
+		 */
+		type = EFI_RUNTIME_SERVICES_DATA;
+#endif
+	} else {
 		return;
 	}
 
-	max = efi_mem_desc_end(&md);
 	if (max < efi.esrt) {
 		pr_err("EFI memory descriptor is invalid. (esrt: %p max: %p)\n",
 		       (void *)efi.esrt, (void *)max);
@@ -333,7 +350,7 @@ void __init efi_esrt_init(void)
 
 	end = esrt_data + size;
 	pr_info("Reserving ESRT space from %pa to %pa.\n", &esrt_data, &end);
-	if (md.type == EFI_BOOT_SERVICES_DATA)
+	if (type == EFI_BOOT_SERVICES_DATA)
 		efi_mem_reserve(esrt_data, esrt_data_size);
 
 	pr_debug("esrt-init: loaded.\n");
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


