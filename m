Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EtpBtZiwmmecAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:09:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C04C73063CC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:09:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260230.1553596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4yhG-0001eC-J4; Tue, 24 Mar 2026 10:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260230.1553596; Tue, 24 Mar 2026 10:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4yhG-0001b5-FW; Tue, 24 Mar 2026 10:09:14 +0000
Received: by outflank-mailman (input) for mailman id 1260230;
 Tue, 24 Mar 2026 10:09:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <soumyajyotisarkar23@gmail.com>) id 1w4yhF-0001aD-DP
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 10:09:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4yhE-008S3o-MA
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 11:09:12 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <soumyajyotisarkar23@gmail.com>)
 id 69c262c6-e002-0a2a0a5209dd-0a2a4503e28c-20
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 11:09:12 +0100
Received: from [209.85.215.195] (helo=mail-pg1-f195.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <soumyajyotisarkar23@gmail.com>)
 id 69c262c7-1947-0a2a45030019-d155d7c3dc1a-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 11:09:12 +0100
Received: by mail-pg1-f195.google.com with SMTP id
 41be03b00d2f7-c70f91776fcso503565a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 03:09:12 -0700 (PDT)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c74665ca206sm11377434a12.18.2026.03.24.03.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 03:09:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774346950; x=1774951750; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMyU7Zt+Npx8war2PFOLJHgfUteMUgErNfOEenK+5EA=;
        b=AKZWX3ZWK3oLzSbH+SIp9CXq3QzB2TmHr4Tl9jvw1zmJBFvlNuBsX4mROuHdxYJPXq
         HmisRTXYaeOh3ARMYoqOXdeib82KmG1DH8Vr9+piomd0/qkP8yrNkFUHxjSnza7/aHTI
         VoaW+9v0G8u13nSsr7KMgorERYlTG1Ow0xnB1rfZMWwyOrbE39DEEF42IQ/EQnjOKGqq
         BnUuwJErvTC8wZw/hakKFMJF4Lja6BrLPjeMAmeT32U/UOr3yT+Ix62rU01QuHQF5KdU
         fmkEIgZX1qepWjxWGuFsr9G+Ro4iE9HASduWUZTcLXfhRIPSPKf4egVbJ96H0HSZ2T+S
         TVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774346950; x=1774951750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vMyU7Zt+Npx8war2PFOLJHgfUteMUgErNfOEenK+5EA=;
        b=h/888kkzI+S5yXpCEJ4GM8lPrZc0KFnT/+Grrew8dy+M4iM/Be2TmhRi1VOK9yadUt
         APQTjsLJoV8dyaflo2RBzR7lpNZ65rQHRXuXoHuywaM3mEZMZhCH4oGmqNl61QnUIrDL
         Zd+TaPoAERvWX7e979CA4lHOFZBlgPzHq0gk5hnx1q4UJg3AyTPdGpxUh4rrmBAg4P7f
         5SP79TNaRDYjzfjHx7SKzdWbWKWU9dIkVFocUYGIotAGCmi4Va7pIaUQtn4ISgfwjhGV
         sGMVTGBnlOZtDAptBruKAHjgkk/v7s2gK8PfYKcy/uTKVCnQC7woQm5Ug5TBsVKKeAre
         kaSg==
X-Gm-Message-State: AOJu0YzQ2AwgNH1/e2AlcfE037p2Ioc6EeMOrg4W0+QYxDQ8KqMDZXEK
	qpixeczuxF0+oB5U/nVq0Z7po3Q+alzT0OwOfgx7IeHb4bAOYDOq05zvU+MYsY5b
X-Gm-Gg: ATEYQzwma9rBSIjZK0pj3jiBvYPczhvO/KnO2bSzxTx/oTSC+OrJ6Olwlq9822I9DPS
	al3DCXJho+C84p7/HBKL4h3Wt0xgHssRZZdBsaQgp7+8KUd+E1KeWBW9T/NveQYXc5TnnzpiV5Y
	bpHh7Fvcn4wepCJr2GnVzcSMrG20Ktze8hGwx7OK+v0jiVPSDCOYdXsE9XAGfLiYzHHkf/s+0G/
	UJ1X6Ey5jS8wfpMJhErJUoMoj/xVg7Nffw3mn9aDiBAiEz7ck0U/J+E2qoj+9CzrW+h5A8oBV5a
	r8KcQswRrKnpWYIzGa4ned44Zu6ZJEhai4Q7GpucDJiDcc+v5Dxs17f7FzKvsG6VtVgvRVvlBeO
	N/BR6yzxy3x8ynp+c5u33d16FxR1f98E8GU2XuKR41VLwKpAYle/5o1oHc9Xt8hjnjUNfI/7pDl
	L4yC1Rc1gipw0guM9c3ToMerQczd0CTrj3+JXRg+EcaqMbe38RZ7jAOb+1lBnMDxS32BkGZCwoc
	2hl2LOmg74Wbnlx0eVR6qPMmHsudmZLOw0W3FDcn9kGlRhFqHDsmIQFffrm2/gfOupFKvbnNmxL
	J7v1Kr/H
X-Received: by 2002:a05:6a21:6d9e:b0:39b:e84a:962a with SMTP id adf61e73a8af0-39be84ab96bmr10990598637.13.1774346950025;
        Tue, 24 Mar 2026 03:09:10 -0700 (PDT)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH v4 1/3] x86/efi: Add BGRT image preservation infrastructure
Date: Tue, 24 Mar 2026 15:38:54 +0530
Message-ID: <20260324100856.6691-2-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324100856.6691-1-soumyajyotisarkar23@gmail.com>
References: <20260324100856.6691-1-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1774346952-EAA8372C-29AC70D4/0/0
X-purgate-type: clean
X-purgate-size: 6339
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[apertussolutions.com,citrix.com,suse.com,invisiblethingslab.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lists.xenproject.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:marmarek@invisiblethingslab.com,m:soumyajyotisarkar23@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C04C73063CC
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
 xen/arch/x86/efi/efi-boot.h  |   2 +
 xen/common/efi/boot.c        | 133 +++++++++++++++++++++++++++++++++++
 xen/common/efi/common-stub.c |   1 +
 3 files changed, 136 insertions(+)

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
index 967094994d..47d5b9b2a8 100644
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
+static struct acpi_table_bgrt *__init efi_get_bgrt(void)
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
+            return (struct acpi_table_bgrt *)hdr;
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
+    struct acpi_table_bgrt *bgrt;
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
+    bgrt->image_address = (UINTN)new_image;
+    bgrt->header.checksum = 0;
+    checksum = 0;
+
+    for ( i = 0; i < bgrt->header.length; i++ )
+        checksum += ((const UINT8 *)bgrt)[i];
+
+    bgrt->header.checksum = -checksum;
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
diff --git a/xen/common/efi/common-stub.c b/xen/common/efi/common-stub.c
index 77f138a6c5..9e595600d7 100644
--- a/xen/common/efi/common-stub.c
+++ b/xen/common/efi/common-stub.c
@@ -20,6 +20,7 @@ unsigned long efi_get_time(void)

 void efi_halt_system(void) { }
 void efi_reset_system(bool warm) { }
+void __init efi_bgrt_status_info(void) { }

 int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
 {
--
2.53.0


