Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82314B1EF73
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:23:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075022.1437503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTce-00072W-Ju; Fri, 08 Aug 2025 20:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075022.1437503; Fri, 08 Aug 2025 20:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTce-0006wp-El; Fri, 08 Aug 2025 20:23:28 +0000
Received: by outflank-mailman (input) for mailman id 1075022;
 Fri, 08 Aug 2025 20:23:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTcc-0005tW-BF
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:26 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89bf789a-7495-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 22:23:26 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4589b3e3820so26573755e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:26 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:24 -0700 (PDT)
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
X-Inumbo-ID: 89bf789a-7495-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684605; x=1755289405; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h85hVDVJx6qX407q69uvd9gGoiZ0d1y+NYblpylfdg8=;
        b=qGZfcltPjK3K4MD4I+U4S/OW6x2tBlO0r/RYcWspvxqXjEdkQdZTeh+91IYvjEanDJ
         IzCHL6aHaM8W5hk4mNX6kdFgzPz+2ShkOOLPtNgFKkN7HyU1r21E5+1vmlI+gy35XSUo
         GCPKfplEeA3fA15QduhXq8wht+UJIg32t4LIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684605; x=1755289405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h85hVDVJx6qX407q69uvd9gGoiZ0d1y+NYblpylfdg8=;
        b=iX6HQqJCotE6A/zWeOMKiflhHY0K1rY4JUYqWmaE0jJfXcPS9fK+13rKhEHKpNYNZi
         gcw2aNGM/ONiMaUG3ejPpvI2i60Ve7niv2iIFkQmQDfGIRvlU8YeL+V2IUYIwmI1+e+p
         DnzekAHho4Zn05tIfq+037AJbNpEHJELXx+8GtaAeLEFsw+fAIBPOv6hZ5KZ9cFE3+R5
         MrnGr+F5cMeN6heFgXqxgAsMngG4Zd8fNXb2dc/tNZxpdZVhT/gy6D6jbLbMQDlfoyWp
         vz3tYaqo/RpEf0X14c0wjuXUs71xNLk9SLxZmz403GJ80SfoXVr4hkVH5aJkGbCXm/ml
         yDUQ==
X-Gm-Message-State: AOJu0Yzj8O0cet9RcD1Z0xR0XuGRtQzeao6vqtUtRtock+SsacJBoFG/
	kVtryNMMYK3Ance/GMdvyMKNNI99xIxVw0axo/tVUGF5/uks+DuvJzqxyKe2NLum9ILKJXoQKOO
	hPIfI21M=
X-Gm-Gg: ASbGncvl+kcmVNZD3FRJNRDGvZFGSrAwXB3Vc3P9+CTo7gGR/MsNJ4j7G/kCe8T2Tmp
	ZsXUyVLwN1tb98orIgz+MaHgmot0fQX3lv5tqU7v1Hdri12ID8TeMxaGj+2/TxTAoBII62f+fIe
	O7F1If6Vhz5fWv5zv0uixMB1qIR4E8YMGlkyGK3b/WrxztwktmVpwdtgBivEH1POAfy8Z8Oippa
	OXN4uFj/RAQ4ez4NLMwlctZybH4j/a21qJYnYjBYrVy48NDu9YR3zs0n8S+NZundwOKF8VNCRhI
	GWjzUXqoUzfBJL+HQSxWMoaOwwxqCxOth+MfAB79MDGdbCwUBApktrYaaO6UBtaGy275uyFy+wp
	ERZ0ClNMXvygXfaIGHw8xysSx/xZUOZPJFS9TbqfX3x9KLL6Pg1FWGnzOgTJUGEUBE1aOKvj92m
	nR
X-Google-Smtp-Source: AGHT+IGYu93z8rD/S4ZzA0Js9mi1Yg20K9J7g4zt6O4WDVxrf7zwfkIAFpVjDibxTtyZOq96BOWg6Q==
X-Received: by 2002:a05:600c:1c98:b0:456:eab:633e with SMTP id 5b1f17b1804b1-459fb4fb214mr14807545e9.17.1754684605171;
        Fri, 08 Aug 2025 13:23:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 07/22] x86/spec-ctrl: Rework init_shadow_spec_ctrl_state() to take an info pointer
Date: Fri,  8 Aug 2025 21:22:59 +0100
Message-Id: <20250808202314.1045968-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We're going to want to reuse it for a remote stack shortly.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/spec_ctrl.h | 4 +---
 xen/arch/x86/setup.c                 | 2 +-
 xen/arch/x86/smpboot.c               | 2 +-
 xen/arch/x86/spec_ctrl.c             | 2 +-
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index 6724d3812029..3d92928f9439 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -99,10 +99,8 @@ extern bool opt_bp_spec_reduce;
  */
 extern paddr_t l1tf_addr_mask, l1tf_safe_maddr;
 
-static inline void init_shadow_spec_ctrl_state(void)
+static inline void init_shadow_spec_ctrl_state(struct cpu_info *info)
 {
-    struct cpu_info *info = get_cpu_info();
-
     info->shadow_spec_ctrl = 0;
     info->xen_spec_ctrl = default_xen_spec_ctrl;
     info->scf = default_scf;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index c8c408e02436..6fb42c5a5f95 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1126,7 +1126,7 @@ void asmlinkage __init noreturn __start_xen(void)
 
     /* Critical region without exception handling.  Any fault is deadly! */
 
-    init_shadow_spec_ctrl_state();
+    init_shadow_spec_ctrl_state(info);
 
     percpu_init_areas();
 
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 302be4341bf3..ce4862dde5a7 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -332,7 +332,7 @@ void asmlinkage start_secondary(void)
     set_current(idle_vcpu[cpu]);
     this_cpu(curr_vcpu) = idle_vcpu[cpu];
     rdmsrl(MSR_EFER, this_cpu(efer));
-    init_shadow_spec_ctrl_state();
+    init_shadow_spec_ctrl_state(info);
 
     /*
      * Just as during early bootstrap, it is convenient here to disable
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index feae0d710f8e..1ff3d6835d9d 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -2226,7 +2226,7 @@ void __init init_speculation_mitigations(void)
         opt_eager_fpu = should_use_eager_fpu();
 
     /* (Re)init BSP state now that default_scf has been calculated. */
-    init_shadow_spec_ctrl_state();
+    init_shadow_spec_ctrl_state(get_cpu_info());
 
     /*
      * For microcoded IBRS only (i.e. Intel, pre eIBRS), it is recommended to
-- 
2.39.5


