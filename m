Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5B55BC991
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 12:29:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408680.651493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaE1Z-0005wy-Vo; Mon, 19 Sep 2022 10:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408680.651493; Mon, 19 Sep 2022 10:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaE1Z-0005v0-SA; Mon, 19 Sep 2022 10:29:13 +0000
Received: by outflank-mailman (input) for mailman id 408680;
 Mon, 19 Sep 2022 10:29:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imKG=ZW=citrix.com=prvs=2545d700a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oaE1Y-0005uu-Hz
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 10:29:12 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4c8bdd5-3805-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 12:29:10 +0200 (CEST)
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
X-Inumbo-ID: e4c8bdd5-3805-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663583350;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9fCOPYaZ+Rqod5rKTzTfHr0PwGZrUV8jtcxuaIG3Egw=;
  b=KUov7LBaHm9CObr4hi42Q1KyAielwXu0WlY8TLIJ3eLv86HYC4gvkUHR
   JKCxYOuwWCxPRs/ak3arIDAWKxdCE1dbCt8rYpwlWZZRbHbkNK/16TMvj
   etZ2lAAW5tDT/BwnN8uky+TXusenOJhl+0e/v6dcp2mvDVcMD8zGxE2k4
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80808917
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3ArWcM+q8SunMLI8aGxZkxDrVtTnXEUVd1BUUsT?=
 =?us-ascii?q?fz0RtKz9vc5HHgccn9MqfcsoEvDyjPWbcjPeUPEDOy0nFIVS4qThMgn+dHI8?=
 =?us-ascii?q?/TOagSf6BinscZLeqByQ9T2Meb45HdCtpm9kyXJWgOjiMBPd8tMiX2t0E8jF?=
 =?us-ascii?q?vLXOmJopbtxGav1y6Rx+8W1iVjZDzc4Ju9ySpg9uqFq423+QLxHaVt5IWsxX?=
 =?us-ascii?q?qeHgY7BXo+NbmzsUtdHKmb6kOZVuWAWjWzoQEHOyu4A2iGzq1zVgcPw72J47?=
 =?us-ascii?q?vbfuDeNK2OWH1jm5Z+MUcj9Pwqt1WlgaKE+woatzXaqGJbm7oN6l6/y0/OLN?=
 =?us-ascii?q?GK7eQF3+JDvr9bkAcATKOEshpCqndsltP72RoMK+IgM02kkuipNawOB1WW4T?=
 =?us-ascii?q?oAzY2fJ5oYtmyrpeipnm9LPSykZja3cRt00U+SohmjVz6nTnJK5ZK/q4LpxI?=
 =?us-ascii?q?C8jZalpiuWUGx16vtuulrwRtTvrF42HJmPV2zTLfRiSO7udxpfS6zU8M1Nas?=
 =?us-ascii?q?Fh1BnrMRDW5nqXav2IbnFXoVcUq+wLTHSfHNzdYIfLf1HK9DpLg6YZ/7vAPe?=
 =?us-ascii?q?WS+Nc+DtvftwIWxBSRxkoWtNVB00dook4JEOaTi2/rBpWqQcO31kkGGwsnAM?=
 =?us-ascii?q?qVM4+n1Q3z8RPQ6ddVUGggMwTX2qKFsZFw/ENC94S9altPLaduDPgl9iO9f1?=
 =?us-ascii?q?tV3ezlEy0s98qmvZpZxsruo+1OadaLCPPbQJWNymuQ2OIgbcQl2c1cC9qBex?=
 =?us-ascii?q?Uz9iD/untIfHN22JxrjJRmE4VXKZu2ABPPF52gnTUwDz5yp6GEVfSrbdoLyd?=
 =?us-ascii?q?qjAbPRtlSau0epvMQTdwZwqEJ7c4pRdSQHCPpOGdSl/oTvdI+9A7EG5d4kUO?=
 =?us-ascii?q?6UUBcAaR4z11uMLGfEMMi2nYTHnJYueXq7jcwTu2XvZPWxYWOgpn0ikq41RE?=
 =?us-ascii?q?lCHwfCpDof8lml/wFPpvEblw8BXyZCyYnF7wfAzmefr9lfLuia5ulFO4tR3G?=
 =?us-ascii?q?Fadi0v7oS3p9GisxUhqx/txHnZLySsQkM1mJXVPUu7SWy47cBpUITMs1BRH9?=
 =?us-ascii?q?OTBbWtbsO3VJOLqbOISfy16rTWSHp71YTP2OlBMJ6X5rSN0b6kgU+DHRtAgZ?=
 =?us-ascii?q?D1X1fpW2uimW6XrtDYW7Lsckaw8ejVCcziUOzEG8MMdKR84qGAogOwI8hqb1?=
 =?us-ascii?q?tdpUATr3GX7e94S38IUCT4Ds5BvOlc4Ui2v747ZXqRAe1YNlzlFnQ7b+JDMt?=
 =?us-ascii?q?R0mgCRmjQ/H43th12+TnU8nNEqKwSb8QOOoKxyOLua4N5a9Vkwx5bDvz4Sh9?=
 =?us-ascii?q?sdWA7EX55c6EXUgELpDT0+tt0HR4nSm8TRoMHCjOCwc6m/QSCgK0N6h21t0c?=
 =?us-ascii?q?6TX5RDksprB6FefypDf+PyAEqytysq0bljn0Qg2aqfifTU8C2592GMyO/4M1?=
 =?us-ascii?q?X3Oc2TNHGU/dA2AdNk+tHdKi+kEVbs2R7R+7WgLp1KOhbNz7hKwmY3oXuldh?=
 =?us-ascii?q?j6P0S518YoZDgc1W8kXDFoNxKlXIMhCibGD9x5DH/LYeOOCPact/1AndHj9A?=
 =?us-ascii?q?zv3HoeSRj3e6FuTpabfW03mcaqyBauz900E/w5ugZn78TknsCG5YynBX8IXy?=
 =?us-ascii?q?lIrOO4M6RAcG/+sSlVg8w61fbVLUYM21GJVAZm8SYClLv59YCVOpNm0xNP2z?=
 =?us-ascii?q?mObvzMZF/uaJoUgX0WFvfVjW0ogEz6wE3HFcFklHt8lfWMAWatlX/ynYBrHt?=
 =?us-ascii?q?PYYoCC6C0vngI5blbUmnEqyX6Zgqk6JhsUBcsI8hXiqatoprMXasFuVFHStW?=
 =?us-ascii?q?82eX47mExDSTvfN2/Z/XKy2SpizeGdvz8NbYK3N/sYyKFUXaq+izFr4H7I3n?=
 =?us-ascii?q?9CBqowAlHG0q9jZCLt3bAb7CjxY31rJlFsp3+UZN2XimJcv7eO5fX97KvYWK?=
 =?us-ascii?q?/t01TpdpiyJG6qlTsTpU4tLGJ0j1k7780ncYJctuzJ4mucsm30RyCq6HFnCb?=
 =?us-ascii?q?82z1Vj5fv4Q5TTQqZCSbEd9hyS8WQiKmn/fxHO/UIzNlTWL/3cPPRGTTXjOV?=
 =?us-ascii?q?uNpn/8j/ifVMrMvWXtqbHxA4oWQKXxc/zMjK+NgEkTRjJQhbEyBd5Nd3DII2?=
 =?us-ascii?q?qXSVorDyF2rxlrePbPjnANEU3zLd3dm+FKiyj9jbsL1ZQDHYt+R6jZMXr4fk?=
 =?us-ascii?q?O2TI/UKnN7B+lwKETf4YrTcqEt33Y9GUmW/cwtTtP2+isbBA1xjv8hUKb+jY?=
 =?us-ascii?q?D6H0ANCThMHnGsj5A3bjmj0VA0mhjSFenMynH/FS9D+aU6I0TXJk1Rs2XwuY?=
 =?us-ascii?q?VIeov7cTRrqM2A901XFFeRYZufcMRJptdQ1LNRHE/DTMwgxYHqSvLpdfSyja?=
 =?us-ascii?q?zyfFc7UNi/5LOQALzv4l2zFvAxoW0xAGT9D3R4flJqhP4qQLZ24MX/dzyQro?=
 =?us-ascii?q?qP/WZbI+H2/wS55GJOGQZ1UTSnLC6zIuxEt6eeEN61yPHQ2w1EF6GYukVIWl?=
 =?us-ascii?q?hgFGdabxQGlLtodd+XNM386Y2VhabwHR4/W4sCYbWJq4QSCmsYivTL9efvka?=
 =?us-ascii?q?5oOiabzAoX5en29QdYqejBkiLf8bQmmxMW6CTZBhpEGVyzjALCLqRviYf6vm?=
 =?us-ascii?q?irZwXwu4CvvLVnyMUuw8lqSjT/nYWWuLdA5Q8ptSLi10Z/LZCKW8vo+68tWg?=
 =?us-ascii?q?l4T30+AUzruILluVFIVMWTSXHo4f/bBO6c6U+6yXm87phev16MzaRN62C2oz?=
 =?us-ascii?q?iQ+3v/m2W2FIRgiqGaUq4fgQ6Tv91pbAve4EfsqrTmfVjeYbHj0KBzgMdbC7?=
 =?us-ascii?q?tXqNaHsmeDmjoPpw1Wekx+yHJq2GInI5KgVfEh9mTx1kkd2eFpB/pBVrFzWf?=
 =?us-ascii?q?GsK5ZOkN+ODIpvgDNuMbMfTEGv2J0hyUP7pFXK0tFj/TsSORvq2kxtWxZIOo?=
 =?us-ascii?q?vVMqvsFZmx/rdW11n3HJJn0xjGtuTKY2qBwgtL3j/BVcqhS7g+GUOnTmeQZo?=
 =?us-ascii?q?xPNCwGDEOz/72Z2qhijbCbpUjs+v1nDJbTjeGkULfQU?=
