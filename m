Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E331AD712
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 09:10:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPL8A-0002Ms-U3; Fri, 17 Apr 2020 07:09:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VQOO=6B=huawei.com=yanaijie@srs-us1.protection.inumbo.net>)
 id 1jPL89-0002Mn-NU
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 07:09:41 +0000
X-Inumbo-ID: 653c4366-807a-11ea-b4f4-bc764e2007e4
Received: from huawei.com (unknown [45.249.212.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 653c4366-807a-11ea-b4f4-bc764e2007e4;
 Fri, 17 Apr 2020 07:09:37 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 28D6622F2F9E658195FE;
 Fri, 17 Apr 2020 15:09:35 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 15:09:27 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <konrad.wilk@oracle.com>, <bhelgaas@google.com>, <tglx@linutronix.de>,
 <mingo@redhat.com>, <bp@alien8.de>, <x86@kernel.org>, <hpa@zytor.com>,
 <xen-devel@lists.xenproject.org>, <linux-pci@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] xen/pci: make xen_msi_init() static
Date: Fri, 17 Apr 2020 15:35:53 +0800
Message-ID: <20200417073553.42873-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
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
Cc: Hulk Robot <hulkci@huawei.com>, Jason Yan <yanaijie@huawei.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Fix the following sparse warning:

arch/x86/pci/xen.c:426:13: warning: symbol 'xen_msi_init' was not
declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 arch/x86/pci/xen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
index 91220cc25854..0d06f12ccd74 100644
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -423,7 +423,7 @@ int __init pci_xen_init(void)
 }
 
 #ifdef CONFIG_PCI_MSI
-void __init xen_msi_init(void)
+static void __init xen_msi_init(void)
 {
 	if (!disable_apic) {
 		/*
-- 
2.21.1


