Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1766677D4D7
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 23:07:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584058.914540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Fz-00073s-G4; Tue, 15 Aug 2023 21:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584058.914540; Tue, 15 Aug 2023 21:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Fz-0006wV-8a; Tue, 15 Aug 2023 21:07:15 +0000
Received: by outflank-mailman (input) for mailman id 584058;
 Tue, 15 Aug 2023 21:07:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTNg=EA=citrix.com=prvs=584bb2eab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qW1Fx-0004ge-OZ
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 21:07:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3a99d6a-3baf-11ee-9b0c-b553b5be7939;
 Tue, 15 Aug 2023 23:07:11 +0200 (CEST)
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
X-Inumbo-ID: b3a99d6a-3baf-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692133631;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T+zneU/ODd9BEL6CProAShU+q6Ysw7Qx5ZvQuObYDv8=;
  b=fL+kq3irB6oK5cXs86k341plqlccLVufi5zKnRxd/N+Q/YlQ8Lc0jaOf
   6ro+ZXsW0kXr97ht/RvEHSoxvCalu/Y4pZd1xwHkOLIsyb0WRMce1/8Kf
   rk2dlPCiA3ncDnbHEsRZw1RYqKL8aQQ8BuSyxtRNH5axK+A+/H96WVf+9
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118253079
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:FoW9dqAbQG759xVW/2jkw5YqxClBgxIJ4kV8jS/XYbTApG4l1jVRx
 mZND2qCPanYYWPxLd92bdyy9E0DvceEzNIxQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GNB4wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw8OFXQmVw/
 LsiazUGdg2+ieXtm46eY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4XaH5gOxhnJz
 o7A1zTDU0krHdrP8AS+0imi2sifvXLBWo1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRHr7m9WX+bsLCOoluaOzURLGIETT8JS00C+daLiL80ihXDX9NyCpmfh9f+GSzz6
 z2SpS14jLIW5eYM06i45lHGxTGxvJ/CTg0yzgrSV2OhqAh+YeaNfIWu4EPH5O1BK66DR0Gdu
 2IJncef6u0DF5CLm2qGR+BlNLuk/eqfOTvQx1tmBYA89i+F8mSmO4tX5VlWBEpvKNdCRjbvb
 2faowYX75hWVEZGdocuPdj3UZ5zi/G9S5K8DKu8gsdyjoZZfginvyVQbAmqnGXmiFURn6ZkY
 qu+WJP5ZZoFMphPwD2zTuYb9LYkwCEi2G/eLazGIwSbPam2PyDMF+pcWLeaRqVgtf7f/l2Jm
 zpKH5HSoyizRtESdcU+HWQ7CVkRZUY2CpntwyC8Xr7Se1E2cI3N5hK4/F/AR2CHt/4I/gsr1
 ivnMqO99LYYrSSeQThmklg5NNvSsW9X9BrXxxAEM1eywGQEao2y9qoZfJZfVeB5pbY6l6IoH
 qZVIpXo7hFzptPvoWh1UHUAhNY6KETDafymbkJJnwTTj7Y/HleUq7cIjyPk9TUUDzrfiCfNi
 +TI6+8verJaH14KJJ+POJqSI6aZ4SB1dBRaAxGZfbG+uSzErOBXFsAGpqRqfpxQcU+dmWPyO
 sT/KU5wmNQharQdqLHh7Z1oZa/yeweiNiK2x1Xm0Is=
