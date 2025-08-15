Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5908FB28745
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:41:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083901.1443449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1F5-0000Iv-LS; Fri, 15 Aug 2025 20:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083901.1443449; Fri, 15 Aug 2025 20:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1F5-0008OY-9i; Fri, 15 Aug 2025 20:41:39 +0000
Received: by outflank-mailman (input) for mailman id 1083901;
 Fri, 15 Aug 2025 20:41:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1un1F0-0005Rl-LW
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:41:34 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a91e778-7a18-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 22:41:33 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b9edf36838so1495100f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 13:41:33 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb5d089e07sm3153924f8f.0.2025.08.15.13.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 13:41:31 -0700 (PDT)
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
X-Inumbo-ID: 3a91e778-7a18-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755290492; x=1755895292; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEN/2XOrsEO0ZjOf5D7MPDTnV9rmV5trFiuPwf9NEvs=;
        b=ByY/ossxbKttZFjJAwXykNldMMrSfpFBb1HVfVoCOkmZBRf4+QQPSYcMA1YquZkjdE
         6paMFf58ZNFsjXhek9+bIHJhqR+WiBnGVw1HF+xhnpnvcTqSNFux1DcQYmEj2BX2ApAD
         AlCPiZEy1pOg3ESdd4UczP57PVQRIwh00PhoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755290492; x=1755895292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEN/2XOrsEO0ZjOf5D7MPDTnV9rmV5trFiuPwf9NEvs=;
        b=F6vPsba4MkbYqV2oZtPPoS6yoTl05kdEZd6B0DPYUXaztaghsn0VN/Tkmfn6BDr3up
         zN9MXMgTVfmzDMJ/vHR3tgqNFs17eqnSTWHUVaBipBtq5yfBUn9YE3PVmowwxi28v/Rf
         06dpHlzSSAQV/W/ewOrPgaYrp3sBj4SCQA4R2VWGwReYJYVrwBPmVbWDS2AbPy0onwI1
         Bg81GqHSUhmR+bJ47TCY9jUoQfnr48QBgQxNkiOKlwuhbohUiss+jRBvIsqNbyePBqJZ
         M3KxpPIOIZEw0gE/o+NvbAruQqH+CknMTX3F//Usb55kQV9aqeydo06ECB5MFazYswlM
         tQzQ==
X-Gm-Message-State: AOJu0YyGF8hZW1fP0zB/7jcF8qzLm80GwUBbEEER9UeCShWrIoOhnkcg
	H6KqlxHMlfAk7N4cAzmpj0zP3Z/zDtME0POBEgr3HyWkFasI/sLuTQB6M6clJ5DBu8LZH9bmlfp
	HmXQ9
X-Gm-Gg: ASbGnctxNooR3MwFJcy17La/rXweBWCDSfaugMNOO3NQ5yyHrm+UzXKWFf/J9oQUL8t
	c0ojiR5JqzJKMbo0OjUqaP0RByy2VoAWzmQVjTgFkVtlzVvWLsly509tEj3pXHNDvvJ9dH91pA0
	LnJCZUwdKZMW1dlqP/mlXRSe1M/QThfHNTZ00CrJ3H7WlHfl72yn9q+qzdbdmpSSPnoZxMw0/84
	6c+as0XvAv4+RJivtmCh2jQdQ0R+FVZ+Kdn+kzhumb+52r2f0dYfwk83LNfCcGMqlv8fDkQBV5y
	E8cLXRzn1I0cbUW8qCpIiTsrNDGIPuXco6nuPImiKt+IbCfgwbC09GHqlQNtA0ens3KLWMM+qWI
	P/hvVYq/vwGwOXN5QYyE1P2yB5FAH5kqp5XCZQltG+MasL8+diTji1VT/HuYrL1a0UO8PIb5E8i
	4k
X-Google-Smtp-Source: AGHT+IGWo66ukoW8MvWNvEHtUQjOhfM0bkel1B+NqYn/+qbSo2BCaaKx9/VegcKFb27gkUys+KKsfA==
X-Received: by 2002:a05:6000:230b:b0:3b8:d081:3240 with SMTP id ffacd0b85a97d-3bb6636c7edmr2548031f8f.1.1755290492043;
        Fri, 15 Aug 2025 13:41:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 15/16] x86/fsgsbase: Update fs/gs helpers to use wrmsrns()
Date: Fri, 15 Aug 2025 21:41:16 +0100
Message-Id: <20250815204117.3312742-16-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... and rdmsr() while here.

