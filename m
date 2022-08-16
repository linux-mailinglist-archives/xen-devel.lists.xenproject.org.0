Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1A559584E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 12:31:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388207.624813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNtqk-0000Sd-Gd; Tue, 16 Aug 2022 10:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388207.624813; Tue, 16 Aug 2022 10:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNtqk-0000Q2-DK; Tue, 16 Aug 2022 10:31:06 +0000
Received: by outflank-mailman (input) for mailman id 388207;
 Tue, 16 Aug 2022 10:31:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=REbT=YU=citrix.com=prvs=22068c4b7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oNtqi-0000Pw-8x
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 10:31:04 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85c738b6-1d4e-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 12:31:02 +0200 (CEST)
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
X-Inumbo-ID: 85c738b6-1d4e-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660645862;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CMoczpc6X4iEunS95Yl7Wr1c3lXS41rgyeZZWmsl8+4=;
  b=NKSk2KnoD5GJkFqUDRgRkSB8AIh4ZaVjxNGnkdlSLqqX5pcpflOi1b7X
   1vN0SNM9hgdOFgcjpcilVryEnx9AqsLit1691S0PoaR+2S90CXhL3NSJn
   YrWM5L6pKHKemtcDybtFgysfu1kQeC0/13jPuSl+o+XmODD0wiSx9xcrB
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78188457
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:o0QrCa/jaeH32dZNH1HIDrUDSn6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 mMeCD2Gb/uOamD3L9giaIy+/E1SvpOAxtU2HQRqpH88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EM24qyr0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGUhwWPrQ589ZLI2By3
 6AjeA4Uaw2xvrfjqF67YrEEasULKcDqOMUUu216zCGfBvEjKXzBa/yUv5kChm52350QW6aFD
 yYaQWMHgBDoahtTOlARGdQmkf2hnHXXeDxEslOF46Ew5gA/ySQugOG9YIaIJbRmQ+0MphaZn
 FL/0l3pQSAROOWw72e52XeV07qncSTTB9tJSezQGuRRqF+Owm0eDjUGWF39puO24ma0VshDM
 UUS9mwrpLIr6U2wZtDnWluzp3vsliAbX91cAugr8janw6Df4xuaLmUcRzsHY9sj3OctXiAj3
 FKNm9LvBBRsvaeTRHbb8a2bxRuiNC5QIWIcaCssSQoe/8KlsIw1lgjITNtoDOiylNKdMTP6z
 i2OrSM+r64OlsNN3KK+lXjYjjPqrZjESCY8/ACRVWWghj6Vf6b8OdbuswKCq68dcsDJFTFto
 UToheDAscANNLCEpBCvQdknQIr52e+ALQ/l1AsH84Yay9i9x5KyVdkOvmkgfx01Y5tslSzBO
 xGK514IjHNHFD7zNPIsPdrsYyg/5fK4fekJQMw4eTanjnJZUAactB9jakeLt4wGuBh9yPpvU
 Xt3nCvFMJr7NUiE5GDvLwvl+eV3rh3SPEuKLXwB8zyp0KCFeFmeQqofPV2FY4gRtf3a+FiFo
 4gHaZDRm32ztdEShQGGmbP/0HhQdSRrbXwIg5Y/mhG/zvpORzh6Vq65LUIJcI15haVF/tr1E
 oWGchYBkDLX2CyYQThmn1g5N9sDq74j8i9gVcHtVH70s0UejXGHt/1CKsVpLOh2pISOD5dcF
 pE4RilJOdwXIhyvxtjXRcOVQFBKHPhzuT+zAg==
IronPort-HdrOrdr: A9a23:FJjLa6gMKYQJHbUiiZH953L5oHBQXtYji2hC6mlwRA09TySZ//
 rBoB19726RtN9xYgBHpTnuAsm9qB/nmaKdgrNhWItKPjOW21dARbsKheCJrgEIcxeOkdK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.93,240,1654574400"; 
   d="scan'208";a="78188457"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Chen <wei.chen@arm.com>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH] build: Fix x86 build without EFI
