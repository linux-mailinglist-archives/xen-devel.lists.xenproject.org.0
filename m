Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111B45F2F9D
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 13:26:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414822.659272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofJb0-0005wl-4l; Mon, 03 Oct 2022 11:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414822.659272; Mon, 03 Oct 2022 11:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofJb0-0005tK-14; Mon, 03 Oct 2022 11:26:50 +0000
Received: by outflank-mailman (input) for mailman id 414822;
 Mon, 03 Oct 2022 11:26:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1PaK=2E=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1ofJay-0004Xj-Sb
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 11:26:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 442494b1-430e-11ed-964a-05401a9f4f97;
 Mon, 03 Oct 2022 13:26:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A949461024;
 Mon,  3 Oct 2022 11:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E0AC4347C;
 Mon,  3 Oct 2022 11:26:43 +0000 (UTC)
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
X-Inumbo-ID: 442494b1-430e-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664796406;
	bh=WSRp6bNX/TJAZPmOt6U+CC+sxwlMaJT3eET5g/MHr2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RUvZ35FsjQc9G8ENmYBxfeFUtDDJUFK2UMo+/cHo6gpHbn8ONmbPI3AHn8VN9L1DZ
	 pqxSj1M/59aMOVtdAMqgPSAtTUFJ/omqlMu6l28mUHZuN4iHOB91xUSgZ1iZkJ7amJ
	 JvcMd9Z/AxM/W1cnUQlsNR/RpGOCVARUTY1j5ke0C7GhyUdKb9Ze67VFdsmKgk7LwN
	 Yw6TkFInATddLQqNhcAOsoeUzTuNa0pXPyvkA5KPe+9qbbBmJdMNEQTX9Qfw/tSKXp
	 +CS79iIXCGAbyJC1T4KiK1j1JW8UiGBxSl49JnLPwrBpL7X7n2ejiwIX3WhJ3U510R
	 oDXiacweOf8TA==
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
Subject: [PATCH v2 5/6] efi: xen: Implement memory descriptor lookup based on hypercall
Date: Mon,  3 Oct 2022 13:26:24 +0200
Message-Id: <20221003112625.972646-6-ardb@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221003112625.972646-1-ardb@kernel.org>
References: <20221003112625.972646-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3715; i=ardb@kernel.org; h=from:subject; bh=WSRp6bNX/TJAZPmOt6U+CC+sxwlMaJT3eET5g/MHr2M=; b=owEB7QES/pANAwAKAcNPIjmS2Y8kAcsmYgBjOsbcX3efqx7JPMOFFFmoUJQ0kqs3RTBogBvQjO3M /uoVk6+JAbMEAAEKAB0WIQT72WJ8QGnJQhU3VynDTyI5ktmPJAUCYzrG3AAKCRDDTyI5ktmPJFNIC/ 4z2IbS7WT9Pkoo7uw6cgC6n6RngdfnXEwUX3q4vv58mt2Q0iHQL4ns7hgXyPfxarD3WIISuJof/j5r cCK5/b6ZdHKAWA7hkitKX0J8CsB/0TZXv45uLpX0mLxVQmYfESgzgkxfBKgrZ+3iMOdxHiEngEMZAv jEkPD4N2LhTlYgqBcxGNnq1dPYhkTqnft5J+Aw3xsM8yj+nLvb5gcD5i+HymlThNZ1tdNIM3OByz9z 5fr/WIcJjzoS7avHP8tPVcEJnVW+rJuWJ9+HuU2QMIp2WCobQHNhvs30Q1YSp4LYFIeF68Oyf5XDG6 AI98jS6cRy055WOW8uchbDKXBvfE9g7oK8DErOjD1BNPhc+ARHEjo4hSGyT1OidxGMUXvwLAPXVxZ7 84ARkFLSx+X8GLpIohsbJODPQrBR9JASQEJpnXhQ14EMiFN10dLoN88rpIyWwHGLFdoKWqwK395xiu /dN2zr1zBiVc7Q/W6DTOo2/W5IYcvjkb7ci8y+KMYpeMI=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit

