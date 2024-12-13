Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3155E9F157A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 20:09:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857089.1269538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMB2I-00052W-N3; Fri, 13 Dec 2024 19:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857089.1269538; Fri, 13 Dec 2024 19:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMB2I-0004zp-Ji; Fri, 13 Dec 2024 19:09:14 +0000
Received: by outflank-mailman (input) for mailman id 857089;
 Fri, 13 Dec 2024 19:09:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I5eD=TG=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tMB2H-0004TW-7T
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 19:09:13 +0000
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [2607:f8b0:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbe44eac-b985-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 20:09:11 +0100 (CET)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-71e2bc5b90fso1009869a34.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 11:09:11 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71e4834da91sm29697a34.18.2024.12.13.11.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 11:09:09 -0800 (PST)
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
X-Inumbo-ID: bbe44eac-b985-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734116950; x=1734721750; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/X3IVDeDd+noUKxYZR0n+Vdo2pFngQ4Wz2l9zT17Cg=;
        b=Ch5XorqkKzZK++r7uaJ7Ingrf3KtC1Zzonea15h1sPeVhp9gQWDBz3Tt45CU00JuS+
         a7YxmBfFPEbhNIUcMg0CHIYz9D38B5lzAt4w1iaEbVQLGlHWXQU1XDOygRIhUCP11AA+
         NByLvcRIvMhV/MUJ4UJTk5Qq8qufYBN3Hp/I/bR5A7JSUb7cl0zUY5Hlk0SKeCSa1yEB
         +/3Un/GEPnJos05G9iTQFHNKK5FTlaOf/fp1vlHAkJdIwD6e3+XwgV/2DtZ/AT/Aq+Hy
         71mxAYfLRnBhw9a9VSE2L38kbozQRAB1rK+dN26IfDwJVgnEjpIJYKnMuv7pDAgF7s0M
         l6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734116950; x=1734721750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/X3IVDeDd+noUKxYZR0n+Vdo2pFngQ4Wz2l9zT17Cg=;
        b=kUrdm38uwmR6RptAhKPN/xPSgmisN54kjLmDMCDVX2y5wB66ij67X1/A78J/DQ7mMS
         HjdrrRQmid5gtFvC/abYmYZlZBN2BgskgdXqu2NiYhlVrwucbBp1p4goAWd/NxOjz7/X
         +eRksEgusy9vuII0Ja4vmezVH/3T2yNwFtbmyaZp4xYb7/kMM3SFBbRNlVGYrly1CfAf
         9azQjzychXDuQYnWVwjihGSdyypN1N9hdaEmtR/iYhvoPE9pFL5CIdkwbUYQBQIWXVMj
         +gJkdE39VQd+VNJ/UT/k1PKkn0B8ieCakfUBULMhpUg68FoGmaxs3FWZfbc02sQFpZKu
         k9bA==
X-Forwarded-Encrypted: i=1; AJvYcCXD1VPksAseqmGS2Cv+ybkoxByTX7w/fVYPD/4sZpILZWG6TlEbscbpU6BwS8PT0iHfPDHo39RhezU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzL+ZyOLNR6BeX7XcKncppYvK3bPXq+uXNytn/04tXjeUAsyh+S
	J+FEzB1zEhOEfycQ9XDWBjV0wVLmqgPKZHQ7+7WMTaBoVEzh2WEWhg2BfrmNQik=
X-Gm-Gg: ASbGncujkSab3OmsM93RxdvFvxDDUAJbaBqqhvgOV6HlgAx3//cCjhUR0aauyDXmQH4
	6DGQYz2AM0S9cne+GV+QaFPqSiBn+u1bRmg3v9q6VC0iLQ0KtPepoM+tZqm+s94VXYPj/45XqR6
	BwzChGTMJ0yeFpleywokbdB8LOHoimKgf50pr8+miot+VoT9ib10bqU3IXekXyqBpDOtCQ3bf8U
	u6eMdxcVf4rB7JkOXavfZvZGxZBYUL6T69MQvDpOHBYLmcXJjS73waIZ79b5f4t
X-Google-Smtp-Source: AGHT+IHyiahaPH7IR7tMGor3tb4r8tyoeL5l6bj/iA+pUDvvwPfsGQ4o6c5cVxqEWXW+NK7FcqsU5A==
X-Received: by 2002:a05:6830:4486:b0:71e:212e:9115 with SMTP id 46e09a7af769-71e3ba50013mr2201200a34.30.1734116949898;
        Fri, 13 Dec 2024 11:09:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
	Frederic Konrad <konrad.frederic@yahoo.fr>,
	Alberto Garcia <berto@igalia.com>,
	Thomas Huth <huth@tuxfamily.org>,
	Joel Stanley <joel@jms.id.au>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Vijai Kumar K <vijai@behindbytes.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Samuel Tardieu <sam@rfc1149.net>,
	Amit Shah <amit@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org (open list:Raspberry Pi),
	qemu-riscv@nongnu.org (open list:OpenTitan),
	qemu-s390x@nongnu.org (open list:S390 general arch...),
	qemu-ppc@nongnu.org (open list:sPAPR (pseries)),
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH 20/71] hw/char: Constify all Property
Date: Fri, 13 Dec 2024 13:06:54 -0600
Message-ID: <20241213190750.2513964-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213190750.2513964-1-richard.henderson@linaro.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/char/avr_usart.c         | 2 +-
 hw/char/bcm2835_aux.c       | 2 +-
 hw/char/cadence_uart.c      | 2 +-
 hw/char/cmsdk-apb-uart.c    | 2 +-
 hw/char/debugcon.c          | 2 +-
 hw/char/digic-uart.c        | 2 +-
 hw/char/escc.c              | 2 +-
 hw/char/exynos4210_uart.c   | 2 +-
 hw/char/goldfish_tty.c      | 2 +-
 hw/char/grlib_apbuart.c     | 2 +-
 hw/char/ibex_uart.c         | 2 +-
 hw/char/imx_serial.c        | 2 +-
 hw/char/ipoctal232.c        | 2 +-
 hw/char/mcf_uart.c          | 2 +-
 hw/char/nrf51_uart.c        | 2 +-
 hw/char/parallel.c          | 2 +-
 hw/char/pl011.c             | 2 +-
 hw/char/renesas_sci.c       | 2 +-
 hw/char/sclpconsole-lm.c    | 2 +-
 hw/char/sclpconsole.c       | 2 +-
 hw/char/serial-isa.c        | 2 +-
 hw/char/serial-mm.c         | 2 +-
 hw/char/serial-pci-multi.c  | 4 ++--
 hw/char/serial-pci.c        | 2 +-
 hw/char/serial.c            | 2 +-
 hw/char/sh_serial.c         | 2 +-
 hw/char/shakti_uart.c       | 2 +-
 hw/char/sifive_uart.c       | 2 +-
 hw/char/spapr_vty.c         | 2 +-
 hw/char/stm32f2xx_usart.c   | 2 +-
 hw/char/stm32l4x5_usart.c   | 2 +-
 hw/char/terminal3270.c      | 2 +-
 hw/char/virtio-console.c    | 2 +-
 hw/char/virtio-serial-bus.c | 4 ++--
 hw/char/xen_console.c       | 2 +-
 hw/char/xilinx_uartlite.c   | 2 +-
 36 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/hw/char/avr_usart.c b/hw/char/avr_usart.c
