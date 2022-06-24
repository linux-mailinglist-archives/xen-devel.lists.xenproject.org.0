Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D452559E0C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:05:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355603.583351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnZ-0005G5-4Y; Fri, 24 Jun 2022 16:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355603.583351; Fri, 24 Jun 2022 16:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnY-00059Z-UU; Fri, 24 Jun 2022 16:04:44 +0000
Received: by outflank-mailman (input) for mailman id 355603;
 Fri, 24 Jun 2022 16:04:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lnW-0004qc-MM
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:04:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58be9a20-f3d7-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 18:04:39 +0200 (CEST)
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
X-Inumbo-ID: 58be9a20-f3d7-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SYJTJIKxHEFQcMKNpvz4kHz4LT/E8ZyffBaU/35UM+o=;
  b=HmzEjoLDOpRxONKwf00fObo3vaIJ5nB6CgEG5DHe/38eBMK1hMnarIcz
   rh/MIbAT//k992vK1EAAAxeD49R5VToSRF7Dij1YpAchiESf/wDhZYrXf
   BuLLRGwonlTwa4LqTU1j1syPrT6w5ooL5Gn8DYZuCZ8+pQjC/Qqp6K6rh
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74362336
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nXFssakeiBmCED/TfVVOVYLo5gzbJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNCGHUMvuIajb2ctEjYYvj8EIF6pHUmINrGQJvqCs9ESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EgLd9IR2NYy24DnWV/V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYSwEvPfbdmeghaBhKEjlkP/B+opP7Li3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJGNWExNk+bPXWjPH88A4sHpqCpvEXvbmcAsHexo5E2u3ncmVkZPL/Fb4OOJ43iqd9utlmcj
 nLL+SL+GB5yHN6VxCeB83msrvTShi69U4UXfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGkEQp3BX1FJ+nBUT++SPa+E5HMzZNLwEkwAOLzKmP8geVOlMFXD9Zct57jJUaeTN/g
 zdlgOjV6SxTXKy9ECzAqO/P8GvtaUD5PkdZO3ZaEFJtD83L5dhq00mRFosL/Lud1IWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiG2NPdXABaDzt6ooEWpgZgDpU
 II4s8af9vsSKpqGiTaARu4AdJnwuavbaGWN2AEzR8F+n9hIx5JFVdoIiN2ZDBcBDyr5UWWxP
 B+7Vf15vve/w0dGnYcoOtnsWqzGPIDrFMj/V+C8U+eilqNZLVfdlAk3PBb49zm0zCAEzPFuU
 b/GIJ3EJStLVsxaIM+eGr51PUkDnXtlmws+hPnTknya7FZpTCTEF+5bbATfNb5RAWHtiFy9z
 uuz/vCik313ONASqAGNmWLPBTjm9UQGOK0=
IronPort-HdrOrdr: A9a23:B2ve5Kt8OtcuMScEm3JqsGLs7skDcNV00zEX/kB9WHVpmszxra
 +TdZMgpHjJYVcqKQgdcL+7WZVoLUmwyXcx2/hyAV7AZniDhILLFuFfBOLZqlWKcREWtNQtsJ
 uIG5IObuEYZmIVsS+V2mWF+q4bsbq6zJw=
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="74362336"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v3 04/25] tools/firmware/hvmloader: rework Makefile
Date: Fri, 24 Jun 2022 17:04:01 +0100
Message-ID: <20220624160422.53457-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Setup proper dependencies with libacpi so we don't need to run "make
hvmloader" in the "all" target. ("build.o" new prerequisite isn't
exactly proper but a side effect of building the $(DSDT_FILES) is to
generate the "ssdt_*.h" needed by "build.o".)

Make use if "-iquote" instead of a plain "-I".

For "roms.inc" target, use "$(SHELL)" instead of plain "sh". And use
full path to "mkhex" instead of a relative one. Lastly, add "-f" flag
to "mv", in case the target already exist.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/firmware/hvmloader/Makefile | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
index b754220839..fc20932110 100644
--- a/tools/firmware/hvmloader/Makefile
+++ b/tools/firmware/hvmloader/Makefile
@@ -60,8 +60,7 @@ ROMS += $(ROMBIOS_ROM) $(STDVGA_ROM) $(CIRRUSVGA_ROM)
 endif
 
 .PHONY: all
-all: acpi
-	$(MAKE) hvmloader
+all: hvmloader
 
 .PHONY: acpi
 acpi:
@@ -73,12 +72,15 @@ smbios.o: CFLAGS += -D__SMBIOS_DATE__="\"$(SMBIOS_REL_DATE)\""
 ACPI_PATH = ../../libacpi
 DSDT_FILES = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c
 ACPI_OBJS = $(patsubst %.c,%.o,$(DSDT_FILES)) build.o static_tables.o
-$(ACPI_OBJS): CFLAGS += -I. -DLIBACPI_STDUTILS=\"$(CURDIR)/util.h\"
+$(ACPI_OBJS): CFLAGS += -iquote . -DLIBACPI_STDUTILS=\"$(CURDIR)/util.h\"
 CFLAGS += -I$(ACPI_PATH)
 vpath build.c $(ACPI_PATH)
 vpath static_tables.c $(ACPI_PATH)
 OBJS += $(ACPI_OBJS)
 
+$(DSDT_FILES): acpi
+build.o: $(DSDT_FILES)
+
 hvmloader: $(OBJS) hvmloader.lds
 	$(LD) $(LDFLAGS_DIRECT) -N -T hvmloader.lds -o $@ $(OBJS)
 
@@ -87,21 +89,21 @@ roms.inc: $(ROMS)
 
 ifneq ($(ROMBIOS_ROM),)
 	echo "#ifdef ROM_INCLUDE_ROMBIOS" >> $@.new
-	sh ../../misc/mkhex rombios $(ROMBIOS_ROM) >> $@.new
+	$(SHELL) $(XEN_ROOT)/tools/misc/mkhex rombios $(ROMBIOS_ROM) >> $@.new
 	echo "#endif" >> $@.new
 endif
 
 ifneq ($(STDVGA_ROM),)
 	echo "#ifdef ROM_INCLUDE_VGABIOS" >> $@.new
-	sh ../../misc/mkhex vgabios_stdvga $(STDVGA_ROM) >> $@.new
+	$(SHELL) $(XEN_ROOT)/tools/misc/mkhex vgabios_stdvga $(STDVGA_ROM) >> $@.new
 	echo "#endif" >> $@.new
 endif
 ifneq ($(CIRRUSVGA_ROM),)
 	echo "#ifdef ROM_INCLUDE_VGABIOS" >> $@.new
-	sh ../../misc/mkhex vgabios_cirrusvga $(CIRRUSVGA_ROM) >> $@.new
+	$(SHELL) $(XEN_ROOT)/tools/misc/mkhex vgabios_cirrusvga $(CIRRUSVGA_ROM) >> $@.new
 	echo "#endif" >> $@.new
 endif
-	mv $@.new $@
+	mv -f $@.new $@
 
 .PHONY: clean
 clean:
-- 
Anthony PERARD


