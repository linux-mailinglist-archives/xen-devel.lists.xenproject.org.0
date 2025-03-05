Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF90CA4F210
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 01:05:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901607.1309607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpcFx-00026I-5R; Wed, 05 Mar 2025 00:05:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901607.1309607; Wed, 05 Mar 2025 00:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpcFw-0001zx-VS; Wed, 05 Mar 2025 00:05:00 +0000
Received: by outflank-mailman (input) for mailman id 901607;
 Wed, 05 Mar 2025 00:05:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pOX7=VY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpcFw-0000xS-16
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 00:05:00 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7959ad19-f955-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 01:04:57 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43995b907cfso40095025e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 16:04:57 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd435300esm476005e9.29.2025.03.04.16.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 16:04:56 -0800 (PST)
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
X-Inumbo-ID: 7959ad19-f955-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741133097; x=1741737897; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fggL8gjJQh3WZv8LFKJP+En/Pq4iqlskBDNzkNbL1nY=;
        b=uFQTdDyFPKtk5sLIN50NLkTPhoASoR+pZNMOJDBQCuYMydXwoAKk0MepFLPLduc0fV
         LkLCBBuQ/dOFr8SfB9JmZdWmt6Fl24LiL5Xyu+J7OcNCndegGvyP/UWBcgAf52sfw2Zi
         L8MvG1UfCry9ZrChVKQVW9UD4zvfQIWC/svOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741133097; x=1741737897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fggL8gjJQh3WZv8LFKJP+En/Pq4iqlskBDNzkNbL1nY=;
        b=FOVcuxSWrx8E6tejhADpDZaqQ5saf3LWb2EYINg61d7S1uaHPSp2pPnH/5yFVp5ydr
         eI/07yeKfLkURTTLSaPxl780V+ljEGWJ4YHYbebm+zcecyT46ygBM04h9KzjwUiZ2GlU
         CxPH9Sb4vYRpHmDR/M5CVcz4CwB+zLSzyzbxLRiQKbkIEWJ8SY7yEt97Si99j9sg/+1I
         L/TZI9VNgAT885UhDqAbIXFyJiitm3AD91yZSTgyFxQyiVjYfK6n5Su8BuqKf4dywc4o
         pR0uagp/wJBmeM1RolSYvMBY662Ha0hi98GkK3lzJow2F89f88H3PNDG3iOMZ0Yds/+F
         wLbg==
X-Gm-Message-State: AOJu0YxxKgfHcB4QRUTh/wMcWb2834jzNuBjzJgtsuKGUI315yTdobWa
	HS4qTSDNaHPEqE2z8JXXIohaJKF9dgPDUwEftH1fSQu9YmY6+POdUJ54xWwdh4zPYNAAvQi9Bso
	E
X-Gm-Gg: ASbGnctZFgmm+Jum7FYx91gaUjqY3P35JIIO/VfhOrB6j8fCxL70DBUhKD9qrvLqK4c
	NDIonrknX3bJASZdI3eQ+dngvZUMTegPvLnticP1ZDOQvpt24Tw7ChXIapklZFgn/bpkNQPweJX
	wHhmwUpy3pstbjxtzPrQyO5NduUH5JZyCuYOvjJTppcvtj+lCQ9tcUWKg7F98XZlj21Hk4LfzeH
	0Er0C4Act80qqlkFBViHBfxix4rMmrYI3sJgC1THqTmhdsmsfgM9iG2WsZM8P2yVAK1vtlIlfX9
	keGkw+309bzThLBfoaLlxmGn2S8HsmFQ9+IOXfl6+YfyhJu0QDV/zwzCyN1ZVIM9SGzd6LPNJQK
	4TghtgUyOUgxYLHxDA6pYKn8q
X-Google-Smtp-Source: AGHT+IE/t7GOoWMZzDu5WPvfmxfaav4VcwRjDgrjwEuQnt5Ss6XOdzCKh7YJr8ieVfW6KpdvCs4tgQ==
X-Received: by 2002:a05:600c:1c09:b0:439:9946:af60 with SMTP id 5b1f17b1804b1-43bd2ae76c6mr4347285e9.25.1741133096876;
        Tue, 04 Mar 2025 16:04:56 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 5/5] x86/traps: Convert pv_trap_init() to being an initcall
Date: Wed,  5 Mar 2025 00:02:47 +0000
Message-Id: <20250305000247.2772029-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250305000247.2772029-1-andrew.cooper3@citrix.com>
References: <20250305000247.2772029-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With most of pv_trap_init() being done at build time, opening of NMI_SOFTIRQ
can be a regular initcall, simplifying trap_init().

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

For Branch:

  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1684170631
  https://cirrus-ci.com/build/6590097610506240
---
 xen/arch/x86/include/asm/pv/traps.h | 4 ----
 xen/arch/x86/pv/traps.c             | 5 ++++-
 xen/arch/x86/traps.c                | 2 --
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/pv/traps.h b/xen/arch/x86/include/asm/pv/traps.h
index 404f5b169ca8..8c31d5a793c5 100644
--- a/xen/arch/x86/include/asm/pv/traps.h
+++ b/xen/arch/x86/include/asm/pv/traps.h
@@ -14,8 +14,6 @@
 
 #include <public/xen.h>
 
-void pv_trap_init(void);
-
 int pv_raise_nmi(struct vcpu *v);
 
 int pv_emulate_privileged_op(struct cpu_user_regs *regs);
@@ -32,8 +30,6 @@ static inline bool pv_trap_callback_registered(const struct vcpu *v,
 
 #include <xen/errno.h>
 
-static inline void pv_trap_init(void) {}
-
 static inline int pv_raise_nmi(struct vcpu *v) { return -EOPNOTSUPP; }
 
 static inline int pv_emulate_privileged_op(struct cpu_user_regs *regs) { return 0; }
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 932800555bca..c3c0976c440f 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -141,10 +141,13 @@ static void cf_check nmi_softirq(void)
     *v_ptr = NULL;
 }
 
-void __init pv_trap_init(void)
+static int __init cf_check pv_trap_init(void)
 {
     open_softirq(NMI_SOFTIRQ, nmi_softirq);
+
+    return 0;
 }
+__initcall(pv_trap_init);
 
 /*
  * Deliver NMI to PV guest. Return 0 on success.
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 7698fa580ef7..5addb1f903d3 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1928,8 +1928,6 @@ void __init trap_init(void)
     /* Replace early pagefault with real pagefault handler. */
     _update_gate_addr_lower(&bsp_idt[X86_EXC_PF], entry_PF);
 
-    pv_trap_init();
-
     init_ler();
 
     /* Cache {,compat_}gdt_l1e now that physically relocation is done. */
-- 
2.39.5


