Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDB58CC1E8
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:17:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727619.1132199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lqI-0008KF-GO; Wed, 22 May 2024 13:17:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727619.1132199; Wed, 22 May 2024 13:17:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lqI-0008HG-CI; Wed, 22 May 2024 13:17:18 +0000
Received: by outflank-mailman (input) for mailman id 727619;
 Wed, 22 May 2024 13:17:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vsR+=MZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s9lqG-00078O-GN
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:17:16 +0000
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [2607:f8b0:4864:20::82b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b8a0971-183d-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 15:17:16 +0200 (CEST)
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-43df23e034cso8450601cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 06:17:15 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df8308580sm168782291cf.66.2024.05.22.06.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 06:17:14 -0700 (PDT)
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
X-Inumbo-ID: 9b8a0971-183d-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716383834; x=1716988634; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKZ+hrKbmIX0HLzcZm1/QsXM9UY491uFgrKkXcJYF8Y=;
        b=b5ixs+yXSJvIAMvV6U0JtXbWd4UiuYeQCP2XjgRiHSV93S910EES0Sh4LO917RwJeK
         gXsfXq005oziqc4nEa4zm6GEUlR30Kwj3ZpY0huD3WjN++jRREGUJMIM33/6CX9ZUdm1
         Lm1x/rGiSxj/V21kVaI7lp+QtwM1vVbjQQ/A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716383834; x=1716988634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKZ+hrKbmIX0HLzcZm1/QsXM9UY491uFgrKkXcJYF8Y=;
        b=QeE7x+0n6OSsxH9fxj6pNtTHXHp7ThJGm84Ua6t8GY106uq7bBeLk+pmtC/si51nGx
         JIIojxRJK5H6d9N5jMCv6YFD9JdsxUljq1zYfpIebBMR2D/jc5A30JiqTPuJXmaaJvbr
         c8HOg5RKcGJay83DrjOQ8xTQppXQ73vLdaOW2LLX1e8ZAyF8ZGDM6TxrucYxPnqnwoAJ
         F3KDoHd0ZwsIJ9UIZ414DiPAQ1MwvEnyMH/RUcsYxUbAH5eiBMBzInwKQToN329vQ28K
         UfUSTnBts3CImt8ra04RKJeVnJ/CNST/HyoNInimox2sbtvdRMbnlTuW7CVjYcb/bKwX
         OZiw==
X-Gm-Message-State: AOJu0YyEZfy5vr+ed1XvOIFeOmyFBaz7yFbTW1cgU77FHE21AK5VYq5R
	4qpmv/mgpwpLXYRiZ84JR/8JmvfIqnbd35arqW4TDnv0eHL39UipczhsDHahmwLzeaxSy46SPJB
	8Awc=
X-Google-Smtp-Source: AGHT+IElu8z/Eu8w8c3oL9QCc/0cb9N1XmB+dL6SmIf139Vn5/gJPiYk1pYs35eiOA29ZFkoAO+0Tw==
X-Received: by 2002:a05:622a:4:b0:43a:7b64:2fcc with SMTP id d75a77b69052e-43f7a29127dmr242246561cf.7.1716383834375;
        Wed, 22 May 2024 06:17:14 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v2 4/4] x86/shadow: Don't leave trace record field uninitialized
Date: Wed, 22 May 2024 14:17:03 +0100
Message-Id: <20240522131703.30839-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522131703.30839-1-andrew.cooper3@citrix.com>
References: <20240522131703.30839-1-andrew.cooper3@citrix.com>
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
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>

v2:
 * Rebase over packing/sh_trace() cleanup.
---
 xen/arch/x86/mm/shadow/multi.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index d2fe4e148fe0..47dd1cc626b2 100644
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
-        struct __packed {
-            /* for PAE, guest_l1e may be 64 while guest_va may be 32;
-               so put it first for alignment sake. */
+        struct {
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
2.30.2


