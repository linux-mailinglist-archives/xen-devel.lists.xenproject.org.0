Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A50645DB7C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231248.400137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5g-00089t-GE; Thu, 25 Nov 2021 13:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231248.400137; Thu, 25 Nov 2021 13:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5g-00085I-7b; Thu, 25 Nov 2021 13:47:08 +0000
Received: by outflank-mailman (input) for mailman id 231248;
 Thu, 25 Nov 2021 13:47:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0H-0007NX-3W
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:33 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 652e3202-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:41:31 +0100 (CET)
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
X-Inumbo-ID: 652e3202-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2QMfXUKxvTthImIF1JtX1MFJNxNq82iTmR07HivbeVE=;
  b=Te69j4Nv9oGbtWkWh6Up7Il7MAaEPvCAnFO1HI90uqa1MW61G9vU5t0L
   gjUuYyd2n6HajR5Y/I99zOF+7SNgcpQWVG6yag9yaQmhWUHgEGIjnj1K2
   eGvdqjQ0D0WRda7o/L7QyMoGxfPeeebpnJvI7yRfu+I5qyPxIgm5hTjxb
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NIY5SJKOzpsCsb0/5h/oJKAbuLW4u+Yw+hRGZAcK2+pXAh1VN6sDPgoDyXcUIIo44B75s7oWN2
 hMKcAncWLiPS1FJItV82QIMrdiMdTYKMIgLchd1FP8mZYH0K/4i2Mg20PXqKLv1kRGCXSnXJGd
 ThTguwj5wgbN/VTU0lCbGL+Fp9nEabUX5a8FLFrIMNMfazm6GM5P3iJqIRw+6LD8Ko2bbPZb2w
 6VwpMwaWXkCbtVZ2RKDO58lM1IDU4b61/iU5JneisC1FKTc/+os1wAjy8JszQd+YN4mKOjYSQ2
 OxkZyiZ5UYVX52seHC/JY5Fh
X-SBRS: 5.1
X-MesageID: 58576697
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:25z3Ia0nV5wSqEbXXvbD5S52kn2cJEfYwER7XKvMYLTBsI5bpz0Ex
 2YZCGmFM6mJNDbxL4hzbN/lp0oA68KHn4BjGwU+pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6wbNh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhtItt8
 fQdvoaMawJxHb/unMhHClpqDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9t1p0RQ6iPO
 KL1bxJCZhr7QRtqNWsbFb0PgfuPl3v4L2NH/Qf9Sa0fvDGIkV0ZPKLWGNjIft2HQ+1Fk0Deo
 XjJl0ziGQ0TPtGbzTuD81qvi/XJkCe9X5gdfJWn8tZ6jVvVwXYcYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiH+bvDYMVtxICeo45QqRjK3O7G6xBGIJUzpAY9wOr9ItSHoh0
 Vrhoj/yLWUx6vvPEyvbr+rK62PpUcQIEYMcTQRfUTIks9L5nKM21jHdbNJPSvf2vMKgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7AFgHZ1
 EXojfRy+wzn4XulsCWWCNsAE7iyjxpuGG2N2AU/d3XNGtnExpJCQWyyyG0hTKuKGpxdEdMMX
 KM0kVkMjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwPhHPgDG9wBl2z/BX1
 XKnnSGEVyhyNEia5GDuG7d1PUEDmkjSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPjsnekhy
 P4Gb5Hi40wGCIXWO3CLmaZOfQFiBSVqXvje9p0IHtNv1yI7QQnN/deKmuh/E2Gk9owI/tr1E
 oaVBhUFlQGh3CKfcm1nqBlLMdvSYHq2llpjVQREALpi8yFLjV+H4PhNep0pU6Mg8eA/n/d4Q
 +NcI5eLA+hVSySB8DMYNMGvoItnfRWtpASPIyv6P2RvI88+H1TEqo3+Yw/i1CgSFS7r58Ewl
 KKti1HASp0ZSgU8UMuPMKCzz0m8tGQ2kf5pWxeaOcFafUjhqdA4KyH4gvItDdsLLBHPmmmT2
 wqMWE9KrujRuY4lttLOgPnc/YuuFuJ/GGtcHnXasunqZXWLoDL7zNYZAuiSfD3bWGflw4mYZ
 L1Yn6PmLfkKvFdWqI4gQbxl+r0zuon0rLhAwwU6QHiSNwa3CqltK2Wt1NVUsvEf3adQvAa7V
 x7d+tRePrnVasrpHERIeVggZ+WHk/oVhiPT/bI+J0CjvH17+7+OUENzORiQiXMCcOspYd19m
 epx6tQL7wGfiwYxNofUhy9ZwG2AM3gcXvh1rZodGoLq1lImx1wqjUYw0cMqDEVjs+lxD3Q=
