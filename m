Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCABD46D787
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 16:56:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242358.419221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzIl-000239-AA; Wed, 08 Dec 2021 15:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242358.419221; Wed, 08 Dec 2021 15:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzIl-0001vX-0L; Wed, 08 Dec 2021 15:56:15 +0000
Received: by outflank-mailman (input) for mailman id 242358;
 Wed, 08 Dec 2021 15:56:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J2Or=QZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1muzIj-0001LM-6e
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 15:56:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d14d6db-583f-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 16:56:11 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C6EA421891;
 Wed,  8 Dec 2021 15:56:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7F12413F91;
 Wed,  8 Dec 2021 15:56:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sDvdHZrVsGHIXwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 08 Dec 2021 15:56:10 +0000
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
X-Inumbo-ID: 5d14d6db-583f-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638978970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OHFpmR9wp02Vyhbj7JkBTr1KG9po1JxW5r7fKYlpm3I=;
	b=rQhIGyAAp5Aau9323oAldUQAEF+l4SEAMX+pUH4PEwbEgJ4Bx8qxp/hwPJeSqfidrcXzhw
	BkbpFzAy49vH0rgOd8MA+RDJX1FHeVB4Vm+mt+FQ2QqNWwPPqqx09oGX/rylxf/hpVJmUP
	vtIPDribGDwlEz08+oiiWYhBA5wxO7U=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 03/13] xen: don't include asm/hypercall.h from C sources
Date: Wed,  8 Dec 2021 16:55:56 +0100
Message-Id: <20211208155606.20029-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211208155606.20029-1-jgross@suse.com>
References: <20211208155606.20029-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of including asm/hypercall.h always use xen/hypercall.h.
Additionally include xen/hypercall.h from all sources containing a
hypercall handler.

This prepares for generating the handlers' prototypes at build time.

Add a guard in asm/hypercall.h to catch direct inclusion.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- remove platform_op hunk (Jan Beulich)
- remove including of xen/hypervisor.h from arch/x86/x86_64/mm.c
  (Jan Beulich)
- fix include order in common/compat/grant_table.c (Jan Beulich)
---
 xen/arch/arm/hvm.c                | 3 +--
 xen/arch/arm/platform_hypercall.c | 1 +
 xen/arch/x86/cpu/vpmu.c           | 1 +
 xen/arch/x86/mm.c                 | 1 -
 xen/arch/x86/platform_hypercall.c | 1 +
 xen/arch/x86/pv/iret.c            | 1 +
 xen/arch/x86/traps.c              | 2 +-
 xen/arch/x86/x86_64/compat/mm.c   | 1 +
 xen/arch/x86/x86_64/mm.c          | 2 --
 xen/common/compat/grant_table.c   | 1 +
 xen/common/compat/multicall.c     | 2 +-
 xen/common/event_channel.c        | 1 +
 xen/common/grant_table.c          | 1 +
 xen/common/multicall.c            | 1 +
 xen/include/asm-arm/hypercall.h   | 4 ++++
 xen/include/asm-x86/hypercall.h   | 4 ++++
 16 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
index 8951b34086..fc1a52767d 100644
--- a/xen/arch/arm/hvm.c
+++ b/xen/arch/arm/hvm.c
@@ -20,6 +20,7 @@
 #include <xen/lib.h>
 #include <xen/errno.h>
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/sched.h>
 #include <xen/monitor.h>
 
@@ -29,8 +30,6 @@
 #include <public/hvm/params.h>
 #include <public/hvm/hvm_op.h>
 
