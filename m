Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BC68AEA54
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710792.1110278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHpb-0005xo-IK; Tue, 23 Apr 2024 15:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710792.1110278; Tue, 23 Apr 2024 15:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHpb-0005rp-C0; Tue, 23 Apr 2024 15:13:15 +0000
Received: by outflank-mailman (input) for mailman id 710792;
 Tue, 23 Apr 2024 15:13:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r5BF=L4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rzHpa-0004ry-JA
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:13:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0138d2f3-0184-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 17:13:14 +0200 (CEST)
Received: from nico.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 0286B4EE073F;
 Tue, 23 Apr 2024 17:13:10 +0200 (CEST)
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
X-Inumbo-ID: 0138d2f3-0184-11ef-909a-e314d9c70b13
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
Subject: [XEN PATCH 04/10] drivers: char: address violation of MISRA C Rule 20.7
Date: Tue, 23 Apr 2024 17:12:46 +0200
Message-Id: <a5e4472b91398b7f9e802ea82c8435fa8ad27066.1713885065.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713885065.git.nicola.vetrini@bugseng.com>
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
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
 xen/drivers/char/omap-uart.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
index 03b5b66e7acb..9e1abf306ace 100644
--- a/xen/drivers/char/omap-uart.c
+++ b/xen/drivers/char/omap-uart.c
@@ -48,8 +48,9 @@
 /* System configuration register */
 #define UART_OMAP_SYSC_DEF_CONF   0x0d   /* autoidle mode, wakeup is enabled */
 
-#define omap_read(uart, off)       readl((uart)->regs + (off<<REG_SHIFT))
-#define omap_write(uart, off, val) writel((val), (uart)->regs + (off<<REG_SHIFT))
+#define omap_read(uart, off)       readl((uart)->regs + ((off) << REG_SHIFT))
+#define omap_write(uart, off, val) writel((val), (uart)->regs + \
+                                                 ((off) << REG_SHIFT))
 
 static struct omap_uart {
     u32 baud, clock_hz, data_bits, parity, stop_bits, fifo_size;
-- 
2.34.1


