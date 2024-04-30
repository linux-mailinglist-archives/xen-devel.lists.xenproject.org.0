Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B653E8B7614
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 14:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714807.1116135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1mtP-0005IR-0b; Tue, 30 Apr 2024 12:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714807.1116135; Tue, 30 Apr 2024 12:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1mtO-0005Es-Ti; Tue, 30 Apr 2024 12:47:30 +0000
Received: by outflank-mailman (input) for mailman id 714807;
 Tue, 30 Apr 2024 12:47:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGtk=MD=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1s1mtN-0005Ay-IT
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 12:47:29 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccd0812e-06ef-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 14:47:27 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a58a36008ceso662040466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 05:47:27 -0700 (PDT)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e14-20020a170906504e00b00a558014ab2csm14165324ejk.145.2024.04.30.05.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 05:47:26 -0700 (PDT)
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
X-Inumbo-ID: ccd0812e-06ef-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714481247; x=1715086047; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxvxpeo53t3s7EbhOvzZRsMHHwhI5TdimldfKLtVGMc=;
        b=fMdFeSM77EzxJp2l/OGOd8Lh5enogyE7Z5gqUov6cc1h/XPMrdnlXsGhmFJ42aPMOj
         Yc7SBBVtGd+QuQWgdffsAvQ1/wPeCaykd3ue1fZbuEPtJBloiF5i8YYqZ6T4Fr+nQdDN
         UwcZDD3CrgOr33lRLHNeskfo7cGyhmRehqaHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481247; x=1715086047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxvxpeo53t3s7EbhOvzZRsMHHwhI5TdimldfKLtVGMc=;
        b=E/MXkPvfXZ+OBvsAr0voYSJPR8cyBrTXSHnpRnJbkdwqii6gBcbmxWxEXtkbUsqeEs
         bVVgSk/UNTYg+ePLXVU3dA0yp53PYzT3+FFScyhzTSEhHCGUYnLYrjWt+q+0UWJWyD69
         O8oURqRxmOlhRq7/TojKsUtjsqEkXA2EUPPwfd0vZXVMSkfN9jkk0n9waL0Txpsl8vSO
         +lEszZiMh5+2Ej6FJsICBBoUP+OlwwPHJaD4Rl4BHeeRGdOWhGW125EAkjjtT8hVCCFh
         jLr/BGh0wCZ9wZpG6Zcduo+IxFRs5o4KIfKE5ThyZj9CzOwjr83S8JwJUVUUWt0OKt36
         hrAg==
X-Gm-Message-State: AOJu0Yy0Wyni/BIflDxW5siG5huPWJ+iZEjrPIQ8aO0Qxch2rv5L/EGF
	bB309XC+pjFq8J2+JUDuDpj+CgcVvtyjHzxzUTT0p0UEDGLcOkKPWEptc0TIBMbzFJZWdr9AclJ
	X
X-Google-Smtp-Source: AGHT+IEYkZIzhUEArnmSrlxLG95tEEeoD8rk4qvgtIN3V+ZO4wpE/Zw2bddMmewo+3ca9v7SmEH5/g==
X-Received: by 2002:a17:906:5fd3:b0:a58:e8c7:c0ae with SMTP id k19-20020a1709065fd300b00a58e8c7c0aemr6933947ejv.16.1714481246781;
        Tue, 30 Apr 2024 05:47:26 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 1/5] x86: Update x86 low level version check of microcode
Date: Tue, 30 Apr 2024 13:47:05 +0100
Message-ID: <20240430124709.865183-2-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240430124709.865183-1-fouad.hilly@cloud.com>
References: <20240430124709.865183-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update microcode version check at Intel and AMD Level by:
Preventing the low level code from sending errors if the microcode
version is not a newer version. this is required to allow developers to do
ucode loading testing, including the introduction of Intel "min rev" field,
which requires an override mechanism for newer version checks. Even though
the check for newer is removed at this level, it still exists at higher
common level, where by default only newer version will be processed.
The option to override version check, will be added as part of this patch
series.
Other errors will be handled as required at this level.
Keep all the required code at low level that checks for signature and CPU compatibility

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
[v3]
1- Update intel code to return errors in case of invalid microcode only.
2- Update code comments.
3- Update commit message and its description

[v2]
Update message description to better describe the changes
 xen/arch/x86/cpu/microcode/amd.c   |  7 +++----
 xen/arch/x86/cpu/microcode/intel.c | 10 ++++------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 17e68697d5bf..316469ec06e4 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -384,11 +384,10 @@ static struct microcode_patch *cf_check cpu_request_microcode(
             }
 
             /*
-             * If the new ucode covers current CPU, compare ucodes and store the
-             * one with higher revision.
+             * If the microcode covers current CPU, then store its
+             * revision.
              */
-            if ( (microcode_fits(mc->patch) != MIS_UCODE) &&
-                 (!saved || (compare_header(mc->patch, saved) == NEW_UCODE)) )
+            if ( (microcode_fits(mc->patch) != MIS_UCODE) && !saved )
             {
                 saved = mc->patch;
                 saved_size = mc->len;
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 96f34b336b21..de9115974d08 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -294,8 +294,7 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
 
     result = microcode_update_match(patch);
 
-    if ( result != NEW_UCODE &&
-         !(opt_ucode_allow_same && result == SAME_UCODE) )
+    if ( result == MIS_UCODE )
         return -EINVAL;
 
     wbinvd();
@@ -355,11 +354,10 @@ static struct microcode_patch *cf_check cpu_request_microcode(
             break;
 
         /*
-         * If the new update covers current CPU, compare updates and store the
-         * one with higher revision.
+         * If the microcode covers current CPU, then store its
+         * revision.
          */
-        if ( (microcode_update_match(mc) != MIS_UCODE) &&
-             (!saved || compare_revisions(saved->rev, mc->rev) == NEW_UCODE) )
+        if ( (microcode_update_match(mc) != MIS_UCODE) && !saved )
             saved = mc;
 
         buf  += blob_size;
-- 
2.42.0


