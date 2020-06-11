Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B56E1F67E5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 14:32:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjMN0-0004JB-Sr; Thu, 11 Jun 2020 12:31:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lpkM=7Y=canonical.com=colin.king@srs-us1.protection.inumbo.net>)
 id 1jjMMz-0004J6-DO
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 12:31:45 +0000
X-Inumbo-ID: 8254edb4-abdf-11ea-b516-12813bfff9fa
Received: from youngberry.canonical.com (unknown [91.189.89.112])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8254edb4-abdf-11ea-b516-12813bfff9fa;
 Thu, 11 Jun 2020 12:31:44 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1jjMMo-0005qP-MA; Thu, 11 Jun 2020 12:31:34 +0000
From: Colin King <colin.king@canonical.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org
Subject: [PATCH] xen: remove redundant initialization of variable irq
Date: Thu, 11 Jun 2020 13:31:34 +0100
Message-Id: <20200611123134.922395-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0.rc0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Colin Ian King <colin.king@canonical.com>

The variable irq is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/pci/xen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
index e3f1ca316068..9f9aad42ccff 100644
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -62,7 +62,7 @@ static int xen_pcifront_enable_irq(struct pci_dev *dev)
 #ifdef CONFIG_ACPI
 static int xen_register_pirq(u32 gsi, int triggering, bool set_pirq)
 {
-	int rc, pirq = -1, irq = -1;
+	int rc, pirq = -1, irq;
 	struct physdev_map_pirq map_irq;
 	int shareable = 0;
 	char *name;
-- 
2.27.0.rc0


