Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367089FA699
	for <lists+xen-devel@lfdr.de>; Sun, 22 Dec 2024 17:16:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862711.1274295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPObj-0000D2-1Z; Sun, 22 Dec 2024 16:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862711.1274295; Sun, 22 Dec 2024 16:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPObi-0000BX-V9; Sun, 22 Dec 2024 16:15:06 +0000
Received: by outflank-mailman (input) for mailman id 862711;
 Sun, 22 Dec 2024 16:15:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UoCC=TP=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tPObh-0008OR-MN
 for xen-devel@lists.xenproject.org; Sun, 22 Dec 2024 16:15:05 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e77c0fe5-c07f-11ef-a0da-8be0dac302b0;
 Sun, 22 Dec 2024 17:15:04 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 22 Dec 2024 17:15:04 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 877A225A7;
 Sun, 22 Dec 2024 17:15:04 +0100 (CET)
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
X-Inumbo-ID: e77c0fe5-c07f-11ef-a0da-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734884105; x=1766420105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eey0XVeri/nsLtW4COooiuqzSdIo6CGj8cotECliMN0=;
  b=d4qX6i5CkGAm633vmvfll/tXYJLLT23CJwhgMbJRuH+y6udOzrGJhZlu
   4leH88OSWBwzg4Y/UuzheG3bm+E5rbKXB7y8D+2sp5lXGsk0E2T2QHTCj
   hygP1UA3PJ6gppqzUeUE/ft0y3h3WP0N1DG0jLiawz0wlOHaN/LAwix8Y
   8=;
X-CSE-ConnectionGUID: rRauINs7Q4OPKd5ErFeOGw==
X-CSE-MsgGUID: EPAyPJxcQG+vCtQ8L3/hQQ==
X-IronPort-AV: E=Sophos;i="6.12,255,1728943200"; 
   d="scan'208";a="28291258"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>,
	Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v3 1/1] libacpi/Makefile: clear ASL warning about PCI0
Date: Sun, 22 Dec 2024 17:10:35 +0100
Message-ID: <20241222161444.1558599-2-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222161444.1558599-1-Ariel.Otilibili-Anieli@eurecom.fr>
References: <20241222161444.1558599-1-Ariel.Otilibili-Anieli@eurecom.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iasl complains _HID and _ADR cannot be used at the same time:

```
iasl -vs -p tools/firmware/hvmloader/dsdt_anycpu.tmp -tc tools/firmware/hvmloader/dsdt_anycpu.asl 2>&1 | grep -B1 HID

tools/firmware/hvmloader/dsdt_anycpu.asl     40:        Device (PCI0)
Warning  3073 -                                    Multiple types ^  (Device object requires either a _HID or _ADR, but not both)
```

The usage of both _HID and _ADR has changed [1,2]:

From ACPI 2.0 (Jul. 27, 2000; Section 6.1, page 146):

"A device object must contain either an _HID object or an _ADR object,
but can contain both." [3]

To ACPI 6.0 (April 2015; Section 6.1, page 278),

"A device object must contain either an _HID object or an _ADR object,
but should not contain both." [4]

And from ACPI 6.0 to ACPI 6.5 (Aug. 2022):

"A device object must contain either an _HID object or an _ADR object,
but must not contain both." [5]

Using its ID, the warning is now filtered.

```
$ iasl -vw3073 -vs -p ../firmware/hvmloader/dsdt_anycpu.tmp -tc ../firmware/hvmloader/dsdt_anycpu.asl 2>&1 | grep HID; echo $?
1
```

iasl has one ID per warning [6]; subsequent commits will address other ASL warnings.

