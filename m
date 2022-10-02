Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 637665F2272
	for <lists+xen-devel@lfdr.de>; Sun,  2 Oct 2022 11:57:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414649.659008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeviQ-0000Jq-Mt; Sun, 02 Oct 2022 09:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414649.659008; Sun, 02 Oct 2022 09:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeviQ-0000Fp-Hz; Sun, 02 Oct 2022 09:56:54 +0000
Received: by outflank-mailman (input) for mailman id 414649;
 Sun, 02 Oct 2022 09:56:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gGO=2D=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1oeviO-0007U5-6V
 for xen-devel@lists.xenproject.org; Sun, 02 Oct 2022 09:56:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 890d9203-4238-11ed-964a-05401a9f4f97;
 Sun, 02 Oct 2022 11:56:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 101F460EA5;
 Sun,  2 Oct 2022 09:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832B8C4347C;
 Sun,  2 Oct 2022 09:56:46 +0000 (UTC)
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
X-Inumbo-ID: 890d9203-4238-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664704609;
	bh=kklnL55pKWR1vQ/19hTjFP18KyqfhrdVX1+/k9SG5KE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u30qGzyh+tD3uTA+5MwooaeSIG3R7K46GLISQHthQk0IPFp6wFEREKYfV4cAwZH4l
	 29tBU8c+/EzhtdSavIkJUuL0yjTYoXoUcSIu11EcnRwAN2YvaCI+Q9KN9yPubwXNVc
	 hH/2WplQPMDx8Kv6+oWcSd8JH3LbkW0DGUiiiicysD15n2DWcO4YnBcL9oGqGqot3j
	 5SkWHBdHp1RWCWp+6O5NeWcP4KAIJiTffms0EEkZ/LLK9ZF+4SeWW0GpXzszzSMt4E
	 n95nzqAy4sZimgR0qgb/cOd/54zjc2W5Gx209+l6ID9r+QsAhyawmZNFhDrHUqL/PC
	 7UA5fBTSYWyJg==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-efi@vger.kernel.org
Cc: xen-devel@lists.xenproject.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Peter Jones <pjones@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Kees Cook <keescook@chromium.org>,
	Anton Vorontsov <anton@enomsg.org>,
	Colin Cross <ccross@android.com>,
	Tony Luck <tony.luck@intel.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [RFC PATCH 4/5] efi: Apply allowlist to EFI configuration tables when running under Xen
Date: Sun,  2 Oct 2022 11:56:25 +0200
Message-Id: <20221002095626.484279-5-ardb@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221002095626.484279-1-ardb@kernel.org>
References: <20221002095626.484279-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4992; i=ardb@kernel.org; h=from:subject; bh=kklnL55pKWR1vQ/19hTjFP18KyqfhrdVX1+/k9SG5KE=; b=owEB7QES/pANAwAKAcNPIjmS2Y8kAcsmYgBjOWBDcjLC/XtL6TWD7SlqFc53BFZWSGH0tWLY5HiL Of+IqTeJAbMEAAEKAB0WIQT72WJ8QGnJQhU3VynDTyI5ktmPJAUCYzlgQwAKCRDDTyI5ktmPJBG+C/ 9n9inwyfpMFqxsvtl0IevAjclopZMTaAwU+rafEbqvQ2K9fxsY6k4Tuzs9y0I6HVaTCKQ+/e83E8Ut oQkrveg0sb6Etbd7qZ98homL8bG2F3tJcTXv/BXpl2FIhx2E7vgjTbYE5ixklJl/55Ix+0YyrwzOmj lms21xFGzlJqVG6QHauTZwp/lUHBFtsm/xApqCGl1U67X6M2WQayQ32iAGd2FKTcUjNpPmJ7dgUgV8 nQhD7d3tfyIUbyVlaXXdhwDbTqcFQFBC+8/IiO3y+PHfRtNlO2ow6r5l0YanlRBGTGSpDIpJNRcxuH +SXQs51/NIH8jSMDlx22/tQfTnUDh70rVwpuE0ymR4Hwydyh6Jt44AdNAK/ydXbAiPx22IwrigbRQG EDzCdjUdg5RvyYLAiSuqmNyxdAtslbqqiFHmEUNQXvFvtsDsUu2r+6Jn96kUMuCcYe94+YOgRUqE5c 8VancdiCM4aEwcFqGq9gsv/K8byblK2VJNzOvn19NodFQ=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit

As it turns out, Xen does not guarantee that EFI bootservices data
regions in memory are preserved, which means that EFI configuration
tables pointing into such memory regions may be corrupted before the
dom0 OS has had a chance to inspect them.

Demi Marie reports that this is causing problems for Qubes OS when it
attempts to perform system firmware updates, which requires that the
contents of the ESRT configuration table are valid when the fwupd user
space program runs.

However, other configuration tables such as the memory attributes
table or the runtime properties table are equally affected, and so we
need a comprehensive workaround that works for any table type.

