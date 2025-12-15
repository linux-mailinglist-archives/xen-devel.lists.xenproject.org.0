Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3ABCBEAD5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 16:33:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187435.1508827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVAZE-0007Ur-1V; Mon, 15 Dec 2025 15:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187435.1508827; Mon, 15 Dec 2025 15:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVAZD-0007SZ-UZ; Mon, 15 Dec 2025 15:32:55 +0000
Received: by outflank-mailman (input) for mailman id 1187435;
 Mon, 15 Dec 2025 15:32:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53Et=6V=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vVAZD-0007SQ-8F
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 15:32:55 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 506df4cb-d9cb-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 16:32:50 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4779a637712so24361045e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 07:32:50 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f6a42c8csm12367656f8f.16.2025.12.15.07.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 07:32:47 -0800 (PST)
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
X-Inumbo-ID: 506df4cb-d9cb-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765812769; x=1766417569; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tWfExaDqsghC/g9mOl/LeYRBxy2Sr9vZUZj145GUV9I=;
        b=Jss7NUyXdZbIIgUvEFFIF87isYrYm0MRlmJKFkHCjF/NxvDnccnNYfb2sAQBvrf7AT
         G3r+LgUgGd4fFAi2XU/YhNbzUskPSazJKcF5BQ+iW24YOOzj4u8CLITu6JmEt+iVyKyp
         31bBgX4nYSUklKMCBgp6/uA/ZrmJLwzBkVEB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765812769; x=1766417569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWfExaDqsghC/g9mOl/LeYRBxy2Sr9vZUZj145GUV9I=;
        b=NdmiNzATA0/ierQQVXuInYYQdJrQ3Vs9EgWrM4kQeSTCzM8y1ltHBCODe0QkqIMgo8
         VAK0uavvkIqwTE+R4+D5Wm64U83io7vWwQMaUtYF0cMiCxUNa6ceXr8DfqKBj11LmQBf
         ZG/Cs79Vrg5VvCjKKTyRwqpBnkIuSUDrwr4C+PRaa47/896uopzWByUdy/G2C/fQ4Ip9
         lIJlhTpqYoLXsvxBe3Y8P87KrhrLAMiopTGmus4W5If0exN7jDFX9pSSTjey2IHeSYW1
         K4gie8U5HEpLoQSn/PHUMCopJnH/AhnEBq8/XMi6OMNqKZfTeWSR5MGdC10frLxGAmBw
         mTSQ==
X-Gm-Message-State: AOJu0Yxea+ftiU6sqx7EyJ6Yvwgd1+jleUX8H18U7w4TpPd50poIIZn5
	v1WI5svaNiA9Tvz3Pez0HicRveGzHvJe+l7qNGtKq1coJaIBAykNuDbAJkHjTcVjcoPtUn3U52w
	62rLG
X-Gm-Gg: AY/fxX62Bs50er2fsuQlOVrVv2l+hPqwMhK1n3FHAlVXQKVKEw7b28r9vLp+6+bLCO6
	G1eW0EDY3LU1y+dH2yq++usieSbamQO3MQgNlx+rnieKjVcDDUxJP73WgkUxpenJJsmzNXXt6nv
	fsQxg1R4yoO3+iudZDpYzd7mE29iPK3Sw0uY6vhCJgmeSe3j5Z7gEQfZamwqlk4yyOqAUtrp/fw
	OASRdc0X55LhgVBGEhIeYLGj9wxwKXNufeP3jA6RxYAHdP0cSuITeRp8/D378De6CN95hIut10W
	M0PQejv2NttE9q6iMEyD+CE6SGGHt/flnAI0qFH4GKJU1JU4PprY4g2XA1R0df7e9KvP7pgeccy
	iAW6GxVF9LUtzq/DVBiDD4+fsCREp8cTgXErqlAkp5suQv+my7Sl33YvK10fvQxmXP6esqx62cN
	fScXKVMppDOEkW3uybyb6g1x+23TQ+JahW3TlkTuMjYF74iY848YbHLJKZhFJn6w==
X-Google-Smtp-Source: AGHT+IHiZNUCGoXP38X0ID+QXAPimIRxmAwySmxrbkelNr7NNi1ANhIHMy2ZDYXh2xRrOjimFLFUag==
X-Received: by 2002:a05:600c:1994:b0:477:952d:fc00 with SMTP id 5b1f17b1804b1-47a8f8c0a28mr109337795e9.12.1765812768446;
        Mon, 15 Dec 2025 07:32:48 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86/ucode: Adjust parse_ucode() to match other list handling
Date: Mon, 15 Dec 2025 15:32:45 +0000
Message-Id: <20251215153245.2675388-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

parse_ucode() is abnormal compared to similar parsing elsewhere in Xen.

Invert the ucode_mod_forced check with respect to the "scan" and integer
handling, so we can warn the user when we've elected to ignore the parameters,
and yield -EINVAL for any unrecognised list element.

Rewrite the ucode= command line docs for clarity.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Rebase by a year.
 * Explain how to use scan= for EFI.
---
 docs/misc/xen-command-line.pandoc | 66 ++++++++++++++++++++-----------
 xen/arch/x86/cpu/microcode/core.c | 22 +++++++----
 2 files changed, 57 insertions(+), 31 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index e92b6d55b556..2b4f80c234e1 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2752,34 +2752,52 @@ performance.
    Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
 
 ### ucode
