Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B7AA77BBC
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:09:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934111.1335929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbMR-0000iP-QB; Tue, 01 Apr 2025 13:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934111.1335929; Tue, 01 Apr 2025 13:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbMR-0000fg-Ke; Tue, 01 Apr 2025 13:08:59 +0000
Received: by outflank-mailman (input) for mailman id 934111;
 Tue, 01 Apr 2025 13:08:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oF/L=WT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzbMQ-0000Od-8w
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:08:58 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7787ab51-0efa-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 15:08:56 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e5e0caa151so10451659a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:08:56 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5edc17dfe1dsm7009781a12.69.2025.04.01.06.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 06:08:54 -0700 (PDT)
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
X-Inumbo-ID: 7787ab51-0efa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743512935; x=1744117735; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNjc/wja0hxlH+2aMQfRdD42ULkgPnjmDI4A0WYPe2E=;
        b=bXvlFdocO5yNuYroTWHqc48h/QWhoBA4lDGkA/sf3ssLH7ZUwfIZVG6T3pgTT8Bl2D
         U2ThE9KZUqK9PJPtj9DjDJlUCrqqB51PRORbh8vr/zfyI3mXi+fBpEfxtM3W1+sEsfYb
         TvYCZMv6+kcJHVh4E2ryoTIJTC7zSKRfpvh6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512935; x=1744117735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNjc/wja0hxlH+2aMQfRdD42ULkgPnjmDI4A0WYPe2E=;
        b=U+W6/v0CS0cn+vWwQUSqvcRyY/Ju61UmD4cZo30OAgNPbNw7QdnLBAP9ey+6OnpchN
         BmPqBVVJEUDkyyt5R/AFN4JGKT6qwc22zo73ixGZ5XzniQbDQgBx9Q5MQVVJyDFiDLDk
         UwfBlhqSBHbuVd92aGtpQU+cUVzS2cuGE0LLTr8PXbamRDuBpwltp5s/dLUP3AJP1aoH
         1Xo1onKxXoASKI2NmczXnMEkQxiIhmssp38nXPKmWRs1B2s43M74PsinO7ncrpuLs3XC
         YwnuzocLMY1/bMUtkqNtCrLCOO8N1KzUWZZYkzKHkb0+6zXZ1A/QpxtQ5xHAFU2/lqhm
         6DlQ==
X-Gm-Message-State: AOJu0YxDh+MY/KCAppIdU2IvuE+YxSx6kUWVwrk/qtJvK/JB8Nl/+m8O
	7D4czhRK3khU5ykFOOFmwdcqn65S8ThUW6d0ayOGD8mnWA5M1ymig6WV5PPEfJb/h1UCeVcfelk
	6
X-Gm-Gg: ASbGncsFRqLPx+qktkkdZarVPSFvtkGVkrQVGhTAdXVUPriENjmrvGAh0HnbMDIv3lJ
	OM7O2QBqKK3ebaqmdFocKbp5eiSiZmbRj5f1wYHNp9ViQTDdDmWfXjrmvGXi9mzeYJimGD4fmtg
	8QWWUygSzxCEK0fqwLSqKGnV8m2/2+jc8xLa8CHbvLYAb4hlA1tulQDQDC0l5BukTmdUROJyIFO
	SP5TssTK0kkeyQ4eR7+qd+dUtuLS88NqpW0+2nuLQzp0HkfXWsb+WIO+srVlCOfjJN5OAaF3CmW
	uiNN70kBXP4Fg5HOCWtF+ot16VODszvgmChtcW5pG7Lg0pZ5Yw==
X-Google-Smtp-Source: AGHT+IEbNjBBsUGdEZiCoaAKgdqxjc289hgYwwv3U8wReSm/CSYqDlTS21ANBN4YU43+aDtmHqTlGA==
X-Received: by 2002:a05:6402:2709:b0:5e5:ca1b:c425 with SMTP id 4fb4d7f45d1cf-5edfd101725mr11186425a12.17.1743512935025;
        Tue, 01 Apr 2025 06:08:55 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 03/11] x86/mkreloc: use the string table to get names
Date: Tue,  1 Apr 2025 15:08:32 +0200
Message-ID: <20250401130840.72119-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401130840.72119-1-roger.pau@citrix.com>
References: <20250401130840.72119-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When using PE format names greater than 8 characters are placed in the
string table, and a reference using the '/<offset>' format is placed in the
name field.  Read the string table if present, and decode names as
required.

No functional change intended, but the name references printed in error
messages are now human readable:

Warning: relocation to r/o section /4:00042d43

Becomes:

Warning: relocation to r/o section .init.text:000446c3

