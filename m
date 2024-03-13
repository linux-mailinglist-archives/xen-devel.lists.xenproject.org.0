Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F31287AA07
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:06:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692519.1079761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQBq-00080j-MN; Wed, 13 Mar 2024 15:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692519.1079761; Wed, 13 Mar 2024 15:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQBq-0007xk-Jb; Wed, 13 Mar 2024 15:06:46 +0000
Received: by outflank-mailman (input) for mailman id 692519;
 Wed, 13 Mar 2024 15:06:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwto=KT=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rkQBp-0007DJ-6s
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:06:45 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dbf5a7f-e14b-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 16:06:44 +0100 (CET)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-7882b1e87c4so265648985a.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 08:06:44 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a0ccb8a000000b0068fba49ae81sm4786811qvk.57.2024.03.13.08.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 08:06:42 -0700 (PDT)
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
X-Inumbo-ID: 4dbf5a7f-e14b-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710342403; x=1710947203; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZp28TJaho7bmYkQTjxVyJZGgKr3RuW+VThi/ld76Pc=;
        b=UBhZVWkdwAY5EIGqr5C+0vGeM9DCHRE98Gok0s57e2NnoFu8fPnyVav7c3zmuFQBs4
         TcAxlMdyYIznoAr+se7PnRoFaTomy3vq+LAW0ZNdYhKqS7my9YiRCsEtnYCXPCoqom6I
         Jh2J2U4j/bqfg25Te+n/hgGHIidhYgVwkhZ3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710342403; x=1710947203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZp28TJaho7bmYkQTjxVyJZGgKr3RuW+VThi/ld76Pc=;
        b=AhRLAAqGcIJ1wjlg3L+kPabU+FICX+5EhF60EtXcLGhNDVgf3TuJVzTortbKxdKVjX
         8H055d44/K7WA40a4AUY1ynYrOlYHZ7TrHkC7wubp+MfTGAOYQ5kiVqF/aSqjyNamKML
         gVfGJc3PtJ4pF6cdYzK2iKuRi7yzYi/mbwNF3HfL5FyZkwi0M0Say0EmG1JeFhh5hLgY
         3E2XidAhdsISZ3agBKF3lOaIe1M3HkuxEtyhVYpZAL/qDWeDAnMFdeJM5bhuSVaDpZVb
         gDz0ciyYqp/I3YYFNk9EYHhnKa7//3TfgsR4E0SaHXuYnDIo1REGO4+yj0TdoGJ9iWGX
         RvIQ==
X-Gm-Message-State: AOJu0Yzu5y/gKza3/dixrSm90RHQaE4DFMkCiVGSYHSa8OMf6O8sFOLg
	T2+jLg06HgteOEQ8fjXvAcmcvZh20SAyDjU9rwunGgVtHqYFfI/4i4eFEcM9ag==
X-Google-Smtp-Source: AGHT+IFC1t3oGaIaWTD7qAvoHPvFddvbbLTuvdcaC4WasfMYFmVyprTkfSeTUbh1nwaatINz4YBo+Q==
X-Received: by 2002:a0c:9c8c:0:b0:690:e2b5:9219 with SMTP id i12-20020a0c9c8c000000b00690e2b59219mr119040qvf.22.1710342403310;
        Wed, 13 Mar 2024 08:06:43 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: grub-devel@gnu.org
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 3/7] multiboot2: Add support for the load type header tag
Date: Wed, 13 Mar 2024 15:07:44 +0000
Message-ID: <20240313150748.791236-4-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313150748.791236-1-ross.lagerwall@citrix.com>
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binary may expose its type using the load type header tag. Implement
it according to the specification.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 grub-core/loader/multiboot_mbi2.c | 45 ++++++++++++++++++++++++++++---
 include/grub/multiboot2.h         |  1 +
 include/multiboot2.h              | 13 +++++++++
 3 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/grub-core/loader/multiboot_mbi2.c b/grub-core/loader/multiboot_mbi2.c
index 00a48413c013..6ef4f265070a 100644
--- a/grub-core/loader/multiboot_mbi2.c
+++ b/grub-core/loader/multiboot_mbi2.c
@@ -119,10 +119,12 @@ grub_multiboot2_load (grub_file_t file, const char *filename)
   grub_uint32_t console_required = 0;
   struct multiboot_header_tag_framebuffer *fbtag = NULL;
   int accepted_consoles = GRUB_MULTIBOOT2_CONSOLE_EGA_TEXT;
+  struct multiboot_header_tag_load_type *load_type_tag;
   mbi_load_data_t mld;
 
   mld.mbi_ver = 2;
   mld.relocatable = 0;
+  mld.load_type = MULTIBOOT_LOAD_TYPE_TOTAL;
 
   mld.buffer = grub_malloc (MULTIBOOT_SEARCH);
   if (!mld.buffer)
