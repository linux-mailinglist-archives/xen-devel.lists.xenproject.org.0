Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6553D4E6499
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 15:02:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294331.500441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXO28-0000MX-Tb; Thu, 24 Mar 2022 14:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294331.500441; Thu, 24 Mar 2022 14:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXO28-0000HP-KS; Thu, 24 Mar 2022 14:01:48 +0000
Received: by outflank-mailman (input) for mailman id 294331;
 Thu, 24 Mar 2022 14:01:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+IHq=UD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nXO26-0008Hr-Iq
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 14:01:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eff0a275-ab7a-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 15:01:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F2EBA1F7AB;
 Thu, 24 Mar 2022 14:01:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA1F112FF7;
 Thu, 24 Mar 2022 14:01:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aHNqKMd5PGKeegAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 24 Mar 2022 14:01:43 +0000
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
X-Inumbo-ID: eff0a275-ab7a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648130504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5mtqAMNr8OnZCIluhdmu2mn+mdvj3eFi+QDrjZGUlAY=;
	b=QeDU4PhiWD2H7srar5oXoO7DtBi9L9zig5uICtfJwR2FNy92gUb5q/mZzWgE829p8yfI5W
	9auEXWBwdApk7B8fN/qBe7VwzJM8w31HSvx16Rz/2DX9eT8sSZgraIxOKAaAYhHl/FsX2a
	Te/HXth6biT7S9eQCqrpcqVWmd5t1gQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 3/9] xen: don't include asm/hypercall.h from C sources
Date: Thu, 24 Mar 2022 15:01:33 +0100
Message-Id: <20220324140139.5899-4-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220324140139.5899-1-jgross@suse.com>
References: <20220324140139.5899-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of including asm/hypercall.h always use xen/hypercall.h.
Additionally include xen/hypercall.h from all sources containing a
hypercall handler.

This prepares for generating the handlers' prototypes at build time.

Add a guard in asm/hypercall.h to catch direct inclusion.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com> # arm
---
V2:
- remove platform_op hunk (Jan Beulich)
- remove including of xen/hypervisor.h from arch/x86/x86_64/mm.c
  (Jan Beulich)
- fix include order in common/compat/grant_table.c (Jan Beulich)
---
 xen/arch/arm/hvm.c                   | 3 +--
 xen/arch/arm/include/asm/hypercall.h | 4 ++++
 xen/arch/arm/platform_hypercall.c    | 1 +
 xen/arch/x86/cpu/vpmu.c              | 1 +
 xen/arch/x86/include/asm/hypercall.h | 4 ++++
 xen/arch/x86/mm.c                    | 1 -
 xen/arch/x86/platform_hypercall.c    | 1 +
 xen/arch/x86/pv/iret.c               | 1 +
 xen/arch/x86/traps.c                 | 2 +-
 xen/arch/x86/x86_64/compat/mm.c      | 1 +
 xen/arch/x86/x86_64/mm.c             | 2 --
 xen/common/compat/grant_table.c      | 1 +
 xen/common/event_channel.c           | 1 +
 xen/common/grant_table.c             | 1 +
 xen/common/multicall.c               | 1 +
 15 files changed, 19 insertions(+), 6 deletions(-)

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
diff --git a/xen/arch/arm/include/asm/hypercall.h b/xen/arch/arm/include/asm/hypercall.h
index fac4d60f17..8182895358 100644
--- a/xen/arch/arm/include/asm/hypercall.h
+++ b/xen/arch/arm/include/asm/hypercall.h
@@ -1,3 +1,7 @@
+#ifndef __XEN_HYPERCALL_H__
+#error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
+#endif
+
 #ifndef __ASM_ARM_HYPERCALL_H__
 #define __ASM_ARM_HYPERCALL_H__
 
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
index 4fedc7c570..51d171615f 100644
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
diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index 49973820af..81ca25f7b3 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -2,6 +2,10 @@
  * asm-x86/hypercall.h
  */
 
+#ifndef __XEN_HYPERCALL_H__
+#error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
+#endif
+
 #ifndef __ASM_X86_HYPERCALL_H__
 #define __ASM_X86_HYPERCALL_H__
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 2befd0c191..6cc73187ac 100644
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
index b91ccff589..eeb4f7a20e 100644
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
index 55eb6a63bd..58de9f7922 100644
--- a/xen/arch/x86/pv/iret.c
+++ b/xen/arch/x86/pv/iret.c
@@ -18,6 +18,7 @@
  */
 
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 8659547970..4c38f6c015 100644
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
index b3da8fafbb..70b08a832a 100644
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
index c6199e8918..d5787e3719 100644
--- a/xen/common/compat/grant_table.c
+++ b/xen/common/compat/grant_table.c
@@ -3,6 +3,7 @@
  *
  */
 
+#include <xen/hypercall.h>
 #include <compat/grant_table.h>
 
 #define xen_grant_entry_v1 grant_entry_v1
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index ffb042a241..0a82eb3ac2 100644
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
index 1e0762b064..febbe12eab 100644
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
index e48f46dbe0..9db49092b4 100644
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
-- 
2.34.1


