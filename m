Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DE8753923
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 13:00:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563569.880850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKGXA-0008KB-5g; Fri, 14 Jul 2023 11:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563569.880850; Fri, 14 Jul 2023 11:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKGXA-0008Hw-2M; Fri, 14 Jul 2023 11:00:24 +0000
Received: by outflank-mailman (input) for mailman id 563569;
 Fri, 14 Jul 2023 11:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIDz=DA=citrix.com=prvs=552896509=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qKGX8-0008Hk-0d
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 11:00:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e42351f-2235-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 13:00:19 +0200 (CEST)
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
X-Inumbo-ID: 9e42351f-2235-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689332419;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SxhCInnklup+XeRx+IqG2pAVyIM+zCWGUjhGJE2lHlc=;
  b=Er7jJTMPmE1CYnyP7p0E39Wy2crNWJMQdAfMPKWOap+S2tvgie/ghFbu
   caX0VmbDRW4/citr/uKhdTXc91fmDc+v7/KJge1iq+kgmgOTmPjDRKYeQ
   cZMKA83ttawBpfkUp2jn4la4cBREke+2UFYKV2a+xyP83N1t2Ri41ObFs
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 114929888
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:A9Lk8aJKH3G2UsPNFE+RApUlxSXFcZb7ZxGr2PjKsXjdYENSgzxVy
 mVJXGqHOvrYYDSgKNBwOdiy9BgGuZ7Qz9RkHAplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QViPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5UC2xQ2
 cYHJAwmRQqJ1uPqm4ucbNBj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHJkExBfI9
 jKuE2LRLkobH/68lyi+wH+MqNaI3nK8dKUwLejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQxz
 UOAld7tAT1psZWWRGib+7PSqim9UQAPKmUPfzMDCwEM7N/quogbhA/AVdtlH+i+ididMTfxy
 DeOpW4giqkJjMgK/6+m8kvKhT3qrZ/MJjPZ/S2OADjjtFkgItf4OcrxswOzAet8wJixbVOMo
 lQ+hMSix8sUB8CMyHe0Z8M0E+T8jxqaCwEwkWKDDrF4qWT8oCT7LdgPiN1tDBw3a5hZIFcFd
 GeW4FoMv8ELYRNGeIctO+qM59IWIb8M/DgPftTddZJwb5d4b2drFwk+NBfLjwgBfKXB+JzT2
 Kt3ku72Vx728Yw9kFKLqx41iNfHPBwWy2LJXozcxB+6y7eYb3P9Ye5bYArUMbths//a/VW9H
 zNj2y2ikU43vArWO3m/zGLuBQpScShT6W7e9qS7idJv0iI5QTp8Wpc9MJsqepB/nrQ9qws71
 ijVZ6Os83Km3SevAVzTOhhehEbHAc4XQYQTYXZ9Yj5FGhELPe6S0UvoX8dtJed6q7A7lKcco
 jtsU5zoP8mjgw/vo1w1BaQRZqQ7HPh3rWpi5xaYXQU=
IronPort-HdrOrdr: A9a23:4piWI60rtmkKv6tqUpcYfwqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: 9a23:489vfG8yxObtcaD4PpuVv20eF94JSGLR8Fz7OUXpCDoycZqzcFDFrQ==
X-Talos-MUID: 9a23:1rxkxAbxXs9vceBTm2TtrxNBatVT0amOJnlK0sRBl+6mDHkl
X-IronPort-AV: E=Sophos;i="6.01,205,1684814400"; 
   d="scan'208";a="114929888"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH] x86/common: Use const char * for string literals
Date: Fri, 14 Jul 2023 12:00:09 +0100
Message-ID: <20230714110009.3004073-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

For pre-ANSI-C compatibility reasons, string literals have a mutable type, but
it is undefined behaviour to mutate them.

Swap char *'s to const char *'s for variables which hold string literals.

This fixes several violations of MISRA Rule 7.4:

  A string literal shall not be assigned to an object unless the object's type
  is "pointer to const-qualified char".

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/acpi/cpu_idle.c       | 2 +-
 xen/arch/x86/cpu/mcheck/mce.c      | 2 +-
 xen/arch/x86/cpu/mcheck/mce.h      | 2 +-
 xen/arch/x86/e820.c                | 2 +-
 xen/arch/x86/hvm/vmx/vmcs.c        | 4 ++--
 xen/arch/x86/include/asm/hvm/hvm.h | 2 +-
 xen/arch/x86/oprofile/nmi_int.c    | 8 ++++----
 xen/arch/x86/time.c                | 4 ++--
 xen/include/xen/dmi.h              | 4 ++--
 9 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 427c8c89c5c4..cfce4cc0408f 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -302,7 +302,7 @@ static void print_hw_residencies(uint32_t cpu)
            hw_res.cc6, hw_res.cc7);
 }
 
-static char* acpi_cstate_method_name[] =
+static const char *const acpi_cstate_method_name[] =
 {
     "NONE",
     "SYSIO",
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 3e93bdd8dab4..1144a91aa444 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1706,7 +1706,7 @@ static void mc_panic_dump(void)
     dprintk(XENLOG_ERR, "End dump mc_info, %x mcinfo dumped\n", mcinfo_dumpped);
 }
 
