Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E41590509
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:49:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384783.620244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMk-0003Ja-AD; Thu, 11 Aug 2022 16:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384783.620244; Thu, 11 Aug 2022 16:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMk-0003Dv-5c; Thu, 11 Aug 2022 16:49:02 +0000
Received: by outflank-mailman (input) for mailman id 384783;
 Thu, 11 Aug 2022 16:49:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBMj-0003Aq-2Q
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:01 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f637913-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:48:59 +0200 (CEST)
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
X-Inumbo-ID: 7f637913-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uKZYwxU/eeIoJex6/iy2xttzxFfQWkQ9g42h+ITNP2Y=;
  b=G3hdQemnFsCmJ2NOBt7B1klHUBEB1iTnHzH3Apeyv6MsD/I9E+DK7m9+
   XC1sxXxM//kbGcpC9Rie0AkCCw/gdKCNml//edkWmMujnP+uGSyjLXrvV
   d8AbKZjDQ8c7NsCZ7Dca9Kt7IJenu8MpY/NWkIY5KE/C0CYu5GpvG2Pvr
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77134656
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hJALB6BiirHEOxVW/y7jw5YqxClBgxIJ4kV8jS/XYbTApDMl0mBVy
 DcdCD/QM6zeN2byLt1/Ydy0/RsPu5/Xm9ZhQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpEsvvb8nuDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW0ru0twtAkA6AYtb2tlYPThtz
 tcSCD9YO3hvh8ruqF66Yuxlh8BlJ8j3JoIP/HpnyFk1D95/H8qFGf+To4YFgnFg3aiiHt6HD
 yYdQTNpcBTHZQwJIloNAYgytOypmmP+Y3tTr1f9Sa8fvDeKl1AvjeaF3Nz9RcGnXpRWlWChh
 Xvg7lndLx04EPeg4G/Qmp6rrrCWxn6qMG4IL5W6/PN3hFyYxkQIFQYbE1C8pJGRlUqWS99Zb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6dG2MNCDBIbtcrsMsrbTUw0
 xmCmNaBONB0mOTLEzTHrO7S9G7sf3hORYMfWcMaZToH8vCgroA/shSMbulMLPeWtfb/OT6ll
 lhmsxMCa6UvYd8jjvvlpQiW3Gv1+PAlXSZuuFyJAzvNAhdRIdf8Otf2sQWzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF52LJ9k4DMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/a4TYu9D6GEM4AUCnSUSONg1H8GWKJt9zq1zBhEfV8XY
 P93jvpA/V5FUP86nVJats8W0KMxxzBW+F4/savTlk3/uZLDNSH9dFvwGAHRBgzPxP/b/V69H
 hc2H5fi9iizp8WiO3WLrdNIfQxTRZX5bLivw/Fqmie4ClIOMAkc5zX5mNvNp6QNc3xpq9r1
IronPort-HdrOrdr: A9a23:FdFTg6ymoCcEMnghSRdJKrPwKr1zdoMgy1knxilNoRw8SKOlfq
 eV7ZMmPH7P+U8ssR4b+OxoVJPsfZqYz+8W3WBzB8bHYOCFgguVxehZhOOIqQEIWReOk9K1vZ
 0QFZSWY+efMbEVt6rHCXGDYrUd/OU=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77134656"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 02/32] tools/firmware/hvmloader: rework Makefile
Date: Thu, 11 Aug 2022 17:48:15 +0100
Message-ID: <20220811164845.38083-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
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
to "mv" to avoid a prompt in case the target already exist and we
don't have write permission.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---

Notes:
    v4:
    - fix reason for 'mv -f' in patch description.
    - add a comment about build.o's new prerequisites.

 tools/firmware/hvmloader/Makefile | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
index b754220839..2bb5deb0c6 100644
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
@@ -73,12 +72,18 @@ smbios.o: CFLAGS += -D__SMBIOS_DATE__="\"$(SMBIOS_REL_DATE)\""
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
+
+# Add DSDT_FILES as a prerequisite of "build.o" so that make will also
+# generates the "ssdt_*.h" headers needed by "build.o".
+build.o: $(DSDT_FILES)
+
 hvmloader: $(OBJS) hvmloader.lds
 	$(LD) $(LDFLAGS_DIRECT) -N -T hvmloader.lds -o $@ $(OBJS)
 
@@ -87,21 +92,21 @@ roms.inc: $(ROMS)
 
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