X-IronPort-AV: E=Sophos;i="5.93,327,1654574400"; 
   d="scan'208";a="80808917"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Wei Chen <wei.chen@arm.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [XEN PATCH v3] build: Fix x86 out-of-tree build without EFI
Date: Mon, 19 Sep 2022 11:28:31 +0100
Message-ID: <20220919102831.17438-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We can't have a source file with the same name that exist in both the
common code and in the arch specific code for efi/. This can lead to
confusion in make and it can pick up the wrong source file. This issue
lead to a failure to build a pv-shim for x86 out-of-tree, as this is
one example of an x86 build using the efi/stub.c.

The issue is that in out-of-tree, make might find x86/efi/stub.c via
VPATH, but as the target needs to be rebuilt due to FORCE, make
actually avoid changing the source tree and rebuilt the target with
VPATH ignored, so $@ lead to the build tree where "stub.c" doesn't
exist yet so a link is made to "common/stub.c".

Rework the new common/stub.c file to have a different name than the
already existing one, by renaming the existing one. We can hide the
compat aliases that x86 uses behind CONFIG_COMPAT so a Arm build will
not have them.

Also revert the change to the rule that creates symbolic links it's
better to just recreate the link in cases where an existing file exist
or the link goes to the wrong file.

Avoid using $(EFIOBJ-y) as an alias for $(clean-files), add
"stub.c" directly to $(clean-files).

