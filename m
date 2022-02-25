Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E404C486A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279179.476781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcHw-0007FX-LT; Fri, 25 Feb 2022 15:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279179.476781; Fri, 25 Feb 2022 15:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcHw-0007Cb-H3; Fri, 25 Feb 2022 15:13:44 +0000
Received: by outflank-mailman (input) for mailman id 279179;
 Fri, 25 Feb 2022 15:13:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcHv-0007Bf-Af
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:13:43 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 834855a0-964d-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:13:41 +0100 (CET)
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
X-Inumbo-ID: 834855a0-964d-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SYJTJIKxHEFQcMKNpvz4kHz4LT/E8ZyffBaU/35UM+o=;
  b=fxVxyUnGDPXgWIBjQSHfUYV+H9HbwWLe/COFKCKBGoNFTdQFF861SSoB
   uVSG2fC4vZ+W2PEimi/1BLDXLvbG24gIqrCsGksohAJ5/QbPgGHrxoqx0
   mxH/8egw8AImXfPI8DErHqVw7O4FXx4xhBz8kzxlpF2gPM7nPinbDQFWD
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64998366
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OJpQDqqeqBn9aMkcTQo0yxXXTz5eBmIcZRIvgKrLsJaIsI4StFCzt
 garIBmFb/uDMGKjfN8lPdixpk4F6sTcy9FmSFFt+CsxEH5B8ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvX4
 46q+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBGqPou8pFFCRjCiBcD6ZZor7uBFWyvpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIxDfFDfEgUNbbTr/D/9Nw1zYsnMFeW/3ZY
 qL1bBIxMEWRM0YRZD/7DrogkteLhUHQLQdd8niz+LA35Gbz8hFIhe2F3N39JYXRGJQ9clyjj
 n3C13T0BFcdLtP34TiP/2+oh+TPtTjmQ49UH7q9ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6dayaCwZoCjBVvi+ifC50NCHYoLewEn1O2T4o7axyW3Xi85dSdASu4tq5U3bBkH2
 1DcyrsFGgdTmLGSTHuc8JKdojWzJTUZIAc+WMMUcecWy4K9+d9u13ojWv4mSffo1YOtRVkc1
 hjX9HBWulkFsSIcO0xXF3jjiinkmJXGRxVdCu7/DjP8tVMRiGJIiuWVBbnnARRocNfxorqp5
 iFsdy2iAAYmV8DleMulGrhlIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGG1P
 RCP4F8MvMcLZBNGiJObharrWqzGKoC6SLzYug38NIISMvCdiifdlM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4n5VdPl1KLqxMm+eZznEgWnDqLLbiilkjP+efONRa9FOZeWHPTP79R0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhRdSlrXc2t8pcPHgNBSyI/cFwc5zbq6etJU+RYc259z48kI
 lnVtpdk9WfC
IronPort-HdrOrdr: A9a23:1LyF2K5qTKylOhj0YgPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HJoB17726NtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QCpSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64998366"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v2 04/29] tools/firmware/hvmloader: rework Makefile
Date: Fri, 25 Feb 2022 15:12:56 +0000
Message-ID: <20220225151321.44126-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
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


