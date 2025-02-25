Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C96A45021
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 23:31:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895996.1304677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3SM-0007z9-Eb; Tue, 25 Feb 2025 22:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895996.1304677; Tue, 25 Feb 2025 22:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3SM-0007xV-Aj; Tue, 25 Feb 2025 22:31:14 +0000
Received: by outflank-mailman (input) for mailman id 895996;
 Tue, 25 Feb 2025 22:31:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqP+=VQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tn3SK-0007iP-7h
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 22:31:12 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37065794-f3c8-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 23:31:11 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-439950a45daso38857915e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 14:31:11 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba532d33sm1561315e9.15.2025.02.25.14.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 14:31:10 -0800 (PST)
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
X-Inumbo-ID: 37065794-f3c8-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740522671; x=1741127471; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Fkj7PIxDfVF3eAOzL41OOsZ3g02DzrICaIejNCr/tw=;
        b=e15GyjBvsKRMuO1hzJsnbQlVc369IzJJEOp7Aal8lTB7u5lbFFIdbyuvjUo4dsvUbT
         CbnFKgobsUIO0JGjIZe6EWP/tQTFXfabPmb03T97Dgu0CbQEECVYG/BNdlIYTS2NvuvY
         J2al9DHCmNCv8Wh75XAl7DwYrBZ4vyBTtgOwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522671; x=1741127471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Fkj7PIxDfVF3eAOzL41OOsZ3g02DzrICaIejNCr/tw=;
        b=QZlqFbYw7bAY86EGMgKg5i1Hee279owY7STsdDP0txM6ICNPdGWTq2AAqngPfdG+4Z
         ePnUwj/KaSaCHFAriQbnJxvYdBsnzDHeL7kq/cwUeVkwPUes7qnCMPVHOxuOCJ5qXads
         geO6iUZzOLdUBlTHx9m4PCdxoEPei2oz1U/DiwavL85MRGLsyRzFB4r4lT3G09X9E2cy
         LjfWacqMPaxYx0zpF+/Y64SvTD3yS8cJC9Z7310JBp64xA2ZmxGXmXPcGr91BCs+MEpN
         fsmUgid6rm75cbzwPtSp9RCkT0cYtAURNO8+zsbxy76UFLg6oiC6XVYXkKYUYoZ3yZiv
         sLYw==
X-Gm-Message-State: AOJu0Yz8uR5VuWAvjhghz1Bpk2IUpG0X4zwWOm5ONnmdobcsThSaXmTH
	M971vZM5xkr2C1cRqOdi/Lk2b6P6peJsNHj51HrJ37QCqlYXFaIzoeoIXVOq5mbBHaX9EkoBZlQ
	4
X-Gm-Gg: ASbGncvE4W3Ab0EN/nadZbz1quDSVhwjDMW4fXDTcJWbs2ZuJV4qApDyg25LXsVttB1
	nT2zRaz3pyI3HMCc61v3fgGlexDyfOdzxdekgM5sue27J4i7wAoMVHRYUcPCup+AOAis1fK6dEG
	2+55aqMfMV98XKkiBrfKfcsnMyjS4X1VTackD6zmIlEgT7afhYCPvbhxupOXdUSHYthKbhSZV5f
	DyaJsH2p8aNt191x/UuRI2Kv66XbbkY5ud2e0uziRRRcNANpmXf5knNmhh9Ex6yinn3fCP3Rvxa
	NKe07G0G9wAzoAjFCbnJH5BB1DCZy0HPZU9/t28Haz90njqaM1bvwp9yL7neb4+S+rkUSxIMTV5
	DU1tinA==
X-Google-Smtp-Source: AGHT+IGgzgKhjyv8Qm2BP9+QaUI5xtZwUepEZX75ASg0Q9pPgwuh497t4wYNo2ahmQ8s/UzZOrm7XA==
X-Received: by 2002:a5d:4acb:0:b0:38f:3a89:fdb1 with SMTP id ffacd0b85a97d-390cc60d30emr2548760f8f.30.1740522670644;
        Tue, 25 Feb 2025 14:31:10 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/2] x86/ucode: Drop the ucode=nmi option
Date: Tue, 25 Feb 2025 22:29:05 +0000
Message-Id: <20250225222905.1182374-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250225222905.1182374-1-andrew.cooper3@citrix.com>
References: <20250225222905.1182374-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This option is active by default, and despite what the documentation suggests
about choosing ucode=no-nmi, it only controls whether the primary threads move
into NMI context.

