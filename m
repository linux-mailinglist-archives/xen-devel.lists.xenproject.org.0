Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A6B782DA2
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 17:57:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587667.919044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY7HL-000891-Jx; Mon, 21 Aug 2023 15:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587667.919044; Mon, 21 Aug 2023 15:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY7HL-00086p-G3; Mon, 21 Aug 2023 15:57:19 +0000
Received: by outflank-mailman (input) for mailman id 587667;
 Mon, 21 Aug 2023 15:57:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mH9=EG=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qY7HK-0007V2-O6
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 15:57:18 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 665de17f-403b-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 17:57:16 +0200 (CEST)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1bf3a2f44ffso24607645ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Aug 2023 08:57:16 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 j10-20020a170902da8a00b001a5fccab02dsm7208314plx.177.2023.08.21.08.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Aug 2023 08:57:15 -0700 (PDT)
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
X-Inumbo-ID: 665de17f-403b-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692633435; x=1693238235;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=koUXgNo33NkQg7mV/s+CjTkEjQnqF6941wnkN2hmX0k=;
        b=IYVEF72TlmOtSXZ8/QHVjcuwh+UuhF8PLcwOopLQlmKmuqDsTnNUidItKCWBYYyqX8
         tIxOyYivlstDVUe1reaaWAJ059BQeT+dVWVgf70sZhwYbpCuVhvEmvwsjDLZrsXV+wcf
         i55eQ8d4a2osp85mwZsw7V+Gaap/1jcr0xlHYiTjKaMBSdG2kP4hcZNZkmfVlBRIBL46
         g9rNYgBGrhsg5b4h1gRI5n2a72tSxCQulU2fAXFDFo72RzV0jDW2pujX4l0JRHiqTh/H
         979sKKdKVN+J96Nk+ExZMueRM3P/9garyxjrjreTLUgvwqNfVdwj6eolNRvqgb2iOCcc
         Pkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692633435; x=1693238235;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=koUXgNo33NkQg7mV/s+CjTkEjQnqF6941wnkN2hmX0k=;
        b=fa0zSnyOkxf4P8wsv56stPH/Jy2ty8kj/YkjLiIA/IczSGRFh6YDm0QF/UacIo0KKm
         eW2Yqyl9Y3LTRKZpDrd7Ncx7YZIzM2XE9AbvOrf6FMXdDbPDXZeVDcnZ1lZNTxQskO/u
         aUaAQfNdgWfGpW3PNVSJU6PMlpfmsFm51w3w4bjDbbS3fSRTeqOzkOl4JK1SgUP2ibII
         T2xpdcOOFaW/4WsCUPqHkNjom8kWztRrdimn/bYR97wuQwHMnVKbevatBEkRjuSUIhjQ
         Pu7CGIjXJnsdBkvx3w1HL171GDl8NZfD+zPxmrwm8AlfX+2FRr8qFwKp1qyX28UL3vLr
         cy4A==
X-Gm-Message-State: AOJu0YzKvAEyQKUiXIAAIw9Slo23DPWDUZmgiUEOj2XTHS7425/lLYOV
	1WbGSgcrishSv92f49nXFFlwcP58KrDQJQ==
X-Google-Smtp-Source: AGHT+IEAQP3ubFa0rv1Xj61latk7fdjmjugV/wzlkma7nTyCWeQFbKZrYjbeVHqauzgXtCdwLVubHA==
X-Received: by 2002:a17:903:1111:b0:1b9:de75:d5bb with SMTP id n17-20020a170903111100b001b9de75d5bbmr10714294plh.7.1692633435482;
        Mon, 21 Aug 2023 08:57:15 -0700 (PDT)
Message-ID: <2ba03e50-421c-9163-355c-d7c612f2f711@gmail.com>
Date: Tue, 22 Aug 2023 00:57:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH 4/5] x86: Fix merging of new status bits into %dr6
To: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <5fa229fc-9514-abc6-5e72-2447a2c637d0@gmail.com>
Content-Language: en-US
In-Reply-To: <5fa229fc-9514-abc6-5e72-2447a2c637d0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

The current logic used to update %dr6 when injecting #DB is buggy.  The
architectural behaviour is to overwrite B{0..3} (rather than accumulate) and
accumulate all other bits.

Introduce a new merge_dr6() helper, which also takes care of handing RTM
correctly.

Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/hvm/svm/svm.c           |  3 ++-
 xen/arch/x86/hvm/vmx/vmx.c           |  3 ++-
 xen/arch/x86/include/asm/debugreg.h  | 30 +++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/x86-defns.h | 10 ----------
 xen/arch/x86/pv/traps.c              |  3 ++-
 5 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index bd3adde0ec..7a5652f3df 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1338,7 +1338,8 @@ static void cf_check svm_inject_event(const struct x86_event *event)
          * Item 2 is done by hardware when injecting a #DB exception.
          */
         __restore_debug_registers(vmcb, curr);
