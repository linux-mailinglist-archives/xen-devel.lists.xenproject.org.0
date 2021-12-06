Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3242146A255
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:08:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239496.415284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSy-0004T8-5W; Mon, 06 Dec 2021 17:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239496.415284; Mon, 06 Dec 2021 17:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSx-0004Jc-R0; Mon, 06 Dec 2021 17:07:51 +0000
Received: by outflank-mailman (input) for mailman id 239496;
 Mon, 06 Dec 2021 17:07:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOn-0005ta-2J
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:33 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ff0ced6-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:03:32 +0100 (CET)
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
X-Inumbo-ID: 6ff0ced6-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O21sRR07hYjYj9vZuB9LwkDXcVWb8j2cB7UEoDG9SQo=;
  b=gzQISgmCBs5jFoLRLGEge8hR6s8xJ/7YGN9xFVAox3wghdopMpD6fcjw
   Bp1IPN6H/445TC/ZnlAam5aFBLy58BiU/h6MpfUMPk/BNEcZV3Ju0wAxc
   qlkEI4JCvTh/jXhcnB4/WQme1yZay7c/BzLiRHZIl0ZIsEMZGuQj0c8xS
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: oZfcFkjPoi6ndXydETePffndu0po/Iso82qr0s/mXfuc2V1tiZVOzKp1GOqx0G+Jtv07mUwSR9
 /U5HLCvRDYG7kLXyHHh6fJkL0NYnt5/rrKSmKlO9WWeaXFJrBUztWpASrL9HTpT4SMBJ8cx6kG
 ZKrmxi52a2VBPi2BtDqLFxl3TUYcUhxNNuUOYg71jBFeYO3l7PdxcB1PxbEUhKl4Q17oyaFgSt
 uheY96XsUd1RKqR84dNTFkXcFqxmRMZqdtL6uUe7LtnsIGx6oGAsPFkJkVfOa2/hD0ghHAKU+N
 qCPj7LOGOwni5OlqqHTJ8Gu7
X-SBRS: 5.1
X-MesageID: 59766382
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5SPthq6GHf8bIFRZ2URFjwxRtMrAchMFZxGqfqrLsTDasY5as4F+v
 mtLUTqEOPbZYDH8eNF3bNu29R9X6JaGmtdgQQJvrio3Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdj2tAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zk
 dBWkJqUGSYQIKDnyMoBdEBAPzpwMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gTTKmAO
 ZFJM1KDajybXSNOOmc0D6kcgb3zhWPATzcGmVCs8P9fD2/7k1UqjemF3MDuUt2VR+1Fk0CAv
 GXE8m/lRBYAO7S31j6t4n+qwOjVkkvTWogfCbm5/f5Cm0CIyyoYDxh+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxastxgAW91WAqsi5RuE0Kb87AOQB2xCRTlEAOHKr+dvG2Zsj
 AXQ2Yq0W3o/69V5VE5x6J/NqCiXPwxFDFYcaARUYxciusHPu48820enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNPtTwsTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/bF8rlxBGFb5JOi8BQ2Swm8zaK7onhezP
 yfuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlTXo3s/OBTKgT+9+KTJrU3ZE
 c3BGSpLJSxFYZmLMRLsH7tNuVPV7n5WKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vfyDg5B
 +13bpPQoz0GCbWWSnCOreY7cABbRVBmVMueg5EGKYa+zv9ORThJ5wn5muh6JeSIXs19y4/1w
 51KchMClQek2ySYcV7ih7IKQOqHYKuTZEkTZUQEVWtEEVB5Me5DNY8TKMk6e6cJ7utmwaImR
 vUJYZzYUP9OVi7G63IWapyk9N5ucxGihASvOSu5YWdgI848FlKRotK0LBHy8CQuDzassZdsq
 bOXyQ6GE4EIQB5vDZiKZav3nU+xp3UUhMl7Q1DMfotIYEzp/YUzc37xg/Y7LtsiMxLGwjfGh
 Q+aDQ1B/bvGopMv8cmPjqeB9t/7H+x7F0tcPm/a8bfpanWKojv9mddNCb/acyrcWWX4/LSZS
 d9Ul/ysYucamFtqspZnF+o5x6wJ+Nay9aRRyR5pHSuXYg3zWK9gOHSPweJGqrZJmu1CoQKzV
 0+CpotaNLGONJ+3GVIdPlN4POGK1PVSkTjO9/UlZk794XYvrraAVExTOTiKiTBcc+QpYN90n
 795tZ5E8RG7hzorLs2C33Jd+Gm7J3AdV7kq68MBC4jxhwt3klxPbPQw0MMtDE1jvzmUDnQXH
 w==
