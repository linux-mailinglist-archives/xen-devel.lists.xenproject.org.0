Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I6YLiKgsmkOOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:14:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BA6270B5A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:14:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252014.1548806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0dzn-0002Pm-KL; Thu, 12 Mar 2026 11:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252014.1548806; Thu, 12 Mar 2026 11:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0dzn-0002NN-HH; Thu, 12 Mar 2026 11:14:27 +0000
Received: by outflank-mailman (input) for mailman id 1252014;
 Thu, 12 Mar 2026 11:14:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7O7=BM=gmail.com=soumyajyotisarkar23@srs-se1.protection.inumbo.net>)
 id 1w0dzm-00028I-U6
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:14:26 +0000
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [2607:f8b0:4864:20::641])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0bd6a30-1e04-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 12:14:26 +0100 (CET)
Received: by mail-pl1-x641.google.com with SMTP id
 d9443c01a7336-2ae88e16485so7067395ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 04:14:26 -0700 (PDT)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aeae34eaacsm49271645ad.49.2026.03.12.04.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 04:14:23 -0700 (PDT)
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
X-Inumbo-ID: a0bd6a30-1e04-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773314064; x=1773918864; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPerCwQjjELYfGowH6evflvClMRzfpgAd8/IYGd3nUo=;
        b=mDebFh2bQ5yIw+y0cb2hdOzNRGLJ8VTeuY5SUkV0+B5rSOrHh7bUKwGALpygOKehm2
         mgl16lGkVUB9o11mQKVjaZYiylI22UBvJpYkF25sblHu3m4qUgKRjsWeUC/W7YHMfgIf
         BnYAMC/smos1C8pbz1MpcOKbADAZGzE4p8nW3aN56M0pAGdlBc6VL0BV6TtF+nBijyoh
         g4wGPn2zXE3t4gkj5E7onZgsPGHNvLnUWguqBOuvGFMAKXFuU7+6mWF3GGgF1zg0vx1n
         NSQAZQXrbmXvwKjOx0+Yq81NOFwi1G+eA/PXghEbxchUylXxAa+0UdTz0YhQ4FlxlKDy
         fcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773314064; x=1773918864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RPerCwQjjELYfGowH6evflvClMRzfpgAd8/IYGd3nUo=;
        b=NhR/j5JaT2BMnF1zOpYindi9vN+JCeu2pdSFHEb3Aa/OsLioSLlgXdRpsL6rSH0cip
         UYAyJHJg0ExGD7/YtCT5FSosPg3/4vrcZ4mT8XQKyHt0nmBI8JYRcF9aggTyaXU6j48R
         omqtpcN0Xkm41rxTTcn7IAjaEdPSpLSS8KlA5oWY1n2YrLTEPDq8MLgj1cAjUIBET9Gq
         U/3rQPPPPirv35dUEkeR/vCSwo/0bKwP4x/kKFo7qcxgc0lEP9B0emrdN9MHQXpMXxWM
         dt5Njtp+oRwpqqpGgC9LWqTVcewKpHwReqKOEcFL6M2+stttIwR1W48olA7ul0lIosQP
         KldA==
X-Gm-Message-State: AOJu0Yw27j4aQYyOiIL/6rDcJ9gxtzI7gqBQ/qCMOp4sprBQhxA5TB8B
	HtTUhWGIbUdkAyQQeo6UINo4f55D056zlvawOf0bY9nFUZvX5l3Yp9/ELlL1oCAz
