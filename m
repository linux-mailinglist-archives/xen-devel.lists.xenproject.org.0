Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CD51A1B83
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 07:21:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM38j-0006hM-W2; Wed, 08 Apr 2020 05:20:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UgfH=5Y=huawei.com=yanaijie@srs-us1.protection.inumbo.net>)
 id 1jM0ki-0007sQ-Gr
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 02:47:44 +0000
X-Inumbo-ID: 50d8264e-7943-11ea-81ab-12813bfff9fa
Received: from huawei.com (unknown [45.249.212.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50d8264e-7943-11ea-81ab-12813bfff9fa;
 Wed, 08 Apr 2020 02:47:42 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 80D4727C189A174B8870;
 Wed,  8 Apr 2020 10:47:40 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Wed, 8 Apr 2020
 10:47:31 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <boris.ostrovsky@oracle.com>, <jgross@suse.com>, <sstabellini@kernel.org>, 
 <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/xen: make xen_pvmmu_arch_setup() static
Date: Wed, 8 Apr 2020 10:46:05 +0800
Message-ID: <20200408024605.42394-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 08 Apr 2020 05:20:39 +0000
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
Cc: Jason Yan <yanaijie@huawei.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Fix the following sparse warning:

arch/x86/xen/setup.c:998:12: warning: symbol 'xen_pvmmu_arch_setup' was not
declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 arch/x86/xen/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index 33b0e20df7fc..1a2d8a50dac4 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -985,7 +985,7 @@ void xen_enable_syscall(void)
 #endif /* CONFIG_X86_64 */
 }
 
-void __init xen_pvmmu_arch_setup(void)
+static void __init xen_pvmmu_arch_setup(void)
 {
 	HYPERVISOR_vm_assist(VMASST_CMD_enable, VMASST_TYPE_4gb_segments);
 	HYPERVISOR_vm_assist(VMASST_CMD_enable, VMASST_TYPE_writable_pagetables);
-- 
2.17.2


