Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67732475A3C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 15:02:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247407.426615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxUrO-0002Lp-AN; Wed, 15 Dec 2021 14:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247407.426615; Wed, 15 Dec 2021 14:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxUrO-0002Ir-6z; Wed, 15 Dec 2021 14:02:22 +0000
Received: by outflank-mailman (input) for mailman id 247407;
 Wed, 15 Dec 2021 14:02:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rtoO=RA=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1mxUrM-0002GE-FA
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 14:02:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d0433e1-5daf-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 15:02:18 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AB11CB81F21;
 Wed, 15 Dec 2021 14:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D94EC34604;
 Wed, 15 Dec 2021 14:02:12 +0000 (UTC)
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
X-Inumbo-ID: 9d0433e1-5daf-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639576935;
	bh=cXYTLYTbqfDJRy2dCkqPSsmWK+rChKlIWB5CxhnAkoE=;
	h=From:To:Cc:Subject:Date:From;
	b=fuGPzjjPZux4pwsI/ALYQx5LaT/QTolTA/G5sONu5Ge6PHgTmT842mg1U6HQlhFGH
	 PTQwis0a8Mfdi69qfIeKVK0hnaXAJ/nEEcqzCbyN1IXzwMlKJp9adKLt5i9iQLrTKO
	 Sgd6HxvPLIjyUf/ko+aNJqH8Ejxy2Qcdb1EQKitxEjXoDE3g2yjpLn+lNC3XQIdts1
	 5d8IiYdvi95acthucvRyOZ/mJlj3cJ+6zvW7EYRpvPgxOD638pXPPZi9GtB/OEo/qi
	 I1kARHx46CV3t+i+mk7RccENhXFhSwZy2i3v48m9EYiy3DMia7A7Yhme+CtWjc9jlB
	 h0GUrJd6/8DDg==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86: xen: Fix xen_initdom_restore_msi #ifdef
Date: Wed, 15 Dec 2021 15:01:59 +0100
Message-Id: <20211215140209.451379-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The #ifdef check around the definition doesn't match the one around the
declaration, leading to a link failure when CONFIG_XEN_DOM0 is enabled
but CONFIG_XEN_PV_DOM0 is not:

x86_64-linux-ld: arch/x86/kernel/apic/msi.o: in function `arch_restore_msi_irqs':
msi.c:(.text+0x29a): undefined reference to `xen_initdom_restore_msi'

Change the declaration to use the same check that was already
present around the function definition.

Fixes: ae72f3156729 ("PCI/MSI: Make arch_restore_msi_irqs() less horrible.")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This should go on top the irq/msi branch of the tip tree, which
introduced the build regression
---
 arch/x86/include/asm/xen/hypervisor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/xen/hypervisor.h b/arch/x86/include/asm/xen/hypervisor.h
index 677f84d0039f..1bf2ad34188a 100644
--- a/arch/x86/include/asm/xen/hypervisor.h
+++ b/arch/x86/include/asm/xen/hypervisor.h
@@ -59,7 +59,7 @@ static inline bool __init xen_x2apic_para_available(void)
 
 struct pci_dev;
 
-#ifdef CONFIG_XEN_DOM0
+#ifdef CONFIG_XEN_PV_DOM0
 bool xen_initdom_restore_msi(struct pci_dev *dev);
 #else
 static inline bool xen_initdom_restore_msi(struct pci_dev *dev) { return true; }
-- 
2.29.2


