Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 192B28CC1E7
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:17:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727616.1132179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lqF-0007lp-Rw; Wed, 22 May 2024 13:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727616.1132179; Wed, 22 May 2024 13:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lqF-0007iF-ML; Wed, 22 May 2024 13:17:15 +0000
Received: by outflank-mailman (input) for mailman id 727616;
 Wed, 22 May 2024 13:17:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vsR+=MZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s9lqD-00078O-9R
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:17:13 +0000
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [2607:f8b0:4864:20::832])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 999cc691-183d-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 15:17:12 +0200 (CEST)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-43e0d564136so7661601cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 06:17:12 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df8308580sm168782291cf.66.2024.05.22.06.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 06:17:10 -0700 (PDT)
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
X-Inumbo-ID: 999cc691-183d-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716383831; x=1716988631; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUgjIaJwGOveqC8f3Hnlrm+bkXv3Lg6iNL+SZwb8N6Q=;
        b=V4h8tgLYHMop/DKO1BRIOprCKj0pyhJ5pK7ffsWc5tf/JHY2v7rdIWQ3xd+v2UZ8Nd
         DzwqZmm+cFayVRF8VjUqi4xDzImgKRyZYswdkl0qWTEO537U4lXsipalOlScHQqNh9GX
         QGwyj4QFS56aHw+jyXKrbstop3ZKJPWiAxQlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716383831; x=1716988631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUgjIaJwGOveqC8f3Hnlrm+bkXv3Lg6iNL+SZwb8N6Q=;
        b=XBP6DtBHMk+nXSOP1lqtJ0KlbCRIE6KVRbVAfZGRHkynvpHgdXKAAsQqg2r+to54X1
         ccdzROXwWL711OkGGeM0Sv/FVYHbVw07spC09XSWuCWoH5n530cEquJQo504+3ljO9q2
         heoA3qpK9+eRWZ80YFU2lhUF9LGTOwy7qjQWEDaK7YaVqlknuviG32eqP06A8ofXZ6wC
         U/YsXU9CUdqRwKDiUEAl4mH7Hr2e8zfqFdaapoDadqHiNerXWPeJ6nqRc9wINtn/YnZk
         o4qV7CtaqQWHLANJfU1sZWBNo/q1buS1hOhT19N1ZNFDhNHsNR8PgUQggdLUgqjrRoIz
         WWHg==
X-Gm-Message-State: AOJu0YwR9EXav6bA+min5XC4udOac5RFYKjra0uzpOpgYrQMNzvjaQ1y
	+9A3don/AuRM+IqjUQSrhBDrB02FC+f2yVk3XL6WYdpMeOFf7weDPDTJGvVFIgh3CHcCN9A8w6Z
	dntY=
X-Google-Smtp-Source: AGHT+IE058XLU1M59pKmCtXLyedictXtR2d3bLBkWZ1fCtR64oB4lj/5qgOU1e77TQNhYbhybjhYnA==
X-Received: by 2002:ac8:5e49:0:b0:43a:ecfb:8a5c with SMTP id d75a77b69052e-43f9e124359mr28617561cf.40.1716383831009;
        Wed, 22 May 2024 06:17:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v2 2/4] x86/shadow: Introduce sh_trace_gl1e_va()
Date: Wed, 22 May 2024 14:17:01 +0100
Message-Id: <20240522131703.30839-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522131703.30839-1-andrew.cooper3@citrix.com>
References: <20240522131703.30839-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

trace_shadow_fixup() and trace_not_shadow_fault() both write out identical
trace records.  Reimplement them in terms of a common sh_trace_gl1e_va().

There's no need to pack the trace record, even in the case of PAE paging.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>

v2:
 * New
---
 xen/arch/x86/mm/shadow/multi.c | 59 ++++++++++------------------------
 1 file changed, 17 insertions(+), 42 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 1775952d7e18..f0a9cc527c0b 100644
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
-        struct __packed {
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
+        struct {
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
+            .gl1e = gl1e,
+            .va = va,
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
2.30.2


