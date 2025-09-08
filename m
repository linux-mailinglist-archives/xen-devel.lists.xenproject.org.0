Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B31B49B97
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 23:12:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115540.1462147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9d-0000mO-D5; Mon, 08 Sep 2025 21:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115540.1462147; Mon, 08 Sep 2025 21:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9d-0000ik-8X; Mon, 08 Sep 2025 21:12:01 +0000
Received: by outflank-mailman (input) for mailman id 1115540;
 Mon, 08 Sep 2025 21:12:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvj9c-0000Sw-23
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 21:12:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9b-000FTS-2Q;
 Mon, 08 Sep 2025 21:11:59 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9b-000gML-2e;
 Mon, 08 Sep 2025 21:11:59 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=zvzWLhOV/JuCu2mvge1tqyEd27KupA6wAEV4H8Ytz2o=; b=RC3FU9fvNVrQUef+qZ8kprTEBT
	hcpe1q7LW4fQYlQnGo+yjlbxuADdqEJrUYMEur6/Mng/Ic4GC7ZwJqULvMiQcfLqFPUIG4cYk7dfH
	3/9/uwNi57vf5TUGOA4M1s2iw0JHdsxn+ZeSA906NFtmb2/7B4/qnau6m/of+Q71YyOk=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v7 07/16] emul/ns16x50: implement LCR/LSR registers
Date: Mon,  8 Sep 2025 14:11:40 -0700
Message-ID: <20250908211149.279143-8-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908211149.279143-1-dmukhin@ford.com>
References: <20250908211149.279143-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add LCR/LSR registers implementation to the I/O port handler.

Add implementation of ns16x50_dlab_get() and ns16x50_iir_check_lsi().

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v6:
- n/a
---
 xen/common/emul/vuart/ns16x50.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 664d799ddaee..0831a576cd9e 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -87,12 +87,12 @@ struct vuart_ns16x50 {
 
 static uint8_t ns16x50_dlab_get(const struct vuart_ns16x50 *vdev)
 {
-    return 0;
+    return vdev->regs[UART_LCR] & UART_LCR_DLAB ? 1 : 0;
 }
 
 static bool cf_check ns16x50_iir_check_lsi(const struct vuart_ns16x50 *vdev)
 {
-    return false;
+    return vdev->regs[UART_LSR] & UART_LSR_MASK;
 }
 
 static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *vdev)
@@ -228,11 +228,16 @@ static int ns16x50_io_write8(
             regs[UART_IER] = val & UART_IER_MASK;
             break;
 
+        case UART_LCR:
+            regs[UART_LCR] = val;
+            break;
+
         /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
         case UART_SCR:
             regs[UART_SCR] = val;
             break;
 
+        case UART_LSR: /* RO */
         default:
             rc = -EINVAL;
             break;
@@ -314,6 +319,15 @@ static int ns16x50_io_read8(
             val = ns16x50_iir_get(vdev);
             break;
 
+        case UART_LCR:
+            val = regs[UART_LCR];
+            break;
+
+        case UART_LSR:
+            val = regs[UART_LSR] | UART_LSR_THRE | UART_LSR_TEMT;
+            regs[UART_LSR] = val & ~UART_LSR_MASK;
+            break;
+
         case UART_SCR:
             val = regs[UART_SCR];
             break;
-- 
2.51.0


