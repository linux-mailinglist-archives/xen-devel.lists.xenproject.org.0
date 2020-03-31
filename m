Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E0B199389
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:35:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJEBa-0001MZ-VS; Tue, 31 Mar 2020 10:31:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I6p8=5Q=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jJEBZ-0001LQ-53
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:31:57 +0000
X-Inumbo-ID: d1aa006c-733a-11ea-b58d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1aa006c-733a-11ea-b58d-bc764e2007e4;
 Tue, 31 Mar 2020 10:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585650705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wQpJCnzMoRgzJpnbgfA1CHBstAlwYXGC9u9GZzIVVmQ=;
 b=hs2BC54o31gv5gLJn0TyXBnJLkoxByZQCfRqOy9ZenUS0710wW9y/KI+
 lZn2oA5HrSnxm6Nme7G0BYYPMBpWk8si4omuH7yd0M7iv5TMMFSmlpqP2
 qYTbl90hHkmsLYZuvJCEunRPsEbA+8r27HzWZ7E8SWVUZh4uqEJ41uHIl w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MSGSmPs3sYGlLB0PaYCu5K2FfYtM/L7Y1zJapIZGEUvAxPLOzU3z1C2XjFIfLaXLfMbViOphRD
 HFpK2W+jh7KnPdCBDQtLakIdbpAWG3JWtWLNcKPWQ6A0+Iy7bCb8t1k9hdX4Ted/ONBAMP7wRA
 /2xWFIQdL3pGh16FxUw7xublwYqoQOzauqaM1aYRjLtzl0mYLZNSPeytohXYuw/qf3O6fDgkcb
 dDrH70nUHLOUCaLpbBpq+2VqqBGNqGyeO0ivMaWvhUXV2Sg7mFWTGHdwMudBXh/lXkXh0oH8Ph
 vwg=
X-SBRS: 2.7
X-MesageID: 15575933
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="15575933"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v4 01/18] xen/arm: Rename all early printk macro
Date: Tue, 31 Mar 2020 11:30:45 +0100
Message-ID: <20200331103102.1105674-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200331103102.1105674-1-anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We are going to move the generation of the early printk macro into
Kconfig. This means all macro will be prefix with CONFIG_. We do that
ahead of the change.

We also take the opportunity to better name some variables, which are
used by only one driver and wouldn't make sens for other UART driver.
Thus,
    - EARLY_UART_REG_SHIFT became CONFIG_EARLY_UART_8250_REG_SHIFT
    - EARLY_PRINTK_VERSION_* became CONFIG_EARLY_UART_SCIF_VERSION_*

The other variables are change to have the prefix CONFIG_EARLY_UART_
when they change a parameter of the driver. So we have now:
    - CONFIG_EARLY_UART_BAUD_RATE
    - CONFIG_EARLY_UART_BASE_ADDRESS
    - CONFIG_EARLY_UART_INIT

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---

Notes:
    v4:
    - cleanup in head.S, removing extra () and space
    
    Patch v3 and early where in "xen/arm: Configure early printk via
    Kconfig" series.
    
    v3:
    - Revert the renaming of EARLY_PRINTK to CONFIG_EARLY_PRINTK in the
      makefiles, as this doesn't work well with user provided
      CONFIG_EARLY_PRINTK.
      This is done in the following patch instead.
    
    - rename CONFIG_EARLY_UART_BAUD_RATE to CONFIG_EARLY_UART_PL011_BAUD_RATE

 xen/arch/arm/Rules.mk              | 14 +++++++-------
 xen/arch/arm/arm32/debug-8250.inc  |  2 +-
 xen/arch/arm/arm32/debug-pl011.inc |  4 ++--
 xen/arch/arm/arm32/debug-scif.inc  |  4 ++--
 xen/arch/arm/arm32/debug.S         |  4 ++--
 xen/arch/arm/arm32/head.S          | 10 +++++-----
 xen/arch/arm/arm64/debug-8250.inc  |  4 ++--
 xen/arch/arm/arm64/debug-pl011.inc |  4 ++--
 xen/arch/arm/arm64/debug.S         |  4 ++--
 xen/arch/arm/arm64/head.S          | 10 +++++-----
 xen/include/asm-arm/early_printk.h |  2 +-
 11 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/xen/arch/arm/Rules.mk b/xen/arch/arm/Rules.mk
