Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB81316A22
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 16:27:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83647.156202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9rP8-00011h-0e; Wed, 10 Feb 2021 15:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83647.156202; Wed, 10 Feb 2021 15:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9rP7-00011I-TQ; Wed, 10 Feb 2021 15:27:45 +0000
Received: by outflank-mailman (input) for mailman id 83647;
 Wed, 10 Feb 2021 15:27:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQOe=HM=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1l9rP6-00011D-68
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 15:27:44 +0000
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ef8103c-ecf1-46eb-9464-c4d1b3f1b489;
 Wed, 10 Feb 2021 15:27:43 +0000 (UTC)
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
X-Inumbo-ID: 3ef8103c-ecf1-46eb-9464-c4d1b3f1b489
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1612970862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=izmVBGwgZIHobxzE3AKB3/PFOL7XlGjrBYkkrejnxqA=;
	b=Gy3/NgyO2BGhmzAQwucpYtHiUBH7oMqdaFRQqH/jYBxQKmm4VNnbkGvgO0Lib1ZzA9NjqQ
	DLC+sMliBRHGg6FMsQDj1WK8fYojTmpPQeREB2B8SHNaeQUCNar8iMMboJ4IxHLAiddx3e
	IIsZ0G1jEeB421sUk+Dx65HubQwKerjGmyasvS9dhMCmxA0GvmEENCgcxucwl4h/aftjZu
	5IqTKadxjzXGLTkt98q4MjpdNCq/VSQfswCKxKfWMt7+xEsCqBVzB2S2mRtoEpQVp0a5EE
	dACDgGzQwZrTTsFDoUwoPt0XwZFUbbikB0tf3qLpnErivThJVFywXvT7Lh5xKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1612970862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=izmVBGwgZIHobxzE3AKB3/PFOL7XlGjrBYkkrejnxqA=;
	b=KqL+aFrQeS6pNATjhzD2eKbnUMsIHoJJOtKWV6L2Nc60iRmAY+bk1Ab7Fs+wxbEsbJxpDo
	4HdZDGI4NpebaxBg==
To: LKML <linux-kernel@vger.kernel.org>
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, Bjorn Helgaas <helgaas@kernel.org>, xen-devel@lists.xenproject.org
Subject: [PATCH] x86/pci: Create PCI/MSI irqdomain after x86_init.pci.arch_init()
Date: Wed, 10 Feb 2021 16:27:41 +0100
Message-ID: <87pn18djte.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain


Invoking x86_init.irqs.create_pci_msi_domain() before
x86_init.pci.arch_init() breaks XEN PV.

The XEN_PV specific pci.arch_init() function overrides the default
create_pci_msi_domain() which is obviously too late.

As a consequence the XEN PV PCI/MSI allocation goes through the native
path which runs out of vectors and causes malfunction.

Invoke it after x86_init.pci.arch_init().

Fixes: 6b15ffa07dc3 ("x86/irq: Initialize PCI/MSI domain at PCI init time")
Reported-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Cc: stable@vger.kernel.org
---
 arch/x86/pci/init.c |   15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

--- a/arch/x86/pci/init.c
+++ b/arch/x86/pci/init.c
@@ -9,16 +9,23 @@
    in the right sequence from here. */
 static __init int pci_arch_init(void)
 {
-	int type;
-
-	x86_create_pci_msi_domain();
+	int type, pcbios = 1;

	type = pci_direct_probe();

	if (!(pci_probe & PCI_PROBE_NOEARLY))
		pci_mmcfg_early_init();

-	if (x86_init.pci.arch_init && !x86_init.pci.arch_init())
+	if (x86_init.pci.arch_init)
+		pcbios = x86_init.pci.arch_init();
+
+	/*
+	 * Must happen after x86_init.pci.arch_init(). Xen sets up the
+	 * x86_init.irqs.create_pci_msi_domain there.
+	 */
+	x86_create_pci_msi_domain();
+
+	if (!pcbios)
		return 0;

	pci_pcbios_init();

