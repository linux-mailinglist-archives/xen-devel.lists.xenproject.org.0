Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A3589D8E0
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 14:07:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702356.1097345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruAFz-0000LF-77; Tue, 09 Apr 2024 12:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702356.1097345; Tue, 09 Apr 2024 12:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruAFz-0000Ip-3j; Tue, 09 Apr 2024 12:07:19 +0000
Received: by outflank-mailman (input) for mailman id 702356;
 Tue, 09 Apr 2024 12:07:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V9ji=LO=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1ruAFw-0000Ia-RR
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 12:07:16 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2c7a290-f669-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 14:07:14 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 132C81E2479;
 Tue,  9 Apr 2024 08:07:12 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 0A65F1E2478;
 Tue,  9 Apr 2024 08:07:12 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id E7D171E2476;
 Tue,  9 Apr 2024 08:07:10 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: b2c7a290-f669-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=M+0ThZwlLi1+QZQgDEh1pzvFM7wGP/1Yeg/Srys7x2w=; b=e18S
	kcu987qyVXn3HEQ3VXcfD4ahPPcP5TVOOAAws2wHM3SvkDAy2JzBBsIRPYxQtUNQ
	nr+LS1iK9SXpc5xcj0UJQzmK98oWOyfa7PGy44J4r2EWw30gRTPSxvIgCRUSwYoc
	YzLECqfxkIrhyhCrrpFIQOIWsJXIR1c3GJaAE7Q=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH V2] x86/MCE: move intel mcheck init code to separate file
Date: Tue,  9 Apr 2024 15:06:45 +0300
Message-Id: <20240409120645.2948405-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 B1C67DA0-F669-11EE-A362-78DCEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Separate Intel nonfatal MCE initialization code from generic MCE code, th=
e same
way it is done for AMD code. This is to be able to later make intel/amd M=
CE
code optional in the build.

Convert to Xen coding style. Clean up unused includes. Remove seemingly
outdated comment about MCE check period.

No functional change intended.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/cpu/mcheck/Makefile         |  1 +
 xen/arch/x86/cpu/mcheck/intel-nonfatal.c | 85 ++++++++++++++++++++++++
 xen/arch/x86/cpu/mcheck/mce.h            |  1 +
 xen/arch/x86/cpu/mcheck/non-fatal.c      | 82 +----------------------
 4 files changed, 88 insertions(+), 81 deletions(-)
 create mode 100644 xen/arch/x86/cpu/mcheck/intel-nonfatal.c

V2:
 * convert to Xen coding style
 * file naming
 * drop outdated comment

diff --git a/xen/arch/x86/cpu/mcheck/Makefile b/xen/arch/x86/cpu/mcheck/M=
akefile
index 0d63ff9096..f927f10b4d 100644
--- a/xen/arch/x86/cpu/mcheck/Makefile
+++ b/xen/arch/x86/cpu/mcheck/Makefile
@@ -2,6 +2,7 @@ obj-y +=3D amd_nonfatal.o
 obj-y +=3D mce_amd.o
 obj-y +=3D mcaction.o
 obj-y +=3D barrier.o
+obj-y +=3D intel-nonfatal.o
 obj-y +=3D mctelem.o
 obj-y +=3D mce.o
 obj-y +=3D mce-apei.o
diff --git a/xen/arch/x86/cpu/mcheck/intel-nonfatal.c b/xen/arch/x86/cpu/=
mcheck/intel-nonfatal.c
new file mode 100644
index 0000000000..e18e8a4030
--- /dev/null
+++ b/xen/arch/x86/cpu/mcheck/intel-nonfatal.c
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Non Fatal Machine Check Exception Reporting
+ * (C) Copyright 2002 Dave Jones. <davej@codemonkey.org.uk>
+ */
+
+#include <xen/event.h>
+
+#include "mce.h"
+#include "vmce.h"
+
+static struct timer mce_timer;
+
+#define MCE_PERIOD MILLISECS(8000)
+#define MCE_PERIOD_MIN MILLISECS(2000)
+#define MCE_PERIOD_MAX MILLISECS(16000)
+
+static uint64_t period =3D MCE_PERIOD;
+static int adjust =3D 0;
+static int variable_period =3D 1;
+
+static void cf_check mce_checkregs(void *info)
+{
+    mctelem_cookie_t mctc;
+    struct mca_summary bs;
+    static uint64_t dumpcount =3D 0;
+
+    mctc =3D mcheck_mca_logout(MCA_POLLER, this_cpu( poll_bankmask),
+                             &bs, NULL);
+
+    if ( bs.errcnt && mctc !=3D NULL )
+    {
+        adjust++;
+
+        /* If Dom0 enabled the VIRQ_MCA event, then notify it.
+         * Otherwise, if dom0 has had plenty of time to register
+         * the virq handler but still hasn't then dump telemetry
+         * to the Xen console.  The call count may be incremented
+         * on multiple cpus at once and is indicative only - just
+         * a simple-minded attempt to avoid spamming the console
+         * for corrected errors in early startup.
+         */
+
+        if ( dom0_vmce_enabled() )
+        {
+            mctelem_commit(mctc);
+            send_global_virq(VIRQ_MCA);
+        }
+        else if ( ++dumpcount >=3D 10 )
+        {
+            x86_mcinfo_dump((struct mc_info *)mctelem_dataptr(mctc));
+            mctelem_dismiss(mctc);
+        }
+        else
+            mctelem_dismiss(mctc);
+    }
+    else if ( mctc !=3D NULL )
+        mctelem_dismiss(mctc);
+}
+
+static void cf_check mce_work_fn(void *data)
+{
+    on_each_cpu(mce_checkregs, NULL, 1);
+
+    if ( variable_period )
+    {
+        if ( adjust )
+            period /=3D (adjust + 1);
+        else
+            period *=3D 2;
+        if ( period > MCE_PERIOD_MAX )
+            period =3D MCE_PERIOD_MAX;
+        if ( period < MCE_PERIOD_MIN )
+            period =3D MCE_PERIOD_MIN;
+    }
+
+    set_timer(&mce_timer, NOW() + period);
+    adjust =3D 0;
+}
+
+void __init intel_nonfatal_mcheck_init(struct cpuinfo_x86 *unused)
+{
+    init_timer(&mce_timer, mce_work_fn, NULL, 0);
+    set_timer(&mce_timer, NOW() + MCE_PERIOD);
+}
diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.=
h
index 7f26afae23..4806405f96 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -47,6 +47,7 @@ enum mcheck_type amd_mcheck_init(const struct cpuinfo_x=
86 *c, bool bsp);
 enum mcheck_type intel_mcheck_init(struct cpuinfo_x86 *c, bool bsp);
