Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DLVMgmODWoIzQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 12:33:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133BA58BCF6
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 12:33:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313809.1583867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPeEj-0001ur-Uw; Wed, 20 May 2026 10:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313809.1583867; Wed, 20 May 2026 10:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPeEj-0001tT-SK; Wed, 20 May 2026 10:33:13 +0000
Received: by outflank-mailman (input) for mailman id 1313809;
 Wed, 20 May 2026 10:33:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <accek@invisiblethingslab.com>) id 1wPeEi-0001tL-H8
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 10:33:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPeEh-005eeI-T0
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 12:33:11 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <accek@invisiblethingslab.com>)
 id 6a0d8ddf-e002-0a2a0a5209dd-0a2a45058328-18
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 12:33:11 +0200
Received: from [202.12.124.153] (helo=fhigh-b2-smtp.messagingengine.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <accek@invisiblethingslab.com>)
 id 6a0d8de6-aaa8-0a2a45050019-ca0c7c99d4a1-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 12:33:11 +0200
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 590A27A00E8;
 Wed, 20 May 2026 06:33:09 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Wed, 20 May 2026 06:33:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 May 2026 06:33:06 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm3 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1779273189; x=1779359589; bh=ZzZRd/W+tw
	Uqe2StwJ6Eyg7n9htO5E4rntWCs+841Nw=; b=kXKq/+gPIJgFYtlBGfAwJ19V5E
	Q0Q44XkYpupxCV3Kkppy0UNSTMXUM5/feinb25g3+AcwkCrQo2u6PXU/j/XhYNX5
	glakQAO69I85vPRSWnEXY5oG7K1C9plc22VKhg9Knpgc4z+pImhheBnMvTd5uimk
	MOULPg2ZUcny7mV2EfaGqSHqI2YoKl+/Urwxgbm5FTRo474+WYsgiOmoDqIXzk9f
	LLZ3X14K5kpip8GkfzepPG623A7s3CaYePVxSc+EhN82uaOwhR0zv0MuCuRne/FR
	X50fE2UpOA19qr0wbxki7hhqF14MqDjyjDwtcqOGCmhuyNLQpDwV0fkVkPmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779273189; x=
	1779359589; bh=ZzZRd/W+twUqe2StwJ6Eyg7n9htO5E4rntWCs+841Nw=; b=M
	6/BMmMkQp02+XO39XlR6+3MdQKWzvCsySPhLID2T+Gve7yzmSnF85hEGcbPMszUG
	QmmoLJskBE9ZsRq0fO48x8gcOQRzXLOdLxXBo4Fd1uJnhum81XWXvjnLO98cPalM
	G3LH0jrWmkHyHiYvEA8pzTehPeTjsbnFu2Zc/9XiSQ7/AqRpgMXvaa3syoH2JEIa
	VvzOACS8zxI1ZAR27M9ZiF10dZmSeNWVUgBjt2mniW8BEwEP6bfxr1oDGnYD/c7c
	BgYdABEvNv5YfVhW8vTlYol4oJpuJv/1vfdVFSYC3h9RLHAhib8o+EqPbz4da+Xj
	4UhKCUG0QNMUNqg2foyJg==
X-ME-Sender: <xms:5I0Nava_KGOcmii07YGd8yeEXZrZRpVvkTaivlC8eo-7Tjrn6DjvEA>
    <xme:5I0NaiGzXr1qEMN_fBCr6DAZo84hxghiwKxJvUxq-JQwmswLY3xLGxH7Yj77Mk7Z4
    PgxSeR_UQnDqCXVKF9KBZMY09CLyQYhgxzC454e-0dobljI4FE>
X-ME-Received: <xmr:5I0Naqk4JT6gk5qMIGMUp84No-5854BMmVpLT5GF-7gZbUlGI0HfCWFD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeeggedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefuiiihmhho
    nhcutegtvggurgnkshhkihcuoegrtggtvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepheeuffeggfeuffduteelffdvtddvgfeg
    ffevvdetteekiefgvdekieduveeljeffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprggttggvkhesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhmpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
    pdhrtghpthhtohepohhlvghkshhiihdrkhhurhhotghhkhhosehgmhgrihhlrdgtohhmpd
    hrtghpthhtoheprggttggvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
    pdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprh
    gtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
    ohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtohepsggvrhhtrhgrnhgu
    rdhmrghrqhhuihhssegrrhhmrdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhorhiivg
    hlsegrmhgurdgtohhm
