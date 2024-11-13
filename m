Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D249C7BA1
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 19:52:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835956.1251827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBISh-0003ji-RG; Wed, 13 Nov 2024 18:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835956.1251827; Wed, 13 Nov 2024 18:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBISh-0003hM-Mb; Wed, 13 Nov 2024 18:51:31 +0000
Received: by outflank-mailman (input) for mailman id 835956;
 Wed, 13 Nov 2024 18:51:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gr6F=SI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBISg-0003hE-I3
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 18:51:30 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4818fb4f-a1f0-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 19:51:24 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53da44cde85so296285e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 10:51:24 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf6926ad39sm824375a12.60.2024.11.13.10.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 10:51:22 -0800 (PST)
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
X-Inumbo-ID: 4818fb4f-a1f0-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmEiLCJoZWxvIjoibWFpbC1sZjEteDEyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ4MThmYjRmLWExZjAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTIzODg0LjY3MTQyLCJzZW5kZXIiOiJhbmRyZXcuY29vcGVyQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731523884; x=1732128684; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u5uloU3joHwtlfTIoEBmfSn3q1TAQ0Bsnn0GnBxe190=;
        b=fORqs9AvDHFlEa8SATupMAcfOSJVL7Dx+Hm/YKyxj5D5e4r6Pfc7wS6oqeD/bKdOfi
         D4jL344V88xgIn/4C+4najbkR/JEgzPUj7RgDQ4EMB6dOlfYLoyS2ByW7NJdJ65WynK8
         oCpgRlVcnXLga9zlLaYlxJpPLSVrlKM0LOKD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731523884; x=1732128684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5uloU3joHwtlfTIoEBmfSn3q1TAQ0Bsnn0GnBxe190=;
        b=Rr/6JKsdugGqKxYZk4LJ52iF1CfCA/0q091BAr5Sxq3ToXxQmduRr3vd1L3rhzi6Qv
         zhYmSZrUiIEGybxSQud9ID8/vMzYJyCPfT8Mzo83WTXxuvC78WuyVj/mGhLD1V2RR3w7
         LthI2goPYPQrEcyABpIHkhZ1ylL6qWQiU3cTQBd6+hpo94xHPjTGxFjnIGpIiIUxY5hg
         q/+CNCaA8bHnUS2NS8X07HArK3h9a2CzQ2pt3tAnB6dIzIgvHqVsbzgq/S15xllbE7Mq
         4yZY705FWku4UqeFO0stkp5ox/kg3GqeOwkDLjTIO61c4WliYxVgqsyCIRNo4D74aYXx
         1vQw==
X-Gm-Message-State: AOJu0YwPfdJEH16UAFIHo3JqpOMn6Blhi6RGx5/TfCSXOJekEyyiqOMn
	Aa0Mzbd5T79dqeDWFY9XX2STavHM/BylbrioqamLi0i/5XM8rhq8ljHRE/IixgZ/1UW/N7L+P/h
	R
X-Google-Smtp-Source: AGHT+IFX0/VRLxyOaGhZ9TwP3fLLvLdgpwSvMTFdCwb2akeUfwsbvQByp+ZFLb4zY3Xzi1engmLvfw==
X-Received: by 2002:a05:6512:138b:b0:535:68ab:7fdd with SMTP id 2adb3069b0e04-53d862bbc3bmr10764927e87.19.1731523882874;
        Wed, 13 Nov 2024 10:51:22 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/multiboot: Make headers be standalone
Date: Wed, 13 Nov 2024 18:51:18 +0000
Message-Id: <20241113185118.1786703-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Both require xen/types.h.

Change multiboot.h to include const.h by it's more normal path, and swap u32
for uint32_t.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/xen/multiboot.h  | 68 +++++++++++++++++++-----------------
 xen/include/xen/multiboot2.h |  3 ++
 2 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/xen/include/xen/multiboot.h b/xen/include/xen/multiboot.h
index 80a1761d9ee7..7ba86aab73d8 100644
--- a/xen/include/xen/multiboot.h
+++ b/xen/include/xen/multiboot.h
@@ -17,7 +17,7 @@
 #ifndef __MULTIBOOT_H__
 #define __MULTIBOOT_H__
 
