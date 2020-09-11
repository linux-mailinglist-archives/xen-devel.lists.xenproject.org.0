Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E2826616B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 16:43:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGkGn-0002hi-Si; Fri, 11 Sep 2020 14:43:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lcpt=CU=gmail.com=s.temerkhanov@srs-us1.protection.inumbo.net>)
 id 1kGkGm-0002hV-M6
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 14:43:20 +0000
X-Inumbo-ID: 471c8463-3cd1-4c16-b695-ac17ad5da6d6
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 471c8463-3cd1-4c16-b695-ac17ad5da6d6;
 Fri, 11 Sep 2020 14:43:19 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y17so6101221lfa.8
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2020 07:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BvedKb7Sr/CE7Ttt3dYfKDZQEiZgHq5KXUSwKLJ8TUw=;
 b=IbNWkAjUo8+dg9GgHHyX111rI8DTV5Yflz0u/9zlMSHjxFn2eveetaNRoUV3vJUW8L
 is9P18GtxqaSfU34d8891p92Fd+pfvc34DyEWP64U6Q9h2LaqFgU4Qb7tR4TOMzK2Tc+
 EEyRQWygKj8uTsvJvmG8+IVR9bwgLJNnXzeq4b8XfaTAEpBBtdlsSCMkJB82+RVXPPzV
 VXzf6n5zcGf1YC0rJMukxq4E7VLhFhKbZ70qxvfcKusqWh8/vd8SpL9lNXOsFa7gmnpP
 B9cvLdn0vA0CM0J3il/fT0/GgUGX3rxr28LtY1bL5A/nbmyW0azKURGzbf7tr9rPflwk
 SPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BvedKb7Sr/CE7Ttt3dYfKDZQEiZgHq5KXUSwKLJ8TUw=;
 b=BQK15sUzRdirYdrgp5z1T1/G5bvEEMFQfmOQYy94BbkvdDxwun9ZMgyf55fslwYbfp
 TDE/PDKshefSKWTPMVB9myPmM7reZVFz5mhez1n4rrH58i3SzVc1jvhitFD++EJ6wLNk
 xI5es9DIbLG+r1htjCr4t7A4155qYVoIdONjlNIBCR8bCbmg0Nr0Qba+ab+5VKW8XQtl
 /RI8mAo3YIzNYH1jzKpUv8ugZGRNgdlSr0iNJehhhrayY1xmG9ye9/7z6LNdT8cxpaWV
 LxZL3dWmPWcSdCfRiebKEN1gm43BK9LJYWLfbWApMkP5KwF58gw/Sm7pArk4HbrIWVcm
 x8Vg==
X-Gm-Message-State: AOAM531BZ5HzBoines22M0moPQ+hYF01rVPBv/Q8bH35M1iodi+o0cjp
 qtkRkKEnZAfvVvjZaOdtYDJlrb6STFO2xg==
X-Google-Smtp-Source: ABdhPJzq4usMM46y/jRSMDiUmTNxSfrCGy74bejcm9RGjpuRNuz8vWj2UxaoxRX8BD5+jo7kL3pKSQ==
X-Received: by 2002:a05:6512:370e:: with SMTP id
 z14mr909773lfr.80.1599835398357; 
 Fri, 11 Sep 2020 07:43:18 -0700 (PDT)
Received: from PRECISION-M4800.localdomain (109-252-108-19.nat.spd-mgts.ru.
 [109.252.108.19])
 by smtp.googlemail.com with ESMTPSA id z22sm459268lfd.23.2020.09.11.07.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 07:43:17 -0700 (PDT)
From: Sergey Temerkhanov <s.temerkhanov@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Sergey Temerkhanov <s.temerkhanov@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] efi: Always map EfiRuntimeServicesCode and
 EfiRuntimeServicesData
Date: Fri, 11 Sep 2020 17:43:09 +0300
Message-Id: <20200911144309.4559-1-s.temerkhanov@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This helps overcome problems observed with some UEFI implementations
which don't set the Attributes field in memery descriptors properly

Signed-off-by: Sergey Temerkhanov <s.temerkhanov@gmail.com>
---
 xen/common/efi/boot.c    | 27 ++++++++++++++++++++++++++-
 xen/include/efi/efidef.h |  6 ++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 5a520bf21d..811d8a0923 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1100,7 +1100,14 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
     {
         EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
 
-        if ( desc->Attribute & EFI_MEMORY_RUNTIME )
+        /*
+         * EfiRuntimeServicesCode and EfiRuntimeServicesData
+         * memory ranges are always mapped here.
+         * Attributes may be adjusted in efi_init_memory()
+         */
+        if ( (desc->Attribute & EFI_MEMORY_RUNTIME) ||
+             desc->Type == EfiRuntimeServicesCode ||
+             desc->Type == EfiRuntimeServicesData )
             desc->VirtualStart = desc->PhysicalStart;
         else
             desc->VirtualStart = INVALID_VIRTUAL_ADDRESS;
@@ -1510,6 +1517,24 @@ void __init efi_init_memory(void)
                desc->PhysicalStart, desc->PhysicalStart + len - 1,
                desc->Type, desc->Attribute);
 
+        /*
+         * EfiRuntimeServicesCode and EfiRuntimeServicesData
+         * memory ranges are adjusted here. Any changes
+         * or adjustments must be kept in sync with efi_exit_boot()
+         */
+        if ( efi_enabled(EFI_RS) &&
+             (!(desc->Attribute & EFI_MEMORY_RUNTIME) &&
+               (desc->Attribute & EFI_MEMORY_CACHEABILITY_MASK) &&
+               (desc->Type == EfiRuntimeServicesCode ||
+                desc->Type == EfiRuntimeServicesData)) )
+        {
+            printk(XENLOG_WARNING
+                   "Setting EFI_RUNTIME memory attribute for area %013"
+                   PRIx64 "-%013" PRIx64 "\n",
+                   desc->PhysicalStart, desc->PhysicalStart + len - 1);
+            desc->Attribute |= EFI_MEMORY_RUNTIME;
+        }
+
         if ( (desc->Attribute & (EFI_MEMORY_WB | EFI_MEMORY_WT)) ||
              (efi_bs_revision >= EFI_REVISION(2, 5) &&
               (desc->Attribute & EFI_MEMORY_WP)) )
diff --git a/xen/include/efi/efidef.h b/xen/include/efi/efidef.h
index 86a7e111bf..3a35bfc8be 100644
--- a/xen/include/efi/efidef.h
+++ b/xen/include/efi/efidef.h
@@ -158,6 +158,12 @@ typedef enum {
 #define EFI_MEMORY_UCE          0x0000000000000010  
 #define EFI_MEMORY_WP           0x0000000000001000
 
+#define EFI_MEMORY_CACHEABILITY_MASK  ( EFI_MEMORY_UC | \
+                                        EFI_MEMORY_WC | \
+                                        EFI_MEMORY_WT | \
+                                        EFI_MEMORY_WB | \
+                                        EFI_MEMORY_UCE )
+
 // physical memory protection on range 
 #define EFI_MEMORY_RP           0x0000000000002000
 #define EFI_MEMORY_XP           0x0000000000004000
-- 
2.26.2


