Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C483B46729
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 01:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112641.1460932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufq9-0003wW-5w; Fri, 05 Sep 2025 23:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112641.1460932; Fri, 05 Sep 2025 23:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufq8-0003rI-Tm; Fri, 05 Sep 2025 23:27:32 +0000
Received: by outflank-mailman (input) for mailman id 1112641;
 Fri, 05 Sep 2025 23:27:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uufq7-0003Va-3X
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 23:27:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufq6-008ACK-1u;
 Fri, 05 Sep 2025 23:27:30 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufq6-0005DU-1r;
 Fri, 05 Sep 2025 23:27:30 +0000
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
	bh=wv/+ypHhGLMV6T5qoOflVazYUaQF2ZGJkFc9G2aHE+8=; b=IBQMlSmOQUHnzX6idaVqBKZYxe
	vZZNoMMLUOSwVsBnngL4NfcWCTtHchJWcT2QaVJ+zkj0My5S2qV1GXu3BN1xobXT7dEqIeV6hH8+1
	ZjsSzq1iZ/yUHCT5DSIt6G59tg70P3d4gF2pHZyJI5FF5fniix8kURhlOS+nnKTCGysU=;
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
Subject: [PATCH v6 11/15] emul/ns16x50: implement FCR register (write-only)
Date: Fri,  5 Sep 2025 16:27:10 -0700
Message-ID: <20250905232715.440758-12-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905232715.440758-1-dmukhin@ford.com>
References: <20250905232715.440758-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add emulation logic for FCR register.

Note, that does not hook FIFO interrupt moderation to the FIFO management
code for simplicity.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v5:
- fixed UART_FCR_CLRX and UART_FCR_CLTX handling
- Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-8-dmukhin@ford.com/
---
 xen/common/emul/vuart/ns16x50.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 987d4c06e23b..3fc1112709df 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -372,6 +372,36 @@ static int ns16x50_io_write8(
             regs[UART_IER] = val & UART_IER_MASK;
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
+            {
+                ns16x50_fifo_rx_reset(vdev);
+                regs[UART_LSR] &= ~UART_LSR_DR;
+            }
+
+            if ( val & UART_FCR_CLTX )
+            {
+                ns16x50_fifo_tx_reset(vdev);
+                regs[NS16X50_REGS_NUM + UART_IIR] |= UART_IIR_THR;
+            }
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
         case UART_LCR:
             regs[UART_LCR] = val;
             break;
-- 
2.51.0


