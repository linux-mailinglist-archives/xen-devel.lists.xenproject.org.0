Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4CF73728B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551986.861800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeym-0005ih-6u; Tue, 20 Jun 2023 17:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551986.861800; Tue, 20 Jun 2023 17:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeym-0005gV-36; Tue, 20 Jun 2023 17:17:20 +0000
Received: by outflank-mailman (input) for mailman id 551986;
 Tue, 20 Jun 2023 17:17:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBeyl-0005QM-9a
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:17:19 +0000
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [2607:f8b0:4864:20::b35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e6826f3-0f8e-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:17:17 +0200 (CEST)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-bd5f59fb71dso5220706276.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:17:17 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 f81-20020a25cf54000000b00bcc0f2e4f05sm461938ybg.59.2023.06.20.10.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:17:15 -0700 (PDT)
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
X-Inumbo-ID: 4e6826f3-0f8e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281436; x=1689873436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmjMX94/CnuZ+DKqQNwFS/gJapQsRaGCdFJ+ixf1jU8=;
        b=nEXO+tw/MG+WTEDv60cExTVrsHhY517hsBKXVfVqM6MvGnYFb8LU9YYZvjI2W9g1cK
         TLQxCR2B815QgXYKBrDkId7DekHBQ5ps/asJznNk1vJVBZad57bdHSKAPPCcglUnW5qG
         gRgE0Ws+r17fOJYv+lVpX2XmhbFcR4AcESeqrxlGSfFo9X9KcgWtyrqT+Ohz4IvnuKJT
         U3dkQBmezB4TO9iTTIXo1T46OuePEIzs0fqW5h/YSrqJvIs/9bI85684LYDYPbGS0zMo
         /xtPSNEoA4AutkSwGIwWEgP18lfb5NP6eOLUbWx1yUzK4uv+PPb7C35gGdihBuQ08A/9
         RCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281436; x=1689873436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rmjMX94/CnuZ+DKqQNwFS/gJapQsRaGCdFJ+ixf1jU8=;
        b=fH712lG4fqYi0x8dP024TgjQfCOHnOQRBRbpDS1sPjs+WP3EsNbwVhrm5K198zIxtN
         n0AUXcAoR013S9vmgXAEO6irImbulVGcqI0WkqOSOgywVq0Ku4T1rD8vVFcKKrjIj4DX
         VlPhTj+vU8EvIQb2mYSvfsoGogiMSGtE0mAAXNQgJaI8b14WUMAxlnFuXlqDK0z+WM5i
         E/K2OG5dUEhiHrqwj9Tevsckv1VDovMPNjD6TrGrnrYRaQAHzfX6HuMNzQWCwMu/5TUf
         /uPG8A58hkdFNKj15xixQSiIe3P8NMcKPG5YIMFrb/4niiZZMBF89WWieNJkSDUzB98Z
         LKYA==
X-Gm-Message-State: AC+VfDxipHzj31BAeSXRNSBOJSevWlqV/v88rqtVZtJuIk1l50SBKI6D
	gax8PHR8FlrcVepS+8N6oQUtfEaNvI2LHw==
X-Google-Smtp-Source: ACHHUZ5IYdtGjOJynA9TpDdq64wxYLUQAEz6ka8t3dG2aTivhnlshW2hypqfbNz5NkT/xVvlAf4LZQ==
X-Received: by 2002:a25:b188:0:b0:be4:684e:1971 with SMTP id h8-20020a25b188000000b00be4684e1971mr11353800ybj.63.1687281436189;
        Tue, 20 Jun 2023 10:17:16 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Joel Upham <jupham125@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 02/12] Makefile: build and use new DSDT table for Q35
Date: Tue, 20 Jun 2023 13:15:42 -0400
Message-Id: <1579bbf01f01ff92496260866f87b263a95cd8fe.1687215890.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687215890.git.jupham125@gmail.com>
References: <cover.1687215890.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide building for newly added dsdt_q35.asl file, in a way similar
to dsdt.asl.

Note that '15cpu' ACPI tables are only applicable to qemu-traditional
(which have no support for Q35), so we need to use 'anycpu' version only.

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 tools/firmware/hvmloader/Makefile |  2 +-
 tools/libacpi/Makefile            | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
index e5de1ade17..e3c8eb3ca1 100644
--- a/tools/firmware/hvmloader/Makefile
+++ b/tools/firmware/hvmloader/Makefile
@@ -70,7 +70,7 @@ rombios.o: roms.inc
 smbios.o: CFLAGS += -D__SMBIOS_DATE__="\"$(SMBIOS_REL_DATE)\""
 
 ACPI_PATH = ../../libacpi
-DSDT_FILES = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c
+DSDT_FILES = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c dsdt_q35_anycpu_qemu_xen.c
 ACPI_OBJS = $(patsubst %.c,%.o,$(DSDT_FILES)) build.o static_tables.o
 $(ACPI_OBJS): CFLAGS += -iquote . -DLIBACPI_STDUTILS=\"$(CURDIR)/util.h\"
 CFLAGS += -I$(ACPI_PATH)
diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
index b21a64c6b4..d1ad2c6d85 100644
--- a/tools/libacpi/Makefile
+++ b/tools/libacpi/Makefile
@@ -11,7 +11,7 @@ endif
 
 MK_DSDT = $(ACPI_BUILD_DIR)/mk_dsdt
 
-C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c dsdt_pvh.c
+C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c dsdt_q35_anycpu_qemu_xen.c dsdt_pvh.c
 C_SRC-$(CONFIG_ARM_64) = dsdt_anycpu_arm.c
 DSDT_FILES ?= $(C_SRC-y)
 C_SRC = $(addprefix $(ACPI_BUILD_DIR)/, $(DSDT_FILES))
@@ -54,6 +54,14 @@ $(ACPI_BUILD_DIR)/dsdt_%cpu.asl: dsdt.asl dsdt_acpi_info.asl  $(MK_DSDT)
 	$(MK_DSDT) --debug=$(debug) --maxcpu $*  >> $@.$(TMP_SUFFIX)
 	mv -f $@.$(TMP_SUFFIX) $@
 
+$(ACPI_BUILD_DIR)/dsdt_q35_anycpu_qemu_xen.asl: dsdt_q35.asl dsdt_acpi_info.asl $(MK_DSDT)
+	# Remove last bracket
+	awk 'NR > 1 {print s} {s=$$0}' $< > $@.$(TMP_SUFFIX)
+	cat dsdt_acpi_info.asl >> $@.$(TMP_SUFFIX)
+	$(MK_DSDT) --debug=$(debug) --dm-version qemu-xen >> $@.$(TMP_SUFFIX)
+	mv -f $@.$(TMP_SUFFIX) $@
+
+
 $(ACPI_BUILD_DIR)/dsdt_pvh.asl: dsdt_acpi_info.asl $(MK_DSDT)
 	printf "DefinitionBlock (\"DSDT.aml\", \"DSDT\", 5, \"Xen\", \"HVM\", 0)\n{" > $@
 	cat dsdt_acpi_info.asl >> $@
-- 
2.34.1


