Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1CE674206
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 20:04:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481278.746068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIaDB-0002qA-Rf; Thu, 19 Jan 2023 19:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481278.746068; Thu, 19 Jan 2023 19:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIaDB-0002hr-Ld; Thu, 19 Jan 2023 19:04:33 +0000
Received: by outflank-mailman (input) for mailman id 481278;
 Thu, 19 Jan 2023 19:04:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tmj6=5Q=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pIaDA-0002YR-Jo
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 19:04:32 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18b41409-982c-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 20:04:28 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B0BC15C0113;
 Thu, 19 Jan 2023 14:04:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 19 Jan 2023 14:04:27 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jan 2023 14:04:26 -0500 (EST)
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
X-Inumbo-ID: 18b41409-982c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1674155067; x=1674241467; bh=SFELFhRBDG
	wxzbzozrOmTJ4SoxpryGpr1CzrXd0rbww=; b=dyikPYdTJzsJDOgvNb4fSLgmtt
	qnJsfvjF/c45Rr4UTsnxxyzyK69GemoA40vz4QqytzeVPkG9oDYl2du1BGRjmFpc
	XPEJiivlyIq4zuvnu+kLj+45UtBx6LDaDnk+o7jRjzsmZ2YPp7Eowyxyf1qdLoHC
	5hEQH164NUO+Yl0ANLWO52jmpC1ohoUtSTH+BSn05+CIhS793scPMOcbzRjS3OS6
	izj3OSXzEP0uuFdUQzi5fo4c567VcoRvDIb83wjS8Vu9S6drGXgfnhqEECBzEygm
	GuUPiWn9fB1spgReRKh+X2fTI+9+oEXdzOPREiKxWYQsADbXepd36tdo2T1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674155067; x=
	1674241467; bh=SFELFhRBDGwxzbzozrOmTJ4SoxpryGpr1CzrXd0rbww=; b=a
	l6RegSqim7BFs3FrE6J+49XSBvpNwX107t4zIBAZYjFzk9u+s67kzoA4Bauuo7Ge
	IIEK16MmU7GO29hW92WRmVMKMhxJxXR/GN5dUo/lOkKUsqT9fQ0OoUOsOiJPSGpc
	bJLKg3oogEWdQutNk7u7FBaave353Dxka+9g/rxf23+un0kyLOTFk4qqh61iBh1A
	hanHl0u1JpY+Pkx6rdE4JW/qPuKX2ws2LfEaquCn95HO0K0W1papQ7uUXMRrkHGP
	Lyc8TmPo9RqiZumXOldUgbDvwsfqjzcIlKhNHVO4RGTk1+ns/Z7npumPRZCbuXPz
	8ZdUMHlYEJhttiDx7mFjw==
X-ME-Sender: <xms:O5TJY1jZ9piu1WNItg0aow2pXfm6utsa6VIHtnhx1YTXflwiqnzVWg>
    <xme:O5TJY6C2dd1SA5EpGory50TmMuhcX7xqz5EzJiMI3bfRMoOZIphkx50HTSojsM09S
    Lh1IwCbZi9vvW0>
X-ME-Received: <xmr:O5TJY1HaEiBDNV1qHQKgCBA8wGc2yUlwS9iTLarOCcvgbj3KMjHbyvMoiSxc04uezUr6pKMUgFWZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddutddguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepffgv
    mhhiucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepledukeelleejkeevkeefgefh
    ffegvdeigeelieegjefffeeiveeivdejgeevteeinecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhn
    ghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:O5TJY6Qmu13I_ZwhaTSyhuoejvaSujw2-RuKgJZPR0qbsDuOLCvbsg>
    <xmx:O5TJYyyQ2iCppONNYFvhvSQA0Dwg9UM9GxhE2yfnydGW9HKakK44sw>
    <xmx:O5TJYw6HDewiFdSEZxHeB2Vo-52Yy8kD4RoT6GVBR-pFYdkp42tnOg>
    <xmx:O5TJY5lErevuhruCBDzETh-eOtL7NcHj1DKQseLRP2z-2NWCnKS7rw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Ard Biesheuvel <ardb@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 3/5] efi: Apply allowlist to EFI configuration tables when running under Xen
