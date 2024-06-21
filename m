Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FFF912CFD
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 20:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745443.1152575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKifA-0007cX-W3; Fri, 21 Jun 2024 18:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745443.1152575; Fri, 21 Jun 2024 18:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKifA-0007aj-TD; Fri, 21 Jun 2024 18:07:04 +0000
Received: by outflank-mailman (input) for mailman id 745443;
 Fri, 21 Jun 2024 18:07:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FH9a=NX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKif9-0007MK-JC
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 18:07:03 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0eeb590d-2ff9-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 20:07:01 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ec50d4e46aso7560711fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 11:07:01 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d30427976sm1244537a12.33.2024.06.21.11.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 11:07:00 -0700 (PDT)
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
X-Inumbo-ID: 0eeb590d-2ff9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718993220; x=1719598020; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mPJ8Fzs9EItfU15q5evCDIy3pVc6ZsOkwV745HGMWA=;
        b=wbIgOqqUiCtrrwJHJ2BWE/V0JpVIpAiUBRXrY1f2LCWXvPQDn4GWgpEu0ZYpdDkkIp
         6J8tfuiayvTCtqULMQATjmrXAKFEO+Ryq9fTO0oDaFdInSpiu4VgXV41DTjV8xFlxTXv
         MsiyUrQbWO/wfUS/o2Eg3s1jl5nNqjBNVRNK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718993220; x=1719598020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mPJ8Fzs9EItfU15q5evCDIy3pVc6ZsOkwV745HGMWA=;
        b=OpphdFk7TC8hc1nM9PUDw+dEH50nZOB7sz6xdEVgBXsMBo0rYHW5w/xNxcnzeCh3QW
         TopHZt2V3PlkVUHYdEz5CU76mbNbmVBsbFzAeWgvJdGfHL+Ntfg/RNycOGalW47Q0RHf
         jIZp2U/RnjrCOZ1agP89DD28UqRWqwZyhe4CvFZXcELm1x07uaNjH15wVKEdJGtTVbkW
         gIqc2/VkZt4Sg4EVlqfvicS8lj7SleudsKdkc07f4np2HWnkPhBMfPP+v8OtA5As1QDu
         aEmVL7BD9SXY/LYWlSCzs3cGgvNHEwm1lq1EazE3FhdyLc6DkS8HXeMvA4EM/j2LzV4p
         8blQ==
X-Gm-Message-State: AOJu0YxiPU5XhB3KxePskbx6rPIdXqHmTlEny21cno3/UEVnoA3/tyXx
	zz86f+f265Ln4JSu/FHUBp7ez8YPY9G+UVoeLxh+j2iackcspz/49imyd/dhK8ED8hRbz/kyDx5
	e7hQ=
X-Google-Smtp-Source: AGHT+IFYv6awnyCy9QB0BoYbnXNhnIx2dtX3UZAotPVVtYzSxt/xum4ZTkvHGAHU6ckhIcbbyLOOqA==
X-Received: by 2002:a2e:95c4:0:b0:2ec:4fec:812c with SMTP id 38308e7fff4ca-2ec4fec83bdmr14441201fa.44.1718993220565;
        Fri, 21 Jun 2024 11:07:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 v3 1/4] x86/shadow: Rework trace_shadow_gen() into sh_trace_va()
Date: Fri, 21 Jun 2024 19:06:55 +0100
Message-Id: <20240621180658.92831-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621180658.92831-1-andrew.cooper3@citrix.com>
References: <20240621180658.92831-1-andrew.cooper3@citrix.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

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
2.39.2


