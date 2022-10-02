Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CA25F226F
	for <lists+xen-devel@lfdr.de>; Sun,  2 Oct 2022 11:57:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414648.658997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeviM-0008OE-Bo; Sun, 02 Oct 2022 09:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414648.658997; Sun, 02 Oct 2022 09:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeviM-0008Ki-8z; Sun, 02 Oct 2022 09:56:50 +0000
Received: by outflank-mailman (input) for mailman id 414648;
 Sun, 02 Oct 2022 09:56:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gGO=2D=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1oeviK-0007U5-MX
 for xen-devel@lists.xenproject.org; Sun, 02 Oct 2022 09:56:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87041ff0-4238-11ed-964a-05401a9f4f97;
 Sun, 02 Oct 2022 11:56:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E33F60EA4;
 Sun,  2 Oct 2022 09:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F90C433D6;
 Sun,  2 Oct 2022 09:56:42 +0000 (UTC)
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
X-Inumbo-ID: 87041ff0-4238-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664704606;
	bh=naWVhxVJzgFHTYyzbP8aferDZudNO8L5WZJcvq28kz8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HJMy/vz6C1WPkgKcpbpoO/EQRrz6yAjgPpzrVFvMZ+walD/yM0Y0/LdUToEzYOP3e
	 wUcz8Fmrta2nkGJSkkaAMVqgSnRvfmZmPgOh64OvJXPY22FVdCh2GBjdhDG4v1U+V+
	 TaUklRaC8k0+i0H9PXGPupfBhktKg1OYLU/ocnnKIjMY9R8buaQcGOij3ETjE9/2Qt
	 oY5U6tIueXURJFbXveR38cWmsqyll1PJbi+gTNKBGbJahbxp1vFmCekLGFIeShpnXs
	 8e6DpsKFM2Oa/iyyEWtIilU9DcihAXqFelN6xor9DoI0MdNoHBhhhwi5wcZdRq3AZU
	 1VazOsR6kr94g==
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
Subject: [RFC PATCH 3/5] efi: xen: Set EFI_PARAVIRT for Xen dom0 boot on all architectures
Date: Sun,  2 Oct 2022 11:56:24 +0200
Message-Id: <20221002095626.484279-4-ardb@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221002095626.484279-1-ardb@kernel.org>
References: <20221002095626.484279-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3190; i=ardb@kernel.org; h=from:subject; bh=naWVhxVJzgFHTYyzbP8aferDZudNO8L5WZJcvq28kz8=; b=owEB7QES/pANAwAKAcNPIjmS2Y8kAcsmYgBjOWBBUImNh+oNISz7kaell7P1ADDK/YsLUV10IJbU Cm3Ms7iJAbMEAAEKAB0WIQT72WJ8QGnJQhU3VynDTyI5ktmPJAUCYzlgQQAKCRDDTyI5ktmPJL+CDA CI6goexpgFxPze+H/P1pGk+2TCSeapYidebHraqvYuivMVNgqTUEXJD0MTuefrzj2RYWLr8Z8Nl5F/ NW37j0Kc7I7UDApHt22+UHn2mgOpMu69tN7r+1EKj5j1AH7GTJ8RfzfLxMrKqPkr9JP4TAlfMSq6wr 2H4u2aITOj9clf0ga9hYyBm3uEKdK9sPATjTKKCKtknjUMPT5fp6mmrNw1qR2ZnWh/sAUexJ/eRIeH QlUEGEHPOPeWmBtJQC+QkGKRNKPT5186B/uDeeHtlgPnKDvLlKZF99n8nyHceFjUn6T8s/S7CFJUQ3 vQz7ohfix1KUdhAZ+b7u+2BJ11t4BiTfRE84Mrq9+xxPvMVwTBfEdkrc1qGDRIaHbQCkVSZOCKhYPo 5UvNVhJFzkfY/qc+sCyiEjw3IIkG2fYKSZyzeuDaM0lR1ukIud+LEqEodpxUEcEs+cEQcW2XGgl9yB nqsQmxUsIhyvMWKdmMgVeTi9+JDpm2Qczoo9bNk+ZQh4Y=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit

