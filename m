Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B84E049B2A2
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:07:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260098.449285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfl-0007hf-NQ; Tue, 25 Jan 2022 11:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260098.449285; Tue, 25 Jan 2022 11:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfl-0007eU-EL; Tue, 25 Jan 2022 11:07:37 +0000
Received: by outflank-mailman (input) for mailman id 260098;
 Tue, 25 Jan 2022 11:07:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJb2-0006Mn-C6
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:02:44 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50fcf369-7dce-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 12:02:43 +0100 (CET)
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
X-Inumbo-ID: 50fcf369-7dce-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108563;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pf+rJf+H7YlDDio2xF1w7jWKbBY30COaMLlH5VZa/KI=;
  b=iFzJw3PsRk4noNEXijIaafFzmvEO/NiimQbpLZ/Cg7aAJhjdcqVQT6om
   xvQ8HdeJVWCjvhGz1vocwrVGVm2pe66qaHqeimfkLZmmeeheEtdY8NNuD
   L1XTmAA62tTvA5rZ3C5xesnDScLiM1gVWkO0nRWPn338HJQpwY70SQxeY
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 12IceQB92gtkZlJSurxvXcagHZefC0URpMS6/gEGskjPQGxzaLkOW+rIOFqxvLDAe6sR65klEo
 WUoHqhM/WTzB/wlN9888maMq+MMPndHQ1aR1J9dv/tmjxT97M2BT7Ogho9JLeecyEQ+aRgXBb/
 +HW9w6ReOz27hWbskyjDF8UEmvToflArWwboIbZrIXObU9KqDiDp2qIRz/gRr5JYLzMoCrT/eF
 PoLHP3nur2zEhHaISArTToybOjtOmWXgdYNKWMF0wtSxturXbI6WfhhaEQuHib5s9rK+cwUY21
 vDmUPvkJHtP0SISK8j82JXTu
X-SBRS: 5.2
X-MesageID: 63107014
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5quTuK2a5FfN48CHhfbD5Xl2kn2cJEfYwER7XKvMYLTBsI5bpzIAm
 DdJUW2APKmNYGCgf9Egb97k9UhXucPTytUxT1NopC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wbNh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhpdAo5
 8tt6aGKVAIqYKrlnuUbURB7HHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9u3ZkWQq6HO
 6L1bxJsayvtZB12ZG0cFZJkusrwhCTCfw1H/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 lzB+2P1ExQLLuu1wDCO8m+vruLXlCa9U4UXfJWy++R2mlSVyioWAQcPSFqgifCjjwi1XNc3A
 1cP5iMkoKw29UqqZtrwRRu1pDiDpBF0c8pdFag25R+AzoLQ4h2FHS4UQzhZctskucQqAzsw2
 TehndnkGDhuu729Um+G+/GfqjbaESoIKW4PYwcUQA1D5MPsyLzflTqWEIwlSvTsyISoR3egm
 FhmsRTSmZ0pjZckyYXnwGrahjHyobHPTwg37ybYCzfNAhxCWKapYImh6F7+5PlGLZqEQlTpg
 EXoi/Ry/8hVU8jTyXXlrPElWejwuq3baGG0bUtHQsF5nwlB7UJPamy5DNtWAE5yevgJdjbyC
 KM4kVMAvcQDVJdGgEIeXm5QNyjI5fW4fTgGfqqNBjarXnSXXFXblM2JTRXIt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNGcujk0X4juTPNSb9pVI53L2mNLxRAESs+129z
 jqiH5HSl0U3vBPWPEE7DrL/3XhVdCNmVPgaWuRcd/KZIxoOJY3SI6S5/F/VQKQ8x/49vr6Rp
 hmVAxYEoHKi2yGvAVjUOxhLNeO+Nb4i/ClTFXF9Yj6VN40LPNzHAFE3LcVnJNHKNYVLkJZJc
 hXyU5zQW6sUEmWepW11gFuUhNUKSSlHTDmmZ0KNCAXTtbY8L+AQ0tO7LAbp6gcUCS+76Zk3r
 7G6j1uJSpsfXQVySs3Rbav3nV+2uHEcnsN0XlfJfYYPKBm9rtAyJnyjlOIzLuENNQ7HmmmQ2
 TGJDEpKvuLKuYI0roXE3PjWs4ezHuJiNUNGBG2Hv62uPCzX8zP7k49NWeqFZx7HU2bw9Pnwb
 OlZ1aikYvYGgExLo8x3FLMylfAy4N7mprl7yAV4HSqUMwT3W+04enTfhJtBrKxAwLNdqDCaY
 EPX94kII6iNNePkDEUVeFgvYNOc2KxGgTLV9/k0fhn3vXcl4LqdXExOFBCQkygBfqBtOYYoz
 Op96s4b7wuz1kgjPtqc130G8m2NKjoLUrk9t4FcC4ju01J5xlZHaJ3aKyn3/JDQNIkcbhh0e
 meZ1PjYmrBR5kveaH5iR3HC0N1UiYkKpB0XnkQJIE6Em4adi/I6tPGLHe/bkuiBIs177t9O
