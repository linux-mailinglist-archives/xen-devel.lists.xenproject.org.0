Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2422C080F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 14:14:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34237.65129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBfp-0005vv-Uy; Mon, 23 Nov 2020 13:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34237.65129; Mon, 23 Nov 2020 13:14:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBfp-0005vW-R4; Mon, 23 Nov 2020 13:14:29 +0000
Received: by outflank-mailman (input) for mailman id 34237;
 Mon, 23 Nov 2020 13:14:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khBfo-0005vQ-Ne
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:14:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10ca4d60-cc42-42bd-b60e-3bbdded2d894;
 Mon, 23 Nov 2020 13:14:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2B26ACF1;
 Mon, 23 Nov 2020 13:14:25 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khBfo-0005vQ-Ne
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:14:28 +0000
X-Inumbo-ID: 10ca4d60-cc42-42bd-b60e-3bbdded2d894
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 10ca4d60-cc42-42bd-b60e-3bbdded2d894;
	Mon, 23 Nov 2020 13:14:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606137265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FtIXZJ0HqJDtlmSLnhGEm6Ve8l/UI7mpJ78L1OTqVUg=;
	b=s1fMI/4aztigtUGG4QzR3gKdcGIQcvh0VSFkf6h4rMQXg08FBgPEuyrrT5FnmF824zZgUK
	nhLwIwjDbWaauGlhTMrUmkCWjYCOQGunViN8Ta/F+Zy77a/THkgemcB8fHITfqt+1LMu1p
	JRY9EDoVLUTf789YrpLGjXrUvv43neU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B2B26ACF1;
	Mon, 23 Nov 2020 13:14:25 +0000 (UTC)
Subject: [PATCH v2 1/3] ns16550: move PCI arrays next to the function using
 them
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
References: <96115b2b-c104-e566-2368-6a2439d2c988@suse.com>
Message-ID: <b47b5557-ad67-5bf4-45ce-c305ee5da977@suse.com>
Date: Mon, 23 Nov 2020 14:14:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <96115b2b-c104-e566-2368-6a2439d2c988@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Pure code motion; no functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -153,312 +153,6 @@ struct ns16550_config_param {
     unsigned int uart_offset;
     unsigned int first_offset;
 };
