Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E72F64D7B56
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 08:12:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289920.491626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTerD-0001Qo-O6; Mon, 14 Mar 2022 07:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289920.491626; Mon, 14 Mar 2022 07:11:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTerD-0001Oz-Kg; Mon, 14 Mar 2022 07:11:07 +0000
Received: by outflank-mailman (input) for mailman id 289920;
 Mon, 14 Mar 2022 07:05:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1dCu=TZ=cmss.chinamobile.com=jianchunfu@srs-se1.protection.inumbo.net>)
 id 1nTem5-0000Vn-9H
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 07:05:49 +0000
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79]) by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 25d4dfc0-a365-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 08:05:44 +0100 (CET)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.3]) by
 rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee2622ee9422a3-edaed;
 Mon, 14 Mar 2022 15:05:38 +0800 (CST)
Received: from localhost.localdomain (unknown[223.108.79.97])
 by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee2622ee93bb5a-76513;
 Mon, 14 Mar 2022 15:05:37 +0800 (CST)
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
X-Inumbo-ID: 25d4dfc0-a365-11ec-853b-5f4723681683
X-RM-TRANSID:2ee2622ee9422a3-edaed
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
X-RM-TRANSID:2ee2622ee93bb5a-76513
From: jianchunfu <jianchunfu@cmss.chinamobile.com>
To: tglx@linutronix.de
Cc: x86@kernel.org,
	hpa@zytor.com,
	boris.ostrovsky@oracle.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	trivial@kernel.org,
	jianchunfu <jianchunfu@cmss.chinamobile.com>
Subject: [PATCH] arch:x86:xen: Remove unnecessary assignment in xen_apic_read()
Date: Mon, 14 Mar 2022 15:05:14 +0800
Message-Id: <20220314070514.2602-1-jianchunfu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.18.4

In the function xen_apic_read(), the initialized value of 'ret' is unused
because it will be assigned by the function HYPERVISOR_platform_op(),
thus remove it.

Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
---
 arch/x86/xen/apic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/apic.c b/arch/x86/xen/apic.c
index 0d46cc283..62d34b661 100644
--- a/arch/x86/xen/apic.c
+++ b/arch/x86/xen/apic.c
@@ -51,7 +51,7 @@ static u32 xen_apic_read(u32 reg)
 		.interface_version = XENPF_INTERFACE_VERSION,
 		.u.pcpu_info.xen_cpuid = 0,
 	};
-	int ret = 0;
+	int ret;
 
 	/* Shouldn't need this as APIC is turned off for PV, and we only
 	 * get called on the bootup processor. But just in case. */
-- 
2.18.4