IronPort-HdrOrdr: A9a23:VmdI8KkZKiCK4ubkBv59ytdI5pPpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7gr5OUtQ4exoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCFHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58576697"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v8 26/47] build,x86: remove the need for build32.mk
Date: Thu, 25 Nov 2021 13:39:45 +0000
Message-ID: <20211125134006.1076646-27-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Rework "arch/x86/boot/Makefile" to allow it to build both file
"cmdline.S" and "reloc.S" without "build32.mk".

These will now use the main rules for "%.o: %.c", and thus generate a
dependency file. (We will not need to track the dependency manually
anymore.)

But for that, we need to override the main CFLAGS to do a 32bit build.
We introduce XEN_COMMON_CFLAGS which can be reused in boot/Makefile,
and avoid the need to reparse Config.mk with a different value for
XEN_TARGET_ARCH. From this new $(XEN_COMMON_CFLAGS), we only need to
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
    v8:
    - avoid the need to list CFLAGS from Config.mk a second time by
      introducing XEN_COMMON_CFLAGS, and using it in boot/
    - improve LDFLAGS_DIRECT, by just substitute x64 to i368 from x86
      LDFLAGS_DIRECT. And thus avoid copying the logic from Config.mk.

 xen/Makefile                 |  4 +++
 xen/arch/x86/boot/Makefile   | 52 +++++++++++++++++++++++++-----------
 xen/arch/x86/boot/build32.mk | 40 ---------------------------
 3 files changed, 40 insertions(+), 56 deletions(-)
 delete mode 100644 xen/arch/x86/boot/build32.mk

diff --git a/xen/Makefile b/xen/Makefile
index deae319c8a5a..90e8191f51ce 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -171,6 +171,10 @@ export LEX = $(if $(FLEX),$(FLEX),flex)
 # Default file for 'make defconfig'.
 export KBUILD_DEFCONFIG := $(ARCH)_defconfig
 
+# Copy CFLAGS generated by "Config.mk" so they can be reused later without
+# reparsing Config.mk by e.g. arch/x86/boot/.
+export XEN_COMMON_CFLAGS := $(CFLAGS)
+
 # CLANG_FLAGS needs to be calculated before calling Kconfig
 ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
 CLANG_FLAGS :=
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 1ac8cb435e0e..5395aae5d57e 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,25 +1,45 @@
 obj-bin-y += head.o
+head-objs := cmdline.S reloc.S
 
-DEFS_H_DEPS = $(abs_srctree)/$(src)/defs.h $(abs_srctree)/include/xen/stdbool.h
+nocov-y += $(head-objs:.S=.o)
+noubsan-y += $(head-objs:.S=.o)
+targets += $(head-objs:.S=.o)
 
-CMDLINE_DEPS = $(DEFS_H_DEPS) $(abs_srctree)/$(src)/video.h \
-	       $(BASEDIR)/include/xen/kconfig.h \
-	       $(BASEDIR)/include/generated/autoconf.h
+head-objs := $(addprefix $(obj)/, $(head-objs))
 
-RELOC_DEPS = $(DEFS_H_DEPS) \
-	     $(BASEDIR)/include/generated/autoconf.h \
-	     $(BASEDIR)/include/xen/kconfig.h \
-	     $(BASEDIR)/include/xen/multiboot.h \
-	     $(BASEDIR)/include/xen/multiboot2.h \
-	     $(BASEDIR)/include/xen/const.h \
-	     $(BASEDIR)/include/public/arch-x86/hvm/start_info.h
+$(obj)/head.o: $(head-objs)
 
-$(obj)/head.o: $(obj)/cmdline.S $(obj)/reloc.S
+$(head-objs:.S=.lnk): LDFLAGS_DIRECT := $(subst x86_64,i386,$(LDFLAGS_DIRECT))
 
-$(obj)/cmdline.S: $(src)/cmdline.c $(CMDLINE_DEPS) $(src)/build32.lds
-	$(MAKE) -f $(abs_srctree)/$(src)/build32.mk -C $(obj) $(@F) CMDLINE_DEPS="$(CMDLINE_DEPS)"
+CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_COMMON_CFLAGS))
+$(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
+CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
+CFLAGS_x86_32 += -I$(srctree)/include
 
-$(obj)/reloc.S: $(src)/reloc.c $(RELOC_DEPS) $(src)/build32.lds
-	$(MAKE) -f $(abs_srctree)/$(src)/build32.mk -C $(obj) $(@F) RELOC_DEPS="$(RELOC_DEPS)"
+# override for 32bit binaries
+$(head-objs:.S=.o): CFLAGS-stack-boundary :=
+$(head-objs:.S=.o): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
+
+$(head-objs): %.S: %.bin
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
+
+%.lnk: %.o $(src)/build32.lds
+	$(LD) $(LDFLAGS_DIRECT) -N -T $(filter %.lds,$^) -o $@ $<
 
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


