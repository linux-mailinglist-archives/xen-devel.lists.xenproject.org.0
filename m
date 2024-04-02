Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BED895272
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 14:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700111.1092726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrcuN-0005Zj-Jp; Tue, 02 Apr 2024 12:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700111.1092726; Tue, 02 Apr 2024 12:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrcuN-0005Ue-GA; Tue, 02 Apr 2024 12:06:31 +0000
Received: by outflank-mailman (input) for mailman id 700111;
 Tue, 02 Apr 2024 12:06:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dzup=LH=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1rrcuL-0005SV-IW
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 12:06:29 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f588766-f0e9-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 14:06:28 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a4e65dec03eso261377766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 05:06:28 -0700 (PDT)
Received: from EPUAKYIW03DD.. ([91.123.150.27])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a170906774a00b00a4e472a8e54sm4303773ejn.48.2024.04.02.05.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 05:06:26 -0700 (PDT)
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
X-Inumbo-ID: 6f588766-f0e9-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712059587; x=1712664387; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXRZoBkrIDvTNlJOaVE/UOyTf5pEhamTYtPvWBSXQsk=;
        b=esPGY+207ziPSlGR2WMnGvXhm9ZuWmciDd189gdL304K8diM8adCf3n0lepVZbf1HD
         IIBlkwHuiGlLQqxPFDsEfh3KDVEQ1r2ehCCvFMG42hnVW6iZqhFEDpkMoL8BxHUDW9nF
         fPqC0CV3tf/fHuzA0I8aPeKZA1azp3GJTVE4uOK48guZBxniQ7dNiASef0s1fHppuqci
         UQ1WKZgEGWv6+PSpUg2Qlt7xwAlOTxrdKl6rmTp2yCaF8TBvb+OQdqhVC1BWrF4vjFlJ
         SozTZan5s9+oKIsECDkteexQO6YwA7cHTXHqWa4UqVTzSijj8wAfQrnNur+X94R5VXoo
         +tRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712059587; x=1712664387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXRZoBkrIDvTNlJOaVE/UOyTf5pEhamTYtPvWBSXQsk=;
        b=hTAt+S0Ul0s4v9HnTMu8Gv/h63jAPB0AEmtIbhc8kIUJmq8+0bWzeS6oohYzB9kaxr
         CkTIHWhRPy3tGM9LJ7bK+ATWPIv1aRzIRUDH3xCFJti1EQLi06JN3IwVj6NKxNJXMSpq
         w0s0y/aZYv1pvKAXbGp62+UVozVROHIuFUTkp529Oe6HU+fTYlNxV827cF3HUzUoclY0
         xIATq9LKjChErPfbhCrbkQxJ6jHzGi0p04DeEuLEY2bQkH6x4R/AQvIVHrqRDH/OlRzk
         XgItNTmr95r/ClPuYQm8fH+mj3HdlJ/vFxUWJ7rA5tJ0oyB+Ng5atZRqg8A9Ccc3mq2j
         LehQ==
X-Gm-Message-State: AOJu0YyRWOTfKmLZOACJ5l+4rhdPbWOw9bpBo9QrT6ZZZWPMu54y/G8c
	4xxGkveocMN3ennwM76ZDyRIAVArJFxo1kfnoSrfnZt3ivs5zTMuWExljjNH
X-Google-Smtp-Source: AGHT+IGNo07CHKnbFiMZtWKQ71TkvlQlT2xcaqfjvF/EUoSPv9tbYhEuPzH760lZuULNadQG3B+zSw==
X-Received: by 2002:a17:906:2c12:b0:a4e:282d:b540 with SMTP id e18-20020a1709062c1200b00a4e282db540mr6688228ejh.77.1712059587098;
        Tue, 02 Apr 2024 05:06:27 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/2] xen/arm: Add i.MX UART early printk support
