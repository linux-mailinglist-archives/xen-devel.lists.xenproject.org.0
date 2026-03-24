Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNJrJLyEwmkAegQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:34:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FE030851D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:34:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260633.1553897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50wr-00058j-Gs; Tue, 24 Mar 2026 12:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260633.1553897; Tue, 24 Mar 2026 12:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50wr-00055d-E1; Tue, 24 Mar 2026 12:33:29 +0000
Received: by outflank-mailman (input) for mailman id 1260633;
 Tue, 24 Mar 2026 12:33:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <soumyajyotisarkar23@gmail.com>) id 1w50wp-00054y-R0
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 12:33:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w50wp-008yL3-6w
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 13:33:27 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <soumyajyotisarkar23@gmail.com>)
 id 69c28491-e002-0a2a0a5209dd-0a2a4502c964-30
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:33:27 +0100
Received: from [209.85.216.67] (helo=mail-pj1-f67.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <soumyajyotisarkar23@gmail.com>)
 id 69c28495-63bb-0a2a45020019-d155d843edb7-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:33:26 +0100
Received: by mail-pj1-f67.google.com with SMTP id
 98e67ed59e1d1-35bb7afdc38so650535a91.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 05:33:26 -0700 (PDT)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c031ed04esm2215792a91.12.2026.03.24.05.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 05:33:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774355605; x=1774960405; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aApGw00bRTG9YsHWYvBcAcOhWcCCk5rQkMe0Q+McyP8=;
        b=JtY+fYDFRURyFGgS4bpLD9TptIZjH9FaN0FJsyacnDZABHBR/qxZ6ZJN6uFPTJaF3A
         /W1GeINxbO7HJifougO1ZJK6fwlEp19I+uYgjL5jcCe2+njDyPOTgnyOaLk5rmP1ZS5F
         9GHPkZGJS0ppklThu0IdEFoIwfHkdZs3A5/wO6qwUjO2d5YZWpsgckf4FJ0Xga5YB65m
         NleYz5DA4nhSt0F0zxwMBTBAwXyc7jf4KybDFgYhCAjXgXOlH8n6/Lo1cCJxNSLAOcLY
         +817qJwMTvDM/Fj7QgCT5PssJoKibnD+sCFVMk/IBSMtsQ4apnk5KKw95csNMaSOIkdV
         oXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774355605; x=1774960405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aApGw00bRTG9YsHWYvBcAcOhWcCCk5rQkMe0Q+McyP8=;
        b=p+RfmXK6eplp2MAfGQfphr3eKV4EQc9T6/dTcAMwIXXwXou/7BQsNXopYeHnTYA1hf
         hzYpczt1guk73S1VvwDC09WFaBIX+XVclSgHGJlUK6km4fRaYe8Df9+D0rnZsTkMuN0C
         8Om/jL6sz+QUWw0RFvBpBtmlx6lNFrDXP3u5jd9BxKs3hVSPQODxm3KGsYG7fwdkH/zl
         uw4FkiGKmoQ2JOBu290fs3dv6nhhOv9hZI6jypg3O1wo1G+wR+d3ax5dEHbdHLNrVKDL
         dt5kYpPke+8wPMV3bTQ71kyKiRwIULcK7DV+8b6MJhFzQ+D9EWbfopo8xrWJ67AZMEZp
         sXYA==
X-Forwarded-Encrypted: i=1; AJvYcCWcqgc02G9T01r3HJ0UXdzYFv7Qem8eozltbENvpnlV9d+mx84EVYDHBGm7C1L2YJbMZFnTs1mMohw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgYkqswEfTf6TjqmZKMDb/2Zf4TDiwbl7s8GUKNfH1YOfMtRWS
	UbkuuytBHraHW4QcqxdmHl87dJpt58xrqbf7LW4wVlAjlm2O6V10hgq5y2Aaq2Dz
X-Gm-Gg: ATEYQzy5U6V81TFZsruDqeTTybBu7py8wAF7MOWfT+z4+vxjYE/K8sn7KfafgvzH6QB
	aR+RDhgrdTFzTAqBNT0v2uVbzqIwoTaHFAYe7ODNeBhTA4w/EXFKMNwcCOqYgsdSOzlGOZYgr8t
	j7otwL7o4w/pQfDFFGBA1ehq5R7gDhD+Yfk+RAX+xe/iTRkT+KW/u961d6WlSUCnWqBcoWgtEAO
	pxIpiner2Y8AE6xo76WlKQ9d96RiYCC6BXhq3UvdhwnWhX5xkeb+7PrSPNr8uO6inOw2ZNO7/KQ
	25N+z/ovIxzLnnHij/CW8pKPEp0ybvMBvi7HSA1u9YZ3y8p1/fxZ1aEWsR9fAGRrnccxticebvk
	sjVmF+R2Hn83JlOT+GC5rhev1BnLpsIXiEFH0/5QF3QPYVcRrTRvqnwO9jIWx0iVtQL+Yu57yHN
	NQJpfsIHxsXEkw3tZbfrpROL7ttOeoqld6aNK63o3JnwndbCdkR60TF6wgaqLG2tFFP4TuGS5Cv
	V8jkg+deEp/zqkqhPeGgF8Y1rXa8aI1wBT+oiGqNk/Nhd/WUBl2m2m2jCaKUtL4et1Fz++bMQ==
X-Received: by 2002:a17:90b:4fcd:b0:35b:e553:9cc2 with SMTP id 98e67ed59e1d1-35be5539ff7mr7766870a91.26.1774355604739;
        Tue, 24 Mar 2026 05:33:24 -0700 (PDT)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: sarkarsoumyajyoti23@gmail.com,
	xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH v5 1/3] x86/efi: Add BGRT image preservation infrastructure
Date: Tue, 24 Mar 2026 18:03:10 +0530
Message-ID: <20260324123312.11076-2-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324123312.11076-1-soumyajyotisarkar23@gmail.com>
References: <20260324123312.11076-1-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1774355607-42A84DB8-B697ED9A/0/0
X-purgate-type: clean
X-purgate-size: 6310
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,suse.com,apertussolutions.com,invisiblethingslab.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:sarkarsoumyajyoti23@gmail.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:soumyajyotisarkar23@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 45FE030851D
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
index 9dc8aa538c..155a973f21 100644
--- a/xen/common/efi/common-stub.c
+++ b/xen/common/efi/common-stub.c
@@ -19,6 +19,7 @@ unsigned long efi_get_time(void)
 }

 void efi_reset_system(bool warm) { }
+void __init efi_bgrt_status_info(void) { }

 int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
 {
--
2.53.0


