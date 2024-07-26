Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501A293D63C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765593.1176270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXN1f-0000XG-Gc; Fri, 26 Jul 2024 15:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765593.1176270; Fri, 26 Jul 2024 15:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXN1f-0000Vm-DG; Fri, 26 Jul 2024 15:38:35 +0000
Received: by outflank-mailman (input) for mailman id 765593;
 Fri, 26 Jul 2024 15:38:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMva-00084T-CI
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:32:18 +0000
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [2607:f8b0:4864:20::82e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ce06ce3-4b64-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 17:32:16 +0200 (CEST)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-44fe11dedb3so3920871cf.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:32:16 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe817b704sm14134541cf.49.2024.07.26.08.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:32:14 -0700 (PDT)
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
X-Inumbo-ID: 3ce06ce3-4b64-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007935; x=1722612735; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujxzWIZCxxgOdDMzOO3f1hDHb8R0sblL5/6JViBiwPw=;
        b=uFw+QpwwhbidcC77uubDdoH10eC9LJ8xXKwzJft22lAaUcosgJsLS7RCHZUjkpVGAS
         iHxdSEKLPSAVfDq255QRkfR+413yKhucswkHIcSknLgWYBGE4MmbR+de0Bt8hlzFGdiX
         ZzeB5uikKdL/4lSZILCpvqB1FENyTjSOctGUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007935; x=1722612735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujxzWIZCxxgOdDMzOO3f1hDHb8R0sblL5/6JViBiwPw=;
        b=h2KjDLnxAGZW+OlhgD9z0thvgimw98plLnZsK8n6WhBNykZpgFPE0yIgClpwHRXICn
         l628cNbawypjDA8dH4Pyx/Q0gWifQ2Pg+5R7tnpPn4MexWDR258kndkiajLvqiL8qnqY
         ciEqWudbTUJU3ciM2Jdd0CM/ni8HxsP29/tdrXUPqfV+wVWGfERqer4g6C+O3FLGkPt5
         Grrwy7dZxWBDVdogq6mTW2zuXwU7tjqJTopHpR3TUnicOCGAR3UXF/O/BCv24Guxn5Uv
         OEmXsWMmomjZspvFX0kS6jgTc094fdkWYzEQQ/BRvJjtUbEAEnxqmCzDks1OcUTOWaZi
         HBiA==
X-Gm-Message-State: AOJu0YyJ85eMMOJGVyTymBUXyuCB0NWg8/g4RTL+8PlHl0TuF6AIKWmI
	7KVAGV9N8L+mGNfiSJFAQbiwZapPXzo0JX10Y0GsAPj7PqvmpcQrMdXE/UzPkXNjieVbstlAyyJ
	T
X-Google-Smtp-Source: AGHT+IEN0Eq8CDQ5Cb603qPnp/JwUedIQCyO4aYdsNBLQFTLNZuf7mCOphfab1I5CFzTJfvm3Gvhew==
X-Received: by 2002:a05:622a:1309:b0:447:df6b:b8c5 with SMTP id d75a77b69052e-45004db298amr1640751cf.33.1722007935174;
        Fri, 26 Jul 2024 08:32:15 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 22/22] x86/mm: zero stack on stack switch or reset
Date: Fri, 26 Jul 2024 17:22:06 +0200
Message-ID: <20240726152206.28411-23-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the stack mapped on a per-CPU basis there's no risk of other CPUs being
able to read the stack contents, but vCPUs running on the current pCPU could
read stack rubble from operations of previous vCPUs.

The #DF stack is not zeroed because handling of #DF results in a panic.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/current.h | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index 75b9a341f814..02b4118b03ef 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -177,6 +177,14 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
 # define SHADOW_STACK_WORK ""
 #endif
 
+#define ZERO_STACK                                              \
+    "test %[stk_size], %[stk_size];"                            \
+    "jz .L_skip_zeroing.%=;"                                    \
+    "std;"                                                      \
+    "rep stosb;"                                                \
+    "cld;"                                                      \
+    ".L_skip_zeroing.%=:"
+
 #if __GNUC__ >= 9
 # define ssaj_has_attr_noreturn(fn) __builtin_has_attribute(fn, __noreturn__)
 #else
@@ -187,10 +195,24 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
 #define switch_stack_and_jump(fn, instr, constr)                        \
     ({                                                                  \
         unsigned int tmp;                                               \
+        bool zero_stack = current->domain->arch.asi;                    \
         BUILD_BUG_ON(!ssaj_has_attr_noreturn(fn));                      \
+        ASSERT(IS_ALIGNED((unsigned long)guest_cpu_user_regs() -        \
+                          PRIMARY_STACK_SIZE +                          \
+                          sizeof(struct cpu_info), PAGE_SIZE));         \
+        if ( zero_stack )                                               \
+        {                                                               \
+            unsigned long stack_top = get_stack_bottom() &              \
+                                      ~(STACK_SIZE - 1);                \
+                                                                        \
+            clear_page((void *)stack_top + IST_MCE * PAGE_SIZE);        \
+            clear_page((void *)stack_top + IST_NMI * PAGE_SIZE);        \
+            clear_page((void *)stack_top + IST_DB  * PAGE_SIZE);        \
+        }                                                               \
         __asm__ __volatile__ (                                          \
             SHADOW_STACK_WORK                                           \
             "mov %[stk], %%rsp;"                                        \
+            ZERO_STACK                                                  \
             CHECK_FOR_LIVEPATCH_WORK                                    \
             instr "[fun]"                                               \
             : [val] "=&r" (tmp),                                        \
@@ -201,7 +223,13 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
               ((PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8),               \
               [stack_mask] "i" (STACK_SIZE - 1),                        \
               _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__,                \
-                                 __FILE__, NULL)                        \
+                                 __FILE__, NULL),                       \
+              /* For stack zeroing. */                                  \
+              "D" ((void *)guest_cpu_user_regs() - 1),                  \
+              [stk_size] "c"                                            \
+              (zero_stack ? PRIMARY_STACK_SIZE - sizeof(struct cpu_info)\
+                          : 0),                                         \
+              "a" (0)                                                   \
             : "memory" );                                               \
         unreachable();                                                  \
     })
-- 
2.45.2