IronPort-HdrOrdr: A9a23:AUFtM6gLq5abiX9dJqlp8Do1lHBQX5913DAbv31ZSRFFG/Fw9v
 re6cjzsCWe5gr5N0tBpTn+Atj9fZqxz/9ICOoqTMSftXfdyQmVxehZhOOJ/9SKIVycygcy79
 YET0B0YOeAcmST5azBjDVReLwbr+VuP8qT6Nv2/jNVaUVPVokl1gF+D2+gYz9LrMstP+tGKH
 JZjPA31wZJvB4sH7WG7wI+Loz+juyOrovifRkFQzY/8WC1/EqVwY+/KQGcwhAdFxhSwbIumF
 K17jDR1+GYqvSmzR2Z8GfW4/1t6bzc4+oGPtWIls8WbhPzjQqyDb4RPYGqjXQOueSy71Rvqv
 ngyi1QR/hb2jfqZ2Sophmo4QX6zzo0zHfnxTaj8ADeiP28fis+F81Cwb1UaQHY7U1IhqAH7J
 52
X-Talos-CUID: =?us-ascii?q?9a23=3AJv/u5mjvJT4nqUfBge6LarJIrjJueHr9j3PuKgi?=
 =?us-ascii?q?CSmNiUKCoR1jLo59Bup87?=
X-Talos-MUID: 9a23:X+/gTgYKHLx0kOBT5wW93ABLMpdR3Z+OU05RtsUm6vOGOnkl
X-IronPort-AV: E=Sophos;i="6.01,175,1684814400"; 
   d="scan'208";a="118253079"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v3 01/10] xen/version: Calculate xen_capabilities_info once at boot
Date: Tue, 15 Aug 2023 22:06:41 +0100
Message-ID: <20230815210650.2735671-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The arch_get_xen_caps() infrastructure is horribly inefficient for something
that is constant after features have been resolved on boot.

Every instance used snprintf() to format constants into a string (which gets
shorter when %d gets resolved!), and which get double buffered on the stack.

Switch to using string literals with the "3.0" inserted - these numbers
haven't changed in 18 years (The Xen 3.0 release was Dec 5th 2005).

Use initcalls to format the data into xen_cap_info, which is deliberately not
of type xen_capabilities_info_t because a 1k array is a silly overhead for
storing a maximum of 77 chars (the x86 version) and isn't liable to need any
more space in the forseeable future.

This speeds up the the XENVER_capabilities hypercall, but the purpose of the
change is to allow us to introduce a better XENVER_* API that doesn't force
the use of a 1k buffer on the stack.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Henry Wang <Henry.Wang@arm.com>

v3:
 * CC new-arch folks so they're aware
v2:
 * New

Moving to __initcall() also allows new architectures to not implement this
API, and I'm going to recommend strongly that they dont.  Its a very dubious
way of signalling about 3 bits of info to the toolstack, and inefficient to
use (the toolstack has to do string parsing on the result figure out if
PV64/PV32/HVM is available).
---
 xen/arch/arm/setup.c        | 20 +++++++-------------
 xen/arch/x86/setup.c        | 31 ++++++++++---------------------
 xen/common/kernel.c         |  3 ++-
 xen/include/xen/hypercall.h |  2 --
 xen/include/xen/version.h   |  2 ++
 5 files changed, 21 insertions(+), 37 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 44ccea03ca14..3592c9ebc1cd 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -27,6 +27,7 @@
 #include <xen/cpu.h>
 #include <xen/pfn.h>
 #include <xen/virtual_region.h>
+#include <xen/version.h>
 #include <xen/vmap.h>
 #include <xen/trace.h>
 #include <xen/libfdt/libfdt-xen.h>
@@ -1286,24 +1287,17 @@ void __init start_xen(unsigned long boot_phys_offset,
     switch_stack_and_jump(idle_vcpu[0]->arch.cpu_info, init_done);
 }
 
-void arch_get_xen_caps(xen_capabilities_info_t *info)
+static int __init init_xen_cap_info(void)
 {
-    /* Interface name is always xen-3.0-* for Xen-3.x. */
-    int major = 3, minor = 0;
-    char s[32];
-
-    (*info)[0] = '\0';
-
 #ifdef CONFIG_ARM_64
-    snprintf(s, sizeof(s), "xen-%d.%d-aarch64 ", major, minor);
-    safe_strcat(*info, s);
+    safe_strcat(xen_cap_info, "xen-3.0-aarch64 ");
 #endif
     if ( cpu_has_aarch32 )
-    {
-        snprintf(s, sizeof(s), "xen-%d.%d-armv7l ", major, minor);
-        safe_strcat(*info, s);
-    }
+        safe_strcat(xen_cap_info, "xen-3.0-armv7l ");
+
+    return 0;
 }