IronPort-HdrOrdr: A9a23:vHcYuK+g+3P0knOV80Fuk+DeI+orL9Y04lQ7vn2YSXRuHfBw8P
 re+8jztCWE8Qr5N0tApTntAsS9qDbnhPxICOoqTNOftWvd2FdARbsKheCJ/9SjIVyaygc079
 YHT0EUMrPN5DZB4foSmDPIcOod/A==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59766382"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 15/57] tools/libacpi: cleanup Makefile, don't check for iasl binary
Date: Mon, 6 Dec 2021 17:01:58 +0000
Message-ID: <20211206170241.13165-16-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

iasl is been check for presence by ./configure, so this Makefile
doesn't have to do it. Also start to use $(IASL) that ./configure
generate.

iasl hasn't been download by our build system for a while and the
dependency on iasl is in the main xen.git README.

Make use of $< in one rule instead of spelling the %.asl file again.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libacpi/Makefile | 17 ++++-------------
 tools/libacpi/README   |  6 ------
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
index 2448687dbb..60860eaa00 100644
--- a/tools/libacpi/Makefile
+++ b/tools/libacpi/Makefile
@@ -38,11 +38,10 @@ MKDSDT_CFLAGS-$(CONFIG_X86) = -DCONFIG_X86
 # complete $(ACPI_BUILD_DIR) as path, even if it has '.' symbols.
 TMP_SUFFIX	= tmp
 
-vpath iasl $(PATH)
 all: $(C_SRC) $(H_SRC)
 
-$(H_SRC): $(ACPI_BUILD_DIR)/%.h: %.asl iasl
-	iasl -vs -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $<
+$(H_SRC): $(ACPI_BUILD_DIR)/%.h: %.asl
+	$(IASL) -vs -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $<
 	sed -e 's/AmlCode/$*/g' -e 's/_aml_code//g' $(ACPI_BUILD_DIR)/$*.hex >$@
 	rm -f $(addprefix $(ACPI_BUILD_DIR)/, $*.aml $*.hex)
  
@@ -74,21 +73,13 @@ $(ACPI_BUILD_DIR)/dsdt_anycpu_arm.asl: $(MK_DSDT)
 	$(MK_DSDT) --debug=$(debug) >> $@.$(TMP_SUFFIX)
 	mv -f $@.$(TMP_SUFFIX) $@
 
-$(C_SRC): $(ACPI_BUILD_DIR)/%.c: iasl $(ACPI_BUILD_DIR)/%.asl
-	iasl -vs -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $(ACPI_BUILD_DIR)/$*.asl
+$(C_SRC): $(ACPI_BUILD_DIR)/%.c: $(ACPI_BUILD_DIR)/%.asl
+	$(IASL) -vs -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $<
 	sed -e 's/AmlCode/$*/g' -e 's/_aml_code//g' $(ACPI_BUILD_DIR)/$*.hex > $@.$(TMP_SUFFIX)
 	echo "int $*_len=sizeof($*);" >> $@.$(TMP_SUFFIX)
 	mv -f $@.$(TMP_SUFFIX) $@
 	rm -f $(addprefix $(ACPI_BUILD_DIR)/, $*.aml $*.hex)
 
-iasl:
-	@echo
-	@echo "ACPI ASL compiler (iasl) is needed"
-	@echo "Download and install Intel ACPI CA from"
-	@echo "http://acpica.org/downloads/"
-	@echo 
-	@exit 1
-
 clean:
 	rm -f $(C_SRC) $(H_SRC) $(MK_DSDT) $(C_SRC:=.$(TMP_SUFFIX))
 	rm -f $(patsubst %.c,%.hex,$(C_SRC)) $(patsubst %.c,%.aml,$(C_SRC)) $(patsubst %.c,%.asl,$(C_SRC))
diff --git a/tools/libacpi/README b/tools/libacpi/README
index 2b9d6e188c..4ab5ed2de7 100644
--- a/tools/libacpi/README
+++ b/tools/libacpi/README
@@ -24,9 +24,3 @@ In case that the acpi_dsdt.asl need to be updated, please
 Follow the instruction:
 
 # make acpi_dsdt.c
-
-Note:
-DSDT compiler "iasl" is needed. By default, it will be downloaded 
-using wget in Makefile. if it failed, please download manually from 
-http://developer.intel.com/technology/iapc/acpi/downloads.htm. 
-then compile and install iasl
-- 
Anthony PERARD


