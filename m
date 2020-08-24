Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4679824F646
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 10:58:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kA8It-0001ej-M5; Mon, 24 Aug 2020 08:58:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HY0O=CC=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1kA8Ir-0001ee-K5
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 08:58:09 +0000
X-Inumbo-ID: 49f5a107-0ff1-4556-b8e0-b2612f10339b
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49f5a107-0ff1-4556-b8e0-b2612f10339b;
 Mon, 24 Aug 2020 08:58:09 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D74C42074D;
 Mon, 24 Aug 2020 08:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598259488;
 bh=39BZSNOZ3YCtH8xHE/nc+9Glh3GPa0Ojog1NJQhchpA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2bJvJLnkU+RhmReazxHF08V6S1+y9xIIhBv9RUzIxhG8bEPmOg3gQlIdEOBHZ+quR
 RvxLaVluwPso0FYAZo16kLRHt5zIyfhzmXQkwuJscO0+NUBIeaLZSTzHhdI6vKP8Io
 2lqy0KGvw62Cz5zdG440pHvyFmX5ub0UM+1BPRig=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Juergen Gross <jgross@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.19 57/71] Fix build error when CONFIG_ACPI is not
 set/enabled:
Date: Mon, 24 Aug 2020 10:31:48 +0200
Message-Id: <20200824082358.762937348@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200824082355.848475917@linuxfoundation.org>
References: <20200824082355.848475917@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit ee87e1557c42dc9c2da11c38e11b87c311569853 ]

../arch/x86/pci/xen.c: In function ‘pci_xen_init’:
../arch/x86/pci/xen.c:410:2: error: implicit declaration of function ‘acpi_noirq_set’; did you mean ‘acpi_irq_get’? [-Werror=implicit-function-declaration]
  acpi_noirq_set();

Fixes: 88e9ca161c13 ("xen/pci: Use acpi_noirq_set() helper to avoid #ifdef")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Juergen Gross <jgross@suse.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: xen-devel@lists.xenproject.org
Cc: linux-pci@vger.kernel.org
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/pci/xen.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
index 9112d1cb397bb..22da9bfd8a458 100644
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -25,6 +25,7 @@
 #include <asm/xen/pci.h>
 #include <asm/xen/cpuid.h>
 #include <asm/apic.h>
+#include <asm/acpi.h>
 #include <asm/i8259.h>
 
 static int xen_pcifront_enable_irq(struct pci_dev *dev)
-- 
2.25.1




