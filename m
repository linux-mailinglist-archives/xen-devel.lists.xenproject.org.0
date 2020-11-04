Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002E92A7044
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 23:14:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19555.44740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaR2j-0005RD-6L; Wed, 04 Nov 2020 22:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19555.44740; Wed, 04 Nov 2020 22:14:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaR2j-0005Qo-3D; Wed, 04 Nov 2020 22:14:13 +0000
Received: by outflank-mailman (input) for mailman id 19555;
 Wed, 04 Nov 2020 22:14:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hAWL=EK=kernel.org=ardb@srs-us1.protection.inumbo.net>)
 id 1kaR2h-0005Qj-BZ
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 22:14:11 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69b0db74-583a-4977-a32c-2afca0585957;
 Wed, 04 Nov 2020 22:14:10 +0000 (UTC)
Received: from e123331-lin.nice.arm.com
 (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr [2.15.37.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DEEF92074B;
 Wed,  4 Nov 2020 22:14:07 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hAWL=EK=kernel.org=ardb@srs-us1.protection.inumbo.net>)
	id 1kaR2h-0005Qj-BZ
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 22:14:11 +0000
X-Inumbo-ID: 69b0db74-583a-4977-a32c-2afca0585957
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 69b0db74-583a-4977-a32c-2afca0585957;
	Wed, 04 Nov 2020 22:14:10 +0000 (UTC)
Received: from e123331-lin.nice.arm.com (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr [2.15.37.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DEEF92074B;
	Wed,  4 Nov 2020 22:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604528049;
	bh=NOv7OWHClGcxBYpjvN6mn3rmT/y8QjeyqPOmESrkm9k=;
	h=From:To:Cc:Subject:Date:From;
	b=bY/47qmVTLwLDq+6lqqBpsjoyvYnUK5b8q2F82+NxspPMsnv62SZAcUO004FEEuEl
	 Y7T9B5LXSJpDNRTktPwQh3NPcyO9cgzsa225cXvumxOHrUrXwtytBXFWufNV5Ko3dK
	 0MLnAxlQPVXDwW0+2GVNBDgu69Mm2Qp+pZ3M7B+s=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-efi@vger.kernel.org
Cc: xen-devel@lists.xenproject.org,
	sstabellini@kernel.org,
	jgross@suse.com,
	boris.ostrovsky@oracle.com,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH] efi: x86/xen: switch to efi_get_secureboot_mode helper
Date: Wed,  4 Nov 2020 23:14:00 +0100
Message-Id: <20201104221400.7005-1-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1

Now that we have a static inline helper to discover the platform's secure
boot mode that can be shared between the EFI stub and the kernel proper,
switch to it, and drop some comments about keeping them in sync manually.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/xen/efi.c                        | 37 +++++---------------
 drivers/firmware/efi/libstub/secureboot.c |  3 --
 2 files changed, 9 insertions(+), 31 deletions(-)

diff --git a/arch/x86/xen/efi.c b/arch/x86/xen/efi.c
index 205a9bc981b0..a27444acaf1e 100644
--- a/arch/x86/xen/efi.c
+++ b/arch/x86/xen/efi.c
@@ -93,37 +93,22 @@ static efi_system_table_t __init *xen_efi_probe(void)
 
 /*
  * Determine whether we're in secure boot mode.
- *
- * Please keep the logic in sync with
- * drivers/firmware/efi/libstub/secureboot.c:efi_get_secureboot().
  */
 static enum efi_secureboot_mode xen_efi_get_secureboot(void)
 {
-	static efi_guid_t efi_variable_guid = EFI_GLOBAL_VARIABLE_GUID;
 	static efi_guid_t shim_guid = EFI_SHIM_LOCK_GUID;
+	enum efi_secureboot_mode mode;
 	efi_status_t status;
-	u8 moksbstate, secboot, setupmode;
+	u8 moksbstate;
 	unsigned long size;
 
-	size = sizeof(secboot);
-	status = efi.get_variable(L"SecureBoot", &efi_variable_guid,
-				  NULL, &size, &secboot);
-
-	if (status == EFI_NOT_FOUND)
-		return efi_secureboot_mode_disabled;
-
-	if (status != EFI_SUCCESS)
-		goto out_efi_err;
-
-	size = sizeof(setupmode);
-	status = efi.get_variable(L"SetupMode", &efi_variable_guid,
-				  NULL, &size, &setupmode);
-
-	if (status != EFI_SUCCESS)
-		goto out_efi_err;
-
-	if (secboot == 0 || setupmode == 1)
-		return efi_secureboot_mode_disabled;
+	mode = efi_get_secureboot_mode(efi.get_variable);
+	if (mode == efi_secureboot_mode_unknown) {
+		efi_err("Could not determine UEFI Secure Boot status.\n");
+		return efi_secureboot_mode_unknown;
+	}
+	if (mode != efi_secureboot_mode_enabled)
+		return mode;
 
 	/* See if a user has put the shim into insecure mode. */
 	size = sizeof(moksbstate);
@@ -140,10 +125,6 @@ static enum efi_secureboot_mode xen_efi_get_secureboot(void)
  secure_boot_enabled:
 	pr_info("UEFI Secure Boot is enabled.\n");
 	return efi_secureboot_mode_enabled;
-
- out_efi_err:
-	pr_err("Could not determine UEFI Secure Boot status.\n");
-	return efi_secureboot_mode_unknown;
 }
 
 void __init xen_efi_init(struct boot_params *boot_params)
diff --git a/drivers/firmware/efi/libstub/secureboot.c b/drivers/firmware/efi/libstub/secureboot.c
index af18d86c1604..8a18930f3eb6 100644
--- a/drivers/firmware/efi/libstub/secureboot.c
+++ b/drivers/firmware/efi/libstub/secureboot.c
@@ -24,9 +24,6 @@ static efi_status_t get_var(efi_char16_t *name, efi_guid_t *vendor, u32 *attr,
 
 /*
  * Determine whether we're in secure boot mode.
- *
- * Please keep the logic in sync with
- * arch/x86/xen/efi.c:xen_efi_get_secureboot().
  */
 enum efi_secureboot_mode efi_get_secureboot(void)
 {
-- 
2.17.1


