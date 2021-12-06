Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA5146A240
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:07:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239449.415120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSI-0005s1-Az; Mon, 06 Dec 2021 17:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239449.415120; Mon, 06 Dec 2021 17:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSI-0005oW-3G; Mon, 06 Dec 2021 17:07:10 +0000
Received: by outflank-mailman (input) for mailman id 239449;
 Mon, 06 Dec 2021 17:07:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPL-0005ti-G6
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8461dcdc-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:04:06 +0100 (CET)
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
X-Inumbo-ID: 8461dcdc-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SYJTJIKxHEFQcMKNpvz4kHz4LT/E8ZyffBaU/35UM+o=;
  b=SZpZIlN/a17Ht6GaXvXX8/7SyBd3Pp2dTxLfhp7yRWDcgEMHZ9E4rZRi
   7rTWRxC+oRNoPbUoDjMaJbXUz/Dd1Fw+EB2JyRBGsbAICc9S/ptJ609+o
   molDybIW1BCryY0UNuuxS50EkR4doQccRDH/wQyhfotnzr7biwB1Mfw+6
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: VCdhQLflCCIZyRDomZsky6KSMXnle3oGtqd3o5o8N7VxYOorQ/qkUU4iNNAzQcdffkS21AIJlM
 gjy7VQ1ZNkfstePOqeQz9jCWEGCmsmIgPuQxysZk6bxRWtWiOC/eUdbHseV8hXQs6u+kM7oren
 PuEWLFXSw/BosuoSlvze/WY/Ghk4McC4ekghT9eaICt8yd2pKILl2RtEIr8+AJV6myEICKQOrl
 7l+4ouN8vfjx09W+Ht9XEoR+i4Bjjf5XXCh9PH/Hrxs5ic4iTxyUC+YU2ioEU+Z6jsoEAbqPq3
 AHXvs4FrJVgDM+kwDSDm51q8
X-SBRS: 5.1
X-MesageID: 59387870
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:otoXGKiBxFDXDfpOgfhSP/JAX161khcKZh0ujC45NGQN5FlHY01je
 htvXGDSOanZN2qme4xyYI+z8UpSvMLczYc3QQVsryA8E38b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Qw34Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /136cCxYg0DM5HDhbw6dTgbThByIY9/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNauPP
 JpGOWU3BPjGSxIICGg0N6gFpc6HljrQcjNGrnCL9INitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRAw4YHMySzyKf9XChjfOJmjn0MKoQHrCl8v9hgHWI23ceThYRUDOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYVXcZQFOsrrhmA0KPO7y6WA2EFSnhKb9lOiSMtbWV0j
 BnTxYqvXGEx9u3OIZ6AyluKhQnuZSk+J0UPWSAZFSwjwpq+kY0vrCuaG76PD5WJptHyHDjxx
 RWDoy4/m6gfgKY36kmrwbzUq2ny/8aUF2bZ8i2SBzv4tV0hOOZJcqTxsQCDhcusOrp1WbVoU
 JIsv8GFpN4DApiW/MBmaLVcRer5jxpp3dC1vLKOI3XD32n0k5JAVdoJiN2bGKuPGpxeEdMOS
 BWM0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZp3ExPx/NhTqzzxhEfUQD1
 XGzK5zE4ZEyU/sP8dZLb71Fje9DKt4Wmws/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0U93iF69z
 jqrDOPTk083eLSnOkH/qNdPRXhXfSlTLc2n8KR/K7/cSjeK7Ul8Upc9N5t6INc790mU/8+Vl
 kyAtrhwlACi2CaZcFrSMRiOqtrHBP5CkJ7yBgR0VX7A5pTpSdv0hEvGX5doL7Qh6sJ5yvt4E
 6sMd8maW6wdQTXb4TUNK5L6qdU6JhisgAuPOQujYSQ+IME8F1CYpIe8c1u97jQKAwq2qdA6/
 ++q2DTETMdRXA9lFsvXNq6ilgvjoXgHletudELUOd0PKl70+Y1nJnWp3P86Ks0BMzvZwT6e2
 1rECBsUv7CV8YQ07MPIleaPqILwS7lyGU9THm/667eqNHaFojr/kNEYCOvRJGLTTmL5/qmmd
 N559fCkPa1VhktOvqp9D61vkfA06ezwquII1Q9jBnjKMQimU+syPnmc0MBTnaRR3bsF6xCuU
 0eC99QGa7WEPMTpTAwYKAY/N7nR0PgVnn/Z7OgvIVW87yhypeLVXUJXNhiKqSpcMLoqb991n
 bZ/4JYbu16llx4nEtealSQFpW2DI0sJX7gjqpxHUpTgjRAmyw0abJHRYsMsDEpjtzmY3pEWH
 wKp
IronPort-HdrOrdr: A9a23:2jT6tqsanajhhILcCJNg4BUy7skDfNV00zEX/kB9WHVpmszxra
 +TdZMgpHrJYVcqKRYdcL+7WZVoLUmwyXcX2/hyAV7BZmnbUQKTRekIh7cKqweQfxEWndQy6U
 4PScRD4aXLfDtHsfo=
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59387870"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [XEN PATCH 26/57] tools/firmware/hvmloader: rework Makefile
Date: Mon, 6 Dec 2021 17:02:09 +0000
Message-ID: <20211206170241.13165-27-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
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


