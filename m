Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DAFA4275E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 17:07:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895271.1303931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmazK-0005eq-QX; Mon, 24 Feb 2025 16:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895271.1303931; Mon, 24 Feb 2025 16:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmazK-0005Za-Kz; Mon, 24 Feb 2025 16:07:22 +0000
Received: by outflank-mailman (input) for mailman id 895271;
 Mon, 24 Feb 2025 16:07:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=48j1=VP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tmazI-0004jn-PW
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 16:07:20 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c043abb-f2c9-11ef-9897-31a8f345e629;
 Mon, 24 Feb 2025 17:07:18 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-439a1e8ba83so43793845e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 08:07:18 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02d6837sm109356675e9.13.2025.02.24.08.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 08:07:17 -0800 (PST)
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
X-Inumbo-ID: 6c043abb-f2c9-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740413238; x=1741018038; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vkRGkyBus2gEBLdspjKGggtdKVPeJ87gwlguifSmpE=;
        b=NY6boNPT93eQUcy8/fvz5kUg/F/j5U5vsPQfqKLMOwWT7sT/kPFD+TK0nlxyHBK4tK
         dpO3G/Aitmt6ulB91K+ud0ICTxeGHr7ucnzT4vYqqW7CoxvolxW1CZvrLf+58+sjHXJ1
         /w8E5PkjeYdG0Azab23m+CsklWZwItc8n/wsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740413238; x=1741018038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vkRGkyBus2gEBLdspjKGggtdKVPeJ87gwlguifSmpE=;
        b=iSmq7OPvvP3E/pek5kajEhasuuDPttZiHivBbchS1UE6iDo7ANU8vuyphJSRtCOZYG
         2Ciq+SmMK+JN8A6nU6Zl5CSITnMRJHtA+fK/9D9zfAYM41CSpB29yntWT9y5vEdlYz2m
         106s80yVA8KtfngtuDZo4RZ/ws/0cp7Ija+Hhnol5sE2K1QWxg9839TF+2Bu3gBvrQ5S
         DIFkaYMVu1Mn4DormggiQI6qc5siF5eynWilYOQpntNqpxVYnnXYe/K8G2vMHS7obrCu
         ZPvlzODfJv4BbWfIdkF48P9jZCMHso0Ea1rg5klNu80booMIUh58OFfwIYbbidMVsoru
         3Cpw==
X-Gm-Message-State: AOJu0YyaLHzeK/d4kThx0Uk6u5cLLdiY1UQ2qONlv/N6tkoMrkkXjde7
	gJPHLYMg0zc81sFuO1MM7u+fTW266qnP/BM2acCkowQxCyWjaBYU95SZJlSnCnvu/HbW4CDkw14
	T
X-Gm-Gg: ASbGncs0DhJW0YZr6I88nQxMV9u+36r34EKw7iqUG9NZMmljB9SoeZfKYhDgKv0n9uV
	/5llSJOpNgbNAtomaDOlu+YwAAUSpbVcue6N0WtPEet/Q8hp3U58uH9q1PWwFAOSrAC7P/MfL3M
	Db+EgcD2JyYDLNO220dQddf1kNYvMNXogPYXJKYKGjDdvT2J3HgFxExtTfQ7K1AxHvKFiP+IAl8
	8zTn1Qe8r7HR5HWnY27IRZlei6VuIf9yQr305Sfu9XgBjK+sstMqE4V9eSI7jXAyDXKz38NtoS9
	adCdE5TlX4O1r5wZWUA9gElWQPQpdGmkMm525HYrStcKMBmakZTuYCTmcrKINPagDekrizx93I5
	qlbOF+Q==
X-Google-Smtp-Source: AGHT+IGi1zYZDpGvr8GwpT7jAKnxfA8om/IlUkaskGzi1JgviCxfXmyY3iuevrVF3OVbEwaqA8br1w==
X-Received: by 2002:a05:600c:468c:b0:439:9361:13d3 with SMTP id 5b1f17b1804b1-439aeb3767emr113331435e9.18.1740413237883;
        Mon, 24 Feb 2025 08:07:17 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 8/8] x86/traps: Convert pv_trap_init() to being an initcall
Date: Mon, 24 Feb 2025 16:05:09 +0000
Message-Id: <20250224160509.1117847-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With most of pv_trap_init() being done at build time, opening of NMI_SOFTIRQ
can be a regular initcall, simplifying trap_init().

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
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
index 5f6c9def5afb..454e0d51c596 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2138,8 +2138,6 @@ void __init trap_init(void)
     /* Replace early pagefault with real pagefault handler. */
     _update_gate_addr_lower(&bsp_idt[X86_EXC_PF], entry_PF);
 
-    pv_trap_init();
-
     init_ler();
 
     /* Cache {,compat_}gdt_l1e now that physically relocation is done. */
-- 
2.39.5