Also update .gitignore as this was also missing from the original
patch.

Fixes: 7f96859b0d00 ("xen: reuse x86 EFI stub functions for Arm")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v3:
    - back to using common-stub.c
    - include the x86 compat function alias in common-stub.c but guard them
      with CONFIG_COMPAT
    
    v2:
    - instead of renaming common/efi/stub.c to common_stub.c; we rename
      arch/*/efi/stub.c to stub.h and include it from common/stub.c
    - update .gitignore
    
    CC: Wei Chen <wei.chen@arm.com>

 xen/arch/arm/efi/Makefile                |  6 +-----
 xen/arch/x86/efi/Makefile                |  2 +-
 xen/common/efi/efi-common.mk             |  4 ++--
 xen/arch/x86/efi/stub.c                  |  7 -------
 xen/common/efi/{stub.c => common-stub.c} | 10 ++++++++++
 .gitignore                               |  1 +
 6 files changed, 15 insertions(+), 15 deletions(-)
 rename xen/common/efi/{stub.c => common-stub.c} (64%)

diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
index bd954a3b2d..2459cbae3a 100644
--- a/xen/arch/arm/efi/Makefile
+++ b/xen/arch/arm/efi/Makefile
@@ -4,11 +4,7 @@ ifeq ($(CONFIG_ARM_EFI),y)
 obj-y += $(EFIOBJ-y)
 obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
 else
-# Add stub.o to EFIOBJ-y to re-use the clean-files in
-# efi-common.mk. Otherwise the link of stub.c in arm/efi
-# will not be cleaned in "make clean".
-EFIOBJ-y += stub.o
-obj-y += stub.o
+obj-y += common-stub.o
 
 $(obj)/stub.o: CFLAGS-y += -fno-short-wchar
 
diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index 034ec87895..24dfecfad1 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -11,7 +11,7 @@ $(obj)/boot.init.o: $(obj)/buildid.o
 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
 $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary := $(cflags-stack-boundary)
 
-obj-y := stub.o
+obj-y := common-stub.o stub.o
 obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
 obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ-y))
 extra-$(XEN_BUILD_EFI) += buildid.o relocs-dummy.o
diff --git a/xen/common/efi/efi-common.mk b/xen/common/efi/efi-common.mk
index ec2c34f198..53fdb81583 100644
--- a/xen/common/efi/efi-common.mk
+++ b/xen/common/efi/efi-common.mk
@@ -9,9 +9,9 @@ CFLAGS-y += -iquote $(srcdir)
 # e.g.: It transforms "dir/foo/bar" into successively
 #       "dir foo bar", ".. .. ..", "../../.."
 $(obj)/%.c: $(srctree)/common/efi/%.c FORCE
-	$(Q)test -f $@ || \
-	    ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
+	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
 
 clean-files += $(patsubst %.o, %.c, $(EFIOBJ-y:.init.o=.o) $(EFIOBJ-))
+clean-files += common-stub.c
 
 .PRECIOUS: $(obj)/%.c
diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub.c
index f2365bc041..2cd5c8d4dc 100644
--- a/xen/arch/x86/efi/stub.c
+++ b/xen/arch/x86/efi/stub.c
@@ -8,7 +8,6 @@
 #include <efi/eficon.h>
 #include <efi/efidevp.h>
 #include <efi/efiapi.h>
-#include "../../../common/efi/stub.c"
 
 /*
  * Here we are in EFI stub. EFI calls are not supported due to lack
@@ -55,9 +54,3 @@ bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
 }
 
 void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e) { }
-
-int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *)
-    __attribute__((__alias__("efi_get_info")));
-
-int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *)
-    __attribute__((__alias__("efi_runtime_call")));
diff --git a/xen/common/efi/stub.c b/xen/common/efi/common-stub.c
similarity index 64%
rename from xen/common/efi/stub.c
rename to xen/common/efi/common-stub.c
index 15694632c2..5a91fe28cc 100644
--- a/xen/common/efi/stub.c
+++ b/xen/common/efi/common-stub.c
@@ -30,3 +30,13 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
 {
     return -ENOSYS;
 }
+
+#ifdef CONFIG_COMPAT
+
+int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *)
+    __attribute__((__alias__("efi_get_info")));
+
+int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *)
+    __attribute__((__alias__("efi_runtime_call")));
+
+#endif
diff --git a/.gitignore b/.gitignore
index af9bf749c4..98adcf02ad 100644
--- a/.gitignore
+++ b/.gitignore
@@ -280,6 +280,7 @@ xen/arch/*/efi/ebmalloc.c
 xen/arch/*/efi/efi.h
 xen/arch/*/efi/pe.c
 xen/arch/*/efi/runtime.c
+xen/arch/*/efi/common-stub.c
 xen/arch/*/include/asm/asm-offsets.h
 xen/common/config_data.S
 xen/common/config.gz
-- 
Anthony PERARD


