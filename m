Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94155952EE3
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 15:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778061.1188119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seaKs-0001DY-45; Thu, 15 Aug 2024 13:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778061.1188119; Thu, 15 Aug 2024 13:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seaKr-0001Ar-Vx; Thu, 15 Aug 2024 13:16:13 +0000
Received: by outflank-mailman (input) for mailman id 778061;
 Thu, 15 Aug 2024 13:16:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZnf=PO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1seaKq-0000wG-56
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 13:16:12 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89ae9865-5b08-11ef-a505-bb4a2ccca743;
 Thu, 15 Aug 2024 15:16:10 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7ab5fc975dso104308166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 06:16:10 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383947151sm100868666b.161.2024.08.15.06.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 06:16:07 -0700 (PDT)
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
X-Inumbo-ID: 89ae9865-5b08-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1723727769; x=1724332569; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXB1cqrzG0ayFT32zCt0qauALpoTTusQsO7LDnR/lNA=;
        b=Z/MsgLYWPjzZ1Plho9muooR44K3I4F551VxDnLBo112Aktlk3aZnhKhcSW9C3EUxTX
         D349vCmTTVXAYkGTbW5/7EpR0CLGmhWncfZcXSHHNjrNV6dZf5HFMSL6dRLuWqxdqoc5
         j+gQ6Oqdh26j9iyxSN44rhwy+nwnm1snYRk2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723727769; x=1724332569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXB1cqrzG0ayFT32zCt0qauALpoTTusQsO7LDnR/lNA=;
        b=RhRQG0uujQnwVDKee1uKbUsoEXKctJ5OtlMvLdIwnqd6weMB6wyXn4UffRKLtnFBkA
         U0ZwRwKJ2vmbfEf+PBuiUrcazLOIAN/oP2vyAOuxgiSptnkF2GK8Z3V/wfJzx6GoF0BB
         yryRBvi2UDlENG7Yo478sBAsq5noRZnt2kIU9rJP80G7BLnk9UpLmTJf38aamApILtQJ
         r3VsxNwqQBKCbQt0WCpow521zewB6Ekv9RgZlR7so18Iu9Xc7beegEtfljYiKEy1FRtD
         1Cx5VORHrkgUMfb87pR8vkdSfzvFJGRxRHivhKhwF/x3iRc6O/gPZxhrsTC7B/y4ofQO
         Dwfw==
X-Gm-Message-State: AOJu0YzfO6wdQIWPcjnoMN+XccDTwGuiHF7iDWedxfeka4D3VUzBTWec
	aypFENemmYR/HRw0jrH8MEV3kkjRb2NP/AJ4jeiw0pWDbWMmqcxRTDP2vtNVVOKRyRiFML6+GFH
	f
X-Google-Smtp-Source: AGHT+IFV5dX+MwhHd9oJRxpgf4lcz7LQU+DGTGIlc1EoxXfzjmfYx+hQ6/uhXhOpJYI63eiyg2w88Q==
X-Received: by 2002:a17:907:f71a:b0:a7a:a46e:dc37 with SMTP id a640c23a62f3a-a8367049c2emr439509166b.57.1723727768739;
        Thu, 15 Aug 2024 06:16:08 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH v2 1/3] x86/pv: Introduce x86_merge_dr6() and fix do_debug()
Date: Thu, 15 Aug 2024 14:15:58 +0100
Message-Id: <20240815131600.4037415-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240815131600.4037415-1-andrew.cooper3@citrix.com>
References: <20240815131600.4037415-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Pretty much everywhere in Xen the logic to update %dr6 when injecting #DB is
buggy.  The architectural behaviour is to overwrite B{0..3} (rather than
accumulate) and accumulate all other bits.

Introduce a new x86_merge_dr6() helper, and start fixing the mess by adjusting
the dr6 merge in do_debug().  Also correct the comment.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Rebase (~6y worth)
 * Split PV changes out of joint HVM patch.

In some theoretical future where deubgging is implemented in terms of
introspection even for PV guests, the TODO will complete itself.
---
 xen/arch/x86/debug.c                 | 20 ++++++++++++++++++++
 xen/arch/x86/include/asm/debugreg.h  |  8 ++++++++
 xen/arch/x86/include/asm/x86-defns.h |  7 +++++++
 xen/arch/x86/traps.c                 | 10 +++++++---
 4 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/debug.c b/xen/arch/x86/debug.c