Currently, the EFI_PARAVIRT flag is only used by x86, even though other
architectures also support pseudo-EFI boot, where the core kernel is
invoked directly and provided with a set of data tables that resemble
the ones constructed by the EFI stub, which never actually runs in that
case.

Let's fix this inconsistency, and always set this flag when booting dom0
via the EFI boot path. Note that Xen on x86 does not provide the EFI
memory map in this case, whereas other architectures do, so move the
associated EFI_PARAVIRT check into the x86 platform code.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/platform/efi/efi.c      | 8 +++++---
 arch/x86/platform/efi/memmap.c   | 3 +++
 drivers/firmware/efi/fdtparams.c | 4 ++++
 drivers/firmware/efi/memmap.c    | 3 ---
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/x86/platform/efi/efi.c b/arch/x86/platform/efi/efi.c
index 6e598bd78eef..6a6f2a585a3d 100644
--- a/arch/x86/platform/efi/efi.c
+++ b/arch/x86/platform/efi/efi.c
@@ -214,9 +214,11 @@ int __init efi_memblock_x86_reserve_range(void)
 	data.desc_size		= e->efi_memdesc_size;
 	data.desc_version	= e->efi_memdesc_version;
 
-	rv = efi_memmap_init_early(&data);
-	if (rv)
-		return rv;
+	if (!efi_enabled(EFI_PARAVIRT)) {
+		rv = efi_memmap_init_early(&data);
+		if (rv)
+			return rv;
+	}
 
 	if (add_efi_memmap || do_efi_soft_reserve())
 		do_add_efi_memmap();
diff --git a/arch/x86/platform/efi/memmap.c b/arch/x86/platform/efi/memmap.c
index 44b886acf301..18e14ec16720 100644
--- a/arch/x86/platform/efi/memmap.c
+++ b/arch/x86/platform/efi/memmap.c
@@ -93,6 +93,9 @@ int __init efi_memmap_install(struct efi_memory_map_data *data)
 {
 	efi_memmap_unmap();
 
+	if (efi_enabled(EFI_PARAVIRT))
+		return 0;
+
 	return __efi_memmap_init(data);
 }
 
diff --git a/drivers/firmware/efi/fdtparams.c b/drivers/firmware/efi/fdtparams.c
index e901f8564ca0..0ec83ba58097 100644
--- a/drivers/firmware/efi/fdtparams.c
+++ b/drivers/firmware/efi/fdtparams.c
@@ -30,11 +30,13 @@ static __initconst const char name[][22] = {
 
 static __initconst const struct {
 	const char	path[17];
+	u8		paravirt;
 	const char	params[PARAMCOUNT][26];
 } dt_params[] = {
 	{
 #ifdef CONFIG_XEN    //  <-------17------>
 		.path = "/hypervisor/uefi",
+		.paravirt = 1,
 		.params = {
 			[SYSTAB] = "xen,uefi-system-table",
 			[MMBASE] = "xen,uefi-mmap-start",
@@ -121,6 +123,8 @@ u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
 			pr_err("Can't find property '%s' in DT!\n", pname);
 			return 0;
 		}
+		if (dt_params[i].paravirt)
+			set_bit(EFI_PARAVIRT, &efi.flags);
 		return systab;
 	}
 notfound:
diff --git a/drivers/firmware/efi/memmap.c b/drivers/firmware/efi/memmap.c
index 3501d3814f22..9508082af907 100644
--- a/drivers/firmware/efi/memmap.c
+++ b/drivers/firmware/efi/memmap.c
@@ -44,9 +44,6 @@ int __init __efi_memmap_init(struct efi_memory_map_data *data)
 	struct efi_memory_map map;
 	phys_addr_t phys_map;
 
-	if (efi_enabled(EFI_PARAVIRT))
-		return 0;
-
 	phys_map = data->phys_map;
 
 	if (data->flags & EFI_MEMMAP_LATE)
-- 
2.35.1


