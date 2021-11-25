Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA8945DB7B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231237.400088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5T-0006Qz-QG; Thu, 25 Nov 2021 13:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231237.400088; Thu, 25 Nov 2021 13:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5T-0006M4-JW; Thu, 25 Nov 2021 13:46:55 +0000
Received: by outflank-mailman (input) for mailman id 231237;
 Thu, 25 Nov 2021 13:46:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0l-0007NX-Oa
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:42:03 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77a09a08-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:42:02 +0100 (CET)
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
X-Inumbo-ID: 77a09a08-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MduM0JsgkZBJMQ1EP3iSTUZBDit7f0U+sXntkhT22ek=;
  b=DLCICTHY4abreI3Czy4uk6HR/o4xp1rrshPDjv98lrQFpSQl4Y2wfDfs
   VtgHuo2SQcs7h5OH7YGQvN2ZqO5TD4uib8eOvXeuiaoeBtIvYfXJmIQcq
   SJ3C4iF9kr6YrWGsiZME6MRRk813MrV8ZG88WDFY7tez5GsijhW3uYETE
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2alyoFq9MpGyovU7QSRTAi0cWX1WRc7Ul8O5oT+PZWjdafACqEPvo13hL1OxMZb8ig94QVh9Cn
 ddTGi1gC+SJgTvC1x2gb5nhuYpT8vn6CCQQQhT/wf8VPPItvIf7C+JLPkbCpX9qd0NQFwyu+sU
 0fn0MhWpksI69vaqGXvZSTe2tBiCpjQ9Hor9KsWH3HjShQHW3uyxcZnz95wprdU8CybGrzWmb1
 PkMbViXfUsQw8a8Lz8CVoafyOFc9Mwce7QFFNT+xSOzmZ7oscYs0D/GFUCBVJDqryhC92LVdRN
 c3Q35tZKq85aqZ8yovtaLvm6
X-SBRS: 5.1
X-MesageID: 58637888
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Bkdzt6zPDLc8ypZ724l6t+d6wCrEfRIJ4+MujC+fZmUNrF6WrkUEm
 2RJXW+OaK2La2fxetx2Pd+yp0oAupPdx4djHVdqpCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrRk2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt8Fpy
 /IXuMGwcBkOeYjHpeYyXBBpPxgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY25AQRqmON
 5pxhTxHcAbsSkFuanItEb0Zrt6QonraUzEFpwfAzUYwyzeKl1EguFT3C/LUZd6iVchThlyfp
 G/N4yL+GB5yHNaS0yaf+3SgwOrGhzrmWZk6Hae9sPVthTW72Wg7GBAQE1yhrpGRiESzRtZeI
 Ew84Tc1oO4580nDZuf6Wxq0sXuVpCk2UtBbE/A5wAyVw6+S6AGcbkANSCJBb9o38tc7XzUw2
 neGmtroAXpkt7j9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5LErOxj9DzMSH9x
 XaNtidWr64IkccB2qG//FbGqzGhvJ7ESkgy/Aq/Y46+xlonPsj/PdXusAWFq6YbRGqEcrWfl
 GkcmO/E4b0ONI+q0wmGfeciE7iYy8/QZVUwnmVTN5Um8j2s/VuqcoZR/CxyKS9VDyoURdP6S
 BSN4F0Mvfe/KFPvNPYqONzpV6zG2IC5TYy9Ps04eOaidXSYmOWv2Ch1LXCd0Gn2+KTHufFuY
 MzLGSpA4JtzNEiG8NZUb7tCuVPI7npnrY82eXwc5076uYdynFbPFd843KKmN4jVFp+srgTP6
 Mp4PMCX0RhZW+CWSnCJqtFMcgFafSlhW8GeRylrmgmreFQOJY3cI6WJneNJl3JNw8y5adskD
 lniAxQFmTITdFXMKBmQa2ALVV8cdc0XkJ7PBgR1ZQzA8yF6Oe6Htf5DH7NqLehP3LEylpZcE
 qhaE/hs99wSE1wrDRxGNsKjxGGjHTz27T+z092NPGJiIsU+HlORobcJvGLHrUEzM8Z+juNmy
 5XI6+8RacNrq91KAJmEZfSx4Um2uHRByut+U1GReotYeVn28ZgsICv016dlL8YJIBTF5z2by
 wfJXktI+biT+9c4oIvTmKSJj4a1CO8iTEBUKHbWsOStPi7A82v9nYIZCLSUfSrQXX/f8bm5Y
 bkH1On1NfAKxQ4Ys4d1H7tx47g54t/j++1Twgh+RS2ZZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQdIdgQ/b+mF2fUFoRXo7Kw4cBfg+St63LubSkEObROCvzNQceluO4Q/z
 OZ/5MNPs16jigAnO8qthzxP8zjeNWQJVqgqu81IAILvjQZ3mFhObYaFV33z6ZCLLd5NLlMrM
 nmfg6+b3+ZQwU/LcnwSE3nR3LUC2cRS6U4SlFJSdU6Untflh+Ms2EwD+Ds6eQ1Z0xFb3r8hI
 WNsLUB0ef2D8joAaBKvhIxw99Wt3CGkx3E=
