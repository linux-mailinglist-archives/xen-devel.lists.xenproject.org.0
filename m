Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D7E912CFB
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 20:07:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745446.1152604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKifD-0008LF-NU; Fri, 21 Jun 2024 18:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745446.1152604; Fri, 21 Jun 2024 18:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKifD-0008Ht-JT; Fri, 21 Jun 2024 18:07:07 +0000
Received: by outflank-mailman (input) for mailman id 745446;
 Fri, 21 Jun 2024 18:07:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FH9a=NX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKifB-0007MK-JO
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 18:07:05 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fd321fc-2ff9-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 20:07:03 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57cc30eaf0aso1308250a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 11:07:03 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d30427976sm1244537a12.33.2024.06.21.11.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 11:07:01 -0700 (PDT)
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
X-Inumbo-ID: 0fd321fc-2ff9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718993222; x=1719598022; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJfO+iaO+pfUPdCT3G8BrrqFYQcfAnWPZ8F2JImaFRY=;
        b=Ui7LRpRk7xsqn54aPNmAkvxv1FqjaaHKf4FxJ4o3yPcyHb8j7H/2JGvCtd9WRfSMC9
         wY21ASgGjvCi3AOrYv7CwcXYd6FUwNtTJ6ylltFxusPbbECy1uzpGb3IM6muWULxbrKe
         nDBAI7NGUaoWfFDsj3ZlRWoSRkssuT3N1882s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718993222; x=1719598022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJfO+iaO+pfUPdCT3G8BrrqFYQcfAnWPZ8F2JImaFRY=;
        b=liiCrUYlwELBGNyuvLftuCRag6IA24fFHhrLTUrCMDFR73TqtTA7FdilfwdC3rqeuV
         bRj+XpBzOggfewenUcddTTzxaDsZrJkSI/ZxkqzLVbQ9lM1ldO/JZQt5PDoHFwPfMMff
         LEX76XGneW46Q/WPef25KFn+IS5hLivmr63t9+i73uWdp1aoI7ZwDSKORwlwEB+2E4cE
         C4cst9vYFB7TMLyx+G1TZM2rt3AP0fagyfUzx+cSrxWxN3OLKwp1Yd6xcTHbOTgewtnn
         TpTZ+Pf3/N3yMYfGrVcc3ieux3iAi84FRu5i0B47R+ChmmeaLJvxwFUqFSm2KPJFj/6z
         gYOA==
X-Gm-Message-State: AOJu0YwG6ZaJ5rsX5yEgj+A017DWBju6v7GyA5sp8+oZsI5ELPhJdx6X
	WSBDMqH+k4T2wSaDDZOu455u9lGl1GmR+wun85TkjlMSIvCx666+0vyr5X5UGBTQQsaZ5pFYGat
	7RZk=
X-Google-Smtp-Source: AGHT+IGvSALMqd/YQW33QFl5caOW9BRj5CwiB10ur4Cn4l+9ONCotJBdJrtSAKbRqC5sGP/e97gkSA==
X-Received: by 2002:a50:d7dc:0:b0:57d:3b8:85e6 with SMTP id 4fb4d7f45d1cf-57d31c9542emr1963784a12.39.1718993222170;
        Fri, 21 Jun 2024 11:07:02 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 v3 3/4] x86/shadow: Rework trace_shadow_emulate_other() as sh_trace_gfn_va()
Date: Fri, 21 Jun 2024 19:06:57 +0100
Message-Id: <20240621180658.92831-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621180658.92831-1-andrew.cooper3@citrix.com>
References: <20240621180658.92831-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sh_trace_gfn_va() is very similar to sh_trace_gl1e_va(), and a rather shorter
name than trace_shadow_emulate_other().

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v2:
 * New
v3:
 * Retain __packed.
---
 xen/arch/x86/mm/shadow/multi.c | 38 ++++++++++++++++------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 75250c6f0f7c..7f95d50be397 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2010,29 +2010,30 @@ static void sh_trace_gl1e_va(uint32_t event, guest_l1e_t gl1e, guest_va_t va)
     }
 }
 
-static inline void trace_shadow_emulate_other(u32 event,
-                                                 guest_va_t va,
-                                                 gfn_t gfn)
+/* Shadow trace event with a gfn, linear address and flags. */
+static void sh_trace_gfn_va(uint32_t event, gfn_t gfn, guest_va_t va)
 {
     if ( tb_init_done )
     {
         struct __packed {
-            /* for PAE, guest_l1e may be 64 while guest_va may be 32;
-               so put it first for alignment sake. */
+            /*
+             * For GUEST_PAGING_LEVELS=3 (PAE paging), gfn is 64 while
+             * guest_va is 32.  Put it first to avoid padding.
+             */
 #if GUEST_PAGING_LEVELS == 2
-            u32 gfn;
+            uint32_t gfn;
 #else
-            u64 gfn;
+            uint64_t gfn;
 #endif
             guest_va_t va;
-        } d;
-
-        event |= ((GUEST_PAGING_LEVELS-2)<<8);
-
-        d.gfn=gfn_x(gfn);
-        d.va = va;
+            uint32_t flags;
+        } d = {
+            .gfn   = gfn_x(gfn),
+            .va    = va,
+            .flags = this_cpu(trace_shadow_path_flags),
+        };
 
-        trace(event, sizeof(d), &d);
+        sh_trace(event, sizeof(d), &d);
     }
 }
 
@@ -2603,8 +2604,7 @@ static int cf_check sh_page_fault(
                       mfn_x(gmfn));
         perfc_incr(shadow_fault_emulate_failed);
         shadow_remove_all_shadows(d, gmfn);
-        trace_shadow_emulate_other(TRC_SHADOW_EMULATE_UNSHADOW_USER,
-                                      va, gfn);
+        sh_trace_gfn_va(TRC_SHADOW_EMULATE_UNSHADOW_USER, gfn, va);
         goto done;
     }
 
@@ -2683,8 +2683,7 @@ static int cf_check sh_page_fault(
         }
 #endif
         shadow_remove_all_shadows(d, gmfn);
-        trace_shadow_emulate_other(TRC_SHADOW_EMULATE_UNSHADOW_EVTINJ,
-                                   va, gfn);
+        sh_trace_gfn_va(TRC_SHADOW_EMULATE_UNSHADOW_EVTINJ, gfn, va);
         return EXCRET_fault_fixed;
     }
 
@@ -2739,8 +2738,7 @@ static int cf_check sh_page_fault(
          * though, this is a hint that this page should not be shadowed. */
         shadow_remove_all_shadows(d, gmfn);
 
-        trace_shadow_emulate_other(TRC_SHADOW_EMULATE_UNSHADOW_UNHANDLED,
-                                   va, gfn);
+        sh_trace_gfn_va(TRC_SHADOW_EMULATE_UNSHADOW_UNHANDLED, gfn, va);
         goto emulate_done;
     }
 
-- 
2.39.2


