Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 248A945F990
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:24:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233611.405514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmSH-0005Me-3J; Sat, 27 Nov 2021 01:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233611.405514; Sat, 27 Nov 2021 01:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmSG-0005IP-TD; Sat, 27 Nov 2021 01:24:40 +0000
Received: by outflank-mailman (input) for mailman id 233611;
 Sat, 27 Nov 2021 01:24:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmSF-0004gG-9g
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:24:39 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9dc1b68-4f20-11ec-b941-1df2895da90e;
 Sat, 27 Nov 2021 02:24:38 +0100 (CET)
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
X-Inumbo-ID: c9dc1b68-4f20-11ec-b941-1df2895da90e
Message-ID: <20211127000918.779751933@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637976278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=CFmm+AWRwXcJQSLL7VY9/FlDxYE98PyZd7GrvqHxiD8=;
	b=e24VzNipUk4hxg1PHC6IAXr9weR7Gc/SoXDfA3RHuL3eUYXW0KQ0vmOx1Rup57wdQ4/c0M
	j0SsM53zaTsEp+xcsTJcjjvt9idxHze65/F9ku69wsdFH4O1IR3xnNt1kBpYgjtuq1EJx3
	G4+8DqRMVr0EurGDQTIs906q+2dXCPyTndaD2DMJHPeXSLph/ufoqB5pa8guu1m5SJm17L
	kBtRWLOCwVpFplTZ//BIVum2PpChXwXEF/pgcDF3hqzjYmEihoy8xv/uTBJ/AHXGcWoyWZ
	FCUJcprzFqND4a981S/J+eyIOTEK4LUqOJJk4OnVzXGII9RmrCOyMXoWJHxGBg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637976278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=CFmm+AWRwXcJQSLL7VY9/FlDxYE98PyZd7GrvqHxiD8=;
	b=gCM9TtH7kdRRuRtrS2dC9nAFXYnyiZU34H6DDhO0H4O61lGny8X8mQzTO3e0hAM5LNj6ef
	CHes+qC3TZO1npAA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>,
 Ashok Raj <ashok.raj@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Cooper <amc96@cam.ac.uk>,
 Juergen Gross <jgross@suse.com>,
 linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: [patch 05/10] genirq/msi: Add domain info flag MSI_FLAG_CAN_EXPAND
References: <20211126233124.618283684@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:24:37 +0100 (CET)

Not all MSI domains support runtime expansions of PCI/MSI-X vectors. Add a
domain flag so implementations can opt in.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/msi.h |    2 ++
 1 file changed, 2 insertions(+)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -494,6 +494,8 @@ enum {
 	MSI_FLAG_ALLOC_SIMPLE_MSI_DESCS	= (1 << 9),
 	/* Free MSI descriptors */
 	MSI_FLAG_FREE_MSI_DESCS		= (1 << 10),
+	/* MSI vectors can be expanded after initial setup */
+	MSI_FLAG_CAN_EXPAND		= (1 << 11),
 };
 
 int msi_domain_set_affinity(struct irq_data *data, const struct cpumask *mask,