Sibling threads unconditionally move into NMI context, which is confirmed by
an in-code comment.

Not discussed is the fact that the BSP never enters NMI context, which works
only by luck (AMD CPUs, where we reload on sibling threads too, has working
in-core rendezvous and doesn't require NMI cover on the primary thread for
safety).  This does want addressing, but requires more untangling first.

Overall, `ucode=no-nmi` is a misleading and pretty useless option.  Drop it,
and simplify the two users.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Despite the reasonably large diff in primary_thread_fn(), it's mostly just
unindenting the block, and dropping the final call to primary_thread_work()
which is made dead by this change.
---
 docs/misc/xen-command-line.pandoc |  8 ++-----
 xen/arch/x86/cpu/microcode/core.c | 38 +++++++++++--------------------
 2 files changed, 15 insertions(+), 31 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 47674025249a..9702c36b8c39 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2721,10 +2721,10 @@ performance.
    Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
 
 ### ucode
-> `= List of [ <integer>, scan=<bool>, nmi=<bool> ]`
+> `= List of [ <integer>, scan=<bool ]`
 
     Applicability: x86
-    Default: `scan` is selectable via Kconfig, `nmi=true`
+    Default: `scan` is selectable via Kconfig
 
 Controls for CPU microcode loading.
 
@@ -2758,10 +2758,6 @@ When booting xen.efi natively, the concept of multiboot modules doesn't exist.
 Instead, in the [EFI configuration file](efi.html), `ucode=<filename>` can be
 used to identify a file as a raw container (option 1 above).
 
-'nmi' determines late loading is performed in NMI handler or just in
-stop_machine context. In NMI handler, even NMIs are blocked, which is
-considered safer. The default value is `true`.
-
 ### unrestricted_guest (Intel)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index c8e14ed9b10c..4898920b9c52 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -82,9 +82,6 @@ struct patch_with_flags {
     const struct microcode_patch *patch;
 };
 
-/* By default, ucode loading is done in NMI handler */
-static bool ucode_in_nmi = true;
-
 /* Protected by microcode_mutex */
 static struct microcode_patch *microcode_cache;
 
@@ -123,9 +120,7 @@ static int __init cf_check parse_ucode(const char *s)
         if ( !ss )
             ss = strchr(s, '\0');
 
-        if ( (val = parse_boolean("nmi", s, ss)) >= 0 )
-            ucode_in_nmi = val;
-        else if ( (val = parse_boolean("scan", s, ss)) >= 0 )
+        if ( (val = parse_boolean("scan", s, ss)) >= 0 )
         {
             if ( ucode_mod_forced )
                 printk(XENLOG_WARNING
@@ -297,12 +292,10 @@ static int cf_check microcode_nmi_callback(
         return 0;
 
     /*
-     * Primary threads load ucode in NMI handler on if ucode_in_nmi is true.
-     * Secondary threads are expected to stay in NMI handler regardless of
-     * ucode_in_nmi.
+     * The BSP doesn't enter NMI context for microcode loading, as it's the
+     * entity organising the rendezvous.
      */
-    if ( cpu == cpumask_first(&cpu_online_map) ||
-         (!ucode_in_nmi && primary_cpu) )
+    if ( cpu == cpumask_first(&cpu_online_map) )
         return 0;
 
     if ( primary_cpu )
@@ -343,22 +336,17 @@ static int primary_thread_fn(const struct microcode_patch *patch,
     if ( !wait_for_state(LOADING_CALLIN) )
         return -EBUSY;
 
-    if ( ucode_in_nmi )
-    {
-        self_nmi();
-
-        /*
-         * Wait for ucode loading is done in case that the NMI does not arrive
-         * synchronously, which may lead to a not-yet-updated error is returned
-         * below.
-         */
-        if ( unlikely(!wait_for_state(LOADING_EXIT)) )
-            ASSERT_UNREACHABLE();
+    self_nmi();
 
-        return this_cpu(loading_err);
-    }
+    /*
+     * Wait for ucode loading is done in case that the NMI does not arrive
+     * synchronously, which may lead to a not-yet-updated error is returned
+     * below.
+     */
+    if ( unlikely(!wait_for_state(LOADING_EXIT)) )
+        ASSERT_UNREACHABLE();
 
-    return primary_thread_work(patch, flags);
+    return this_cpu(loading_err);
 }
 
 static int control_thread_fn(const struct microcode_patch *patch,
-- 
2.39.5


