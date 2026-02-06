Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Jd0bOPfohWkLIQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 14:13:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 511E2FDEEA
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 14:13:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223201.1530801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voLe4-0000so-GH; Fri, 06 Feb 2026 13:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223201.1530801; Fri, 06 Feb 2026 13:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voLe4-0000rG-DV; Fri, 06 Feb 2026 13:13:12 +0000
Received: by outflank-mailman (input) for mailman id 1223201;
 Fri, 06 Feb 2026 13:13:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R5re=AK=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1voLe2-0000do-OF
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 13:13:10 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 953eed7e-035d-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 14:13:09 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48327b8350dso3915035e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 05:13:09 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296c0f2esm5726244f8f.19.2026.02.06.05.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 05:13:08 -0800 (PST)
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
X-Inumbo-ID: 953eed7e-035d-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1770383589; x=1770988389; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vW8VdQJGm+HJLfdiFyEYvmbpGb/n1ANvl9UX6UaPxlQ=;
        b=cAkDeF6g4wLikJvbUOO/yEghYdLfqF+bAa1fAf7YzhZ5k44mHB3zNc3WddNM/++G4O
         eyJAZ74JbTG9tJHF4qwLe+SnmvdNzdnlCcUVbwo9+YfyXCz57bk9bZO0E7u5qkzmvylk
         ApGldOc9UB1Jbrv8Fr+N6X5jDjm7j0z5Lss90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770383589; x=1770988389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vW8VdQJGm+HJLfdiFyEYvmbpGb/n1ANvl9UX6UaPxlQ=;
        b=P3+1w3wrrmRoU5YslnOYXqMaBmAsV9kBricHaxvuFTo8i8QZM0nDvdEbin4LApOHNt
         mWILaAxFesncX77cxXbZ6uj9OgngbrciOYQwn7lgL2Tcaa+Ag36A0tQMPr5YoETu49iy
         NqUrsDk3sPPsCUPqmE2vlNLsNbfCKdb7GRNcv1YNgvq93iiI/Ti/xjVcvS1nuJjl7JFC
         QuUuEl1B99WP0kv9YLha7UVZtiHXKQdRvIYrmkO0KJXTJOVv9GRz01yonZ8KC9pgjJ2R
         byg8hxXYR/OATP+DjPjMuBjwAGB5AlLBFE53szRcpJr763D/2Dxyo5zf8LmQh/0qS9kn
         Gbrg==
X-Gm-Message-State: AOJu0YxgRWrbC4ejO6PqMTpxlDizaGA4R2kfKzhTPLlnkdChkapbsyMZ
	Eu8Wr2tstSWicX1Q7tJixf/W/cqoBPPH7JnJQ8A2ABd0e5RsKb62124chBYJGnI3Wtx9rhuBCXy
	1oIlurObPtA==
X-Gm-Gg: AZuq6aJmuEwpEGXQcz3Lvgo7JaN2eT3Ygyjk2ihEITmiFzM97ILRxalMSDVjAl0YuvG
	QSxgh/Q5PEVvSAR4ib18jZCzlM8JhS8Z9H5F1jm9AVFarsVMS8RbqI8yboZLcCOUHrNqNBmq4hv
	pxM9PHQimnbtgA+frvORmoqy4//g2yk0FrbWpphYEi72HDIPW8qYX37dXph/aRsW3jKd1WltJND
	nQaD6f7H7s9AZi/GLg/iS5Uvj6k733l2/IE0uHURSxqK0KBgTNjaDUPmlsfgN2NGVEDjETCmW6t
	7UcR/5PzuBK1gxODpIkbyn59lm1YUJ8J7t5rGeFrrPxnoiUNAoWrVvysBxdSiyMq99C4DMDGYat
	XfnYGK3nhX+zDWyDudb/feQRrcntHmmJGaJy/R6nKOwJzkhrQ6qk16XYExnVhxuX7fBQDCJ4eCb
	I/yvhQHj1ceoiZ5pwC99DGdrx2q9fxhVjVFAaZRD0EzUU5AlnVuCO9WYY4HSi/dn5w09jj6g==
X-Received: by 2002:a05:600c:470c:b0:483:103c:b1ee with SMTP id 5b1f17b1804b1-483201da9bamr41523865e9.8.1770383588708;
        Fri, 06 Feb 2026 05:13:08 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/2] x86/memtype: Deduplicate rendering of X86_MT_*
Date: Fri,  6 Feb 2026 13:13:05 +0000
Message-Id: <20260206131305.2675905-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260206131305.2675905-1-andrew.cooper3@citrix.com>
References: <20260206131305.2675905-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 511E2FDEEA
X-Rspamd-Action: no action

