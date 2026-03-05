Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MNUDSfXqWl5GAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 20:19:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE8C2175B6
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 20:19:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247047.1545945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyEDJ-0004Bc-Qz; Thu, 05 Mar 2026 19:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247047.1545945; Thu, 05 Mar 2026 19:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyEDJ-00049H-Ng; Thu, 05 Mar 2026 19:18:25 +0000
Received: by outflank-mailman (input) for mailman id 1247047;
 Thu, 05 Mar 2026 19:18:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBnC=BF=gmail.com=soumyajyotisarkar23@srs-se1.protection.inumbo.net>)
 id 1vyEDI-00048o-Ks
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 19:18:24 +0000
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [2607:f8b0:4864:20::641])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13a29844-18c8-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 20:18:23 +0100 (CET)
Received: by mail-pl1-x641.google.com with SMTP id
 d9443c01a7336-2addb31945aso61081585ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 11:18:23 -0800 (PST)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae4d3113e0sm142965715ad.79.2026.03.05.11.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 11:18:21 -0800 (PST)
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
X-Inumbo-ID: 13a29844-18c8-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772738301; x=1773343101; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwGP8ee4LidY7BRMCtYUVmJPzJVamR1lF04CTiEUcS8=;
        b=mVj/HPLH59ySa0qeybCGo8aweuZ9xWgK7HiIqoTHs93KCxnD/2VkGlS8lvHcxLk7Jq
         MvAim8d3kAKxrDDEM8oS703uzFhNrO3S6zJ+hYENZJTMvtHUm6yrbiBcKJ7ybzTrl+rf
         fDtkaAiNJMrtxtQzRMI0YQ9VhSgKQ6UZE8uGlzumoYjiQX1SXeeRcM3IjrA1nc8sTkB7
         P6NZMbEPQTNG+6BbysgdfyhS2NEltH1KSGL2EhWQRaX6VU+nLRQsJgyUibDNWDKpZm12
         O7FrexFPwr2vAaseBoHsQsn0NDyIpHa+qJSUmOH742te63LIa93+X71cPKLkg2Z5oQ++
         BAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738301; x=1773343101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OwGP8ee4LidY7BRMCtYUVmJPzJVamR1lF04CTiEUcS8=;
        b=K6FSGe94V8qADGoMhrOFMAKHRZEN9qwjqwgpisG1vNRQIgDFiODRCRbIZXTAE73ghr
         vqxN3XsJAqCj5NfBL2Zxky1c2uFMwHAimMFwQBnjd66BQG/rPqOznd7Zau96/gGJ0Gjf
         qdb3qVRRTOfCXu//LPZq8zsitV6OXGOGmu94qQa3bUH8lif3s4MQ0NufWxKXjI3ysrnY
         QPYPQccvy6r/fSjgE2ejBIl12FwgDZmeSQKsuSy5mj8VyRYs4uafBaUEY1pZNVAbTSaT
         ofeEVnnwyBgZ1Z2gyuoeqdjpu/CyBtIesslQS/WFLC4ddgtoQTNrPUeByCrM4i2T8tSg
         0rTw==
X-Gm-Message-State: AOJu0Yz3VEP/emR705QWaDHelpsjbbDwYlm97xYud3HzC+I+0i7y4kDz
	ON1yXoW88rMy3FB0V8JITM9jK3EkRVshWBtuB0eHFliwqb+ttDlCBwaCH1Vn845y
X-Gm-Gg: ATEYQzztpCTLf0LcoIHOLgJbCn3B+iJrStgzicq/A8wY6oq4xXHN00b1kST5hD0zOCf
	mZLh3x8nrar7Rn8Wd14+eRKrJPx8JMMm4hHFdG5PgjOGB3fCvCpcUrBMNJx9ydjdez0Y0n14AnF
	cMbXUNu1TV8Kv+WJ0dPfmgd9w6S/DSqmDZjPudw/klt2F+zvab/Yoqt0ABhMG9TUZr/dY1GtKeG
	jKNF2LrXHtrOCoD/9d4SSjPviwM+rQIayMgXVKUIQgvPJybu7hSU/oi5OPbCRRYCUBm+Qs/BBXx
	MlT+oK04aF1YDbcq5KmzrkqJY8gxssbE0hWfu2Gk3nTrpouBocgBznxZH30KPNuE1iyu1zQo0Lv
	vN+QOIE47+W4wRJj87h7K51UuVul7UUmeon2gg0UqcLppbbQAULYGNe+Nhkr16Inz14UfGQljVp
	3S8DJhVzJtvfG5+CkGlTnwRs4PF7z7u6h6q/qci/IrVEGbgCxRBksS7FzmR1QuHzhy6L9w+vvLs
	HL7DactnZfDDbOgk38lzFAAt/LHmb3ioZzm8NDjTa8MJ8a678grpX0zUlJi+c1C1NCX9wTHMw==
