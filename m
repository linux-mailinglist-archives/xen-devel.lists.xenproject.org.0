Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A699F78C654
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 15:44:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592240.924920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaz0c-000522-De; Tue, 29 Aug 2023 13:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592240.924920; Tue, 29 Aug 2023 13:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaz0c-0004yu-9i; Tue, 29 Aug 2023 13:43:54 +0000
Received: by outflank-mailman (input) for mailman id 592240;
 Tue, 29 Aug 2023 13:43:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wiqx=EO=citrix.com=prvs=598c0cf4a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qaz0a-0004TH-9J
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 13:43:52 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14bcaf1a-4672-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 15:43:50 +0200 (CEST)
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
X-Inumbo-ID: 14bcaf1a-4672-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693316630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RzbPMPugAWK+qGKTZXd+6jBqguV16fL2HCkt0+KJ7U8=;
  b=fZ6t3Pwt7HDnjJXeX+6DKTo0LBkDKV/5FIFaXk0qIK+qk+J26gH/LuVJ
   UIBhUTwEkssw4ZaRYuNxnrAmaBngXQF8JgQOHn+ORIaM5DollbT5i9o4b
   1rVVN6fuPmuXAerIvotZabLMGOqXC4zs+rNJehX1lu0mSrVfxDTPIkOA2
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 120249945
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:3fA+K6DNW3jAEBVW/wHjw5YqxClBgxIJ4kV8jS/XYbTApDwhhjZUz
 2BLCGuAMqzbYGfzeYsla9vkoB5V7MLWn4Q2QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMscpvlDs15K6p4GNC7wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw6+wvJEVzs
 s0iGnMOUUC9ldKt5JGpVbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4bSH5kEzxrFz
 o7A10j6Ais3H+a+9WGMrCup1+zmzXrXVbtHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceRz0s0
 V/PnNrvCnpsqpWaTHuc8vGfqjbaBMQOBTZcP2leF1JDuoS95thp1XojU+qPDoakhIXQPQy38
 gq47ysB14sBvdUv9LekqAWvby2XmrDFSQs85wPyV22j7x9kaIPNW7FE+WQ3/t4bct/HEwDpU
 Gws3pHHsbtQVc3leDmlGr1lIV2/2xqS3NQwa3ZLFoJpyTmi8mXLkWt4sGAnfxcB3irplFbUj
 K7vVeF5vs870JiCN/Ufj2eN5yMClPOIKDgdfqqIBueim7AoHON9wAlgZFSLw0fmm1U2nKc0N
 P+zKJj9VixGVvs+k2HqH4/xNIPHIQhkmQvuqW3TlUz7gdJymlbIIVv6DLd+Rr9gt/7VyOkk2
 91eK9GL231ivB7WO0HqHXooBQlSdxATXMmmw/G7g8bfemKK7kl9Ua6OqV7gEqQ595loehDgp
 SrjBhEFmQKi2xUq62yiMxheVV8mZr4nxVpTAMDmFQzAN6QLCWp30JoiSg==
IronPort-HdrOrdr: A9a23:vO5RUK9ym4qTvT1n1fxuk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: 9a23:rfIg2WMLA19Fe+5DSSM/0WopXfEfQD7e8yfuMX+jLUV7V+jA
X-Talos-MUID: =?us-ascii?q?9a23=3A412/Mw4k/AwLaW7UoTg7l/24xoxE4KSUJWs3sKl?=
 =?us-ascii?q?dspfdMH1zEmfEoDmOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.02,210,1688443200"; 
   d="scan'208";a="120249945"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jinoh Kang
	<jinoh.kang.kr@gmail.com>
Subject: [PATCH 2/3] x86: Introduce new debug.c for debug register infrastructure
Date: Tue, 29 Aug 2023 14:43:32 +0100
Message-ID: <20230829134333.3551243-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
References: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Broken out of the subsequent patch for clarity.

Add stub x86_adj_dr{6,7}_rsvd() functions which will be extended in the
following patch to fix bugs, and adjust debugreg.h to compile with a more
minimal set of includes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
 xen/arch/x86/Makefile               |  1 +
 xen/arch/x86/debug.c                | 19 +++++++++++++++++++
 xen/arch/x86/include/asm/debugreg.h | 11 +++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 xen/arch/x86/debug.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index e642ad6c5578..f3abdf9cd111 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -24,6 +24,7 @@ obj-y += cpuid.o
 obj-$(CONFIG_PV) += compat.o
 obj-$(CONFIG_PV32) += x86_64/compat.o
 obj-$(CONFIG_KEXEC) += crash.o
+obj-y += debug.o
 obj-y += delay.o
 obj-y += desc.o
 obj-bin-y += dmi_scan.init.o
diff --git a/xen/arch/x86/debug.c b/xen/arch/x86/debug.c
new file mode 100644
index 000000000000..9900b555d6d3
--- /dev/null
+++ b/xen/arch/x86/debug.c
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 XenServer.
+ */
+#include <xen/kernel.h>
+
+#include <xen/lib/x86/cpu-policy.h>
+
+#include <asm/debugreg.h>
+
+unsigned int x86_adj_dr6_rsvd(const struct cpu_policy *p, unsigned int dr6)
+{
+    return dr6;
+}
+
+unsigned int x86_adj_dr7_rsvd(const struct cpu_policy *p, unsigned int dr7)
+{
+    return dr7;
+}
diff --git a/xen/arch/x86/include/asm/debugreg.h b/xen/arch/x86/include/asm/debugreg.h
index 86aa6d714347..673b81ec5eda 100644
--- a/xen/arch/x86/include/asm/debugreg.h
+++ b/xen/arch/x86/include/asm/debugreg.h
@@ -77,7 +77,18 @@
     asm volatile ( "mov %%db" #reg ",%0" : "=r" (__val) );  \
     __val;                                                  \
 })
+
+struct vcpu;
 long set_debugreg(struct vcpu *, unsigned int reg, unsigned long value);
 void activate_debugregs(const struct vcpu *);
 
+struct cpu_policy;
+
+/*
+ * Architecturally dr6/7 are full GPR-width, but only the bottom 32 bits may
+ * legally be non-zero.  We avoid avoid storing the upper bits when possible.
+ */
+unsigned int x86_adj_dr6_rsvd(const struct cpu_policy *p, unsigned int dr6);
+unsigned int x86_adj_dr7_rsvd(const struct cpu_policy *p, unsigned int dr7);
+
 #endif /* _X86_DEBUGREG_H */
-- 
2.30.2