-        vmcb_set_dr6(vmcb, vmcb_get_dr6(vmcb) | _event.pending_dbg);
+        vmcb_set_dr6(vmcb, merge_dr6(vmcb_get_dr6(vmcb), _event.pending_dbg,
+                                     curr->domain->arch.cpuid->feat.rtm));
 
         /* fall through */
     case X86_EXC_BP:
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 65166348f1..1fd902ed74 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2031,7 +2031,8 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
          * All actions are left up to the hypervisor to perform.
          */
         __restore_debug_registers(curr);
-        write_debugreg(6, read_debugreg(6) | event->pending_dbg);
+        write_debugreg(6, merge_dr6(read_debugreg(6), event->pending_dbg,
+                                    curr->domain->arch.cpuid->feat.rtm));
 
         if ( !nestedhvm_vcpu_in_guestmode(curr) ||
              !nvmx_intercepts_exception(curr, X86_EXC_DB, _event.error_code) )
diff --git a/xen/arch/x86/include/asm/debugreg.h b/xen/arch/x86/include/asm/debugreg.h
index a1df74c02e..fd32846397 100644
--- a/xen/arch/x86/include/asm/debugreg.h
+++ b/xen/arch/x86/include/asm/debugreg.h
@@ -23,6 +23,14 @@
 #define X86_DR6_BT              (1u << 15)  /* Task switch             */
 #define X86_DR6_RTM             (1u << 16)  /* #DB/#BP in RTM region   */
 
+#define X86_DR6_BP_MASK                                 \
+    (X86_DR6_B0 | X86_DR6_B1 | X86_DR6_B2 | X86_DR6_B3)
+
+#define X86_DR6_KNOWN_MASK                                              \
+    (X86_DR6_BP_MASK | X86_DR6_BD | X86_DR6_BS | X86_DR6_BT | X86_DR6_RTM)
+
+#define X86_DR6_DEFAULT         0xffff0ff0  /* Default %dr6 value. */
+
 #define DR_TRAP0        (0x1)           /* db0 */
 #define DR_TRAP1        (0x2)           /* db1 */
 #define DR_TRAP2        (0x4)           /* db2 */
@@ -30,7 +38,6 @@
 #define DR_STEP         (0x4000)        /* single-step */
 #define DR_SWITCH       (0x8000)        /* task switch */
 #define DR_NOT_RTM      (0x10000)       /* clear: #BP inside RTM region */
-#define DR_STATUS_RESERVED_ONE  0xffff0ff0UL /* Reserved, read as one */
 
 /* Now define a bunch of things for manipulating the control register.
    The top two bytes of the control register consist of 4 fields of 4
@@ -74,6 +81,8 @@
 #define DR_RTM_ENABLE            (0x00000800UL) /* RTM debugging enable */
 #define DR_GENERAL_DETECT        (0x00002000UL) /* General detect enable */
 
+#define X86_DR7_DEFAULT         0x00000400  /* Default %dr7 value. */
+
 #define write_debugreg(reg, val) do {                       \
     unsigned long __val = val;                              \
     asm volatile ( "mov %0,%%db" #reg : : "r" (__val) );    \
@@ -102,6 +111,25 @@ static inline unsigned long adjust_dr6_rsvd(unsigned long dr6, bool rtm)
     return dr6;
 }
 
+static inline unsigned long merge_dr6(unsigned long dr6, unsigned long new,
+                                      bool rtm)
+{
+    /* Flip dr6 to have positive polarity. */
+    dr6 ^= X86_DR6_DEFAULT;
+
+    /* Sanity check that only known values are passed in. */
+    ASSERT(!(dr6 & ~X86_DR6_KNOWN_MASK));
+    ASSERT(!(new & ~X86_DR6_KNOWN_MASK));
+
+    /* Breakpoints 0-3 overridden.  BD, BS, BT and RTM accumulate. */
+    dr6 = (dr6 & ~X86_DR6_BP_MASK) | new;
+
+    /* Flip dr6 back to having default polarity. */
+    dr6 ^= X86_DR6_DEFAULT;
+
+    return adjust_dr6_rsvd(dr6, rtm);
+}
+
 static inline unsigned long adjust_dr7_rsvd(unsigned long dr7, bool rtm)
 {
     /*
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index e350227e57..7fbc74850a 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -100,16 +100,6 @@
 #define X86_XCR0_LWP_POS          62
 #define X86_XCR0_LWP              (1ULL << X86_XCR0_LWP_POS)
 
-/*
- * Debug status flags in DR6.
- */
-#define X86_DR6_DEFAULT         0xffff0ff0  /* Default %dr6 value. */
-
-/*
- * Debug control flags in DR7.
- */
-#define X86_DR7_DEFAULT         0x00000400  /* Default %dr7 value. */
-
 /*
  * Invalidation types for the INVPCID instruction.
  */
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 4f5641a47c..65b41e6115 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -66,7 +66,8 @@ void pv_inject_event(const struct x86_event *event)
         break;
 
     case X86_EXC_DB:
-        curr->arch.dr6 |= event->pending_dbg;
+        curr->arch.dr6 = merge_dr6(curr->arch.dr6, event->pending_dbg,
+                                   curr->domain->arch.cpuid->feat.rtm);
         /* Fallthrough */
 
     default:
-- 
2.41.0


