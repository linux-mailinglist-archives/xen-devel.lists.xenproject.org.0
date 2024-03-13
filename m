Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19FB87AA0A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:07:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692517.1079742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQBo-0007Ug-7j; Wed, 13 Mar 2024 15:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692517.1079742; Wed, 13 Mar 2024 15:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQBo-0007T0-4E; Wed, 13 Mar 2024 15:06:44 +0000
Received: by outflank-mailman (input) for mailman id 692517;
 Wed, 13 Mar 2024 15:06:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwto=KT=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rkQBm-0007E2-OD
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:06:42 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bc200d4-e14b-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 16:06:41 +0100 (CET)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-789cd0c402dso28402885a.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 08:06:41 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a0ccb8a000000b0068fba49ae81sm4786811qvk.57.2024.03.13.08.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 08:06:38 -0700 (PDT)
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
X-Inumbo-ID: 4bc200d4-e14b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710342400; x=1710947200; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAyEylEkZ+K2w5SdFVwnvdxOdsHKUOMCQVTI6rsesLI=;
        b=A3nMThb6X9zfnpKvr/5hGP8Z5RPtr8PlieTMZ4RqzgDUxeza9L/uzxZJmp5hagIcfa
         Ufl1YULVEAIkziSzAdh/OAf2xs4de5YubDI7z5B64VL4Ws/jm36+TJ8lKqjevYdLNLS9
         oKnpwhedMo7fwLsRiQ0vdUc3U/i0HEjFDjNFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710342400; x=1710947200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAyEylEkZ+K2w5SdFVwnvdxOdsHKUOMCQVTI6rsesLI=;
        b=vQLnsqTgt/PSiWX4ATZTn3neD+QhgoQyxY6QuKhSCLKX7Bc0pAGF2SZzxnCc0cMnIG
         wk6yL0Gk3osJpZJAd4+wI+XVvNehNBF4woxL5zhAZOAJXqXUhk16xewLRYpcvHqRHLbq
         5X+/6Zxy3gzjxbzHl8V4VYpnfR10gPHYZGS7AQWWvmKJiNjAlDktp7HTDiuXFS47ptoZ
         DKpCTp3L1hQ4W8DXfllBpOjDl3YpSYIYBoIwyAe++BMCPZDgyMOBCmeXlsUxrKQDJPrL
         SxDKVLtVUkLoz9HlMR2uHZHWjse35VWCPD05Ji58cdZRD9NYbsjlsMHJXly/UtcKyfX7
         0a9A==
X-Gm-Message-State: AOJu0YzBOWgIXaBWrEGMCxYYZ8Y1VySfrWTchVdxxlb/tj66OKmBEnJS
	dIUhpxR27oADd6SSfSivEcBRIJ3sMp36gsAEWiRLtSfg4hI0ckhGt0Wf8ebBN8xn7tIX71cOJNU
	OwTyt
X-Google-Smtp-Source: AGHT+IHAOg2qe/MwH4SNZCYldAKrSK+zeLn7ifIh3S+CftY7/WCiBtrBu5n7dA3H67+lyXstuf2NLA==
X-Received: by 2002:a0c:d687:0:b0:691:1cde:e19f with SMTP id k7-20020a0cd687000000b006911cdee19fmr89340qvi.17.1710342399919;
        Wed, 13 Mar 2024 08:06:39 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: grub-devel@gnu.org
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 1/7] multiboot2: Add load type header and support for the PE binary type
Date: Wed, 13 Mar 2024 15:07:42 +0000
Message-ID: <20240313150748.791236-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313150748.791236-1-ross.lagerwall@citrix.com>
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, multiboot2-compatible bootloaders can load ELF binaries and
a.out binaries. The presence of the address header tag determines
how the bootloader tries to interpret the binary (a.out if the address
tag is present else ELF).

