Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC05C66A6AF
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jan 2023 00:09:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477556.740316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGTAG-0007CQ-Bh; Fri, 13 Jan 2023 23:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477556.740316; Fri, 13 Jan 2023 23:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGTAG-00079g-8C; Fri, 13 Jan 2023 23:08:48 +0000
Received: by outflank-mailman (input) for mailman id 477556;
 Fri, 13 Jan 2023 23:08:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bX0/=5K=citrix.com=prvs=37021d3d6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pGTAE-0006f0-Aj
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 23:08:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a792e11-9397-11ed-91b6-6bf2151ebd3b;
 Sat, 14 Jan 2023 00:08:45 +0100 (CET)
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
X-Inumbo-ID: 3a792e11-9397-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673651326;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RRasjkNoe7Enmu6lqfWgkYl+d2SZ3qpC6O2iTzVGXP8=;
  b=MdsQVZDSP/WK9hJEdeK4w8UpXEB4V8TvFo2ZhEWiO5PE3rTtpqjzlZQk
   9k/blNT+K+qe4e5Zel/A4z7eUF3YEkr8XJ+pPgTOH+r3Ic9TtXQUi/5yt
   fcWaEahhLl2QAs8UY2Ab94+hZsiM/Bad37Rb0oVhzMNW8b3l0TBE8ys2O
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 92558108
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:adSghqlVPqX1OGO2gMPF/C/o5gxYJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMWmiDbvrfZzbwfNsibduwo0pXvJaGyt5iS1E/qS0yEiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgS5QSGyxH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dsFMQsiRz6SvbKJg/Wha8Rqh/4EIeC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQthfC+
 z+Wpjypav0cHIDEyzGqoi/yurHelBnkR4YYEaz7/fE/1TV/wURMUUZLBDNXu8KRiFO6Wt9ZA
 1wZ/Gwpt6da3FOvZsnwWVu/unHslhQRQcZKGus2rgSE0LPJ4h2xD3IBCDVGbbQOisgyQjA70
 06TqPngDzdvrb69RGqU8/GfqjbaETMOMWYIaCsATA0Ey9ruuoc+ilTIVNkLOIyfg8DxGDrw6
 yuXtyV4jLIW5eYb2qP+8V3ZjjaEopnSUhVz9gjRRnii7A5yeMiifYPA1LTAxa8edsDDFADH5
 SVa3ZHEt4jiEK1higSqXfw2M5iH9szVD36bm39CGZgb0DmErivLkZ9r3N1uGKt4Gp9aJmS0P
 xGP4lo5CIx7ZyXzM/IuC26lI4FzlPW7S4y4PhzBRoAWCqWdYjNr682HiaS4+2n22HYhnqgkU
 XtwWZb9VC1KYUiLIdffegv87VPI7npkrY8rbcqnpylLKJLHDJJvdZ8LMUGVcscy576erQPe/
 r53bpXVkEsEDL2vOnmOqub/yGzmylBiVfjLRzF/LLbfcmKK5kl8YxMu/V/RU9M8xPkE/gs51
 nq8RlVZ2DLCaY7vcG23hoRYQOq3B/5X9CtrVRHAyH70gxDPl67ztvZAH3b2FJF7nNFeIQlcF
 qdbKp3RX6oXFFwqOV01NPHAkWCrTzzz7SrmAsZvSGFXk0JIL+ARxuLZQw==
IronPort-HdrOrdr: A9a23:YUNK7qGnqKuFCqYgpLqE5seALOsnbusQ8zAXPiFKJSC9F/byqy
 nAppsmPHPP5gr5OktBpTnwAsi9qBrnnPYejLX5Vo3SPzUO1lHYSb1K3M/PxCDhBj271sM179
 YFT0GmMqyTMWRH
X-IronPort-AV: E=Sophos;i="5.97,215,1669093200"; 
   d="scan'208";a="92558108"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v2 2/5] xen/version: Calculate xen_capabilities_info once at boot
Date: Fri, 13 Jan 2023 23:08:32 +0000
Message-ID: <20230113230835.29356-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230113230835.29356-1-andrew.cooper3@citrix.com>
References: <20230113230835.29356-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The arch_get_xen_caps() infrastructure is horribly inefficient, for something
that is constant after features have been resolved on boot.

Every instance used snprintf() to format constants into a string (which gets
shorter when %d gets resolved!), which gets double buffered on the stack.

Switch to using string literals with the "3.0" inserted - these numbers
haven't changed in 18 years (The Xen 3.0 release was Dec 5th 2005).

Use initcalls to format the data into xen_cap_info, which is deliberately not
of type xen_capabilities_info_t because a 1k array is a silly overhead for
storing a maximum of 77 chars (the x86 version) and isn't liable to need any
more space in the forseeable future.

This speeds up the the XENVER_capabilities hypercall, but the purpose of the
change is to allow us to introduce a better XENVER_* API that doesn't force us
to put a 1k buffer on the stack.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

v2:
 * New

If Xen had strncpy(), then the hunk in do_xen_version() could read:

  if ( deny )
     memset(info, 0, sizeof(info));
  else
     strncpy(info, xen_cap_info, sizeof(info));

to avoid double processing the start of the buffer, but given the ABI (must
write 1k chars into the guest), I cannot see any way of taking info off the
stack without some kind of strncpy_to_guest() API.

Moving to __initcall() also allows new architectures to not implement this
API, and I'm going to recommend strongly that they dont.  Its a very dubious
way of signalling about 3 bits of info to the toolstack, and inefficient to
use (the toolstack has to do string parsing on the result figure out if
PV64/PV32/HVM is available).
---
 xen/arch/arm/setup.c        | 19 ++++++-------------
 xen/arch/x86/setup.c        | 31 ++++++++++---------------------
 xen/common/kernel.c         |  3 ++-
 xen/include/xen/hypercall.h |  2 --
 xen/include/xen/version.h   |  2 ++
 5 files changed, 20 insertions(+), 37 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 1f26f67b90e3..b71b4bc506e0 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1194,24 +1194,17 @@ void __init start_xen(unsigned long boot_phys_offset,
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
index 566422600d94..f80821469ece 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1956,35 +1956,24 @@ void __init noreturn __start_xen(unsigned long mbi_p)
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
index f7b1f65f373c..4fa1d6710115 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -30,6 +30,7 @@ enum system_state system_state = SYS_STATE_early_boot;
 
 xen_commandline_t saved_cmdline;
 static const char __initconst opt_builtin_cmdline[] = CONFIG_CMDLINE;
+char __ro_after_init xen_cap_info[128];
 
 static int assign_integer_param(const struct kernel_param *param, uint64_t val)
 {
@@ -509,7 +510,7 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
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
2.11.0