X-Received: by 2002:a17:903:2445:b0:2ae:588a:f3e5 with SMTP id d9443c01a7336-2ae6aaae636mr70140825ad.30.1772738301473;
        Thu, 05 Mar 2026 11:18:21 -0800 (PST)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH 1/3] x86/efi: Add BGRT image preservation during boot
Date: Fri,  6 Mar 2026 00:48:08 +0530
Message-ID: <20260305191810.31033-2-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305191810.31033-1-soumyajyotisarkar23@gmail.com>
References: <20260305191810.31033-1-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DBE8C2175B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.com,apertussolutions.com,citrix.com,invisiblethingslab.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[lists.xenproject.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:andrew.cooper3@citrix.com,m:soumyajyotisarkar23@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

The ACPI BGRT (Boot Graphics Resource Table) contains a pointer to a
boot logo image stored in BootServicesData memory. When Xen reclaims
this memory during boot, the image is lost and the BGRT table becomes
invalid, causing Linux dom0 to report ACPI checksum errors.

Add preservation logic similar to ESRT table handling:
- Locate BGRT table via XSDT during EFI boot services phase
- Validate BMP image signature and size (max 16 MB)
- Copy image to EfiACPIReclaimMemory (safe from reclamation)
- Update BGRT table with new image address
- Recalculate ACPI table checksum

The preservation runs automatically during efi_exit_boot() before
Boot Services are terminated. This ensures the image remains
accessible to dom0.

Open coded ACPI parsing is used because Xen's ACPI subsystem is not
available during the EFI boot phase. The RSDP is obtained from the
EFI System Table, and the XSDT is walked manually to find BGRT.

Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
---
 xen/arch/x86/efi/efi-boot.h |   2 +
 xen/common/efi/boot.c       | 187 ++++++++++++++++++++++++++++++++++++
 2 files changed, 189 insertions(+)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 42a2c46b5e..27792a56ff 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -910,6 +910,8 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle,

     efi_relocate_esrt(SystemTable);

+    efi_preserve_bgrt_img(SystemTable);
+
     efi_exit_boot(ImageHandle, SystemTable);
 }

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 967094994d..1e3489e902 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -7,6 +7,7 @@
 #include <xen/ctype.h>
 #include <xen/dmi.h>
 #include <xen/domain_page.h>
+#include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/keyhandler.h>
 #include <xen/lib.h>
@@ -173,6 +174,14 @@ static struct file __initdata ramdisk;
 static struct file __initdata xsm;
 static const CHAR16 __initconst newline[] = L"\r\n";

+static __initdata struct {
+    bool preserved;
+    uint64_t old_addr;
+    uint64_t new_addr;
+    uint32_t size;
+    const char *failure_reason;
+} bgrt_debug_info;
+
 static void __init PrintStr(const CHAR16 *s)
 {
     StdOut->OutputString(StdOut, (CHAR16 *)s );
@@ -747,6 +756,171 @@ static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
     efi_bs->FreePool(memory_map);
 }