Add a new load type header tag that explicitly states the type of the
binary. Bootloaders should use the binary type specified in the load
type tag. If the load type tag is not present, the bootloader should
fall back to the previous heuristics.

In addition to the existing address and ELF load types, specify a new
optional PE binary load type. This new type is a useful addition since
PE binaries can be signed and verified (i.e. used with Secure Boot).

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 doc/multiboot.texi | 39 ++++++++++++++++++++++++++++++++++-----
 doc/multiboot2.h   | 13 +++++++++++++
 2 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/doc/multiboot.texi b/doc/multiboot.texi
index df8a0d056e76..d12719c744eb 100644
--- a/doc/multiboot.texi
+++ b/doc/multiboot.texi
@@ -511,11 +511,12 @@ assumes that no bss segment is present.
 
 Note: This information does not need to be provided if the kernel image
 is in @sc{elf} format, but it must be provided if the image is in a.out
-format or in some other format. When the address tag is present it must
-be used in order to load the image, regardless of whether an @sc{elf}
-header is also present. Compliant boot loaders must be able to load
-images that are either in @sc{elf} format or contain the address tag
-embedded in the Multiboot2 header.
+format or in some other format. If the load type tag is not specified
+and the address tag is present it must be used in order to load the
+image, regardless of whether an @sc{elf} header is also present.
+Compliant boot loaders must be able to load images that are either in
+@sc{elf} format or contain the address tag embedded in the Multiboot2
+header.
 
 @subsection The entry address tag of Multiboot2 header
 
@@ -732,6 +733,34 @@ and @samp{2} means load image at highest possible address but not
 higher than max_addr.
 @end table
 
+@node Load type tag
+@subsection Load type tag
+
+@example
+@group
+        +-------------------+
+u16     | type = 11         |
+u16     | flags             |
+u32     | size = 12         |
+u32     | load_type         |
+        +-------------------+
+@end group
+@end example
+
+This tag indicates the type of the payload and how the boot loader
+should load it.
+
+The meaning of each field is as follows:
+
+@table @code
+@item load_type
+Recognized load types are @samp{0} for address (i.e. load a.out using
+the address tag), @samp{1} for ELF, and @samp{2} for PE. Compliant
+bootloaders should implement support for a.out and ELF as a minimum.  If
+this tag is not specified, the boot loader should attempt to load the
+payload using the information specified in the address tag if present,
+else it should load the payload as an ELF binary.  @end table
+
 @node Machine state
 @section MIPS machine state
 
diff --git a/doc/multiboot2.h b/doc/multiboot2.h
index b181607075b2..d4cae05706e4 100644
--- a/doc/multiboot2.h
+++ b/doc/multiboot2.h
@@ -75,6 +75,7 @@
 #define MULTIBOOT_HEADER_TAG_ENTRY_ADDRESS_EFI32  8
 #define MULTIBOOT_HEADER_TAG_ENTRY_ADDRESS_EFI64  9
 #define MULTIBOOT_HEADER_TAG_RELOCATABLE  10
+#define MULTIBOOT_HEADER_TAG_LOAD_TYPE  11
 
 #define MULTIBOOT_ARCHITECTURE_I386  0
 #define MULTIBOOT_ARCHITECTURE_MIPS32  4
@@ -179,6 +180,18 @@ struct multiboot_header_tag_relocatable
   multiboot_uint32_t preference;
 };
 
+struct multiboot_header_tag_load_type
+{
+  multiboot_uint16_t type;
+  multiboot_uint16_t flags;
+  multiboot_uint32_t size;
+#define MULTIBOOT_LOAD_TYPE_ADDRESS     0
+#define MULTIBOOT_LOAD_TYPE_ELF         1
+#define MULTIBOOT_LOAD_TYPE_PE          2
+#define MULTIBOOT_LOAD_TYPE_TOTAL       3
+  multiboot_uint32_t load_type;
+};
+
 struct multiboot_color
 {
   multiboot_uint8_t red;
-- 
2.43.0