index 022a3a6f82ba..faa09ea111ec 100644
--- a/xen/arch/arm/Rules.mk
+++ b/xen/arch/arm/Rules.mk
@@ -66,9 +66,9 @@ endif
 endif
 ifeq ($(EARLY_PRINTK_INC),scif)
 ifneq ($(word 3,$(EARLY_PRINTK_CFG)),)
-CFLAGS-y += -DEARLY_PRINTK_VERSION_$(word 3,$(EARLY_PRINTK_CFG))
+CFLAGS-y += -DCONFIG_EARLY_UART_SCIF_VERSION_$(word 3,$(EARLY_PRINTK_CFG))
 else
-CFLAGS-y += -DEARLY_PRINTK_VERSION_NONE
+CFLAGS-y += -DCONFIG_EARLY_UART_SCIF_VERSION_NONE
 endif
 endif
 
@@ -77,11 +77,11 @@ EARLY_PRINTK := y
 endif
 
 CFLAGS-$(EARLY_PRINTK) += -DCONFIG_EARLY_PRINTK
-CFLAGS-$(EARLY_PRINTK_INIT_UART) += -DEARLY_PRINTK_INIT_UART
-CFLAGS-$(EARLY_PRINTK) += -DEARLY_PRINTK_INC=\"debug-$(EARLY_PRINTK_INC).inc\"
-CFLAGS-$(EARLY_PRINTK) += -DEARLY_PRINTK_BAUD=$(EARLY_PRINTK_BAUD)
-CFLAGS-$(EARLY_PRINTK) += -DEARLY_UART_BASE_ADDRESS=$(EARLY_UART_BASE_ADDRESS)
-CFLAGS-$(EARLY_PRINTK) += -DEARLY_UART_REG_SHIFT=$(EARLY_UART_REG_SHIFT)
+CFLAGS-$(EARLY_PRINTK_INIT_UART) += -DCONFIG_EARLY_UART_INIT
+CFLAGS-$(EARLY_PRINTK) += -DCONFIG_EARLY_PRINTK_INC=\"debug-$(EARLY_PRINTK_INC).inc\"
+CFLAGS-$(EARLY_PRINTK) += -DCONFIG_EARLY_UART_PL011_BAUD_RATE=$(EARLY_PRINTK_BAUD)
+CFLAGS-$(EARLY_PRINTK) += -DCONFIG_EARLY_UART_BASE_ADDRESS=$(EARLY_UART_BASE_ADDRESS)
+CFLAGS-$(EARLY_PRINTK) += -DCONFIG_EARLY_UART_8250_REG_SHIFT=$(EARLY_UART_REG_SHIFT)
 
 else # !CONFIG_DEBUG
 
diff --git a/xen/arch/arm/arm32/debug-8250.inc b/xen/arch/arm/arm32/debug-8250.inc
index 0759a27ee157..c47e8be4aaf3 100644
--- a/xen/arch/arm/arm32/debug-8250.inc
+++ b/xen/arch/arm/arm32/debug-8250.inc
@@ -23,7 +23,7 @@
  */
 .macro early_uart_ready rb rc
 1:
