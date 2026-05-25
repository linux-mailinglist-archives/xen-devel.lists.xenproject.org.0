Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMdlJLmJFGrgOAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 19:41:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24615CD6C2
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 19:41:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319382.1587017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRZHe-00021w-UD; Mon, 25 May 2026 17:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319382.1587017; Mon, 25 May 2026 17:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRZHe-00020V-RH; Mon, 25 May 2026 17:40:10 +0000
Received: by outflank-mailman (input) for mailman id 1319382;
 Mon, 25 May 2026 17:40:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <accek@invisiblethingslab.com>) id 1wRZHd-00020P-AS
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 17:40:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRZHc-0013Iy-Ml
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 19:40:08 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <accek@invisiblethingslab.com>)
 id 6a148971-e002-0a2a0a5209dd-0a2a4509abe2-14
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 19:40:08 +0200
Received: from [103.168.172.156] (helo=fhigh-a5-smtp.messagingengine.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <accek@invisiblethingslab.com>)
 id 6a148976-2497-0a2a45090019-67a8ac9cdfc3-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 19:40:07 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 6CD6E1400051;
 Mon, 25 May 2026 13:40:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Mon, 25 May 2026 13:40:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 May 2026 13:40:00 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm3 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1779730806; x=1779817206; bh=UN1tCVrzEQOruACyzdmLbvIpTXgXCHXG
	x+kTPh86tw4=; b=UHiJ+RYRRy1iboOpNy72P7LDLeKbF4h17yI/rCJTDxOEIQd4
	fGdUkbAhmzPeWJhXlaROKSe1GnYenNm00LQYwov+eT1z+/KxNlMCsE4U9RnP0R6D
	+U8SnmPiTPBzNjs9IPSlxE064d/DAYpHPTe3qArkOxkC990niJ+SzTXRp7aNc8un
	wFGokQwmEIkrIreg4dRIW3zEfQWdwia7bPLrxUGrXlbgjQe1v7WLgBuVI4ul+DU4
	yPXsGbmWtW78Ajot4SD+V71nnx2IydoZnPrTYJOrnGZ2ks74AGljTE0r/RoVvPqP
	wmSxH1tFJQqAOGLkKV4DDO6wXPhjBf5hSZ6zZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1779730806; x=1779817206; bh=UN1tCVrzEQOruACyzdmLbvIpTXgX
	CHXGx+kTPh86tw4=; b=NLEFLWsF9A7x1VxJNam20SycqEhuNDS06p1TX0IF87fl
	AhIVURoBEfZ2FhP1MGHBY4343ZfKtNJLH5y1ccTsHfxjpjWzy5go4HqiSWT/t28V
	2AEQFHtSWmi+3WRwXVunS8vZSrmMgihjvI6zWWhM7+fR3Oe7zEyRPPeNvCSe28m8
	4AcHNhZyMsxQ0YBjQnpGPJvprNp193oeeKwKUxXZZ4gd3NBxmLhPOmoX+lw/e/S8
	BVG1HNr3FbdCFqucMmU7WzpnHKif4ntYSvNivfeuxK6zvkTz176M64l+clBVQL+N
	Mcfqt6sNY1t8/WsOXO4qsXF5e5Dk1yq3qf0hRB0+ng==
X-ME-Sender: <xms:dYkUau5sfDAe0FV_Af9dgv9YuYdGGCWn1PL4ZbZsSCApBX0HktBlfQ>
    <xme:dYkUarkoBty2GkuAYY7Ghw7vM4VuqUI4ywF90kJp52occMnx2E9tXcmz_mwnWopLz
    jYcBSrgm2zJX3fCRBqM8FwBSd-zbvFJc0bz6uGlmm9p8MX4hg>
