Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1C09B2B32
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 10:19:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826300.1240561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Lu7-0007B7-ON; Mon, 28 Oct 2024 09:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826300.1240561; Mon, 28 Oct 2024 09:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Lu7-00077Y-FK; Mon, 28 Oct 2024 09:19:15 +0000
Received: by outflank-mailman (input) for mailman id 826300;
 Mon, 28 Oct 2024 09:19:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5Lu6-0005yk-7L
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 09:19:14 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1f0041f-950d-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 10:19:12 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9acafdb745so734092566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 02:19:12 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f05deb6sm355961566b.88.2024.10.28.02.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 02:19:09 -0700 (PDT)
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
X-Inumbo-ID: b1f0041f-950d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730107151; x=1730711951; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXO3yd4l+MzrsSxRFtcdMeGmvEoN34yTRv1ZIvRcIRg=;
        b=U8NLVyaVQdgCYJb3+Sc10tKEyF54w3ZI/1GWXeanY111PEUGiw49TbHQYSjvi/cYey
         abefuos7tbmyK7qoDjo/YlTHg0pc/NYoPqdmVApezuumDp1fwWT5bM50L4MA7pqw2A/d
         jIAUkvjRxv48FA8MOpy+9BGQfejRM8f2p80wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107151; x=1730711951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXO3yd4l+MzrsSxRFtcdMeGmvEoN34yTRv1ZIvRcIRg=;
        b=aNp00izfjS1mZLUfbliK5Q1JoIHfvd7S3/Yk7D0quVvd60trG7N0PM1HZp4syiclt9
         eqliiaMLbvXdeHohhnKcRwdv6Xa5YvNc+pbbdaAQ0k58Az6U2f3xy4P79aLuoAhJdVnF
         2A/vD7p1M62BWT0wEQrabGlUim6QYOdgMv3jvCgvqP19vtrjZfXkuCGDDFHaNfqhsoC+
         bEHnNkqn2z7eczF0f8We+/PAl3eY99OvXv4dxMJae0Ina19dBYjuBTmn7Jw3q0IqdlTF
         caEv0/BLwkrBM8aG3VXhZk2NVRa152rvWgtXB0+vSjGgA+OIXWvqL/qeZ8agvEwwbfzQ
         GBJw==
X-Gm-Message-State: AOJu0Yzxs7sqOxILPMYL5ryAt37uavck35B1AslG2GAkfZRi8VUrZO+9
	6gxWPxuK9oJC8Q+4C/AuBzsz+JEtRtNBYxUnbxSTXwWvYGcLUBNZYxTgJ0oGypf/+jvnrQ5ns7+
	1
X-Google-Smtp-Source: AGHT+IE2HztMoWz9TM71tWKVWeJZNK3i6ZU7DJ/Y8LB9GICUVzN4pEV2+DfZvHLbl6G/6ls1BIFlFw==
X-Received: by 2002:a17:907:2d22:b0:a99:fbb6:4972 with SMTP id a640c23a62f3a-a9de38e2fbbmr570966966b.25.1730107151115;
        Mon, 28 Oct 2024 02:19:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 07/10] x86/ucode: Move the CPIO path string into microcode_ops
Date: Mon, 28 Oct 2024 09:18:53 +0000
Message-Id: <20241028091856.2151603-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We've got a perfectly good vendor abstraction already for microcode.  No need
for a second ad-hoc one in microcode_scan_module().

This is in preparation to use ucode_ops.cpio_path in multiple places.

These paths are only used during __init, so take the opportunity to move them
into __initconst.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/cpu/microcode/amd.c     |  4 ++++
 xen/arch/x86/cpu/microcode/core.c    | 14 +++-----------
 xen/arch/x86/cpu/microcode/intel.c   |  4 ++++
 xen/arch/x86/cpu/microcode/private.h |  7 +++++++
 4 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 0fe869eff119..c7a779c1d885 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -443,11 +443,15 @@ static struct microcode_patch *cf_check cpu_request_microcode(
     return patch;
 }
 
+static const char __initconst amd_cpio_path[] =
+    "kernel/x86/microcode/AuthenticAMD.bin";
+
 static const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {
     .cpu_request_microcode            = cpu_request_microcode,
     .collect_cpu_info                 = collect_cpu_info,
     .apply_microcode                  = apply_microcode,
     .compare_patch                    = compare_patch,
+    .cpio_path                        = amd_cpio_path,
 };
 
 void __init ucode_probe_amd(struct microcode_ops *ops)
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index fc31ab35c3c8..6a87390ab770 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -170,25 +170,19 @@ static int __init cf_check parse_ucode(const char *s)
 }
 custom_param("ucode", parse_ucode);
 
+static struct microcode_ops __ro_after_init ucode_ops;
+
 static void __init microcode_scan_module(struct boot_info *bi)
 {
     uint64_t *_blob_start;
     unsigned long _blob_size;
     struct cpio_data cd;
-    const char *p = NULL;
     int i;
 
     ucode_blob.size = 0;
     if ( !opt_scan )
         return;
 
-    if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
-        p = "kernel/x86/microcode/AuthenticAMD.bin";
-    else if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
-        p = "kernel/x86/microcode/GenuineIntel.bin";
-    else
-        return;
-
     /*
      * Try all modules and see whichever could be the microcode blob.
      */
@@ -207,7 +201,7 @@ static void __init microcode_scan_module(struct boot_info *bi)
         }
         cd.data = NULL;
         cd.size = 0;
-        cd = find_cpio_data(p, _blob_start, _blob_size);
+        cd = find_cpio_data(ucode_ops.cpio_path, _blob_start, _blob_size);
         if ( cd.data )
         {
             ucode_blob.size = cd.size;
@@ -218,8 +212,6 @@ static void __init microcode_scan_module(struct boot_info *bi)
     }
 }
 
-static struct microcode_ops __ro_after_init ucode_ops;
-
 static DEFINE_SPINLOCK(microcode_mutex);
 
 DEFINE_PER_CPU(struct cpu_signature, cpu_sig);
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index bad51f64724a..aad6a693e800 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -405,11 +405,15 @@ static bool __init can_load_microcode(void)
     return !(mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD);
 }
 
+static const char __initconst intel_cpio_path[] =
+    "kernel/x86/microcode/GenuineIntel.bin";
+
 static const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
     .cpu_request_microcode            = cpu_request_microcode,
     .collect_cpu_info                 = collect_cpu_info,
     .apply_microcode                  = apply_microcode,
     .compare_patch                    = compare_patch,
+    .cpio_path                        = intel_cpio_path,
 };
 
 void __init ucode_probe_intel(struct microcode_ops *ops)
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index c72f060ac394..c9dd8ba066f9 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -59,6 +59,13 @@ struct microcode_ops {
      */
     enum microcode_match_result (*compare_patch)(
         const struct microcode_patch *new, const struct microcode_patch *old);
+
+    /*
+     * For Linux inird microcode compatibliity.
+     *
+     * The path where this vendor's microcode can be found in CPIO.
+     */
+    const char *cpio_path;
 };
 
 /*
-- 
2.39.5


