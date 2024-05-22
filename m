Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8B78CC1E5
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:17:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727615.1132168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lqD-0007R2-Gk; Wed, 22 May 2024 13:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727615.1132168; Wed, 22 May 2024 13:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lqD-0007Op-DD; Wed, 22 May 2024 13:17:13 +0000
Received: by outflank-mailman (input) for mailman id 727615;
 Wed, 22 May 2024 13:17:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vsR+=MZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s9lqB-00078O-W5
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:17:11 +0000
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [2607:f8b0:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 989a55e4-183d-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 15:17:11 +0200 (CEST)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-36dc410c051so23575535ab.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 06:17:11 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df8308580sm168782291cf.66.2024.05.22.06.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 06:17:09 -0700 (PDT)
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
X-Inumbo-ID: 989a55e4-183d-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716383829; x=1716988629; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3W9egxiDkbfNPkqbiYstXvWaWDLlMru2YaLPYeMLJk4=;
        b=Eey/lI36tR/Hw9I3ReTw348HbWmFKf1OAoYmRsRv6C+KDRmywg9x93q7jAsPiUyC/3
         WBSdx/e9ulXeTDRNxdcefLuIChiHYSCXKcyEoVp4LjSP3GZTAEWYYjV78UXrpwZN5YWP
         3QbGdTeD7PtUzUyuYU2I4yh9EABQMLtFuTJPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716383829; x=1716988629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3W9egxiDkbfNPkqbiYstXvWaWDLlMru2YaLPYeMLJk4=;
        b=wks4rv/mVW2yeCZu6H2407IQs4iCy1JtoBeqW2RjI3aG3kKieEhipY9d7Gmmn75Ols
         tcIFEVmmJH87b1KnVW48LycShx6+f7mxr+T+hC7Od2AKBmVqb4W2KeeFBun4UbgW0S90
         A8ZTTVAM3EK4JSN5jhuLlv7vn/I5C7qLzciYXGgGWzVsy9Jsg4Kro0Q3xzGsf4MwI7wH
         yqoDFMSC03Ebe/mYGHmlWvTttquO+veiMMG9ucxRIL9hfTBNp42zbqBSIYXfb11En2kA
         rUCIB1XCxxEyVU898fqkhHIPgGI3WwQs30s0dLCgFaHzN68QD8Y1/3zRcYBzMxP7lMDr
         MBjw==
X-Gm-Message-State: AOJu0YyYyHHyNydMfJu5+NqVxJPnOYs9YpjANC4kPKQMhInWY7fYKVW7
	hraWGk0Xs9Nx/DfqLMn1nnmhRqrU6RVE+hTB2Trz/BPnsF7qQMJEn+cTjDWGxVcYYagx/FG4VCO
	EkXc=
X-Google-Smtp-Source: AGHT+IFOsCZnn3ppdQFR01k/LArnvWpuwcO8Lm9Aw5tWCalNjdTDf2rT+KGQTsBatgJy6F4Dp1WTHg==
X-Received: by 2002:a05:6e02:1a2a:b0:36b:1e1:552f with SMTP id e9e14a558f8ab-371faf56c05mr22422715ab.23.1716383829497;
        Wed, 22 May 2024 06:17:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v2 1/4] x86/shadow: Rework trace_shadow_gen() into sh_trace_va()
Date: Wed, 22 May 2024 14:17:00 +0100
Message-Id: <20240522131703.30839-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522131703.30839-1-andrew.cooper3@citrix.com>
References: <20240522131703.30839-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ((GUEST_PAGING_LEVELS - 2) << 8) expression in the event field is common
to all shadow trace events, so introduce sh_trace() as a very thin wrapper
around trace().

Then, rename trace_shadow_gen() to sh_trace_va() to better describe what it is
doing, and to be more consistent with later cleanup.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>

v2:
 * New
---
 xen/arch/x86/mm/shadow/multi.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index bcd02b2d0037..1775952d7e18 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -1974,13 +1974,17 @@ typedef u32 guest_va_t;
 typedef u32 guest_pa_t;
 #endif
 
-static inline void trace_shadow_gen(u32 event, guest_va_t va)
+/* Shadow trace event with GUEST_PAGING_LEVELS folded into the event field. */
+static void sh_trace(uint32_t event, unsigned int extra, const void *extra_data)
+{
+    trace(event | ((GUEST_PAGING_LEVELS - 2) << 8), extra, extra_data);
+}
+
+/* Shadow trace event with the guest's linear address. */
+static void sh_trace_va(uint32_t event, guest_va_t va)
 {
     if ( tb_init_done )
-    {
-        event |= (GUEST_PAGING_LEVELS-2)<<8;
-        trace(event, sizeof(va), &va);
-    }
+        sh_trace(event, sizeof(va), &va);
 }
 
 static inline void trace_shadow_fixup(guest_l1e_t gl1e,
@@ -2239,7 +2243,7 @@ static int cf_check sh_page_fault(
                 sh_reset_early_unshadow(v);
                 perfc_incr(shadow_fault_fast_gnp);
                 SHADOW_PRINTK("fast path not-present\n");
-                trace_shadow_gen(TRC_SHADOW_FAST_PROPAGATE, va);
+                sh_trace_va(TRC_SHADOW_FAST_PROPAGATE, va);
                 return 0;
             }
 #ifdef CONFIG_HVM
@@ -2250,7 +2254,7 @@ static int cf_check sh_page_fault(
             perfc_incr(shadow_fault_fast_mmio);
             SHADOW_PRINTK("fast path mmio %#"PRIpaddr"\n", gpa);
             sh_reset_early_unshadow(v);
-            trace_shadow_gen(TRC_SHADOW_FAST_MMIO, va);
+            sh_trace_va(TRC_SHADOW_FAST_MMIO, va);
             return handle_mmio_with_translation(va, gpa >> PAGE_SHIFT, access)
                    ? EXCRET_fault_fixed : 0;
 #else
@@ -2265,7 +2269,7 @@ static int cf_check sh_page_fault(
              * Retry and let the hardware give us the right fault next time. */
             perfc_incr(shadow_fault_fast_fail);
             SHADOW_PRINTK("fast path false alarm!\n");
-            trace_shadow_gen(TRC_SHADOW_FALSE_FAST_PATH, va);
+            sh_trace_va(TRC_SHADOW_FALSE_FAST_PATH, va);
             return EXCRET_fault_fixed;
         }
     }
@@ -2481,7 +2485,7 @@ static int cf_check sh_page_fault(
 #endif
         paging_unlock(d);
         put_gfn(d, gfn_x(gfn));
-        trace_shadow_gen(TRC_SHADOW_DOMF_DYING, va);
+        sh_trace_va(TRC_SHADOW_DOMF_DYING, va);
         return 0;
     }
 
@@ -2569,7 +2573,7 @@ static int cf_check sh_page_fault(
         put_gfn(d, gfn_x(gfn));
 
         perfc_incr(shadow_fault_mmio);
-        trace_shadow_gen(TRC_SHADOW_MMIO, va);
+        sh_trace_va(TRC_SHADOW_MMIO, va);
 
         return handle_mmio_with_translation(va, gpa >> PAGE_SHIFT, access)
                ? EXCRET_fault_fixed : 0;
-- 
2.30.2


