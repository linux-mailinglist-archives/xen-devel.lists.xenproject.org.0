Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21AC65C7DD
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 21:10:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470703.730299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCnbm-0004oG-Uv; Tue, 03 Jan 2023 20:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470703.730299; Tue, 03 Jan 2023 20:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCnbm-0004kF-QD; Tue, 03 Jan 2023 20:10:02 +0000
Received: by outflank-mailman (input) for mailman id 470703;
 Tue, 03 Jan 2023 20:10:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oadl=5A=citrix.com=prvs=36087fe06=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pCnbl-0004TZ-Bx
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 20:10:01 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97c03ea5-8ba2-11ed-b8d0-410ff93cb8f0;
 Tue, 03 Jan 2023 21:09:58 +0100 (CET)
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
X-Inumbo-ID: 97c03ea5-8ba2-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672776598;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=/mBbqgiiuNZanVYbh0nZVNE+sEURAYgdK6CFKGtITFc=;
  b=RNyF8re0u6gsjimsCEUzigihal79cUqMyWBE5z8TpwKxL6lmH/4GcjHd
   B9DsC1uRN8NSIrSjc7LdOjPuMVP50ubTXE0lP/oRJ/mNdm6fzakgXyL5w
   gwto9jLvqkV+EG5z1mNDbzXV4P/n38YVMBuv91z2s2koE8SRimRn768im
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90516756
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:k8kcW6sr222vbiNZasQ29fFuCufnVGBeMUV32f8akzHdYApBsoF/q
 tZmKTuAP/fcNmWhf910YIqwp04HuMDczdM1SQNq+XxhQytH+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoQ5AaGzCFJZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwcQgPdkqxiNKKzLO3e8dIr8A8E+PxM9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27J/
 j+foTukXHn2MvSu+weD1SqAn9PtlBLcAb4cTrCk8uxT1Qj7Kms7V0RNCArTTeOColWlR9tVJ
 kgQ+ywvhas/7kqmSp/6RRLQiGGAlg4RXZxXCeJSwAOQzqvZ5S6JC25CSSROAPQEnsIrQT0h1
 neSgsjkQzdotdW9WX+bs7uZsz62ESwUNnMZIz8JSxMf5Nvuq511iQjAJuuPC4bs0IezQ2uph
 WnX8m5u3N3/kPLnyY3ixVLf2QCjlqTFTwIEyCH+Wn2axBl2MdvNi5OT1XDX6vNJLYC8R1aHv
 WQZl8X20N3iHa1hhwTWHrxTQejBC+KtdWSF3AUxR8VJGyGFoSbLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNDKu8gjlmOMIZmOq7EMZGOyatM5jFyhRErE3GE
 c7znTyQJXgbE7976zG9Wv0Q17QmrghnmzyJGs+jn0T/iObODJJwdVviGALXBt3VEYve+FmFm
 zqhH5HiJ+pjvB3WPXCMrN97waEiJnknH5Hmw/Fqmhq4ClM+QgkJUqaBqY7NjqQ5x8y5YM+Up
 CDiMqKZoXKj7UD6xfKiMy06MOu2DMsv8hrW/0UEZD6V5pTqWq73hI93Snf9VeJPGDBLpRKsc
 8Q4Rg==
IronPort-HdrOrdr: A9a23:Ki5oxqqFSrmfBcOJouT2EOwaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-IronPort-AV: E=Sophos;i="5.96,297,1665460800"; 
   d="scan'208";a="90516756"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: [PATCH 2/4] xen/version: Drop compat/kernel.c
Date: Tue, 3 Jan 2023 20:09:41 +0000
Message-ID: <20230103200943.5801-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230103200943.5801-1-andrew.cooper3@citrix.com>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

kernel.c is mostly in an #ifndef COMPAT guard, because compat/kernel.c
reincludes kernel.c to recompile xen_version() in a compat form.

However, the xen_version hypercall is almost guest-ABI-agnostic; only
XENVER_platform_parameters has a compat split.  Handle this locally, and do
away with the reinclude entirely.

In particular, this removed the final instances of obfucation via the DO()
macro.

No functional change.  Also saves 2k of of .text in the x86 build.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 xen/common/Makefile          |  2 +-
 xen/common/compat/kernel.c   | 53 --------------------------------------------
 xen/common/kernel.c          | 43 ++++++++++++++++++++++-------------
 xen/include/hypercall-defs.c |  2 +-
 xen/include/xlat.lst         |  3 +++
 5 files changed, 33 insertions(+), 70 deletions(-)
 delete mode 100644 xen/common/compat/kernel.c

