Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4296F5EBA
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 20:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529455.823886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puHgL-0001Yb-I7; Wed, 03 May 2023 18:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529455.823886; Wed, 03 May 2023 18:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puHgL-0001Wv-F3; Wed, 03 May 2023 18:58:29 +0000
Received: by outflank-mailman (input) for mailman id 529455;
 Wed, 03 May 2023 18:58:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZlPw=AY=citrix.com=prvs=4803f4e7c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puHgJ-0001Wp-Sn
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 18:58:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a7728d0-e9e4-11ed-b226-6b7b168915f2;
 Wed, 03 May 2023 20:58:25 +0200 (CEST)
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
X-Inumbo-ID: 7a7728d0-e9e4-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683140305;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TZ0uzHXRe5NFf4mFFjml7I3UzuX0lFxn2xNYPMCq6gY=;
  b=a2QIiL5KdIyMuroyjjK4+MXSGFEJrKCyxdl/o1kLvWMN8s4I4ueCjYP4
   hCIxpASNXch9cBuWjPq7TbUVUQm3jqQuT/IR3X2LtedyIa8D522MjNqlc
   poCq2jo6+9VHIpr75H0oSgbw+btwuw0iL5hx6j87QVvK8IGFpIjc7hrUu
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110204666
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:8svK163+VERbbQF1EPbD5atxkn2cJEfYwER7XKvMYLTBsI5bpzMFx
 mAbWDvTaPePazb1L951OYS2pk8Gvp6Hx9I3Hlc4pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gFmPqgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfDGhBx
 P40JyI0X1OGl9Ob7L/mb+J+mZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJwNxB7E+
 DyYl4j/KjQBJMSazzPYyy2Pr8PMrA/cdZ0dJqLto5aGh3XMnzdOWXX6T2CTvv2RmkO4HdVFJ
 CQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooL2yQuEAmkPThZadccr8sQxQFQXO
 kShxo2zQ2Y16fvMFCzbr+3Pxd+vBcQLBWILah4GYQQX2uigpZECoz7CE/NoArHg27UZBgrML
 yC2QDkW3utD1pZSjfXkojgrkBr3+MGXE1ddChH/Gzv8s1gnPNPNi5mAswCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83oJrW7FF4aLJ9w43d2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSX6NvcqON/oUZ5zncAM8OjYug38NIISMvCdiifelM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4nNEiT9xLvH711+eZylkgDKZb7GciT5w65yoCXeHP9Ye5DaDNimMhltvLbyOgUm
 v4DX/a3J+J3CbCnPnWKqtZMdTjn7xETXPjLliCeTcbbSiIOJY3rI6W5LW8JE2C9o5loqw==
IronPort-HdrOrdr: A9a23:5hNiYKgNQUymdnn2984wpRfx6XBQXuQji2hC6mlwRA09TyX4ra
 GTdZEgvnXJYVkqKRIdcLy7VZVoOEmsk6KdgrN+AV7BZmXbUQKTRelfBeGL+UyYJ8SUzIFgPM
 lbE5SXBLXLfDpHZcuT2njeLz4rqOP3lZxBio/lvhNQcT0=
X-Talos-CUID: 9a23:RltK3GEu6OG/keIfqmJq/UElGOwqYETsj3LAEmKUBDtMQ6+KHAo=
X-Talos-MUID: 9a23:Yh4tvwVtzxDBkFbq/Br3lClnMs412vuNIWwOoLkhltaLBzMlbg==
X-IronPort-AV: E=Sophos;i="5.99,248,1677560400"; 
   d="scan'208";a="110204666"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/ucode: Refresh raw CPU policy after microcode load
Date: Wed, 3 May 2023 19:58:13 +0100
Message-ID: <20230503185813.3050382-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Loading microcode can cause new features to appear.  This has happened
routinely since Spectre/Meltdown, and even the presence of new status bits can
mean the administrator has no further work to perform.

Refresh the raw CPU policy after late microcode load, so xen-cpuid can reflect
the updated state of the system.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

This is also the first step of being able to livepatch support for new
functionality in microcode.
---
 xen/arch/x86/cpu-policy.c             | 6 +++---
 xen/arch/x86/cpu/microcode/core.c     | 4 ++++
 xen/arch/x86/include/asm/cpu-policy.h | 6 ++++++
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index a58bf6cad54e..ef6a2d0d180a 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -15,7 +15,7 @@
 #include <asm/setup.h>
 #include <asm/xstate.h>
 
-struct cpu_policy __ro_after_init     raw_cpu_policy;
+struct cpu_policy __read_mostly       raw_cpu_policy;
 struct cpu_policy __ro_after_init    host_cpu_policy;
 #ifdef CONFIG_PV
 struct cpu_policy __ro_after_init  pv_max_cpu_policy;
@@ -343,7 +343,7 @@ static void recalculate_misc(struct cpu_policy *p)
     }
 }
 
-static void __init calculate_raw_policy(void)
+void calculate_raw_cpu_policy(void)
 {
     struct cpu_policy *p = &raw_cpu_policy;
 
@@ -655,7 +655,7 @@ static void __init calculate_hvm_def_policy(void)
 
 void __init init_guest_cpu_policies(void)
 {
-    calculate_raw_policy();
+    calculate_raw_cpu_policy();
     calculate_host_policy();
 
     if ( IS_ENABLED(CONFIG_PV) )
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 61cd36d601d6..cd456c476fbf 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -34,6 +34,7 @@
 #include <xen/watchdog.h>
 
 #include <asm/apic.h>
+#include <asm/cpu-policy.h>
 #include <asm/delay.h>
 #include <asm/nmi.h>
 #include <asm/processor.h>
@@ -677,6 +678,9 @@ static long cf_check microcode_update_helper(void *data)
         spin_lock(&microcode_mutex);
         microcode_update_cache(patch);
         spin_unlock(&microcode_mutex);
+
+        /* Refresh the raw CPU policy, in case the features have changed. */
+        calculate_raw_cpu_policy();
     }
     else
         microcode_free_patch(patch);
diff --git a/xen/arch/x86/include/asm/cpu-policy.h b/xen/arch/x86/include/asm/cpu-policy.h
index b361537a602b..99d5a8e67eeb 100644
--- a/xen/arch/x86/include/asm/cpu-policy.h
+++ b/xen/arch/x86/include/asm/cpu-policy.h
@@ -24,4 +24,10 @@ void init_dom0_cpuid_policy(struct domain *d);
 /* Clamp the CPUID policy to reality. */
 void recalculate_cpuid_policy(struct domain *d);
 
+/*
+ * Collect the raw CPUID and MSR values.  Called during boot, and after late
+ * microcode loading.
+ */
+void calculate_raw_cpu_policy(void);
+
 #endif /* X86_CPU_POLICY_H */
-- 
2.30.2