-#include "const.h"
+#include <xen/const.h>
 
 /*
  * Multiboot header structure.
@@ -45,41 +45,43 @@
 
 #ifndef __ASSEMBLY__
 
+#include <xen/types.h>
+
 /* The symbol table for a.out.  */
 struct aout_symbol_table {
-    u32 tabsize;
-    u32 strsize;
-    u32 addr;
-    u32 reserved;
+    uint32_t tabsize;
+    uint32_t strsize;
+    uint32_t addr;
+    uint32_t reserved;
 };
 typedef struct aout_symbol_table aout_symbol_table_t;
 
 /* The section header table for ELF.  */
 struct elf_section_header_table {
-    u32 num;
-    u32 size;
-    u32 addr;
-    u32 shndx;
+    uint32_t num;
+    uint32_t size;
+    uint32_t addr;
+    uint32_t shndx;
 };
 typedef struct elf_section_header_table elf_section_header_table_t;
 
 /* The Multiboot information.  */
 struct multiboot_info {
-    u32 flags;
+    uint32_t flags;
 
     /* Valid if flags sets MBI_MEMLIMITS */
-    u32 mem_lower;
-    u32 mem_upper;
+    uint32_t mem_lower;
+    uint32_t mem_upper;
 
     /* Valid if flags sets MBI_BOOTDEV */
-    u32 boot_device;
+    uint32_t boot_device;
 
     /* Valid if flags sets MBI_CMDLINE */
-    u32 cmdline;
+    uint32_t cmdline;
 
     /* Valid if flags sets MBI_MODULES */
-    u32 mods_count;
-    u32 mods_addr;
+    uint32_t mods_count;
+    uint32_t mods_addr;
 
     /* Valid if flags sets ... */
     union {
@@ -88,42 +90,42 @@ struct multiboot_info {
     } u;
 
     /* Valid if flags sets MBI_MEMMAP */
-    u32 mmap_length;
-    u32 mmap_addr;
+    uint32_t mmap_length;
+    uint32_t mmap_addr;
 
     /* Valid if flags sets MBI_DRIVES */
-    u32 drives_length;
-    u32 drives_addr;
+    uint32_t drives_length;
+    uint32_t drives_addr;
 
     /* Valid if flags sets MBI_BIOSCONFIG */
-    u32 config_table;
+    uint32_t config_table;
 
     /* Valid if flags sets MBI_LOADERNAME */
-    u32 boot_loader_name;
+    uint32_t boot_loader_name;
 
     /* Valid if flags sets MBI_APM */
-    u32 apm_table;
+    uint32_t apm_table;
 };
 typedef struct multiboot_info multiboot_info_t;
 
 /* The module structure.  */
 struct module {
-    u32 mod_start;
-    u32 mod_end;
-    u32 string;
-    u32 reserved;
+    uint32_t mod_start;
+    uint32_t mod_end;
+    uint32_t string;
+    uint32_t reserved;
 };
 typedef struct module module_t;
 
 /* The memory map. Be careful that the offset 0 is base_addr_low
    but no size.  */
 struct memory_map {
-    u32 size;
-    u32 base_addr_low;
-    u32 base_addr_high;
-    u32 length_low;
-    u32 length_high;
-    u32 type;
+    uint32_t size;
+    uint32_t base_addr_low;
+    uint32_t base_addr_high;
+    uint32_t length_low;
+    uint32_t length_high;
+    uint32_t type;
 };
 typedef struct memory_map memory_map_t;
 
diff --git a/xen/include/xen/multiboot2.h b/xen/include/xen/multiboot2.h
index 7cda620eec8a..f96f5d4c3169 100644
--- a/xen/include/xen/multiboot2.h
+++ b/xen/include/xen/multiboot2.h
@@ -114,6 +114,9 @@
 #define MULTIBOOT2_FRAMEBUFFER_TYPE_EGA_TEXT            2
 
 #ifndef __ASSEMBLY__
+
+#include <xen/types.h>
+
 typedef struct {
     uint32_t total_size;
     uint32_t reserved;
-- 
2.39.5