diff --git a/xen/common/Makefile b/xen/common/Makefile
index 9a3a12b12dea..bbd75b4be6d3 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -59,7 +59,7 @@ obj-y += xmalloc_tlsf.o
 
 obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
 
-obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o kernel.o memory.o multicall.o xlat.o)
+obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 obj-y += domctl.o
diff --git a/xen/common/compat/kernel.c b/xen/common/compat/kernel.c
deleted file mode 100644
index 804b919bdc72..000000000000
--- a/xen/common/compat/kernel.c
+++ /dev/null
@@ -1,53 +0,0 @@
-/******************************************************************************
- * kernel.c
- */
-
-EMIT_FILE;
-
-#include <xen/init.h>
-#include <xen/lib.h>
-#include <xen/errno.h>
-#include <xen/version.h>
-#include <xen/sched.h>
-#include <xen/guest_access.h>
-#include <asm/current.h>
-#include <compat/xen.h>
-#include <compat/version.h>
-
-extern xen_commandline_t saved_cmdline;
-
-#define xen_extraversion compat_extraversion
-#define xen_extraversion_t compat_extraversion_t
-
-#define xen_compile_info compat_compile_info
-#define xen_compile_info_t compat_compile_info_t
-
-CHECK_TYPE(capabilities_info);
-
-#define xen_platform_parameters compat_platform_parameters
-#define xen_platform_parameters_t compat_platform_parameters_t
-#undef HYPERVISOR_VIRT_START
-#define HYPERVISOR_VIRT_START HYPERVISOR_COMPAT_VIRT_START(current->domain)
-
-#define xen_changeset_info compat_changeset_info
-#define xen_changeset_info_t compat_changeset_info_t
-
-#define xen_feature_info compat_feature_info
-#define xen_feature_info_t compat_feature_info_t
-
-CHECK_TYPE(domain_handle);
-
-#define DO(fn) int compat_##fn
-#define COMPAT
-
-#include "../kernel.c"
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index f8134d3e7a9d..ccee178ff17a 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -18,7 +18,13 @@
 #include <asm/current.h>
 #include <public/version.h>
 
-#ifndef COMPAT
+#ifdef CONFIG_COMPAT
+#include <compat/version.h>
+
+CHECK_compile_info;
+CHECK_feature_info;
+CHECK_build_id;
+#endif
 
 enum system_state system_state = SYS_STATE_early_boot;
 
@@ -463,15 +469,7 @@ static int __init cf_check param_init(void)
 __initcall(param_init);
 #endif
 
-# define DO(fn) long do_##fn
-
-#endif
-
-/*
- * Simple hypercalls.
- */
-
-DO(xen_version)(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     bool_t deny = !!xsm_xen_version(XSM_OTHER, cmd);
 
@@ -520,12 +518,27 @@ DO(xen_version)(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     
     case XENVER_platform_parameters:
     {
-        xen_platform_parameters_t params = {
-            .virt_start = HYPERVISOR_VIRT_START
-        };
+#ifdef CONFIG_COMPAT
+        if ( current->hcall_compat )
+        {
+            compat_platform_parameters_t params = {
+                .virt_start = HYPERVISOR_COMPAT_VIRT_START(current->domain),
+            };
+
+            if ( copy_to_guest(arg, &params, 1) )
+                return -EFAULT;
+        }
+        else
+#endif
+        {
+            xen_platform_parameters_t params = {
+                .virt_start = HYPERVISOR_VIRT_START,
+            };
+
+            if ( copy_to_guest(arg, &params, 1) )
+                return -EFAULT;
+        }
 
-        if ( copy_to_guest(arg, &params, 1) )
-            return -EFAULT;
         return 0;
         
     }
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 41e1af01f6b2..6d361ddfce1b 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -245,7 +245,7 @@ multicall                          compat:2 do:2     compat   do       do
 update_va_mapping                  compat   do       -        -        -
 set_timer_op                       compat   do       compat   do       -
 event_channel_op_compat            do       do       -        -        dep
-xen_version                        compat   do       compat   do       do
+xen_version                        do       do       do       do       do
 console_io                         do       do       do       do       do
 physdev_op_compat                  compat   do       -        -        dep
 #if defined(CONFIG_GRANT_TABLE)
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index 65f7fe3811c7..f2bae220a6df 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -169,6 +169,9 @@
 !	vcpu_runstate_info		vcpu.h
 ?	vcpu_set_periodic_timer		vcpu.h
 !	vcpu_set_singleshot_timer	vcpu.h
+?	compile_info                    version.h
+?	feature_info                    version.h
+?	build_id                        version.h
 ?	xenoprof_init			xenoprof.h
 ?	xenoprof_passive		xenoprof.h
 ?	flask_access			xsm/flask_op.h
-- 
2.11.0


