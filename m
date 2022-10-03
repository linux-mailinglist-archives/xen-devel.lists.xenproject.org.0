Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B8D5F2F9E
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 13:27:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414823.659283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofJb3-0006Po-Hm; Mon, 03 Oct 2022 11:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414823.659283; Mon, 03 Oct 2022 11:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofJb3-0006Ky-Cf; Mon, 03 Oct 2022 11:26:53 +0000
Received: by outflank-mailman (input) for mailman id 414823;
 Mon, 03 Oct 2022 11:26:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1PaK=2E=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1ofJb2-0004Xj-2F
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 11:26:52 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 463dc92d-430e-11ed-964a-05401a9f4f97;
 Mon, 03 Oct 2022 13:26:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 52C40B8105F;
 Mon,  3 Oct 2022 11:26:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83587C433D6;
 Mon,  3 Oct 2022 11:26:46 +0000 (UTC)
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
X-Inumbo-ID: 463dc92d-430e-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664796409;
	bh=9C7AAPmVD5BjjmNEGbxNnPMoOUW0Ie0fKwQ10Ayhy8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ef/m3g0HgmSAdlLxc6fqIZiY6+uN5iitg2tKlqJBx2kqyn1LxQerWZsFjBQKGZPPo
	 5UCqsf8JYBVwYIfm0t42Hd+d2AkVCw26i1ECycyFRk8twGtzgdzIzgWc12l/6u6YF6
	 LH5J/jNu7aqKOutEydBgmoMzH+yaikiyc6cA7saaEgHV1A3iyLAml1itploasROBbw
	 zlMGZ5MRNQ3RhSk4/QnAogqaAsUikGi6wXIXrS7VXzzc39CQEabYr11vCF3zMIXCFC
	 vMYmvKSVN6NxPaW7VX5h4lWeDPKFV5OOaSAzWX7+9Psix9WpMLL3i9IWNGwX55IQYM
	 bFfyndgoAL10w==
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
Subject: [PATCH v2 6/6] efi: Apply allowlist to EFI configuration tables when running under Xen
Date: Mon,  3 Oct 2022 13:26:25 +0200
Message-Id: <20221003112625.972646-7-ardb@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221003112625.972646-1-ardb@kernel.org>
References: <20221003112625.972646-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3156; i=ardb@kernel.org; h=from:subject; bh=9C7AAPmVD5BjjmNEGbxNnPMoOUW0Ie0fKwQ10Ayhy8c=; b=owEB7QES/pANAwAKAcNPIjmS2Y8kAcsmYgBjOsbenzLnpjmFV4NFmLKMBzkM6EYzVcY2tgtXvDcv bUFOheqJAbMEAAEKAB0WIQT72WJ8QGnJQhU3VynDTyI5ktmPJAUCYzrG3gAKCRDDTyI5ktmPJJBDC/ 43/+s+cosevfZ50pJwVpCc4I/DH7QKq7kvyhnFWKLHDPwOMJ93i8yiedrIbu95b4QIMIPJEc8tBq9y cW38DNbTE6rxfpTMb73VT4UiZ6bDN/qv+/x6zmOCHVaThg0MLBnjYO1SUCvck73IxWowiReFOO1WGA U7s9cJds+g1X15WxZf9dnt6+muhFLE2Dk5JXvjzjLPBfrXW14dHcCseM7PfBgtwrR8aSkv67OV1yTo mfZNAn3PtjxCdEsecnBhnrAytAQu4yW30XYa8DqqR6mLgjRSs7yzsdhtNCrO04A4C+eqjTpZAePYdy XXMRhHa/tIhzLLb+53o6W3/IUwm8sXP4fLwN892QVrkRXlRmwSmYcMiFf2neJxawz+DjREv9MSIa47 QJPwQvr6LGddffvkVCGaKavWwhMxpj3Q46J6qhGfbsF7f2vkS3Kso6HtD4OuXi3KVF1pcclOHbOvfT qiDRgl+P1O5UEKV58pQHT1jpiJ1EjxP/f4HUFXDu0VYmQ=
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

So when running under Xen, check the EFI memory descriptor covering the
start of the table, and disregard the table if it does not reside in
memory that is preserved by Xen.

Co-developed-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/efi.c |  7 ++++++
 drivers/xen/efi.c          | 24 ++++++++++++++++++++
 include/linux/efi.h        |  2 ++
 3 files changed, 33 insertions(+)

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 2c12b1a06481..0a4583c13a40 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -560,6 +560,13 @@ static __init int match_config_table(const efi_guid_t *guid,
 
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
index 74f3f6d8cdc8..c275a9c377fe 100644
--- a/drivers/xen/efi.c
+++ b/drivers/xen/efi.c
@@ -326,3 +326,27 @@ int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
 
         return 0;
 }
+
+bool __init xen_efi_config_table_is_usable(const efi_guid_t *guid,
+					   unsigned long table)
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
+	case EFI_RESERVED_TYPE:
+		return true;
+	}
+
+	return false;
+}
diff --git a/include/linux/efi.h b/include/linux/efi.h
index e0ee6f6da4b4..b0cba86352ce 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -1352,4 +1352,6 @@ struct linux_efi_initrd {
 /* Header of a populated EFI secret area */
 #define EFI_SECRET_TABLE_HEADER_GUID	EFI_GUID(0x1e74f542, 0x71dd, 0x4d66,  0x96, 0x3e, 0xef, 0x42, 0x87, 0xff, 0x17, 0x3b)
 
+bool xen_efi_config_table_is_usable(const efi_guid_t *, unsigned long table);
+
 #endif /* _LINUX_EFI_H */
-- 
2.35.1


