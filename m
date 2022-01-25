Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C121E49B2A1
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:07:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260099.449291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfm-0007rE-M7; Tue, 25 Jan 2022 11:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260099.449291; Tue, 25 Jan 2022 11:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfm-0007hZ-B5; Tue, 25 Jan 2022 11:07:38 +0000
Received: by outflank-mailman (input) for mailman id 260099;
 Tue, 25 Jan 2022 11:07:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJaV-0006t5-9x
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:02:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d1fe641-7dce-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 12:02:09 +0100 (CET)
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
X-Inumbo-ID: 3d1fe641-7dce-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/rio6ojrA2h1MkFyzp9Ib8BoAtp1CgaQstP8lKsEqLA=;
  b=JZWTYEF+CUxQdePmw67cqngKjFvt7EkM0WG99FQIErxsUWAA1CNSn/eL
   STCmD9zwsA1xcwm3abnLrBGEriKe8sE6g0lURayz6HZantqvUHm8NaN1Q
   /13v3l5J77NMNjyY4ltUgGiHmZaWKah2mCxsR2vhxBLYYXt4ATFfdKI/c
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NqWw4dGl0ToM3jK/1c0bwqcMMJkGcFVGrpQFDcj3XdPbqwNfVrEf7mirbhvlmbWjg0uLAYDPei
 sx16LYWTsOzSKJ7jbyDyJ9Q3dSrAzwLO164MSj/Zs+OFjM9g9Mh5yErVKx6ASskILUKLMSJGyu
 myo8pUDoGVZKA8Czz+bAjyt8/1tqYxd4ajlZNsNkYVkqoqelKyXcTJRItQPtxUUrRN+D38v2nZ
 sn3iP4Mnjr4F5S2rmCvazriZN2/GC11NZ2/KA8qc6OfHjT31+AZ62vEPcXCZBkmNOUbCZTsRTN
 JI/+L+226JW7DYx4zjJ6fgyH
X-SBRS: 5.2
X-MesageID: 62618991
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:i0lCVagB7TVaTG402X+e71P5X1615xcKZh0ujC45NGQN5FlHY01je
 htvXmGFO/mCYGD8edgjaNjn8UJTu5fTy9ExQQVl+SFhRSgb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tcy3IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1ImM2zZiUAYZadlbxAcEIDPnh0BIB/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNaiEO
 ZNJOGs2BPjGSzxuHX4bK60Cpsy1ll7lehNXj1aqgKVitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEmevnjS79HoUIG9WQ9ONugVCV7nweDlsRT1TTiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0WdBdDuk74wGl0bfP7kCSAW1sc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYXewp7S7jxrtAnkYdTIhPnQpFAE8zuC29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+yskPNbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N/03AYH83oJrW3FF5ufkWZ4um0WyKBBaZ5sRNMRS
 BWP0T69HqN7MnqwdrNQaImsEcksxqWIPY27CquMMosRPcYgJVfvEMRSiai4hTyFfK8EyvlXB
 HtmWZz0USZy5VpPklJauNvxIZd0n3tjlAs/tLjwzgi90Kr2WZJmYextDbd6VchgtPnsiFyMq
 753bpLWoz0CDrGWSnSJoOY7cABbRVBmVMueg5EGKYa+zv9ORTtJI+XP2okoZ4ENt/0Tzo8kC
 FnnBB8BoLc+7FWaQTi3hodLMeO2As0n/CtlZETB/z+AghAeXGpm149HH7NfQFXt3LELISdcQ
 6ZXdsOeLO5ITzibqT0RYYOk9N5pdQixhBLINC2gOWBtc5llTg3P29nlYgqwq3VeUnvp7ZMz8
 ++6ywfWYZsfXAA+XszYX+2ikgGqtn8HleMsA0aReotPeF/h+ZRBIjDqiqNlONkFLBjOn2PI1
 wufDRoCi/PKpos5rIvAiaye9t/7GOpiBEtKWWLc6O/uZyXd+2Oix65GUfqJIm+BBD+lpv36a
 LwMnf/mMfABkFJbiKZGEu5mnfAk+t/ih75G1QA4Tn/FWEumV+F7KX6c0MgR6qAUnu1FuRG7U
 16k88VBPenbI9vsFVMcKVZ3bumH0v1IyDDe4e5sfRf/7S5zurGGTV9TL1+HjykEdOl5N4Ysw
 OEAvs8K6lPg1kp2Y4je1i0EpX6RKnEgUrk8ssBICYDmvQMn11VebMGOESTx+pyON41BP0RCz
 uV4X0Yea2CwHnb/Tkc=