=20
 void amd_nonfatal_mcheck_init(struct cpuinfo_x86 *c);
+void intel_nonfatal_mcheck_init(struct cpuinfo_x86 *c);
=20
 extern unsigned int firstbank;
 extern unsigned int ppin_msr;
diff --git a/xen/arch/x86/cpu/mcheck/non-fatal.c b/xen/arch/x86/cpu/mchec=
k/non-fatal.c
index 1c0c32ba08..33cacd15c2 100644
--- a/xen/arch/x86/cpu/mcheck/non-fatal.c
+++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
@@ -7,84 +7,7 @@
  *
  */
=20
-#include <xen/init.h>
-#include <xen/types.h>
-#include <xen/kernel.h>
-#include <xen/smp.h>
-#include <xen/timer.h>
-#include <xen/errno.h>
-#include <xen/event.h>
-#include <xen/sched.h>
-#include <asm/processor.h>=20
-#include <asm/system.h>
-#include <asm/msr.h>
-
 #include "mce.h"
-#include "vmce.h"
-
-static struct timer mce_timer;
-
-#define MCE_PERIOD MILLISECS(8000)
-#define MCE_PERIOD_MIN MILLISECS(2000)
-#define MCE_PERIOD_MAX MILLISECS(16000)
-
-static uint64_t period =3D MCE_PERIOD;
-static int adjust =3D 0;
-static int variable_period =3D 1;
-
-static void cf_check mce_checkregs(void *info)
-{
-	mctelem_cookie_t mctc;
-	struct mca_summary bs;
-	static uint64_t dumpcount =3D 0;
-
-	mctc =3D mcheck_mca_logout(MCA_POLLER, this_cpu(poll_bankmask),
-				 &bs, NULL);
-
-	if (bs.errcnt && mctc !=3D NULL) {
-		adjust++;
-
-		/* If Dom0 enabled the VIRQ_MCA event, then notify it.
-		 * Otherwise, if dom0 has had plenty of time to register
-		 * the virq handler but still hasn't then dump telemetry
-		 * to the Xen console.  The call count may be incremented
-		 * on multiple cpus at once and is indicative only - just
-		 * a simple-minded attempt to avoid spamming the console
-		 * for corrected errors in early startup.
-		 */
-
-		if (dom0_vmce_enabled()) {
-			mctelem_commit(mctc);
-			send_global_virq(VIRQ_MCA);
-		} else if (++dumpcount >=3D 10) {
-			x86_mcinfo_dump((struct mc_info *)mctelem_dataptr(mctc));
-			mctelem_dismiss(mctc);
-		} else {
-			mctelem_dismiss(mctc);
-		}
-	} else if (mctc !=3D NULL) {
-		mctelem_dismiss(mctc);
-	}
-}
-
-static void cf_check mce_work_fn(void *data)
-{=20
-	on_each_cpu(mce_checkregs, NULL, 1);
-
-	if (variable_period) {
-		if (adjust)
-			period /=3D (adjust + 1);
-		else
-			period *=3D 2;
-		if (period > MCE_PERIOD_MAX)
-			period =3D MCE_PERIOD_MAX;
-		if (period < MCE_PERIOD_MIN)
-			period =3D MCE_PERIOD_MIN;
-	}
-
-	set_timer(&mce_timer, NOW() + period);
-	adjust =3D 0;
-}
=20
 static int __init cf_check init_nonfatal_mce_checker(void)
 {
@@ -106,13 +29,10 @@ static int __init cf_check init_nonfatal_mce_checker=
(void)
 		/* Assume we are on K8 or newer AMD or Hygon CPU here */
 		amd_nonfatal_mcheck_init(c);
 		break;
-
 	case X86_VENDOR_INTEL:
-		init_timer(&mce_timer, mce_work_fn, NULL, 0);
-		set_timer(&mce_timer, NOW() + MCE_PERIOD);
+		intel_nonfatal_mcheck_init(c);
 		break;
 	}
-
 	printk(KERN_INFO "mcheck_poll: Machine check polling timer started.\n")=
;
 	return 0;
 }
--=20
2.25.1