Note the introduced helper to print names relies on a static internal
buffer to make sure the returned string are always null terminated.
This is enough for the current use-case, but if the returned value is to
stay valid between calls the current static buffer won't work as expected.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/efi/mkreloc.c | 69 +++++++++++++++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/efi/mkreloc.c b/xen/arch/x86/efi/mkreloc.c
index 1a6cfc845cba..cc106bd875ba 100644
--- a/xen/arch/x86/efi/mkreloc.c
+++ b/xen/arch/x86/efi/mkreloc.c
@@ -17,6 +17,12 @@
 #define PE_BASE_RELOC_HIGHLOW  3
 #define PE_BASE_RELOC_DIR64   10
 
+/* The size of a symbol table entry is always 18 bytes. */
+#define SYM_SIZE 18
+
+const char *string_table;
+unsigned int string_table_size;
+
 static void usage(const char *cmd, int rc)
 {
     fprintf(rc ? stderr : stdout,
@@ -25,6 +31,28 @@ static void usage(const char *cmd, int rc)
     exit(rc);
 }
 
+const char *get_name(const char *name)
+{
+    static char buffer[sizeof(((struct section_header *)NULL)->name) + 1] = {};
+    unsigned long offset;
+
+    if ( name[0] != '/' )
+    {
+        /*
+         * Use a temporary buffer in case the name is 8 characters long, as
+         * then there's no terminating null character in the input string.
+         */
+        strncpy(buffer, name, sizeof(buffer) - 1);
+        return buffer;
+    }
+
+    offset = strtoul(&name[1], NULL, 10);
+    if ( !string_table || offset < 4 || offset >= string_table_size )
+        return name;
+
+    return &string_table[offset - 4];
+}
+
 static unsigned int load(const char *name, int *handle,
                          struct section_header **sections,
                          uint_fast64_t *image_base,
@@ -83,6 +111,31 @@ static unsigned int load(const char *name, int *handle,
         exit(3);
     }
 
+    if ( !string_table && pe_hdr.symbol_table )
+    {
+        char *strings;
+
+        if ( lseek(in, pe_hdr.symbol_table + pe_hdr.symbols * SYM_SIZE,
+                   SEEK_SET) < 0 ||
+             read(in, &string_table_size, sizeof(string_table_size)) !=
+             sizeof(string_table_size) )
+        {
+            perror(name);
+            exit(3);
+        }
+
+        string_table_size -= sizeof(string_table_size);
+        strings = malloc(string_table_size);
+
+        if ( read(in, strings, string_table_size) != string_table_size )
+        {
+            perror(name);
+            exit(3);
+        }
+
+        string_table = strings;
+    }
+
     *sections = malloc(pe_hdr.sections * sizeof(**sections));
     if ( !*sections )
     {
@@ -173,8 +226,8 @@ static void diff_sections(const unsigned char *ptr1, const unsigned char *ptr2,
         if ( i < disp || i + width - disp > sec->raw_data_size )
         {
             fprintf(stderr,
-                    "Bogus difference at %.8s:%08" PRIxFAST32 "\n",
-                    sec->name, i);
+                    "Bogus difference at %s:%08" PRIxFAST32 "\n",
+                    get_name(sec->name), i);
             exit(3);
         }
 
@@ -184,9 +237,9 @@ static void diff_sections(const unsigned char *ptr1, const unsigned char *ptr2,
         if ( delta != diff )
         {
             fprintf(stderr,
-                    "Difference at %.8s:%08" PRIxFAST32 " is %#" PRIxFAST64
+                    "Difference at %s:%08" PRIxFAST32 " is %#" PRIxFAST64
                     " (expected %#" PRIxFAST64 ")\n",
-                    sec->name, i - disp, delta, diff);
+                    get_name(sec->name), i - disp, delta, diff);
             continue;
         }
         if ( width == 8 && (val1.u64 < base || val1.u64 > end) )
@@ -210,15 +263,15 @@ static void diff_sections(const unsigned char *ptr1, const unsigned char *ptr2,
         else if ( rva != cur_rva )
         {
             fprintf(stderr,
-                    "Cannot handle decreasing RVA (at %.8s:%08" PRIxFAST32 ")\n",
-                    sec->name, i - disp);
+                    "Cannot handle decreasing RVA (at %s:%08" PRIxFAST32 ")\n",
+                    get_name(sec->name), i - disp);
             exit(3);
         }
 
         if ( !(sec->flags & IMAGE_SCN_MEM_WRITE) )
             fprintf(stderr,
-                    "Warning: relocation to r/o section %.8s:%08" PRIxFAST32 "\n",
-                    sec->name, i - disp);
+                    "Warning: relocation to r/o section %s:%08" PRIxFAST32 "\n",
+                    get_name(sec->name), i - disp);
 
         printf("\t.word (%u << 12) | 0x%03" PRIxFAST32 "\n",
                reloc, sec->rva + i - disp - rva);
-- 
2.48.1