Date: Tue,  2 Apr 2024 15:05:56 +0300
Message-Id: <20240402120557.1822253-2-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240402120557.1822253-1-olekstysh@gmail.com>
References: <20240402120557.1822253-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Tested on i.MX 8M Mini only, but I guess, it should be
suitable for other i.MX8M* SoCs (those UART device tree nodes
contain "fsl,imx6q-uart" compatible string).

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
I selected the following configs for enabling early printk:

 CONFIG_EARLY_UART_CHOICE_IMX_UART=y
 CONFIG_EARLY_UART_IMX_UART=y
 CONFIG_EARLY_PRINTK=y
 CONFIG_EARLY_UART_BASE_ADDRESS=0x30890000
 CONFIG_EARLY_PRINTK_INC="debug-imx-uart.inc"
---
---
 xen/arch/arm/Kconfig.debug            | 14 +++++
 xen/arch/arm/arm64/debug-imx-uart.inc | 38 ++++++++++++++
 xen/arch/arm/include/asm/imx-uart.h   | 76 +++++++++++++++++++++++++++
 3 files changed, 128 insertions(+)
 create mode 100644 xen/arch/arm/arm64/debug-imx-uart.inc
 create mode 100644 xen/arch/arm/include/asm/imx-uart.h

diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
index eec860e88e..a15d08f214 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -68,6 +68,16 @@ choice
 			provide the parameters for the i.MX LPUART rather than
 			selecting one of the platform specific options below if
 			you know the parameters for the port.
+	config EARLY_UART_CHOICE_IMX_UART
+		select EARLY_UART_IMX_UART
+		depends on ARM_64
+		bool "Early printk via i.MX UART"
+		help
+			Say Y here if you wish the early printk to direct their
+			output to a i.MX UART. You can use this option to
+			provide the parameters for the i.MX UART rather than
+			selecting one of the platform specific options below if
+			you know the parameters for the port.
 	config EARLY_UART_CHOICE_MESON
 		select EARLY_UART_MESON
 		depends on ARM_64
@@ -199,6 +209,9 @@ config EARLY_UART_EXYNOS4210
 config EARLY_UART_IMX_LPUART
 	select EARLY_PRINTK
 	bool
+config EARLY_UART_IMX_UART
+	select EARLY_PRINTK
+	bool
 config EARLY_UART_MESON
 	select EARLY_PRINTK
 	bool
@@ -304,6 +317,7 @@ config EARLY_PRINTK_INC
 	default "debug-cadence.inc" if EARLY_UART_CADENCE
 	default "debug-exynos4210.inc" if EARLY_UART_EXYNOS4210
 	default "debug-imx-lpuart.inc" if EARLY_UART_IMX_LPUART
+	default "debug-imx-uart.inc" if EARLY_UART_IMX_UART
 	default "debug-meson.inc" if EARLY_UART_MESON
 	default "debug-mvebu.inc" if EARLY_UART_MVEBU
 	default "debug-pl011.inc" if EARLY_UART_PL011
