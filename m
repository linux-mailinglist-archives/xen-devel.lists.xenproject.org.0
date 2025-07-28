Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C0EB13BA4
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 15:42:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061532.1427132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugO7S-0000l8-4V; Mon, 28 Jul 2025 13:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061532.1427132; Mon, 28 Jul 2025 13:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugO7S-0000j0-1W; Mon, 28 Jul 2025 13:42:22 +0000
Received: by outflank-mailman (input) for mailman id 1061532;
 Mon, 28 Jul 2025 13:42:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAI4=2J=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugO7Q-0000Fy-33
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 13:42:20 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adc0c446-6bb8-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 15:42:18 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-455ecacfc32so18686235e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 06:42:18 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45870555065sm160569865e9.15.2025.07.28.06.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 06:42:16 -0700 (PDT)
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
X-Inumbo-ID: adc0c446-6bb8-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753710137; x=1754314937; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6BB32j7VZAYvL77F0hGwfuAosb6M/d68O8ajREyWfpc=;
        b=FEQTo8SHHHsULD6JsWf6QORLdGJTkElPLmH69RC6DUPRLW9q5cA/+QlI8pbxFLYaQZ
         SWy//e6ucBZYzqt1ahL77/IB8Q0Q+UgHpQkv/X3ZLTgsrrSQ4MYoEOAJA0MkDV+Ij/EY
         3wealvRmSX6KXHfiKY5XJ3sCFCkWmPKKJnPLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753710137; x=1754314937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BB32j7VZAYvL77F0hGwfuAosb6M/d68O8ajREyWfpc=;
        b=RaHyvbvynkyYn1u+jbPuIzi984ukqbjE1lr01+usRZOVTqpUccnROBK990fqncWUKD
         rCqbvRoReW6A0qII/yoxk8cTVzV5InxmZkifH071RhqSdD5rrEgR+mg2+N5M4x+dqIBS
         UQEDA6VK3OaQ/9f7ScVyuipGJqWc5ZOCh1EvG+mU9nyWA9l92lg3tfIoXVUT3QYFbgNR
         HDuwV/vstf3GIU1HmKrrD9WILwXCTJo6HC2sN0/JcERWIiJIa3qpHb+UR78k9RW6maJG
         t69FiNQRV/8QbLqYKUUF6ZnqTJ0gAvzK3YMwYGE0YM1NBED6jjN/VxeRIok0iaWdgp9P
         Tkrg==
X-Gm-Message-State: AOJu0YzOeY9HuKTbUwEJwpEWqrm0TXxTW5UUV3A2Bh/gIYNG9eLQqqBF
	7kRVbdnKygPPxegOj6hz/S1vFbt7kI52hvR+PYuyniYkkXBib1f78vV2wbAbwjyeexYy3o1mItb
	3J8GLjSc=
X-Gm-Gg: ASbGncvt9lav9ASbN04eVLfVq+uI7ROn2CrJyleNgrAKQYqGRIrG5m5BACrkJN8jBel
	VVtDHxbKBs3dZTSONE9gj97lOO/pQDboDD6mI/TMd1Ntmdo6jLRXd1QChwdxQPTE7CHQ2bRtm+W
	eeH6AKiSK6jqGHkSPoLHwnaBta2KIOlXRWi5LVBpE50m9ezSFc/Y1lREWbyI+CEz4zXhzCRLtub
	CmyuH00HjrDNWck4p7Qjx95vqRTLcPaCGn7+fioLWeZHi2/MFTbvMcgiSgfYm+rIgN0/z0qTsTa
	VInNlpY/SRj3GZfSB1NH2h9kPLjW2gf61ogvnvJssEHWJqHQvZChvWftDwQZFavbTIf2xBqqRoa
	AMfTSZbnMt25bztMdGlejxmHbZ+pLgZ+9wIapfftv9Jl0be05BGxctFvwaUJWeqrDlM6VanN0DH
	hRLsmZ6fPqTEc=
X-Google-Smtp-Source: AGHT+IGyOQOgqO9Og3BWxBICgD3v6a6hOytKV/LZXaXv2scTwbDXw+lTNdbYTi6XZbiomb5qket1AQ==
X-Received: by 2002:a05:600c:699a:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-45876304b8dmr88451335e9.6.1753710137319;
        Mon, 28 Jul 2025 06:42:17 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/ucode: Update vendor/family/model logic
Date: Mon, 28 Jul 2025 14:42:15 +0100
Message-Id: <20250728134215.3183214-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch to the new fields.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c  | 10 +++++-----
 xen/arch/x86/cpu/microcode/core.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 8b09231c6c66..a5729229a403 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -122,7 +122,7 @@ static bool check_digest(const struct container_microcode *mc)
      * microcode updates.  Mitigate by checking the digest of the patch
      * against a list of known provenance.
      */
-    if ( boot_cpu_data.x86 < 0x17 ||
+    if ( boot_cpu_data.family < 0x17 ||
          !opt_digest_check )
         return true;
 
@@ -174,7 +174,7 @@ static bool verify_patch_size(uint32_t patch_size)
 #define F19H_MPB_MAX_SIZE 5568
 #define F1AH_MPB_MAX_SIZE 15296
 
-    switch ( boot_cpu_data.x86 )
+    switch ( boot_cpu_data.family )
     {
     case 0x14:
         max_size = F14H_MPB_MAX_SIZE;
@@ -222,7 +222,7 @@ static bool check_final_patch_levels(const struct cpu_signature *sig)
     };
     unsigned int i;
 
-    if ( boot_cpu_data.x86 != 0x10 )
+    if ( boot_cpu_data.family != 0x10 )
         return false;
 
     for ( i = 0; i < ARRAY_SIZE(final_levels); i++ )
@@ -516,14 +516,14 @@ static const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {
 
 void __init ucode_probe_amd(struct microcode_ops *ops)
 {
-    if ( !opt_digest_check && boot_cpu_data.x86 >= 0x17 )
+    if ( !opt_digest_check && boot_cpu_data.family >= 0x17 )
     {
         printk(XENLOG_WARNING
                "Microcode patch additional digest checks disabled");
         add_taint(TAINT_CPU_OUT_OF_SPEC);
     }
 
-    if ( boot_cpu_data.x86 < 0x10 )
+    if ( boot_cpu_data.family < 0x10 )
         return;
 
     *ops = amd_ucode_ops;
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 816e9bfe40ba..1b093bc98a58 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -198,7 +198,7 @@ static struct microcode_patch *parse_blob(const char *buf, size_t len)
 /* Returns true if ucode should be loaded on a given cpu */
 static bool is_cpu_primary(unsigned int cpu)
 {
-    if ( boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+    if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
         /* Load ucode on every logical thread/core */
         return true;
 
@@ -876,7 +876,7 @@ int __init early_microcode_init(struct boot_info *bi)
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
 
-    switch ( c->x86_vendor )
+    switch ( c->vendor )
     {
     case X86_VENDOR_AMD:
         ucode_probe_amd(&ucode_ops);
-- 
2.39.5


