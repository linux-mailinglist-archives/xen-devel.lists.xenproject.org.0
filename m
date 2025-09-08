Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34B5B49B98
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 23:12:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115545.1462185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9j-0001uB-CY; Mon, 08 Sep 2025 21:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115545.1462185; Mon, 08 Sep 2025 21:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9i-0001ke-MO; Mon, 08 Sep 2025 21:12:06 +0000
Received: by outflank-mailman (input) for mailman id 1115545;
 Mon, 08 Sep 2025 21:12:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvj9g-0001J0-Dc
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 21:12:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9g-000FUS-0K;
 Mon, 08 Sep 2025 21:12:04 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9g-000gNA-0Y;
 Mon, 08 Sep 2025 21:12:04 +0000
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
	bh=jOrpkPK6Y2sHbIx1Zg9cP39ItjKVIpi7DD14BHDTv7c=; b=Lfpk1ztSq/H6d4MF6OefdVvZPK
	w0S23FSr2I7VTRlJ3WqXyhnrHSQi6Wi0Y/eYi7ID25udDhzcaU1A1ii4O4KYNs1HreBVQL10atV0S
	RVOISIqsZ1fyb1yANVnZij9IYm/AxoGDn1JaMyvOvMfocfx3+pwVU04CBFB9HkNw0QBQ=;
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
Subject: [PATCH v7 11/16] emul/ns16x50: implement FCR register (write-only)
Date: Mon,  8 Sep 2025 14:11:44 -0700
Message-ID: <20250908211149.279143-12-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908211149.279143-1-dmukhin@ford.com>
References: <20250908211149.279143-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add emulation logic for FCR register.

Note, that does not hook FIFO interrupt moderation to the FIFO management
code for simplicity.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v6:
- dropped UART_IIR_THR handling from UART_FCR_CLTX case
---
 xen/common/emul/vuart/ns16x50.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 137ce08f4e1d..a92df6923aa5 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -374,6 +374,33 @@ static int ns16x50_io_write8(
             regs[UART_IER] = val & UART_IER_MASK;
             break;
 
+        case UART_FCR: /* WO */
+            if ( val & UART_FCR_RSRVD0 )
+                ns16x50_warn(vdev, "FCR: attempt to set reserved bit: %x\n",
+                             UART_FCR_RSRVD0);
+
+            if ( val & UART_FCR_RSRVD1 )
+                ns16x50_warn(vdev, "FCR: attempt to set reserved bit: %x\n",
+                             UART_FCR_RSRVD1);
+
+            if ( val & UART_FCR_CLRX )
+            {
+                ns16x50_fifo_rx_reset(vdev);
+                regs[UART_LSR] &= ~UART_LSR_DR;
+            }
+
+            if ( val & UART_FCR_CLTX )
+                ns16x50_fifo_tx_reset(vdev);
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


