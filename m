Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157C92C0810
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 14:14:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34239.65141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBg9-00061L-8G; Mon, 23 Nov 2020 13:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34239.65141; Mon, 23 Nov 2020 13:14:49 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBg9-00060r-4C; Mon, 23 Nov 2020 13:14:49 +0000
Received: by outflank-mailman (input) for mailman id 34239;
 Mon, 23 Nov 2020 13:14:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khBg7-00060b-4u
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:14:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbc8f054-9cab-4c43-bad8-eeee34dc9f79;
 Mon, 23 Nov 2020 13:14:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 52413AC2E;
 Mon, 23 Nov 2020 13:14:45 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khBg7-00060b-4u
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:14:47 +0000
X-Inumbo-ID: cbc8f054-9cab-4c43-bad8-eeee34dc9f79
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cbc8f054-9cab-4c43-bad8-eeee34dc9f79;
	Mon, 23 Nov 2020 13:14:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606137285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0FIY0qtw5BehydKHuoFVwmLca+rCcxPomo1pnRTPLJA=;
	b=QtQ5S0xqRADBewNZa7h9fQAWbDDvtAy0n4cVMh+OxqP+KdQygoyQtjSNejEggxFLqaAomz
	eh/f+I0OdteFxBx7vdLg7e2S6zbB0qy39KB2G8ir9r3VxLttL7cpGQRR22fePEhgnE1JgG
	OmnL9HtpRRq11343RcRD8LN1DcIN2Nk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 52413AC2E;
	Mon, 23 Nov 2020 13:14:45 +0000 (UTC)
