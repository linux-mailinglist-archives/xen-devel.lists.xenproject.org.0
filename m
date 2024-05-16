Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FD58C7542
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 13:31:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723194.1127850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZKH-0003M9-P2; Thu, 16 May 2024 11:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723194.1127850; Thu, 16 May 2024 11:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZKH-0003Jm-LH; Thu, 16 May 2024 11:31:09 +0000
Received: by outflank-mailman (input) for mailman id 723194;
 Thu, 16 May 2024 11:31:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lir8=MT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s7ZKG-0003Jg-Jw
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 11:31:08 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c88ded90-1377-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 13:31:05 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5206a5854adso755933e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 04:31:05 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bed17b8sm10456692a12.55.2024.05.16.04.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 04:31:04 -0700 (PDT)
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
X-Inumbo-ID: c88ded90-1377-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715859065; x=1716463865; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7eES0enU6K30VZCAG3M0bmIoFFsSRcG+0mogoPG61rA=;
        b=em+P0DBWNWQNW419luz+38MFt+0VYrl1KONZ9m0SlFVigOEu1uAs5lp0tJg6ZYpJA6
         1J+oMFZ3AFsrjlow3K3yWEiMamXs0/sa3+IWKL2w3t5SbmGIVpc5WeAs72A2RN3eY7kN
         pPOkfoU4f5uZ0yjhdUNImxdLuGGr/eg3j2HH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715859065; x=1716463865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7eES0enU6K30VZCAG3M0bmIoFFsSRcG+0mogoPG61rA=;
        b=XpTg0L5u8EKGafNz2xvPbLT22/p9mKKySwnRdbpuJ/MwE6zvsTqLs3S9Ziol1obzzy
         3pqlqjfQl47mqHKoDz/gQtmUc2dy0O/Hn/tewENjIiR2N/mJTRMyI6gMvwZ1N/fmuRyJ
         hQrpA6zX2kZKZWyq367r4/T5zkgpulsr56BWS3k6HCWqrOcF2W4+RMPV+zBF0d/hYtb+
         A8MRTMUKaBLlJl7BMlNEWmmqPsGmy3Y/p3mEbDsmFnYE7HWANa+nL+l/xBtQD5icVJpN
         BEEQTfPDcce+amt1DhyiR3aoTGk+cnmjeVLaqImPp0xFIeuZo5e7lGu+QEGxHiR67DiE
         x0kw==
X-Gm-Message-State: AOJu0YxElog3a+otReNYsn04qV4D7t9xR26qA7DNWsD8EccEmccG8z2I
	Pz0VA/ifzKMIYznstd4rkQjkKg5yLWyIuhgkchRPunzKxpuAQkRtV7ph7ptgbKShn4IOANCsE3a
	h
X-Google-Smtp-Source: AGHT+IHXVoEftk3i1p1rm5wrPzpW1+xaJlcnZsQHCYGBs1diEX6qnDShhwN9ttLosOwgdsFR2cG+FA==
X-Received: by 2002:a05:6512:3ca9:b0:523:8bce:3db7 with SMTP id 2adb3069b0e04-5238bce3e92mr4606066e87.68.1715859064823;
        Thu, 16 May 2024 04:31:04 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Fouad Hilly <fouad.hilly@cloud.com>
Subject: [PATCH] x86/ucode: Further fixes to identify "ucode already up to date"
Date: Thu, 16 May 2024 12:31:03 +0100
Message-Id: <20240516113103.3018940-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the revision in hardware is newer than anything Xen has to hand,
'microcode_cache' isn't set up.  Then, `xen-ucode` initiates the update
because it doesn't know whether the revisions across the system are symmetric
or not.  This involves the patch getting all the way into the
apply_microcode() hooks before being found to be too old.

This is all a giant mess and needs an overhaul, but in the short term simply
adjust the apply_microcode() to return -EEXIST.

Also, unconditionally print the preexisting microcode revision on boot.  It's
relevant information which is otherwise unavailable if Xen doesn't find new
microcode to use.

Fixes: 648db37a155a ("x86/ucode: Distinguish "ucode already up to date"")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Fouad Hilly <fouad.hilly@cloud.com>

Sorry Fouad, but this collides with your `--force` series once again.
Hopefully it might make things fractionally easier.

Background: For 06-55-04 (Skylake server, stepping 4 specifically), there's a
recent production firmware update which has a newer microcode revision than
exists in the Intel public microcode repository.  It's causing a mess in our
automated testing, although it is finding good bugs...
---
 xen/arch/x86/cpu/microcode/amd.c   | 7 +++++--
 xen/arch/x86/cpu/microcode/core.c  | 2 ++
 xen/arch/x86/cpu/microcode/intel.c | 7 +++++--
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 17e68697d5bf..f76a563c8b84 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -222,12 +222,15 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
     uint32_t rev, old_rev = sig->rev;
     enum microcode_match_result result = microcode_fits(patch);
 
+    if ( result == MIS_UCODE )
+        return -EINVAL;
+
     /*
      * Allow application of the same revision to pick up SMT-specific changes
      * even if the revision of the other SMT thread is already up-to-date.
      */
-    if ( result != NEW_UCODE && result != SAME_UCODE )
-        return -EINVAL;
+    if ( result == OLD_UCODE )
+        return -EEXIST;
 
     if ( check_final_patch_levels(sig) )
     {
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 762111838f5f..519798dca4af 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -881,6 +881,8 @@ int __init early_microcode_init(unsigned long *module_map,
 
     ucode_ops.collect_cpu_info();
 
+    printk(XENLOG_INFO "Boot microcode revision: 0x%08x\n", this_cpu(cpu_sig).rev);
+
     /*
      * Some hypervisors deliberately report a microcode revision of -1 to
      * mean that they will not accept microcode updates.
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 96f34b336b21..f505aa1b7888 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -294,10 +294,13 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
 
     result = microcode_update_match(patch);
 
-    if ( result != NEW_UCODE &&
-         !(opt_ucode_allow_same && result == SAME_UCODE) )
+    if ( result == MIS_UCODE )
         return -EINVAL;
 
+    if ( result == OLD_UCODE ||
+         (result == SAME_UCODE && !opt_ucode_allow_same) )
+        return -EEXIST;
+
     wbinvd();
 
     wrmsrl(MSR_IA32_UCODE_WRITE, (unsigned long)patch->data);
-- 
2.30.2


