Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4566F6908
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 12:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529670.824313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puWAM-0005Ba-QZ; Thu, 04 May 2023 10:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529670.824313; Thu, 04 May 2023 10:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puWAM-00058k-N5; Thu, 04 May 2023 10:26:26 +0000
Received: by outflank-mailman (input) for mailman id 529670;
 Thu, 04 May 2023 10:26:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZxo=AZ=citrix.com=prvs=48139b1ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puWAL-00058e-JM
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 10:26:25 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d772e04-ea66-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 12:26:23 +0200 (CEST)
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
X-Inumbo-ID: 1d772e04-ea66-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683195983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6RwmabpMbB9/J7uHjepa/CNpM2RIXnmAeogNAZikKco=;
  b=TuSfCwHATmp8MXXwZ5jLwzFeWl38witb2GFd9ZojyVcHgeErjcxJOybk
   GvWL8aq94kiGTt6ZZoqnGEYe/ZdYdMJVMqW9+GMdDLuoc1uSzjUsxXx3v
   MNEsbKjHgkDbONljid+KVRmTznSbY/bOhXKA7zNw2Sf5FaVyK3hoMIJ+j
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106600554
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:9DOO6anr1QDCcLvkcDm14Xno5gzwJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdCGDVPPqOZjbxLowlOd+3phgEvZSDxtcxHVQ//CpnESMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgW5AOGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eIkcQhTTj/cvvOv6o2FULhwo8clJsa+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQth/A+
 DyepzmkXnn2MvSvxRu5+GC2iNPG3j7ZWpxDPZKq+tV11Qj7Kms7V0RNCArTTeOColG6c8JSL
 QoT4CVGhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xBGIJUzpAY9wOr9ItSHoh0
 Vrhoj/yLWUx6vvPEyvbr+rK62roYkD5MFPuewcacVI9vfnM/7gilzjwcMwyDIu2iNf6TGSYL
 y+xkMQuu1kCpZdVh/7jpAqX3G3ESovhFVBsuFiONo6xxkYgPdP+OdT1gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hO0yT5FWyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUpp6lvG8TY29Dq+FM7Kih6RMmPKvpnkyNSZ8IUi0+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48g7FPf/QhnnTm7bcmin3yaPU+2OCb9pUEtbAHfMYjULcqs/G3oz
 jqoH5HUk04DDbegM3m/HEx6BQliEEXXzKve86R/HtNv6CI4cI39I5c9GY8cRrE=
IronPort-HdrOrdr: A9a23:EIk5NKEFVmwxkz/BpLqEPceALOsnbusQ8zAXPiFKOHlom6mj/P
 xG88526faZslkssQgb6K690cq7MBHhHPxOgbX5Zo3SODUO0VHAROsO0WKF+VPd8kbFh41gPM
 lbEpSWAueAamSTqq7BkXDIa6dasaO62ZHtpsPXz3JgVmhRGt1dBn9Ce3um+pMffnghOXIAfK
 DsmfavDADQCEgqUg==
X-Talos-CUID: =?us-ascii?q?9a23=3AAJbbVWsZBulxo2xCSbnbbm+D6Is7TiTlklf/fHa?=
 =?us-ascii?q?pEExWdqfEVXqT/qlrxp8=3D?=
X-Talos-MUID: 9a23:outa3ATo0obGXgzrRXTciBBePtVy7ZinS10vk4tXkuaWOQdvbmI=
X-IronPort-AV: E=Sophos;i="5.99,249,1677560400"; 
   d="scan'208";a="106600554"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2] x86/ucode: Refresh raw CPU policy after microcode load
Date: Thu, 4 May 2023 11:26:07 +0100
Message-ID: <20230504102607.3078223-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230503185813.3050382-1-andrew.cooper3@citrix.com>
References: <20230503185813.3050382-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Loading microcode can cause new features to appear.  This has happened
routinely since Spectre/Meltdown, and even the presence of new status bits can
sometimes mean the administrator has no further actions to perform.

Conversely, loading microcode can occasionally cause features to disappear.
As with livepatching, it is very much the administrators responsibility to
confirm that a late microcode load is safe on the intended system before
rolling it out in production.

Refresh the raw CPU policy after late microcode load appears to have done
something, so xen-cpuid can reflect the updated state of the system.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

This is also the first step of being able to livepatch support for new
functionality in microcode.

v2:
 * Discuss disappearing features in the commit message
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


