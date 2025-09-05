Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A93B46725
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 01:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112632.1460866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufq1-0002BV-V5; Fri, 05 Sep 2025 23:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112632.1460866; Fri, 05 Sep 2025 23:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufq1-00029Z-Ql; Fri, 05 Sep 2025 23:27:25 +0000
Received: by outflank-mailman (input) for mailman id 1112632;
 Fri, 05 Sep 2025 23:27:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uufpz-0001hz-GU
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 23:27:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufpy-008AAw-2t;
 Fri, 05 Sep 2025 23:27:23 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufpy-0005D2-2q;
 Fri, 05 Sep 2025 23:27:23 +0000
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
	bh=euQ/8vNf5GpufgF2TZgbk8vUuC32iTlLIUaYRtS1M14=; b=boyOdTz8V0yH9S5Ab4iNInZzSA
	CvM6uB7BqGhXl6uRwbofX+8i5Abqh/O+kx3PDbg5zVMPYdI/w7SXC1OXkHUnN+h49RX9LlFtdLwzJ
	6VCPJ5lmiF+XDvV7gOEc8zqLSEkQl5KLVeW9A8u/sR0Rq6wiPulswMuVKG/p3eikRi2A=;
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
Subject: [PATCH v6 04/15] emul/ns16x50: implement DLL/DLM registers
Date: Fri,  5 Sep 2025 16:27:03 -0700
Message-ID: <20250905232715.440758-5-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905232715.440758-1-dmukhin@ford.com>
References: <20250905232715.440758-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add DLL/DLM registers emulation.

DLL/DLM registers report hardcoded 115200 baud rate to the guest OS.

Add stub for ns16x50_dlab_get() helper.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v5:
- dropped ns16x50_dlab_get() hunk (moved to emulator stub)
- Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-5-dmukhin@ford.com/
---
 xen/common/emul/vuart/ns16x50.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 0462a961e785..7f479a5be4a2 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -97,8 +97,13 @@ static uint8_t ns16x50_dlab_get(const struct vuart_ns16x50 *vdev)
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
 
@@ -109,8 +114,16 @@ static int ns16x50_io_write8(
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
 
@@ -146,9 +159,13 @@ static int ns16x50_io_write(
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
@@ -163,6 +180,13 @@ static int ns16x50_io_read16(
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
@@ -280,12 +304,17 @@ out:
 
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


