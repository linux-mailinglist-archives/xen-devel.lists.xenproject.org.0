Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BDEB3AEA8
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 01:54:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100180.1453812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urmRk-0005wz-Dq; Thu, 28 Aug 2025 23:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100180.1453812; Thu, 28 Aug 2025 23:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urmRk-0005sI-1m; Thu, 28 Aug 2025 23:54:24 +0000
Received: by outflank-mailman (input) for mailman id 1100180;
 Thu, 28 Aug 2025 23:54:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1urmRi-0005Wl-41
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 23:54:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1urmRh-00B9u0-1i;
 Thu, 28 Aug 2025 23:54:21 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1urmRh-006h8p-1i;
 Thu, 28 Aug 2025 23:54:21 +0000
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
	bh=URrCdASjRQ9Vdlu6Z9QVQa30dc5DA0baY3L6/nvVCms=; b=KcRT2ecfpvFix6byPMbgJM5kc0
	WVDwtP0I/3gVUsFeCY2nqxwC+X9amXlJCmQqHAjtbwJDKqGBjT2Z7SwHIUUtCLhRig4Ye37m19YnC
	55xx21uHLNSnMqJLOgbWNsSUjys/kdbuTtsKfO1YZZOpp285xVPodCAcA4dwNzqdNUc4=;
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
Subject: [PATCH v5 08/15] emul/ns16x50: implement LCR/LSR registers
Date: Thu, 28 Aug 2025 16:54:02 -0700
Message-ID: <20250828235409.2835815-9-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828235409.2835815-1-dmukhin@ford.com>
References: <20250828235409.2835815-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add LCR/LSR registers implementation to the I/O port handler.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- new patch
---
 xen/common/emul/vuart/ns16x50.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 65ca96dd8bd3..687a7ea2fabe 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -347,6 +347,9 @@ static int ns16x50_io_write8(
             else
                 ns16x50_fifo_tx_putchar(vdev, val);
 
+            if ( rc == -ENOSPC )
+                regs[UART_LSR] |= UART_LSR_OE;
+
             rc = 0;
 
             break;
@@ -387,6 +390,11 @@ static int ns16x50_io_write8(
 
             break;
 
+        case UART_LCR:
+            regs[UART_LCR] = val;
+            break;
+
+        case UART_LSR: /* RO */
         default:
             rc = -EINVAL;
             break;
@@ -460,6 +468,9 @@ static int ns16x50_io_read8(
         switch ( reg )
         {
         case UART_RBR:
+            /* NB: do not forget to clear overrun condition */
+            regs[UART_LSR] &= ~UART_LSR_OE;
+
             rc = ns16x50_fifo_rx_getchar(vdev);
             if ( rc >= 0 )
                 val = (uint8_t)rc;
@@ -480,6 +491,21 @@ static int ns16x50_io_read8(
 
             break;
 
+        case UART_LCR:
+            val = regs[UART_LCR];
+            break;
+
+        case UART_LSR:
+            val = regs[UART_LSR] | UART_LSR_THRE | UART_LSR_TEMT;
+            if ( ns16x50_fifo_rx_empty(vdev) )
+                val &= ~UART_LSR_DR;
+            else
+                val |= UART_LSR_DR;
+
+            regs[UART_LSR] = val & ~UART_LSR_MASK;
+
+            break;
+
         default:
             rc = -EINVAL;
             break;
-- 
2.51.0


