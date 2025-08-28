Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49704B3AEA0
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 01:54:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100176.1453770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urmRf-0004rx-Pk; Thu, 28 Aug 2025 23:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100176.1453770; Thu, 28 Aug 2025 23:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urmRf-0004ps-L3; Thu, 28 Aug 2025 23:54:19 +0000
Received: by outflank-mailman (input) for mailman id 1100176;
 Thu, 28 Aug 2025 23:54:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1urmRd-0004YW-Qn
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 23:54:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1urmRd-00B9tB-10;
 Thu, 28 Aug 2025 23:54:17 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1urmRd-006h8T-0w;
 Thu, 28 Aug 2025 23:54:17 +0000
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
	bh=q+he8jaHBIjbD+9QqSf5FgcmIDrC1ZycrhsuDoL3FxQ=; b=AG7aziCTfiGxQWQDFCMvMNfjEB
	MZfEATnT1aeu+2vq5b2FWDw7BjFv0Rsyib4suvcquzS1l7b68vAUbxWXw65KAoe4fUzsalV4QTXwm
	dqUc/Y4zC/3CUn0pETjqnIwojp5YfmplsMPyLhwViiZQ2PbW5Z4HAqvudmsXpNnUUl/A=;
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
Subject: [PATCH v5 04/15] emul/ns16x50: implement DLL/DLM registers
Date: Thu, 28 Aug 2025 16:53:58 -0700
Message-ID: <20250828235409.2835815-5-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828235409.2835815-1-dmukhin@ford.com>
References: <20250828235409.2835815-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add DLL/DLM registers emulation.

DLL/DLM registers report hardcoded 115200 baud rate to the guest OS.

Add stub for ns16x50_dlab_get() helper.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- new patch
---
 xen/common/emul/vuart/ns16x50.c | 36 ++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index f0479e1022fb..f9f307a4ad24 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -85,14 +85,24 @@ struct vuart_ns16x50 {
     spinlock_t lock;                    /* Protection */
 };
 
+static inline uint8_t cf_check ns16x50_dlab_get(const struct vuart_ns16x50 *vdev)
+{
+    return 0;
+}
+
 /*
  * Emulate 8-bit write access to ns16x50 register.
  */
 static int ns16x50_io_write8(
     struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
 {
+    uint8_t *regs = vdev->regs;
+    uint8_t val = *data;
     int rc = 0;
 
+    if ( ns16x50_dlab_get(vdev) && (reg == UART_DLL || reg == UART_DLM) )
+        regs[NS16X50_REGS_NUM + reg] = val;
+
     return rc;
 }
 
@@ -103,8 +113,16 @@ static int ns16x50_io_write8(
 static int ns16x50_io_write16(
     struct vuart_ns16x50 *vdev, uint32_t reg, uint16_t *data)
 {
+    uint16_t val = *data;
     int rc = -EINVAL;
 
+    if ( ns16x50_dlab_get(vdev) && reg == UART_DLL )
+    {
+        vdev->regs[NS16X50_REGS_NUM + UART_DLL] = val & 0xff;
+        vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (val >> 8) & 0xff;
+        rc = 0;
+    }
+
     return rc;
 }
 
@@ -140,9 +158,13 @@ static int ns16x50_io_write(
 static int ns16x50_io_read8(
     struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
 {
+    uint8_t *regs = vdev->regs;
     uint8_t val = 0xff;
     int rc = 0;
 
+    if ( ns16x50_dlab_get(vdev) && (reg == UART_DLL || reg == UART_DLM) )
+        val = regs[NS16X50_REGS_NUM + reg];
+
     *data = val;
 
     return rc;
@@ -157,6 +179,13 @@ static int ns16x50_io_read16(
     uint16_t val = 0xffff;
     int rc = -EINVAL;
 
+    if ( ns16x50_dlab_get(vdev) && reg == UART_DLL )
+    {
+        val = vdev->regs[NS16X50_REGS_NUM + UART_DLM] << 8 |
+              vdev->regs[NS16X50_REGS_NUM + UART_DLL];
+        rc = 0;
+    }
+
     *data = val;
 
     return rc;
@@ -237,7 +266,7 @@ static int cf_check ns16x50_io_handle(
         goto out;
     }
 
-    dlab = 0;
+    dlab = ns16x50_dlab_get(vdev);
     if ( reg >= NS16X50_REGS_NUM )
     {
         ns16x50_err(vdev, "%c io 0x%04x %d: DLAB=%d %02"PRIx32" 0x%08"PRIx32": not implemented\n",
@@ -274,12 +303,17 @@ out:
 
 static int ns16x50_init(void *arg)
 {
+    const uint16_t divisor = (UART_CLOCK_HZ / 115200) >> 4;
     struct vuart_ns16x50 *vdev = arg;
     const struct vuart_info *info = vdev->info;
     struct domain *d = vdev->owner;
 
     ASSERT(vdev);
 
+    /* NB: report 115200 baud rate. */
+    vdev->regs[NS16X50_REGS_NUM + UART_DLL] = divisor & 0xff;
+    vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (divisor >> 8) & 0xff;
+
     register_portio_handler(d, info->base_addr, info->size, ns16x50_io_handle);
 
     return 0;
-- 
2.51.0