Date: Thu, 19 Jan 2023 14:03:58 -0500
Message-Id: <ae86554a2846cd3732316405f10bce5ea9bf7f3d.1669264419.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <b18879e0329c785d35f2aa2164413bb56419c684.1674153153.git.demi@invisiblethingslab.com>
References: <b18879e0329c785d35f2aa2164413bb56419c684.1674153153.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As it turns out, Xen does not guarantee that EFI boot services data
regions in memory are preserved, which means that EFI configuration
tables pointing into such memory regions may be corrupted before the
dom0 OS has had a chance to inspect them.

This is causing problems for Qubes OS when it attempts to perform system
firmware updates, which requires that the contents of the EFI System
Resource Table are valid when the fwupd userspace program runs.

However, other configuration tables such as the memory attributes table
or the runtime properties table are equally affected, and so we need a
comprehensive workaround that works for any table type.

So when running under Xen, check the EFI memory descriptor covering the
start of the table, and disregard the table if it does not reside in
memory that is preserved by Xen.

Co-developed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 drivers/firmware/efi/efi.c |  7 +++++++
 drivers/xen/efi.c          | 25 +++++++++++++++++++++++++
 include/linux/efi.h        |  2 ++
 3 files changed, 34 insertions(+)

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index bcb848e44e7b1350b10b7c0479c0b38d980fe37d..b49fcde06ca0ff5347047666f38b9309bd9cfe26 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -564,6 +564,13 @@ static __init int match_config_table(const efi_guid_t *guid,
 
 	for (i = 0; efi_guidcmp(table_types[i].guid, NULL_GUID); i++) {
 		if (!efi_guidcmp(*guid, table_types[i].guid)) {
+			if (IS_ENABLED(CONFIG_XEN_EFI) &&
+			    !xen_efi_config_table_is_usable(guid, table)) {
+				if (table_types[i].name[0])
+					pr_cont("(%s=0x%lx) may have been clobbered by Xen ",
+					        table_types[i].name, table);
+				return 1;
+			}
 			*(table_types[i].ptr) = table;
 			if (table_types[i].name[0])
 				pr_cont("%s=0x%lx ",
diff --git a/drivers/xen/efi.c b/drivers/xen/efi.c
index 3c792353b7308f9c2bf0a888eda9f827aa9177f8..fb321cd6415a40e8c4d0ad940611adcabe20ab97 100644
--- a/drivers/xen/efi.c
+++ b/drivers/xen/efi.c
@@ -328,3 +328,28 @@ int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
 
 	return 0;
 }
+
+bool __init xen_efi_config_table_is_usable(const efi_guid_t *guid,
+                                           unsigned long table)
+{
+	efi_memory_desc_t md;
+	int rc;
+
+	if (!efi_enabled(EFI_PARAVIRT))
+		return true;
+
+	rc = efi_mem_desc_lookup(table, &md);
+	if (rc)
+		return false;
+
+	switch (md.type) {
+	case EFI_RUNTIME_SERVICES_CODE:
+	case EFI_RUNTIME_SERVICES_DATA:
+	case EFI_ACPI_RECLAIM_MEMORY:
+	case EFI_ACPI_MEMORY_NVS:
+	case EFI_RESERVED_TYPE:
+		return true;
+	default:
+		return false;
+	}
+}
diff --git a/include/linux/efi.h b/include/linux/efi.h
index b407a302b730a6cc7481afa0f582360e59faf1e0..b210b50c4bdedaafcce6f63d44f57ff8329d1cfd 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -1322,4 +1322,6 @@ struct linux_efi_coco_secret_area {
 /* Header of a populated EFI secret area */
 #define EFI_SECRET_TABLE_HEADER_GUID	EFI_GUID(0x1e74f542, 0x71dd, 0x4d66,  0x96, 0x3e, 0xef, 0x42, 0x87, 0xff, 0x17, 0x3b)
 
+bool xen_efi_config_table_is_usable(const efi_guid_t *guid, unsigned long table);
+
 #endif /* _LINUX_EFI_H */
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

