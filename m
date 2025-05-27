Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22A6AC4F8F
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 15:21:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998396.1379146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJuEg-0003Ef-3l; Tue, 27 May 2025 13:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998396.1379146; Tue, 27 May 2025 13:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJuEf-0003Cx-VZ; Tue, 27 May 2025 13:20:53 +0000
Received: by outflank-mailman (input) for mailman id 998396;
 Tue, 27 May 2025 13:20:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D0pS=YL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uJuEe-0002tx-P0
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 13:20:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 686240e2-3afd-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 15:20:50 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0F0CF1FCF7;
 Tue, 27 May 2025 13:20:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA25F1388B;
 Tue, 27 May 2025 13:20:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jK35JzG8NWi7KAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 27 May 2025 13:20:49 +0000
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
X-Inumbo-ID: 686240e2-3afd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1748352050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tU5QFICkNQ7hlXTT5UCIPUv95/pjHx0DdiUteXwYvsU=;
	b=auBuQJ6x+H3XjeCh2O3rj8a9Oa6iHxHlpaglaMU4p+Xd/o5f55UShpk04wpWKWiyAgsuc9
	X4hgdicghp+RDVP8W5Yn0yq8x3ZNe2ZQ7xXi1L/I/oh1NKfOAFGsVPCbQj3hHy0W81USFq
	FrhQ2CsLmeGexsyfJcb+Z1PrCxA51z4=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=auBuQJ6x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1748352050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tU5QFICkNQ7hlXTT5UCIPUv95/pjHx0DdiUteXwYvsU=;
	b=auBuQJ6x+H3XjeCh2O3rj8a9Oa6iHxHlpaglaMU4p+Xd/o5f55UShpk04wpWKWiyAgsuc9
	X4hgdicghp+RDVP8W5Yn0yq8x3ZNe2ZQ7xXi1L/I/oh1NKfOAFGsVPCbQj3hHy0W81USFq
	FrhQ2CsLmeGexsyfJcb+Z1PrCxA51z4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 2/4] tools: remove support for running a guest with qemu-traditional
Date: Tue, 27 May 2025 15:20:31 +0200
Message-ID: <20250527132035.985-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527132035.985-1-jgross@suse.com>
References: <20250527132035.985-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email]
X-Rspamd-Queue-Id: 0F0CF1FCF7
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 

Remove the code in tools for running a guest with qemu-traditional.
This covers xl, libxl, libacpi, hvmloader and the related python and
go bindings.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Jan Beulich <jbeulich@suse.com> # hvmloader
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
V2:
- Keep most of the removed comment in hvmloader, while removing parts
  of another one (Jan Beulich)
V3:
- keep the default of allow_memory_relocate = 1; (Anthony Perard)
- expand a comment in hvmloader's pci_setup() (Anthony Perard)
- don't build in dsdt_anycpu and dsdt_15cpu if not needed (Anthony Perard)
- make --dm_version a mandatory mk_dsdt parameter (Anthony Perard)
- simplify code in libxl__domain_build_info_setdefault() (Anthony Perard)
- make comments in libxl_dm.c more clear (Anthony Perard)
- remove some more no longer used libxl functions (Anthony Perard)
- keep QEMU_XEN_TRADITIONAL define (Anthony Perard)
V4:
- always reset DSDT_FILES in hvmloader Makefile (Jan Beulich)
- fix typos in comments (Anthone Perard)
- avoid build failure on Arm (Anthony Perard)
---
 tools/firmware/hvmloader/Makefile         |   4 +-
 tools/firmware/hvmloader/pci.c            |  17 +-
 tools/firmware/hvmloader/util.c           |   9 +-
 tools/libacpi/mk_dsdt.c                   | 185 +++---------
 tools/libs/light/libxl_create.c           |  78 +-----
 tools/libs/light/libxl_device.c           |  19 --
 tools/libs/light/libxl_disk.c             |   7 -
 tools/libs/light/libxl_dm.c               | 327 +---------------------
 tools/libs/light/libxl_dom.c              |  10 -
 tools/libs/light/libxl_dom_save.c         | 140 ---------
 tools/libs/light/libxl_dom_suspend.c      |  65 -----
 tools/libs/light/libxl_domain.c           |  15 -
 tools/libs/light/libxl_exec.c             |  75 -----
 tools/libs/light/libxl_internal.c         |   6 +-
 tools/libs/light/libxl_internal.h         |  68 +----
 tools/libs/light/libxl_pci.c              | 183 ------------
 tools/libs/light/libxl_sr_stream_format.h |   2 +-
 tools/libs/light/libxl_stream_write.c     |   4 -
 tools/libs/light/libxl_types.idl          |   2 +-
 tools/python/xen/migration/libxl.py       |   2 -
 tools/xl/xl_parse.c                       |   5 +-
 21 files changed, 77 insertions(+), 1146 deletions(-)

diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
index cc5dc00498..ec1f452a7e 100644
--- a/tools/firmware/hvmloader/Makefile
+++ b/tools/firmware/hvmloader/Makefile
@@ -53,12 +53,14 @@ endif
 endif
 
 ROMS := 
+DSDT_FILES := 
 
 ifeq ($(CONFIG_ROMBIOS),y)
 OBJS += optionroms.o 32bitbios_support.o rombios.o
 CFLAGS += -DENABLE_ROMBIOS
 ROMBIOS_ROM := $(ROMBIOS_DIR)/BIOS-bochs-latest
 ROMS += $(ROMBIOS_ROM) $(STDVGA_ROM) $(CIRRUSVGA_ROM)
+DSDT_FILES += dsdt_anycpu.c dsdt_15cpu.c
 endif
 
 # Suppress the warning about LOAD segments with RWX permissions, as what we
@@ -76,7 +78,7 @@ rombios.o: roms.inc
 smbios.o: CFLAGS += -D__SMBIOS_DATE__="\"$(SMBIOS_REL_DATE)\""
 
 ACPI_PATH = ../../libacpi
-DSDT_FILES = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c
+DSDT_FILES += dsdt_anycpu_qemu_xen.c
 ACPI_OBJS = $(patsubst %.c,%.o,$(DSDT_FILES)) build.o static_tables.o
 $(ACPI_OBJS): CFLAGS += -iquote . -DLIBACPI_STDUTILS=\"$(CURDIR)/util.h\"
 CFLAGS += -I$(ACPI_PATH)
diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
index c3c61ca060..cc67b18c03 100644
--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -113,17 +113,7 @@ void pci_setup(void)
      * increase the size of the lowmem MMIO hole?  Defaulting to 1
      * here will mean that non-libxl toolstacks (including xend and
      * home-grown ones) means that those using qemu-xen will still
-     * experience the memory relocation bug described below; but it
-     * also means that those using qemu-traditional will *not*
-     * experience any change; and it also means that there is a
-     * work-around for those using qemu-xen, namely switching to
-     * qemu-traditional.
-     *
-     * If we defaulted to 0, and failing to resize the hole caused any
-     * problems with qemu-traditional, then there is no work-around.
-     *
-     * Since xend can only use qemu-traditional, I think this is the
-     * option that will have the least impact.
+     * experience the memory relocation bug described below.
      */
     bool allow_memory_relocate = 1;
 