X-Gm-Gg: ATEYQzxfeqe7Z1UxsO5Q8FPraMxIiDABdVQX7WUjcg3suIgmzKF/1PpCiZ5ecoYSpKk
	GCzz7b74CmI2BvcsoUEkoBHFeZeamVFkxHwFZj4c1GWc2ta+UdyFVEzbanifhKtd071fx5oQRxB
	PcH5g+I/1gpiH7U46DgbaFUnc0lYtH0C4YQkwUsmVcOLAyYGelP35yTDDDKOpOmOfVPhoHuNw14
	mTbatBZOnVyjWCitf+O/KBd/qUJtHFv2c88Lua0ajJV/KLDyMAt6Dd/GN9gho5eBv2CAf+7ZTrS
	7aIrNsUrQ5UgVZJIbydbXCv9nHx5il5nWcfNHYO9O9tDbx3c1/fbuBMWFYPBL6x85l4bmNdXBny
	Q9FSTzGv2zwkxjniJPqGnyAlnU+FiSFhXjc5O1otiXvAn3dHLQ5Nm3BMTm9M25X6luNzhARSQcN
	NugBi36N3QUlauLpjr1Ml+Gbwwd6bxkQILR8HvdWd4DaK/tRKRBn6F6+3pFczKKl0ZgXJXpu1W7
	FcMdjMXBsWUZYRIWEaTXsJCML9J1Il/thsWgd8+2cYgtfDfKqiX6ALZKyZTSpYDrKsA6jTt5g==
X-Received: by 2002:a17:903:1a30:b0:2ae:4d23:334d with SMTP id d9443c01a7336-2aeae9207f4mr58137715ad.56.1773314064003;
        Thu, 12 Mar 2026 04:14:24 -0700 (PDT)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [RFC PATCH v3 1/3] x86/efi: Add BGRT image preservation infrastructure
Date: Thu, 12 Mar 2026 16:44:12 +0530
Message-ID: <20260312111414.17808-2-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312111414.17808-1-soumyajyotisarkar23@gmail.com>
References: <20260312111414.17808-1-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,apertussolutions.com,invisiblethingslab.com,suse.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lists.xenproject.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:soumyajyotisarkar23@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 30BA6270B5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add core EFI boot services code to preserve BGRT (Boot Graphics Resource
Table) images during Xen boot. The BGRT contains a pointer to a boot logo
stored in BootServicesData memory. Without preservation, this memory is
reclaimed causing ACPI checksum errors in dom0.

Implementation:
- Walk XSDT to locate BGRT table (reusing efi.acpi20 from efi_tables())
- Validate BMP image signature and size constraints (max 16MB)
- Allocate EfiACPIReclaimMemory and copy image data
- Update BGRT table with new address and recalculate checksum

The preservation follows the ESRT pattern, running before
ExitBootServices() to ensure image remains accessible.

Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
---
 xen/arch/x86/efi/efi-boot.h |   2 +
 xen/common/efi/boot.c       | 133 ++++++++++++++++++++++++++++++++++++
 2 files changed, 135 insertions(+)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 42a2c46b5e..0547d845cd 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -910,6 +910,8 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle,

     efi_relocate_esrt(SystemTable);

+    efi_preserve_bgrt_img();
+
     efi_exit_boot(ImageHandle, SystemTable);
 }

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 967094994d..e6451130ce 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1,12 +1,16 @@
 #include "efi.h"
 #include <efi/efiprot.h>
 #include <efi/efipciio.h>
+#include <acpi/acconfig.h>
+#include <acpi/actbl.h>
+#include <acpi/actbl3.h>
 #include <public/xen.h>
 #include <xen/bitops.h>
 #include <xen/compile.h>
 #include <xen/ctype.h>
 #include <xen/dmi.h>
 #include <xen/domain_page.h>
+#include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/keyhandler.h>
 #include <xen/lib.h>
@@ -747,6 +751,133 @@ static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
     efi_bs->FreePool(memory_map);
 }