So let's first disregard all EFI configuration tables except the ones
that are known (or can be expected) to reside in memory regions of a
type that Xen preserves, i.e., ACPI tables (which are passed in
EfiAcpiReclaimMemory regions) and SMBIOS tables (which are usually
passed in EfiRuntimeServicesData regions, even though the UEFI spec only
mentions this as a recommendation). Then, cross reference unknown tables
against either the EFI memory map (if available) or do a Xen hypercall
to determine the memory type, and allow the config table if the type is
one that is guaranteed to be preserved.

Future patches can augment the logic in this routine to allow other
table types based on the size of the allocation, or based on a table
specific header size field.

Co-developed-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/efi.c |  7 ++
 drivers/xen/efi.c          | 69 ++++++++++++++++++++
 include/linux/efi.h        |  2 +
 3 files changed, 78 insertions(+)

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 11857af72859..e8c0747011d7 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -556,6 +556,13 @@ static __init int match_config_table(const efi_guid_t *guid,
 
 	for (i = 0; efi_guidcmp(table_types[i].guid, NULL_GUID); i++) {
 		if (!efi_guidcmp(*guid, table_types[i].guid)) {
+			if (IS_ENABLED(CONFIG_XEN_EFI) &&
+			    !xen_efi_config_table_is_usable(guid, table)) {
+				if (table_types[i].name[0])
+					pr_cont("(%s=0x%lx) ",
+						table_types[i].name, table);
+				return 1;
+			}
 			*(table_types[i].ptr) = table;
 			if (table_types[i].name[0])
 				pr_cont("%s=0x%lx ",
diff --git a/drivers/xen/efi.c b/drivers/xen/efi.c
index d1ff2186ebb4..3f1f365b37d0 100644
--- a/drivers/xen/efi.c
+++ b/drivers/xen/efi.c
@@ -292,3 +292,72 @@ void __init xen_efi_runtime_setup(void)
 	efi.get_next_high_mono_count	= xen_efi_get_next_high_mono_count;
 	efi.reset_system		= xen_efi_reset_system;
 }
+
+static const efi_guid_t cfg_table_allow_list[] __initconst = {
+	ACPI_20_TABLE_GUID,
+	ACPI_TABLE_GUID,
+	SMBIOS_TABLE_GUID,
+	SMBIOS3_TABLE_GUID,
+};
+
+bool __init xen_efi_config_table_is_usable(const efi_guid_t *guid,
+					   unsigned long table)
+{
+	u32 memtype;
+	int i, rc;
+
+	if (!efi_enabled(EFI_PARAVIRT))
+		return true;
+
+	for (i = 0; i < ARRAY_SIZE(cfg_table_allow_list); i++) {
+		if (!efi_guidcmp(*guid, cfg_table_allow_list[i]))
+			return true;
+	}
+
+	if (efi_enabled(EFI_MEMMAP)) {
+		/* check against the EFI memory map */
+		efi_memory_desc_t md;
+
+		rc = efi_mem_desc_lookup(table, &md);
+		if (rc) {
+			pr_warn("Failed to lookup header 0x%lx in EFI memory map (%d)\n",
+				table, rc);
+			return false;
+		}
+		memtype = md.type;
+	} else {
+		/* check against the Xen hypercall */
+		struct xen_platform_op op = {
+			.cmd = XENPF_firmware_info,
+			.u.firmware_info = {
+				.type = XEN_FW_EFI_INFO,
+				.index = XEN_FW_EFI_MEM_INFO,
+				.u.efi_info.mem.addr = table,
+				.u.efi_info.mem.size = U64_MAX - table,
+			}
+		};
+		union xenpf_efi_info *info = &op.u.firmware_info.u.efi_info;
+
+		rc = HYPERVISOR_platform_op(&op);
+		if (rc) {
+			pr_warn("Failed to lookup header 0x%lx in Xen memory map (%d)\n",
+				table, rc);
+			return false;
+		}
+		memtype = info->mem.type;
+	}
+
+	switch (memtype) {
+	case EFI_RUNTIME_SERVICES_CODE:
+	case EFI_RUNTIME_SERVICES_DATA:
+	case EFI_ACPI_RECLAIM_MEMORY:
+	case EFI_RESERVED_TYPE:
+		return true;
+	case EFI_BOOT_SERVICES_DATA:
+		break;
+	default:
+		return false;
+	}
+
+	return false;
+}
diff --git a/include/linux/efi.h b/include/linux/efi.h
index 256e70e42114..6edc627798b6 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -1351,4 +1351,6 @@ struct linux_efi_initrd {
 /* Header of a populated EFI secret area */
 #define EFI_SECRET_TABLE_HEADER_GUID	EFI_GUID(0x1e74f542, 0x71dd, 0x4d66,  0x96, 0x3e, 0xef, 0x42, 0x87, 0xff, 0x17, 0x3b)
 
+bool xen_efi_config_table_is_usable(const efi_guid_t *, unsigned long table);
+
 #endif /* _LINUX_EFI_H */
-- 
2.35.1


