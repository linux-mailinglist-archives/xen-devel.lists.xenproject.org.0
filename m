Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09C37EEDA5
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 09:41:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634878.990452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3uP9-00052V-Ku; Fri, 17 Nov 2023 08:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634878.990452; Fri, 17 Nov 2023 08:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3uP9-0004vL-GQ; Fri, 17 Nov 2023 08:40:47 +0000
Received: by outflank-mailman (input) for mailman id 634878;
 Fri, 17 Nov 2023 08:40:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Lb0=G6=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r3uP8-0004ds-CP
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 08:40:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 000cbb6b-8525-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 09:40:45 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.163.77.7])
 by support.bugseng.com (Postfix) with ESMTPSA id 0BC604EE0C87;
 Fri, 17 Nov 2023 09:40:43 +0100 (CET)
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
X-Inumbo-ID: 000cbb6b-8525-11ee-98dc-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/5] xen/serial: address violations of MISRA C:2012 Rule 8.2
Date: Fri, 17 Nov 2023 09:40:06 +0100
Message-Id: <9fe7d6b526fef112dab314cf951662583dcbb40d.1700209834.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700209834.git.federico.serafini@bugseng.com>
References: <cover.1700209834.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/serial.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index f0aff7ea76..fc3b4883a2 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -15,7 +15,7 @@
 struct cpu_user_regs;
 
 /* Register a character-receive hook on the specified COM port. */
-typedef void (*serial_rx_fn)(char, struct cpu_user_regs *);
+typedef void (*serial_rx_fn)(char c, struct cpu_user_regs *regs);
 void serial_set_rx_handler(int handle, serial_rx_fn fn);
 
 /* Number of characters we buffer for a polling receiver. */
@@ -63,31 +63,31 @@ struct serial_port {
 
 struct uart_driver {
     /* Driver initialisation (pre- and post-IRQ subsystem setup). */
-    void (*init_preirq)(struct serial_port *);
-    void (*init_irq)(struct serial_port *);
-    void (*init_postirq)(struct serial_port *);
+    void (*init_preirq)(struct serial_port *port);
+    void (*init_irq)(struct serial_port *port);
+    void (*init_postirq)(struct serial_port *port);
     /* Hook to clean up after Xen bootstrap (before domain 0 runs). */
-    void (*endboot)(struct serial_port *);
+    void (*endboot)(struct serial_port *port);
     /* Driver suspend/resume. */
-    void (*suspend)(struct serial_port *);
-    void (*resume)(struct serial_port *);
+    void (*suspend)(struct serial_port *port);
+    void (*resume)(struct serial_port *port);
     /* Return number of characters the port can hold for transmit,
      * or -EIO if port is inaccesible */
-    int (*tx_ready)(struct serial_port *);
+    int (*tx_ready)(struct serial_port *port);
     /* Put a character onto the serial line. */
-    void (*putc)(struct serial_port *, char);
+    void (*putc)(struct serial_port *port, char c);
     /* Flush accumulated characters. */
-    void (*flush)(struct serial_port *);
+    void (*flush)(struct serial_port *port);
     /* Get a character from the serial line: returns 0 if none available. */
-    int  (*getc)(struct serial_port *, char *);
+    int  (*getc)(struct serial_port *port, char *pc);
     /* Get IRQ number for this port's serial line: returns -1 if none. */
-    int  (*irq)(struct serial_port *);
+    int  (*irq)(struct serial_port *port);
     /* Unmask TX interrupt */
-    void  (*start_tx)(struct serial_port *);
+    void  (*start_tx)(struct serial_port *port);
     /* Mask TX interrupt */
-    void  (*stop_tx)(struct serial_port *);
+    void  (*stop_tx)(struct serial_port *port);
     /* Get serial information */
-    const struct vuart_info *(*vuart_info)(struct serial_port *);
+    const struct vuart_info *(*vuart_info)(struct serial_port *port);
 };
 
 /* 'Serial handles' are composed from the following fields. */
-- 
2.34.1


