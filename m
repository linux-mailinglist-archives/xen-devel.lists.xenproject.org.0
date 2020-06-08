Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF3A1F1CC7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:03:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKFN-0005ei-Ns; Mon, 08 Jun 2020 16:03:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKFL-0005ck-UF
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:03:35 +0000
X-Inumbo-ID: 9a4e1aca-a9a1-11ea-b292-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9a4e1aca-a9a1-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nCf98bap8NX9iIcnvvB/aw+3vfPbNUjO6+kAZbeXlU0=;
 b=d5KjMTUhcHEiL6BJl+25Mv6e0YIgG9agYY3MiFWXb8+5afPATdd25Tmg/F2UKuCQID6WMn
 bHLpWoi2Ndr4+loI2CvXgsO+s8Pi7SWuTaxET0zxNB22gO41PSjIarJtMzDACCQfhbBONl
 Hc4gERqvw7xxkpw/yJxj3RBxlbFP0xU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-IO7TwgdLMz-6SSxBpSkpZg-1; Mon, 08 Jun 2020 12:03:31 -0400
X-MC-Unique: IO7TwgdLMz-6SSxBpSkpZg-1
Received: by mail-wm1-f72.google.com with SMTP id k185so4120wme.8
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nCf98bap8NX9iIcnvvB/aw+3vfPbNUjO6+kAZbeXlU0=;
 b=heGqT1u2kmdbE0xorftnZS8vk9Qk2urwARD77ZJhO85873rln3h5n8mkIRDznWC0Fn
 w2lWcL2fVL5clcxwQ7j0VlYWoVdCq8+cYrVKJTsBaOYTymUasSWD7ccf2A3efNKN+fG/
 jV5EQIIX7vt8Z+bcugF5DuPPiocbuvC4b4vUay7b0vZgCbueaRMCwOsG3AhXsHV5tvHm
 0aMZInB2xY4RDRuVadtcl+AT6ehDIW0U+4/SceKKcEXB6c6d9OsIylko8V6QzS5OXga3
 oRvh/tBZm3SgoNe8+fCsFXIJ7oiOrVaVhWw62na1RHYKEqfw7Ou2S+bcYhyHl07DoK/P
 R8QA==
X-Gm-Message-State: AOAM532pUu/Xv//w6p/aFncUnFMLGvpG5ZmhBn9d7WCKpH8IAl2Rpj3e
 E28stn4mzIrMBXhgxovwiqULiggcIeEUSi0bdWs4pVx0NqR/mucPEXS/zaV9pRIIm8legHbRJWC
 OVMrt0dBTe5fgvSfVntp9D33bm/s=
X-Received: by 2002:adf:a41a:: with SMTP id d26mr25031326wra.324.1591632210360; 
 Mon, 08 Jun 2020 09:03:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnZLr9C0tJY5bkNMLswKxTqLiEkka8PUdpib6I0kPKfuiid5c8nSc5Z6uKzVsdfUes5d8k3w==
X-Received: by 2002:adf:a41a:: with SMTP id d26mr25031279wra.324.1591632210107; 
 Mon, 08 Jun 2020 09:03:30 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id n204sm42276wma.5.2020.06.08.09.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 28/35] hw/ppc/ppc4xx: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:37 +0200
Message-Id: <20200608160044.15531-29-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ppc/ppc405_boards.c |  5 +++++
 hw/ppc/ppc405_uc.c     | 21 +++++++++++++++++++++
 hw/ppc/ppc4xx_devs.c   |  7 +++++++
 3 files changed, 33 insertions(+)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 6198ec1035..eb1216b5f0 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -41,6 +41,7 @@
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
 #include "qemu/cutils.h"
+#include "hw/qdev-deprecated.h"
 
 #define BIOS_FILENAME "ppc405_rom.bin"
 #define BIOS_SIZE (2 * MiB)
@@ -129,6 +130,8 @@ static void ref405ep_fpga_init(MemoryRegion *sysmem, uint32_t base)
     ref405ep_fpga_t *fpga;
     MemoryRegion *fpga_memory = g_new(MemoryRegion, 1);
 
+    qdev_warn_deprecated_function_used();
+
     fpga = g_malloc0(sizeof(ref405ep_fpga_t));
     memory_region_init_io(fpga_memory, NULL, &ref405ep_fpga_ops, fpga,
                           "fpga", 0x00000100);
@@ -408,6 +411,8 @@ static void taihu_cpld_init(MemoryRegion *sysmem, uint32_t base)
     taihu_cpld_t *cpld;
     MemoryRegion *cpld_memory = g_new(MemoryRegion, 1);
 
+    qdev_warn_deprecated_function_used();
+
     cpld = g_malloc0(sizeof(taihu_cpld_t));
     memory_region_init_io(cpld_memory, NULL, &taihu_cpld_ops, cpld, "cpld", 0x100);
     memory_region_add_subregion(sysmem, base, cpld_memory);
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 381720aced..160604c62e 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -36,6 +36,7 @@
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG_OPBA
 //#define DEBUG_SDRAM