index 127fe83021cd..429752b8cc83 100644
--- a/xen/arch/x86/debug.c
+++ b/xen/arch/x86/debug.c
@@ -2,12 +2,32 @@
 /*
  * Copyright (C) 2023 XenServer.
  */
+#include <xen/bug.h>
 #include <xen/kernel.h>
 
 #include <xen/lib/x86/cpu-policy.h>
 
 #include <asm/debugreg.h>
 
+unsigned int x86_merge_dr6(const struct cpu_policy *p, unsigned int dr6,
+                           unsigned int pending_dbg)
+{
+    /* Flip dr6 to have positive polarity. */
+    dr6 ^= X86_DR6_DEFAULT;
+
+    /* Sanity check that only known values are passed in. */
+    ASSERT(!(dr6 & ~X86_DR6_KNOWN_MASK));
+    ASSERT(!(pending_dbg & ~X86_DR6_KNOWN_MASK));
+
+    /* Breakpoints 0-3 overridden.  Others accumulate. */
+    dr6 = (dr6 & ~X86_DR6_BP_MASK) | pending_dbg;
+
+    /* Flip dr6 back to having default polarity. */
+    dr6 ^= X86_DR6_DEFAULT;
+
+    return x86_adj_dr6_rsvd(p, dr6);
+}
+
 unsigned int x86_adj_dr6_rsvd(const struct cpu_policy *p, unsigned int dr6)
 {
     unsigned int ones = X86_DR6_DEFAULT;
diff --git a/xen/arch/x86/include/asm/debugreg.h b/xen/arch/x86/include/asm/debugreg.h
index 96c406ad53c8..969f2697aee1 100644
--- a/xen/arch/x86/include/asm/debugreg.h
+++ b/xen/arch/x86/include/asm/debugreg.h
@@ -108,4 +108,12 @@ struct cpu_policy;
 unsigned int x86_adj_dr6_rsvd(const struct cpu_policy *p, unsigned int dr6);
 unsigned int x86_adj_dr7_rsvd(const struct cpu_policy *p, unsigned int dr7);
 
+/*
+ * Merging new status bits into dr6 is far from simple.  Breakpoints override,
+ * while others accumulate.  New bits to be merged are taken with positive
+ * polarity.
+ */
+unsigned int x86_merge_dr6(const struct cpu_policy *p, unsigned int dr6,
+                           unsigned int pending_dbg);
+
 #endif /* _X86_DEBUGREG_H */
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index 3bcdbaccd3aa..caa92829eaa9 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -132,6 +132,13 @@
 #define X86_DR6_ZEROS           _AC(0x00001000, UL)  /* %dr6 bits forced to 0       */
 #define X86_DR6_DEFAULT         _AC(0xffff0ff0, UL)  /* Default %dr6 value          */
 
+#define X86_DR6_BP_MASK                                 \
+    (X86_DR6_B0 | X86_DR6_B1 | X86_DR6_B2 | X86_DR6_B3)
+
+#define X86_DR6_KNOWN_MASK                                              \
+    (X86_DR6_BP_MASK | X86_DR6_BLD | X86_DR6_BD | X86_DR6_BS |          \
+     X86_DR6_BT | X86_DR6_RTM)
+
 /*
  * Debug control flags in DR7.
  */
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 552a07e6aa56..521ed4dd816d 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2016,9 +2016,13 @@ void asmlinkage do_debug(struct cpu_user_regs *regs)
         return;
     }
 
-    /* Save debug status register where guest OS can peek at it */
-    v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
-    v->arch.dr6 &= (dr6 | ~X86_DR6_DEFAULT);
+    /*
+     * Update the guest's dr6 so the debugger can peek at it.
+     * TODO: This should be passed out-of-bad to the debugger, so guest state
+     * is not corrupted by debugging actions completed behind it's back.
+     */
+    v->arch.dr6 = x86_merge_dr6(v->domain->arch.cpu_policy,
+                                v->arch.dr6, dr6 ^ X86_DR6_DEFAULT);
 
     if ( guest_kernel_mode(v, regs) && v->domain->debugger_attached )
     {
-- 
2.39.2