Date: Tue, 16 Aug 2022 11:30:43 +0100
Message-ID: <20220816103043.32662-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We can't have a source file with the same name that exist in both the
common code and in the arch specific code for efi/. This can lead to
comfusion in make and it can pick up the wrong source file. This issue
lead to a failure to build a pv-shim for x86 out-of-tree, as this is
one example of an x86 build using the efi/stub.c.

The issue is that in out-of-tree, make might find x86/efi/stub.c via
VPATH, but as the target needs to be rebuilt due to FORCE, make
actually avoid changing the source tree and rebuilt the target with
VPATH ignored, so $@ lead to the build tree where "stub.c" dosen't
exist yet so a link is made to "common/stub.c".

Rework the new common/stub.c file to have a different name than the
already existing one. And build both *stub.c as two different objects.
This mean we have to move some efi_compat_* aliases which are probably
useless for Arm.

Avoid using $(EFIOBJ-y) as an alias for $(clean-files), add
common_stub.c directly to $(clean-files).

Fixes: 7f96859b0d00 ("xen: reuse x86 EFI stub functions for Arm")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

For the cflag addition in non-ARM_EFI, I was tempted to apply it to
the whole directory instead of just stub.o. (Even if there's only a
single object). I think that would be enough to overwrite the
-fshort-wchar from efi-common.mk, but I forgot what cflags come after
that. But adding it to just one object mean that it's added at the
last possible moment.
---
 xen/arch/arm/efi/Makefile                | 8 ++------
 xen/arch/x86/efi/Makefile                | 2 +-
 xen/common/efi/efi-common.mk             | 4 ++--
 xen/arch/x86/efi/stub.c                  | 7 -------
 xen/common/efi/{stub.c => common_stub.c} | 6 ++++++
 5 files changed, 11 insertions(+), 16 deletions(-)
 rename xen/common/efi/{stub.c => common_stub.c} (67%)

diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
index bd954a3b2d..8e463d156a 100644
--- a/xen/arch/arm/efi/Makefile
+++ b/xen/arch/arm/efi/Makefile
@@ -4,12 +4,8 @@ ifeq ($(CONFIG_ARM_EFI),y)
 obj-y += $(EFIOBJ-y)
 obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
 else
-# Add stub.o to EFIOBJ-y to re-use the clean-files in
-# efi-common.mk. Otherwise the link of stub.c in arm/efi
-# will not be cleaned in "make clean".
-EFIOBJ-y += stub.o
-obj-y += stub.o
+obj-y += common_stub.o
 
-$(obj)/stub.o: CFLAGS-y += -fno-short-wchar
+$(obj)/common_stub.o: CFLAGS-y += -fno-short-wchar
 
 endif
diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index 034ec87895..bbabfc3795 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -11,7 +11,7 @@ $(obj)/boot.init.o: $(obj)/buildid.o
 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
 $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary := $(cflags-stack-boundary)
 
-obj-y := stub.o
+obj-y := common_stub.o stub.o
 obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
 obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ-y))
 extra-$(XEN_BUILD_EFI) += buildid.o relocs-dummy.o
diff --git a/xen/common/efi/efi-common.mk b/xen/common/efi/efi-common.mk
index ec2c34f198..5d5c427e8b 100644
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
+clean-files += common_stub.c
 
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
diff --git a/xen/common/efi/stub.c b/xen/common/efi/common_stub.c
similarity index 67%
rename from xen/common/efi/stub.c
rename to xen/common/efi/common_stub.c
index 15694632c2..4dc724b2ac 100644
--- a/xen/common/efi/stub.c
+++ b/xen/common/efi/common_stub.c
@@ -30,3 +30,9 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
 {
     return -ENOSYS;
 }
+
+int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *)
+    __attribute__((__alias__("efi_get_info")));
+
+int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *)
+    __attribute__((__alias__("efi_runtime_call")));
-- 
Anthony PERARD