IronPort-HdrOrdr: A9a23:08yYPKiyiFTPg/Dvpog7n7Ltq3BQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58637888"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Anthony PERARD
	<anthony.perard@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v8 40/47] RFC, no-VPATH: prepend $(srctree) to source prerequisite
Date: Thu, 25 Nov 2021 13:39:59 +0000
Message-ID: <20211125134006.1076646-41-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Anthony PERARD <anthony.perard@gmail.com>

Prefix many prerequisite with $(srctree) or replace $(src) with
$(srcdir) to not have to rely on VPATH=$(srctree).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/arch/arm/Makefile      | 2 +-
 xen/arch/x86/Makefile      | 4 ++--
 xen/arch/x86/boot/Makefile | 2 +-
 xen/arch/x86/efi/Makefile  | 2 +-
 xen/build.mk               | 6 +++---
 xen/include/Makefile       | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index ae7a2f907540..8b340affbe38 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -111,7 +111,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 .PHONY: include
 include:
 
-$(obj)/xen.lds: $(src)/xen.lds.S FORCE
+$(obj)/xen.lds: $(srcdir)/xen.lds.S FORCE
 	$(call if_changed,cpp_lds_S)
 
 $(obj)/dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 5fb7f1408768..9e5195f58d3b 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -236,7 +236,7 @@ include: $(objtree)/arch/x86/include/asm/asm-macros.h
 
 $(obj)/asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
 
-$(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefile
+$(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(srcdir)/Makefile
 	$(call filechk,asm-macros.h)
 
 define filechk_asm-macros.h
@@ -254,7 +254,7 @@ define filechk_asm-macros.h
 endef
 
 $(obj)/efi.lds: AFLAGS-y += -DEFI
-$(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
+$(obj)/xen.lds $(obj)/efi.lds: $(srcdir)/xen.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
 
 clean-files := \
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 4fc6b1d8ffc2..ccba2e281dfc 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -47,7 +47,7 @@ $(head-objs): %.S: %.bin
 	$(OBJCOPY) -O binary -R .got.plt $< $@
 
 
-%.lnk: %.o $(src)/build32.lds
+%.lnk: %.o $(srcdir)/build32.lds
 	$(LD) $(LDFLAGS_DIRECT) -N -T $(filter %.lds,$^) -o $@ $<
 
 clean-files := cmdline.S reloc.S *.lnk *.bin
diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index 81fda12a70ea..7af96629294a 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -3,7 +3,7 @@ include $(srctree)/common/efi/efi_common.mk
 quiet_cmd_objcopy_o_ihex = OBJCOPY $@
 cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
 
-$(obj)/%.o: $(src)/%.ihex FORCE
+$(obj)/%.o: $(srcdir)/%.ihex FORCE
 	$(call if_changed,objcopy_o_ihex)
 
 $(obj)/boot.init.o: $(obj)/buildid.o
diff --git a/xen/build.mk b/xen/build.mk
index 65d8dbc13828..7b48b7eb1404 100644
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -8,7 +8,7 @@ define cmd_banner
     mv -f $@.tmp $@
 endef
 
-.banner: tools/xen.flf FORCE
+.banner: $(srctree)/tools/xen.flf FORCE
 	$(call if_changed,banner)
 
 targets += .banner
@@ -33,14 +33,14 @@ define cmd_compile.h
     fi
 endef
 
-include/xen/compile.h: include/xen/compile.h.in .banner FORCE
+include/xen/compile.h: $(srctree)/include/xen/compile.h.in .banner FORCE
 	@cat .banner
 	$(call if_changed,compile.h)
 
 targets += include/xen/compile.h
 
 -include $(wildcard .asm-offsets.s.d)
-asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
+asm-offsets.s: $(srctree)/arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
 	$(CC) $(call cpp_flags,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
 	$(call move-if-changed,$@.new,$@)
 
diff --git a/xen/include/Makefile b/xen/include/Makefile
index a3977a8bfccd..9fbe9f0de772 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -52,7 +52,7 @@ $(obj)/compat/%.h: $(obj)/compat/%.i $(srcdir)/Makefile $(srctree)/tools/compat-
 $(obj)/compat/%.i: $(obj)/compat/%.c $(srcdir)/Makefile
 	$(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
 
-$(obj)/compat/%.c: $(src)/public/%.h $(srcdir)/xlat.lst $(srcdir)/Makefile $(srctree)/tools/compat-build-source.py
+$(obj)/compat/%.c: $(srcdir)/public/%.h $(srcdir)/xlat.lst $(srcdir)/Makefile $(srctree)/tools/compat-build-source.py
 	mkdir -p $(@D)
 	$(PYTHON) $(srctree)/tools/compat-build-source.py $(srcdir)/xlat.lst <$< >$@.new
 	mv -f $@.new $@
-- 
Anthony PERARD


