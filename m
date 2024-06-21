Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0C4912CF9
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 20:07:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745444.1152584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKifC-0007r9-6b; Fri, 21 Jun 2024 18:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745444.1152584; Fri, 21 Jun 2024 18:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKifC-0007p7-3J; Fri, 21 Jun 2024 18:07:06 +0000
Received: by outflank-mailman (input) for mailman id 745444;
 Fri, 21 Jun 2024 18:07:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FH9a=NX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKifA-0007MK-JJ
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 18:07:04 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f3143fe-2ff9-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 20:07:02 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57cfe600cbeso2770278a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 11:07:02 -0700 (PDT)
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
X-Inumbo-ID: 0f3143fe-2ff9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718993221; x=1719598021; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYkGBPoHjIs+Sp6qz1v10kMfnsAkcP2P+WxDwIT/KUY=;
        b=DztpuUTu9I7e1RDO0X1OQOmqySHwkMk7/BXMm6i8Zq4YilR/e3K9DRmok4Nx9BqhkN
         dCGW5J3u8G63xBY/uCWQvWaAxv66w98+hZWrLu1we/5dZQH3NdL+i3HMb6ELxwrpUdZZ
         MB1q9LCOscJX6hPp0lhWucsn9ntMK8nIouN2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718993221; x=1719598021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYkGBPoHjIs+Sp6qz1v10kMfnsAkcP2P+WxDwIT/KUY=;
        b=L/4kmFD3gUwO7aGu6iNSi8cQBnwXB1U2VmFGc6ETCurP4OO0fqfMWtV6tz9K15Be0Y
         Kmsg74TPsQtA5dn83+lGujrsjs4sfj7aikn/Le7IATfhACaGX7WiqOM0SR1N8Qtl4jZX
         dOch5ikfxtEFiI9XNR0IWMEs92x9P66zGKK8PTwOeS7XGmhGOPS03naKaSjpJDNJejnS
         +hDC5x9bU2jxTD7ZnCmFtAkkRAHFWVFH17hbjGERSWoYrYuj5tV5aqY+EJNikw81N+6r
         VdxsbvFdD0bPAOw7MZPqlXBOLtVb3+6pHFTV2EeNrf+lRf7SK/OIgRq49Ue9cteNEF3L
         8jZQ==
X-Gm-Message-State: AOJu0YxWAKUZsucY/WGiisVqy2CJFAmZtrFp0++cyIqRDLl7q/p1a/H7
	ozLHycMjxnA2ag+xSlGmxjxyl/UWNa+Gqp1uXy7NvDrq2sj4jVPc1pbWv+Tji9WpSTQ0l0YNhW7
	FmEA=
X-Google-Smtp-Source: AGHT+IFMr855r9r+IShpdogxtKe4tr95yzqOIH263iae9rtPfcbOLdZ6uuLI2EebzIID2jbE7IjhBA==
X-Received: by 2002:a50:9fcc:0:b0:57c:60f0:98bc with SMTP id 4fb4d7f45d1cf-57d07e7996cmr6143786a12.11.1718993221133;
        Fri, 21 Jun 2024 11:07:01 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 v3 2/4] x86/shadow: Introduce sh_trace_gl1e_va()
Date: Fri, 21 Jun 2024 19:06:56 +0100
Message-Id: <20240621180658.92831-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621180658.92831-1-andrew.cooper3@citrix.com>
References: <20240621180658.92831-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

trace_shadow_fixup() and trace_not_shadow_fault() both write out identical
trace records.  Reimplement them in terms of a common sh_trace_gl1e_va().

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
 * Retain the __packed to avoid introducing tail padding
---
 xen/arch/x86/mm/shadow/multi.c | 57 ++++++++++------------------------
 1 file changed, 16 insertions(+), 41 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 1775952d7e18..75250c6f0f7c 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -1987,51 +1987,26 @@ static void sh_trace_va(uint32_t event, guest_va_t va)
         sh_trace(event, sizeof(va), &va);
 }
 
-static inline void trace_shadow_fixup(guest_l1e_t gl1e,
-                                      guest_va_t va)
+/* Shadow trace event with a gl1e, linear address and flags. */
+static void sh_trace_gl1e_va(uint32_t event, guest_l1e_t gl1e, guest_va_t va)
 {
     if ( tb_init_done )
     {
         struct __packed {
-            /* for PAE, guest_l1e may be 64 while guest_va may be 32;
-               so put it first for alignment sake. */
-            guest_l1e_t gl1e;
-            guest_va_t va;
-            u32 flags;
-        } d;
-        u32 event;
-
-        event = TRC_SHADOW_FIXUP | ((GUEST_PAGING_LEVELS-2)<<8);
-
-        d.gl1e = gl1e;
-        d.va = va;
-        d.flags = this_cpu(trace_shadow_path_flags);
-
-        trace(event, sizeof(d), &d);
-    }
-}
-
-static inline void trace_not_shadow_fault(guest_l1e_t gl1e,
-                                          guest_va_t va)
-{
-    if ( tb_init_done )
-    {
-        struct __packed {
-            /* for PAE, guest_l1e may be 64 while guest_va may be 32;
-               so put it first for alignment sake. */
+            /*
+             * For GUEST_PAGING_LEVELS=3 (PAE paging), guest_l1e is 64 while
+             * guest_va is 32.  Put it first to avoid padding.
+             */
             guest_l1e_t gl1e;
             guest_va_t va;
-            u32 flags;
-        } d;
-        u32 event;
-
-        event = TRC_SHADOW_NOT_SHADOW | ((GUEST_PAGING_LEVELS-2)<<8);
-
-        d.gl1e = gl1e;
-        d.va = va;
-        d.flags = this_cpu(trace_shadow_path_flags);
-
-        trace(event, sizeof(d), &d);
+            uint32_t flags;
+        } d = {
+            .gl1e  = gl1e,
+            .va    = va,
+            .flags = this_cpu(trace_shadow_path_flags),
+        };
+
+        sh_trace(event, sizeof(d), &d);
     }
 }
 
@@ -2603,7 +2578,7 @@ static int cf_check sh_page_fault(
     d->arch.paging.log_dirty.fault_count++;
     sh_reset_early_unshadow(v);
 
-    trace_shadow_fixup(gw.l1e, va);
+    sh_trace_gl1e_va(TRC_SHADOW_FIXUP, gw.l1e, va);
  done: __maybe_unused;
     sh_audit_gw(v, &gw);
     SHADOW_PRINTK("fixed\n");
@@ -2857,7 +2832,7 @@ static int cf_check sh_page_fault(
     put_gfn(d, gfn_x(gfn));
 
 propagate:
-    trace_not_shadow_fault(gw.l1e, va);
+    sh_trace_gl1e_va(TRC_SHADOW_NOT_SHADOW, gw.l1e, va);
 
     return 0;
 }
-- 
2.39.2