The MTRR infrastructure has two different copies of mtrr_attrib_to_str(), one
in .init and one in regular .text.  EPT has another variation.

All 3 are incomplete; they encode only the non-reserved values for the task,
but hiding reserved values with ?'s is detrimental to the diagnostic purpose
of these existing in the first place.

Implement a single function which covers all the architectural values.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Yes I know EPT tries to render the reserved reserved encodings numerically.
It's a cute trick, but does get foiled by the '[MTRR_NUM_TYPES] = "??";' row
which breaks things.

Putting this in traps.c isn't great, but there isn't an obviously better place
either.
---
 xen/arch/x86/cpu/mtrr/generic.c  | 21 ++++-----------------
 xen/arch/x86/cpu/mtrr/main.c     | 21 +++------------------
 xen/arch/x86/include/asm/traps.h |  1 +
 xen/arch/x86/mm/p2m-ept.c        | 22 +++-------------------
 xen/arch/x86/traps.c             | 16 ++++++++++++++++
 5 files changed, 27 insertions(+), 54 deletions(-)

diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index ad6a24f055ec..0b30689a0b99 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -13,6 +13,7 @@
 #include <asm/msr.h>
 #include <asm/mtrr.h>
 #include <asm/system.h>
+#include <asm/traps.h>
 
 #include "mtrr.h"
 
@@ -125,20 +126,6 @@ void __init get_mtrr_state(void)
 static bool __initdata mtrr_show;
 boolean_param("mtrr.show", mtrr_show);
 
-static const char *__init mtrr_attrib_to_str(mtrr_type x)
-{
-	static const char __initconst strings[MTRR_NUM_TYPES][16] =
-	{
-		[X86_MT_UC] = "uncachable",
-		[X86_MT_WC] = "write-combining",
-		[X86_MT_WT] = "write-through",
-		[X86_MT_WP] = "write-protect",
-		[X86_MT_WB] = "write-back",
-	};
-
-	return (x < ARRAY_SIZE(strings) && strings[x][0]) ? strings[x] : "?";
-}
-
 static unsigned int __initdata last_fixed_start;
 static unsigned int __initdata last_fixed_end;
 static mtrr_type __initdata last_fixed_type;
@@ -149,7 +136,7 @@ static void __init print_fixed_last(const char *level)
 		return;
 
 	printk("%s  %05x-%05x %s\n", level, last_fixed_start,
-	       last_fixed_end - 1, mtrr_attrib_to_str(last_fixed_type));
+	       last_fixed_end - 1, x86_mt_name(last_fixed_type));
 
 	last_fixed_end = 0;
 }
@@ -188,7 +175,7 @@ static void __init print_mtrr_state(const char *level)
 	int width;
 
 	printk("%sMTRR default type: %s\n", level,
-	       mtrr_attrib_to_str(mtrr_state.def_type));
+	       x86_mt_name(mtrr_state.def_type));
 	if (mtrr_state.have_fixed) {
 		const mtrr_type *fr = mtrr_state.fixed_ranges;
 		const struct fixed_range_block *block = fixed_range_blocks;
@@ -214,7 +201,7 @@ static void __init print_mtrr_state(const char *level)
 			       level, i,
 			       width, mtrr_state.var_ranges[i].base >> 12,
 			       width, mtrr_state.var_ranges[i].mask >> 12,
-			       mtrr_attrib_to_str(mtrr_state.var_ranges[i].base &
+			       x86_mt_name(mtrr_state.var_ranges[i].base &
 			                          MTRR_PHYSBASE_TYPE_MASK));
 		else
 			printk("%s  %u disabled\n", level, i);
diff --git a/xen/arch/x86/cpu/mtrr/main.c b/xen/arch/x86/cpu/mtrr/main.c
index eff0500f0d06..f11fbf1a223b 100644
--- a/xen/arch/x86/cpu/mtrr/main.c
+++ b/xen/arch/x86/cpu/mtrr/main.c
@@ -39,6 +39,7 @@
 #include <asm/msr.h>
 #include <asm/mtrr.h>
 #include <asm/processor.h>
+#include <asm/traps.h>
 
 #include "mtrr.h"
 
@@ -63,22 +64,6 @@ static bool __ro_after_init mtrr_if;
 static void set_mtrr(unsigned int reg, unsigned long base,
 		     unsigned long size, mtrr_type type);
 
-static const char *const mtrr_strings[MTRR_NUM_TYPES] =
-{
-    "uncachable",               /* 0 */
-    "write-combining",          /* 1 */
-    "?",                        /* 2 */
-    "?",                        /* 3 */
-    "write-through",            /* 4 */
-    "write-protect",            /* 5 */
-    "write-back",               /* 6 */
-};
-
-static const char *mtrr_attrib_to_str(int x)
-{
-	return (x <= 6) ? mtrr_strings[x] : "?";
-}
-
 /*  This function returns the number of variable MTRRs  */
 static void __init set_num_var_ranges(void)
 {
@@ -364,8 +349,8 @@ int mtrr_add_page(unsigned long base, unsigned long size,
 			if (types_compatible(type, ltype))
 				continue;
 			printk (KERN_WARNING "mtrr: type mismatch for %lx000,%lx000 old: %s new: %s\n",
-			     base, size, mtrr_attrib_to_str(ltype),
-			     mtrr_attrib_to_str(type));
+			     base, size, x86_mt_name(ltype),
+			     x86_mt_name(type));
 			goto out;
 		}
 		if (increment)
diff --git a/xen/arch/x86/include/asm/traps.h b/xen/arch/x86/include/asm/traps.h
index 73097e957d05..00dde631ea5b 100644
--- a/xen/arch/x86/include/asm/traps.h
+++ b/xen/arch/x86/include/asm/traps.h
@@ -19,6 +19,7 @@ void percpu_traps_init(void);
 extern unsigned int ler_msr;
 
 const char *vector_name(unsigned int vec);
+const char *x86_mt_name(unsigned int mt);
 
 #endif /* ASM_TRAP_H */
 
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 204bdb054a89..1950beb745af 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -21,6 +21,7 @@
 #include <asm/mtrr.h>
 #include <asm/p2m.h>
 #include <asm/paging.h>
+#include <asm/traps.h>
 
 #include <public/hvm/dm_op.h>
 
@@ -1489,21 +1490,6 @@ void ept_p2m_uninit(struct p2m_domain *p2m)
     free_cpumask_var(ept->invalidate);
 }
 
