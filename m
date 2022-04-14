Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C890500C5D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 13:47:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304648.519353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nexwb-0001eP-8m; Thu, 14 Apr 2022 11:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304648.519353; Thu, 14 Apr 2022 11:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nexwb-0001YU-2X; Thu, 14 Apr 2022 11:47:25 +0000
Received: by outflank-mailman (input) for mailman id 304648;
 Thu, 14 Apr 2022 11:47:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNZz=UY=citrix.com=prvs=096427a9b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nexwZ-0000HT-RL
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 11:47:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4aed2f9-bbe8-11ec-8fbd-03012f2f19d4;
 Thu, 14 Apr 2022 13:47:21 +0200 (CEST)
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
X-Inumbo-ID: a4aed2f9-bbe8-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649936841;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8Uae8bFBeN10HyzNO9f3vkE192c+nPR4Tmdy4ORjMWo=;
  b=QyJKBNfETaZFBx9x6flcsKxBzets1VirHoH5WuarCncq1qpo94KkGg7T
   ibb9bMLZ0Gjt57Hh/gbzoCdmQjLwT7d9tsUhWgkl8/bNsBWkk0rQz/A2M
   flskMcKFzp/h9BwRcqQo0+ZZViLBJyCTG5qA6ubsa+fkthgebE87DqCiA
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68829285
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3qtVSaxbzqvftlcWBCt6t+c7xirEfRIJ4+MujC+fZmUNrF6WrkVSm
 jRKD27Xb//ZYDeheYgjPI2xo0IE78SAydZiSlM5/CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY02IThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpllLXsQg0sFYT2mOlNSj9gNwJlO7xiweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AN
 5pDOGA/MXwsZTVXFXY3U80+w9yRuSL6fz1GpWyRnfYotj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO8wTtAqHz4H92QaUVnEidhpic9o3kPZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WvQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT1sTA3Dt4ade51q2VtW
 lBeyqByC8hUU/mweNSlGrllIV1T296LMSfHnXlkFIQ7+jKm9haLJN4MsWEkfB43bp1fJFcFh
 XM/XysLtfe/21PwM8dKj3+ZUZx2ncAM6/y4PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1ulAv7GMGgpzz6gOX2WZJgYepcWHOUcPsD5b+JyC2Mt
 Y432z2ikE4EDoUTo0D/rOYuELz9BSFiW8un+pANK7brz8gPMDhJNsI9CIgJI+RN95m5XM+Rl
 p1hcie0EGbCuEA=
IronPort-HdrOrdr: A9a23:bW9B1KxCe+7/0kMB+zqiKrPwFr1zdoMgy1knxilNoRw8SK2lfq
 eV7YwmPH7P+U8ssR4b6LO90cW7Lk80sKQFhbX5Xo3SOjUO2lHYTr2KhLGKq1aLdkHDH6xmpM
 BdmsBFeabN5DNB7foSjjPXLz9Z+qjjzJyV
X-IronPort-AV: E=Sophos;i="5.90,259,1643691600"; 
   d="scan'208";a="68829285"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH 1/3] x86/build: Rework binary conversion for boot/{cmdline,reloc}.c
Date: Thu, 14 Apr 2022 12:47:06 +0100
Message-ID: <20220414114708.4788-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220414114708.4788-1-andrew.cooper3@citrix.com>
References: <20220414114708.4788-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There is no need to opencode .got.plt size check; it can be done with linker
asserts instead.  Extend the checking to all dynamic linkage sections, and
drop the $(OBJDUMP) pass.

Furthermore, instead of removing .got.plt specifically, take only .text when
converting to a flat binary.  This makes the process invariant of .text's
position relative to the start of the binary, which avoids needing to discard
all sections, and removes the need to work around sections that certain
linkers are unhappy discarding.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/arch/x86/boot/Makefile    | 13 +---------
 xen/arch/x86/boot/build32.lds | 58 +++++++++++++++++++------------------------
 2 files changed, 26 insertions(+), 45 deletions(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index ca8001c72b23..09d1f9f75394 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -22,19 +22,8 @@ $(head-srcs): %.S: %.bin
 	(od -v -t x $< | tr -s ' ' | awk 'NR > 1 {print s} {s=$$0}' | \
 	sed 's/ /,0x/g' | sed 's/,0x$$//' | sed 's/^[0-9]*,/ .long /') >$@
 
-# Drop .got.plt during conversion to plain binary format.
-# Please check build32.lds for more details.
 %.bin: %.lnk
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
+	$(OBJCOPY) -j .text -O binary $< $@
 
 %.lnk: %.o $(src)/build32.lds
 	$(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) -N -T $(filter %.lds,$^) -o $@ $<
diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/build32.lds
index 1ab941879312..d8fb9170ca40 100644
--- a/xen/arch/x86/boot/build32.lds
+++ b/xen/arch/x86/boot/build32.lds
@@ -31,44 +31,36 @@ SECTIONS
         *(.bss.*)
   }
 
+  /* Dynamic linkage sections.  Collected simply so we can check they're empty. */
+  .got : {
+        *(.got)
+  }
   .got.plt : {
-        /*
-         * PIC/PIE executable contains .got.plt section even if it is not linked
-         * with dynamic libraries. In such case it is just placeholder for
-         * _GLOBAL_OFFSET_TABLE_ symbol and .PLT0. .PLT0 is filled by dynamic
-         * linker and our code is not supposed to be loaded by dynamic linker.
-         * So, from our point of view .PLT0 is unused. This means that there is
-         * pretty good chance that we can safely drop .got.plt as a whole here.
-         * Sadly this is not true. _GLOBAL_OFFSET_TABLE_ is used as a reference
-         * for relative addressing (and only for that thing) and ld complains if
-         * we remove .got.plt section here because it cannot find required symbol.
-         * However, _GLOBAL_OFFSET_TABLE_ is no longer needed in final output.
-         * So, drop .got.plt section during conversion to plain binary format.
-         *
-         * Please check build32.mk for more details.
-         */
         *(.got.plt)
   }
-
-  /*
-   * Discarding .shstrtab is not supported by LLD (LLVM LD) and will trigger an
-   * error. Also keep the rest of the control sections to match GNU LD behavior.
-   */
-  .shstrtab : {
-        *(.shstrtab)
+  .igot.plt : {
+        *(.igot.plt)
   }
-  .strtab : {
-        *(.strtab)
+  .iplt : {
+        *(.iplt)
   }
-  .symtab : {
-        *(.symtab)
+  .plt : {
+        *(.plt)
   }
-
-  /DISCARD/ : {
-        /*
-         * Discard everything else, to prevent linkers from putting
-         * orphaned sections ahead of .text, which needs to be first.
-         */
-        *(*)
+  .rela : {
+        *(.rela.*)
   }
 }
+
+ASSERT(SIZEOF(.got) == 0,         ".got non-empty")
+/*
+ * At least GNU ld 2.30 and earlier fail to discard the generic part of
+ * .got.plt when no actual entries were allocated. Permit this case alongside
+ * the section being empty.
+ */
+ASSERT(SIZEOF(.got.plt) == 0 ||
+       SIZEOF(.got.plt) == 3 * 4, "unexpected .got.plt size")
+ASSERT(SIZEOF(.igot.plt) == 0,    ".igot.plt non-empty")
+ASSERT(SIZEOF(.iplt) == 0,        ".iplt non-empty")
+ASSERT(SIZEOF(.plt) == 0,         ".plt non-empty")
+ASSERT(SIZEOF(.rela) == 0,        "leftover relocations")
-- 
2.11.0


