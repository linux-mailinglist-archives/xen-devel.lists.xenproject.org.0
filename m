Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jKuiJOTWqmnmXgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 14:30:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 395C6221A17
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 14:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247723.1546198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyVFX-000130-Cf; Fri, 06 Mar 2026 13:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247723.1546198; Fri, 06 Mar 2026 13:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyVFX-00011V-86; Fri, 06 Mar 2026 13:29:51 +0000
Received: by outflank-mailman (input) for mailman id 1247723;
 Fri, 06 Mar 2026 13:29:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GgqK=BG=gmail.com=soumyajyotisarkar23@srs-se1.protection.inumbo.net>)
 id 1vyVFW-00011B-6d
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 13:29:50 +0000
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [2607:f8b0:4864:20::644])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bca8102-1960-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 14:29:48 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-2aae146b604so69863395ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 05:29:48 -0800 (PST)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae840ad92fsm34784815ad.77.2026.03.06.05.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 05:29:46 -0800 (PST)
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
X-Inumbo-ID: 8bca8102-1960-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772803787; x=1773408587; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kC4SJGNXCr1rdhgZ8HB/0dsT03+rkfzmTNu95O6q6TM=;
        b=J6sVUthoAemQwei/GjkRWcKzmkBYijZOvCC1DOaLbubTqF/4FYd9JO0Uu+6qlbqul5
         wgewO9doJbV3qYILqx3PlTgWXKJXMF5SDIf6REladQIWLpvVU2be3vU5DY6dip0RSDbu
         imbz0JMr+BSax5ShR8k7s4YlpxMudhJo1/e9LGQkZzFnn0BdpHpv3ZHeKpAe1bik7C3U
         4DCj2G7A/1Amz4H/TX7tbt8nzD/7/qNubZMwZ+M/vd3Dwnc99k/iygS2bBfhMn3VPxXh
         PxYRapYPaDir08Ce+uTUgXjI2C7hwkidXCptSyL2vPGhXnvTSUdw27n2kxizK1fvRDg0
         0RPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772803787; x=1773408587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kC4SJGNXCr1rdhgZ8HB/0dsT03+rkfzmTNu95O6q6TM=;
        b=NAd7/iFBuLDQj+H8aTBy10IIY9VB0Km8YolxD6CcqqZPPggDpQmf7fzL0UiWlmTDWy
         InVy9dCE/nCZbb0vkzdzz4n5VCPfKfAk1z8MD6B0LBT5cjeXdcVrqpwoQ2xqaG4GLkGa
         q4cJq+XPIdzfJPXEkspyo4K9HPPnVFIMtHo1TrLXs/g4vm6k9sWGW/CELBQjtjg4gjz4
         LYWaYBHR5r5/4HvZWBklSAvvo14kdeeeoT3ikZXRb+AbR1mwIilcPqxLOFCi5yyhCLFk
         uQLAquXodn784ADABHp7gNDfpiLYlpi86gGIAX+m/nhDQ9GVyYqVClREzKBbJth8lhaS
         tXEQ==
X-Gm-Message-State: AOJu0YzfZSuq1ENxOwHJwQFRgpAvwpwvlIwwGL5CJHElIi5lPtpAE2BZ
	s0vtNsMYYc44pl2XfqqSiq1Kgk59LMKAXsLF3ZsijjyOfdJeDw6loZ8t0FXCBtqn
X-Gm-Gg: ATEYQzyGcgrJZ5ZYMsSV55OrslopxURtLiusty09ldvtxc22ZTeiQQmAj55lqziB4ZR
	atUq+dJ1BI5vEaW+SL9B88bcxaBREOG7ZtTx4YY5S3fN6ko3FD4jNimFF3MiVomCES0zeAN8EdO
	sVixpod5MHw96XSMtAYd/OrgkuzBrZECBI5aB8fxFyC/PUGbclKGGS0Wa6GgCJ3MEcVmVvf4vbc
	wqh+/1uuOdpNITVvyblqZVglLusRa95eGYza6sMHEDffD9bMjy/zaP8ZEbE/OmPqBkAHNcMGyOS
	ohs7AFeL9+7CIx7+AXgz/THARlzxFTzryBqbTMcIsBcwMqMgOhig+qnYIWsPCP+ulXyyug8g8aI
	l2fjKATZWckFRdNZTpWHlpNpH51cZLKJEPtHftq0vu/nw+yZu0AL9AtBLRs+LPzDG4aEDx92sVv
	2iuq+zEj+aE98gFrFyJQDFmbnV0i2QKtTese/6/MFdBAj9Gosn/Q7EcFrRKJHlVX9C2rQI0jmq6
	vxGZaEjN6Nfg1KIKDfAcVmtWt5LQh6isJ1x81Ltw0Hh0UsGU8hugZaWu8lcgeADIm/l0PP/Qa9W
	HgeZS96J
X-Received: by 2002:a17:903:3808:b0:2ab:3cba:42fa with SMTP id d9443c01a7336-2ae82478619mr24900085ad.46.1772803786754;
        Fri, 06 Mar 2026 05:29:46 -0800 (PST)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH v2 1/3] x86/efi: Add BGRT image preservation during boot
Date: Fri,  6 Mar 2026 18:59:33 +0530
Message-ID: <20260306132935.13727-2-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306132935.13727-1-soumyajyotisarkar23@gmail.com>
References: <20260306132935.13727-1-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 395C6221A17
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

Open-coded ACPI parsing is used because Xen's ACPI subsystem is not
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


