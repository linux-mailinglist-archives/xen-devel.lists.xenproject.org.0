Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB202C4765
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 19:17:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37955.70580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khzLg-0001an-R3; Wed, 25 Nov 2020 18:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37955.70580; Wed, 25 Nov 2020 18:17:00 +0000
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
	id 1khzLg-0001Zv-Ky; Wed, 25 Nov 2020 18:17:00 +0000
Received: by outflank-mailman (input) for mailman id 37955;
 Wed, 25 Nov 2020 18:16:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqAN=E7=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1khzLe-0001Oz-9f
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 18:16:58 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8db06e9a-3041-4f8a-a772-db9e0c6eee0a;
 Wed, 25 Nov 2020 18:16:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDFEB11D4;
 Wed, 25 Nov 2020 10:16:50 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 715AE3F23F;
 Wed, 25 Nov 2020 10:16:49 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MqAN=E7=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1khzLe-0001Oz-9f
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 18:16:58 +0000
X-Inumbo-ID: 8db06e9a-3041-4f8a-a772-db9e0c6eee0a
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 8db06e9a-3041-4f8a-a772-db9e0c6eee0a;
	Wed, 25 Nov 2020 18:16:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDFEB11D4;
	Wed, 25 Nov 2020 10:16:50 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown [10.58.246.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 715AE3F23F;
	Wed, 25 Nov 2020 10:16:49 -0800 (PST)
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 3/3] ns16550: Gate all PCI code with CONFIG_X86
Date: Wed, 25 Nov 2020 18:16:04 +0000
Message-Id: <6d64bb35a6ce247faaa3df2ebae27b6bfa1d969e.1606326929.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606326929.git.rahul.singh@arm.com>
References: <cover.1606326929.git.rahul.singh@arm.com>
In-Reply-To: <cover.1606326929.git.rahul.singh@arm.com>
References: <cover.1606326929.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The NS16550 driver is assuming that NS16550 PCI card are usable if the
architecture supports PCI (i.e. CONFIG_HAS_PCI=y). However, the code is
very x86 focus and will fail to build on Arm (/!\ it is not all the
errors):

ns16550.c: In function ‘ns16550_init_irq’:
ns16550.c:726:21: error: implicit declaration of function ‘create_irq’;
did you mean ‘release_irq’? [-Werror=implicit-function-declaration]
          uart->irq = create_irq(0, false);
                      ^~~~~~~~~~
                      release_irq
ns16550.c:726:21: error: nested extern declaration of ‘create_irq’
[-Werror=nested-externs]
ns16550.c: In function ‘ns16550_init_postirq’:
ns16550.c:768:33: error: ‘mmio_ro_ranges’ undeclared (first use in this
function); did you mean ‘mmio_handler’?
               rangeset_add_range(mmio_ro_ranges, uart->io_base,
                                  ^~~~~~~~~~~~~~
                                  mmio_handler
ns16550.c:768:33: note: each undeclared identifier is reported only once
for each function it appears in
ns16550.c:780:20: error: variable ‘msi’ has initializer but incomplete
type
              struct msi_info msi = {
                     ^~~~~~~~

Enabling support for NS16550 PCI card on Arm would require more plumbing
in addition to fixing the compilation error.

Arm systems tend to have platform UART available such as NS16550, PL011.
So there are limited reasons to get NS16550 PCI support for now on Arm.

Guard all remaining PCI code that is not under x86 flag with CONFIG_X86.

No functional change intended.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---

Changes in v4:
- As per the discussion guard all remaining PCI code with CONFIG_X86

---
 xen/drivers/char/ns16550.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 9235d854fe..26e601857a 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -16,7 +16,7 @@
 #include <xen/timer.h>
 #include <xen/serial.h>
 #include <xen/iocap.h>
-#ifdef CONFIG_HAS_PCI
+#if defined(CONFIG_X86) && defined(CONFIG_HAS_PCI)
 #include <xen/pci.h>
 #include <xen/pci_regs.h>
 #include <xen/pci_ids.h>
@@ -51,7 +51,7 @@ static struct ns16550 {
     unsigned int timeout_ms;
     bool_t intr_works;
     bool_t dw_usr_bsy;
-#ifdef CONFIG_HAS_PCI
+#if defined(CONFIG_X86) && defined(CONFIG_HAS_PCI)
     /* PCI card parameters. */
     bool_t pb_bdf_enable;   /* if =1, pb-bdf effective, port behind bridge */
     bool_t ps_bdf_enable;   /* if =1, ps_bdf effective, port on pci card */
@@ -66,7 +66,7 @@ static struct ns16550 {
 #endif
 } ns16550_com[2] = { { 0 } };
 
-#ifdef CONFIG_HAS_PCI
+#if defined(CONFIG_X86) && defined(CONFIG_HAS_PCI)
 struct ns16550_config {
     u16 vendor_id;
     u16 dev_id;
@@ -256,7 +256,7 @@ static int ns16550_getc(struct serial_port *port, char *pc)
 
 static void pci_serial_early_init(struct ns16550 *uart)
 {
-#ifdef CONFIG_HAS_PCI
+#if defined(CONFIG_X86) && defined(CONFIG_HAS_PCI)
     if ( !uart->ps_bdf_enable || uart->io_base >= 0x10000 )
         return;
 
@@ -355,7 +355,7 @@ static void __init ns16550_init_preirq(struct serial_port *port)
 
 static void __init ns16550_init_irq(struct serial_port *port)
 {
-#ifdef CONFIG_HAS_PCI
+#if defined(CONFIG_X86) && defined(CONFIG_HAS_PCI)
     struct ns16550 *uart = port->uart;
 
     if ( uart->msi )
@@ -397,7 +397,7 @@ static void __init ns16550_init_postirq(struct serial_port *port)
     uart->timeout_ms = max_t(
         unsigned int, 1, (bits * uart->fifo_size * 1000) / uart->baud);
 
-#ifdef CONFIG_HAS_PCI
+#if defined(CONFIG_X86) && defined(CONFIG_HAS_PCI)
     if ( uart->bar || uart->ps_bdf_enable )
     {
         if ( uart->param && uart->param->mmio &&
@@ -477,7 +477,7 @@ static void ns16550_suspend(struct serial_port *port)
 
     stop_timer(&uart->timer);
 
-#ifdef CONFIG_HAS_PCI
+#if defined(CONFIG_X86) && defined(CONFIG_HAS_PCI)
     if ( uart->bar )
        uart->cr = pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
                                   uart->ps_bdf[2]), PCI_COMMAND);
@@ -486,7 +486,7 @@ static void ns16550_suspend(struct serial_port *port)
 
 static void _ns16550_resume(struct serial_port *port)
 {
-#ifdef CONFIG_HAS_PCI
+#if defined(CONFIG_X86) && defined(CONFIG_HAS_PCI)
     struct ns16550 *uart = port->uart;
 
     if ( uart->bar )
-- 
2.17.1