Subject: [PATCH v2 2/3] ns16550: "com<N>=" command line options are
 x86-specific
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
References: <96115b2b-c104-e566-2368-6a2439d2c988@suse.com>
Message-ID: <bfa07fc2-9151-402f-3b73-dedf8280cb66@suse.com>
Date: Mon, 23 Nov 2020 14:14:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <96115b2b-c104-e566-2368-6a2439d2c988@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Pure code motion (plus the addition of "#ifdef CONFIG_X86); no
functional change intended.

Reported-by: Julien Grall <julien@xen.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base over new earlier patch.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -318,8 +318,8 @@ Interrupts.  Specifying zero disables CM
 Flag to indicate whether to probe for a CMOS Real Time Clock irrespective of
 ACPI indicating none to be there.
 
-### com1
-### com2
+### com1 (x86)
+### com2 (x86)
 > `= <baud>[/<base-baud>][,[DPS][,[<io-base>|pci|amt][,[<irq>|msi][,[<port-bdf>][,[<bridge-bdf>]]]]]]`
 
 Both option `com1` and `com2` follow the same format.
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -31,38 +31,6 @@
 #include <asm/fixmap.h>
 #endif
 
-/*
- * Configure serial port with a string:
- *   <baud>[/<base_baud>][,DPS[,<io-base>[,<irq>[,<port-bdf>[,<bridge-bdf>]]]]].
- * The tail of the string can be omitted if platform defaults are sufficient.
- * If the baud rate is pre-configured, perhaps by a bootloader, then 'auto'
- * can be specified in place of a numeric baud rate. Polled mode is specified
- * by requesting irq 0.
- */
-static char __initdata opt_com1[128] = "";
-static char __initdata opt_com2[128] = "";
-string_param("com1", opt_com1);
-string_param("com2", opt_com2);
-
-enum serial_param_type {
-    baud,
-    clock_hz,
-    data_bits,
-    io_base,
-    irq,
-    parity,
-    reg_shift,
-    reg_width,
-    stop_bits,
-#ifdef CONFIG_HAS_PCI
-    bridge_bdf,
-    device,
-    port_bdf,
-#endif
-    /* List all parameters before this line. */
-    num_serial_params
-};
-
 static struct ns16550 {
     int baud, clock_hz, data_bits, parity, stop_bits, fifo_size, irq;
     u64 io_base;   /* I/O port or memory-mapped I/O address. */
@@ -98,32 +66,6 @@ static struct ns16550 {
 #endif
 } ns16550_com[2] = { { 0 } };
 
-struct serial_param_var {
-    char name[12];
-    enum serial_param_type type;
-};
-
-/*
- * Enum struct keeping a table of all accepted parameter names for parsing
- * com_console_options for serial port com1 and com2.
- */
-static const struct serial_param_var __initconst sp_vars[] = {
-    {"baud", baud},
-    {"clock-hz", clock_hz},
-    {"data-bits", data_bits},
-    {"io-base", io_base},
-    {"irq", irq},
-    {"parity", parity},
-    {"reg-shift", reg_shift},
-    {"reg-width", reg_width},
-    {"stop-bits", stop_bits},
-#ifdef CONFIG_HAS_PCI
-    {"bridge", bridge_bdf},
-    {"dev", device},
-    {"port", port_bdf},
-#endif
-};
-
 #ifdef CONFIG_HAS_PCI
 struct ns16550_config {
     u16 vendor_id;
@@ -674,6 +616,19 @@ static struct uart_driver __read_mostly
 #endif
 };
 
+static void ns16550_init_common(struct ns16550 *uart)
+{
+    uart->clock_hz  = UART_CLOCK_HZ;
+
+    /* Default is no transmit FIFO. */
+    uart->fifo_size = 1;
+
+    /* Default lsr_mask = UART_LSR_THRE */
+    uart->lsr_mask  = UART_LSR_THRE;
+}
+
+#ifdef CONFIG_X86
+
 static int __init parse_parity_char(int c)
 {
     switch ( c )
@@ -1217,6 +1172,64 @@ pci_uart_config(struct ns16550 *uart, bo
 #endif /* CONFIG_HAS_PCI */
 
 /*
+ * Configure serial port with a string:
+ *   <baud>[/<base_baud>][,DPS[,<io-base>[,<irq>[,<port-bdf>[,<bridge-bdf>]]]]].
+ * The tail of the string can be omitted if platform defaults are sufficient.
+ * If the baud rate is pre-configured, perhaps by a bootloader, then 'auto'
+ * can be specified in place of a numeric baud rate. Polled mode is specified
+ * by requesting irq 0.
+ */
+static char __initdata opt_com1[128] = "";
+static char __initdata opt_com2[128] = "";
+string_param("com1", opt_com1);
+string_param("com2", opt_com2);
+
+enum serial_param_type {
+    baud,
+    clock_hz,
+    data_bits,
+    io_base,
+    irq,
+    parity,
+    reg_shift,
+    reg_width,
+    stop_bits,
+#ifdef CONFIG_HAS_PCI
+    bridge_bdf,
+    device,
+    port_bdf,
+#endif
+    /* List all parameters before this line. */
+    num_serial_params
+};
+
+struct serial_param_var {
+    char name[12];
+    enum serial_param_type type;
+};
+
+/*
+ * Enum struct keeping a table of all accepted parameter names for parsing
+ * com_console_options for serial port com1 and com2.
+ */
+static const struct serial_param_var __initconst sp_vars[] = {
+    {"baud", baud},
+    {"clock-hz", clock_hz},
+    {"data-bits", data_bits},
+    {"io-base", io_base},
+    {"irq", irq},
+    {"parity", parity},
+    {"reg-shift", reg_shift},
+    {"reg-width", reg_width},
+    {"stop-bits", stop_bits},
+#ifdef CONFIG_HAS_PCI
+    {"bridge", bridge_bdf},
+    {"dev", device},
+    {"port", port_bdf},
+#endif
+};
+
+/*
  * Used to parse name value pairs and return which value it is along with
  * pointer for the extracted value.
  */
@@ -1504,17 +1517,6 @@ static void __init ns16550_parse_port_co
     serial_register_uart(uart - ns16550_com, &ns16550_driver, uart);
 }
 
-static void ns16550_init_common(struct ns16550 *uart)
-{
-    uart->clock_hz  = UART_CLOCK_HZ;
-
-    /* Default is no transmit FIFO. */
-    uart->fifo_size = 1;
-
-    /* Default lsr_mask = UART_LSR_THRE */
-    uart->lsr_mask  = UART_LSR_THRE;
-}
-
 void __init ns16550_init(int index, struct ns16550_defaults *defaults)
 {
     struct ns16550 *uart;
@@ -1541,6 +1543,8 @@ void __init ns16550_init(int index, stru
     ns16550_parse_port_config(uart, (index == 0) ? opt_com1 : opt_com2);
 }
 
+#endif /* CONFIG_X86 */
+
 #ifdef CONFIG_HAS_DEVICE_TREE
 static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
                                        const void *data)


