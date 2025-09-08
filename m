Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC36B49B99
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 23:12:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115537.1462116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9a-0008Ro-7S; Mon, 08 Sep 2025 21:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115537.1462116; Mon, 08 Sep 2025 21:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9a-0008QI-3b; Mon, 08 Sep 2025 21:11:58 +0000
Received: by outflank-mailman (input) for mailman id 1115537;
 Mon, 08 Sep 2025 21:11:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvj9Y-0008DO-Su
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 21:11:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9Y-000FSp-1Q;
 Mon, 08 Sep 2025 21:11:56 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9Y-000gKu-1d;
 Mon, 08 Sep 2025 21:11:56 +0000
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
	bh=NWRpmqJhOTOIY3zhSnhQ9LFHXgJeUqzoWYVvV58DwuQ=; b=QfQCzboiEv5kPwQ8hac1qgJUSu
	WVT/GvMWfIpHz9k78XZcH5ZjiWa0/w3fE0w+ifdBNX1vYlvmkYN8zxvgnmrnS2TiEmvpU/jAlGYK/
	b9CiyvuZljKoLIOkOO2Gpspcp9y58R1u42i8fEpj4L12/LRDZvmH5oK4A7FCJrLVpx8Q=;
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
Subject: [PATCH v7 04/16] emul/ns16x50: implement DLL/DLM registers
Date: Mon,  8 Sep 2025 14:11:37 -0700
Message-ID: <20250908211149.279143-5-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908211149.279143-1-dmukhin@ford.com>
References: <20250908211149.279143-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add DLL/DLM registers emulation.

DLL/DLM registers report hardcoded 115200 baud rate to the guest OS.

Add stub for ns16x50_dlab_get() helper.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v6:
- added default registers handling for non-DLL/DLM accesses
- used UINT8_MAX
---
 xen/common/emul/vuart/ns16x50.c | 47 +++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index a3bdf9f415ca..da8583a1dc93 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -96,8 +96,22 @@ static uint8_t ns16x50_dlab_get(const struct vuart_ns16x50 *vdev)
 static int ns16x50_io_write8(
     struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
 {
+    uint8_t *regs = vdev->regs;
+    uint8_t val = *data;
     int rc = 0;
 
+    if ( ns16x50_dlab_get(vdev) && (reg == UART_DLL || reg == UART_DLM) )
+        regs[NS16X50_REGS_NUM + reg] = val;
+    else
+    {
+        switch ( reg )
+        {
+        default:
+            rc = -EINVAL;
+            break;
+        }
+    }
+
     return rc;
 }
 
@@ -108,8 +122,16 @@ static int ns16x50_io_write8(
 static int ns16x50_io_write16(
     struct vuart_ns16x50 *vdev, uint32_t reg, uint16_t *data)
 {
+    uint16_t val = *data;
     int rc = -EINVAL;
 
+    if ( ns16x50_dlab_get(vdev) && reg == UART_DLL )
+    {
+        vdev->regs[NS16X50_REGS_NUM + UART_DLL] = val & UINT8_MAX;
+        vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (val >> 8) & UINT8_MAX;
+        rc = 0;
+    }
+
     return rc;
 }
 
@@ -145,9 +167,22 @@ static int ns16x50_io_write(
 static int ns16x50_io_read8(
     struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
 {
+    uint8_t *regs = vdev->regs;
     uint8_t val = UINT8_MAX;
     int rc = 0;
 
+    if ( ns16x50_dlab_get(vdev) && (reg == UART_DLL || reg == UART_DLM) )
+        val = regs[NS16X50_REGS_NUM + reg];
+    else
+    {
+        switch ( reg )
+        {
+        default:
+            rc = -EINVAL;
+            break;
+        }
+    }
+
     *data = val;
 
     return rc;
@@ -162,6 +197,13 @@ static int ns16x50_io_read16(
     uint16_t val = UINT16_MAX;
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
@@ -278,12 +320,17 @@ out:
 
 static int ns16x50_init(void *arg)
 {
+    const uint16_t divisor = (UART_CLOCK_HZ / 115200) >> 4;
     struct vuart_ns16x50 *vdev = arg;
     const struct vuart_info *info = vdev->info;
     struct domain *d = vdev->owner;
 
     ASSERT(vdev);
 
+    /* NB: report 115200 baud rate. */
+    vdev->regs[NS16X50_REGS_NUM + UART_DLL] = divisor & UINT8_MAX;
+    vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (divisor >> 8) & UINT8_MAX;
+
     register_portio_handler(d, info->base_addr, info->size, ns16x50_io_handle);
 
     return 0;
-- 
2.51.0