IronPort-HdrOrdr: A9a23:VxNa761OrKnpBDh5C0dwZAqjBI4kLtp133Aq2lEZdPUzSL39qy
 nOpoV/6faaskdzZJhNo7G90cq7L080l6QFhrX5VI3KNGOKhILBFvAF0WKI+UyDJ8SRzI5gPI
 5bAtFD4IKaNzNHZLzBjzVQuexQuOVvi5rFudvj
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62618991"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v9 23/30] build,x86: remove the need for build32.mk
Date: Tue, 25 Jan 2022 11:00:56 +0000
Message-ID: <20220125110103.3527686-24-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Rework "arch/x86/boot/Makefile" to allow it to build both file
"cmdline.S" and "reloc.S" without "build32.mk".

These will now use the main rules for "%.o: %.c", and thus generate a
dependency file. (We will not need to track the dependency manually
anymore.)

But for that, we need to override the main CFLAGS to do a 32bit build.
We introduce XEN_TREEWIDE_CFLAGS which can be reused in boot/Makefile,
and avoid the need to reparse Config.mk with a different value for
XEN_TARGET_ARCH. From this new $(XEN_TREEWIDE_CFLAGS), we only need to
change -m64 to have the 32bit flags. Then those are applied only to
"cmdline.o" and "reloc.o".

Specifically apply the rule "%.S: %.bin" to both cmdline.S and reloc.S
to avoid make trying to regenerate other %.S files with it.

