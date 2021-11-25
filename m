Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D7845DB8C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231297.400286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6F-0006pP-JD; Thu, 25 Nov 2021 13:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231297.400286; Thu, 25 Nov 2021 13:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6F-0006dp-7v; Thu, 25 Nov 2021 13:47:43 +0000
Received: by outflank-mailman (input) for mailman id 231297;
 Thu, 25 Nov 2021 13:47:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0I-0007NX-8u
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66c97b81-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:41:33 +0100 (CET)
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
X-Inumbo-ID: 66c97b81-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W9kLV8awBaqF9dybV3WIA0DVErlqsPPM8G6KoE90GX4=;
  b=B7u1uvrtUsuQn/Olb+NZaa5u8OIRxxTpYOCzXog+peH9mT7lv3amTZAX
   s84sV6CfFv4EqCox3gc6V+SyMI6pfC4LD0fjYtG/4UDsQ1zwCHyCtd5la
   Tn2119EGjUEYrNB7Eu+FfS5w/KTzTFAlou1bgcl/D75BhZuBAkouSxSRR
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2AtnMImGH8SE5RsQYLyIPQrcbVa0haZAFKxzaTuB54LjHbjyaXQAKsX/+6hq+wdDnSxAn0uf3I
 WonahPf+b+KuZtcfXlwvPJwzM2Z6iEWghsksqcswrOibl45VUWRs2chcaWtTi46HdXQIeIgL7K
 0UUr0105JH8vC1G7K+9/BUQBBqSoo0nqYtbStTNEfvVc7P6r1mSg5Q7ISi8B4SlAiyo5tpE7YV
 TSPeO2weMXlKyEUBQhU+UBzmP3VwFqZygDEaNdSDmvcsBO+KNAK1hp4QHf7WAsvxZdDHYky1Lq
 BLlI1BvCPmAHDheey55/9hjA
X-SBRS: 5.1
X-MesageID: 58576698
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:edXt/azUmEmlv5R6z556t+ecwSrEfRIJ4+MujC+fZmUNrF6WrkUPm
 2NJDWqAb/+NYTT3eNhyOt7npx8PvpPXmtVrG1NkpSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrRk2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/9/z
 +pn6LG+cwM0BqLSv90nbUZlGggraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY25ATQqiAN
 ppxhTxHKzvEbxRQK2ouA4slusO5jCP0VxFdgQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krd5HjwCBweMN2ZyBKG/2iqi+uJmjn0MKoYGaek7PdsjBuWz3YKFRwNfVKhpL+yjUvWc+xYL
 0sY6y8/t58Y/UagTsT+dxCgqXvCtRkZM/JRDO8S+AyL0rDT4QuSGi4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L3IGZCICZRsI5Z/kuo5bphDFQ8tnEaW1psboAjy2y
 DePxBXSnJ1K05RNjf/iuwma3XT8/fAlUzLZ+C34UGWaxF5UarSherSn93/i18gfEY+wGwzpU
 Gc/p+CS6+UHDJeonSOLQfkQELzB28tpIAEwknY0QcB/qm3FF2qLONkJvWogfBsB3tMsIGexO
 CfuVRVtCIi/1ZdARYt+eMqPBssj1sAM/vy1B6mPPrKijnWcHTJrHR2Ch2bMgAgBc2B2yMnT3
 Kt3lu72UB4n5VxPlmbeegvk+eZDKtoC7W3SX4vn6B+szKCTYnWYIZ9cbgDRMb9ovPPV+luEm
 zq6Cydt408BONASnwGNqdJDRbz0BSRT6W/KRzx/KbfYf1sO9JAJAP7N27IxE7GJbIwO/tokC
 kqVAxcCoHKm3CWvAVzTNhhLNeO+Nb4i/ClTFXF9Yj6VN40LPN/HAFE3LMBsI9HKNYVLkJZJc
 hXyU5naX6kUFG2Yo291gFuUhNUKSSlHTDmmZ0KNCAXTtbY5L+AQ0tO7LAbp6gcUCS+76Zk3r
 7G6j1uJSpsfXQVySs3Rbav3nV+2uHEcnsN0XlfJfYYPKBm9rtAyJnyjlOIzLuENNQ7HmmmQ2
 TGJDEpKvuLKuYI0roXE3PjWs4ezHuJiNUNGBG2Hv62uPCzX8zP7k49NWeqFZx7HU2bw9Pnwb
 OlZ1aikYvYGgExLo8x3FLMylfAy4N7mprl7yAV4HSqUMwT3W+04enTfhJtBrKxAwLNdqDCaY
 EPX94kII6iNNePkDEUVeFgvYNOc2KxGgTLV9/k0fhn3vXcl4LqdXExOFBCQkygBfqBtOYYoz
 Op96s4b7wuz1kgjPtqc130G8m2NKjoLUrk9t4FcC4ju01J5xlZHaJ3aKyn3/JDQNIkcbhh0e
 meZ1PjYmrBR5kveaH5iR3HC0N1UiYkKpB0XnkQJIE6Em4adi/I6tPGLHe/bkuiBIs177t9O