IronPort-HdrOrdr: A9a23:PaBtvq69H5kKpOthnwPXwM7XdLJyesId70hD6qhwISY7TiX+rb
 HIoB17726MtN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4ZmpM
 FdmsNFZuEYY2IXsS+D2njaL+od
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="63107014"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v9 24/30] build: grab common EFI source files in arch specific dir
Date: Tue, 25 Jan 2022 11:00:57 +0000
Message-ID: <20220125110103.3527686-25-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Rather than preparing the efi source file, we will make the symbolic
link as needed from the build location.

The `ln` command is run every time to allow to update the link in case
the source tree change location.

This patch also introduce "efi-common.mk" which allow to reuse the
common make instructions without having to duplicate them into each
arch.

And now that we have a list of common source file, we can start to
remove the links to the source files on clean.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v9:
    - rename efi_common.mk to efi-common.mk
    - generalize comment about cleaning "efi" and "boot" subdir in x86.
    - add a space after the other comma of $(patsubst )
    - create a relative symlink instead of an absolute one
    - with the above, we don't need to use $(abs_srctree) anymore in the
      prerequisite of the link to the efi source file, use $(srctree).
    
    v8:
    - use symbolic link instead of making a copy of the source
    - introduce efi_common.mk
    - remove links to source file on clean
    - use -iquote for "efi.h" headers in common/efi

 xen/Makefile                 |  5 -----
 xen/arch/arm/efi/Makefile    |  4 ++--
 xen/arch/x86/Makefile        |  3 ++-
 xen/arch/x86/efi/Makefile    |  5 +----
 xen/common/efi/efi-common.mk | 15 +++++++++++++++
 5 files changed, 20 insertions(+), 12 deletions(-)
 create mode 100644 xen/common/efi/efi-common.mk

diff --git a/xen/Makefile b/xen/Makefile
index 8baa260b93a7..443784dfce80 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -444,11 +444,6 @@ $(TARGET).gz: $(TARGET)
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
index 1b1ed06feddc..4313c390665f 100644
--- a/xen/arch/arm/efi/Makefile
+++ b/xen/arch/arm/efi/Makefile
@@ -1,4 +1,4 @@
-CFLAGS-y += -fshort-wchar
+include $(srctree)/common/efi/efi-common.mk
 
-obj-y += boot.init.o pe.init.o ebmalloc.o runtime.o
+obj-y += $(EFIOBJ-y)
 obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index c94b4092d4c1..a847c989ff92 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -77,8 +77,9 @@ obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
 obj-y += sysctl.o
 endif
 
-# Allows "clean" to descend into boot/
+# Allows "clean" to descend
 subdir- += boot
+subdir- += efi
 
 extra-y += asm-macros.i
 extra-y += xen.lds
diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index e08b4d8e4808..034ec87895df 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -1,4 +1,4 @@
-CFLAGS-y += -fshort-wchar
+include $(srctree)/common/efi/efi-common.mk
 
 quiet_cmd_objcopy_o_ihex = OBJCOPY $@
 cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
@@ -8,9 +8,6 @@ $(obj)/%.o: $(src)/%.ihex FORCE
 
 $(obj)/boot.init.o: $(obj)/buildid.o
 
-EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
-EFIOBJ-$(CONFIG_COMPAT) += compat.o
-
 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
 $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary := $(cflags-stack-boundary)
 
diff --git a/xen/common/efi/efi-common.mk b/xen/common/efi/efi-common.mk
new file mode 100644
index 000000000000..ad3c6f2569c3
--- /dev/null
+++ b/xen/common/efi/efi-common.mk
@@ -0,0 +1,15 @@
+EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
+EFIOBJ-$(CONFIG_COMPAT) += compat.o
+
+CFLAGS-y += -fshort-wchar
+CFLAGS-y += -iquote $(srctree)/common/efi
+
+# Part of the command line transforms $(obj) in to a relative reverted path.
+# e.g.: It transforms "dir/foo/bar" into successively
+#       "dir foo bar", ".. .. ..", "../../.."
+$(obj)/%.c: $(srctree)/common/efi/%.c FORCE
+	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/common/efi/$(<F) $@
+
+clean-files += $(patsubst %.o, %.c, $(EFIOBJ-y:.init.o=.o) $(EFIOBJ-))
+
+.PRECIOUS: $(obj)/%.c
-- 
Anthony PERARD