-        ldr     \rc, [\rb, #(UART_LSR << EARLY_UART_REG_SHIFT)] /* Read LSR */
+        ldr     \rc, [\rb, #(UART_LSR << CONFIG_EARLY_UART_8250_REG_SHIFT)] /* Read LSR */
         tst     \rc, #UART_LSR_THRE     /* Check Xmit holding register flag */
         beq     1b                         /* Wait for the UART to be ready */
 .endm
diff --git a/xen/arch/arm/arm32/debug-pl011.inc b/xen/arch/arm/arm32/debug-pl011.inc
index ec462eabab5c..214f68dc95bd 100644
--- a/xen/arch/arm/arm32/debug-pl011.inc
+++ b/xen/arch/arm/arm32/debug-pl011.inc
@@ -25,9 +25,9 @@
  * rd: scratch register 2 (unused here)
  */
 .macro early_uart_init rb, rc, rd
-        mov   \rc, #(7372800 / EARLY_PRINTK_BAUD % 16)
+        mov   \rc, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
         str   \rc, [\rb, #FBRD]     /* -> UARTFBRD (Baud divisor fraction) */
-        mov   \rc, #(7372800 / EARLY_PRINTK_BAUD / 16)
+        mov   \rc, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
         str   \rc, [\rb, #IBRD]     /* -> UARTIBRD (Baud divisor integer) */
         mov   \rc, #0x60            /* 8n1 */
         str   \rc, [\rb, #LCR_H]     /* -> UARTLCR_H (Line control) */
diff --git a/xen/arch/arm/arm32/debug-scif.inc b/xen/arch/arm/arm32/debug-scif.inc
index 3f01c909c238..b2b82501e792 100644
--- a/xen/arch/arm/arm32/debug-scif.inc
+++ b/xen/arch/arm/arm32/debug-scif.inc
@@ -19,10 +19,10 @@
 
 #include <asm/scif-uart.h>
 
-#ifdef EARLY_PRINTK_VERSION_NONE
+#ifdef CONFIG_EARLY_UART_SCIF_VERSION_NONE
 #define STATUS_REG    SCIF_SCFSR
 #define TX_FIFO_REG   SCIF_SCFTDR
-#elif EARLY_PRINTK_VERSION_A
+#elif CONFIG_EARLY_UART_SCIF_VERSION_A
 #define STATUS_REG    SCIFA_SCASSR
 #define TX_FIFO_REG   SCIFA_SCAFTDR
 #endif
diff --git a/xen/arch/arm/arm32/debug.S b/xen/arch/arm/arm32/debug.S
index 1829b29915e0..e77c76d0debc 100644
--- a/xen/arch/arm/arm32/debug.S
+++ b/xen/arch/arm/arm32/debug.S
@@ -19,8 +19,8 @@
 
 #include <asm/early_printk.h>
 
-#ifdef EARLY_PRINTK_INC
-#include EARLY_PRINTK_INC
+#if defined (CONFIG_EARLY_PRINTK_INC)
+#include CONFIG_EARLY_PRINTK_INC
 #endif
 
 /*
diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index e9d356f05c2b..c404fa973e9b 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -36,8 +36,8 @@
 #define XEN_FIRST_SLOT      first_table_offset(XEN_VIRT_START)
 #define XEN_SECOND_SLOT     second_table_offset(XEN_VIRT_START)
 
-#if (defined (CONFIG_EARLY_PRINTK)) && (defined (EARLY_PRINTK_INC))
-#include EARLY_PRINTK_INC
+#if defined(CONFIG_EARLY_PRINTK) && defined(CONFIG_EARLY_PRINTK_INC)
+#include CONFIG_EARLY_PRINTK_INC
 #endif
 
 /*
@@ -223,7 +223,7 @@ GLOBAL(init_secondary)
 1:
 
 #ifdef CONFIG_EARLY_PRINTK
-        mov_w r11, EARLY_UART_BASE_ADDRESS   /* r11 := UART base address */
+        mov_w r11, CONFIG_EARLY_UART_BASE_ADDRESS   /* r11 := UART base address */
         PRINT("- CPU ")
         print_reg r7
         PRINT(" booting -\r\n")
@@ -706,8 +706,8 @@ ENTRY(switch_ttbr)
  * Clobbers r0 - r3
  */
 init_uart:
-        mov_w r11, EARLY_UART_BASE_ADDRESS
-#ifdef EARLY_PRINTK_INIT_UART
+        mov_w r11, CONFIG_EARLY_UART_BASE_ADDRESS
+#ifdef CONFIG_EARLY_UART_INIT
         early_uart_init r11, r1, r2
 #endif
         PRINT("- UART enabled -\r\n")
diff --git a/xen/arch/arm/arm64/debug-8250.inc b/xen/arch/arm/arm64/debug-8250.inc
index 53d6828bfafe..30ea13077e22 100644
--- a/xen/arch/arm/arm64/debug-8250.inc
+++ b/xen/arch/arm/arm64/debug-8250.inc
@@ -25,7 +25,7 @@
  */
 .macro early_uart_ready xb c
 1:
-       ldrb  w\c, [\xb, #UART_LSR << EARLY_UART_REG_SHIFT]
+       ldrb  w\c, [\xb, #UART_LSR << CONFIG_EARLY_UART_8250_REG_SHIFT]
        and w\c, w\c, #UART_LSR_THRE
        cmp w\c, #UART_LSR_THRE
        b.ne 1b
@@ -38,7 +38,7 @@
  */
 .macro early_uart_transmit xb wt
         /* UART_THR  transmit holding */
-        strb   \wt, [\xb, #UART_THR << EARLY_UART_REG_SHIFT]
+        strb   \wt, [\xb, #UART_THR << CONFIG_EARLY_UART_8250_REG_SHIFT]
 .endm
 
 /*
diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
index 569c3dfbcf47..385deff49b1b 100644
--- a/xen/arch/arm/arm64/debug-pl011.inc
+++ b/xen/arch/arm/arm64/debug-pl011.inc
@@ -24,9 +24,9 @@
  * c: scratch register number
  */
 .macro early_uart_init xb, c
-        mov   x\c, #(7372800 / EARLY_PRINTK_BAUD % 16)
+        mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
         strh  w\c, [\xb, #0x28]      /* -> UARTFBRD (Baud divisor fraction) */
-        mov   x\c, #(7372800 / EARLY_PRINTK_BAUD / 16)
+        mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
         strh  w\c, [\xb, #0x24]      /* -> UARTIBRD (Baud divisor integer) */
         mov   x\c, #0x60             /* 8n1 */
         str   w\c, [\xb, #0x2C]      /* -> UARTLCR_H (Line control) */
diff --git a/xen/arch/arm/arm64/debug.S b/xen/arch/arm/arm64/debug.S
index b7f53ac0519b..71cad9d762b2 100644
--- a/xen/arch/arm/arm64/debug.S
+++ b/xen/arch/arm/arm64/debug.S
@@ -19,8 +19,8 @@
 
 #include <asm/early_printk.h>
 
-#ifdef EARLY_PRINTK_INC
-#include EARLY_PRINTK_INC
+#ifdef CONFIG_EARLY_PRINTK_INC
+#include CONFIG_EARLY_PRINTK_INC
 #endif
 
 /*
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index e5015f93a2d8..5d44667bd89d 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -45,8 +45,8 @@
 #define __HEAD_FLAGS            ((__HEAD_FLAG_PAGE_SIZE << 1) | \
                                  (__HEAD_FLAG_PHYS_BASE << 3))
 
-#if (defined (CONFIG_EARLY_PRINTK)) && (defined (EARLY_PRINTK_INC))
-#include EARLY_PRINTK_INC
+#if defined(CONFIG_EARLY_PRINTK) && defined(CONFIG_EARLY_PRINTK_INC)
+#include CONFIG_EARLY_PRINTK_INC
 #endif
 
 /*
@@ -363,7 +363,7 @@ GLOBAL(init_secondary)
 1:
 
 #ifdef CONFIG_EARLY_PRINTK
-        ldr   x23, =EARLY_UART_BASE_ADDRESS /* x23 := UART base address */
+        ldr   x23, =CONFIG_EARLY_UART_BASE_ADDRESS /* x23 := UART base address */
         PRINT("- CPU ")
         print_reg x24
         PRINT(" booting -\r\n")
@@ -843,8 +843,8 @@ ENTRY(switch_ttbr)
  * Clobbers x0 - x1
  */
 init_uart:
-        ldr   x23, =EARLY_UART_BASE_ADDRESS
-#ifdef EARLY_PRINTK_INIT_UART
+        ldr   x23, =CONFIG_EARLY_UART_BASE_ADDRESS
+#ifdef CONFIG_EARLY_UART_INIT
         early_uart_init x23, 0
 #endif
         PRINT("- UART enabled -\r\n")
diff --git a/xen/include/asm-arm/early_printk.h b/xen/include/asm-arm/early_printk.h
index 078cf701dcb0..d5485decfa9f 100644
--- a/xen/include/asm-arm/early_printk.h
+++ b/xen/include/asm-arm/early_printk.h
@@ -15,7 +15,7 @@
 
 /* need to add the uart address offset in page to the fixmap address */
 #define EARLY_UART_VIRTUAL_ADDRESS \
-    (FIXMAP_ADDR(FIXMAP_CONSOLE) +(EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
+    (FIXMAP_ADDR(FIXMAP_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
 
 #endif /* !CONFIG_EARLY_PRINTK */
 
-- 
Anthony PERARD