@@ -258,6 +260,17 @@ grub_multiboot2_load (grub_file_t file, const char *filename)
 #endif
 	break;
 
+      case MULTIBOOT_HEADER_TAG_LOAD_TYPE:
+        load_type_tag = (struct multiboot_header_tag_load_type *) tag;
+        mld.load_type = load_type_tag->load_type;
+        if (mld.load_type >= MULTIBOOT_LOAD_TYPE_TOTAL)
+          {
+              grub_free (mld.buffer);
+              return grub_error (GRUB_ERR_UNKNOWN_OS,
+                                 "unsupported load type: %u", load_type_tag->load_type);
+          }
+        break;
+
       default:
 	if (! (tag->flags & MULTIBOOT_HEADER_TAG_OPTIONAL))
 	  {
@@ -268,14 +281,32 @@ grub_multiboot2_load (grub_file_t file, const char *filename)
 	break;
       }
 
-  if (addr_tag && !entry_specified && !(keep_bs && efi_entry_specified))
+  if (mld.load_type == MULTIBOOT_LOAD_TYPE_ADDRESS && !addr_tag)
+    {
+      grub_free (mld.buffer);
+      return grub_error (GRUB_ERR_UNKNOWN_OS,
+                         "load type address without address tag");
+    }
+  if (mld.load_type < MULTIBOOT_LOAD_TYPE_TOTAL &&
+      mld.load_type != MULTIBOOT_LOAD_TYPE_ADDRESS && addr_tag)
+    {
+      grub_free (mld.buffer);
+      return grub_error (GRUB_ERR_UNKNOWN_OS,
+                         "address tag specified but load type doesn't match");
+    }
+  if (mld.load_type == MULTIBOOT_LOAD_TYPE_TOTAL)
+    mld.load_type = addr_tag ? MULTIBOOT_LOAD_TYPE_ADDRESS : MULTIBOOT_LOAD_TYPE_ELF;
+
+  if (mld.load_type == MULTIBOOT_LOAD_TYPE_ADDRESS && !entry_specified &&
+      !(keep_bs && efi_entry_specified))
     {
       grub_free (mld.buffer);
       return grub_error (GRUB_ERR_UNKNOWN_OS,
 			 "load address tag without entry address tag");
     }
 
-  if (addr_tag)
+  switch (mld.load_type) {
+  case MULTIBOOT_LOAD_TYPE_ADDRESS:
     {
       grub_uint64_t load_addr = (addr_tag->load_addr + 1)
 	? addr_tag->load_addr : (addr_tag->header_addr
@@ -343,8 +374,9 @@ grub_multiboot2_load (grub_file_t file, const char *filename)
       if (addr_tag->bss_end_addr)
 	grub_memset ((grub_uint8_t *) source + load_size, 0,
 		     addr_tag->bss_end_addr - load_addr - load_size);
+      break;
     }
-  else
+  case MULTIBOOT_LOAD_TYPE_ELF:
     {
       mld.file = file;
       mld.filename = filename;
@@ -355,7 +387,14 @@ grub_multiboot2_load (grub_file_t file, const char *filename)
 	  grub_free (mld.buffer);
 	  return err;
 	}
+      break;
     }
+  case MULTIBOOT_LOAD_TYPE_PE:
+      grub_fatal ("Unsupported load type: %u\n", mld.load_type);
+  default:
+    /* should be impossible */
+    grub_fatal ("Unknown load type: %u\n", mld.load_type);
+  }
 
   load_base_addr = mld.load_base_addr;
 
diff --git a/include/grub/multiboot2.h b/include/grub/multiboot2.h
index b90aa6989674..1f6d4fc9e336 100644
--- a/include/grub/multiboot2.h
+++ b/include/grub/multiboot2.h
@@ -89,6 +89,7 @@ struct mbi_load_data
   grub_uint32_t link_base_addr;
   grub_uint32_t load_base_addr;
   int avoid_efi_boot_services;
+  grub_uint32_t load_type;
 };
 typedef struct mbi_load_data mbi_load_data_t;
 
diff --git a/include/multiboot2.h b/include/multiboot2.h
index a039aa0439aa..f4377bf7b394 100644
--- a/include/multiboot2.h
+++ b/include/multiboot2.h
@@ -74,6 +74,7 @@
 #define MULTIBOOT_HEADER_TAG_EFI_BS  7
 #define MULTIBOOT_HEADER_TAG_ENTRY_ADDRESS_EFI64  9
 #define MULTIBOOT_HEADER_TAG_RELOCATABLE  10
+#define MULTIBOOT_HEADER_TAG_LOAD_TYPE  11
 
 #define MULTIBOOT2_ARCHITECTURE_I386  0
 #define MULTIBOOT2_ARCHITECTURE_MIPS32  4
@@ -178,6 +179,18 @@ struct multiboot_header_tag_relocatable
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


