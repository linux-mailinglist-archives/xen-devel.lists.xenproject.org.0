Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF815F2F9C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 13:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414821.659261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofJax-0005bb-Ms; Mon, 03 Oct 2022 11:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414821.659261; Mon, 03 Oct 2022 11:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofJax-0005Xx-GT; Mon, 03 Oct 2022 11:26:47 +0000
Received: by outflank-mailman (input) for mailman id 414821;
 Mon, 03 Oct 2022 11:26:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1PaK=2E=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1ofJav-0004My-Ni
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 11:26:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4275023f-430e-11ed-9376-c1cf23e5d27e;
 Mon, 03 Oct 2022 13:26:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA64560F2F;
 Mon,  3 Oct 2022 11:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD778C433D6;
 Mon,  3 Oct 2022 11:26:40 +0000 (UTC)
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
X-Inumbo-ID: 4275023f-430e-11ed-9376-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664796403;
	bh=W8obWGwmcyzn5+VXhc6GfBg92Z+wLrsUyqrdMHjxep0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YTGegz+V40gx32fSy3+ERPuWauQ9SGX/uyZftYxZvb467SzxmwKVEXTMytzhQH7M4
	 1V2VKfiVYH7TcozRWRHaiRvjYuXJnU7IvA2olmMY0WGaftBs2Wudq34NFeznUROMkf
	 eEKT2c2BHrvwIO56Rzxa+c2tXnHsopKi5rFQ8dcQVnCQmh0iLDqkj0BYghKh88t0pV
	 ULDcjx0TaFehBTvC0LpqUhrWXl8AuGFXSEa+GLPK6LQT0oJW1e//vLHd+Ci6+dIj7n
	 xxJvJpZglhpkIcm+iL9P6RnGDwu7fekz6jzPSYG5rUJjgpQsCa8Ggp2E/znkC/Nfmw
	 X2n7ROAkqY1Aw==
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
Subject: [PATCH v2 4/6] efi: memmap: Disregard bogus entries instead of returning them
Date: Mon,  3 Oct 2022 13:26:23 +0200
Message-Id: <20221003112625.972646-5-ardb@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221003112625.972646-1-ardb@kernel.org>
References: <20221003112625.972646-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2717; i=ardb@kernel.org; h=from:subject; bh=W8obWGwmcyzn5+VXhc6GfBg92Z+wLrsUyqrdMHjxep0=; b=owEB7QES/pANAwAKAcNPIjmS2Y8kAcsmYgBjOsbbl+ejDPGi0x7EecnkWLLI5uBb8hfx+mNuYEHL SGFCPwKJAbMEAAEKAB0WIQT72WJ8QGnJQhU3VynDTyI5ktmPJAUCYzrG2wAKCRDDTyI5ktmPJBDfC/ 9BMiukxbjQZgrq2K+4VvI3jjsxzxCI4AmtyKuHFCUBrg62qhcftHWoNGouY0pXptyDabOuNA8Tczdq x93UinMLN5X0NyKvuGmQty4oFhA8rEpRD6B2KX/VHKtu6kwGFBF8gaXmWeGfFv8ZNaQUzZCW51+Ah6 xt81Vx4p8RGFSrmoIzV6bamToULbrhLug9i/9Jsd6mg7Ggpisdj5E2rLXjTIYgtsnnoEXnwZsp9gXW PeBo+4rcj7CsYM7PfupkE6/uX6qAiYPA3UV2nJ9mBJTahiFmwKA58HVUtsv3j16lIEdROHb/bqPvTY /Iw/rmhC+gDxqBhlWoytmTnJWKB1EZpKPo3WESWHuZFKxwFAoqgMWHTFXe5dTWPeEsDBh6rC4WLY7q ylZMZsE9c0QQw1zdPhqNFcK1cGUaorxsMrxlPNm8LYO+qpRsl4HaWKrvSoGF9BMB8PI9R2X+LmbP2Y lhrKABraz+MgDmjFbkI55I1cVGbvO3j4AVGjPmERfskUM=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit

The ESRT code currently contains some sanity checks on the memory
descriptor it obtains, but these can only trigger when the descriptor is
invalid (if at all).

So let's drop these checks, and instead, disregard descriptors entirely
if the start address is misaligned, or the number of pages reaches
beyond the end of the address space. Note that the memory map as a whole
could still be inconsistent, i.e., multiple entries might cover the same
area, or the address could be outside of the addressable VA space, but
validating that goes beyond the scope of these helpers.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/efi.c  | 13 +++++++------
 drivers/firmware/efi/esrt.c | 18 +-----------------
 2 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 11857af72859..55bd3f4aab28 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -461,19 +461,20 @@ int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
 	efi_memory_desc_t *md;
 
 	if (!efi_enabled(EFI_MEMMAP)) {
-		pr_err_once("EFI_MEMMAP is not enabled.\n");
+		pr_warn_once("EFI_MEMMAP is not enabled.\n");
 		return -EINVAL;
 	}
 
-	if (!out_md) {
-		pr_err_once("out_md is null.\n");
-		return -EINVAL;
-        }
-
 	for_each_efi_memory_desc(md) {
 		u64 size;
 		u64 end;
 
+		/* skip bogus entries */
+		if ((md->phys_addr & (EFI_PAGE_SIZE - 1)) ||
+		    (md->phys_addr > 0 &&
+		     (md->num_pages > (U64_MAX - md->phys_addr + 1) >> EFI_PAGE_SHIFT)))
+			continue;
+
 		size = md->num_pages << EFI_PAGE_SHIFT;
 		end = md->phys_addr + size;
 		if (phys_addr >= md->phys_addr && phys_addr < end) {
diff --git a/drivers/firmware/efi/esrt.c b/drivers/firmware/efi/esrt.c
index 2a2f52b017e7..8f86f2b0734b 100644
--- a/drivers/firmware/efi/esrt.c
+++ b/drivers/firmware/efi/esrt.c
@@ -247,9 +247,6 @@ void __init efi_esrt_init(void)
 	int rc;
 	phys_addr_t end;
 
-	if (!efi_enabled(EFI_MEMMAP))
-		return;
-
 	pr_debug("esrt-init: loading.\n");
 	if (!esrt_table_exists())
 		return;
@@ -263,21 +260,8 @@ void __init efi_esrt_init(void)
 		return;
 	}
 
-	max = efi_mem_desc_end(&md);
-	if (max < efi.esrt) {
-		pr_err("EFI memory descriptor is invalid. (esrt: %p max: %p)\n",
-		       (void *)efi.esrt, (void *)max);
-		return;
-	}
-
+	max = efi_mem_desc_end(&md) - efi.esrt;
 	size = sizeof(*esrt);
-	max -= efi.esrt;
-
-	if (max < size) {
-		pr_err("ESRT header doesn't fit on single memory map entry. (size: %zu max: %zu)\n",
-		       size, max);
-		return;
-	}
 
 	va = early_memremap(efi.esrt, size);
 	if (!va) {
-- 
2.35.1