Most of these accesses are in fastpaths and do not need serialising behaviour,
but the write side is serialising on all Intel hardware as well as older AMD
hardware.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c               | 10 +++++-----
 xen/arch/x86/hvm/vmx/vmx.c          |  4 ++--
 xen/arch/x86/include/asm/fsgsbase.h | 30 +++++++++--------------------
 3 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 3015aac4adbc..2a9bb87729c8 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1824,9 +1824,9 @@ static void load_segments(struct vcpu *n)
         }
         else
         {
-            wrmsrl(MSR_FS_BASE, n->arch.pv.fs_base);
-            wrmsrl(MSR_GS_BASE, gsb);
-            wrmsrl(MSR_SHADOW_GS_BASE, gss);
+            wrmsrns(MSR_FS_BASE, n->arch.pv.fs_base);
+            wrmsrns(MSR_GS_BASE, gsb);
+            wrmsrns(MSR_SHADOW_GS_BASE, gss);
         }
     }
 
@@ -1951,8 +1951,8 @@ static void save_segments(struct vcpu *v)
         }
         else
         {
-            rdmsrl(MSR_FS_BASE, fs_base);
-            rdmsrl(MSR_GS_BASE, gs_base);
+            fs_base = rdmsr(MSR_FS_BASE);
+            gs_base = rdmsr(MSR_GS_BASE);
         }
 
         v->arch.pv.fs_base = fs_base;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index f97a7746531a..9ba140c4811c 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2733,8 +2733,8 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
     case MSR_SHADOW_GS_BASE:
         if ( v != curr )
             return v->arch.hvm.vmx.shadow_gs;
-        rdmsrl(MSR_SHADOW_GS_BASE, val);
-        return val;
+        else
+            return rdmsr(MSR_SHADOW_GS_BASE);
     }
 
     /* Logic which maybe requires remote VMCS acquisition. */
diff --git a/xen/arch/x86/include/asm/fsgsbase.h b/xen/arch/x86/include/asm/fsgsbase.h
index 90d116f3bb54..7a0b623cca8f 100644
--- a/xen/arch/x86/include/asm/fsgsbase.h
+++ b/xen/arch/x86/include/asm/fsgsbase.h
@@ -63,38 +63,26 @@ static inline void __wrgskern(unsigned long base)
 
 static inline unsigned long read_fs_base(void)
 {
-    unsigned long base;
-
     if ( read_cr4() & X86_CR4_FSGSBASE )
         return __rdfsbase();
-
-    rdmsrl(MSR_FS_BASE, base);
-
-    return base;
+    else
+        return rdmsr(MSR_FS_BASE);
 }
 
 static inline unsigned long read_gs_base(void)
 {
-    unsigned long base;
-
     if ( read_cr4() & X86_CR4_FSGSBASE )
         return __rdgsbase();
-
-    rdmsrl(MSR_GS_BASE, base);
-
-    return base;
+    else
+        return rdmsr(MSR_GS_BASE);
 }
 
 static inline unsigned long read_gs_shadow(void)
 {
-    unsigned long base;
-
     if ( read_cr4() & X86_CR4_FSGSBASE )
         return __rdgskern();
-
-    rdmsrl(MSR_SHADOW_GS_BASE, base);
-
-    return base;
+    else
+        return rdmsr(MSR_SHADOW_GS_BASE);
 }
 
 static inline void write_fs_base(unsigned long base)
@@ -102,7 +90,7 @@ static inline void write_fs_base(unsigned long base)
     if ( read_cr4() & X86_CR4_FSGSBASE )
         __wrfsbase(base);
     else
-        wrmsrl(MSR_FS_BASE, base);
+        wrmsrns(MSR_FS_BASE, base);
 }
 
 static inline void write_gs_base(unsigned long base)
@@ -110,7 +98,7 @@ static inline void write_gs_base(unsigned long base)
     if ( read_cr4() & X86_CR4_FSGSBASE )
         __wrgsbase(base);
     else
-        wrmsrl(MSR_GS_BASE, base);
+        wrmsrns(MSR_GS_BASE, base);
 }
 
 static inline void write_gs_shadow(unsigned long base)
@@ -118,7 +106,7 @@ static inline void write_gs_shadow(unsigned long base)
     if ( read_cr4() & X86_CR4_FSGSBASE )
         __wrgskern(base);
     else
-        wrmsrl(MSR_SHADOW_GS_BASE, base);
+        wrmsrns(MSR_SHADOW_GS_BASE, base);
 }
 
 #endif /* X86_FSGSBASE_H */
-- 
2.39.5


