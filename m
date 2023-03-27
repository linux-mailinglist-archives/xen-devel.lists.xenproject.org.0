Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 541696CA0E8
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 12:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515118.797697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgjnL-0005Yh-MT; Mon, 27 Mar 2023 10:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515118.797697; Mon, 27 Mar 2023 10:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgjnL-0005Wm-Iz; Mon, 27 Mar 2023 10:09:43 +0000
Received: by outflank-mailman (input) for mailman id 515118;
 Mon, 27 Mar 2023 10:09:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSZI=7T=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pgjnK-0005WB-Lc
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 10:09:42 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b41fa93-cc87-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 12:09:40 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8B0805C00D2;
 Mon, 27 Mar 2023 06:09:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 27 Mar 2023 06:09:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Mar 2023 06:09:36 -0400 (EDT)
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
X-Inumbo-ID: 7b41fa93-cc87-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1679911777; x=1679998177; bh=1P
	t6XqRuvA6Th9hcIflc1psbelysDkFYRZ1fYTSdFk8=; b=YV3dOcV6/U9h5icRhn
	Pcy4iRo2Fazj+YZKFej5iUjPGl8gqo94BIVI3q7ARiSJk/HhgssUNnYvf2viGgJL
	kGLsTkhM/W9JuMJZssQnQHVmOJ6jvnABj4vY/Z3T7zcxNs1B1sJMnYmiqsrNxxY4
	ylDrIobV45aDJEwUQqSsJTV4G+kc+1fQtDiovENZHKQqj3VceoToIxcGhJxbDm7a
	Vn5xb+PmK+fXBmF08TVRN12wWGdwtSKHWbTNdOOuyQdaiwVMt2LnzNy3IsOXfkLI
	W3xX4ZXwtgVCBcVNXYQLiePM1JVZosbQA0KOsHKJsIFpcnuyV6lxpo5KFYnFplN/
	GsJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1679911777; x=1679998177; bh=1Pt6XqRuvA6Th9hcIflc1psbelysDkFYRZ1
	fYTSdFk8=; b=t3PYdUq9BQ35ZENiGBKpgRXgTk/lQmD9zOvJG1kJCp378ehNWqx
	hLCjlR6naSgeQh9ApcDqGhXDDkbLlp5PsiS+SG0CLWQESSpdoIliUz2c4ZgvHI1/
	nnD66FnUlWr9Uu3pBJ4NaF6quPIzVAGPVmwvGdrREcVkHm3dXZy3mQ/CDqwtkOTs
	U37iuCGXzfloN9MEoqP/tZsNqioR3erJlKcCrXxMW8Lge7izyesglqrF+VnmC89/
	j3SVBrOfHdzF36TsLBI4+jx2OLlXRsSFkDVh3BepunZhKek5nEQDyEWw6BBDstZe
	+yV8fYat+OVAsOSKf4CMi9qo6P7hiaZuhDg==
X-ME-Sender: <xms:YWshZKoCOBK2TkHq70PHb-Fn844gASfRI1IBOnsWsEX9ORDz2TSE2g>
    <xme:YWshZIr66zw3rMMPhNNT1K5Z082C77RkO2Pe_Ig7R-4agwQr2vK4sBuLBvCfZO3G9
    t5iFnRXDJEojA>
X-ME-Received: <xmr:YWshZPMAKo5Qq76Rco0Wzcj_I23s4R9hsmSmqgE_koUyPEPohVeXlLqaeIuawFdNQ7IlyJpZdxcETQA4hmI07n5UfnSf-fvhp5mbo9uAIW2lWrEJnah2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:YWshZJ4lpCMvpNkE1KbpoJ3p15x0GgcNAdV0WoCwbsJvjOcF71hsIw>
    <xmx:YWshZJ68m5SGJ8t1hfQwYio4D46E5I3IS0mCFLwJcL-Hfhv0v1uHxw>
    <xmx:YWshZJjfU5hVPzzSFroR1t2L2X7pRRbKuha4I0wEapzzuqjTY8J2Zw>
    <xmx:YWshZHQEI_Wmxulq5dYhapKd_liTyghWLUGu6Qp86IlD0SJabtYxLA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] drivers/char: Use sub-page ro API to make just xhci dbc cap RO
Date: Mon, 27 Mar 2023 12:09:16 +0200
Message-Id: <befefa60ea42a41543bc6dad70a559816cda8b7c.1679911575.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.0fffd3f3080b5eeb8d22126eda6088734bb0c926.1679911575.git-series.marmarek@invisiblethingslab.com>
References: <cover.0fffd3f3080b5eeb8d22126eda6088734bb0c926.1679911575.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... not the whole page, which may contain other registers too. In fact
on Tiger Lake and newer (at least), this page do contain other registers
that Linux tries to use. And with share=yes, a domU would use them too.
Without this patch, PV dom0 would fail to initialize the controller,
while HVM would be killed on EPT violation.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/drivers/char/xhci-dbc.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 60b781f87202..df2524b0ca18 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -1226,9 +1226,43 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
                          uart->dbc.xhc_dbc_offset),
                 PFN_UP((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
                        uart->dbc.xhc_dbc_offset +
-                sizeof(*uart->dbc.dbc_reg)) - 1) )
-        printk(XENLOG_INFO
+                sizeof(*uart->dbc.dbc_reg)) - 1) ) {
+        printk(XENLOG_WARNING
                "Error while adding MMIO range of device to mmio_ro_ranges\n");
+    }
+    else
+    {
+        unsigned long dbc_regs_start = (uart->dbc.bar_val &
+                PCI_BASE_ADDRESS_MEM_MASK) + uart->dbc.xhc_dbc_offset;
+        unsigned long dbc_regs_end = dbc_regs_start + sizeof(*uart->dbc.dbc_reg);
+
+        /* This being smaller than a page simplifies conditions below */
+        BUILD_BUG_ON(sizeof(*uart->dbc.dbc_reg) >= PAGE_SIZE - 1);
+        if ( dbc_regs_start & (PAGE_SIZE - 1) ||
+                PFN_DOWN(dbc_regs_start) == PFN_DOWN(dbc_regs_end) )
+        {
+            if ( subpage_mmio_ro_add(
+                        _mfn(PFN_DOWN(dbc_regs_start)),
+                        dbc_regs_start & (PAGE_SIZE - 1),
+                        PFN_DOWN(dbc_regs_start) == PFN_DOWN(dbc_regs_end)
+                        ? dbc_regs_end & (PAGE_SIZE - 1)
+                        : PAGE_SIZE - 1,
+                        FIX_XHCI_END) )
+                printk(XENLOG_WARNING
+                        "Error while adding MMIO range of device to subpage_mmio_ro\n");
+        }
+        if ( dbc_regs_end & (PAGE_SIZE - 1) &&
+                PFN_DOWN(dbc_regs_start) != PFN_DOWN(dbc_regs_end) )
+        {
+            if ( subpage_mmio_ro_add(
+                        _mfn(PFN_DOWN(dbc_regs_end)),
+                        0,
+                        dbc_regs_end & (PAGE_SIZE - 1),
+                        FIX_XHCI_END + PFN_DOWN(sizeof(*uart->dbc.dbc_reg))) )
+                printk(XENLOG_WARNING
+                        "Error while adding MMIO range of device to subpage_mmio_ro\n");
+        }
+    }
 #endif
 }
 
-- 
git-series 0.9.1

