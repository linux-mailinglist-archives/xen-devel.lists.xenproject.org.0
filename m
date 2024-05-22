Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C3E8CC1E6
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:17:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727617.1132188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lqH-00084G-7N; Wed, 22 May 2024 13:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727617.1132188; Wed, 22 May 2024 13:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lqH-0007zt-3A; Wed, 22 May 2024 13:17:17 +0000
Received: by outflank-mailman (input) for mailman id 727617;
 Wed, 22 May 2024 13:17:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vsR+=MZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s9lqF-0006aV-NS
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:17:15 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a689107-183d-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 15:17:14 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-43f91aac792so5822751cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 06:17:14 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df8308580sm168782291cf.66.2024.05.22.06.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 06:17:12 -0700 (PDT)
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
X-Inumbo-ID: 9a689107-183d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716383832; x=1716988632; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUlYslBBFz8SJFw2HFYr2U4IW4XAKwPKEvjfJVvwvsQ=;
        b=j1fHsoszGxka524cwGAFbgs2MRpdTBw+DZlVvfJw1OJT+j+y612ZV9xcYZJyn+ixyP
         Kg7ryvhWPeB6EHsNzltpY6qoVMKw/r5gw2Q6DVU/o70NsM6VSzdce2c4TS3m8qrlZMSm
         Yf0/+wgEKzHI9YRLln9ZHLNrTThNQiApp6Ggc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716383832; x=1716988632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUlYslBBFz8SJFw2HFYr2U4IW4XAKwPKEvjfJVvwvsQ=;
        b=mxlzf9j7L/CUYb9ZXxENmtYvxSmw7qh5Kh+aIH8Ko9F1R0n3AtNpNJDpNrUXBRpWhd
         eixcjpWjnNZC3Bw6/9R3kwd6OPOlAGHMbn8kIjgepnAPg+ena7+xl21BU8OT/yOHd95V
         D25j0CQNmcYdrQOp7Koj0EMZ/okT13AMOqY8kyn8xUC6ZB4ka+IBzsWKhTOLVr+JZs+i
         +RT+KA1IQEMAVAcxu2eZxmmCQulTOSXDvtNF/RCOtU0C8gNxSVYtTjq/ZltWOdtdk0jI
         sQWv/Kbd3dNkVUl9rZthZx9CbQGKrIWUXY2a7c59s/izbKyuQDe9KacaYZJ80sYhisZS
         Azeg==
X-Gm-Message-State: AOJu0Yze0GC9Ufr8GIgwi2IpOT6sIcfmuupiQsl5QTA1tKuDSEuAW6WL
	l1IO5Zlbg9xoPhBDzIddVqMDjBv/r3FN6ETZ7QNwLHmPWlUuzz0iVm6jeHXPQxaJy06g/wbmetc
	/UT8=
X-Google-Smtp-Source: AGHT+IHgcNFz0cHXAnovqybxYLcIlXH3BYwKJQGW2bzSQcH9gB41flGGy3toNyocqY82GQ5X3vsOTw==
X-Received: by 2002:ac8:598e:0:b0:43a:3fce:32c2 with SMTP id d75a77b69052e-43f7a28dfd5mr195215021cf.3.1716383832534;
        Wed, 22 May 2024 06:17:12 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v2 3/4] x86/shadow: Rework trace_shadow_emulate_other() as sh_trace_gfn_va()
Date: Wed, 22 May 2024 14:17:02 +0100
Message-Id: <20240522131703.30839-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522131703.30839-1-andrew.cooper3@citrix.com>
References: <20240522131703.30839-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sh_trace_gfn_va() is very similar to sh_trace_gl1e_va(), and a rather shorter
name than trace_shadow_emulate_other().  Like sh_trace_gl1e_va(), there is no
need to pack the trace record.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>

v2:
 * New
---
 xen/arch/x86/mm/shadow/multi.c | 40 ++++++++++++++++------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index f0a9cc527c0b..d2fe4e148fe0 100644
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
-        struct __packed {
-            /* for PAE, guest_l1e may be 64 while guest_va may be 32;
-               so put it first for alignment sake. */
+        struct {
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
+            .gfn = gfn_x(gfn),
+            .va = va,
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
2.30.2