+__initcall(init_xen_cap_info);
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2bfc1fd00f8c..206f0c50a136 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2049,35 +2049,24 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     unreachable();
 }
 
-void arch_get_xen_caps(xen_capabilities_info_t *info)
+static int __init cf_check init_xen_cap_info(void)
 {
-    /* Interface name is always xen-3.0-* for Xen-3.x. */
-    int major = 3, minor = 0;
-    char s[32];
-
-    (*info)[0] = '\0';
-
     if ( IS_ENABLED(CONFIG_PV) )
     {
-        snprintf(s, sizeof(s), "xen-%d.%d-x86_64 ", major, minor);
-        safe_strcat(*info, s);
+        safe_strcat(xen_cap_info, "xen-3.0-x86_64 ");
 
         if ( opt_pv32 )
-        {
-            snprintf(s, sizeof(s), "xen-%d.%d-x86_32p ", major, minor);
-            safe_strcat(*info, s);
-        }
+            safe_strcat(xen_cap_info, "xen-3.0-x86_32p ");
     }
     if ( hvm_enabled )
-    {
-        snprintf(s, sizeof(s), "hvm-%d.%d-x86_32 ", major, minor);
-        safe_strcat(*info, s);
-        snprintf(s, sizeof(s), "hvm-%d.%d-x86_32p ", major, minor);
-        safe_strcat(*info, s);
-        snprintf(s, sizeof(s), "hvm-%d.%d-x86_64 ", major, minor);
-        safe_strcat(*info, s);
-    }
+        safe_strcat(xen_cap_info,
+                    "hvm-3.0-x86_32 "
+                    "hvm-3.0-x86_32p "
+                    "hvm-3.0-x86_64 ");
+
+    return 0;
 }
+__initcall(init_xen_cap_info);
 
 int __hwdom_init xen_in_range(unsigned long mfn)
 {
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 52aa28762782..f822480a8ef3 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -30,6 +30,7 @@ enum system_state system_state = SYS_STATE_early_boot;
 
 static xen_commandline_t saved_cmdline;
 static const char __initconst opt_builtin_cmdline[] = CONFIG_CMDLINE;
+char __ro_after_init xen_cap_info[128];
 
 static int assign_integer_param(const struct kernel_param *param, uint64_t val)
 {
@@ -537,7 +538,7 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
         memset(info, 0, sizeof(info));
         if ( !deny )
-            arch_get_xen_caps(&info);
+            safe_strcpy(info, xen_cap_info);
 
         if ( copy_to_guest(arg, info, ARRAY_SIZE(info)) )
             return -EFAULT;
diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index f307dfb59760..15b6be6ec818 100644
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -56,6 +56,4 @@ common_vcpu_op(int cmd,
     struct vcpu *v,
     XEN_GUEST_HANDLE_PARAM(void) arg);
 
-void arch_get_xen_caps(xen_capabilities_info_t *info);
-
 #endif /* __XEN_HYPERCALL_H__ */
diff --git a/xen/include/xen/version.h b/xen/include/xen/version.h
index 93c58773630c..4856ad1b446d 100644
--- a/xen/include/xen/version.h
+++ b/xen/include/xen/version.h
@@ -19,6 +19,8 @@ const char *xen_deny(void);
 const char *xen_build_info(void);
 int xen_build_id(const void **p, unsigned int *len);
 
+extern char xen_cap_info[128];
+
 #ifdef BUILD_ID
 void xen_build_init(void);
 int xen_build_id_check(const Elf_Note *n, unsigned int n_sz,
-- 
2.30.2


