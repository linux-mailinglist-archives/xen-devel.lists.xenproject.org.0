Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPfoD848tGk/jgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA95B2871A0
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253908.1549864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tf-0006Ko-SH; Fri, 13 Mar 2026 16:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253908.1549864; Fri, 13 Mar 2026 16:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tf-0006I1-Nc; Fri, 13 Mar 2026 16:35:07 +0000
Received: by outflank-mailman (input) for mailman id 1253908;
 Fri, 13 Mar 2026 16:35:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tQrp=BN=bounce.vates.tech=bounce-md_30504962.69b43cb5.v1-73f22918691e4f6590e71139c2bbb6cf@srs-se1.protection.inumbo.net>)
 id 1w15Te-0006Ek-Mi
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:35:06 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 958cdc8b-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:35:03 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fXVT156HszPm0PrP
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:35:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 73f22918691e4f6590e71139c2bbb6cf; Fri, 13 Mar 2026 16:35:01 +0000
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
X-Inumbo-ID: 958cdc8b-1efa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773419701; x=1773689701;
	bh=xkR51huuZGxHmTSzRvJUtjlM0MP/Kew4xYHp0fhpCbg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YNiAtf/nxp0NJtbCaQGLI2VrUUiUBaeDLqB3ZduynhWp2LTonNfA9A/Oky/7m/dr6
	 tLer3bn0irCv6unTBWcy5ZWCxI9ho1Af0IYu2KDVR7zylhktrlbAuPj3VBztQwgkIR
	 gU/ZdL/EbnYAOHEqhVRHWsh395nc++FsVQ059wU2x74iXabqDHWDT64a7tiPfiNpHZ
	 cLibmdl4SPAcRgB6ZkanNk+fskL+DUfTI2oXaUg1COCKRr4mnzs+8/3XcWMaaC8E6Y
	 GvlTtko2QUUgGcD/CeoByhJA9vsRYovWFsJeLPwvNiwm5JTFSvc5JDmfTrjEiS3TEX
	 LWYtcc6X6+G6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773419701; x=1773680201; i=thierry.escande@vates.tech;
	bh=xkR51huuZGxHmTSzRvJUtjlM0MP/Kew4xYHp0fhpCbg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aDCJyBCXYWddBWvMz/tk43hGiVkQL1U5pAV1Ibh9eF+MbSUU8CpG7UFonw0PNyaLr
	 MJP/h1AKv1Eb/f59DJfQfwwNzgqUdPexZgpdxyCHsUUzWz/50uRMfqScLxg5xAq9Rd
	 YLC8b8BTe4f9itCS3vcrj4O59LoCNCI71rNVAaO5w26x3hBsgsdmVhSRTzGJwv03zo
	 1pevTZSlZQ1b0LzWXYlarkXpMQ9IaWjWcXRmDeRg4J8pQKsT4DAsu6P5oJ0YMdw2FF
	 BK6FPTtEN5jMpom8Pr6EL2Resjc7faV1MQhjU5Ov/TXU2r9ad+Mm1Zo6D3L044IcSm
	 ZZ3+82MzfuTNg==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=2001/17]=20libacpi:=20Split=20dsdt.asl=20file=20and=20extract=20i440=20specific=20parts?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773419700638
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>
Message-Id: <20260313163455.790692-2-thierry.escande@vates.tech>
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.73f22918691e4f6590e71139c2bbb6cf?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:35:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url,mandrillapp.com:dkim];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.169];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AA95B2871A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In order to factorize the common parts between i440 and q35 dsdt files,
this patch splits dsdt.asl and put the i440 specific parts into
dsdt_i400.asl.

This also makes use of #include directives instead of file
concatenations to build the asl files.

Also, the anycpu asl files generation makes use of makefile pattern
rules to avoid duplication for i440 and q35.

