Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK9GEfIlomnZ0AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B135A1BEF13
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243146.1543192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74o-0002Cn-CP; Fri, 27 Feb 2026 23:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243146.1543192; Fri, 27 Feb 2026 23:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74o-00029E-6J; Fri, 27 Feb 2026 23:16:54 +0000
Received: by outflank-mailman (input) for mailman id 1243146;
 Fri, 27 Feb 2026 23:16:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vw74m-0001Do-0J
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 23:16:52 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 641b136d-1432-11f1-9ccf-f158ae23cfc8;
 Sat, 28 Feb 2026 00:16:48 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43994aa265eso1501203f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 15:16:48 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70e8e8sm9680306f8f.10.2026.02.27.15.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:16:46 -0800 (PST)
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
X-Inumbo-ID: 641b136d-1432-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1772234208; x=1772839008; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CZO8VvFJTkoemSFkzFWEvoCyFq1y2gQ5xOPrI9dn3A=;
        b=dweHs6CDlyA5ruvLcqqzr5Zu5mYbhtimbFNBp2lpIBiMIXDjKa7DrsopvcWKSNt2lH
         ODbWCWBzPbLkLnP/+ZcbSxAeP4MR9RN+AUjD9wX8ptpPP47f1agyFG7HI/d3j12dI/05
         /EyVuvt/EA0G2i+CbYWuJVK1y9kUg3BYlAS7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772234208; x=1772839008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0CZO8VvFJTkoemSFkzFWEvoCyFq1y2gQ5xOPrI9dn3A=;
        b=Tj3fXQep3FnfwEvoDFzLMI6BYuBL5xP//0wtoXcS0guckHB6nqZ7v7FM8hahGUDrhK
         4ajERYCbsDAW8Mq54uwSRBvWVjNDGBN+N+oNXmUI/6ET07Bb1m4Ofy7EfP74p2e7FD3n
         nVrXmyGWXh/KTtrPgFoqOv82MI9lquSPH/fTHiJ+GkLgH5P5tMso9D59B+cNtJgPtNRf
         KJ5oV0eq2TqqLzInPi30h4V48G1cviONL8MhwiRs6Mlm0/3uCM5Nf5hXc73h8/5a30fE
         BijuHCnO7qOP5iSHUC9XydYJFPC9MLyNAZGCL/rZYGqFakLrNwbdch9POW770QHILRRq
         IYTw==
X-Gm-Message-State: AOJu0YxKO9McFlP/WRhAsEPQWKY+0J2jfjotLVqJ4LwqgUyXhRIy7Iqw
	OVULngWr9lUSRMXWSmOx2Ra8ArYMn1vIjy/HPKm8NxK+ZnTge0gK5lgx/M5LGYSujlxjdF5Z+HV
	MyPfT
X-Gm-Gg: ATEYQzxij0quOpjKrHY/jT0jQUkNrDLuUECa1kNEY2eNmdUm/dLOtcuDZDt+dL4FO0u
	2ieoeIKaKY41qfhogoKpvOwDXGIlg9cMonogHQcjqEe3LDwKBgYn/OFiPoBu90OzjuaUJ2uHhm+
	7BgBeL/nRckCiCmAaGFjgNOnvfOH2y6dg3+P3fNfu3rHJ2RklguTBw+XUihBVbe5salxZ0mNtzH
	WPvBmfcb1aVyYUBwb7ZYiJS4SXvDbwNkiQorGv1ooQbLZEJd6CHoMiViBPh6kLW02OeuLibldLa
	ZVNHvwWK/SxEoHRfdpk8IjEyAPBUuUc9unOLeWeGg/6pLUoz1VBJUfNKaMZ2IKiCi48bURgmVXC
	alurzysNBTq4xdAV5cEMJPF0xcU0CeSQBXJP+M3svVNpqWYd6T2VpCuCuAOCSUHvbD0DEWRoE51
	g62Yx6UYZrIoSY0GgVBnbiM5L/0yblNtJeReR52pHQDfc/1LkruyxFLKTWXMbEutOQy35HVJo=
X-Received: by 2002:a05:6000:18a9:b0:439:8e2f:689e with SMTP id ffacd0b85a97d-4399de2c5demr7687079f8f.43.1772234207185;
        Fri, 27 Feb 2026 15:16:47 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 06/14] x86/traps: Don't configure Supervisor Shadow Stack tokens in FRED mode
