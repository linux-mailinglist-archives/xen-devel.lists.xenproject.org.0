Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFE28B795E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 16:28:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714936.1116341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1oT7-0007QG-0A; Tue, 30 Apr 2024 14:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714936.1116341; Tue, 30 Apr 2024 14:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1oT6-0007Nx-Tn; Tue, 30 Apr 2024 14:28:28 +0000
Received: by outflank-mailman (input) for mailman id 714936;
 Tue, 30 Apr 2024 14:28:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BF+G=MD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s1oT5-00072Z-4B
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 14:28:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7a5dfa1-06fd-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 16:28:25 +0200 (CEST)
Received: from nico.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 9FF444EE0753;
 Tue, 30 Apr 2024 16:28:23 +0200 (CEST)
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
X-Inumbo-ID: e7a5dfa1-06fd-11ef-b4bb-af5377834399
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2 1/3] drivers: char: address violation of MISRA C Rule 20.7
Date: Tue, 30 Apr 2024 16:28:14 +0200
Message-Id: <3ae8aa13a5562440cf60e4b30f713e5b2f73c577.1714487169.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714487169.git.nicola.vetrini@bugseng.com>
References: <cover.1714487169.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional chage.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- drop excess parentheses from val parameter.
---
 xen/drivers/char/omap-uart.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
index 03b5b66e7acb..e0128225f927 100644
--- a/xen/drivers/char/omap-uart.c
+++ b/xen/drivers/char/omap-uart.c
@@ -48,8 +48,9 @@
 /* System configuration register */
 #define UART_OMAP_SYSC_DEF_CONF   0x0d   /* autoidle mode, wakeup is enabled */
 
-#define omap_read(uart, off)       readl((uart)->regs + (off<<REG_SHIFT))
-#define omap_write(uart, off, val) writel((val), (uart)->regs + (off<<REG_SHIFT))
+#define omap_read(uart, off)       readl((uart)->regs + ((off) << REG_SHIFT))
+#define omap_write(uart, off, val) writel(val, (uart)->regs + \
+                                               ((off) << REG_SHIFT))
 
 static struct omap_uart {
     u32 baud, clock_hz, data_bits, parity, stop_bits, fifo_size;
-- 
2.34.1