-#include <asm/hypercall.h>
-
 static int hvm_allow_set_param(const struct domain *d, unsigned int param)
 {
     switch ( param )
diff --git a/xen/arch/arm/platform_hypercall.c b/xen/arch/arm/platform_hypercall.c
index 8efac7ee60..403cc84324 100644
--- a/xen/arch/arm/platform_hypercall.c
+++ b/xen/arch/arm/platform_hypercall.c
@@ -9,6 +9,7 @@
 #include <xen/types.h>
 #include <xen/sched.h>
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/spinlock.h>
 #include <public/platform.h>
 #include <xsm/xsm.h>
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index 8ec4547bed..73768b09a7 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -22,6 +22,7 @@
 #include <xen/param.h>
 #include <xen/event.h>
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/sched.h>
 #include <asm/regs.h>
 #include <asm/types.h>
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 4a9ac8d5e6..4a44af7199 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -129,7 +129,6 @@
 #include <asm/ldt.h>
 #include <asm/x86_emulate.h>
 #include <asm/e820.h>
-#include <asm/hypercall.h>
 #include <asm/shared.h>
 #include <asm/mem_sharing.h>
 #include <public/memory.h>
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 284c2dfb9e..08e9ffa104 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -17,6 +17,7 @@
 #include <xen/console.h>
 #include <xen/iocap.h>
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/acpi.h>
 #include <xen/efi.h>
 #include <xen/cpu.h>
diff --git a/xen/arch/x86/pv/iret.c b/xen/arch/x86/pv/iret.c
index 90946c4629..316a23e77e 100644
--- a/xen/arch/x86/pv/iret.c
+++ b/xen/arch/x86/pv/iret.c
@@ -18,6 +18,7 @@
  */
 
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 2ddcd95dce..f8bdc57433 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -29,6 +29,7 @@
 #include <xen/lib.h>
 #include <xen/err.h>
 #include <xen/errno.h>
+#include <xen/hypercall.h>
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/console.h>
@@ -70,7 +71,6 @@
 #include <asm/x86_emulate.h>
 #include <asm/traps.h>
 #include <asm/hvm/vpt.h>
-#include <asm/hypercall.h>
 #include <asm/mce.h>
 #include <asm/apic.h>
 #include <asm/mc146818rtc.h>
diff --git a/xen/arch/x86/x86_64/compat/mm.c b/xen/arch/x86/x86_64/compat/mm.c
index 215e96aba0..13dfa94fee 100644
--- a/xen/arch/x86/x86_64/compat/mm.c
+++ b/xen/arch/x86/x86_64/compat/mm.c
@@ -1,4 +1,5 @@
 #include <xen/event.h>
+#include <xen/hypercall.h>
 #include <xen/mem_access.h>
 #include <xen/multicall.h>
 #include <compat/memory.h>
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 4f225da81e..3510a5affe 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -25,14 +25,12 @@ EMIT_FILE;
 #include <xen/numa.h>
 #include <xen/nodemask.h>
 #include <xen/guest_access.h>
-#include <xen/hypercall.h>
 #include <xen/mem_access.h>
 #include <asm/current.h>
 #include <asm/asm_defns.h>
 #include <asm/page.h>
 #include <asm/flushtlb.h>
 #include <asm/fixmap.h>
-#include <asm/hypercall.h>
 #include <asm/msr.h>
 #include <asm/pv/domain.h>
 #include <asm/setup.h>
diff --git a/xen/common/compat/grant_table.c b/xen/common/compat/grant_table.c
index ff1d678f01..989fdef65b 100644
--- a/xen/common/compat/grant_table.c
+++ b/xen/common/compat/grant_table.c
@@ -3,6 +3,7 @@
  *
  */
 
+#include <xen/hypercall.h>
 #include <compat/grant_table.h>
 
 #define xen_grant_entry_v1 grant_entry_v1
diff --git a/xen/common/compat/multicall.c b/xen/common/compat/multicall.c
index a0e9918f48..c5982baf76 100644
--- a/xen/common/compat/multicall.c
+++ b/xen/common/compat/multicall.c
@@ -4,6 +4,7 @@
 
 EMIT_FILE;
 
+#include <xen/hypercall.h>
 #include <xen/types.h>
 #include <xen/multicall.h>
 #include <xen/trace.h>
@@ -19,7 +20,6 @@ static inline void xlat_multicall_entry(struct mc_state *mcs)
         mcs->compat_call.args[i] = mcs->call.args[i];
 }
 
-DEFINE_XEN_GUEST_HANDLE(multicall_entry_compat_t);
 #define multicall_entry      compat_multicall_entry
 #define multicall_entry_t    multicall_entry_compat_t
 #define do_multicall_call    compat_multicall_call
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index da88ad141a..12006f592e 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -24,6 +24,7 @@
 #include <xen/iocap.h>
 #include <xen/compat.h>
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/keyhandler.h>
 #include <asm/current.h>
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 0262f2c48a..4d8adf7faa 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -33,6 +33,7 @@
 #include <xen/trace.h>
 #include <xen/grant_table.h>
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/domain_page.h>
 #include <xen/iommu.h>
 #include <xen/paging.h>
diff --git a/xen/common/multicall.c b/xen/common/multicall.c
index 5a199ebf8f..7b20717c88 100644
--- a/xen/common/multicall.c
+++ b/xen/common/multicall.c
@@ -9,6 +9,7 @@
 #include <xen/event.h>
 #include <xen/multicall.h>
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/perfc.h>
 #include <xen/trace.h>
 #include <asm/current.h>
diff --git a/xen/include/asm-arm/hypercall.h b/xen/include/asm-arm/hypercall.h
index cadafd76c7..ccd26c5184 100644
--- a/xen/include/asm-arm/hypercall.h
+++ b/xen/include/asm-arm/hypercall.h
@@ -1,3 +1,7 @@
+#ifndef __XEN_HYPERCALL_H__
+#error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
+#endif
+
 #ifndef __ASM_ARM_HYPERCALL_H__
 #define __ASM_ARM_HYPERCALL_H__
 
diff --git a/xen/include/asm-x86/hypercall.h b/xen/include/asm-x86/hypercall.h
index 9c0981defd..efe5963ee5 100644
--- a/xen/include/asm-x86/hypercall.h
+++ b/xen/include/asm-x86/hypercall.h
@@ -2,6 +2,10 @@
  * asm-x86/hypercall.h
  */
 
+#ifndef __XEN_HYPERCALL_H__
+#error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
+#endif
+
 #ifndef __ASM_X86_HYPERCALL_H__
 #define __ASM_X86_HYPERCALL_H__
 
-- 
2.26.2


