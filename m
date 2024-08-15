Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90498952EE2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 15:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778063.1188135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seaKt-0001ji-NC; Thu, 15 Aug 2024 13:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778063.1188135; Thu, 15 Aug 2024 13:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seaKt-0001gR-E4; Thu, 15 Aug 2024 13:16:15 +0000
Received: by outflank-mailman (input) for mailman id 778063;
 Thu, 15 Aug 2024 13:16:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZnf=PO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1seaKr-0000wd-LN
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 13:16:13 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8adec34a-5b08-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 15:16:12 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so114859766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 06:16:12 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383947151sm100868666b.161.2024.08.15.06.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 06:16:09 -0700 (PDT)
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
X-Inumbo-ID: 8adec34a-5b08-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1723727771; x=1724332571; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLsIM2SrmEtD0ssvz4LyTonhrI43hpVd0ZLSJTvcNo0=;
        b=Iwx1MM08A0E7ivqMBNQJylYgAFX285e8HONfRqjLtKCE4bl2ViKaDUemEAVxagEa5m
         Fm+/kVVchGx5jBbjkUv+jJioW+Jx1F+ftlKSNQx8V9if4omJqqSqXeZ8dmCimDAvbq6F
         vQKn8DXrH2MWyfrhzWsDIlBoZ/vNknZOQ0QDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723727771; x=1724332571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLsIM2SrmEtD0ssvz4LyTonhrI43hpVd0ZLSJTvcNo0=;
        b=ReDOTMXcefPHqCzK+2O8vE7WS50xcVXaVwsaQNMmh1aHK2gDVAVwtJpsTSKFsfrcoe
         +0zRcXaInlldwrknZbmNd+UHj8V6+UGQU6tCkubIJ1qtV2tU91zLVvrqZ6l0yBT9AEnt
         6MnnNnIu3WPxuCp2k8lG+j39flGiZ6t9fVrMhnxmTS1NHhWNS7ycxfwxXUIJRWz+Hi5f
         iW7LrwxEBITxBIBNJU+/iZ10n6qoInCrSsogd9obXL/OxTgtzmiexPdA8FuJiMddty9N
         m51axwsi/ul9A91cSBYkLocsMEOrhTkYR/yf9A7fdUyqZ91MoEAvL+YqJOBHU4Xr0KZT
         FWZA==
X-Gm-Message-State: AOJu0YwE2BsAPQw/HZ+zb90SEWBFwlZJjwtPHDQdKDduxXoAGqU24b84
	c4dGMgxL/DV6g3xyokSrTXxhUKYSIK4INlVkfh0pBosyg1kUXD5Su9SRdIWqq0UGuqTH302nhAC
	N
X-Google-Smtp-Source: AGHT+IHORPxKwJdvktruJ61rJ3DOVaOKCkr9ECGxsH86WeIUZqjJ1Bop13+JWn+OI2b8ZILOtFetfg==
X-Received: by 2002:a17:907:e2a4:b0:a7a:b43e:86d4 with SMTP id a640c23a62f3a-a8366c4268dmr390450366b.15.1723727770979;
        Thu, 15 Aug 2024 06:16:10 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Matthew Barnes <matthew.barnes@cloud.com>
Subject: [PATCH v2 3/3] x86/pv: Address Coverity complaint in check_guest_io_breakpoint()
Date: Thu, 15 Aug 2024 14:16:00 +0100
Message-Id: <20240815131600.4037415-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240815131600.4037415-1-andrew.cooper3@citrix.com>
References: <20240815131600.4037415-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 08aacc392d86 ("x86/emul: Fix misaligned IO breakpoint behaviour in PV
guests") caused a Coverity INTEGER_OVERFLOW complaint based on the reasoning
that width could be 0.

It can't, but digging into the code generation, GCC 8 and later (bisected on
gotbolt) choose to emit a CSWITCH lookup table, and because the range (bottom
2 bits clear), it's a 16-entry lookup table.

So Coverity is correct, given that GCC did emit a (dead) logic path where
width stayed 0.

Rewrite the logic.  Introduce x86_bp_width() which compiles to a single basic
block, which replaces the switch() statement.  Take the opportunity to also
make start and width be loop-scope variables.

No practical change, but it should compile better and placate Coverity.

Fixes: 08aacc392d86 ("x86/emul: Fix misaligned IO breakpoint behaviour in PV guests")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Matthew Barnes <matthew.barnes@cloud.com>
---
 xen/arch/x86/include/asm/debugreg.h | 26 ++++++++++++++++++++++++++
 xen/arch/x86/pv/emul-priv-op.c      | 21 ++++++---------------
 2 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/include/asm/debugreg.h b/xen/arch/x86/include/asm/debugreg.h
index 969f2697aee1..cbcc3e83c3d2 100644
--- a/xen/arch/x86/include/asm/debugreg.h
+++ b/xen/arch/x86/include/asm/debugreg.h
@@ -116,4 +116,30 @@ unsigned int x86_adj_dr7_rsvd(const struct cpu_policy *p, unsigned int dr7);
 unsigned int x86_merge_dr6(const struct cpu_policy *p, unsigned int dr6,
                            unsigned int pending_dbg);
 
+/*
+ * Calculate the width of a breakpoint from its dr7 encoding.
+ *
+ * The LEN encoding in dr7 is 2 bits wide per breakpoint and encoded a mask
+ * (0, 1 and 3) for widths of 1, 2 and 4 respectively in the 32bit days.
+ *
+ * In 64bit, the unused value (2) was specified to mean a width of 8, which is
+ * great for encoding efficiency but less great for nicely calculating the
+ * width.
+ */
+static inline unsigned int x86_bp_width(unsigned int dr7, unsigned int bp)
+{
+    unsigned int raw = (dr7 >> (DR_CONTROL_SHIFT +
+                                DR_CONTROL_SIZE * bp + 2)) & 3;
+
+    /*
+     * If the top bit is set (i.e. we've got a 4 or 8), flip the bottom to
+     * reverse their order, making them sorted properly.  Then it's a simple
+     * shift to calculate the width.
+     */
+    if ( raw & 2 )
+        raw ^= 1;
+
+    return 1U << raw;
+}
+
 #endif /* _X86_DEBUGREG_H */
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 3be02d85f2fe..c89727da43ee 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -323,30 +323,21 @@ static unsigned int check_guest_io_breakpoint(struct vcpu *v,
                                               unsigned int port,
                                               unsigned int len)
 {
-    unsigned int width, i, match = 0;
-    unsigned long start;
+    unsigned int i, match = 0;
 
     if ( !v->arch.pv.dr7_emul || !(v->arch.pv.ctrlreg[4] & X86_CR4_DE) )
         return 0;
 
     for ( i = 0; i < 4; i++ )
     {
+        unsigned long start;
+        unsigned int width;
+
         if ( !(v->arch.pv.dr7_emul & (3 << (i * DR_ENABLE_SIZE))) )
             continue;
 
-        start = v->arch.dr[i];
-        width = 0;
-
-        switch ( (v->arch.dr7 >>
-                  (DR_CONTROL_SHIFT + i * DR_CONTROL_SIZE)) & 0xc )
-        {
-        case DR_LEN_1: width = 1; break;
-        case DR_LEN_2: width = 2; break;
-        case DR_LEN_4: width = 4; break;
-        case DR_LEN_8: width = 8; break;
-        }
-
-        start &= ~(width - 1UL);
+        width = x86_bp_width(v->arch.dr7, i);
+        start = v->arch.dr[i] & ~(width - 1UL);
 
         if ( (start < (port + len)) && ((start + width) > port) )
             match |= 1u << i;
-- 
2.39.2