Becuase the LPC controller BDF (which differs between i440 and q35) must
be set at device declaration, it is still set in dsdt.asl by checking
for a MACHINE_TYPE_I440 macro defined in dsdt_i400.asl.

Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 tools/firmware/hvmloader/Makefile  |  2 +-
 tools/firmware/hvmloader/ovmf.c    |  4 ++--
 tools/firmware/hvmloader/seabios.c |  4 ++--
 tools/firmware/hvmloader/util.c    |  4 ++--
 tools/firmware/hvmloader/util.h    |  4 ++--
 tools/libacpi/Makefile             | 10 ++++-----
 tools/libacpi/dsdt.asl             | 25 ++++-----------------
 tools/libacpi/dsdt_i440.asl        | 36 ++++++++++++++++++++++++++++++
 8 files changed, 53 insertions(+), 36 deletions(-)
 create mode 100644 tools/libacpi/dsdt_i440.asl

diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
index 21de72187d..bdc33a877f 100644
--- a/tools/firmware/hvmloader/Makefile
+++ b/tools/firmware/hvmloader/Makefile
@@ -78,7 +78,7 @@ rombios.o: roms.inc
 smbios.o: CFLAGS += -D__SMBIOS_DATE__="\"$(SMBIOS_REL_DATE)\""
 
 ACPI_PATH = ../../libacpi
-DSDT_FILES += dsdt_anycpu_qemu_xen.c
+DSDT_FILES += dsdt_i440_anycpu_qemu_xen.c
 ACPI_OBJS = $(patsubst %.c,%.o,$(DSDT_FILES)) build.o static_tables.o
 $(ACPI_OBJS): CFLAGS += -iquote . -DLIBACPI_STDUTILS=\"$(CURDIR)/util.h\"
 CFLAGS += -I$(ACPI_PATH)