-static const char *memory_type_to_str(unsigned int x)
-{
-    static const char memory_types[8][3] = {
-        [X86_MT_UC]      = "UC",
-        [X86_MT_WC]      = "WC",
-        [X86_MT_WT]      = "WT",
-        [X86_MT_WP]      = "WP",
-        [X86_MT_WB]      = "WB",
-        [MTRR_NUM_TYPES] = "??",
-    };
-
-    ASSERT(x < ARRAY_SIZE(memory_types));
-    return memory_types[x][0] ? memory_types[x] : "?";
-}
-
 static void cf_check ept_dump_p2m_table(unsigned char key)
 {
     struct domain *d;
@@ -1551,14 +1537,12 @@ static void cf_check ept_dump_p2m_table(unsigned char key)
                 if ( p2m_is_pod(ept_entry->sa_p2mt) )
                     printk("gfn: %13lx order: %2d PoD\n", gfn, order);
                 else
-                    printk("gfn: %13lx order: %2d mfn: %13lx %c%c%c %c%c%c\n",
+                    printk("gfn: %13lx order: %2d mfn: %13lx %c%c%c %s%c\n",
                            gfn, order, ept_entry->mfn + 0UL,
                            ept_entry->r ? 'r' : ' ',
                            ept_entry->w ? 'w' : ' ',
                            ept_entry->x ? 'x' : ' ',
-                           memory_type_to_str(ept_entry->emt)[0],
-                           memory_type_to_str(ept_entry->emt)[1]
-                           ?: ept_entry->emt + '0',
+                           x86_mt_name(ept_entry->emt),
                            c ?: ept_entry->ipat ? '!' : ' ');
 
                 if ( !(record_counter++ % 100) )
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index f621b99a5fcc..0d951762bce2 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1044,6 +1044,22 @@ const char *vector_name(unsigned int vec)
     return (vec < ARRAY_SIZE(names) && names[vec][0]) ? names[vec] : "???";
 }
 
+const char *x86_mt_name(unsigned int mt)
+{
+    static const char names[8][4] = {
+        [X86_MT_UC]      = "UC",
+        [X86_MT_WC]      = "WC",
+        [X86_MT_RSVD_2]  = "Rs2",
+        [X86_MT_RSVD_3]  = "Rs3",
+        [X86_MT_WT]      = "WT",
+        [X86_MT_WP]      = "WP",
+        [X86_MT_WB]      = "WB",
+        [X86_MT_UCM]     = "UC-",
+    };
+
+    return mt < ARRAY_SIZE(names) ? names[mt] : "?";
+}
+
 void asmlinkage do_double_fault(struct cpu_user_regs *regs)
 {
     unsigned int cpu;
-- 
2.39.5