-
-/*
- * Create lookup tables for specific devices. It is assumed that if
- * the device found is MMIO, then you have indexed it here. Else, the
- * driver does nothing for MMIO based devices.
- */
-static const struct ns16550_config_param __initconst uart_param[] = {
-    [param_default] = {
-        .reg_width = 1,
-        .lsr_mask = UART_LSR_THRE,
-        .max_ports = 1,
-    },
-    [param_trumanage] = {
-        .reg_shift = 2,
-        .reg_width = 1,
-        .fifo_size = 16,
-        .lsr_mask = (UART_LSR_THRE | UART_LSR_TEMT),
-        .mmio = 1,
-        .max_ports = 1,
-    },
-    [param_oxford] = {
-        .base_baud = 4000000,
-        .uart_offset = 0x200,
-        .first_offset = 0x1000,
-        .reg_width = 1,
-        .fifo_size = 16,
-        .lsr_mask = UART_LSR_THRE,
-        .mmio = 1,
-        .max_ports = 1, /* It can do more, but we would need more custom code.*/
-    },
-    [param_oxford_2port] = {
-        .base_baud = 4000000,
-        .uart_offset = 0x200,
-        .first_offset = 0x1000,
-        .reg_width = 1,
-        .fifo_size = 16,
-        .lsr_mask = UART_LSR_THRE,
-        .mmio = 1,
-        .max_ports = 2,
-    },
-    [param_pericom_1port] = {
-        .base_baud = 921600,
-        .uart_offset = 8,
-        .reg_width = 1,
-        .fifo_size = 16,
-        .lsr_mask = UART_LSR_THRE,
-        .bar0 = 1,
-        .max_ports = 1,
-    },
-    [param_pericom_2port] = {
-        .base_baud = 921600,
-        .uart_offset = 8,
-        .reg_width = 1,
-        .fifo_size = 16,
-        .lsr_mask = UART_LSR_THRE,
-        .bar0 = 1,
-        .max_ports = 2,
-    },
-    /*
-     * Of the two following ones, we can't really use all of their ports,
-     * unless ns16550_com[] would get grown.
-     */
-    [param_pericom_4port] = {
-        .base_baud = 921600,
-        .uart_offset = 8,
-        .reg_width = 1,
-        .fifo_size = 16,
-        .lsr_mask = UART_LSR_THRE,
-        .bar0 = 1,
-        .max_ports = 4,
-    },
-    [param_pericom_8port] = {
-        .base_baud = 921600,
-        .uart_offset = 8,
-        .reg_width = 1,
-        .fifo_size = 16,
-        .lsr_mask = UART_LSR_THRE,
-        .bar0 = 1,
-        .max_ports = 8,
-    }
-};
-static const struct ns16550_config __initconst uart_config[] =
-{
-    /* Broadcom TruManage device */
-    {
-        .vendor_id = PCI_VENDOR_ID_BROADCOM,
-        .dev_id = 0x160a,
-        .param = param_trumanage,
-    },
-    /* OXPCIe952 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc11b,
-        .param = param_oxford,
-    },
-    /* OXPCIe952 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc11f,
-        .param = param_oxford,
-    },
-    /* OXPCIe952 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc138,
-        .param = param_oxford,
-    },
-    /* OXPCIe952 2 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc158,
-        .param = param_oxford_2port,
-    },
-    /* OXPCIe952 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc13d,
-        .param = param_oxford,
-    },
-    /* OXPCIe952 2 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc15d,
-        .param = param_oxford_2port,
-    },
-    /* OXPCIe952 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc40b,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc40f,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc41b,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc41f,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc42b,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc42f,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc43b,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc43f,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc44b,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc44f,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc45b,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc45f,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc46b,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc46f,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc47b,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc47f,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc48b,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc48f,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc49b,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc49f,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc4ab,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc4af,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc4bb,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc4bf,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc4cb,
-        .param = param_oxford,
-    },
-    /* OXPCIe200 1 Native UART  */
-    {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc4cf,
-        .param = param_oxford,
-    },
-    /* Pericom PI7C9X7951 Uno UART */
-    {
-        .vendor_id = PCI_VENDOR_ID_PERICOM,
-        .dev_id = 0x7951,
-        .param = param_pericom_1port
-    },
-    /* Pericom PI7C9X7952 Duo UART */
-    {
-        .vendor_id = PCI_VENDOR_ID_PERICOM,
-        .dev_id = 0x7952,
-        .param = param_pericom_2port
-    },
-    /* Pericom PI7C9X7954 Quad UART */
-    {
-        .vendor_id = PCI_VENDOR_ID_PERICOM,
-        .dev_id = 0x7954,
-        .param = param_pericom_4port
-    },
-    /* Pericom PI7C9X7958 Octal UART */
-    {
-        .vendor_id = PCI_VENDOR_ID_PERICOM,
-        .dev_id = 0x7958,
-        .param = param_pericom_8port
-    }
-};
 #endif
 
 static void ns16550_delayed_resume(void *data);
@@ -1045,6 +739,314 @@ static int __init check_existence(struct
 }
 
 #ifdef CONFIG_HAS_PCI
