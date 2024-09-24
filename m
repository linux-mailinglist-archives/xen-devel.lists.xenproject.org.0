Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0D3984476
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 13:24:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802631.1212933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st3e3-0003W6-Ff; Tue, 24 Sep 2024 11:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802631.1212933; Tue, 24 Sep 2024 11:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st3e3-0003UR-Cm; Tue, 24 Sep 2024 11:23:51 +0000
Received: by outflank-mailman (input) for mailman id 802631;
 Tue, 24 Sep 2024 11:23:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4pT6=QW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1st3e2-0003UD-Dp
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 11:23:50 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7791e882-7a67-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 13:23:48 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8d3cde1103so454499166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 04:23:47 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f36369sm72958866b.42.2024.09.24.04.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 04:23:46 -0700 (PDT)
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
X-Inumbo-ID: 7791e882-7a67-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727177027; x=1727781827; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OnHtnZrMK2tQUalYau4hy3LFlAebzbpdz5JkhoBOtH8=;
        b=VJ56GJJhrg8Yga/OGRJ/kW+a5KT59li9kMfzhK50rcX4ViAc4vEK+qbeXUTbLDLQTD
         4NDadtnWEftzuiOMUnMDCncZsJM86MliKY6AZ/F8iiQoQmNUC0NtSf6ugoBZEqz4eRIh
         aoo8Gk/tZaKQZSLbRCwHH4wsvWClcE10bAePE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727177027; x=1727781827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OnHtnZrMK2tQUalYau4hy3LFlAebzbpdz5JkhoBOtH8=;
        b=X1047SG9pFlvEuV1fSa2cax+qA3iQhpRnFWf6+24Ffsvjk2NnPBiv7pfZehlAgmrbW
         2Ov79XyRgBQTqO2/iBUHb0lq4sSInAX+RLNCfyFQwMbBya7Q2zTMz8yROIsu2oUY29cP
         JHcS0JPiVxIquGvqAHXEOSs03Gl25yzcbcZOfePLQmxk7GLtHqwY02wEqYHuIQ9yuoUa
         SZnsF6VRHFdl0vGT0xqXVl3z5RZg5XVylt6bQJub9fDKMf3ddvjRYZtY0IBy0mG8LjBX
         LCe2zylir0JuJuyj+ihNn9AMP1uSgCK0YUGG9hZ6LoV9CJ5xxsLUlXU2MsaAB7ypX+YY
         GInA==
X-Gm-Message-State: AOJu0Yz0siQoCl9cvEEYTHUY1/TbuYx4Yep0Jpb5vxKGdmLW8HVqu1Rh
	WkVOEIIaznlrVr8RCN4sBeXqDhkX0aUhbYn/9c3W2IXxg59KJo7ZqAkEGzECrB2Vo8A46vLZQ8K
	zGbY=
X-Google-Smtp-Source: AGHT+IGF2SXfecs9uyaYh4U7zKGrCCfidh7U3aCH9JqLE0+9hY7WOSsWBwTLLvR+IcarFH06RSoo/A==
X-Received: by 2002:a17:907:f79a:b0:a8a:78bb:1e2 with SMTP id a640c23a62f3a-a90d55e0b9bmr1617714266b.6.1727177026694;
        Tue, 24 Sep 2024 04:23:46 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/boot: Further simplify CR4 handling in dom0_construct_pv()
Date: Tue, 24 Sep 2024 12:23:43 +0100
Message-Id: <20240924112343.193506-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The logic would be more robust disabling SMAP based on its precense in CR4,
rather than on certain features.

A forthcoming feature, LASS, needs the same treatment here.  Introduce minimum
enumeration information, although it will take a bit more work to get LASS
fully usable in guests.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

I know LASS can't be used with traditional PV guests, but I have some PV-lite
plans.  The problem is the PV kernel, in CPL3, accessing addresses in the high
canonincal half.
---
 xen/arch/x86/include/asm/x86-defns.h        |  1 +
 xen/arch/x86/pv/dom0_build.c                | 18 ++++++++++--------
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index caa92829eaa9..8f97fb1e6a12 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -75,6 +75,7 @@
 #define X86_CR4_PKE        0x00400000 /* enable PKE */
 #define X86_CR4_CET        0x00800000 /* Control-flow Enforcement Technology */
 #define X86_CR4_PKS        0x01000000 /* Protection Key Supervisor */
+#define X86_CR4_LASS       0x08000000 /* Linear Address Space Separation */
 
 /*
  * XSTATE component flags in XCR0 | MSR_XSS
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 262edb6bf2f0..f5c868df384f 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -1057,29 +1057,31 @@ int __init dom0_construct_pv(struct domain *d,
                              module_t *initrd,
                              const char *cmdline)
 {
+    unsigned long cr4 = read_cr4();
+    unsigned long mask = X86_CR4_SMAP | X86_CR4_LASS;
     int rc;
 
     /*
-     * Clear SMAP in CR4 to allow user-accesses in construct_dom0().  This
-     * prevents us needing to write construct_dom0() in terms of
+     * Clear SMAP/LASS in CR4 to allow user-accesses in construct_dom0().
+     * This prevents us needing to write construct_dom0() in terms of
      * copy_{to,from}_user().
      */
-    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
+    if ( cr4 & mask )
     {
         if ( IS_ENABLED(CONFIG_PV32) )
-            cr4_pv32_mask &= ~X86_CR4_SMAP;
+            cr4_pv32_mask &= ~mask;
 
-        write_cr4(read_cr4() & ~X86_CR4_SMAP);
+        write_cr4(cr4 & ~mask);
     }
 
     rc = dom0_construct(d, image, image_headroom, initrd, cmdline);
 
-    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
+    if ( cr4 & mask )
     {
-        write_cr4(read_cr4() | X86_CR4_SMAP);
+        write_cr4(cr4);
 
         if ( IS_ENABLED(CONFIG_PV32) )
-            cr4_pv32_mask |= X86_CR4_SMAP;
+            cr4_pv32_mask |= mask;
     }
 
     return rc;
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 8fa3fb711a8d..cbc0a3a8aa2b 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -303,6 +303,7 @@ XEN_CPUFEATURE(SM3,          10*32+ 1) /*A  SM3 Instructions */
 XEN_CPUFEATURE(SM4,          10*32+ 2) /*A  SM4 Instructions */
 XEN_CPUFEATURE(AVX_VNNI,     10*32+ 4) /*A  AVX-VNNI Instructions */
 XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
+XEN_CPUFEATURE(LASS,         10*32+ 6) /*   Linear Address Space Separation */
 XEN_CPUFEATURE(CMPCCXADD,    10*32+ 7) /*a  CMPccXADD Instructions */
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
 XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
-- 
2.39.5


