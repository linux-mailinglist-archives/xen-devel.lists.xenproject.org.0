Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56467912CFC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 20:07:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745445.1152590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKifC-0007tm-E7; Fri, 21 Jun 2024 18:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745445.1152590; Fri, 21 Jun 2024 18:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKifC-0007rE-AE; Fri, 21 Jun 2024 18:07:06 +0000
Received: by outflank-mailman (input) for mailman id 745445;
 Fri, 21 Jun 2024 18:07:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FH9a=NX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKifB-0007ai-1K
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 18:07:05 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1045ebc0-2ff9-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 20:07:04 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6efacd25ecso131881566b.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 11:07:04 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d30427976sm1244537a12.33.2024.06.21.11.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 11:07:02 -0700 (PDT)
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
X-Inumbo-ID: 1045ebc0-2ff9-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718993223; x=1719598023; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UENei0RoJJU0F6xVv+xuU03cuzsYd2lsohkbB9XWZBg=;
        b=OYfMmTg3zfXBYpuNWwmVbOmuuXOHfPkdnXyY1o66zeniEKmZiZ62jQjPOh94EEJrtE
         jbaI7NdrY5EVDD5M6/Xa+Z64P99hVwkrNL5nRoRYQtZyxPc3ENKMFQfdTjbPqfv6mN3/
         t1pl3+6XM3BOVT6wRECv3+LUoZJL776eld85E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718993223; x=1719598023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UENei0RoJJU0F6xVv+xuU03cuzsYd2lsohkbB9XWZBg=;
        b=aOYKU2EOAjI/7L0MRzbwAB3Iqs4J72xSDB7JvrG3CWq7eWbMrpCmMmFEcXur7KIM+a
         vhTZb98SfnKcJGKyLQb8IVH305JSH6PX8nE/VoSfvqp0H67dYriltgQQC9JtYRKFR+hP
         kQqzxo24fu+eUiZSyYVjSYDLN/a8lHH794eqKciIK1RFfoo7i4/niE+Ub7ULsHB/xjDu
         hQSMbo3Oyuhkh6RQvPnhpcSjsmfp38Vwvm6MSlLUlfbjhj0myogdB4zPnVFU1R4bxAoj
         Iql37E2HwptN26g0KdRgjzuPMpF2YhSS1RqeuxKMV5CqyuFeKFxAFYLQ5gQ/buYqJWEV
         vB9g==
X-Gm-Message-State: AOJu0Yyv7i2Z8cc1w2Esr8kLHf0cji83pX2G7TAe/04i4Molew/loWpd
	R6L2t7D0HgNLl+N25Mo8cRQVl8dPTtylKY9TmBeqwJUtsx1zB6kL0xWWUhOg+YDFe0oiZBD1HL/
	y7d0=
X-Google-Smtp-Source: AGHT+IHD3hxvnofs4GJv7jRRinBxIQABBtpjKadqoS7PvZBZUJ80/tlbC+MGJ3uPmT09lJgkLxwJDQ==
X-Received: by 2002:a50:c30d:0:b0:57d:2659:9143 with SMTP id 4fb4d7f45d1cf-57d265991d3mr3595483a12.37.1718993223234;
        Fri, 21 Jun 2024 11:07:03 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <JBeulich@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH for-4.19 v3 4/4] x86/shadow: Don't leave trace record field uninitialized
Date: Fri, 21 Jun 2024 19:06:58 +0100
Message-Id: <20240621180658.92831-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621180658.92831-1-andrew.cooper3@citrix.com>
References: <20240621180658.92831-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jan Beulich <jbeulich@suse.com>

The emulation_count field is set only conditionally right now. Convert
all field setting to an initializer, thus guaranteeing that field to be
set to 0 (default initialized) when GUEST_PAGING_LEVELS != 3.

Rework trace_shadow_emulate() to be consistent with the other trace helpers.

Coverity-ID: 1598430
Fixes: 9a86ac1aa3d2 ("xentrace 5/7: Additional tracing for the shadow code")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Release-acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v2:
 * Rebase over packing/sh_trace() cleanup.
---
 xen/arch/x86/mm/shadow/multi.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 7f95d50be397..71a2673682f4 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2063,30 +2063,29 @@ static void cf_check trace_emulate_write_val(
 #endif
 }
 
-static inline void trace_shadow_emulate(guest_l1e_t gl1e, unsigned long va)
+static inline void sh_trace_emulate(guest_l1e_t gl1e, unsigned long va)
 {
     if ( tb_init_done )
     {
         struct __packed {
-            /* for PAE, guest_l1e may be 64 while guest_va may be 32;
-               so put it first for alignment sake. */
+            /*
+             * For GUEST_PAGING_LEVELS=3 (PAE paging), guest_l1e is 64 while
+             * guest_va is 32.  Put it first to avoid padding.
+             */
             guest_l1e_t gl1e, write_val;
             guest_va_t va;
             uint32_t flags:29, emulation_count:3;
-        } d;
-        u32 event;
-
-        event = TRC_SHADOW_EMULATE | ((GUEST_PAGING_LEVELS-2)<<8);
-
-        d.gl1e = gl1e;
-        d.write_val.l1 = this_cpu(trace_emulate_write_val);
-        d.va = va;
+        } d = {
+            .gl1e = gl1e,
+            .write_val.l1 = this_cpu(trace_emulate_write_val),
+            .va = va,
 #if GUEST_PAGING_LEVELS == 3
-        d.emulation_count = this_cpu(trace_extra_emulation_count);
+            .emulation_count = this_cpu(trace_extra_emulation_count),
 #endif
-        d.flags = this_cpu(trace_shadow_path_flags);
+            .flags = this_cpu(trace_shadow_path_flags),
+        };
 
-        trace(event, sizeof(d), &d);
+        sh_trace(TRC_SHADOW_EMULATE, sizeof(d), &d);
     }
 }
 #endif /* CONFIG_HVM */
@@ -2815,7 +2814,7 @@ static int cf_check sh_page_fault(
     }
 #endif /* PAE guest */
 
-    trace_shadow_emulate(gw.l1e, va);
+    sh_trace_emulate(gw.l1e, va);
  emulate_done:
     SHADOW_PRINTK("emulated\n");
     return EXCRET_fault_fixed;
-- 
2.39.2