-void mc_panic(char *s)
+void mc_panic(const char *s)
 {
     is_mc_panic = true;
     console_force_unlock();
diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
index dd5d258362e6..7de8aa98378a 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -57,7 +57,7 @@ struct mcinfo_extended *intel_get_extended_msrs(
 bool mce_available(const struct cpuinfo_x86 *c);
 unsigned int mce_firstbank(struct cpuinfo_x86 *c);
 /* Helper functions used for collecting error telemetry */
-void noreturn mc_panic(char *s);
+void noreturn mc_panic(const char *s);
 void x86_mc_get_cpu_info(unsigned, uint32_t *, uint16_t *, uint16_t *,
                          uint32_t *, uint32_t *, uint32_t *, uint32_t *);
 
diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index c5911cf48dc4..0b89935510ae 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -363,7 +363,7 @@ static unsigned long __init find_max_pfn(void)
     return max_pfn;
 }
 
-static void __init clip_to_limit(uint64_t limit, char *warnmsg)
+static void __init clip_to_limit(uint64_t limit, const char *warnmsg)
 {
     unsigned int i;
     char _warnmsg[160];
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index b2095636250c..13719cc923d9 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1949,7 +1949,7 @@ static inline unsigned long vmr(unsigned long field)
     (uint32_t)vmr(fld);                       \
 })
 
-static void vmx_dump_sel(char *name, uint32_t selector)
+static void vmx_dump_sel(const char *name, uint32_t selector)
 {
     uint32_t sel, attr, limit;
     uint64_t base;
@@ -1960,7 +1960,7 @@ static void vmx_dump_sel(char *name, uint32_t selector)
     printk("%s: %04x %05x %08x %016"PRIx64"\n", name, sel, attr, limit, base);
 }
 
-static void vmx_dump_sel2(char *name, uint32_t lim)
+static void vmx_dump_sel2(const char *name, uint32_t lim)
 {
     uint32_t limit;
     uint64_t base;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 9555b4c41fef..3c37f522b90d 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -92,7 +92,7 @@ struct hvm_vcpu_nonreg_state {
  * supports Intel's VT-x and AMD's SVM extensions.
  */
 struct hvm_function_table {
-    char *name;
+    const char *name;
 
     /* Support Hardware-Assisted Paging? */
     bool_t hap_supported;
diff --git a/xen/arch/x86/oprofile/nmi_int.c b/xen/arch/x86/oprofile/nmi_int.c
index 17bf3135f86f..1313818af8dd 100644
--- a/xen/arch/x86/oprofile/nmi_int.c
+++ b/xen/arch/x86/oprofile/nmi_int.c
@@ -36,7 +36,7 @@ struct op_x86_model_spec const *__read_mostly model;
 static struct op_msrs cpu_msrs[NR_CPUS];
 static unsigned long saved_lvtpc[NR_CPUS];
 
-static char *cpu_type;
+static const char *cpu_type;
 
 static DEFINE_PER_CPU(struct vcpu *, nmi_cont_vcpu);
 
@@ -309,7 +309,7 @@ void nmi_stop(void)
 }
 
 
-static int __init p4_init(char ** cpu_type)
+static int __init p4_init(const char **cpu_type)
 {
 	unsigned int cpu_model = current_cpu_data.x86_model;
 
@@ -353,7 +353,7 @@ static int __init cf_check force_cpu_type(const char *str)
 }
 custom_param("cpu_type", force_cpu_type);
 
-static int __init ppro_init(char ** cpu_type)
+static int __init ppro_init(const char **cpu_type)
 {
 	if (force_arch_perfmon && cpu_has_arch_perfmon)
 		return 0;
@@ -375,7 +375,7 @@ static int __init ppro_init(char ** cpu_type)
 	return 1;
 }
 
-static int __init arch_perfmon_init(char **cpu_type)
+static int __init arch_perfmon_init(const char **cpu_type)
 {
 	if (!cpu_has_arch_perfmon)
 		return 0;
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index f5e30d4e0236..af40a9993c81 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -64,8 +64,8 @@ struct cpu_time {
 };
 
 struct platform_timesource {
-    char *id;
-    char *name;
+    const char *id;
+    const char *name;
     u64 frequency;
     /* Post-init this hook may only be invoked via the read_counter() wrapper! */
     u64 (*read_counter)(void);
diff --git a/xen/include/xen/dmi.h b/xen/include/xen/dmi.h
index fa25f6cd3816..71a5c46dc6ea 100644
--- a/xen/include/xen/dmi.h
+++ b/xen/include/xen/dmi.h
@@ -20,12 +20,12 @@ enum dmi_field {
  */
 struct dmi_strmatch {
 	u8 slot;
-	char *substr;
+	const char *substr;
 };
 
 struct dmi_system_id {
 	int (*callback)(const struct dmi_system_id *);
-	char *ident;
+	const char *ident;
 	struct dmi_strmatch matches[4];
 	void *driver_data;
 };
-- 
2.30.2