There is no change expected to the resulting "cmdline.S" and
"reloc.S", only the *.o file changes as their symbol for FILE goes
from "cmdline.c" to "arch/x86//cmdline.c". (No idea why "boot" is
missing from the string.) (I've only check with GCC, not clang.)

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v9:
    - rename XEN_COMMON_CFLAGS to XEN_TREEWIDE_CFLAGS
    - rename $(head-objs) to $(head-srcs)
    - substitute LDFLAGS_DIRECT in %.lnk rule, rather than changing the value
      of it.
    
    v8:
    - avoid the need to list CFLAGS from Config.mk a second time by
      introducing XEN_COMMON_CFLAGS, and using it in boot/
    - improve LDFLAGS_DIRECT, by just substitute x64 to i368 from x86
      LDFLAGS_DIRECT. And thus avoid copying the logic from Config.mk.

 xen/Makefile                 |  4 +++
 xen/arch/x86/boot/Makefile   | 49 ++++++++++++++++++++++++------------
 xen/arch/x86/boot/build32.mk | 40 -----------------------------
 3 files changed, 37 insertions(+), 56 deletions(-)
 delete mode 100644 xen/arch/x86/boot/build32.mk

diff --git a/xen/Makefile b/xen/Makefile
index dc25fa443b82..8baa260b93a7 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -171,6 +171,10 @@ export LEX = $(if $(FLEX),$(FLEX),flex)
 # Default file for 'make defconfig'.
 export KBUILD_DEFCONFIG := $(ARCH)_defconfig
 
+# Copy CFLAGS generated by "Config.mk" so they can be reused later without
+# reparsing Config.mk by e.g. arch/x86/boot/.
+export XEN_TREEWIDE_CFLAGS := $(CFLAGS)
+
 # CLANG_FLAGS needs to be calculated before calling Kconfig
 ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
 CLANG_FLAGS :=
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 1ac8cb435e0e..ca8001c72b23 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,25 +1,42 @@
 obj-bin-y += head.o
+head-srcs := cmdline.S reloc.S
 
-DEFS_H_DEPS = $(abs_srctree)/$(src)/defs.h $(abs_srctree)/include/xen/stdbool.h
+nocov-y += $(head-srcs:.S=.o)
+noubsan-y += $(head-srcs:.S=.o)
+targets += $(head-srcs:.S=.o)
 
-CMDLINE_DEPS = $(DEFS_H_DEPS) $(abs_srctree)/$(src)/video.h \
-	       $(BASEDIR)/include/xen/kconfig.h \
-	       $(BASEDIR)/include/generated/autoconf.h
+head-srcs := $(addprefix $(obj)/, $(head-srcs))
 
-RELOC_DEPS = $(DEFS_H_DEPS) \
-	     $(BASEDIR)/include/generated/autoconf.h \
-	     $(BASEDIR)/include/xen/kconfig.h \
-	     $(BASEDIR)/include/xen/multiboot.h \
-	     $(BASEDIR)/include/xen/multiboot2.h \
-	     $(BASEDIR)/include/xen/const.h \
-	     $(BASEDIR)/include/public/arch-x86/hvm/start_info.h
+$(obj)/head.o: $(head-srcs)
 
-$(obj)/head.o: $(obj)/cmdline.S $(obj)/reloc.S
+CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
+$(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
+CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
+CFLAGS_x86_32 += -I$(srctree)/include
 
-$(obj)/cmdline.S: $(src)/cmdline.c $(CMDLINE_DEPS) $(src)/build32.lds
-	$(MAKE) -f $(abs_srctree)/$(src)/build32.mk -C $(obj) $(@F) CMDLINE_DEPS="$(CMDLINE_DEPS)"
+# override for 32bit binaries
+$(head-srcs:.S=.o): CFLAGS_stack_boundary :=
+$(head-srcs:.S=.o): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
 
-$(obj)/reloc.S: $(src)/reloc.c $(RELOC_DEPS) $(src)/build32.lds
-	$(MAKE) -f $(abs_srctree)/$(src)/build32.mk -C $(obj) $(@F) RELOC_DEPS="$(RELOC_DEPS)"
+$(head-srcs): %.S: %.bin
+	(od -v -t x $< | tr -s ' ' | awk 'NR > 1 {print s} {s=$$0}' | \
+	sed 's/ /,0x/g' | sed 's/,0x$$//' | sed 's/^[0-9]*,/ .long /') >$@
+
+# Drop .got.plt during conversion to plain binary format.
+# Please check build32.lds for more details.
+%.bin: %.lnk
+	$(OBJDUMP) -h $< | sed -n '/[0-9]/{s,00*,0,g;p;}' | \
+		while read idx name sz rest; do \
+			case "$$name" in \
+			.got.plt) \
+				test $$sz != 0c || continue; \
+				echo "Error: non-empty $$name: 0x$$sz" >&2; \
+				exit $$(expr $$idx + 1);; \
+			esac; \
+		done
+	$(OBJCOPY) -O binary -R .got.plt $< $@
+
+%.lnk: %.o $(src)/build32.lds
+	$(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) -N -T $(filter %.lds,$^) -o $@ $<
 
 clean-files := cmdline.S reloc.S *.lnk *.bin
diff --git a/xen/arch/x86/boot/build32.mk b/xen/arch/x86/boot/build32.mk
deleted file mode 100644
index e90680cd9f52..000000000000
--- a/xen/arch/x86/boot/build32.mk
+++ /dev/null
@@ -1,40 +0,0 @@
-override XEN_TARGET_ARCH=x86_32
-CFLAGS =
-include $(XEN_ROOT)/Config.mk
-
-$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
-
-CFLAGS += -Werror -fno-builtin -g0 -msoft-float
-CFLAGS += -I$(BASEDIR)/include
-CFLAGS := $(filter-out -flto,$(CFLAGS)) 
-
-# NB. awk invocation is a portable alternative to 'head -n -1'
-%.S: %.bin
-	(od -v -t x $< | tr -s ' ' | awk 'NR > 1 {print s} {s=$$0}' | \
-	sed 's/ /,0x/g' | sed 's/,0x$$//' | sed 's/^[0-9]*,/ .long /') >$@
-
-# Drop .got.plt during conversion to plain binary format.
-# Please check build32.lds for more details.
-%.bin: %.lnk
-	$(OBJDUMP) -h $< | sed -n '/[0-9]/{s,00*,0,g;p;}' | \
-		while read idx name sz rest; do \
-			case "$$name" in \
-			.got.plt) \
-				test $$sz != 0c || continue; \
-				echo "Error: non-empty $$name: 0x$$sz" >&2; \
-				exit $$(expr $$idx + 1);; \
-			esac; \
-		done
-	$(OBJCOPY) -O binary -R .got.plt $< $@
-
-%.lnk: %.o build32.lds
-	$(LD) $(LDFLAGS_DIRECT) -N -T build32.lds -o $@ $<
-
-%.o: %.c
-	$(CC) $(CFLAGS) -c -fpic $< -o $@
-
-cmdline.o: cmdline.c $(CMDLINE_DEPS)
-
-reloc.o: reloc.c $(RELOC_DEPS)
-
-.PRECIOUS: %.bin %.lnk
-- 
Anthony PERARD