+typedef struct {
+    UINT16 signature;
+    UINT32 file_size;
+    UINT16 reserved[2];
+    UINT32 data_offset;
+} __attribute__((packed)) BMP_HEADER;
+
+static __initdata struct {
+    bool preserved;
+    const void *old_addr;
+    const void *new_addr;
+    UINTN size;
+    const char *failure_reason;
+} bgrt_info = {
+    /* We would prefer the failure_reason to print */
+    .failure_reason = "",
+};
+
+static const struct acpi_table_bgrt *__init efi_get_bgrt(void)
+{
+    const struct acpi_table_rsdp *rsdp;
+    const struct acpi_table_xsdt *xsdt;
+    UINTN entry_count;
+    unsigned int i;
+
+    if ( efi.acpi20 == EFI_INVALID_TABLE_ADDR )
+        return NULL;
+
+    rsdp = (const void *)(UINTN)efi.acpi20;
+    if ( !rsdp || !rsdp->xsdt_physical_address )
+        return NULL;
+
+    xsdt = (const void *)rsdp->xsdt_physical_address;
+
+    if ( memcmp(xsdt->header.signature, ACPI_SIG_XSDT, 4) != 0 )
+        return NULL;
+
+    if ( xsdt->header.length < sizeof(xsdt->header) )
+        return NULL;
+    entry_count = (xsdt->header.length - sizeof(xsdt->header)) /
+                  sizeof(xsdt->table_offset_entry[0]);
+
+    for ( i = 0; i < entry_count; i++ )
+    {
+        const struct acpi_table_header *hdr;
+
+        hdr = (const void *)xsdt->table_offset_entry[i];
+        if ( !hdr )
+            continue;
+
+        if ( memcmp(hdr->signature, ACPI_SIG_BGRT, 4) == 0 &&
+             hdr->length >= sizeof(struct acpi_table_bgrt) )
+            return (const struct acpi_table_bgrt *)hdr;
+    }
+
+    return NULL;
+}
+
+#define BMP_SIGNATURE 0x4D42
+#define MAX_BGRT_IMAGE_SIZE (16 * 1024 * 1024)
+
+static void __init efi_preserve_bgrt_img(void)
+{
+    const struct acpi_table_bgrt *bgrt;
+    const BMP_HEADER *bmp;
+    const void *old_image;
+    void *new_image;
+    UINTN image_size;
+    EFI_STATUS status;
+    UINT8 checksum;
+    unsigned int i;
+
+    bgrt_info.preserved = false;
+
+    bgrt = efi_get_bgrt();
+    if ( !bgrt )
+    {
+        bgrt_info.failure_reason = "BGRT table not found";
+        return;
+    }
+
+    if ( !bgrt->image_address )
+        return;
+
+    old_image = (const void *)bgrt->image_address;
+    bmp = old_image;
+
+    if ( bmp->signature != BMP_SIGNATURE )
+    {
+        bgrt_info.failure_reason = "Invalid BMP signature";
+        return;
+    }
+
+    image_size = bmp->file_size;
+    if ( !image_size || image_size > MAX_BGRT_IMAGE_SIZE )
+    {
+        bgrt_info.failure_reason = "Image size exceeds limit";
+        return;
+    }
+
+    /*
+     * Allocate memory of type EfiACPIReclaimMemory so that the image
+     * will remain available for the OS after ExitBootServices().
+     */
+    status = efi_bs->AllocatePool(EfiACPIReclaimMemory, image_size, &new_image);
+    if ( EFI_ERROR(status) )
+    {
+        bgrt_info.failure_reason = "Memory allocation failed";
+        return;
+    }
+    memcpy(new_image, old_image, image_size);
+    ((struct acpi_table_bgrt *)bgrt)->image_address = (UINTN)new_image;
+    ((struct acpi_table_bgrt *)bgrt)->header.checksum = 0;
+    checksum = 0;
+
+    for ( i = 0; i < bgrt->header.length; i++ )
+        checksum += ((const UINT8 *)bgrt)[i];
+
+    ((struct acpi_table_bgrt *)bgrt)->header.checksum = -checksum;
+
+    /* Filling the debug struct for printing later */
+    bgrt_info.preserved = true;
+    bgrt_info.old_addr = old_image;
+    bgrt_info.new_addr = new_image;
+    bgrt_info.size = image_size;
+}
+
 /*
  * Include architecture specific implementation here, which references the
  * static globals defined above.
@@ -1671,6 +1802,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,

     efi_relocate_esrt(SystemTable);

+    efi_preserve_bgrt_img();
+
     efi_exit_boot(ImageHandle, SystemTable);

     efi_arch_post_exit_boot(); /* Doesn't return. */
--
2.53.0


