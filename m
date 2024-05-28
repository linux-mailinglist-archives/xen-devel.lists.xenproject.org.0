Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A9B8D2061
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 17:30:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731196.1136591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBymD-0001sb-Qe; Tue, 28 May 2024 15:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731196.1136591; Tue, 28 May 2024 15:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBymD-0001pK-IR; Tue, 28 May 2024 15:30:13 +0000
Received: by outflank-mailman (input) for mailman id 731196;
 Tue, 28 May 2024 15:30:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5inG=M7=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sBymC-00018F-6c
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 15:30:12 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c014c96-1d07-11ef-90a1-e314d9c70b13;
 Tue, 28 May 2024 17:30:11 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a63359aaaa6so126666066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 08:30:11 -0700 (PDT)
Received: from fhilly.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c937444sm621673366b.61.2024.05.28.08.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 08:30:10 -0700 (PDT)
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
X-Inumbo-ID: 2c014c96-1d07-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716910210; x=1717515010; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7mcoezWV0j0H2zzn7JIYS8Z2/p6a2i2l5f1Q/llZE0=;
        b=CWQ9MkMxFzYjqVq8JEzhTJ2ctT11Uq0m1Aib1E4zLZMy6d2llX6MxmHmRyOXsxM4yF
         lY2w+uV/D2G8l7SkEej/y8Dl6HdQqozFCI2M/I9dy+CPPZ6i9lVc/RcUyZ9f73ues3rJ
         QJDnisQS1Cik7CiHF8f3X3WC43NUjndyejmsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716910210; x=1717515010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7mcoezWV0j0H2zzn7JIYS8Z2/p6a2i2l5f1Q/llZE0=;
        b=N0raUnfeVDjtZtrpUEpJQ6EZv54SGUiVi+jUQqgzCEtAPdhV4ikeHea+K/4uYIWish
         7mFKkfqUzpDxcyk1/TtcMEtarX3hB8TtF2mfY187U0ULZ2Hkpg0aJ7hZA5Q2429YzMiQ
         KZdKNIY5IiYxPwGBKFOFA7gu08r2iiikPPaAdu+R7P/diJZCF7eUWe99AwmJ/QdhxA6H
         Xlo37LyLyIULJThoC93cbgThHR1hhPNSGfvZciRwtgqx3KHlGYqhKXa2yZL38VYAfHKl
         Y6mlfQ6+Z15qJ+TY2ANi/ZYJjXxVkd8+i46ua5jC+edAc21tdIqdB77BTa22IXi19URe
         yN9Q==
X-Gm-Message-State: AOJu0Yzn6/U2LcSvXk4aAir6uS5rgocu5QNViWEQJowp5WEPbwUfsfLk
	JMlCD31X5/ksYk2/aIH12u4Bf0aTlwimVWN9Z9Ml38JYqcfOjB10pXUKL+r8N81v1qvQIOrAAgI
	S2U0=
X-Google-Smtp-Source: AGHT+IG4ytefBo9qwZrlmg2vHgWyH70OIDv7RtLE8pO6Uf1I0FZqM0xsPwXkUBHRuVwjEpLdxigKzQ==
X-Received: by 2002:a17:906:a287:b0:a59:cb29:3fb3 with SMTP id a640c23a62f3a-a6265148babmr864229366b.53.1716910210477;
        Tue, 28 May 2024 08:30:10 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 4/4] x86/ucode: Utilize ucode_force and remove opt_ucode_allow_same
Date: Tue, 28 May 2024 16:29:43 +0100
Message-ID: <20240528152943.3915760-5-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240528152943.3915760-1-fouad.hilly@cloud.com>
References: <20240528152943.3915760-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass ucode_force to common micorocde checks and utilize it to allow for microcode downgrade
or reapply the same version of the microcode.
Update low level Intel and AMD to check for valid signature only. Any version checks is done
at core.c.
While adding ucode_force, opt_ucode_allow_same was removed.
Remove opt_ucode_allow_same from documentation.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
[4]
1- As opt_ucode_allow_same is not required anymore, it has been removed while introducing ucode_force.
2- Apply the changes for both AMD and Intel.
3- Remove the mention of opt_ucode_allow_same from documentation.
---
 docs/misc/xen-command-line.pandoc    | 7 +------
 xen/arch/x86/cpu/microcode/amd.c     | 7 -------
 xen/arch/x86/cpu/microcode/core.c    | 9 +++------
 xen/arch/x86/cpu/microcode/intel.c   | 4 ----
 xen/arch/x86/cpu/microcode/private.h | 2 --
 5 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1dea7431fab6..a42ce1039fed 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2648,7 +2648,7 @@ performance.
    Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
 
 ### ucode
