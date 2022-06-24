Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 662F9559E03
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355606.583382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnb-0005xd-8h; Fri, 24 Jun 2022 16:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355606.583382; Fri, 24 Jun 2022 16:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnb-0005sZ-0G; Fri, 24 Jun 2022 16:04:47 +0000
Received: by outflank-mailman (input) for mailman id 355606;
 Fri, 24 Jun 2022 16:04:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lnZ-0004qb-V8
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:04:46 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d0cdfcc-f3d7-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 18:04:44 +0200 (CEST)
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
X-Inumbo-ID: 5d0cdfcc-f3d7-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6zroeQWnVKs2sspcMTPF4FS/ihKUgmPZSZni2g/h+iU=;
  b=YWdVoPFHspWShIHsJGhN168qZLZ4kdsAgWqySBXBPp0Y6N5p8skDNWNo
   9o9twQmccGSc2QZx/1LrpKQQN/wr+Nim9oNrUc81f4NxdOEQPdNdKcrIG
   t3IRfK8wQ8FmjM90pc0hqyLDQgJx9OYSE935R2E74XJLtX143Yic1sAcM
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74208073
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wU33AKy6aB2z7Iu30k96t+c1xirEfRIJ4+MujC+fZmUNrF6WrkUPz
 mUWWTiAafiPZmCgctojOY2y9x4Ovp7SmoIxHAU4/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX1JZS5LwbZj2NY224ThWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplv5P3SQg0Aff2l746AwV3Nn1yArVL0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6BO
 5BBOWIwN3wsZTUSK3wmNMgDgd6P2CC4U2R/k0Ow/aUotj27IAtZj+G2bYu9lsaxbd5Ogk+Sq
 2bC/mL4KhIXLtqSzXyC6H3ErvDLtTP2XsQVDrLQ3vx3hFyewEQDBRtQUkG0ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9haHvA+6QqN4rHJ+AvfDW8BJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1qX+fCUoi6NYxIad0hSeQAhEQc6+9TK9dRbYg30cjpzLEKkpoSrRG+om
 G3S83hWa6Y71pBSifjilbzTq3f1/8WSEFZojunCdjj9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Kz6zcWNEkqQQzd6TNDhz0k5JZQahe4StlOGBiOdsedDnib
 Sf74F0MuscLbSL1MfcvPOpd7vjGK4C6TbwJsdiEBuein7ArLFPXlM2QTRT4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAeLqxMm+eZznEgWnDqLLbiilkjP+efONRa9FOZeWHPTP79R0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhQfCZiW8yp+pcJHgNBSyI/cFwc5zbq6etJU+RYc259yo8kI
 lnVtpdk9WfC
IronPort-HdrOrdr: A9a23:xC/hIKiMcIgnQgsOgA0XVsd+oHBQXuIji2hC6mlwRA09TySZ//
 rBoB19726TtN9xYgBZpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdGSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="74208073"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 05/25] tools/fuzz/libelf: rework makefile
Date: Fri, 24 Jun 2022 17:04:02 +0100
Message-ID: <20220624160422.53457-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Rename ELF_LIB_OBJS to LIBELF_OBJS as to have the same name as in
libs/guest/.

Replace "-I" by "-iquote".

Remove the use of "vpath". It will not works when we will convert this
makefile to subdirmk. Instead, we create symlinks to the source files.

Since we are creating a new .gitignore for the links, also move the
existing entry to it.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - create a per-directory .gitignore to add new entry and existing one

 tools/fuzz/libelf/Makefile   | 21 ++++++++++-----------
 .gitignore                   |  1 -
 tools/fuzz/libelf/.gitignore |  2 ++
 3 files changed, 12 insertions(+), 12 deletions(-)
 create mode 100644 tools/fuzz/libelf/.gitignore

diff --git a/tools/fuzz/libelf/Makefile b/tools/fuzz/libelf/Makefile
index 9eb30ee40c..9211f75951 100644
--- a/tools/fuzz/libelf/Makefile
+++ b/tools/fuzz/libelf/Makefile
@@ -1,25 +1,24 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-# libelf fuzz target
-vpath %.c ../../../xen/common/libelf
-CFLAGS += -I../../../xen/common/libelf
-ELF_SRCS-y += libelf-tools.c libelf-loader.c libelf-dominfo.c
-ELF_LIB_OBJS := $(patsubst %.c,%.o,$(ELF_SRCS-y))
+LIBELF_OBJS := libelf-tools.o libelf-loader.o libelf-dominfo.o
 
-$(patsubst %.c,%.o,$(ELF_SRCS-y)): CFLAGS += -Wno-pointer-sign
-
-$(ELF_LIB_OBJS): CFLAGS += -DFUZZ_NO_LIBXC $(CFLAGS_xeninclude)
+CFLAGS += -iquote ../../../xen/common/libelf
+$(LIBELF_OBJS): CFLAGS += -Wno-pointer-sign
+$(LIBELF_OBJS): CFLAGS += -DFUZZ_NO_LIBXC $(CFLAGS_xeninclude)
 
 libelf-fuzzer.o: CFLAGS += $(CFLAGS_xeninclude)
 
-libelf.a: libelf-fuzzer.o $(ELF_LIB_OBJS)
+$(LIBELF_OBJS:.o=.c): libelf-%.c: ../../../xen/common/libelf/libelf-%.c FORCE
+	ln -nsf $< $@
+
+libelf.a: libelf-fuzzer.o $(LIBELF_OBJS)
 	$(AR) rc $@ $^
 
 .PHONY: libelf-fuzzer-all
 libelf-fuzzer-all: libelf.a libelf-fuzzer.o
 
-afl-libelf-fuzzer: afl-libelf-fuzzer.o libelf-fuzzer.o $(ELF_LIB_OBJS)
+afl-libelf-fuzzer: afl-libelf-fuzzer.o libelf-fuzzer.o $(LIBELF_OBJS)
 	$(CC) $(CFLAGS) $^ -o $@
 
 # Common targets
@@ -31,7 +30,7 @@ distclean: clean
 
 .PHONY: clean
 clean:
-	rm -f *.o .*.d *.a *-libelf-fuzzer
+	rm -f *.o .*.d *.a *-libelf-fuzzer $(LIBELF_OBJS:.o=.c)
 
 .PHONY: install
 install: all
diff --git a/.gitignore b/.gitignore
index 7cf26051db..6410dfbc72 100644
--- a/.gitignore
+++ b/.gitignore
@@ -195,7 +195,6 @@ tools/flask/utils/flask-loadpolicy
 tools/flask/utils/flask-setenforce
 tools/flask/utils/flask-set-bool
 tools/flask/utils/flask-label-pci
-tools/fuzz/libelf/afl-libelf-fuzzer
 tools/fuzz/x86_instruction_emulator/asm
 tools/fuzz/x86_instruction_emulator/afl-harness
 tools/fuzz/x86_instruction_emulator/afl-harness-cov
diff --git a/tools/fuzz/libelf/.gitignore b/tools/fuzz/libelf/.gitignore
new file mode 100644
index 0000000000..ed634214c9
--- /dev/null
+++ b/tools/fuzz/libelf/.gitignore
@@ -0,0 +1,2 @@
+/afl-libelf-fuzzer
+/libelf-*.c
-- 
Anthony PERARD


