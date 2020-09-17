Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB52726DA20
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 13:27:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIs4I-0004Jj-Rd; Thu, 17 Sep 2020 11:27:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9D7=C2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIs4H-0004Je-4o
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 11:27:13 +0000
X-Inumbo-ID: 57b879d7-1f95-4819-97c3-25dbd018a630
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57b879d7-1f95-4819-97c3-25dbd018a630;
 Thu, 17 Sep 2020 11:27:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600342031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M0NOV9NBqCR+uLLNzHtSU29tyDZZds2MNZYZ0SHj0IQ=;
 b=p4dc9bwekFINzE2OMcwEe7dOwpkllSOAJAcq53bwSw+Owz0bT43Y7D5fP//Vw7IIStSjpj
 uE8GMqoeA9mICFqzwqanvfDOt6lsFPZX2WB9wX0mVGoBrS/rtXAgnl0RX8qUa9aQdPA/s8
 qTIuArwIOSiO4RCH+NPHVfmT8S74QJUm1RKS73oa0hL3eazSm6gkTeYNr5qo3vWEcMhZt9
 OviutrFag6cuEy45IZ3S0mmiJm/j8b/uZcBNNUSFzQiRmMD1zkMkmXuS7ex5W0Ju1iOUFP
 1aFQf/M3lszchgnKmPZvM8wixk+82Ork3aGM22bTelenZCbTy9HeOiARPkrNLw==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32309AC97;
 Thu, 17 Sep 2020 11:27:45 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Trammell Hudson <hudson@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] EFI: some easy constification
Message-ID: <c2995533-7a14-e83a-9a2a-7f0346c161b0@suse.com>
Date: Thu, 17 Sep 2020 13:27:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Inspired by some of Trammell's suggestions, this harvests some low
hanging fruit, without needing to be concerned about the definitions of
the EFI interfaces themselves.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -420,7 +420,7 @@ static void __init efi_arch_memory_setup
 
 static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
                                            CHAR16 *cmdline_options,
-                                           char *cfgfile_options)
+                                           const char *cfgfile_options)
 {
     union string name;
     char *buf;
@@ -481,8 +481,9 @@ static void __init efi_arch_handle_cmdli
     efi_bs->FreePool(buf);
 }
 
-static void __init efi_arch_handle_module(struct file *file, const CHAR16 *name,
-                                          char *options)
+static void __init efi_arch_handle_module(const struct file *file,
+                                          const CHAR16 *name,
+                                          const char *options)
 {
     int node;
     int chosen;
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -294,7 +294,7 @@ static void __init efi_arch_cfg_file_lat
 
 static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
                                            CHAR16 *cmdline_options,
-                                           char *cfgfile_options)
+                                           const char *cfgfile_options)
 {
     union string name;
 
@@ -635,8 +635,9 @@ static void __init efi_arch_memory_setup
 #undef l2_4G_offset
 }
 
-static void __init efi_arch_handle_module(struct file *file, const CHAR16 *name,
-                                          char *options)
+static void __init efi_arch_handle_module(const struct file *file,
+                                          const CHAR16 *name,
+                                          const char *options)
 {
     union string local_name;
     void *ptr;
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -119,7 +119,7 @@ static char *split_string(char *s);
 static CHAR16 *s2w(union string *str);
 static char *w2s(const union string *str);
 static bool read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
-                      struct file *file, char *options);
+                      struct file *file, const char *options);
 static size_t wstrlen(const CHAR16 * s);
 static int set_color(u32 mask, int bpp, u8 *pos, u8 *sz);
 static bool match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2);
@@ -539,7 +539,7 @@ static char * __init split_string(char *
 }
 
 static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
-                             struct file *file, char *options)
+                             struct file *file, const char *options)
 {
     EFI_FILE_HANDLE FileHandle = NULL;
     UINT64 size;
@@ -1100,7 +1100,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
     union string section = { NULL }, name;
     bool base_video = false;
-    char *option_str;
+    const char *option_str;
     bool use_cfg_file;
 
     __set_bit(EFI_BOOT, &efi_flags);