X-ME-Proxy: <xmx:5I0NanA9DeGsBOAMK_sCitHFJ65iYXjPQqwxoOOJs8g9LK5PgehEKw>
    <xmx:5I0NasBQgJqHnds0eoW_meL61UrklCQnfWWK7JOh2Ifq7BLBzEXEuA>
    <xmx:5I0NauEgTaC4uJYxnXEtoQ4Um_duL9PSuXPI9x9KMY_XIucDq-mE8A>
    <xmx:5I0Naj65SNxjDe1fGsGiWpN7g_hMjLWQxVA4YPXF-vRMM5OKSfyLkg>
    <xmx:5Y0Napxz-a0FctNQORJYjzAHN6jypM3VLc_ufmpxGnqO0UGMheWR8Ikr>
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
Subject: [PATCH v2 for-4.22] EFI: Fix boot from a device without a file system
Date: Wed, 20 May 2026 12:30:26 +0200
Message-ID: <809b9976089eaf02e864684461ced4e939dbcc83.1779271357.git.accek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <5ee376dc0df448437f386ab2606c42d63a515ca1.1779194154.git.accek@invisiblethingslab.com>
References: <5ee376dc0df448437f386ab2606c42d63a515ca1.1779194154.git.accek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1779273191-E2F94443-E4806041/0/0
X-purgate-type: clean
X-purgate-size: 9995
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 133BA58BCF6
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
Changes in v2:
 - Restructured along the lines Andrew and Marek both suggested on v1:
   defer get_parent_handle() until the first call site that actually
   needs a file.

   This mirrors the existing lazy pattern in ARM's
   allocate_module_file() in xen/arch/arm/efi/efi-boot.h, which was also
   changed to use the new ensure_dir_handle() helper.

Tests performed:
 - Same as v1: PXE-loaded GRUB chainloading UKI - failure without
   patch, success with patch
 - QEMU boot from EFI partition, with config, kernel and initrd on EFI
   partition too - success with and without patch (halts later in both
   cases due to unrelated issue)
 - Cross-compiling ARM64 - success

 xen/arch/arm/efi/efi-boot.h | 12 ++++----
 xen/arch/x86/efi/efi-boot.h |  9 ++++--
 xen/common/efi/boot.c       | 57 ++++++++++++++++++++++++-------------
 3 files changed, 50 insertions(+), 28 deletions(-)

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
index 9ea2183c0b..f90309624b 100644
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
@@ -1514,7 +1525,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
 
     if ( use_cfg_file )
     {
-        EFI_FILE_HANDLE dir_handle;
+        EFI_FILE_HANDLE dir_handle = NULL;
         EFI_HANDLE gop_handle;
         UINTN depth, cols, rows;
 
@@ -1526,31 +1537,33 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
 
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
@@ -1567,6 +1580,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
             if ( !name.s )
                 break;
             free_cfg();
+            ensure_dir_handle(loaded_image, &dir_handle, &file_name);
             if ( !read_file(dir_handle, s2w(&name), &cfg, NULL) )
             {
                 PrintStr(L"Chained configuration file '");
@@ -1578,13 +1592,14 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
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
@@ -1599,6 +1614,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
             name.s = get_value(&cfg, section.s, "ramdisk");
             if ( name.s )
             {
+                ensure_dir_handle(loaded_image, &dir_handle, &file_name);
                 read_file(dir_handle, s2w(&name), &ramdisk, NULL);
                 efi_bs->FreePool(name.w);
             }
@@ -1609,6 +1625,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
             name.s = get_value(&cfg, section.s, "xsm");
             if ( name.s )
             {
+                ensure_dir_handle(loaded_image, &dir_handle, &file_name);
                 read_file(dir_handle, s2w(&name), &xsm, NULL);
                 efi_bs->FreePool(name.w);
             }
@@ -1634,7 +1651,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
             }
         }
 
-        efi_arch_cfg_file_late(loaded_image, dir_handle, section.s);
+        efi_arch_cfg_file_late(loaded_image, &dir_handle, section.s);
 
         free_cfg();
 
-- 
2.53.0