X-ME-Received: <xmr:dYkUamHaOPeLXDPuRy2W5-SicZEegk5wu45dakOjfOA1wvyT72aMzkVXrQ>
X-ME-Proxy-Cause: dmFkZTGcyCBBM2XUZnPN6jxXYmxu2ix4ilCgvL7cY711i5OPMy4ilzn99AAg3v5bo+w4Yx
    lclcjZT4HfHWfDkMN4mlfdSd6nGkxkLfFqkUOzhyzXBCTnpvYzX+fYd5Oc+3oa7cHx4oF8
    xY1xxCA/j23VMy2LLxhI++RbbspWc1BkzRtwyk7laL6cUpbUl03ZzLDts4RtLMdZyVFRCP
    rpdY0b5S5U2QuBkyfYbniwu3G5i4gQOG2lTlIkdOSYSgg2yaaLcaByIvEaFzVzdy+TC1bJ
    hHohUprD21FCeN0UWXTPmkqGZOlcjGRWE50DEorRrr8z/X3kVCXCoZ3fMgMxi/x4TSGqAh
    s/qIrmXGeUJ9dTkLXX81UgS1cRO3rc5L5UpxlS7ru3JwLQeQHQbGY080QLIvlobyt/p+re
    g5R1emiRC0XF/i/kAbqL/3r7V1KVXPZKqXlkH3ZYR2uZo69n/l3e7wGQnsPVyZBI9dRPdW
    2MoT8w+2o2Qc1LJAYDR0sFHSaHnLPFsZ7us4zKss/s9k5UheVhPuSFnxYC6TdkjuVjJut/
    ht5mcyNUAQV19DOdyz1hQbR/DFKdg4W2FVRuizFgsx6RzVB42gMbsiKsJW8LHZUAEfLV2y
    DmU/kD0wGi/aNhJycs7aZNoTR6yW31tXA3WpHgZ8YnHU1vL/a92j1mq4m1mw
X-ME-Proxy: <xmx:dYkUashoVPf_xTixGlXJaDUWzmg__Zp5FCIizkE7_Yyzv4Fdchjycw>
    <xmx:dYkUajjV3kxpwkTx3LPBXQCL0cBT_J7k8Sc1cNRuswrUoFig3jDkrA>
    <xmx:dYkUavlXL6x9qTavFr8aaG7mBalES62erg3uCfh965nuHmShi0Ng5g>
    <xmx:dYkUana-OcPt2MTzz-t9v6hNvWAKg6F6rVRWLgLdZvZJzEBtVW7BJA>
    <xmx:dokUaunvIwTmj62HfkY3z9xXJbn7AHL_76CnE7bmmUe7NpMp2axxzBCH>