Xen on x86 boots dom0 in EFI mode but without providing a memory map.
This means that some sanity checks we would like to perform on
configuration tables or other data structures in memory are not
currently possible. Xen does, however, expose EFI memory descriptor info
via a Xen hypercall, so let's wire that up instead.

Co-developed-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/efi.c |  5 ++-
 drivers/xen/efi.c          | 34 ++++++++++++++++++++
 include/linux/efi.h        |  1 +
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 55bd3f4aab28..2c12b1a06481 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -456,7 +456,7 @@ void __init efi_find_mirror(void)
  * and if so, populate the supplied memory descriptor with the appropriate
  * data.
  */
-int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
+int __efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
 {
 	efi_memory_desc_t *md;
 
@@ -485,6 +485,9 @@ int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
 	return -ENOENT;
 }
 
+extern int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
+	 __weak __alias(__efi_mem_desc_lookup);
+
 /*
  * Calculate the highest address of an efi memory descriptor.
  */
diff --git a/drivers/xen/efi.c b/drivers/xen/efi.c
index d1ff2186ebb4..74f3f6d8cdc8 100644
--- a/drivers/xen/efi.c
+++ b/drivers/xen/efi.c
@@ -26,6 +26,7 @@
 
 #include <xen/interface/xen.h>
 #include <xen/interface/platform.h>
+#include <xen/page.h>
 #include <xen/xen.h>
 #include <xen/xen-ops.h>
 
@@ -292,3 +293,36 @@ void __init xen_efi_runtime_setup(void)
 	efi.get_next_high_mono_count	= xen_efi_get_next_high_mono_count;
 	efi.reset_system		= xen_efi_reset_system;
 }
+
+int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
+{
+	static_assert(XEN_PAGE_SHIFT == EFI_PAGE_SHIFT,
+		      "Mismatch between EFI_PAGE_SHIFT and XEN_PAGE_SHIFT");
+	struct xen_platform_op op = {
+		.cmd = XENPF_firmware_info,
+		.u.firmware_info = {
+			.type = XEN_FW_EFI_INFO,
+			.index = XEN_FW_EFI_MEM_INFO,
+			.u.efi_info.mem.addr = phys_addr,
+			.u.efi_info.mem.size = U64_MAX - phys_addr,
+		}
+	};
+	union xenpf_efi_info *info = &op.u.firmware_info.u.efi_info;
+	int rc;
+
+	if (!efi_enabled(EFI_PARAVIRT) || efi_enabled(EFI_MEMMAP))
+		return __efi_mem_desc_lookup(phys_addr, out_md);
+
+	rc = HYPERVISOR_platform_op(&op);
+	if (rc) {
+		pr_warn("Failed to lookup header 0x%llx in Xen memory map: error %d\n",
+			phys_addr, rc);
+	}
+
+	out_md->phys_addr	= info->mem.addr;
+	out_md->num_pages	= info->mem.size >> EFI_PAGE_SHIFT;
+	out_md->type		= info->mem.type;
+	out_md->attribute	= info->mem.attr;
+
+        return 0;
+}
diff --git a/include/linux/efi.h b/include/linux/efi.h
index 256e70e42114..e0ee6f6da4b4 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -731,6 +731,7 @@ extern u64 efi_mem_attribute (unsigned long phys_addr, unsigned long size);
 extern int __init efi_uart_console_only (void);
 extern u64 efi_mem_desc_end(efi_memory_desc_t *md);
 extern int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md);
+extern int __efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md);
 extern void efi_mem_reserve(phys_addr_t addr, u64 size);
 extern int efi_mem_reserve_persistent(phys_addr_t addr, u64 size);
 extern void efi_initialize_iomem_resources(struct resource *code_resource,
-- 
2.35.1


