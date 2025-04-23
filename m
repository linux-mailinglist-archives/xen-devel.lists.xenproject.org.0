Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B49A97BF2
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 03:03:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963783.1354775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7OVt-0002Zv-FW; Wed, 23 Apr 2025 01:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963783.1354775; Wed, 23 Apr 2025 01:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7OVt-0002WI-CB; Wed, 23 Apr 2025 01:02:57 +0000
Received: by outflank-mailman (input) for mailman id 963783;
 Wed, 23 Apr 2025 01:02:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLR5=XJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7OVr-0000o7-QY
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 01:02:55 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af6e1111-1fde-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 03:02:53 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so53142435e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 18:02:54 -0700 (PDT)
Received: from localhost.localdomain ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d2326dsm6707635e9.15.2025.04.22.18.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 18:02:52 -0700 (PDT)
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
X-Inumbo-ID: af6e1111-1fde-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745370173; x=1745974973; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LoWKMqHtqBPDLmEPFfxaswFqTNu87oQfZQ9HmGyS6OI=;
        b=mOg5wIgTIonFrTfHloaskb6MhkA1TkBb4XO66TKPJI/wApelk4ONDdGXVWpCMvreDL
         +XL3BvtdEwfrwjc7iqjwfrbe+6zdIZ6cXTGJT9KZkqUNhN1iDn2BfEGL5E2sYOapIu1B
         cuwEDGwvyOmXEDZDB8p/NzfEQvYCFSEIUg+T0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745370173; x=1745974973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LoWKMqHtqBPDLmEPFfxaswFqTNu87oQfZQ9HmGyS6OI=;
        b=rWGTj8d5MmMtMmIb8yDLy36lQ2xtAFwAC2lOY/PyVTvSyr+xoKGD47bFeD4Zk49+lP
         +M5jKLvKM3JxaWXwrIBOzQvj3E/xRAVrlXE1+AvH/eUC5aw75DpjUxiVZARU7Sfe8ynX
         AoLDSLauxWktIKBIOcB/xRdg2guGs+Mh6GrD1i/AhD4zOEdxMQCTsKfERbSG1ORCpREB
         ps5lowLu/cN7NnQfYeu7/m4c/89vgodtrLH36v3/pQ5claB7Nn5dydAwPSEWYbRmC7vv
         zYxqlAci1frDHpbhPQ38x4BS+Mw7Ryamq0AulMrocjQCTZqamDCLzTHozu+StwTKOvb8
         0yRw==
X-Gm-Message-State: AOJu0Yxc4xK0/imT1ECML5QNZ6ZnWWIL2mCB3OWv4pn35vzGtSBQiv5I
	CAWi+Y3wYxNkWKiWQ9HCJMEtscm+0yYyPf/7+nbUr/4IFdDSS8oBiwMwWbPbrKoEi7dEZiWlOuv
	/
X-Gm-Gg: ASbGncvC/j8oJW6JUn2/IOsbhfzmrCqxpPuo4RGiSo1vGMIL9ad8EX/FyB30NrD4c0V
	e4iMNFso2jnDSvuUwrbyts1Ha9DuC7bqeiPFNazsr2gtQ1zUXJEyTCwYrcEnk1AVKFnKKXja+w1
	e3dHEcU88WNwAw+fj90PwSTSQfDpIqU85xoE6258O6UFonGpIs5aQCa4hdsjgqWvR+aZ8o6W3Lk
	Rszpjc60v2LVAPsHUpIRMKiM2kaUm5qls6NPFPVnbJm5nWat69lilGQfdpKgaDGRLQy4b8WpfCo
	SFnosVIzMk6lF+wBnC+uIKfLpai08Vzp3jXrkTztkZoKu/csqjA0T2g5CnDofA==
X-Google-Smtp-Source: AGHT+IHzp4hNlxBfSm5YRXWG9V+oQpZjMac/1ALmOGUgU+tXdqLeroMdU4JaXHiFRcvBaTqZatJL9A==
X-Received: by 2002:a05:600c:5110:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-4406aba758cmr134644925e9.19.1745370173253;
        Tue, 22 Apr 2025 18:02:53 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 7/8] x86/altcall: Switch to simpler scheme
Date: Wed, 23 Apr 2025 02:02:36 +0100
Message-Id: <20250423010237.1528582-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
References: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With all the infrastructure in place, switch from using ALTERNATIVE() to
simply populating .alt_call_sites.

Before, _apply_alternatives() would devirtualise in two passes; the first
being opportunistic, and the second (signified by the force parameter) sealing
any call with a still-NULL function pointer.

Now, all devirtualising is performed together, at the point in time of the
second pass previously.  The call to seal_endbr64() needs delaying until after
apply_alt_calls() is complete, or we have a narrow window with real indirect
branches and no ENDBR64 instructions.

Under the hood, the following changes are happening:

  Section                Old size   New size   Change (%)
  .alt_call_sites               0    0x00730   +0x0730
  .altinstructions        0x1350a    0x11fe0   -0x152a (-7%)
  .altinstr_replacement   0x015f2    0x00e35   -0x07bd (-23%)

The changes aren't quite equal because inlining is affected by the smaller
asm() block.  Nevertheless, the metadata is held in 1/3 of the space, and
there are no CALL instructions held in the replacement section any more.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/alternative.c                  | 9 ++-------
 xen/arch/x86/include/asm/alternative-call.h | 9 ++++++---
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 22af224f08f7..047bfc6e424b 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -378,13 +378,6 @@ static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
         text_poke(orig, buf, total_len);
     }
 
-    /*
-     * Clobber endbr64 instructions now that altcall has finished optimising
-     * all indirect branches to direct ones.
-     */
-    if ( force && system_state < SYS_STATE_active )
-        seal_endbr64();
-
     return 0;
 }
 
@@ -533,6 +526,8 @@ static int __init cf_check nmi_apply_alternatives(
             rc = apply_alt_calls(__alt_call_sites_start, __alt_call_sites_end);
             if ( rc )
                 panic("Unable to apply alternative calls: %d\n", rc);
+
+            seal_endbr64();
         }
 
         /*
diff --git a/xen/arch/x86/include/asm/alternative-call.h b/xen/arch/x86/include/asm/alternative-call.h
index 49a04a7cc45b..bbc49a5274d9 100644
--- a/xen/arch/x86/include/asm/alternative-call.h
+++ b/xen/arch/x86/include/asm/alternative-call.h
@@ -2,7 +2,8 @@
 #ifndef X86_ALTERNATIVE_CALL_H
 #define X86_ALTERNATIVE_CALL_H
 
-#include <asm/alternative.h>
+#include <xen/macros.h>
+#include <xen/stdint.h>
 
 /* Simply the relative position of the source call. */
 struct alt_call {
@@ -86,8 +87,10 @@ struct alt_call {
     rettype ret_;                                                  \
     register unsigned long r10_ asm("r10");                        \
     register unsigned long r11_ asm("r11");                        \
-    asm volatile (ALTERNATIVE("call *%c[addr](%%rip)", "call .",   \
-                              X86_FEATURE_ALWAYS)                  \
+    asm volatile ("1: call *%c[addr](%%rip)\n\t"                   \
+                  ".pushsection .alt_call_sites, \"a\", @progbits\n\t"  \
+                  ".long 1b - .\n\t"                               \
+                  ".popsection"                                    \
                   : ALT_CALL ## n ## _OUT, "=a" (ret_),            \
                     "=r" (r10_), "=r" (r11_) ASM_CALL_CONSTRAINT   \
                   : [addr] "i" (&(func)), "g" (func)               \
-- 
2.39.5