+struct bmp_header {
+    uint16_t signature;
+    uint32_t file_size;
+    uint16_t reserved_1;
+    uint16_t reserved_2;
+    uint32_t data_offset;
+} __attribute__((packed));
+
+/*
+ * ACPI Structures - defined locally,
+ * since we cannot include acpi headers
+ * in EFI Context.
+ */
+
+struct acpi_rsdp {
+    char signature[8];
+    uint8_t checksum;
+    char oem_id[6];
+    uint8_t revision;
+    uint32_t rsdt_physical_address;
+    uint32_t length;
+    uint64_t xsdt_physical_address;
+    uint8_t extended_checksum;
+    uint8_t reserved[3];
+} __attribute__((packed));
+
+struct acpi_table_header {
+    char signature[4];
+    uint32_t length;
+    uint8_t revision;
+    uint8_t checksum;
+    char oem_id[6];
+    char oem_table_id[8];
+    uint32_t oem_revision;
+    uint32_t asl_compiler_id;
+    uint32_t asl_compiler_revision;
+} __attribute__((packed));
+
+struct acpi_xsdt {
+    struct acpi_table_header header;
+    uint64_t table_offset_entry[1]; /* Variable array length */
+} __attribute__((packed));
+
+struct acpi_bgrt {
+    struct acpi_table_header header;
+    uint16_t version;
+    uint8_t status;
+    uint8_t image_type;
+    uint64_t image_address;
+    uint32_t image_offset_x;
+    uint32_t image_offset_y;
+} __attribute__((packed));
+
+static struct acpi_bgrt* __init find_bgrt_table(EFI_SYSTEM_TABLE *SystemTable)
+{
+    EFI_GUID acpi2_guid = ACPI_20_TABLE_GUID;
+    struct acpi_rsdp *rsdp = NULL;
+    struct acpi_xsdt *xsdt;
+    struct acpi_bgrt *bgrt;
+    uint32_t entry_count, actual_size;
+    unsigned int i;
+
+    for ( i = 0; i < SystemTable->NumberOfTableEntries; i++ )
+    {
+        if ( match_guid(&acpi2_guid, &SystemTable->ConfigurationTable[i].VendorGuid) )
+        {
+            rsdp = SystemTable->ConfigurationTable[i].VendorTable;
+            break;
+        }
+    }
+
+    if ( !rsdp || !rsdp->xsdt_physical_address )
+        return NULL;
+
+    xsdt = (struct acpi_xsdt *)rsdp->xsdt_physical_address;
+    if ( !xsdt )
+        return NULL;
+
+    actual_size = (xsdt->header.length - sizeof(struct acpi_table_header));
+    entry_count = (actual_size / sizeof(uint64_t));
+
+    for ( i = 0; i < entry_count; i++ )
+    {
+        struct acpi_table_header *header = (struct acpi_table_header *)xsdt->table_offset_entry[i];
+
+        if (   header->signature[0] == 'B'
+            && header->signature[1] == 'G'
+            && header->signature[2] == 'R'
+            && header->signature[3] == 'T' )
+        {
+            bgrt = (struct acpi_bgrt *)header;
+            return bgrt;
+        }
+    }
+    return NULL;
+}
+
+#define MAX_IMAGE_SIZE  (16 * 1024 * 1024)    /* Sanity check: reject if bigger */
+
+static void __init efi_preserve_bgrt_img(EFI_SYSTEM_TABLE *SystemTable)
+{
+    struct acpi_bgrt *bgrt;
+    struct bmp_header *bmp;
+    void *old_image, *new_image;
+    uint32_t image_size;
+    EFI_STATUS status;
+    uint8_t checksum;
+    unsigned int i;
+
+    bgrt_debug_info.preserved = false;
+    bgrt_debug_info.failure_reason = NULL;
+
+    bgrt = find_bgrt_table(SystemTable);
+    if ( !bgrt )
+    {
+        bgrt_debug_info.failure_reason = "BGRT table not found in XSDT";
+        return;
+    }
+
+    if ( !bgrt->image_address )
+    {
+        bgrt_debug_info.failure_reason = "BGRT image_address is NULL";
+        return;
+    }
+
+    old_image = (void *)bgrt->image_address;
+    bmp = (struct bmp_header *)old_image;
+
+    if ( bmp->signature != 0x4D42 )
+    {
+        bgrt_debug_info.failure_reason = "Invalid BMP signature";
+        return;
+    }
+
+    image_size = bmp->file_size;
+    if ( !image_size || image_size > MAX_IMAGE_SIZE )
+    {
+        bgrt_debug_info.failure_reason = "Invalid image size";
+        return;
+    }
+
+    status = efi_bs->AllocatePool(EfiACPIReclaimMemory, image_size, &new_image);
+    if ( status != EFI_SUCCESS || !new_image )
+    {
+        bgrt_debug_info.failure_reason = "Memory allocation failed";
+        return;
+    }
+
+    memcpy(new_image, old_image, image_size);
+
+    bgrt->image_address = (uint64_t)new_image;
+    bgrt->status |= 0x01;
+
+    bgrt->header.checksum = 0;
+    checksum = 0;
+    for ( i = 0; i < bgrt->header.length; i++ )
+        checksum += ((uint8_t *)bgrt)[i];
+    bgrt->header.checksum = (uint8_t)(0 - checksum);
+
+    bgrt_debug_info.preserved = true;
+    bgrt_debug_info.old_addr = (uint64_t)old_image;
+    bgrt_debug_info.new_addr = (uint64_t)new_image;
+    bgrt_debug_info.size = image_size;
+}
+
 /*
  * Include architecture specific implementation here, which references the
  * static globals defined above.
@@ -1794,6 +1968,19 @@ void __init efi_init_memory(void)
     if ( !efi_enabled(EFI_BOOT) )
         return;

+    if ( bgrt_debug_info.preserved )
+    {
+        printk(XENLOG_INFO "EFI: BGRT image preserved: %u KB\n",
+               bgrt_debug_info.size / 1024);
+        printk(XENLOG_INFO "EFI: BGRT relocated from %#" PRIx64 " to %#" PRIx64 "\n",
+               bgrt_debug_info.old_addr, bgrt_debug_info.new_addr);
+    }
+    else if ( bgrt_debug_info.failure_reason )
+    {
+        printk(XENLOG_WARNING "EFI: BGRT preservation failed: %s\n",
+               bgrt_debug_info.failure_reason);
+    }
+
     printk(XENLOG_DEBUG "EFI memory map:%s\n",
            map_bs ? " (mapping BootServices)" : "");
     for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
--
2.53.0


