Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB87A45020
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 23:31:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895997.1304684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3SM-00083e-NJ; Tue, 25 Feb 2025 22:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895997.1304684; Tue, 25 Feb 2025 22:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3SM-0007yz-Hr; Tue, 25 Feb 2025 22:31:14 +0000
Received: by outflank-mailman (input) for mailman id 895997;
 Tue, 25 Feb 2025 22:31:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqP+=VQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tn3SK-0007wd-IL
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 22:31:12 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3675954e-f3c8-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 23:31:10 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38f406e9f80so5641697f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 14:31:10 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba532d33sm1561315e9.15.2025.02.25.14.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 14:31:08 -0800 (PST)
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
X-Inumbo-ID: 3675954e-f3c8-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740522670; x=1741127470; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6k0r0buy4PFVFnjhXbZhLrrEk2+FHrptJRXGWnFanI=;
        b=FSwakNvbZQa8oieaZR+UtxQmIC5/m2hMeWo5OUmHnGFWZCJwOX2oDJdwcOh32WoZfN
         98I8sRqiKxCPgoLOehCRQu3lfWMH1yqoD8X3YGv0kMFv+PEPmAU/9uN5t+7rPDW4aRvV
         9mNCMnTazV3zYb/QE+6qWG++IJd192wmfDi8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522670; x=1741127470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j6k0r0buy4PFVFnjhXbZhLrrEk2+FHrptJRXGWnFanI=;
        b=j4JqctxU54cEOQxd3If0ayhQ2wBVtzl/3cGpEyjiMXDAaQLORFKEL5QSR7YlYTggBl
         quVt3NuViPZGgRXhaxDFZlolVK6yD4jWsbAuxbKfdmbnVPlTT30ecG0xy3sJUPCX738X
         atBlebgoamf7HWhiEqrSNz5HgBrYB54MolVzEr6ZbHYEBMe4sKb2Sh+p6hTho9ATITuw
         0oPZB9K0O0c5K8qyo1NqVb/epgFrghbkjICKpNqMRz5JKnk5DFiLk3Te2u4dlz2I407s
         ahrm11Sk9RBY8vTMKOXulCrWLprw2Z/bzB656Q3oVUbTDhraVZkAXsA167PyfGiXndAM
         JQaA==
X-Gm-Message-State: AOJu0YzJtiEQizVxQmfbKpl9H2qU0DPYmEF7CH1ubJEMpGh74ySFx489
	4UhwExHaILvp1N+vhaAq1hx/zyK4zotMU+wlwA5IdWC0dsWeKsI6F7bN96mTSRUyzU14w3Ql5hP
	T
X-Gm-Gg: ASbGncuio9XwfvCxbkXnNMEeNgJYsmAU7hrfJQyBH6wqhPx3tPzezXRZPIvSuWDxlNf
	hW5YUaSv68RSOWAjx0sHEgY9paDN87wms2Z4UzVwee6kD/WGnBLwouUiKbUqC2242MhyXoOTacr
	9KVbcu342Iz58JQOtfmuvv94sW3Q7uZBf6vF4vjSsF+zyvD+ch56aE3gTCq0G84HRlv9VrVTsNb
	BP3gXzk95X2uXJqaYi6M4HZpcwrMZo3XH6SHF3C1f065UPnEisGKDImSc+VeoWBjUq9DUlyH0DG
	vr+gtsopBWM/M7osBxQ9/TP3khjFfJL2i2zcR3pQMRVlhW2je23qdpcWcey2xnMoxD/5V+25zzg
	27mtipw==
X-Google-Smtp-Source: AGHT+IGpJOI6/YFaPSiDY+PbZCjyF0007EHzLhP2bR379Ljx/pd/4K9fn/HDqg+N+q8PH4b3rSeHRQ==
X-Received: by 2002:a5d:5f4e:0:b0:38f:4a0b:e764 with SMTP id ffacd0b85a97d-390d4f4306cmr857624f8f.28.1740522669724;
        Tue, 25 Feb 2025 14:31:09 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/2] x86/ucode: Adjust parse_ucode() to match other list handling
Date: Tue, 25 Feb 2025 22:29:04 +0000
Message-Id: <20250225222905.1182374-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250225222905.1182374-1-andrew.cooper3@citrix.com>
References: <20250225222905.1182374-1-andrew.cooper3@citrix.com>
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
---
 docs/misc/xen-command-line.pandoc | 56 ++++++++++++++++++-------------
 xen/arch/x86/cpu/microcode/core.c | 22 ++++++++----
 2 files changed, 47 insertions(+), 31 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 0c6225391d55..47674025249a 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2721,34 +2721,42 @@ performance.
    Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
 
 ### ucode
-> `= List of [ <integer> | scan=<bool>, nmi=<bool> ]`
+> `= List of [ <integer>, scan=<bool>, nmi=<bool> ]`
 
     Applicability: x86
     Default: `scan` is selectable via Kconfig, `nmi=true`
 
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
+The `<integer>` and `scan=` options are mutually exclusive and select between
+these two options.  They are also invalid in EFI boots (see below).
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
+Instead, in the [EFI configuration file](efi.html), `ucode=<filename>` can be
+used to identify a file as a raw container (option 1 above).
 
 'nmi' determines late loading is performed in NMI handler or just in
 stop_machine context. In NMI handler, even NMIs are blocked, which is
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index de00c22b4bd6..c8e14ed9b10c 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -113,11 +113,6 @@ void __init microcode_set_module(unsigned int idx)
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
@@ -130,13 +125,24 @@ static int __init cf_check parse_ucode(const char *s)
 
         if ( (val = parse_boolean("nmi", s, ss)) >= 0 )
             ucode_in_nmi = val;
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
@@ -151,6 +157,8 @@ static int __init cf_check parse_ucode(const char *s)
                     opt_scan = false;
             }
         }
+        else
+            rc = -EINVAL;
 
         s = ss + 1;
     } while ( *ss );
-- 
2.39.5


