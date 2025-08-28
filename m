Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A72B3AEA4
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 01:54:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100179.1453800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urmRi-0005eV-Tz; Thu, 28 Aug 2025 23:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100179.1453800; Thu, 28 Aug 2025 23:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urmRi-0005ZM-LZ; Thu, 28 Aug 2025 23:54:22 +0000
Received: by outflank-mailman (input) for mailman id 1100179;
 Thu, 28 Aug 2025 23:54:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1urmRh-0005Hr-9z
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 23:54:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1urmRg-00B9tp-1W;
 Thu, 28 Aug 2025 23:54:20 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1urmRg-006h8f-1W;
 Thu, 28 Aug 2025 23:54:20 +0000
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
	bh=0Z4aoKd8azAcWKj2wK4QZPV/Vhzat9Cv97B7YdCWD3U=; b=eXjBgWzrVW14JNMT6B8gaC1wDT
	Omeqq1isWnIWwW4/CnK74gFSubvqZ8y7e73t70twrt9AuzWdZiGWBCDotndvlZYXW3vSIrF2X+zQN
	OJp8XuI5HWrSUUU/iwkYYIreVjFVYhO7nHpMQUy5UMnUPCzr6oS3wMAYUDsiX0dIfQ1A=;
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
Subject: [PATCH v5 07/15] emul/ns16x50: implement FCR register (write-only)
Date: Thu, 28 Aug 2025 16:54:01 -0700
Message-ID: <20250828235409.2835815-8-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828235409.2835815-1-dmukhin@ford.com>
References: <20250828235409.2835815-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add emulation logic for FCR register.

Note, that does not hooks FIFO interrupt moderation to the FIFO management
code.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- new patch
---
 xen/common/emul/vuart/ns16x50.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index efb2f4c6441c..65ca96dd8bd3 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -363,6 +363,30 @@ static int ns16x50_io_write8(
 
             break;
 
+        case UART_FCR: /* WO */
+            if ( val & UART_FCR_RESERVED0 )
+                ns16x50_warn(vdev, "FCR: attempt to set reserved bit: %x\n",
+                             UART_FCR_RESERVED0);
+
+            if ( val & UART_FCR_RESERVED1 )
+                ns16x50_warn(vdev, "FCR: attempt to set reserved bit: %x\n",
+                             UART_FCR_RESERVED1);
+
+            if ( val & UART_FCR_CLRX )
+                ns16x50_fifo_rx_reset(vdev);
+
+            if ( val & UART_FCR_CLTX )
+                ns16x50_fifo_tx_flush(vdev);
+
+            if ( val & UART_FCR_ENABLE )
+                val &= UART_FCR_ENABLE | UART_FCR_DMA | UART_FCR_TRG_MASK;
+            else
+                val = 0;
+
+            regs[UART_FCR] = val;
+
+            break;
+
         default:
             rc = -EINVAL;
             break;
-- 
2.51.0