@@ -182,6 +183,8 @@ void ppc4xx_plb_init(CPUPPCState *env)
 {
     ppc4xx_plb_t *plb;
 
+    qdev_warn_deprecated_function_used();
+
     plb = g_malloc0(sizeof(ppc4xx_plb_t));
     ppc_dcr_register(env, PLB3A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
     ppc_dcr_register(env, PLB4A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
@@ -267,6 +270,8 @@ static void ppc4xx_pob_init(CPUPPCState *env)
 {
     ppc4xx_pob_t *pob;
 
+    qdev_warn_deprecated_function_used();
+
     pob = g_malloc0(sizeof(ppc4xx_pob_t));
     ppc_dcr_register(env, POB0_BEAR, pob, &dcr_read_pob, &dcr_write_pob);
     ppc_dcr_register(env, POB0_BESR0, pob, &dcr_read_pob, &dcr_write_pob);
@@ -351,6 +356,8 @@ static void ppc4xx_opba_init(hwaddr base)
 {
     ppc4xx_opba_t *opba;
 
+    qdev_warn_deprecated_function_used();
+
     opba = g_malloc0(sizeof(ppc4xx_opba_t));
 #ifdef DEBUG_OPBA
     printf("%s: offset " TARGET_FMT_plx "\n", __func__, base);
@@ -549,6 +556,8 @@ void ppc405_ebc_init(CPUPPCState *env)
 {
     ppc4xx_ebc_t *ebc;
 
+    qdev_warn_deprecated_function_used();
+
     ebc = g_malloc0(sizeof(ppc4xx_ebc_t));
     qemu_register_reset(&ebc_reset, ebc);
     ppc_dcr_register(env, EBC0_CFGADDR,
@@ -632,6 +641,8 @@ static void ppc405_dma_init(CPUPPCState *env, qemu_irq irqs[4])
 {
     ppc405_dma_t *dma;
 
+    qdev_warn_deprecated_function_used();
+
     dma = g_malloc0(sizeof(ppc405_dma_t));
     memcpy(dma->irqs, irqs, 4 * sizeof(qemu_irq));
     qemu_register_reset(&ppc405_dma_reset, dma);
@@ -735,6 +746,8 @@ static void ppc405_gpio_init(hwaddr base)
 {
     ppc405_gpio_t *gpio;
 
+    qdev_warn_deprecated_function_used();
+
     gpio = g_malloc0(sizeof(ppc405_gpio_t));
 #ifdef DEBUG_GPIO
     printf("%s: offset " TARGET_FMT_plx "\n", __func__, base);
@@ -897,6 +910,8 @@ static void ppc405_ocm_init(CPUPPCState *env)
 {
     ppc405_ocm_t *ocm;
 
+    qdev_warn_deprecated_function_used();
+
     ocm = g_malloc0(sizeof(ppc405_ocm_t));
     /* XXX: Size is 4096 or 0x04000000 */
     memory_region_init_ram(&ocm->isarc_ram, NULL, "ppc405.ocm", 4 * KiB,
@@ -1142,6 +1157,8 @@ static void ppc4xx_gpt_init(hwaddr base, qemu_irq irqs[5])
     ppc4xx_gpt_t *gpt;
     int i;
 
+    qdev_warn_deprecated_function_used();
+
     gpt = g_malloc0(sizeof(ppc4xx_gpt_t));
     for (i = 0; i < 5; i++) {
         gpt->irqs[i] = irqs[i];
@@ -1410,6 +1427,8 @@ static void ppc405cr_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[7],
 {
     ppc405cr_cpc_t *cpc;
 
+    qdev_warn_deprecated_function_used();
+
     cpc = g_malloc0(sizeof(ppc405cr_cpc_t));
     memcpy(cpc->clk_setup, clk_setup,
            PPC405CR_CLK_NB * sizeof(clk_setup_t));
@@ -1755,6 +1774,8 @@ static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
 {
     ppc405ep_cpc_t *cpc;
 
+    qdev_warn_deprecated_function_used();
+
     cpc = g_malloc0(sizeof(ppc405ep_cpc_t));
     memcpy(cpc->clk_setup, clk_setup,
            PPC405EP_CLK_NB * sizeof(clk_setup_t));
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index f1651e04d9..b09d7ab5c6 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -33,6 +33,7 @@
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
 #include "qemu/error-report.h"
+#include "hw/qdev-deprecated.h"
 
 /*#define DEBUG_UIC*/
 
@@ -303,6 +304,8 @@ qemu_irq *ppcuic_init (CPUPPCState *env, qemu_irq *irqs,
     ppcuic_t *uic;
     int i;
 
+    qdev_warn_deprecated_function_used();
+
     uic = g_malloc0(sizeof(ppcuic_t));
     uic->dcr_base = dcr_base;
     uic->irqs = irqs;
@@ -647,6 +650,8 @@ void ppc4xx_sdram_init (CPUPPCState *env, qemu_irq irq, int nbanks,
 {
     ppc4xx_sdram_t *sdram;
 
+    qdev_warn_deprecated_function_used();
+
     sdram = g_malloc0(sizeof(ppc4xx_sdram_t));
     sdram->irq = irq;
     sdram->nbanks = nbanks;
@@ -908,6 +913,8 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
     ppc4xx_mal_t *mal;
     int i;
 
+    qdev_warn_deprecated_function_used();
+
     assert(txcnum <= 32 && rxcnum <= 32);
     mal = g_malloc0(sizeof(*mal));
     mal->txcnum = txcnum;
-- 
2.21.3