-> `= List of [ <integer> | scan=<bool>, nmi=<bool>, allow-same=<bool> ]`
+> `= List of [ <integer> | scan=<bool>, nmi=<bool> ]`
 
     Applicability: x86
     Default: `nmi`
@@ -2680,11 +2680,6 @@ precedence over `scan`.
 stop_machine context. In NMI handler, even NMIs are blocked, which is
 considered safer. The default value is `true`.
 
-'allow-same' alters the default acceptance policy for new microcode to permit
-trying to reload the same version.  Many CPUs will actually reload microcode
-of the same version, and this allows for easy testing of the late microcode
-loading path.
-
 ### unrestricted_guest (Intel)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index f76a563c8b84..4bcc79f1ab2d 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -225,13 +225,6 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
     if ( result == MIS_UCODE )
         return -EINVAL;
 
-    /*
-     * Allow application of the same revision to pick up SMT-specific changes
-     * even if the revision of the other SMT thread is already up-to-date.
-     */
-    if ( result == OLD_UCODE )
-        return -EEXIST;
-
     if ( check_final_patch_levels(sig) )
     {
         printk(XENLOG_ERR
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 8a9e744489b9..fc8ad8cfdd76 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -100,8 +100,6 @@ static bool __initdata ucode_scan;
 /* By default, ucode loading is done in NMI handler */
 static bool ucode_in_nmi = true;
 
-bool __read_mostly opt_ucode_allow_same;
-
 /* Protected by microcode_mutex */
 static struct microcode_patch *microcode_cache;
 
@@ -128,8 +126,6 @@ static int __init cf_check parse_ucode(const char *s)
 
         if ( (val = parse_boolean("nmi", s, ss)) >= 0 )
             ucode_in_nmi = val;
-        else if ( (val = parse_boolean("allow-same", s, ss)) >= 0 )
-            opt_ucode_allow_same = val;
         else if ( !ucode_mod_forced ) /* Not forced by EFI */
         {
             if ( (val = parse_boolean("scan", s, ss)) >= 0 )
@@ -583,6 +579,7 @@ static long cf_check microcode_update_helper(void *data)
     struct ucode_buf *buffer = data;
     unsigned int cpu, updated;
     struct microcode_patch *patch;
+    bool ucode_force = buffer->flags == XENPF_UCODE_FORCE;
 
     /* cpu_online_map must not change during update */
     if ( !get_cpu_maps() )
@@ -636,12 +633,12 @@ static long cf_check microcode_update_helper(void *data)
                                   microcode_cache);
 
         if ( result != NEW_UCODE &&
-             !(opt_ucode_allow_same && result == SAME_UCODE) )
+             (!ucode_force || (result & ~SAME_UCODE)) )
         {
             spin_unlock(&microcode_mutex);
             printk(XENLOG_WARNING
                    "microcode: couldn't find any newer%s revision in the provided blob!\n",
-                   opt_ucode_allow_same ? " (or the same)" : "");
+                   ucode_force? " (or a valid)" : "");
             microcode_free_patch(patch);
             ret = -EEXIST;
 
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index f505aa1b7888..5e1b528ffe05 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -297,10 +297,6 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
     if ( result == MIS_UCODE )
         return -EINVAL;
 
-    if ( result == OLD_UCODE ||
-         (result == SAME_UCODE && !opt_ucode_allow_same) )
-        return -EEXIST;
-
     wbinvd();
 
     wrmsrl(MSR_IA32_UCODE_WRITE, (unsigned long)patch->data);
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index da556fe5060a..aea51678a662 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -3,8 +3,6 @@
 
 #include <asm/microcode.h>
 
-extern bool opt_ucode_allow_same;
-
 enum microcode_match_result {
     OLD_UCODE, /* signature matched, but revision id is older */
     SAME_UCODE, /* signature matched, but revision id is the same */
-- 
2.42.0