@@ -347,9 +337,8 @@ void pci_setup(void)
     {
         /*
          * At the moment qemu-xen can't deal with relocated memory regions.
-         * It's too close to the release to make a proper fix; for now,
-         * only allow the MMIO hole to grow large enough to move guest memory
-         * if we're running qemu-traditional.  Items that don't fit will be
+         * Only allow the MMIO hole to grow large enough to move guest memory
+         * if allow_memory_relocate is true.  Items that don't fit will be
          * relocated into the 64-bit address space.
          *
          * This loop now does the following:
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 2d07ce1290..79c0e6bd4a 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -843,14 +843,7 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
 
     /* If the device model is specified switch to the corresponding tables */
     s = xenstore_read("platform/device-model", "");
-    if ( !strncmp(s, "qemu_xen_traditional", 21) )
-    {
-        config->dsdt_anycpu = dsdt_anycpu;
-        config->dsdt_anycpu_len = dsdt_anycpu_len;
-        config->dsdt_15cpu = dsdt_15cpu;
-        config->dsdt_15cpu_len = dsdt_15cpu_len;
-    }
-    else if ( !strncmp(s, "qemu_xen", 9) )
+    if ( !strncmp(s, "qemu_xen", 9) )
     {
         config->dsdt_anycpu = dsdt_anycpu_qemu_xen;
         config->dsdt_anycpu_len = dsdt_anycpu_qemu_xen_len;
diff --git a/tools/libacpi/mk_dsdt.c b/tools/libacpi/mk_dsdt.c
index 34f6753f61..8ac4f9d0b4 100644
--- a/tools/libacpi/mk_dsdt.c
+++ b/tools/libacpi/mk_dsdt.c
@@ -19,8 +19,8 @@ static bool debug = false;
 
 typedef enum dm_version {
     QEMU_NONE,
-    QEMU_XEN_TRADITIONAL,
     QEMU_XEN,
+    QEMU_INVALID
 } dm_version;
 
 static void indent(void)
@@ -68,30 +68,6 @@ static void pop_block(void)
     printf("}\n");
 }
 
-#ifdef CONFIG_X86
-static void pci_hotplug_notify(unsigned int slt)
-{
-    stmt("Notify", "\\_SB.PCI0.S%02X, EVT", slt);
-}
-
-static void decision_tree(
-    unsigned int s, unsigned int e, char *var, void (*leaf)(unsigned int))
-{
-    if ( s == (e-1) )
-    {
-        (*leaf)(s);
-        return;
-    }
-
-    push_block("If", "And(%s, 0x%02x)", var, (e-s)/2);
-    decision_tree((s+e)/2, e, var, leaf);
-    pop_block();
-    push_block("Else", NULL);
-    decision_tree(s, (s+e)/2, var, leaf);
-    pop_block();
-}
-#endif
-
 static struct option options[] = {
     { "maxcpu", 1, 0, 'c' },
 #ifdef CONFIG_X86
@@ -105,7 +81,7 @@ int main(int argc, char **argv)
 {
     unsigned int cpu, max_cpus;
 #if defined(CONFIG_X86)
-    dm_version dm_version = QEMU_XEN_TRADITIONAL;
+    dm_version dm_version = QEMU_INVALID;
     unsigned int slot, dev, intx, link;
 
     max_cpus = HVM_MAX_VCPUS;
@@ -141,8 +117,6 @@ int main(int argc, char **argv)
         case 'q':
             if (strcmp(optarg, "qemu-xen") == 0) {
                 dm_version = QEMU_XEN;
-            } else if (strcmp(optarg, "qemu-xen-traditional") == 0) {
-                dm_version = QEMU_XEN_TRADITIONAL;
             } else if (strcmp(optarg, "none") == 0) {
                 dm_version = QEMU_NONE;
             } else {
@@ -160,6 +134,13 @@ int main(int argc, char **argv)
         }
     }
 
+#ifdef CONFIG_X86
+    if (dm_version == QEMU_INVALID) {
+        fprintf(stderr, "--dm_version is a mandatory parameter.\n");
+        return -1;
+    }
+#endif
+
     /**** DSDT DefinitionBlock start ****/
     /* (we append to existing DSDT definition block) */
     indent_level++;
@@ -278,9 +259,7 @@ int main(int argc, char **argv)
 
     /* Define GPE control method. */
     push_block("Scope", "\\_GPE");
-    push_block("Method",
-               dm_version == QEMU_XEN_TRADITIONAL ? "_L%02d" : "_E%02d",
-               XEN_ACPI_GPE0_CPUHP_BIT);
+    push_block("Method", "_E%02d", XEN_ACPI_GPE0_CPUHP_BIT);
     stmt("\\_SB.PRSC ()", NULL);
     pop_block();
     pop_block();
@@ -302,17 +281,10 @@ int main(int argc, char **argv)
      */
     push_block("Device", "HP0"); {
         stmt("Name", "_HID, EISAID(\"PNP0C02\")");
-        if (dm_version == QEMU_XEN_TRADITIONAL) {
-            stmt("Name", "_CRS, ResourceTemplate() {"
-                 "  IO (Decode16, 0x10c0, 0x10c0, 0x00, 0x82)"
-                 "  IO (Decode16, 0xb044, 0xb044, 0x00, 0x04)"
-                 "}");
-        } else {
-            stmt("Name", "_CRS, ResourceTemplate() {"
-                 "  IO (Decode16, 0xae00, 0xae00, 0x00, 0x10)"
-                 "  IO (Decode16, 0xb044, 0xb044, 0x00, 0x04)"
-                 "}");
-        }
+        stmt("Name", "_CRS, ResourceTemplate() {"
+             "  IO (Decode16, 0xae00, 0xae00, 0x00, 0x10)"
+             "  IO (Decode16, 0xb044, 0xb044, 0x00, 0x04)"
+             "}");
     } pop_block();
 
     /*** PCI-ISA link definitions ***/
@@ -397,60 +369,27 @@ int main(int argc, char **argv)
      * QEMU provides a simple hotplug controller with some I/O to handle
      * the hotplug action and status, which is beyond the ACPI scope.
      */
-    if (dm_version == QEMU_XEN_TRADITIONAL) {
-        for ( slot = 0; slot < 0x100; slot++ )
-        {
-            push_block("Device", "S%02X", slot);
-            /* _ADR == dev:fn (16:16) */
-            stmt("Name", "_ADR, 0x%08x", ((slot & ~7) << 13) | (slot & 7));
-            /* _SUN == dev */
-            stmt("Name", "_SUN, 0x%08x", slot >> 3);
-            push_block("Method", "_EJ0, 1");
-            if (debug)
-            {
-                stmt("Store", "0x%02x, \\_GPE.DPT1", slot);
-                stmt("Store", "0x88, \\_GPE.DPT2");
-            }
-            stmt("Store", "0x%02x, \\_GPE.PH%02X", /* eject */
-                 (slot & 1) ? 0x10 : 0x01, slot & ~1);
-            pop_block();
-            push_block("Method", "_STA, 0");
-            if (debug)
-            {
-                stmt("Store", "0x%02x, \\_GPE.DPT1", slot);
-                stmt("Store", "0x89, \\_GPE.DPT2");
-            }
-            if ( slot & 1 )
-                stmt("ShiftRight", "\\_GPE.PH%02X, 0x04, Local1", slot & ~1);
-            else
-                stmt("And", "\\_GPE.PH%02X, 0x0f, Local1", slot & ~1);
-            stmt("Return", "Local1"); /* IN status as the _STA */
-            pop_block();
-            pop_block();
-        }
-    } else {
-        stmt("OperationRegion", "SEJ, SystemIO, 0xae08, 0x08");
-        push_block("Field", "SEJ, DWordAcc, NoLock, WriteAsZeros");
-        indent(); printf("B0EJ, 32,\n");
-        indent(); printf("B0RM, 32,\n");
-        pop_block();
+    stmt("OperationRegion", "SEJ, SystemIO, 0xae08, 0x08");
+    push_block("Field", "SEJ, DWordAcc, NoLock, WriteAsZeros");
+    indent(); printf("B0EJ, 32,\n");
+    indent(); printf("B0RM, 32,\n");
+    pop_block();
 
-        /* hotplug_slot */
-        for (slot = 1; slot <= 31; slot++) {
-            push_block("Device", "S%i", slot); {
-                stmt("Name", "_ADR, %#06x0000", slot);
-                push_block("Method", "_EJ0,1"); {
-                    stmt("Store", "%#010x, B0EJ", 1 << slot);
-                } pop_block();
-                stmt("Name", "_SUN, %i", slot);
-                push_block("Method", "_STA, 0"); {
-                    push_block("If", "And(B0RM, ShiftLeft(1, %i))", slot);
-                    stmt("Return", "0xF");
-                    pop_block();
-                    stmt("Return", "0x0");
-                } pop_block();
+    /* hotplug_slot */
+    for (slot = 1; slot <= 31; slot++) {
+        push_block("Device", "S%i", slot); {
+            stmt("Name", "_ADR, %#06x0000", slot);
+            push_block("Method", "_EJ0,1"); {
+                stmt("Store", "%#010x, B0EJ", 1 << slot);
             } pop_block();
-        }
+            stmt("Name", "_SUN, %i", slot);
+            push_block("Method", "_STA, 0"); {
+                push_block("If", "And(B0RM, ShiftLeft(1, %i))", slot);
+                stmt("Return", "0xF");
+                pop_block();
+                stmt("Return", "0x0");
+            } pop_block();
+        } pop_block();
     }
 
     pop_block();
@@ -460,26 +399,11 @@ int main(int argc, char **argv)
     /**** GPE start ****/
     push_block("Scope", "\\_GPE");
 
-    if (dm_version == QEMU_XEN_TRADITIONAL) {
-        stmt("OperationRegion", "PHP, SystemIO, 0x10c0, 0x82");
-
-        push_block("Field", "PHP, ByteAcc, NoLock, Preserve");
-        indent(); printf("PSTA, 8,\n"); /* hotplug controller event reg */
-        indent(); printf("PSTB, 8,\n"); /* hotplug controller slot reg */
-        for ( slot = 0; slot < 0x100; slot += 2 )
-        {
-            indent();
-            /* Each hotplug control register manages a pair of pci functions. */
-            printf("PH%02X, 8,\n", slot);
-        }
-        pop_block();
-    } else {
-        stmt("OperationRegion", "PCST, SystemIO, 0xae00, 0x08");
-        push_block("Field", "PCST, DWordAcc, NoLock, WriteAsZeros");
-        indent(); printf("PCIU, 32,\n");
-        indent(); printf("PCID, 32,\n");
-        pop_block();
-    }
+    stmt("OperationRegion", "PCST, SystemIO, 0xae00, 0x08");
+    push_block("Field", "PCST, DWordAcc, NoLock, WriteAsZeros");
+    indent(); printf("PCIU, 32,\n");
+    indent(); printf("PCID, 32,\n");
+    pop_block();
 
     stmt("OperationRegion", "DG1, SystemIO, 0xb044, 0x04");
 
@@ -487,35 +411,16 @@ int main(int argc, char **argv)
     indent(); printf("DPT1, 8, DPT2, 8\n");
     pop_block();
 
-    if (dm_version == QEMU_XEN_TRADITIONAL) {
-        push_block("Method", "_L03, 0, Serialized");
-        /* Detect slot and event (remove/add). */
-        stmt("Name", "SLT, 0x0");
-        stmt("Name", "EVT, 0x0");
-        stmt("Store", "PSTA, Local1");
-        stmt("And", "Local1, 0xf, EVT");
-        stmt("Store", "PSTB, Local1"); /* XXX: Store (PSTB, SLT) ? */
-        stmt("And", "Local1, 0xff, SLT");
-        if (debug)
-        {
-            stmt("Store", "SLT, DPT1");
-            stmt("Store", "EVT, DPT2");
-        }
-        /* Decision tree */
-        decision_tree(0x00, 0x100, "SLT", pci_hotplug_notify);
+    push_block("Method", "_E01");
+    for (slot = 1; slot <= 31; slot++) {
+        push_block("If", "And(PCIU, ShiftLeft(1, %i))", slot);
+        stmt("Notify", "\\_SB.PCI0.S%i, 1", slot);
         pop_block();
-    } else {
-        push_block("Method", "_E01");
-        for (slot = 1; slot <= 31; slot++) {
-            push_block("If", "And(PCIU, ShiftLeft(1, %i))", slot);
-            stmt("Notify", "\\_SB.PCI0.S%i, 1", slot);
-            pop_block();
-            push_block("If", "And(PCID, ShiftLeft(1, %i))", slot);
-            stmt("Notify", "\\_SB.PCI0.S%i, 3", slot);
-            pop_block();
-        }
+        push_block("If", "And(PCID, ShiftLeft(1, %i))", slot);
+        stmt("Notify", "\\_SB.PCI0.S%i, 3", slot);
         pop_block();
     }
+    pop_block();
 
     pop_block();
     /**** GPE end ****/
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index e03599ea99..8bc768b515 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -99,35 +99,14 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         b_info->device_model_ssidref = SECINITSID_DOMDM;
 
     if (!b_info->device_model_version) {
-        if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
-            if (libxl_defbool_val(b_info->device_model_stubdomain)) {
-                b_info->device_model_version =
-                    LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL;
-            } else {
-                b_info->device_model_version = LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN;
-            }
-        } else {
-            b_info->device_model_version =
-                LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN;
-        }
-        if (b_info->device_model_version
-                == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN) {
-            const char *dm;
-
-            dm = libxl__domain_device_model(gc, b_info);
-            rc = access(dm, X_OK);
-            if (rc < 0) {
-                /* qemu-xen unavailable, use qemu-xen-traditional */
-                if (errno == ENOENT) {
-                    LOGE(INFO, "qemu-xen is unavailable"
-                         ", using qemu-xen-traditional instead");
-                    b_info->device_model_version =
-                        LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL;
-                } else {
-                    LOGE(ERROR, "qemu-xen access error");
-                    return ERROR_FAIL;
-                }
-            }
+        const char *dm;
+
+        b_info->device_model_version = LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN;
+        dm = libxl__domain_device_model(gc, b_info);
+        rc = access(dm, X_OK);
+        if (rc < 0) {
+            LOGE(ERROR, "qemu-xen access error");
+            return ERROR_FAIL;
         }
     }
 
@@ -137,8 +116,6 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
     if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
         if (!b_info->u.hvm.bios)
             switch (b_info->device_model_version) {
-            case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
-                b_info->u.hvm.bios = LIBXL_BIOS_TYPE_ROMBIOS; break;
             case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
                 b_info->u.hvm.bios = LIBXL_BIOS_TYPE_SEABIOS; break;
             default:
@@ -148,12 +125,6 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
 
         /* Enforce BIOS<->Device Model version relationship */
         switch (b_info->device_model_version) {
-        case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
-            if (b_info->u.hvm.bios != LIBXL_BIOS_TYPE_ROMBIOS) {
-                LOG(ERROR, "qemu-xen-traditional requires bios=rombios.");
-                return ERROR_INVAL;
-            }
-            break;
         case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
             if (b_info->u.hvm.bios == LIBXL_BIOS_TYPE_ROMBIOS) {
                 LOG(ERROR, "qemu-xen does not support bios=rombios.");
@@ -176,10 +147,6 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         libxl_defbool_val(b_info->device_model_stubdomain)) {
         if (!b_info->stubdomain_kernel) {
             switch (b_info->device_model_version) {
-                case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
-                    b_info->stubdomain_kernel =
-                        libxl__abs_path(NOGC, "ioemu-stubdom.gz", libxl__xenfirmwaredir_path());
-                    break;
                 case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
                     b_info->stubdomain_kernel =
                         libxl__abs_path(NOGC,
@@ -192,8 +159,6 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         }
         if (!b_info->stubdomain_ramdisk) {
             switch (b_info->device_model_version) {
-                case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
-                    break;
                 case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
                     b_info->stubdomain_ramdisk =
                         libxl__abs_path(NOGC,
@@ -299,33 +264,6 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
             b_info->u.hvm.hdtype = LIBXL_HDTYPE_IDE;
 
         switch (b_info->device_model_version) {
-        case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
-            switch (b_info->u.hvm.vga.kind) {
-            case LIBXL_VGA_INTERFACE_TYPE_NONE:
-                if (b_info->video_memkb == LIBXL_MEMKB_DEFAULT)
-                    b_info->video_memkb = 0;
-                break;
-            case LIBXL_VGA_INTERFACE_TYPE_QXL:
-                LOG(ERROR,"qemu upstream required for qxl vga");
-                return ERROR_INVAL;
-                break;
-            case LIBXL_VGA_INTERFACE_TYPE_STD:
-                if (b_info->video_memkb == LIBXL_MEMKB_DEFAULT)
-                    b_info->video_memkb = 8 * 1024;
-                if (b_info->video_memkb < 8 * 1024) {
-                    LOG(ERROR, "videoram must be at least 8 MB for STDVGA on QEMU_XEN_TRADITIONAL");
-                    return ERROR_INVAL;
-                }
-                break;
-            case LIBXL_VGA_INTERFACE_TYPE_CIRRUS:
-            default:
-                if (b_info->video_memkb == LIBXL_MEMKB_DEFAULT)
-                    b_info->video_memkb = 4 * 1024;
-                if (b_info->video_memkb != 4 * 1024)
-                    LOG(WARN, "ignoring videoram other than 4 MB for CIRRUS on QEMU_XEN_TRADITIONAL");
-                break;
-            }
-            break;
         case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
         default:
             switch (b_info->u.hvm.vga.kind) {
diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_device.c
index 4faa5fa3bd..42d71c17bc 100644
--- a/tools/libs/light/libxl_device.c
+++ b/tools/libs/light/libxl_device.c
@@ -1440,25 +1440,6 @@ static void devices_remove_callback(libxl__egc *egc,
     return;
 }
 
-int libxl__wait_for_device_model_deprecated(libxl__gc *gc,
-                                 uint32_t domid, char *state,
-                                 libxl__spawn_starting *spawning,
-                                 int (*check_callback)(libxl__gc *gc,
-                                                       uint32_t domid,
-                                                       const char *state,
-                                                       void *userdata),
-                                 void *check_callback_userdata)
-{
-    char *path;
-    uint32_t dm_domid = libxl_get_stubdom_id(CTX, domid);
-
-    path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/state");
-    return libxl__xenstore_child_wait_deprecated(gc, domid,
-                                     LIBXL_DEVICE_MODEL_START_TIMEOUT,
-                                     "Device Model", path, state, spawning,
-                                     check_callback, check_callback_userdata);
-}
-
 int libxl__wait_for_backend(libxl__gc *gc, const char *be_path,
                             const char *state)
 {
diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index 6a0b6e06fe..456b5450ca 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -1007,13 +1007,6 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
         disk->backend = LIBXL_DISK_BACKEND_PHY;
     }
 
-    if (cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL &&
-        stubdomid) {
-        LOGD(ERROR, domid, "cdrom-insert doesn't work for Mini-OS stubdoms");
-        rc = ERROR_INVAL;
-        goto out;
-    }
-
     disks = libxl__device_list(gc, &libxl__disk_devtype, cis->disk_domid, &num);
     for (i = 0; i < num; i++) {
         if (disks[i].is_cdrom && !strcmp(disk->vdev, disks[i].vdev))
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 4627564c0d..511ec76a65 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -328,9 +328,6 @@ const char *libxl__domain_device_model(libxl__gc *gc,
         dm = libxl__strdup(gc, info->device_model);
     } else {
         switch (info->device_model_version) {
-        case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
-            dm = libxl__abs_path(gc, "qemu-dm", libxl__private_bindir_path());
-            break;
         case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN: {
             const char *configured_dm = qemu_xen_path(gc);
             if (configured_dm[0] == '/')
@@ -704,272 +701,6 @@ static const char *dm_keymap(const libxl_domain_config *guest_config)
         return NULL;
 }
 
-static int libxl__build_device_model_args_old(libxl__gc *gc,
-                                        const char *dm, int domid,
-                                        const libxl_domain_config *guest_config,
-                                        char ***args, char ***envs,
-                                        const libxl__domain_build_state *state)
-{
-    const libxl_domain_create_info *c_info = &guest_config->c_info;
-    const libxl_domain_build_info *b_info = &guest_config->b_info;
-    const libxl_device_nic *nics = guest_config->nics;
-    const libxl_vnc_info *vnc = libxl__dm_vnc(guest_config);
-    const libxl_sdl_info *sdl = dm_sdl(guest_config);
-    const int num_nics = guest_config->num_nics;
-    const char *keymap = dm_keymap(guest_config);
-    int i;
-    flexarray_t *dm_args, *dm_envs;
-    dm_args = flexarray_make(gc, 16, 1);
-    dm_envs = flexarray_make(gc, 16, 1);
-
-    assert(state->dm_monitor_fd == -1);
-
-    flexarray_vappend(dm_args, dm,
-                      "-d", GCSPRINTF("%d", domid), NULL);
-
-    if (c_info->name)
-        flexarray_vappend(dm_args, "-domain-name", c_info->name, NULL);
-
-    if (vnc) {
-        char *vncarg = NULL;
-
-        flexarray_append(dm_args, "-vnc");
-
-        /*
-         * If vnc->listen is present and contains a :, and
-         *  - vnc->display is 0, use vnc->listen
-         *  - vnc->display is non-zero, be confused
-         * If vnc->listen is present but doesn't, use vnc->listen:vnc->display.
-         * If vnc->listen is not present, use 127.0.0.1:vnc->display
-         * (Remembering that vnc->display already defaults to 0.)
-         */
-        if (vnc->listen) {
-            if (strchr(vnc->listen, ':') != NULL) {
-                if (vnc->display) {
-                    LOGD(ERROR, domid, "vncdisplay set, vnclisten contains display");
-                    return ERROR_INVAL;
-                }
-                vncarg = vnc->listen;
-            } else {
-                vncarg = GCSPRINTF("%s:%d", vnc->listen, vnc->display);
-            }
-        } else
-            vncarg = GCSPRINTF("127.0.0.1:%d", vnc->display);
-
-        if (vnc->passwd && vnc->passwd[0]) {
-            vncarg = GCSPRINTF("%s,password", vncarg);
-        }
-
-        flexarray_append(dm_args, vncarg);
-
-        if (libxl_defbool_val(vnc->findunused)) {
-            flexarray_append(dm_args, "-vncunused");
-        }
-    } else if (!sdl) {
-        /*
-         * VNC is not enabled by default by qemu-xen-traditional,
-         * however skipping -vnc causes SDL to be
-         * (unexpectedly) enabled by default. If undesired, disable graphics at
-         * all.
-         */
-        flexarray_append(dm_args, "-nographic");
-    }
-
-    if (sdl) {
-        flexarray_append(dm_args, "-sdl");
-        if (!libxl_defbool_val(sdl->opengl)) {
-            flexarray_append(dm_args, "-disable-opengl");
-        }
-        if (sdl->display)
-            flexarray_append_pair(dm_envs, "DISPLAY", sdl->display);
-        if (sdl->xauthority)
-            flexarray_append_pair(dm_envs, "XAUTHORITY", sdl->xauthority);
-    }
-    if (keymap) {
-        flexarray_vappend(dm_args, "-k", keymap, NULL);
-    }
-    if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
-        int ioemu_nics = 0;
-        int nr_set_cpus = 0;
-        char *s;
-
-        flexarray_append_pair(dm_envs, "XEN_DOMAIN_ID", GCSPRINTF("%d", domid));
-
-        if (b_info->kernel) {
-            LOGD(ERROR, domid, "HVM direct kernel boot is not supported by "
-                 "qemu-xen-traditional");
-            return ERROR_INVAL;
-        }
-
-        if (b_info->u.hvm.serial || b_info->u.hvm.serial_list) {
-            if ( b_info->u.hvm.serial && b_info->u.hvm.serial_list )
-            {
-                LOGD(ERROR, domid, "Both serial and serial_list set");
-                return ERROR_INVAL;
-            }
-            if (b_info->u.hvm.serial) {
-                flexarray_vappend(dm_args,
-                                  "-serial", b_info->u.hvm.serial, NULL);
-            } else if (b_info->u.hvm.serial_list) {
-                char **p;
-                for (p = b_info->u.hvm.serial_list;
-                     *p;
-                     p++) {
-                    flexarray_vappend(dm_args,
-                                      "-serial",
-                                      *p, NULL);
-                }
-            }
-        }
-
-        if (libxl_defbool_val(b_info->u.hvm.nographic) && (!sdl && !vnc)) {
-            flexarray_append(dm_args, "-nographic");
-        }
-
-        if (b_info->video_memkb) {
-            flexarray_vappend(dm_args, "-videoram",
-                    GCSPRINTF("%d", libxl__sizekb_to_mb(b_info->video_memkb)),
-                    NULL);
-        }
-
-        switch (b_info->u.hvm.vga.kind) {
-        case LIBXL_VGA_INTERFACE_TYPE_STD:
-            flexarray_append(dm_args, "-std-vga");
-            break;
-        case LIBXL_VGA_INTERFACE_TYPE_CIRRUS:
-            break;
-        case LIBXL_VGA_INTERFACE_TYPE_NONE:
-            flexarray_append_pair(dm_args, "-vga", "none");
-            break;
-        case LIBXL_VGA_INTERFACE_TYPE_QXL:
-            break;
-        default:
-            LOGD(ERROR, domid, "Invalid emulated video card specified");
-            return ERROR_INVAL;
-        }
-
-        if (b_info->u.hvm.boot) {
-            flexarray_vappend(dm_args, "-boot", b_info->u.hvm.boot, NULL);
-        }
-        if (libxl_defbool_val(b_info->u.hvm.usb)
-            || b_info->u.hvm.usbdevice
-            || libxl_string_list_length(&b_info->u.hvm.usbdevice_list)) {
-            if (b_info->u.hvm.usbdevice
-                && libxl_string_list_length(&b_info->u.hvm.usbdevice_list)) {
-                LOGD(ERROR, domid, "Both usbdevice and usbdevice_list set");
-                return ERROR_INVAL;
-            }
-            flexarray_append(dm_args, "-usb");
-            if (b_info->u.hvm.usbdevice) {
-                flexarray_vappend(dm_args,
-                                  "-usbdevice", b_info->u.hvm.usbdevice, NULL);
-            } else if (b_info->u.hvm.usbdevice_list) {
-                char **p;
-                for (p = b_info->u.hvm.usbdevice_list;
-                     *p;
-                     p++) {
-                    flexarray_vappend(dm_args,
-                                      "-usbdevice",
-                                      *p, NULL);
-                }
-            }
-        }
-        if (b_info->u.hvm.soundhw) {
-            flexarray_vappend(dm_args, "-soundhw", b_info->u.hvm.soundhw, NULL);
-        }
-        if (libxl__acpi_defbool_val(b_info)) {
-            flexarray_append(dm_args, "-acpi");
-        }
-        if (b_info->max_vcpus > 1) {
-            flexarray_vappend(dm_args, "-vcpus",
-                              GCSPRINTF("%d", b_info->max_vcpus),
-                              NULL);
-        }
-
-        nr_set_cpus = libxl_bitmap_count_set(&b_info->avail_vcpus);
-        s = libxl_bitmap_to_hex_string(CTX, &b_info->avail_vcpus);
-        flexarray_vappend(dm_args, "-vcpu_avail",
-                              GCSPRINTF("%s", s), NULL);
-        free(s);
-
-        for (i = 0; i < num_nics; i++) {
-            if (nics[i].nictype == LIBXL_NIC_TYPE_VIF_IOEMU) {
-                char *smac = GCSPRINTF(
-                                   LIBXL_MAC_FMT, LIBXL_MAC_BYTES(nics[i].mac));
-                const char *ifname = libxl__device_nic_devname(gc,
-                                                domid, nics[i].devid,
-                                                LIBXL_NIC_TYPE_VIF_IOEMU);
-                flexarray_vappend(dm_args,
-                                  "-net",
-                                  GCSPRINTF(
-                                      "nic,vlan=%d,macaddr=%s,model=%s",
-                                      nics[i].devid, smac, nics[i].model),
-                                  "-net",
-                                  GCSPRINTF(
-                                      "tap,vlan=%d,ifname=%s,bridge=%s,"
-                                      "script=%s,downscript=%s",
-                                      nics[i].devid, ifname, nics[i].bridge,
-                                      libxl_tapif_script(gc),
-                                      libxl_tapif_script(gc)),
-                                  NULL);
-                ioemu_nics++;
-            }
-        }
-        /* If we have no emulated nics, tell qemu not to create any */
-        if ( ioemu_nics == 0 ) {
-            flexarray_vappend(dm_args, "-net", "none", NULL);
-        }
-        if (libxl_defbool_val(b_info->u.hvm.gfx_passthru)) {
-            switch (b_info->u.hvm.gfx_passthru_kind) {
-            case LIBXL_GFX_PASSTHRU_KIND_DEFAULT:
-            case LIBXL_GFX_PASSTHRU_KIND_IGD:
-                flexarray_append(dm_args, "-gfx_passthru");
-                break;
-            default:
-                LOGD(ERROR, domid, "unsupported gfx_passthru_kind.");
-                return ERROR_INVAL;
-            }
-        }
-    } else {
-        if (!sdl && !vnc)
-            flexarray_append(dm_args, "-nographic");
-    }
-
-    if (libxl_defbool_val(b_info->dm_restrict)) {
-        LOGD(ERROR, domid,
-             "dm_restrict not supported by qemu-xen-traditional");
-        return ERROR_INVAL;
-    }
-
-    if (state->saved_state) {
-        flexarray_vappend(dm_args, "-loadvm", state->saved_state, NULL);
-    }
-    for (i = 0; b_info->extra && b_info->extra[i] != NULL; i++)
-        flexarray_append(dm_args, b_info->extra[i]);
-    flexarray_append(dm_args, "-M");
-    switch (b_info->type) {
-    case LIBXL_DOMAIN_TYPE_PVH:
-    case LIBXL_DOMAIN_TYPE_PV:
-        flexarray_append(dm_args, "xenpv");
-        for (i = 0; b_info->extra_pv && b_info->extra_pv[i] != NULL; i++)
-            flexarray_append(dm_args, b_info->extra_pv[i]);
-        break;
-    case LIBXL_DOMAIN_TYPE_HVM:
-        flexarray_append(dm_args, "xenfv");
-        for (i = 0; b_info->extra_hvm && b_info->extra_hvm[i] != NULL; i++)
-            flexarray_append(dm_args, b_info->extra_hvm[i]);
-        break;
-    default:
-        abort();
-    }
-    flexarray_append(dm_args, NULL);
-    *args = (char **) flexarray_contents(dm_args);
-    flexarray_append(dm_envs, NULL);
-    if (envs)
-        *envs = (char **) flexarray_contents(dm_envs);
-    return 0;
-}
-
 static char *dm_spice_options(libxl__gc *gc,
                                     const libxl_spice_info *spice)
 {
@@ -2096,11 +1827,6 @@ static int libxl__build_device_model_args(libxl__gc *gc,
  * and therefore will be passing a filename rather than a fd. */
 {
     switch (guest_config->b_info.device_model_version) {
-    case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
-        return libxl__build_device_model_args_old(gc, dm,
-                                                  guest_domid, guest_config,
-                                                  args, envs,
-                                                  state);
     case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
         if (!libxl_defbool_val(guest_config->b_info.device_model_stubdomain)) {
             assert(dm_state_fd != NULL);
@@ -2463,16 +2189,15 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
                         "%s",
                         libxl_bios_type_to_string(guest_config->b_info.u.hvm.bios));
     }
-    /* Disable relocating memory to make the MMIO hole larger
-     * unless we're running qemu-traditional and vNUMA is not
-     * configured. */
+
+    /*
+     * Disable relocating memory, having a larger MMIO hole isn't
+     * implemented with qemu-xen.
+     */
     libxl__xs_printf(gc, XBT_NULL,
                      libxl__sprintf(gc, "%s/hvmloader/allow-memory-relocate",
                                     libxl__xs_get_dompath(gc, guest_domid)),
-                     "%d",
-                     guest_config->b_info.device_model_version
-                        == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL &&
-                     !libxl__vnuma_configured(&guest_config->b_info));
+                     "0");
     ret = xc_domain_set_target(ctx->xch, dm_domid, guest_domid);
     if (ret<0) {
         LOGED(ERROR, guest_domid, "setting target domain %d -> %d",
@@ -3156,13 +2881,9 @@ static void device_model_launch(libxl__egc *egc,
     libxl_domain_config *guest_config = dmss->guest_config;
     const libxl_domain_create_info *c_info = &guest_config->c_info;
     const libxl_domain_build_info *b_info = &guest_config->b_info;
-    const libxl_vnc_info *vnc = libxl__dm_vnc(guest_config);
     char *path;
     int logfile_w, null;
     char **args, **arg, **envs;
-    xs_transaction_t t;
-    char *vm_path;
-    char **pass_stuff;
     int dm_state_fd = -1;
 
     /* convenience aliases */
@@ -3196,26 +2917,19 @@ static void device_model_launch(libxl__egc *egc,
         libxl__xs_printf(gc, XBT_NULL,
                          GCSPRINTF("%s/hvmloader/bios", path),
                          "%s", libxl_bios_type_to_string(b_info->u.hvm.bios));
-        /* Disable relocating memory to make the MMIO hole larger
-         * unless we're running qemu-traditional and vNUMA is not
-         * configured. */
+        /*
+         * Disable relocating memory, having a larger MMIO hole isn't
+         * implemented with qemu-xen.
+         */
         libxl__xs_printf(gc, XBT_NULL,
                          GCSPRINTF("%s/hvmloader/allow-memory-relocate", path),
-                         "%d",
-                         b_info->device_model_version==LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL &&
-                         !libxl__vnuma_configured(b_info));
+                         "0");
         free(path);
     }
 
     path = DEVICE_MODEL_XS_PATH(gc, LIBXL_TOOLSTACK_DOMID, domid, "");
     xs_mkdir(ctx->xsh, XBT_NULL, path);
 
-    if (b_info->type == LIBXL_DOMAIN_TYPE_HVM &&
-        b_info->device_model_version
-        == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL)
-        libxl__xs_printf(gc, XBT_NULL, GCSPRINTF("%s/disable_pf", path),
-                         "%d", !libxl_defbool_val(b_info->u.hvm.xen_platform_pci));
-
     logfile_w = libxl__create_qemu_logfile(gc, GCSPRINTF("qemu-dm-%s",
                                                          c_info->name));
     if (logfile_w < 0) {
@@ -3240,25 +2954,6 @@ static void device_model_launch(libxl__egc *egc,
                          GCSPRINTF("%s/image/device-model-kill-uid", dom_path),
                          "%s", state->dm_kill_uid);
 
-    if (vnc && vnc->passwd) {
-        /* This xenstore key will only be used by qemu-xen-traditionnal.
-         * The code to supply vncpasswd to qemu-xen is later. */
-retry_transaction:
-        /* Find uuid and the write the vnc password to xenstore for qemu. */
-        t = xs_transaction_start(ctx->xsh);
-        vm_path = libxl__xs_read(gc,t,GCSPRINTF("%s/vm", dom_path));
-        if (vm_path) {
-            /* Now write the vncpassword into it. */
-            pass_stuff = libxl__calloc(gc, 3, sizeof(char *));
-            pass_stuff[0] = "vncpasswd";
-            pass_stuff[1] = vnc->passwd;
-            libxl__xs_writev(gc,t,vm_path,pass_stuff);
-            if (!xs_transaction_end(ctx->xsh, t, 0))
-                if (errno == EAGAIN)
-                    goto retry_transaction;
-        }
-    }
-
     LOGD(DEBUG, domid, "Spawning device-model %s with arguments:", dm);
     for (arg = args; *arg; arg++)
         LOGD(DEBUG, domid, "  %s", *arg);
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 94fef37401..4d67b0d282 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -881,7 +881,6 @@ static int libxl__domain_firmware(libxl__gc *gc,
             switch (info->device_model_version)
             {
             case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
-            case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
                 firmware = "hvmloader";
                 break;
             default:
@@ -1212,15 +1211,6 @@ out:
     return rc;
 }
 
-int libxl__qemu_traditional_cmd(libxl__gc *gc, uint32_t domid,
-                                const char *cmd)
-{
-    char *path = NULL;
-    uint32_t dm_domid = libxl_get_stubdom_id(CTX, domid);
-    path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/command");
-    return libxl__xs_printf(gc, XBT_NULL, path, "%s", cmd);
-}
-
 /*==================== Miscellaneous ====================*/
 
 char *libxl__uuid2string(libxl__gc *gc, const libxl_uuid uuid)
diff --git a/tools/libs/light/libxl_dom_save.c b/tools/libs/light/libxl_dom_save.c
index 32e3cb5a13..d64fd64f2e 100644
--- a/tools/libs/light/libxl_dom_save.c
+++ b/tools/libs/light/libxl_dom_save.c
@@ -28,19 +28,6 @@ static void domain_save_done(libxl__egc *egc,
 
 /*----- complicated callback, called by xc_domain_save -----*/
 
-/*
- * We implement the other end of protocol for controlling qemu-dm's
- * logdirty.  There is no documentation for this protocol, but our
- * counterparty's implementation is in
- * qemu-xen-traditional.git:xenstore.c in the function
- * xenstore_process_logdirty_event
- */
-
-static void domain_suspend_switch_qemu_xen_traditional_logdirty
-                               (libxl__egc *egc, int domid, unsigned enable,
-                                libxl__logdirty_switch *lds);
-static void switch_logdirty_xswatch(libxl__egc *egc, libxl__ev_xswatch*,
-                            const char *watch_path, const char *event_path);
 static void domain_suspend_switch_qemu_xen_logdirty
                                (libxl__egc *egc, int domid, unsigned enable,
                                 libxl__logdirty_switch *lds);
@@ -69,10 +56,6 @@ void libxl__domain_common_switch_qemu_logdirty(libxl__egc *egc,
     STATE_AO_GC(lds->ao);
 
     switch (libxl__device_model_version_running(gc, domid)) {
-    case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
-        domain_suspend_switch_qemu_xen_traditional_logdirty(egc, domid, enable,
-                                                            lds);
-        break;
     case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
         domain_suspend_switch_qemu_xen_logdirty(egc, domid, enable, lds);
         break;
@@ -83,129 +66,6 @@ void libxl__domain_common_switch_qemu_logdirty(libxl__egc *egc,
     }
 }
 
-static void domain_suspend_switch_qemu_xen_traditional_logdirty
-                               (libxl__egc *egc, int domid, unsigned enable,
-                                libxl__logdirty_switch *lds)
-{
-    STATE_AO_GC(lds->ao);
-    int rc;
-    xs_transaction_t t = 0;
-    const char *got;
-
-    if (!lds->cmd_path) {
-        uint32_t dm_domid = libxl_get_stubdom_id(CTX, domid);
-        lds->cmd_path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid,
-                                             "/logdirty/cmd");
-        lds->ret_path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid,
-                                             "/logdirty/ret");
-    }
-    lds->cmd = enable ? "enable" : "disable";
-
-    rc = libxl__ev_xswatch_register(gc, &lds->watch,
-                                switch_logdirty_xswatch, lds->ret_path);
-    if (rc) goto out;
-
-    rc = libxl__ev_time_register_rel(ao, &lds->timeout,
-                                switch_logdirty_timeout, 10*1000);
-    if (rc) goto out;
-
-    for (;;) {
-        rc = libxl__xs_transaction_start(gc, &t);
-        if (rc) goto out;
-
-        rc = libxl__xs_read_checked(gc, t, lds->cmd_path, &got);
-        if (rc) goto out;
-
-        if (got) {
-            const char *got_ret;
-            rc = libxl__xs_read_checked(gc, t, lds->ret_path, &got_ret);
-            if (rc) goto out;
-
-            if (!got_ret || strcmp(got, got_ret)) {
-                LOGD(ERROR, domid, "controlling logdirty: qemu was already sent"
-                     " command `%s' (xenstore path `%s') but result is `%s'",
-                     got, lds->cmd_path, got_ret ? got_ret : "<none>");
-                rc = ERROR_FAIL;
-                goto out;
-            }
-            rc = libxl__xs_rm_checked(gc, t, lds->cmd_path);
-            if (rc) goto out;
-        }
-
-        rc = libxl__xs_rm_checked(gc, t, lds->ret_path);
-        if (rc) goto out;
-
-        rc = libxl__xs_write_checked(gc, t, lds->cmd_path, lds->cmd);
-        if (rc) goto out;
-
-        rc = libxl__xs_transaction_commit(gc, &t);
-        if (!rc) break;
-        if (rc<0) goto out;
-    }
-
-    /* OK, wait for some callback */
-    return;
-
- out:
-    LOGD(ERROR, domid, "logdirty switch failed (rc=%d), abandoning suspend",rc);
-    libxl__xs_transaction_abort(gc, &t);
-    switch_logdirty_done(egc,lds,rc);
-}
-
-static void switch_logdirty_xswatch(libxl__egc *egc, libxl__ev_xswatch *watch,
-                            const char *watch_path, const char *event_path)
-{
-    libxl__logdirty_switch *lds = CONTAINER_OF(watch, *lds, watch);
-    STATE_AO_GC(lds->ao);
-    const char *got;
-    xs_transaction_t t = 0;
-    int rc;
-
-    for (;;) {
-        rc = libxl__xs_transaction_start(gc, &t);
-        if (rc) goto out;
-
-        rc = libxl__xs_read_checked(gc, t, lds->ret_path, &got);
-        if (rc) goto out;
-
-        if (!got) {
-            rc = +1;
-            goto out;
-        }
-
-        if (strcmp(got, lds->cmd)) {
-            LOG(ERROR,"logdirty switch: sent command `%s' but got reply `%s'"
-                " (xenstore paths `%s' / `%s')", lds->cmd, got,
-                lds->cmd_path, lds->ret_path);
-            rc = ERROR_FAIL;
-            goto out;
-        }
-
-        rc = libxl__xs_rm_checked(gc, t, lds->cmd_path);
-        if (rc) goto out;
-
-        rc = libxl__xs_rm_checked(gc, t, lds->ret_path);
-        if (rc) goto out;
-
-        rc = libxl__xs_transaction_commit(gc, &t);
-        if (!rc) break;
-        if (rc<0) goto out;
-    }
-
- out:
-    /* rc < 0: error
-     * rc == 0: ok, we are done
-     * rc == +1: need to keep waiting
-     */
-    libxl__xs_transaction_abort(gc, &t);
-
-    if (rc <= 0) {
-        if (rc < 0)
-            LOG(ERROR,"logdirty switch: failed (rc=%d)",rc);
-        switch_logdirty_done(egc,lds,rc);
-    }
-}
-
 static void domain_suspend_switch_qemu_xen_logdirty
                                (libxl__egc *egc, int domid, unsigned enable,
                                 libxl__logdirty_switch *lds)
diff --git a/tools/libs/light/libxl_dom_suspend.c b/tools/libs/light/libxl_dom_suspend.c
index 6091a5f3f6..f0a74fc82c 100644
--- a/tools/libs/light/libxl_dom_suspend.c
+++ b/tools/libs/light/libxl_dom_suspend.c
@@ -85,15 +85,8 @@ void libxl__domain_suspend_device_model(libxl__egc *egc,
     STATE_AO_GC(dsps->ao);
     int rc = 0;
     uint32_t const domid = dsps->domid;
-    const char *const filename = dsps->dm_savefile;
 
     switch (libxl__device_model_version_running(gc, domid)) {
-    case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL: {
-        LOGD(DEBUG, domid, "Saving device model state to %s", filename);
-        libxl__qemu_traditional_cmd(gc, domid, "save");
-        libxl__wait_for_device_model_deprecated(gc, domid, "paused", NULL, NULL, NULL);
-        break;
-    }
     case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
         /* calls dsps->callback_device_model_done when done */
         libxl__qmp_suspend_save(egc, dsps); /* must be last */
@@ -420,21 +413,7 @@ static void domain_suspend_callback_common_done(libxl__egc *egc,
 
 int libxl__domain_resume_device_model_deprecated(libxl__gc *gc, uint32_t domid)
 {
-    const char *path, *state;
-
     switch (libxl__device_model_version_running(gc, domid)) {
-    case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL: {
-        uint32_t dm_domid = libxl_get_stubdom_id(CTX, domid);
-
-        path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/state");
-        state = libxl__xs_read(gc, XBT_NULL, path);
-        if (state != NULL && !strcmp(state, "paused")) {
-            libxl__qemu_traditional_cmd(gc, domid, "continue");
-            libxl__wait_for_device_model_deprecated(gc, domid, "running",
-                                                    NULL, NULL, NULL);
-        }
-        break;
-    }
     case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
         if (libxl__qmp_resume(gc, domid))
             return ERROR_FAIL;
@@ -493,8 +472,6 @@ static void dm_resume_dispose(libxl__gc *gc,
     libxl__ev_xswatch_deregister(gc, &dmrs->watch);
 }
 
-static void dm_resume_xswatch_cb(libxl__egc *egc,
-    libxl__ev_xswatch *, const char *watch_path, const char *);
 static void dm_resume_qmp_done(libxl__egc *egc,
     libxl__ev_qmp *qmp, const libxl__json_object *, int rc);
 static void dm_resume_timeout(libxl__egc *egc,
@@ -521,27 +498,6 @@ void libxl__dm_resume(libxl__egc *egc,
     if (rc) goto out;
 
     switch (libxl__device_model_version_running(gc, domid)) {
-    case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL: {
-        uint32_t dm_domid = libxl_get_stubdom_id(CTX, domid);
-        const char *path, *state;
-
-        path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/state");
-        rc = libxl__xs_read_checked(gc, XBT_NULL, path, &state);
-        if (rc) goto out;
-        if (!state || strcmp(state, "paused")) {
-            /* already running */
-            rc = 0;
-            goto out;
-        }
-
-        rc = libxl__qemu_traditional_cmd(gc, domid, "continue");
-        if (rc) goto out;
-        rc = libxl__ev_xswatch_register(gc, &dmrs->watch,
-                                        dm_resume_xswatch_cb,
-                                        path);
-        if (rc) goto out;
-        break;
-    }
     case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
         qmp->ao = dmrs->ao;
         qmp->domid = domid;
@@ -561,27 +517,6 @@ out:
     dm_resume_done(egc, dmrs, rc);
 }
 
-static void dm_resume_xswatch_cb(libxl__egc *egc,
-                                 libxl__ev_xswatch *xsw,
-                                 const char *watch_path,
-                                 const char *event_path)
-{
-    EGC_GC;
-    libxl__dm_resume_state *dmrs = CONTAINER_OF(xsw, *dmrs, watch);
-    int rc;
-    const char *value;
-
-    rc = libxl__xs_read_checked(gc, XBT_NULL, watch_path, &value);
-    if (rc) goto out;
-
-    if (!value || strcmp(value, "running"))
-        return;
-
-    rc = 0;
-out:
-    dm_resume_done(egc, dmrs, rc);
-}
-
 static void dm_resume_qmp_done(libxl__egc *egc,
                                libxl__ev_qmp *qmp,
                                const libxl__json_object *response,
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 6751fc785f..dd2e5e9a19 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -1877,8 +1877,6 @@ int libxl_set_vcpuonline(libxl_ctx *ctx, uint32_t domid,
     switch (libxl__domain_type(gc, domid)) {
     case LIBXL_DOMAIN_TYPE_HVM:
         switch (libxl__device_model_version_running(gc, domid)) {
-        case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
-            break;
         case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
             rc = libxl__ev_time_register_rel(ao, &svos->timeout,
                                              set_vcpuonline_timeout,
@@ -2116,7 +2114,6 @@ static void domain_s3_resume(libxl__ao *ao, libxl__egc *egc, int domid)
     AO_GC;
     libxl__ev_qmp *qmp;
     int rc = 0;
-    int r;
 
     GCNEW(qmp);
     libxl__ev_qmp_init(qmp);
@@ -2128,14 +2125,6 @@ static void domain_s3_resume(libxl__ao *ao, libxl__egc *egc, int domid)
     switch (libxl__domain_type(gc, domid)) {
     case LIBXL_DOMAIN_TYPE_HVM:
         switch (libxl__device_model_version_running(gc, domid)) {
-        case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
-            r = xc_hvm_param_set(CTX->xch, domid, HVM_PARAM_ACPI_S_STATE, 0);
-            if (r) {
-                LOGED(ERROR, domid, "Send trigger '%s' failed",
-                      libxl_trigger_to_string(LIBXL_TRIGGER_S3RESUME));
-                rc = ERROR_FAIL;
-            }
-            break;
         case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
             rc = libxl__ev_qmp_send(egc, qmp, "system_wakeup", NULL);
             if (rc) goto out;
@@ -2481,10 +2470,6 @@ static void retrieve_domain_configuration_end(libxl__egc *egc,
             case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
                 libxl_bitmap_copy(CTX, map, &rdcs->qemuu_cpus);
                 break;
-            case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
-                rc = libxl__update_avail_vcpus_xenstore(gc, domid,
-                                                        max_vcpus, map);
-                break;
             default:
                 abort();
             }
diff --git a/tools/libs/light/libxl_exec.c b/tools/libs/light/libxl_exec.c
index a8b949b193..7a59c050b2 100644
--- a/tools/libs/light/libxl_exec.c
+++ b/tools/libs/light/libxl_exec.c
@@ -157,81 +157,6 @@ out:
     return rc ? SIGTERM : 0;
 }
 
-int libxl__xenstore_child_wait_deprecated(libxl__gc *gc,
-                                 uint32_t domid,
-                                 uint32_t timeout, char *what,
-                                 char *path, char *state,
-                                 libxl__spawn_starting *spawning,
-                                 int (*check_callback)(libxl__gc *gc,
-                                                       uint32_t domid,
-                                                       const char *state,
-                                                       void *userdata),
-                                 void *check_callback_userdata)
-{
-    char *p;
-    unsigned int len;
-    int rc = 0;
-    struct xs_handle *xsh;
-    int nfds;
-    fd_set rfds;
-    struct timeval tv;
-    unsigned int num;
-    char **l = NULL;
-
-    xsh = xs_open(0);
-    if (xsh == NULL) {
-        LOG(ERROR, "Unable to open xenstore connection");
-        goto err;
-    }
-
-    xs_watch(xsh, path, path);
-    tv.tv_sec = timeout;
-    tv.tv_usec = 0;
-    nfds = xs_fileno(xsh) + 1;
-    assert(!spawning);
-
-    while (rc > 0 || (!rc && tv.tv_sec > 0)) {
-        p = xs_read(xsh, XBT_NULL, path, &len);
-        if ( NULL == p )
-            goto again;
-
-        if ( NULL != state && strcmp(p, state) )
-            goto again;
-
-        if ( NULL != check_callback ) {
-            rc = (*check_callback)(gc, domid, p, check_callback_userdata);
-            if ( rc > 0 )
-                goto again;
-        }
-
-        free(p);
-        xs_unwatch(xsh, path, path);
-        xs_close(xsh);
-        return rc;
-again:
-        free(p);
-        FD_ZERO(&rfds);
-        FD_SET(xs_fileno(xsh), &rfds);
-        rc = select(nfds, &rfds, NULL, NULL, &tv);
-        if (rc > 0) {
-            if (FD_ISSET(xs_fileno(xsh), &rfds)) {
-                l = xs_read_watch(xsh, &num);
-                if (l != NULL)
-                    free(l);
-                else
-                    goto again;
-            }
-        }
-    }
-    LOG(ERROR, "%s not ready", what);
-
-    xs_unwatch(xsh, path, path);
-    xs_close(xsh);
-err:
-    return -1;
-}
-
-
 /*----- spawn implementation -----*/
 
 /*
diff --git a/tools/libs/light/libxl_internal.c b/tools/libs/light/libxl_internal.c
index c95624933f..2941ca0bbd 100644
--- a/tools/libs/light/libxl_internal.c
+++ b/tools/libs/light/libxl_internal.c
@@ -387,11 +387,9 @@ int libxl__device_model_version_running(libxl__gc *gc, uint32_t domid)
     path = libxl__xs_libxl_path(gc, domid);
     path = GCSPRINTF("%s/dm-version", path);
     dm_version = libxl__xs_read(gc, XBT_NULL, path);
-    if (!dm_version) {
-        return LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL;
-    }
 
-    if (libxl_device_model_version_from_string(dm_version, &value) < 0) {
+    if (!dm_version ||
+        libxl_device_model_version_from_string(dm_version, &value) < 0) {
         LOGD(ERROR, domid, "fatal: %s contain a wrong value (%s)", path, dm_version);
         return -1;
     }
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 408a771310..75bb0b94cf 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -1423,8 +1423,6 @@ _hidden int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
               libxl_domain_config *d_config,
               libxl__domain_build_state *state);
 
-_hidden int libxl__qemu_traditional_cmd(libxl__gc *gc, uint32_t domid,
-                                        const char *cmd);
 _hidden int libxl__domain_rename(libxl__gc *gc, uint32_t domid,
                                  const char *old_name, const char *new_name,
                                  xs_transaction_t trans);
@@ -1914,50 +1912,6 @@ static inline int libxl__spawn_inuse(const libxl__spawn_state *ss)
 _hidden int libxl__spawn_record_pid(libxl__gc*, libxl__spawn_state*,
                                     pid_t innerchild);
 
-/*
- * libxl__xenstore_child_wait_deprecated - Wait for daemonic child IPC
- *
- * This is a NOT function for waiting for ordinary child processes.
- * If you want to run (fork/exec/wait) subprocesses from libxl:
- *  - Make your libxl entrypoint use the ao machinery
- *  - Use libxl__ev_child_fork, and use the callback programming style
- *
- * This function is intended for interprocess communication with a
- * service process.  If the service process does not respond quickly,
- * the whole caller may be blocked.  Therefore this function is
- * deprecated.  This function is currently used only by
- * libxl__wait_for_device_model_deprecated.
- *
- * gc: allocation pool
- * domid: guest to work with
- * timeout: how many seconds to wait for the state to appear
- * what: string describing the spawned process
- * path: path to the state file in xenstore
- * state: expected string to wait for in path (optional)
- * spawning: malloc'd pointer to libxl__spawn_starting (optional)
- * check_callback: (optional)
- * check_callback_userdata: data to pass to the callback function
- *
- * Returns 0 on success, and < 0 on error.
- *
- * This function waits the given timeout for the given path to appear
- * in xenstore, and optionally for state in path.
- * If path appears and state matches, check_callback is called.
- * If check_callback returns > 0, waiting for path or state continues.
- * Otherwise libxl__xenstore_child_wait_deprecated returns.
- */
-_hidden int libxl__xenstore_child_wait_deprecated(libxl__gc *gc,
-                                 uint32_t domid,
-                                 uint32_t timeout, char *what,
-                                 char *path, char *state,
-                                 libxl__spawn_starting *spawning,
-                                 int (*check_callback)(libxl__gc *gc,
-                                                       uint32_t domid,
-                                                       const char *state,
-                                                       void *userdata),
-                                 void *check_callback_userdata);
-
-
  /* low-level stuff, for synchronous subprocesses etc. */
 
 /*
@@ -2022,25 +1976,6 @@ _hidden int libxl__domain_device_construct_rdm(libxl__gc *gc,
                                    uint64_t rdm_mem_guard,
                                    struct xc_dom_image *dom);
 
-/*
- * This function will cause the whole libxl process to hang
- * if the device model does not respond.  It is deprecated.
- *
- * Instead of calling this function:
- *  - Make your libxl entrypoint use the ao machinery
- *  - Use libxl__ev_xswatch_register, and use the callback programming
- *    style
- */
-_hidden int libxl__wait_for_device_model_deprecated(libxl__gc *gc,
-                                uint32_t domid, char *state,
-                                libxl__spawn_starting *spawning
-                                                    /* NULL allowed */,
-                                int (*check_callback)(libxl__gc *gc,
-                                                      uint32_t domid,
-                                                      const char *state,
-                                                      void *userdata),
-                                void *check_callback_userdata);
-
 _hidden const libxl_vnc_info *libxl__dm_vnc(const libxl_domain_config *g_cfg);
 
 _hidden char *libxl__abs_path(libxl__gc *gc, const char *s, const char *path);
@@ -2315,8 +2250,7 @@ _hidden char *libxl__json_object_to_json(libxl__gc *gc,
 #define JSON(o) \
     (libxl__json_object_to_json(gc, (o)) ? : "<invalid-json-object>")
 
-  /* Based on /local/domain/$domid/dm-version xenstore key
-   * default is qemu xen traditional */
+  /* Based on /local/domain/$domid/dm-version xenstore key */
 _hidden int libxl__device_model_version_running(libxl__gc *gc, uint32_t domid);
 
 static inline
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index a8460fb3ec..2ea2caeb66 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1023,82 +1023,6 @@ static int pci_multifunction_check(libxl__gc *gc, libxl_device_pci *pci, unsigne
     return 0;
 }
 
-static int pci_ins_check(libxl__gc *gc, uint32_t domid, const char *state, void *priv)
-{
-    char *orig_state = priv;
-
-    if ( !strcmp(state, "pci-insert-failed") )
-        return -1;
-    if ( !strcmp(state, "pci-inserted") )
-        return 0;
-    if ( !strcmp(state, orig_state) )
-        return 1;
-
-    return 1;
-}
-
-static int qemu_pci_add_xenstore(libxl__gc *gc, uint32_t domid,
-                                 libxl_device_pci *pci)
-{
-    libxl_ctx *ctx = libxl__gc_owner(gc);
-    int rc = 0;
-    char *path;
-    char *state, *vdevfn;
-    uint32_t dm_domid;
-
-    dm_domid = libxl_get_stubdom_id(CTX, domid);
-    path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/state");
-    state = libxl__xs_read(gc, XBT_NULL, path);
-    path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/parameter");
-    if (pci->vdevfn) {
-        libxl__xs_printf(gc, XBT_NULL, path, PCI_BDF_VDEVFN","PCI_OPTIONS,
-                         pci->domain, pci->bus, pci->dev,
-                         pci->func, pci->vdevfn, pci->msitranslate,
-                         pci->power_mgmt);
-    } else {
-        libxl__xs_printf(gc, XBT_NULL, path, PCI_BDF","PCI_OPTIONS,
-                         pci->domain,  pci->bus, pci->dev,
-                         pci->func, pci->msitranslate, pci->power_mgmt);
-    }
-
-    libxl__qemu_traditional_cmd(gc, domid, "pci-ins");
-    rc = libxl__wait_for_device_model_deprecated(gc, domid, NULL, NULL,
-                                      pci_ins_check, state);
-    path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/parameter");
-    vdevfn = libxl__xs_read(gc, XBT_NULL, path);
-    path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/state");
-    if ( rc < 0 )
-        LOGD(ERROR, domid, "qemu refused to add device: %s", vdevfn);
-    else if ( sscanf(vdevfn, "0x%x", &pci->vdevfn) != 1 ) {
-        LOGD(ERROR, domid, "wrong format for the vdevfn: '%s'", vdevfn);
-        rc = -1;
-    }
-    xs_write(ctx->xsh, XBT_NULL, path, state, strlen(state));
-
-    return rc;
-}
-
-static int check_qemu_running(libxl__gc *gc,
-                              libxl_domid domid,
-                              libxl__xswait_state *xswa,
-                              int rc,
-                              const char *state)
-{
-    if (rc) {
-        if (rc == ERROR_TIMEDOUT) {
-            LOGD(ERROR, domid, "%s not ready", xswa->what);
-        }
-        goto out;
-    }
-
-    if (!state || strcmp(state, "running"))
-        return ERROR_NOT_READY;
-
-out:
-    libxl__xswait_stop(gc, xswa);
-    return rc;
-}
-
 typedef struct pci_add_state {
     /* filled by user of do_pci_add */
     libxl__ao_device *aodev;
@@ -1119,8 +1043,6 @@ typedef struct pci_add_state {
     int retries;
 } pci_add_state;
 
-static void pci_add_qemu_trad_watch_state_cb(libxl__egc *egc,
-    libxl__xswait_state *xswa, int rc, const char *state);
 static void pci_add_qmp_device_add(libxl__egc *, pci_add_state *);
 static void pci_add_qmp_device_add_cb(libxl__egc *,
     libxl__ev_qmp *, const libxl__json_object *, int rc);
@@ -1156,16 +1078,6 @@ static void do_pci_add(libxl__egc *egc,
 
     if (type == LIBXL_DOMAIN_TYPE_HVM) {
         switch (libxl__device_model_version_running(gc, domid)) {
-            case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
-                pas->xswait.ao = ao;
-                pas->xswait.what = "Device Model";
-                pas->xswait.path = DEVICE_MODEL_XS_PATH(gc,
-                    libxl_get_stubdom_id(CTX, domid), domid, "/state");
-                pas->xswait.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
-                pas->xswait.callback = pci_add_qemu_trad_watch_state_cb;
-                rc = libxl__xswait_start(gc, &pas->xswait);
-                if (rc) goto out;
-                return;
             case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
                 rc = libxl__ev_time_register_rel(ao, &pas->timeout,
                                                  pci_add_timeout,
@@ -1186,29 +1098,6 @@ out:
     pci_add_dm_done(egc, pas, rc); /* must be last */
 }
 
-static void pci_add_qemu_trad_watch_state_cb(libxl__egc *egc,
-                                             libxl__xswait_state *xswa,
-                                             int rc,
-                                             const char *state)
-{
-    pci_add_state *pas = CONTAINER_OF(xswa, *pas, xswait);
-    STATE_AO_GC(pas->aodev->ao);
-
-    /* Convenience aliases */
-    libxl_domid domid = pas->domid;
-    libxl_device_pci *pci = &pas->pci;
-
-    rc = check_qemu_running(gc, domid, xswa, rc, state);
-    if (rc == ERROR_NOT_READY)
-        return;
-    if (rc)
-        goto out;
-
-    rc = qemu_pci_add_xenstore(gc, domid, pci);
-out:
-    pci_add_dm_done(egc, pas, rc); /* must be last */
-}
-
 static void pci_add_qmp_device_add(libxl__egc *egc, pci_add_state *pas)
 {
     STATE_AO_GC(pas->aodev->ao);
@@ -1882,42 +1771,6 @@ static void add_pcis_done(libxl__egc *egc, libxl__multidev *multidev,
     aodev->callback(egc, aodev);
 }
 
-static int qemu_pci_remove_xenstore(libxl__gc *gc, uint32_t domid,
-                                    libxl_device_pci *pci, int force)
-{
-    libxl_ctx *ctx = libxl__gc_owner(gc);
-    char *state;
-    char *path;
-    uint32_t dm_domid;
-
-    dm_domid = libxl_get_stubdom_id(CTX, domid);
-
-    path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/state");
-    state = libxl__xs_read(gc, XBT_NULL, path);
-    path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/parameter");
-    libxl__xs_printf(gc, XBT_NULL, path, PCI_BDF, pci->domain,
-                     pci->bus, pci->dev, pci->func);
-
-    /* Remove all functions at once atomically by only signalling
-     * device-model for function 0 */
-    if ( !force && (pci->vdevfn & 0x7) == 0 ) {
-        libxl__qemu_traditional_cmd(gc, domid, "pci-rem");
-        if (libxl__wait_for_device_model_deprecated(gc, domid, "pci-removed",
-                                         NULL, NULL, NULL) < 0) {
-            LOGD(ERROR, domid, "Device Model didn't respond in time");
-            /* This depends on guest operating system acknowledging the
-             * SCI, if it doesn't respond in time then we may wish to
-             * force the removal.
-             */
-            return ERROR_FAIL;
-        }
-    }
-    path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/state");
-    xs_write(ctx->xsh, XBT_NULL, path, state, strlen(state));
-
-    return 0;
-}
-
 typedef struct pci_remove_state {
     libxl__ao_device *aodev;
     libxl_domid domid;
@@ -1940,8 +1793,6 @@ static void libxl__device_pci_remove_common(libxl__egc *egc,
 static void device_pci_remove_common_next(libxl__egc *egc,
     pci_remove_state *prs, int rc);
 
-static void pci_remove_qemu_trad_watch_state_cb(libxl__egc *egc,
-    libxl__xswait_state *xswa, int rc, const char *state);
 static void pci_remove_qmp_device_del(libxl__egc *egc,
     pci_remove_state *prs);
 static void pci_remove_qmp_device_del_cb(libxl__egc *egc,
@@ -1987,16 +1838,6 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
     if (type == LIBXL_DOMAIN_TYPE_HVM) {
         prs->hvm = true;
         switch (libxl__device_model_version_running(gc, domid)) {
-        case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
-            prs->xswait.ao = ao;
-            prs->xswait.what = "Device Model";
-            prs->xswait.path = DEVICE_MODEL_XS_PATH(gc,
-                libxl_get_stubdom_id(CTX, domid), domid, "/state");
-            prs->xswait.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
-            prs->xswait.callback = pci_remove_qemu_trad_watch_state_cb;
-            rc = libxl__xswait_start(gc, &prs->xswait);
-            if (rc) goto out_fail;
-            return;
         case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
             pci_remove_qmp_device_del(egc, prs); /* must be last */
             return;
@@ -2010,30 +1851,6 @@ out_fail:
     pci_remove_detached(egc, prs, rc); /* must be last */
 }
 
-static void pci_remove_qemu_trad_watch_state_cb(libxl__egc *egc,
-                                                libxl__xswait_state *xswa,
-                                                int rc,
-                                                const char *state)
-{
-    pci_remove_state *prs = CONTAINER_OF(xswa, *prs, xswait);
-    STATE_AO_GC(prs->aodev->ao);
-
-    /* Convenience aliases */
-    libxl_domid domid = prs->domid;
-    libxl_device_pci *const pci = &prs->pci;
-
-    rc = check_qemu_running(gc, domid, xswa, rc, state);
-    if (rc == ERROR_NOT_READY)
-        return;
-    if (rc)
-        goto out;
-
-    rc = qemu_pci_remove_xenstore(gc, domid, pci, prs->force);
-
-out:
-    pci_remove_detached(egc, prs, rc);
-}
-
 static void pci_remove_qmp_device_del(libxl__egc *egc,
                                       pci_remove_state *prs)
 {
diff --git a/tools/libs/light/libxl_sr_stream_format.h b/tools/libs/light/libxl_sr_stream_format.h
index 75f5190886..f8f4723c2e 100644
--- a/tools/libs/light/libxl_sr_stream_format.h
+++ b/tools/libs/light/libxl_sr_stream_format.h
@@ -45,7 +45,7 @@ typedef struct libxl__sr_emulator_hdr
 } libxl__sr_emulator_hdr;
 
 #define EMULATOR_UNKNOWN             0x00000000U
-#define EMULATOR_QEMU_TRADITIONAL    0x00000001U
+#define EMULATOR_QEMU_TRADITIONAL    0x00000001U /* Dropped in Xen 4.21 */
 #define EMULATOR_QEMU_UPSTREAM       0x00000002U
 
 typedef struct libxl_sr_checkpoint_state
diff --git a/tools/libs/light/libxl_stream_write.c b/tools/libs/light/libxl_stream_write.c
index 634f3240d1..98d44597a7 100644
--- a/tools/libs/light/libxl_stream_write.c
+++ b/tools/libs/light/libxl_stream_write.c
@@ -252,10 +252,6 @@ void libxl__stream_write_start(libxl__egc *egc,
         stream->device_model_version =
             libxl__device_model_version_running(gc, dss->domid);
         switch (stream->device_model_version) {
-        case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
-            stream->emu_sub_hdr.id = EMULATOR_QEMU_TRADITIONAL;
-            break;
-
         case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
             stream->emu_sub_hdr.id = EMULATOR_QEMU_UPSTREAM;
             break;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 9bb2969931..1985153830 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -104,7 +104,7 @@ libxl_channel_connection = Enumeration("channel_connection", [
 
 libxl_device_model_version = Enumeration("device_model_version", [
     (0, "UNKNOWN"),
-    (1, "QEMU_XEN_TRADITIONAL"), # Historical qemu-xen device model (qemu-dm)
+    (1, "QEMU_XEN_TRADITIONAL"), # Historical dm (qemu-dm, no longer supported)
     (2, "QEMU_XEN"),             # Upstream based qemu-xen device model
     ])
 
diff --git a/tools/python/xen/migration/libxl.py b/tools/python/xen/migration/libxl.py
index 5dcb50fe02..dc5c7ac355 100644
--- a/tools/python/xen/migration/libxl.py
+++ b/tools/python/xen/migration/libxl.py
@@ -51,12 +51,10 @@ rec_type_to_str = {
 EMULATOR_HEADER_FORMAT = "II"
 
 EMULATOR_ID_unknown       = 0x00000000
-EMULATOR_ID_qemu_trad     = 0x00000001
 EMULATOR_ID_qemu_upstream = 0x00000002
 
 emulator_id_to_str = {
     EMULATOR_ID_unknown       : "Unknown",
-    EMULATOR_ID_qemu_trad     : "Qemu Traditional",
     EMULATOR_ID_qemu_upstream : "Qemu Upstream",
 }
 
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 089a88935a..219e924779 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2733,10 +2733,7 @@ skip_usbdev:
     xlu_cfg_replace_string (config, "device_model_override",
                             &b_info->device_model, 0);
     if (!xlu_cfg_get_string (config, "device_model_version", &buf, 0)) {
-        if (!strcmp(buf, "qemu-xen-traditional")) {
-            b_info->device_model_version
-                = LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL;
-        } else if (!strcmp(buf, "qemu-xen")) {
+        if (!strcmp(buf, "qemu-xen")) {
             b_info->device_model_version
                 = LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN;
         } else {
-- 
2.43.0