index 3aff01cd54..3421576e45 100644
--- a/hw/char/avr_usart.c
+++ b/hw/char/avr_usart.c
@@ -259,7 +259,7 @@ static const MemoryRegionOps avr_usart_ops = {
     .impl = {.min_access_size = 1, .max_access_size = 1}
 };
 
-static Property avr_usart_properties[] = {
+static const Property avr_usart_properties[] = {
     DEFINE_PROP_CHR("chardev", AVRUsartState, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c
index fca2f27a55..30285c97b0 100644
--- a/hw/char/bcm2835_aux.c
+++ b/hw/char/bcm2835_aux.c
@@ -290,7 +290,7 @@ static void bcm2835_aux_realize(DeviceState *dev, Error **errp)
                              bcm2835_aux_receive, NULL, NULL, s, NULL, true);
 }
 
-static Property bcm2835_aux_props[] = {
+static const Property bcm2835_aux_props[] = {
     DEFINE_PROP_CHR("chardev", BCM2835AuxState, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 77d9a2a221..2e778f7a9c 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -617,7 +617,7 @@ static const VMStateDescription vmstate_cadence_uart = {
     },
 };
 
-static Property cadence_uart_properties[] = {
+static const Property cadence_uart_properties[] = {
     DEFINE_PROP_CHR("chardev", CadenceUARTState, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c
index 467e40b715..e37e14e0f2 100644
--- a/hw/char/cmsdk-apb-uart.c
+++ b/hw/char/cmsdk-apb-uart.c
@@ -377,7 +377,7 @@ static const VMStateDescription cmsdk_apb_uart_vmstate = {
     }
 };
 
-static Property cmsdk_apb_uart_properties[] = {
+static const Property cmsdk_apb_uart_properties[] = {
     DEFINE_PROP_CHR("chardev", CMSDKAPBUART, chr),
     DEFINE_PROP_UINT32("pclk-frq", CMSDKAPBUART, pclk_frq, 0),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
index fdb04fee09..c0f16e9bd6 100644
--- a/hw/char/debugcon.c
+++ b/hw/char/debugcon.c
@@ -114,7 +114,7 @@ static void debugcon_isa_realizefn(DeviceState *dev, Error **errp)
                                 isa->iobase, &s->io);
 }
 
-static Property debugcon_isa_properties[] = {
+static const Property debugcon_isa_properties[] = {
     DEFINE_PROP_UINT32("iobase", ISADebugconState, iobase, 0xe9),
     DEFINE_PROP_CHR("chardev",  ISADebugconState, state.chr),
     DEFINE_PROP_UINT32("readback", ISADebugconState, state.readback, 0xe9),
diff --git a/hw/char/digic-uart.c b/hw/char/digic-uart.c
index 5b04abec1d..03beba11ad 100644
--- a/hw/char/digic-uart.c
+++ b/hw/char/digic-uart.c
@@ -172,7 +172,7 @@ static const VMStateDescription vmstate_digic_uart = {
     }
 };
 
-static Property digic_uart_properties[] = {
+static const Property digic_uart_properties[] = {
     DEFINE_PROP_CHR("chardev", DigicUartState, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/char/escc.c b/hw/char/escc.c
index b1b1bbed15..08bc65ef2c 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -1089,7 +1089,7 @@ static void escc_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static Property escc_properties[] = {
+static const Property escc_properties[] = {
     DEFINE_PROP_UINT32("frequency", ESCCState, frequency,   0),
     DEFINE_PROP_UINT32("it_shift",  ESCCState, it_shift,    0),
     DEFINE_PROP_BOOL("bit_swap",    ESCCState, bit_swap,    false),
diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index d9e732f98b..c2836ff8fd 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -704,7 +704,7 @@ static void exynos4210_uart_realize(DeviceState *dev, Error **errp)
                              NULL, s, NULL, true);
 }
 
-static Property exynos4210_uart_properties[] = {
+static const Property exynos4210_uart_properties[] = {
     DEFINE_PROP_CHR("chardev", Exynos4210UartState, chr),
     DEFINE_PROP_UINT32("channel", Exynos4210UartState, channel, 0),
     DEFINE_PROP_UINT32("rx-size", Exynos4210UartState, rx.size, 16),
diff --git a/hw/char/goldfish_tty.c b/hw/char/goldfish_tty.c
index d1917b83d8..68e261236e 100644
--- a/hw/char/goldfish_tty.c
+++ b/hw/char/goldfish_tty.c
@@ -241,7 +241,7 @@ static const VMStateDescription vmstate_goldfish_tty = {
     }
 };
 
-static Property goldfish_tty_properties[] = {
+static const Property goldfish_tty_properties[] = {
     DEFINE_PROP_CHR("chardev", GoldfishTTYState, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
index d0032b4d2a..caae88d77d 100644
--- a/hw/char/grlib_apbuart.c
+++ b/hw/char/grlib_apbuart.c
@@ -277,7 +277,7 @@ static void grlib_apbuart_reset(DeviceState *d)
     uart->current = 0;
 }
 
-static Property grlib_apbuart_properties[] = {
+static const Property grlib_apbuart_properties[] = {
     DEFINE_PROP_CHR("chrdev", UART, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index 589177f85b..b1bdb2ad15 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -508,7 +508,7 @@ static const VMStateDescription vmstate_ibex_uart = {
     }
 };
 
-static Property ibex_uart_properties[] = {
+static const Property ibex_uart_properties[] = {
     DEFINE_PROP_CHR("chardev", IbexUartState, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index 22c9080b1c..6376f2cadc 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -438,7 +438,7 @@ static void imx_serial_init(Object *obj)
     sysbus_init_irq(sbd, &s->irq);
 }
 
-static Property imx_serial_properties[] = {
+static const Property imx_serial_properties[] = {
     DEFINE_PROP_CHR("chardev", IMXSerialState, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/char/ipoctal232.c b/hw/char/ipoctal232.c
index 64be5226d4..fb8cb6c2b7 100644
--- a/hw/char/ipoctal232.c
+++ b/hw/char/ipoctal232.c
@@ -558,7 +558,7 @@ static void ipoctal_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static Property ipoctal_properties[] = {
+static const Property ipoctal_properties[] = {
     DEFINE_PROP_CHR("chardev0", IPOctalState, ch[0].dev),
     DEFINE_PROP_CHR("chardev1", IPOctalState, ch[1].dev),
     DEFINE_PROP_CHR("chardev2", IPOctalState, ch[2].dev),
diff --git a/hw/char/mcf_uart.c b/hw/char/mcf_uart.c
index ad15e28944..c044536d5d 100644
--- a/hw/char/mcf_uart.c
+++ b/hw/char/mcf_uart.c
@@ -312,7 +312,7 @@ static void mcf_uart_realize(DeviceState *dev, Error **errp)
                              mcf_uart_event, NULL, s, NULL, true);
 }
 
-static Property mcf_uart_properties[] = {
+static const Property mcf_uart_properties[] = {
     DEFINE_PROP_CHR("chardev", mcf_uart_state, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/char/nrf51_uart.c b/hw/char/nrf51_uart.c
index 04da3f8d97..b164c70f52 100644
--- a/hw/char/nrf51_uart.c
+++ b/hw/char/nrf51_uart.c
@@ -304,7 +304,7 @@ static const VMStateDescription nrf51_uart_vmstate = {
     }
 };
 
-static Property nrf51_uart_properties[] = {
+static const Property nrf51_uart_properties[] = {
     DEFINE_PROP_CHR("chardev", NRF51UARTState, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index c394635ada..15191698f5 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -603,7 +603,7 @@ bool parallel_mm_init(MemoryRegion *address_space,
     return true;
 }
 
-static Property parallel_isa_properties[] = {
+static const Property parallel_isa_properties[] = {
     DEFINE_PROP_UINT32("index", ISAParallelState, index,   -1),
     DEFINE_PROP_UINT32("iobase", ISAParallelState, iobase,  -1),
     DEFINE_PROP_UINT32("irq",   ISAParallelState, isairq,  7),
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 0fd1334fab..5fbee5e6c5 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -603,7 +603,7 @@ static const VMStateDescription vmstate_pl011 = {
     }
 };
 
-static Property pl011_properties[] = {
+static const Property pl011_properties[] = {
     DEFINE_PROP_CHR("chardev", PL011State, chr),
     DEFINE_PROP_BOOL("migrate-clk", PL011State, migrate_clk, true),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/char/renesas_sci.c b/hw/char/renesas_sci.c
index 7ce0408b0c..516b48648b 100644
--- a/hw/char/renesas_sci.c
+++ b/hw/char/renesas_sci.c
@@ -319,7 +319,7 @@ static const VMStateDescription vmstate_rsci = {
     }
 };
 
-static Property rsci_properties[] = {
+static const Property rsci_properties[] = {
     DEFINE_PROP_UINT64("input-freq", RSCIState, input_freq, 0),
     DEFINE_PROP_CHR("chardev", RSCIState, chr),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/char/sclpconsole-lm.c b/hw/char/sclpconsole-lm.c
index 4fe1c4d289..536b283471 100644
--- a/hw/char/sclpconsole-lm.c
+++ b/hw/char/sclpconsole-lm.c
@@ -333,7 +333,7 @@ static void console_reset(DeviceState *dev)
    scon->write_errors = 0;
 }
 
-static Property console_properties[] = {
+static const Property console_properties[] = {
     DEFINE_PROP_CHR("chardev", SCLPConsoleLM, chr),
     DEFINE_PROP_UINT32("write_errors", SCLPConsoleLM, write_errors, 0),
     DEFINE_PROP_BOOL("echo", SCLPConsoleLM, echo, true),
diff --git a/hw/char/sclpconsole.c b/hw/char/sclpconsole.c
index e6d49e819e..a90b892d1d 100644
--- a/hw/char/sclpconsole.c
+++ b/hw/char/sclpconsole.c
@@ -251,7 +251,7 @@ static void console_reset(DeviceState *dev)
    scon->notify = false;
 }
 
-static Property console_properties[] = {
+static const Property console_properties[] = {
     DEFINE_PROP_CHR("chardev", SCLPConsole, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/char/serial-isa.c b/hw/char/serial-isa.c
index b562ec9d37..2cf50eb0bb 100644
--- a/hw/char/serial-isa.c
+++ b/hw/char/serial-isa.c
@@ -113,7 +113,7 @@ static const VMStateDescription vmstate_isa_serial = {
     }
 };
 
-static Property serial_isa_properties[] = {
+static const Property serial_isa_properties[] = {
     DEFINE_PROP_UINT32("index",  ISASerialState, index,   -1),
     DEFINE_PROP_UINT32("iobase",  ISASerialState, iobase,  -1),
     DEFINE_PROP_UINT32("irq",    ISASerialState, isairq,  -1),
diff --git a/hw/char/serial-mm.c b/hw/char/serial-mm.c
index 2f67776b19..8f51f1d3b8 100644
--- a/hw/char/serial-mm.c
+++ b/hw/char/serial-mm.c
@@ -125,7 +125,7 @@ static void serial_mm_instance_init(Object *o)
     qdev_alias_all_properties(DEVICE(&smm->serial), o);
 }
 
-static Property serial_mm_properties[] = {
+static const Property serial_mm_properties[] = {
     /*
      * Set the spacing between adjacent memory-mapped UART registers.
      * Each register will be at (1 << regshift) bytes after the previous one.
diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
index 28b275709a..c2f20d8e74 100644
--- a/hw/char/serial-pci-multi.c
+++ b/hw/char/serial-pci-multi.c
@@ -132,14 +132,14 @@ static const VMStateDescription vmstate_pci_multi_serial = {
     }
 };
 
-static Property multi_2x_serial_pci_properties[] = {
+static const Property multi_2x_serial_pci_properties[] = {
     DEFINE_PROP_CHR("chardev1",  PCIMultiSerialState, state[0].chr),
     DEFINE_PROP_CHR("chardev2",  PCIMultiSerialState, state[1].chr),
     DEFINE_PROP_UINT8("prog_if",  PCIMultiSerialState, prog_if, 0x02),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static Property multi_4x_serial_pci_properties[] = {
+static const Property multi_4x_serial_pci_properties[] = {
     DEFINE_PROP_CHR("chardev1",  PCIMultiSerialState, state[0].chr),
     DEFINE_PROP_CHR("chardev2",  PCIMultiSerialState, state[1].chr),
     DEFINE_PROP_CHR("chardev3",  PCIMultiSerialState, state[2].chr),
diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index f8a1a94d0c..2f487a3a79 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -81,7 +81,7 @@ static const VMStateDescription vmstate_pci_serial = {
     }
 };
 
-static Property serial_pci_properties[] = {
+static const Property serial_pci_properties[] = {
     DEFINE_PROP_UINT8("prog_if",  PCISerialState, prog_if, 0x02),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/char/serial.c b/hw/char/serial.c
index b50a8a1313..85dba02ace 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -964,7 +964,7 @@ const MemoryRegionOps serial_io_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
-static Property serial_properties[] = {
+static const Property serial_properties[] = {
     DEFINE_PROP_CHR("chardev", SerialState, chr),
     DEFINE_PROP_UINT32("baudbase", SerialState, baudbase, 115200),
     DEFINE_PROP_BOOL("wakeup", SerialState, wakeup, false),
diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 429b2562aa..2ab7197aee 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -447,7 +447,7 @@ static void sh_serial_init(Object *obj)
 {
 }
 
-static Property sh_serial_properties[] = {
+static const Property sh_serial_properties[] = {
     DEFINE_PROP_CHR("chardev", SHSerialState, chr),
     DEFINE_PROP_UINT8("features", SHSerialState, feat, 0),
     DEFINE_PROP_END_OF_LIST()
diff --git a/hw/char/shakti_uart.c b/hw/char/shakti_uart.c
index 4a71953c9a..6e56754ca6 100644
--- a/hw/char/shakti_uart.c
+++ b/hw/char/shakti_uart.c
@@ -157,7 +157,7 @@ static void shakti_uart_instance_init(Object *obj)
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &sus->mmio);
 }
 
-static Property shakti_uart_properties[] = {
+static const Property shakti_uart_properties[] = {
     DEFINE_PROP_CHR("chardev", ShaktiUartState, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
index 5ae2a29ed6..97e4be37c0 100644
--- a/hw/char/sifive_uart.c
+++ b/hw/char/sifive_uart.c
@@ -251,7 +251,7 @@ static int sifive_uart_be_change(void *opaque)
     return 0;
 }
 
-static Property sifive_uart_properties[] = {
+static const Property sifive_uart_properties[] = {
     DEFINE_PROP_CHR("chardev", SiFiveUARTState, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/char/spapr_vty.c b/hw/char/spapr_vty.c
index 3e23d9cbab..cd91dad709 100644
--- a/hw/char/spapr_vty.c
+++ b/hw/char/spapr_vty.c
@@ -163,7 +163,7 @@ void spapr_vty_create(SpaprVioBus *bus, Chardev *chardev)
     qdev_realize_and_unref(dev, &bus->bus, &error_fatal);
 }
 
-static Property spapr_vty_properties[] = {
+static const Property spapr_vty_properties[] = {
     DEFINE_SPAPR_PROPERTIES(SpaprVioVty, sdev),
     DEFINE_PROP_CHR("chardev", SpaprVioVty, chardev),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
index 17b5b1f15f..4a3c30eddb 100644
--- a/hw/char/stm32f2xx_usart.c
+++ b/hw/char/stm32f2xx_usart.c
@@ -199,7 +199,7 @@ static const MemoryRegionOps stm32f2xx_usart_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static Property stm32f2xx_usart_properties[] = {
+static const Property stm32f2xx_usart_properties[] = {
     DEFINE_PROP_CHR("chardev", STM32F2XXUsartState, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/char/stm32l4x5_usart.c b/hw/char/stm32l4x5_usart.c
index 3cf200c080..360e79cc3f 100644
--- a/hw/char/stm32l4x5_usart.c
+++ b/hw/char/stm32l4x5_usart.c
@@ -534,7 +534,7 @@ static const MemoryRegionOps stm32l4x5_usart_base_ops = {
     },
 };
 
-static Property stm32l4x5_usart_base_properties[] = {
+static const Property stm32l4x5_usart_base_properties[] = {
     DEFINE_PROP_CHR("chardev", Stm32l4x5UsartBaseState, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
index 82e85fac2e..c2aafda0ce 100644
--- a/hw/char/terminal3270.c
+++ b/hw/char/terminal3270.c
@@ -283,7 +283,7 @@ static int write_payload_3270(EmulatedCcw3270Device *dev, uint8_t cmd)
     return (retval <= 0) ? 0 : get_cds(t)->count;
 }
 
-static Property terminal_properties[] = {
+static const Property terminal_properties[] = {
     DEFINE_PROP_CHR("chardev", Terminal3270, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/char/virtio-console.c b/hw/char/virtio-console.c
index dbe0b28e60..f58292e2bb 100644
--- a/hw/char/virtio-console.c
+++ b/hw/char/virtio-console.c
@@ -274,7 +274,7 @@ static const TypeInfo virtconsole_info = {
     .class_init    = virtconsole_class_init,
 };
 
-static Property virtserialport_properties[] = {
+static const Property virtserialport_properties[] = {
     DEFINE_PROP_CHR("chardev", VirtConsole, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 2094d213cd..1e631bcb2b 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -835,7 +835,7 @@ static int virtio_serial_load_device(VirtIODevice *vdev, QEMUFile *f,
 
 static void virtser_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent);
 
-static Property virtser_props[] = {
+static const Property virtser_props[] = {
     DEFINE_PROP_UINT32("nr", VirtIOSerialPort, id, VIRTIO_CONSOLE_BAD_ID),
     DEFINE_PROP_STRING("name", VirtIOSerialPort, name),
     DEFINE_PROP_END_OF_LIST()
@@ -1153,7 +1153,7 @@ static const VMStateDescription vmstate_virtio_console = {
     },
 };
 
-static Property virtio_serial_properties[] = {
+static const Property virtio_serial_properties[] = {
     DEFINE_PROP_UINT32("max_ports", VirtIOSerial, serial.max_virtserial_ports,
                                                   31),
     DEFINE_PROP_BIT64("emergency-write", VirtIOSerial, host_features,
diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index 683c92aca1..c20c1b4b84 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -487,7 +487,7 @@ static char *xen_console_get_frontend_path(XenDevice *xendev, Error **errp)
 }
 
 
-static Property xen_console_properties[] = {
+static const Property xen_console_properties[] = {
     DEFINE_PROP_CHR("chardev", XenConsole, chr),
     DEFINE_PROP_INT32("idx", XenConsole, dev, -1),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index f325084f8b..ad77226217 100644
--- a/hw/char/xilinx_uartlite.c
+++ b/hw/char/xilinx_uartlite.c
@@ -176,7 +176,7 @@ static const MemoryRegionOps uart_ops = {
     }
 };
 
-static Property xilinx_uartlite_properties[] = {
+static const Property xilinx_uartlite_properties[] = {
     DEFINE_PROP_CHR("chardev", XilinxUARTLite, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.43.0


