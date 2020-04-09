Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DFB1A3358
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 13:42:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMVYr-0006vD-68; Thu, 09 Apr 2020 11:41:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mt6Q=5Z=canonical.com=colin.king@srs-us1.protection.inumbo.net>)
 id 1jMVYp-0006v8-Uj
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 11:41:31 +0000
X-Inumbo-ID: 0e6b5f50-7a57-11ea-b4f4-bc764e2007e4
Received: from youngberry.canonical.com (unknown [91.189.89.112])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e6b5f50-7a57-11ea-b4f4-bc764e2007e4;
 Thu, 09 Apr 2020 11:41:31 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1jMVYc-0004rk-7i; Thu, 09 Apr 2020 11:41:18 +0000
From: Colin King <colin.king@canonical.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org
Subject: [PATCH] xen/pci: remove redundant assignment to variable irq
Date: Thu,  9 Apr 2020 12:41:18 +0100
Message-Id: <20200409114118.249461-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
index 91220cc25854..80272eb49230 100644
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -63,7 +63,7 @@ static int xen_pcifront_enable_irq(struct pci_dev *dev)
 static int xen_register_pirq(u32 gsi, int gsi_override, int triggering,
 			     bool set_pirq)
 {
-	int rc, pirq = -1, irq = -1;
+	int rc, pirq = -1, irq;
 	struct physdev_map_pirq map_irq;
 	int shareable = 0;
 	char *name;
-- 
2.25.1