```
$ awk 'NR>533 && NR<556 {print NR ":" $0}' source/compiler/aslmethod.c
534:    case PARSEOP_DEVICE:
535:
536:        /* Check usage of _HID and _ADR objects */
537:
538:        HidExists = ApFindNameInDeviceTree (METHOD_NAME__HID, Op);
539:        AdrExists = ApFindNameInDeviceTree (METHOD_NAME__ADR, Op);
540:
541:        if (!HidExists && !AdrExists)
542:        {
543:            AslError (ASL_ERROR, ASL_MSG_MISSING_DEPENDENCY, Op,
544:                "Device object requires a _HID or _ADR");
545:        }
546:        else if (HidExists && AdrExists)
547:        {
548:            /*
549:             * According to the ACPI spec, "A device object must contain
550:             * either an _HID object or an _ADR object, but should not contain
551:             * both".
552:             */
553:            AslError (ASL_WARNING, ASL_MSG_MULTIPLE_TYPES, Op,
554:                "Device object requires either a _HID or _ADR, but not both");
555:        }

$ awk 'NR>188 && NR<206 || NR==432 || /ASL_MSG_MULTIPLE_TYPES/ {print NR ":" $0}' source/compiler/aslmessages.h
189:/*
190: * Values (message IDs) for all compiler messages. There are currently
191: * three distinct blocks of error messages (so that they can be expanded
192: * individually):
193: *      Main ASL compiler
194: *      Data Table compiler
195: *      Preprocessor
196: *
197: * NOTE1: This list must match the tables of message strings in the file
198: * aslmessages.c exactly.
199: *
200: * NOTE2: With the introduction of the -vw option to disable specific
201: * messages, new messages should only be added to the end of these
202: * lists, so that values for existing messages are not disturbed.
203: */
204:typedef enum
205:{
280:    ASL_MSG_MULTIPLE_TYPES,
432:} ASL_MESSAGE_IDS;

$ git remote -v
origin  git@github.com:acpica/acpica.git (fetch)
origin  git@github.com:acpica/acpica.git (push)

$ git log --pretty='%h ("%s")' -n1
7dae72155 ("Logfile: Changes for version 20241212")
```

[1] https://uefi.org/acpi/specs
[2] https://uefi.org/specifications
[3] https://uefi.org/sites/default/files/resources/ACPI_2.pdf
[4] https://uefi.org/sites/default/files/resources/ACPI_6.0.pdf
[5] https://uefi.org/specs/ACPI/6.5/06_Device_Configuration.html?highlight=_hid#device-identification-objects
[6] https://github.com/acpica/acpica

Fixes: 5a8b28bfd4 ("tools/libacpi: cleanup Makefile, don't check for iasl binary")
Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/libacpi/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
index b21a64c6b4..4668ecb365 100644
--- a/tools/libacpi/Makefile
+++ b/tools/libacpi/Makefile
@@ -21,6 +21,8 @@ H_SRC += $(addprefix $(ACPI_BUILD_DIR)/, ssdt_tpm.h ssdt_tpm2.h ssdt_laptop_slat
 MKDSDT_CFLAGS-$(CONFIG_ARM_64) = -DCONFIG_ARM_64
 MKDSDT_CFLAGS-$(CONFIG_X86) = -DCONFIG_X86
 
+IASL_WARNS=3073
+
 # Suffix for temporary files.
 #
 # We will also use this suffix to workaround a bug in older iasl
@@ -32,7 +34,7 @@ TMP_SUFFIX	= tmp
 all: $(C_SRC) $(H_SRC)
 
 $(H_SRC): $(ACPI_BUILD_DIR)/%.h: %.asl
-	$(IASL) -vs -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $<
+	$(IASL) $(IASL_WARNS:%=-vw%) -vs -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $<
 	sed -e 's/AmlCode/$*/g' -e 's/_aml_code//g' $(ACPI_BUILD_DIR)/$*.hex >$@
 	rm -f $(addprefix $(ACPI_BUILD_DIR)/, $*.aml $*.hex)
  
@@ -65,7 +67,7 @@ $(ACPI_BUILD_DIR)/dsdt_anycpu_arm.asl: $(MK_DSDT)
 	mv -f $@.$(TMP_SUFFIX) $@
 
 $(C_SRC): $(ACPI_BUILD_DIR)/%.c: $(ACPI_BUILD_DIR)/%.asl
-	$(IASL) -vs -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $<
+	$(IASL) $(IASL_WARNS:%=-vw%) -vs -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $<
 	sed -e 's/AmlCode/$*/g' -e 's/_aml_code//g' $(ACPI_BUILD_DIR)/$*.hex > $@.$(TMP_SUFFIX)
 	echo "int $*_len=sizeof($*);" >> $@.$(TMP_SUFFIX)
 	mv -f $@.$(TMP_SUFFIX) $@
-- 
2.47.1