diff --git a/xen/arch/arm/arm64/debug-imx-uart.inc b/xen/arch/arm/arm64/debug-imx-uart.inc
new file mode 100644
index 0000000000..27a68b1ed5
--- /dev/null
+++ b/xen/arch/arm/arm64/debug-imx-uart.inc
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * xen/arch/arm/arm64/debug-imx-uart.inc
+ *
+ * i.MX8M* specific debug code
+ *
+ * Copyright (C) 2024 EPAM Systems Inc.
+ */
+
+#include <asm/imx-uart.h>
+
+/*
+ * Wait UART to be ready to transmit
+ * rb: register which contains the UART base address
+ * rc: scratch register
+ */
+.macro early_uart_ready xb, c
+1:
+        ldr   w\c, [\xb, #IMX21_UTS] /* <- Test register */
+        tst   w\c, #UTS_TXFULL       /* Check TxFIFO FULL bit */
+        bne   1b                     /* Wait for the UART to be ready */
+.endm
+
+/*
+ * UART transmit character
+ * rb: register which contains the UART base address
+ * rt: register which contains the character to transmit
+ */
+.macro early_uart_transmit xb, wt
+        str   \wt, [\xb, #URTX0] /* -> Transmitter Register */
+.endm
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/imx-uart.h b/xen/arch/arm/include/asm/imx-uart.h
new file mode 100644
index 0000000000..413a81dd44
--- /dev/null
+++ b/xen/arch/arm/include/asm/imx-uart.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * xen/arch/arm/include/asm/imx-uart.h
+ *
+ * Common constant definition between early printk and the UART driver
+ *
+ * Copyright (C) 2024 EPAM Systems Inc.
+ */
+
+#ifndef __ASM_ARM_IMX_UART_H__
+#define __ASM_ARM_IMX_UART_H__
+
+/* 32-bit register definition */
+#define URXD0        (0x00) /* Receiver Register */
+#define URTX0        (0x40) /* Transmitter Register */
+#define UCR1         (0x80) /* Control Register 1 */
+#define UCR2         (0x84) /* Control Register 2 */
+#define UCR3         (0x88) /* Control Register 3 */
+#define UCR4         (0x8c) /* Control Register 4 */
+#define UFCR         (0x90) /* FIFO Control Register */
+#define USR1         (0x94) /* Status Register 1 */
+#define USR2         (0x98) /* Status Register 2 */
+#define IMX21_UTS    (0xb4) /* Test Register */
+
+#define URXD_ERR        BIT(14, UL) /* Error detect */
+#define URXD_RX_DATA    GENMASK(7, 0) /* Received data mask */
+
+#define UCR1_TRDYEN      BIT(13, UL) /* Transmitter ready interrupt enable */
+#define UCR1_RRDYEN      BIT(9, UL) /* Receiver ready interrupt enable */
+#define UCR1_RXDMAEN     BIT(8, UL) /* Receiver ready DMA enable */
+#define UCR1_TXMPTYEN    BIT(6, UL) /* Transmitter empty interrupt enable */
+#define UCR1_RTSDEN      BIT(5, UL) /* RTS delta interrupt enable */
+#define UCR1_TXDMAEN     BIT(3, UL) /* Transmitter ready DMA enable */
+#define UCR1_ATDMAEN     BIT(2, UL) /* Aging DMA Timer enable */
+#define UCR1_UARTEN      BIT(0, UL) /* UART enable */
+
+#define UCR2_ATEN    BIT(3, UL) /* Aging Timer Enable */
+#define UCR2_TXEN    BIT(2, UL) /* Transmitter enable */
+#define UCR2_RXEN    BIT(1, UL) /* Receiver enable */
+
+#define UCR4_TCEN    BIT(3, UL) /* Transmit complete interrupt enable */
+#define UCR4_DREN    BIT(0, UL) /* Receive data ready interrupt enable */
+
+#define UFCR_TXTL_SHF    (10) /* Transmitter trigger level shift */
+#define UFCR_RFDIV       GENMASK(9, 7) /* Reference frequency divider mask */
+#define UFCR_DCEDTE      BIT(6, UL) /* DCE/DTE mode select */
+
+#define USR1_PARITYERR    BIT(15, UL) /* Parity error interrupt flag */
+#define USR1_TRDY         BIT(13, UL) /* Transmitter ready interrupt/DMA flag */
+#define USR1_FRAMERR      BIT(10, UL) /* Frame error interrupt flag */
+#define USR1_RRDY         BIT(9, UL) /* Receiver ready interrupt/DMA flag */
+#define USR1_AGTIM        BIT(8, UL) /* Aging timer interrupt flag */
+
+#define USR2_TXDC         BIT(3, UL) /* Transmitter complete */
+#define USR2_BRCD         BIT(2, UL) /* Break condition detected */
+#define USR2_ORE          BIT(1, UL) /* Overrun error */
+#define USR2_RDR          BIT(0, UL) /* Receive data ready */
+
+#define UTS_TXEMPTY    BIT(6, UL) /* TxFIFO empty */
+#define UTS_TXFULL     BIT(4, UL) /* TxFIFO full */
+
+#define TXTL_DEFAULT    (2)
+#define RXTL_DEFAULT    (8)
+
+#define TX_FIFO_SIZE    32
+
+#endif /* __ASM_ARM_IMX_UART_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.34.1