Feedback-ID: i792e4853:Fastmail
From: =?UTF-8?q?Szymon=20Aceda=C5=84ski?= <accek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	=?UTF-8?q?Szymon=20Aceda=C5=84ski?= <accek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 for-4.22] EFI: Fix boot from a device without a file system
Date: Mon, 25 May 2026 19:37:03 +0200
Message-ID: <79d8684ede3bf1e9abe02a2e5ed966a0ecd5949d.1779726979.git.accek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1779730808-8A38AA53-637CA9B5/0/0
X-purgate-type: clean
X-purgate-size: 10700
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[gmail.com,invisiblethingslab.com,citrix.com,kernel.org,xen.org,arm.com,amd.com,epam.com,apertussolutions.com,suse.com,vates.tech];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:accek@invisiblethingslab.com,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[accek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[accek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: A24615CD6C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When netbooting a unified Xen kernel image (via GRUB chainloader),
the resulting loaded_image->DeviceHandle does not support
SIMPLE_FILE_SYSTEM_PROTOCOL.

Instead of crashing via noreturn PrintErrMesg() in get_parent_handle(),
we defer calling this function until filesystem access is needed.
This way when booting UKI, get_parent_handle() is not called at all.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Suggested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Szymon Acedański <accek@invisiblethingslab.com>
---
Changes in v3:
 - read_file(): replaced unreachable `if ( !dir_handle )` branch with
   BUG_ON(!dir_handle), per Marek's suggestion.

Changes in v2:
 - Restructured along the lines Andrew and Marek both suggested on v1:
   defer get_parent_handle() until the first call site that actually
   needs a file.

   This mirrors the existing lazy pattern in ARM's
   allocate_module_file() in xen/arch/arm/efi/efi-boot.h, which was also
   changed to use the new ensure_dir_handle() helper.

Tested (same as v2):
 - PXE-loaded GRUB chainloading UKI - failure without patch, success
   with patch
 - QEMU boot from EFI partition, with config, kernel and initrd
   on EFI partition too - success with and without patch
 - Cross-compiling ARM64 - success

 xen/arch/arm/efi/efi-boot.h | 12 ++++---
 xen/arch/x86/efi/efi-boot.h |  9 +++--
 xen/common/efi/boot.c       | 66 +++++++++++++++++++++++--------------
 3 files changed, 54 insertions(+), 33 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index ea59de47e7..069cc68b0a 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -403,7 +403,7 @@ static void __init noreturn efi_arch_post_exit_boot(void)
 }
 
 static void __init efi_arch_cfg_file_early(const EFI_LOADED_IMAGE *image,
-                                           EFI_FILE_HANDLE dir_handle,
+                                           EFI_FILE_HANDLE *dir_handle,
                                            const char *section)
 {
     union string name;
@@ -419,8 +419,11 @@ static void __init efi_arch_cfg_file_early(const EFI_LOADED_IMAGE *image,
         name.s = get_value(&cfg, section, "dtb");
         if ( name.s )
         {
+            CHAR16 *fname;
+
             split_string(name.s);
-            read_file(dir_handle, s2w(&name), &dtbfile, NULL);
+            ensure_dir_handle(image, dir_handle, &fname);
+            read_file(*dir_handle, s2w(&name), &dtbfile, NULL);
             efi_bs->FreePool(name.w);
         }
     }
@@ -430,7 +433,7 @@ static void __init efi_arch_cfg_file_early(const EFI_LOADED_IMAGE *image,
 }
 
 static void __init efi_arch_cfg_file_late(const EFI_LOADED_IMAGE *image,
-                                          EFI_FILE_HANDLE dir_handle,
+                                          EFI_FILE_HANDLE *dir_handle,
                                           const char *section)
 {
 }
@@ -665,8 +668,7 @@ static int __init allocate_module_file(const EFI_LOADED_IMAGE *loaded_image,
     file_info->name_len = name_len;
 
     /* Get the file system interface. */
-    if ( !*dir_handle )
-        *dir_handle = get_parent_handle(loaded_image, &fname);
+    ensure_dir_handle(loaded_image, dir_handle, &fname);
 
     /* Load the binary in memory */
     read_file(*dir_handle, s2w(&module_name), &module_binary, NULL);
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 42a2c46b5e..d738b839ee 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -284,13 +284,13 @@ static void __init noreturn efi_arch_post_exit_boot(void)
 }
 
 static void __init efi_arch_cfg_file_early(const EFI_LOADED_IMAGE *image,
-                                           EFI_FILE_HANDLE dir_handle,
+                                           EFI_FILE_HANDLE *dir_handle,
                                            const char *section)
 {
 }
 
 static void __init efi_arch_cfg_file_late(const EFI_LOADED_IMAGE *image,
-                                          EFI_FILE_HANDLE dir_handle,
+                                          EFI_FILE_HANDLE *dir_handle,
                                           const char *section)
 {
     union string name;
@@ -304,9 +304,12 @@ static void __init efi_arch_cfg_file_late(const EFI_LOADED_IMAGE *image,
         name.s = get_value(&cfg, "global", "ucode");
     if ( name.s )
     {
+        CHAR16 *fname;
+
         microcode_set_module(mbi.mods_count);
         split_string(name.s);
-        read_file(dir_handle, s2w(&name), &ucode, NULL);
+        ensure_dir_handle(image, dir_handle, &fname);
+        read_file(*dir_handle, s2w(&name), &ucode, NULL);
         efi_bs->FreePool(name.w);
     }
 }
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 9ea2183c0b..2971ea8696 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -547,6 +547,17 @@ static EFI_FILE_HANDLE __init get_parent_handle(const EFI_LOADED_IMAGE *loaded_i
     return dir_handle;
 }
 
+static void __init ensure_dir_handle(const EFI_LOADED_IMAGE *loaded_image,
+                                     EFI_FILE_HANDLE *dir_handle,
+                                     CHAR16 **file_name)
+{
+    if ( *dir_handle )
+        return;
+    *dir_handle = get_parent_handle(loaded_image, file_name);
+    if ( !*dir_handle )
+        blexit(L"Cannot load files without a usable file system");
+}
+
 static CHAR16 *__init point_tail(CHAR16 *fn)
 {
     CHAR16 *tail = NULL;
@@ -838,12 +849,11 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
     if ( !name )
         PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
 
+    BUG_ON(!dir_handle);
+
     what = L"Open";
-    if ( dir_handle )
-        ret = dir_handle->Open(dir_handle, &FileHandle, name,
-                               EFI_FILE_MODE_READ, 0);
-    else
-        ret = EFI_NOT_FOUND;
+    ret = dir_handle->Open(dir_handle, &FileHandle, name,
+                           EFI_FILE_MODE_READ, 0);
     if ( file == &cfg && ret == EFI_NOT_FOUND )
         return false;
     if ( EFI_ERROR(ret) )
@@ -1514,7 +1524,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
 
     if ( use_cfg_file )
     {
-        EFI_FILE_HANDLE dir_handle;
+        EFI_FILE_HANDLE dir_handle = NULL;
         EFI_HANDLE gop_handle;
         UINTN depth, cols, rows;
 
@@ -1526,31 +1536,33 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
 
         gop = efi_get_gop(&gop_handle);
 
-        /* Get the file system interface. */
-        dir_handle = get_parent_handle(loaded_image, &file_name);
-
         /* Read and parse the config file. */
         if ( read_section(loaded_image, L"config", &cfg, NULL) )
             PrintStr(L"Using builtin config file\r\n");
-        else if ( !cfg_file_name && file_name )
+        else
         {
-            CHAR16 *tail;
+            ensure_dir_handle(loaded_image, &dir_handle, &file_name);
 
-            while ( (tail = point_tail(file_name)) != NULL )
+            if ( !cfg_file_name )
             {
-                wstrcpy(tail, L".cfg");
-                if ( read_file(dir_handle, file_name, &cfg, NULL) )
-                    break;
-                *tail = 0;
+                CHAR16 *tail;
+
+                while ( (tail = point_tail(file_name)) != NULL )
+                {
+                    wstrcpy(tail, L".cfg");
+                    if ( read_file(dir_handle, file_name, &cfg, NULL) )
+                        break;
+                    *tail = 0;
+                }
+                if ( !tail )
+                    blexit(L"No configuration file found.");
+                PrintStr(L"Using configuration file '");
+                PrintStr(file_name);
+                PrintStr(L"'\r\n");
             }
-            if ( !tail )
-                blexit(L"No configuration file found.");
-            PrintStr(L"Using configuration file '");
-            PrintStr(file_name);
-            PrintStr(L"'\r\n");
+            else if ( !read_file(dir_handle, cfg_file_name, &cfg, NULL) )
+                blexit(L"Configuration file not found.");
         }
-        else if ( !read_file(dir_handle, cfg_file_name, &cfg, NULL) )
-            blexit(L"Configuration file not found.");
         pre_parse(&cfg);
 
         if ( section.w )
@@ -1567,6 +1579,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
             if ( !name.s )
                 break;
             free_cfg();
+            ensure_dir_handle(loaded_image, &dir_handle, &file_name);
             if ( !read_file(dir_handle, s2w(&name), &cfg, NULL) )
             {
                 PrintStr(L"Chained configuration file '");
@@ -1578,13 +1591,14 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
             efi_bs->FreePool(name.w);
         }
 
-        efi_arch_cfg_file_early(loaded_image, dir_handle, section.s);
+        efi_arch_cfg_file_early(loaded_image, &dir_handle, section.s);
 
         option_str = name.s ? split_string(name.s) : NULL;
 
         if ( !read_section(loaded_image, L"kernel", &kernel, option_str) &&
              name.s )
         {
+            ensure_dir_handle(loaded_image, &dir_handle, &file_name);
             read_file(dir_handle, s2w(&name), &kernel, option_str);
             efi_bs->FreePool(name.w);
         }
@@ -1599,6 +1613,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
             name.s = get_value(&cfg, section.s, "ramdisk");
             if ( name.s )
             {
+                ensure_dir_handle(loaded_image, &dir_handle, &file_name);
                 read_file(dir_handle, s2w(&name), &ramdisk, NULL);
                 efi_bs->FreePool(name.w);
             }
@@ -1609,6 +1624,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
             name.s = get_value(&cfg, section.s, "xsm");
             if ( name.s )
             {
+                ensure_dir_handle(loaded_image, &dir_handle, &file_name);
                 read_file(dir_handle, s2w(&name), &xsm, NULL);
                 efi_bs->FreePool(name.w);
             }
@@ -1634,7 +1650,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
             }
         }
 
-        efi_arch_cfg_file_late(loaded_image, dir_handle, section.s);
+        efi_arch_cfg_file_late(loaded_image, &dir_handle, section.s);
 
         free_cfg();
 
-- 
2.53.0