diff --git a/tools/firmware/hvmloader/ovmf.c b/tools/firmware/hvmloader/ovmf.c
index 23610a0717..d264a50c73 100644
--- a/tools/firmware/hvmloader/ovmf.c
+++ b/tools/firmware/hvmloader/ovmf.c
@@ -119,8 +119,8 @@ static void ovmf_load(const struct bios_config *config,
 static void ovmf_acpi_build_tables(void)
 {
     struct acpi_config config = {
-        .dsdt_anycpu = dsdt_anycpu_qemu_xen,
-        .dsdt_anycpu_len = dsdt_anycpu_qemu_xen_len,
+        .dsdt_anycpu = dsdt_i440_anycpu_qemu_xen,
+        .dsdt_anycpu_len = dsdt_i440_anycpu_qemu_xen_len,
         .dsdt_15cpu = NULL, 
         .dsdt_15cpu_len = 0
     };
diff --git a/tools/firmware/hvmloader/seabios.c b/tools/firmware/hvmloader/seabios.c
index 444d118ddb..74b0406b5a 100644
--- a/tools/firmware/hvmloader/seabios.c
+++ b/tools/firmware/hvmloader/seabios.c
@@ -90,8 +90,8 @@ static void seabios_acpi_build_tables(void)
 {
     uint32_t rsdp = (uint32_t)scratch_alloc(sizeof(struct acpi_20_rsdp), 0);
     struct acpi_config config = {
-        .dsdt_anycpu = dsdt_anycpu_qemu_xen,
-        .dsdt_anycpu_len = dsdt_anycpu_qemu_xen_len,
+        .dsdt_anycpu = dsdt_i440_anycpu_qemu_xen,
+        .dsdt_anycpu_len = dsdt_i440_anycpu_qemu_xen_len,
         .dsdt_15cpu = NULL,
         .dsdt_15cpu_len = 0,
     };
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index e651342681..f1ed1eb48d 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -843,8 +843,8 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
     s = xenstore_read("platform/device-model", "");
     if ( !strncmp(s, "qemu_xen", 9) )
     {
-        config->dsdt_anycpu = dsdt_anycpu_qemu_xen;
-        config->dsdt_anycpu_len = dsdt_anycpu_qemu_xen_len;
+        config->dsdt_anycpu = dsdt_i440_anycpu_qemu_xen;
+        config->dsdt_anycpu_len = dsdt_i440_anycpu_qemu_xen_len;
         config->dsdt_15cpu = NULL;
         config->dsdt_15cpu_len = 0;
     }
diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index 765a013ddd..3c5eeff5e7 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -381,8 +381,8 @@ extern struct e820map memory_map;
 bool check_overlap(uint64_t start, uint64_t size,
                    uint64_t reserved_start, uint64_t reserved_size);
 
-extern const unsigned char dsdt_anycpu_qemu_xen[], dsdt_anycpu[], dsdt_15cpu[];
-extern const int dsdt_anycpu_qemu_xen_len, dsdt_anycpu_len, dsdt_15cpu_len;
+extern const unsigned char dsdt_i440_anycpu_qemu_xen[], dsdt_anycpu[], dsdt_15cpu[];
+extern const int dsdt_i440_anycpu_qemu_xen_len, dsdt_anycpu_len, dsdt_15cpu_len;
 
 unsigned long acpi_pages_allocated(void);
 
diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
index b21a64c6b4..d3d4bc9543 100644
--- a/tools/libacpi/Makefile
+++ b/tools/libacpi/Makefile
@@ -11,7 +11,7 @@ endif
 
 MK_DSDT = $(ACPI_BUILD_DIR)/mk_dsdt
 
-C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c dsdt_pvh.c
+C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_i440_anycpu_qemu_xen.c dsdt_pvh.c
 C_SRC-$(CONFIG_ARM_64) = dsdt_anycpu_arm.c
 DSDT_FILES ?= $(C_SRC-y)
 C_SRC = $(addprefix $(ACPI_BUILD_DIR)/, $(DSDT_FILES))
@@ -39,18 +39,16 @@ $(H_SRC): $(ACPI_BUILD_DIR)/%.h: %.asl
 $(MK_DSDT): mk_dsdt.c
 	$(HOSTCC) $(HOSTCFLAGS) $(MKDSDT_CFLAGS-y) $(CFLAGS_xeninclude) -D__XEN_TOOLS__ -o $@ mk_dsdt.c
 
-$(ACPI_BUILD_DIR)/dsdt_anycpu_qemu_xen.asl: dsdt.asl dsdt_acpi_info.asl $(MK_DSDT)
+$(ACPI_BUILD_DIR)/dsdt_%_anycpu_qemu_xen.asl: dsdt_%.asl dsdt.asl dsdt_acpi_info.asl $(MK_DSDT)
 	# Remove last bracket
 	awk 'NR > 1 {print s} {s=$$0}' $< > $@.$(TMP_SUFFIX)
-	cat dsdt_acpi_info.asl >> $@.$(TMP_SUFFIX)
 	$(MK_DSDT) --debug=$(debug) --dm-version qemu-xen >> $@.$(TMP_SUFFIX)
 	mv -f $@.$(TMP_SUFFIX) $@
 
 # NB. awk invocation is a portable alternative to 'head -n -1'
-$(ACPI_BUILD_DIR)/dsdt_%cpu.asl: dsdt.asl dsdt_acpi_info.asl  $(MK_DSDT)
+$(ACPI_BUILD_DIR)/dsdt_%cpu.asl: dsdt_i440.asl dsdt.asl dsdt_acpi_info.asl  $(MK_DSDT)
 	# Remove last bracket
 	awk 'NR > 1 {print s} {s=$$0}' $< > $@.$(TMP_SUFFIX)
-	cat dsdt_acpi_info.asl >> $@.$(TMP_SUFFIX)
 	$(MK_DSDT) --debug=$(debug) --maxcpu $*  >> $@.$(TMP_SUFFIX)
 	mv -f $@.$(TMP_SUFFIX) $@
 
@@ -65,7 +63,7 @@ $(ACPI_BUILD_DIR)/dsdt_anycpu_arm.asl: $(MK_DSDT)
 	mv -f $@.$(TMP_SUFFIX) $@
 
 $(C_SRC): $(ACPI_BUILD_DIR)/%.c: $(ACPI_BUILD_DIR)/%.asl
-	$(IASL) -vs -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $<
+	$(IASL) -vs -I $(CURDIR) -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $<
 	sed -e 's/AmlCode/$*/g' -e 's/_aml_code//g' $(ACPI_BUILD_DIR)/$*.hex > $@.$(TMP_SUFFIX)
 	echo "int $*_len=sizeof($*);" >> $@.$(TMP_SUFFIX)
 	mv -f $@.$(TMP_SUFFIX) $@
diff --git a/tools/libacpi/dsdt.asl b/tools/libacpi/dsdt.asl
index 32b42f85ae..130826fdcc 100644
--- a/tools/libacpi/dsdt.asl
+++ b/tools/libacpi/dsdt.asl
@@ -5,8 +5,6 @@
  * Copyright (c) 2004, Intel Corporation.
  */
 
-DefinitionBlock ("DSDT.aml", "DSDT", 2, "Xen", "HVM", 0)
-{
     Name (\PMBS, 0x0C00)
     Name (\PMLN, 0x08)
     Name (\IOB1, 0x00)
@@ -199,7 +197,10 @@ DefinitionBlock ("DSDT.aml", "DSDT", 2, "Xen", "HVM", 0)
 
             Device (ISA)
             {
-                Name (_ADR, 0x00010000) /* device 1, fn 0 */
+                /* Error will be raised if the machine type is not defined */
+                #ifdef MACHINE_TYPE_I440
+                    Name (_ADR, 0x00010000) /* device 1, fn 0 */
+                #endif
 
                 OperationRegion(PIRQ, PCI_Config, 0x60, 0x4)
                 Scope(\) {
@@ -329,23 +330,6 @@ DefinitionBlock ("DSDT.aml", "DSDT", 2, "Xen", "HVM", 0)
                     })
                 }
 
-                Device (FDC0)
-                {
-                    Name (_HID, EisaId ("PNP0700"))
-                    Method (_STA, 0, NotSerialized)
-                    {
-                          Return (0x0F)
-                    }
-
-                    Name (_CRS, ResourceTemplate ()
-                    {
-                        IO (Decode16, 0x03F0, 0x03F0, 0x01, 0x06)
-                        IO (Decode16, 0x03F7, 0x03F7, 0x01, 0x01)
-                        IRQNoFlags () {6}
-                        DMA (Compatibility, NotBusMaster, Transfer8) {2}
-                    })
-                }
-
                 Device (UAR1)
                 {
                     Name (_HID, EisaId ("PNP0501"))
@@ -444,4 +428,3 @@ DefinitionBlock ("DSDT.aml", "DSDT", 2, "Xen", "HVM", 0)
     Method(_PIC, 1) {
         Store(Arg0, PICD)
     }
-}
diff --git a/tools/libacpi/dsdt_i440.asl b/tools/libacpi/dsdt_i440.asl
new file mode 100644
index 0000000000..e80c454ad9
--- /dev/null
+++ b/tools/libacpi/dsdt_i440.asl
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: LGPL-2.1-only */
+/******************************************************************************
+ * DSDT for Xen with Qemu device model (for i440 machine)
+ *
+ * Copyright (c) 2004, Intel Corporation.
+ */
+
+DefinitionBlock ("DSDT.aml", "DSDT", 2, "Xen", "HVM", 0)
+{
+    #define MACHINE_TYPE_I440
+
+    #include "dsdt.asl"
+
+    Scope (\_SB.PCI0.ISA)
+    {
+         Device (FDC0)
+         {
+             Name (_HID, EisaId ("PNP0700"))
+
+             Method (_STA, 0, NotSerialized)
+             {
+                   Return (0x0F)
+             }
+
+             Name (_CRS, ResourceTemplate ()
+             {
+                 IO (Decode16, 0x03F0, 0x03F0, 0x01, 0x06)
+                 IO (Decode16, 0x03F7, 0x03F7, 0x01, 0x01)
+                 IRQNoFlags () {6}
+                 DMA (Compatibility, NotBusMaster, Transfer8) {2}
+             })
+        }
+    }
+
+    #include "dsdt_acpi_info.asl"
+}
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