IronPort-HdrOrdr: A9a23:FOlTQ6ivXU3U8GWEG0Uw5+Bjg3BQXuIji2hC6mlwRA09TySZ//
 rBoB19726TtN9xYgBZpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdGSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58576698"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [XEN PATCH v8 27/47] build: grab common EFI source files in arch specific dir
Date: Thu, 25 Nov 2021 13:39:46 +0000
Message-ID: <20211125134006.1076646-28-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Rather than preparing the efi source file, we will make the symbolic
link as needed from the build location.

The `ln` command is run every time to allow to update the link in case
the source tree change location.

This patch also introduce "efi_common.mk" which allow to reuse the
common make instructions without having to duplicate them into each
arch.

And now that we have a list of common source file, we can start to
remove the links to the source files on clean.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v8:
    - use symbolic link instead of making a copy of the source
    - introduce efi_common.mk
    - remove links to source file on clean
    - use -iquote for "efi.h" headers in common/efi

 xen/Makefile                 |  5 -----
 xen/arch/arm/efi/Makefile    |  4 ++--
 xen/arch/x86/Makefile        |  1 +
 xen/arch/x86/efi/Makefile    |  5 +----
 xen/common/efi/efi_common.mk | 12 ++++++++++++
 5 files changed, 16 insertions(+), 11 deletions(-)
 create mode 100644 xen/common/efi/efi_common.mk

diff --git a/xen/Makefile b/xen/Makefile
index 90e8191f51ce..2a809d577fc3 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -447,11 +447,6 @@ $(TARGET).gz: $(TARGET)
 $(TARGET): FORCE
 	$(Q)$(MAKE) $(build)=tools
 	$(Q)$(MAKE) $(build)=. include/xen/compile.h
-	[ -e arch/$(TARGET_ARCH)/efi ] && for f in $$(cd common/efi; echo *.[ch]); \
-		do test -r arch/$(TARGET_ARCH)/efi/$$f || \
-		   ln -nsf ../../../common/efi/$$f arch/$(TARGET_ARCH)/efi/; \
-		done; \
-		true
 	$(Q)$(MAKE) $(build)=include all
 	$(Q)$(MAKE) $(build)=arch/$(TARGET_ARCH) include
 	$(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
index 1b1ed06feddc..57616a17cb03 100644
--- a/xen/arch/arm/efi/Makefile
+++ b/xen/arch/arm/efi/Makefile
@@ -1,4 +1,4 @@
-CFLAGS-y += -fshort-wchar
+include $(srctree)/common/efi/efi_common.mk
 
-obj-y += boot.init.o pe.init.o ebmalloc.o runtime.o
+obj-y += $(EFIOBJ-y)
 obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index e8151bf4b111..eabd8d3919a4 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -79,6 +79,7 @@ endif
 
 # Allows "clean" to descend into boot/
 subdir- += boot
+subdir- += efi
 
 extra-y += asm-macros.i
 extra-y += xen.lds
diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index ac815f02cb5e..81fda12a70ea 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -1,4 +1,4 @@
-CFLAGS-y += -fshort-wchar
+include $(srctree)/common/efi/efi_common.mk
 
 quiet_cmd_objcopy_o_ihex = OBJCOPY $@
 cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
@@ -8,9 +8,6 @@ $(obj)/%.o: $(src)/%.ihex FORCE
 
 $(obj)/boot.init.o: $(obj)/buildid.o
 
-EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
-EFIOBJ-$(CONFIG_COMPAT) += compat.o
-
 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
 $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS-stack-boundary := $(cflags-stack-boundary)
 
diff --git a/xen/common/efi/efi_common.mk b/xen/common/efi/efi_common.mk
new file mode 100644
index 000000000000..d2845fd6b3c8
--- /dev/null
+++ b/xen/common/efi/efi_common.mk
@@ -0,0 +1,12 @@
+EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
+EFIOBJ-$(CONFIG_COMPAT) += compat.o
+
+CFLAGS-y += -fshort-wchar
+CFLAGS-y += -iquote $(srctree)/common/efi
+
+$(obj)/%.c: $(abs_srctree)/common/efi/%.c FORCE
+	$(Q)ln -nfs $< $@
+
+clean-files += $(patsubst %.o,%.c, $(EFIOBJ-y:.init.o=.o) $(EFIOBJ-))
+
+.PRECIOUS: $(obj)/%.c
-- 
Anthony PERARD