Date: Fri, 27 Feb 2026 23:16:28 +0000
Message-Id: <20260227231636.3955109-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B135A1BEF13
X-Rspamd-Action: no action

FRED doesn't use Supervisor Shadow Stack tokens.  This means that:

 1) memguard_guard_stack() should not write Supervisor Shadow Stack Tokens.
 2) cpu_has_bug_shstk_fracture is no longer relevant when deciding whether or
    not to enable Shadow Stacks in the first place.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v4:
 * Adjust for cpu_has_bug_shstk_fracture.
 * Reworked entirely in light of the prior 3 patches.

The SDM explicitly points out the shstk fracture vs FRED case, yet PTL
enumerates CET-SSS (immunity to shstk fracture).  I can only assume that there
are other Intel CPUs with FRED but without CET-SSS.
---
 xen/arch/x86/mm.c    | 14 +++++++++++---
 xen/arch/x86/setup.c | 16 ++++++++++------
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 0d0d5292953b..4c404b6c134f 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -129,6 +129,7 @@
 #include <asm/shadow.h>
 #include <asm/shared.h>
 #include <asm/trampoline.h>
+#include <asm/traps.h>
 #include <asm/x86_emulate.h>
 
 #include <public/memory.h>
@@ -6441,8 +6442,15 @@ static void write_sss_token(unsigned long *ptr)
 
 void memguard_guard_stack(void *p)
 {
-    /* IST Shadow stacks.  4x 1k in stack page 0. */
-    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
+    ASSERT(opt_fred >= 0); /* Confirm that FRED-ness has been resolved */
+
+    /*
+     * IST Shadow stacks.  4x 1k in stack page 0.
+     *
+     * With IDT delivery, we need Supervisor Shadow Stack tokens at the base
+     * of each stack.  With FRED delivery, these no longer exist.
+     */
+    if ( IS_ENABLED(CONFIG_XEN_SHSTK) && !opt_fred )
     {
         write_sss_token(p + (IST_MCE * IST_SHSTK_SIZE) - 8);
         write_sss_token(p + (IST_NMI * IST_SHSTK_SIZE) - 8);
@@ -6453,7 +6461,7 @@ void memguard_guard_stack(void *p)
 
     /* Primary Shadow Stack.  1x 4k in stack page 5. */
     p += PRIMARY_SHSTK_SLOT * PAGE_SIZE;
-    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
+    if ( IS_ENABLED(CONFIG_XEN_SHSTK) && !opt_fred )
         write_sss_token(p + PAGE_SIZE - 8);
 
     map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_SHSTK);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 0816a713e1c8..8e59c9801afe 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1412,15 +1412,19 @@ void asmlinkage __init noreturn __start_xen(void)
             boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
             !boot_cpu_has(X86_FEATURE_CET_SSS);
 
+        ASSERT(opt_fred >= 0); /* Confirm that FRED-ness has been resolved */
+
         /*
-         * On bare metal, assume that Xen won't be impacted by shstk
-         * fracturing problems.  Under virt, be more conservative and disable
-         * shstk by default.
+         * If FRED is in use, Supervisor Shadow Stack tokens are not used and
+         * shstk fracturing is of no consequence.  Otherwise:
+         * - On bare metal, assume that Xen won't be impacted by shstk
+         *   fracturing problems.
+         * - Under virt, be more conservative and disable shstk by default.
          */
         if ( opt_xen_shstk == -1 )
             opt_xen_shstk =
-                cpu_has_hypervisor ? !cpu_has_bug_shstk_fracture
-                                   : true;
+                opt_fred || (cpu_has_hypervisor ? !cpu_has_bug_shstk_fracture
+                                                : true);
 
         if ( opt_xen_shstk )
         {
@@ -1925,7 +1929,7 @@ void asmlinkage __init noreturn __start_xen(void)
 
     system_state = SYS_STATE_boot;
 
-    bsp_stack = cpu_alloc_stack(0);
+    bsp_stack = cpu_alloc_stack(0); /* Needs to know IDT vs FRED */
     if ( !bsp_stack )
         panic("No memory for BSP stack\n");
 
-- 
2.39.5


