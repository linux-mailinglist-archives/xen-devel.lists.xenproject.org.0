Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA614BB85B5
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136891.1473334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oeq-0005UG-Pz; Fri, 03 Oct 2025 22:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136891.1473334; Fri, 03 Oct 2025 22:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oeq-0005RU-LX; Fri, 03 Oct 2025 22:53:48 +0000
Received: by outflank-mailman (input) for mailman id 1136891;
 Fri, 03 Oct 2025 22:53:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4oep-0004mF-25
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:53:47 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d16cfd3e-a0ab-11f0-9d14-b5c5bf9af7f9;
 Sat, 04 Oct 2025 00:53:46 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b9edf4cf6cso2056524f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:53:46 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:53:44 -0700 (PDT)
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
X-Inumbo-ID: d16cfd3e-a0ab-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532025; x=1760136825; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Pv2xMxR41VxFY2jjI0FggJ6hAHY/W901d8o7CJkHPM=;
        b=S+vL3o6P2mfIuJIHQDmjaFAk4Ehxr2cXYxAj8EDYbre4S/1gc/hKm7QwPD/s3bIqR1
         ZUmgsHMyVsbxmHoYk+zWB5mu/g1HTvTk1oMSE/duvNR/El0Qcu6XXS15y/rncw67yo6q
         Xn+tm/vzimH/6/gNoJRc4CeEfBHjahGepp+Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532025; x=1760136825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Pv2xMxR41VxFY2jjI0FggJ6hAHY/W901d8o7CJkHPM=;
        b=ttI6gCbhD5VhgODvmsSJMABuVvVesYZgYmIdgrpfMDi/y+6z9o2SdwTGgWGSrX/9av
         xH9GiW99+dUgp7CoLTgGO6L/dEk6gNgxnsYY8fBK9lvcVxEuOfuG/xaS6CQNi1d6JZ23
         JHt7A1JgCmREgeJyQitjbGQmX43iiCxkE6v+F38zadO10C4gqOMaRyQA2ZGDa2AX4squ
         0aa4bIeTkVBDuWhu4ul+l1/DxvQc0x1zGAxYe0KrWgTMpeSAsnHZvyC4mia2gniBMAX9
         R2XpMvUxQwalx4TJiCgRalRk+Z7q+mJWCm/L0t7Nb0SuJ3v3JY6c8Wovub6oBZQTebXY
         E5Tg==
X-Gm-Message-State: AOJu0YyaSf1+oVfU7hgpIkoHiCGZWoVX/ffASr9zUJ1IgphCxP8sJM00
	EAf5zNAJP3r3SjDFL/J0knWddN1OYSWZDpzBG1NRe9lc3spboRDsdzH+mFrfohY32kEksfi7ALi
	nVvmaLbhsHg==
X-Gm-Gg: ASbGnct1f0xT7badzdMF942X9NztmnedFD7Ku7svvNkeUVdR6rJ2LJk+6YmdMTC/Skd
	EM3vBtjQ4W0vo8wEZAIckeI5JfVJdIbtjKFmDF2JYpcHiO8aweu9fckocEaiLZSMV/tvwoPmTc4
	+hKSVT6pKpbuFMFs5JrFT8LKHWRxO2ePx1ZACD4YGTuxvdM4AxgLWx4mjOg9w8ZI3I8qXB8bCtn
	dE6cWrue655vUJ4VcowDHVp+0urBkTH4vrQ5Ik9zqwx9ruQY03sQRKulNRRdPWSYtzZO67916ZI
	o1xTVOxG/JX2owK6tt7etHX4sRCc55jptSOUmcciOvwlaVhRfibomOgJkELGGH0Judfek+cjsLN
	Q5Y5iWPWmFUpYk1whJcynnsBSG+J7SYjIFZBVDE4+XyJOSyVdNqTdEzP/ZuD5zQH+RP1K6awhk0
	QoCupj2r0SzZo1ydgcqaQv
X-Google-Smtp-Source: AGHT+IHmjQVumCk6Whj6vqjAP3hvEHUj0drvtnLE/SMJA6CQN6xZwyyyvA2qtGfDFS3KzjUtWUHflw==
X-Received: by 2002:a5d:584d:0:b0:405:1925:4972 with SMTP id ffacd0b85a97d-4256713efb2mr2591682f8f.1.1759532025509;
        Fri, 03 Oct 2025 15:53:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 04/22] x86/fsgsbase: Update fs/gs helpers to use wrmsrns()
Date: Fri,  3 Oct 2025 23:53:16 +0100
Message-Id: <20251003225334.2123667-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
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
index 19fd86ce88d2..8089ff929bf7 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1851,9 +1851,9 @@ static void load_segments(struct vcpu *n)
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
 
@@ -1978,8 +1978,8 @@ static void save_segments(struct vcpu *v)
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
index e2b5077654ef..01bc67460aae 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2737,8 +2737,8 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
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
index 557703842691..24862a6bfea7 100644
--- a/xen/arch/x86/include/asm/fsgsbase.h
+++ b/xen/arch/x86/include/asm/fsgsbase.h
@@ -63,38 +63,26 @@ static inline void __wrgs_shadow(unsigned long base)
 
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
         return __rdgs_shadow();
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
         __wrgs_shadow(base);
     else
-        wrmsrl(MSR_SHADOW_GS_BASE, base);
+        wrmsrns(MSR_SHADOW_GS_BASE, base);
 }
 
 #endif /* X86_FSGSBASE_H */
-- 
2.39.5


