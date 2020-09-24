Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E2927742E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 16:39:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLSOh-0005yi-5x; Thu, 24 Sep 2020 14:38:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=va+m=DB=huawei.com=liheng40@srs-us1.protection.inumbo.net>)
 id 1kLSMO-0005s8-QM
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 14:36:36 +0000
X-Inumbo-ID: 25b912c1-4b4a-4eca-90bb-c1796268c144
Received: from huawei.com (unknown [45.249.212.191])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25b912c1-4b4a-4eca-90bb-c1796268c144;
 Thu, 24 Sep 2020 14:36:26 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id AA7356ED7F3D4B87A936;
 Thu, 24 Sep 2020 22:36:19 +0800 (CST)
Received: from huawei.com (10.175.104.57) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 24 Sep 2020
 22:36:16 +0800
From: Li Heng <liheng40@huawei.com>
To: <konrad.wilk@oracle.com>, <bhelgaas@google.com>, <tglx@linutronix.de>,
 <mingo@redhat.com>, <bp@alien8.de>
CC: <x86@kernel.org>, <hpa@zytor.com>, <xen-devel@lists.xenproject.org>,
 <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] xen: Fix a previous prototype warning in xen.c
Date: Thu, 24 Sep 2020 22:36:16 +0800
Message-ID: <1600958176-23406-1-git-send-email-liheng40@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.57]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 24 Sep 2020 14:38:57 +0000
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

Fix the warning:
arch/x86/pci/xen.c:423:13: warning:
no previous prototype for ‘xen_msi_init’ [-Wmissing-prototypes]

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Li Heng <liheng40@huawei.com>
---
 arch/x86/pci/xen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
index 89395a5..f663a5f 100644
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -420,7 +420,7 @@ int __init pci_xen_init(void)
 }

 #ifdef CONFIG_PCI_MSI
-void __init xen_msi_init(void)
+static void __init xen_msi_init(void)
 {
 	if (!disable_apic) {
 		/*
--
2.7.4