-> `= List of [ <integer> | scan=<bool>, nmi=<bool>, digest-check=<bool> ]`
+> `= List of [ <integer>, scan=<bool>, nmi=<bool>, digest-check=<bool> ]`
 
     Applicability: x86
     Default: `scan` is selectable via Kconfig, `nmi,digest-check`
 
-Controls for CPU microcode loading. For early loading, this parameter can
-specify how and where to find the microcode update blob. For late loading,
-this parameter specifies if the update happens within a NMI handler.
-
-'integer' specifies the CPU microcode update blob module index. When positive,
-this specifies the n-th module (in the GrUB entry, zero based) to be used
-for updating CPU micrcode. When negative, counting starts at the end of
-the modules in the GrUB entry (so with the blob commonly being last,
-one could specify `ucode=-1`). Note that the value of zero is not valid
-here (entry zero, i.e. the first module, is always the Dom0 kernel
-image). Note further that use of this option has an unspecified effect
-when used with xen.efi (there the concept of modules doesn't exist, and
-the blob gets specified via the `ucode=<filename>` config file/section
-entry; see [EFI configuration file description](efi.html)).
-
-'scan' instructs the hypervisor to scan the multiboot images for an cpio
-image that contains microcode. Depending on the platform the blob with the
-microcode in the cpio name space must be:
-  - on Intel: kernel/x86/microcode/GenuineIntel.bin
-  - on AMD  : kernel/x86/microcode/AuthenticAMD.bin
-When using xen.efi, the `ucode=<filename>` config file setting takes
-precedence over `scan`. The default value for `scan` is set with
-`CONFIG_UCODE_SCAN_DEFAULT`.
+Controls for CPU microcode loading.
+
+In order to load microcode at boot, Xen needs to find a suitable update
+amongst the modules provided by the bootloader.  Two kinds of microcode update
+are supported:
+
+ 1. Raw microcode containers.  The format of the container is CPU vendor
+    specific.
+
+ 2. CPIO archive.  This is Linux's preferred mechanism, and involves having
+    the raw containers expressed as files
+    (e.g. `kernel/x86/microcode/{GenuineIntel,AuthenticAMD}.bin`) in a CPIO
+    archive, typically prepended to the initrd.
+
+The `<integer>` and `scan=<bool>` options are mutually exclusive and select
+between these two options.  Further restrictions exist for booting xen.efi
+(see below).
+
+ *  The `<integer>` option nominates a specific multiboot module as a raw
+    container (option 1 above).  Valid options start from 1 (module 0 is
+    always the dom0 kernel).  A negative number may be used, and will
+    back-reference from the end of the module list.  i.e. `ucode=-1` will
+    nominate the final multiboot module.
+
+ *  The `scan=` option causes Xen to search all modules in order to find the
+    first CPIO archive containing the appropriate file (option 2 above).  The
+    default for this option can be chosen at build time via
+    `CONFIG_UCODE_SCAN_DEFAULT`.
+
+When booting xen.efi natively, the concept of multiboot modules doesn't exist.
+Instead:
+
+ *  In the [EFI configuration file](efi.html), `ucode=<filename>` can be used
+    to identify a file as a raw container (option 1 above).  Use of this
+    mechanism will disable both `<integer>` and `scan=`.
+
+ *  If `ucode=<filename>` in the EFI configuration file is not used, it is
+    still possible to use `scan=` to search all modules.  The order of module
+    is undefined, but there is only a single `ramdisk=<filename>`
+    configuration option available.  The use of `<integer>` for xen.efi is
+    always undefined.
 
 'nmi' determines late loading is performed in NMI handler or just in
 stop_machine context. In NMI handler, even NMIs are blocked, which is
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index fe47c3a6c18d..87ab623bf9e6 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -115,11 +115,6 @@ void __init microcode_set_module(unsigned int idx)
     ucode_mod_forced = 1;
 }
 
-/*
- * The format is '[<integer>|scan=<bool>, nmi=<bool>]'. Both options are
- * optional. If the EFI has forced which of the multiboot payloads is to be
- * used, only nmi=<bool> is parsed.
- */
 static int __init cf_check parse_ucode(const char *s)
 {
     const char *ss;
@@ -134,13 +129,24 @@ static int __init cf_check parse_ucode(const char *s)
             ucode_in_nmi = val;
         else if ( (val = parse_boolean("digest-check", s, ss)) >= 0 )
             opt_digest_check = val;
-        else if ( !ucode_mod_forced ) /* Not forced by EFI */
+        else if ( (val = parse_boolean("scan", s, ss)) >= 0 )
         {
-            if ( (val = parse_boolean("scan", s, ss)) >= 0 )
+            if ( ucode_mod_forced )
+                printk(XENLOG_WARNING
+                       "Ignoring ucode=%.*s setting; overridden by EFI\n",
+                       (int)(ss - s), s);
+            else
             {
                 opt_scan = val;
                 opt_mod_idx = 0;
             }
+        }
+        else if ( isdigit(s[0]) || s[0] == '-' )
+        {
+            if ( ucode_mod_forced )
+                printk(XENLOG_WARNING
+                       "Ignoring ucode=%.*s setting; overridden by EFI\n",
+                       (int)(ss - s), s);
             else
             {
                 const char *q;
@@ -155,6 +161,8 @@ static int __init cf_check parse_ucode(const char *s)
                     opt_scan = false;
             }
         }
+        else
+            rc = -EINVAL;
 
         s = ss + 1;
     } while ( *ss );
-- 
2.39.5