+
+/*
+ * Create lookup tables for specific devices. It is assumed that if
+ * the device found is MMIO, then you have indexed it here. Else, the
+ * driver does nothing for MMIO based devices.
+ */
+static const struct ns16550_config_param __initconst uart_param[] = {
+    [param_default] = {
+        .reg_width = 1,
+        .lsr_mask = UART_LSR_THRE,
+        .max_ports = 1,
+    },
+    [param_trumanage] = {
+        .reg_shift = 2,
+        .reg_width = 1,
+        .fifo_size = 16,
+        .lsr_mask = (UART_LSR_THRE | UART_LSR_TEMT),
+        .mmio = 1,
+        .max_ports = 1,
+    },
+    [param_oxford] = {
+        .base_baud = 4000000,
+        .uart_offset = 0x200,
+        .first_offset = 0x1000,
+        .reg_width = 1,
+        .fifo_size = 16,
+        .lsr_mask = UART_LSR_THRE,
+        .mmio = 1,
+        .max_ports = 1, /* It can do more, but we would need more custom code.*/
+    },
+    [param_oxford_2port] = {
+        .base_baud = 4000000,
+        .uart_offset = 0x200,
+        .first_offset = 0x1000,
+        .reg_width = 1,
+        .fifo_size = 16,
+        .lsr_mask = UART_LSR_THRE,
+        .mmio = 1,
+        .max_ports = 2,
+    },
+    [param_pericom_1port] = {
+        .base_baud = 921600,
+        .uart_offset = 8,
+        .reg_width = 1,
+        .fifo_size = 16,
+        .lsr_mask = UART_LSR_THRE,
+        .bar0 = 1,
+        .max_ports = 1,
+    },
+    [param_pericom_2port] = {
+        .base_baud = 921600,
+        .uart_offset = 8,
+        .reg_width = 1,
+        .fifo_size = 16,
+        .lsr_mask = UART_LSR_THRE,
+        .bar0 = 1,
+        .max_ports = 2,
+    },
+    /*
+     * Of the two following ones, we can't really use all of their ports,
+     * unless ns16550_com[] would get grown.
+     */
+    [param_pericom_4port] = {
+        .base_baud = 921600,
+        .uart_offset = 8,
+        .reg_width = 1,
+        .fifo_size = 16,
+        .lsr_mask = UART_LSR_THRE,
+        .bar0 = 1,
+        .max_ports = 4,
+    },
+    [param_pericom_8port] = {
+        .base_baud = 921600,
+        .uart_offset = 8,
+        .reg_width = 1,
+        .fifo_size = 16,
+        .lsr_mask = UART_LSR_THRE,
+        .bar0 = 1,
+        .max_ports = 8,
+    }
+};
+
+static const struct ns16550_config __initconst uart_config[] =
+{
+    /* Broadcom TruManage device */
+    {
+        .vendor_id = PCI_VENDOR_ID_BROADCOM,
+        .dev_id = 0x160a,
+        .param = param_trumanage,
+    },
+    /* OXPCIe952 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc11b,
+        .param = param_oxford,
+    },
+    /* OXPCIe952 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc11f,
+        .param = param_oxford,
+    },
+    /* OXPCIe952 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc138,
+        .param = param_oxford,
+    },
+    /* OXPCIe952 2 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc158,
+        .param = param_oxford_2port,
+    },
+    /* OXPCIe952 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc13d,
+        .param = param_oxford,
+    },
+    /* OXPCIe952 2 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc15d,
+        .param = param_oxford_2port,
+    },
+    /* OXPCIe952 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc40b,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc40f,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc41b,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc41f,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc42b,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc42f,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc43b,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc43f,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc44b,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc44f,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc45b,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc45f,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc46b,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc46f,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc47b,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc47f,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc48b,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc48f,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc49b,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc49f,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc4ab,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc4af,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc4bb,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc4bf,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc4cb,
+        .param = param_oxford,
+    },
+    /* OXPCIe200 1 Native UART  */
+    {
+        .vendor_id = PCI_VENDOR_ID_OXSEMI,
+        .dev_id = 0xc4cf,
+        .param = param_oxford,
+    },
+    /* Pericom PI7C9X7951 Uno UART */
+    {
+        .vendor_id = PCI_VENDOR_ID_PERICOM,
+        .dev_id = 0x7951,
+        .param = param_pericom_1port
+    },
+    /* Pericom PI7C9X7952 Duo UART */
+    {
+        .vendor_id = PCI_VENDOR_ID_PERICOM,
+        .dev_id = 0x7952,
+        .param = param_pericom_2port
+    },
+    /* Pericom PI7C9X7954 Quad UART */
+    {
+        .vendor_id = PCI_VENDOR_ID_PERICOM,
+        .dev_id = 0x7954,
+        .param = param_pericom_4port
+    },
+    /* Pericom PI7C9X7958 Octal UART */
+    {
+        .vendor_id = PCI_VENDOR_ID_PERICOM,
+        .dev_id = 0x7958,
+        .param = param_pericom_8port
+    }
+};
+
 static int __init
 pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
 {
@@ -1211,7 +1213,8 @@ pci_uart_config(struct ns16550 *uart, bo
 
     return 0;
 }
-#endif
+
+#endif /* CONFIG_HAS_PCI */
 
 /*
  * Used to parse name value pairs and return which value it is along with


