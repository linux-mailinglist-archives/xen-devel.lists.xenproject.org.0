Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCFE899C7B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 14:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701226.1095504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsiPx-0007T5-HR; Fri, 05 Apr 2024 12:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701226.1095504; Fri, 05 Apr 2024 12:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsiPx-0007Qx-DW; Fri, 05 Apr 2024 12:11:37 +0000
Received: by outflank-mailman (input) for mailman id 701226;
 Fri, 05 Apr 2024 12:11:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Im47=LK=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rsiPv-0007Qe-UW
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 12:11:35 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4663203-f345-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 14:11:34 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56e2393b073so2238680a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 05:11:33 -0700 (PDT)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j13-20020a50ed0d000000b0056c4372c161sm729425eds.55.2024.04.05.05.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 05:11:31 -0700 (PDT)
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
X-Inumbo-ID: a4663203-f345-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712319091; x=1712923891; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1i+lAGzw5jmQvcR+ZSadLxyO+lAXMTpWfVS36kD2fk=;
        b=flGXaGXjIU9FBWcrhayHcXfJQTNzdOiO2u8iwsprPV3dVcJ/Z59xTAkeRij2S6xiSQ
         TYCj+fam+gi9YMaiTappzOY7/PYBxe/EGd5u2jvOlBhFA/D8gibYas8jpCNmvvfYvW6O
         rxJoMVSnFmCmKDkz58bgTIy+k+ZzevQnNhARU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712319091; x=1712923891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1i+lAGzw5jmQvcR+ZSadLxyO+lAXMTpWfVS36kD2fk=;
        b=cNHTWT1IJQ5VrpbgRnhzWJKV8fAc+6MqwpRUdLWWm5vfSEMeKaieFIyNebom+h5hp2
         fi6BP50ou/9Nt2uO2lO0RWE9vYeby6hBccVpKhFW/PFMqePSDss50ZKjWS963MOx+Wtz
         aKT+sVj/dxiCKwq7UCukXgqzCZZsAw9KvCerBRYFTc78+Id6C50zJ9kD3ZXIBgMjCO5+
         Ho0ijKQxGiMFsg8PWk39+d08dOPW3zKolJK0wg2dGqisweNWynwbJQumaejpLFmrI2t+
         2FpiRzRz049tovqozWU0+jxJRFZIBbvuDDw4DmO3BFdg8Jd2gtpj/WLMX/TEHaeEzaiG
         zZaQ==
X-Gm-Message-State: AOJu0YyC3g2R0nisESFm/GSfu9xjGFuIUZOqATrZiBOvmcCDp4/WvD71
	jXE/wO3GGxptVuTHHSqz0hXhiR+TuJQwnzPKHXaoXMqxGIaxWJjf1fgeSx8SrNZvIc6ZyqtfnwO
	a
X-Google-Smtp-Source: AGHT+IEzZ7vs0wJQzSSeiWHlGqjLSoHJCD9DCOM78+5BxbEVS7rgKCIfI0T86TgsWL9qmrq2hvuIjA==
X-Received: by 2002:a50:8753:0:b0:56e:2dfb:da7b with SMTP id 19-20020a508753000000b0056e2dfbda7bmr1390248edv.0.1712319091525;
        Fri, 05 Apr 2024 05:11:31 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/5] x86: Remove x86 low level version check of microcode
Date: Fri,  5 Apr 2024 13:11:24 +0100
Message-ID: <20240405121128.260493-2-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240405121128.260493-1-fouad.hilly@cloud.com>
References: <20240405121128.260493-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove microcode version check at Intel and AMD Level.
Microcode version check will be at higher and common level.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
 xen/arch/x86/cpu/microcode/amd.c   |  8 ++------
 xen/arch/x86/cpu/microcode/intel.c | 11 +++--------
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 75fc84e445ce..4f805f662701 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -383,12 +383,8 @@ static struct microcode_patch *cf_check cpu_request_microcode(
                 goto skip;
             }
 
-            /*
-             * If the new ucode covers current CPU, compare ucodes and store the
-             * one with higher revision.
-             */
-            if ( (microcode_fits(mc->patch) != MIS_UCODE) &&
-                 (!saved || (compare_header(mc->patch, saved) == NEW_UCODE)) )
+            /* If the provided ucode covers current CPU, then store its revision. */
+            if ( (microcode_fits(mc->patch) != MIS_UCODE) && !saved )
             {
                 saved = mc->patch;
                 saved_size = mc->len;
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 060c529a6e5d..e65c02a57987 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -294,8 +294,7 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
 
     result = microcode_update_match(patch);
 
-    if ( result != NEW_UCODE &&
-         !(opt_ucode_allow_same && result == SAME_UCODE) )
+    if ( result != NEW_UCODE && result != SAME_UCODE )
         return -EINVAL;
 
     wbinvd();
@@ -354,12 +353,8 @@ static struct microcode_patch *cf_check cpu_request_microcode(
         if ( error )
             break;
 
-        /*
-         * If the new update covers current CPU, compare updates and store the
-         * one with higher revision.
-         */
-        if ( (microcode_update_match(mc) != MIS_UCODE) &&
-             (!saved || compare_revisions(saved->rev, mc->rev) == NEW_UCODE) )
+        /* If the provided ucode covers current CPU, then store its revision. */
+        if ( (microcode_update_match(mc) != MIS_UCODE) && !saved )
             saved = mc;
 
         buf  += blob_size;
-- 
2.42.0


