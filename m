Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3BB32B643
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 10:42:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92779.174859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHO1C-00084T-JC; Wed, 03 Mar 2021 09:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92779.174859; Wed, 03 Mar 2021 09:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHO1C-000844-G4; Wed, 03 Mar 2021 09:42:10 +0000
Received: by outflank-mailman (input) for mailman id 92779;
 Wed, 03 Mar 2021 09:37:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rVZB=IB=uniontech.com=maqianga@srs-us1.protection.inumbo.net>)
 id 1lHNwp-00079k-Fu
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 09:37:39 +0000
Received: from regular1.263xmail.com (unknown [211.150.70.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66fa1b46-4540-4129-b0ea-d0bbcdc0e417;
 Wed, 03 Mar 2021 09:37:35 +0000 (UTC)
Received: from localhost (unknown [192.168.167.16])
 by regular1.263xmail.com (Postfix) with ESMTP id 13F5512AE;
 Wed,  3 Mar 2021 17:37:33 +0800 (CST)
Received: from localhost.localdomain (unknown [124.126.19.250])
 by smtp.263.net (postfix) whith ESMTP id
 P32470T140679588607744S1614764247776371_; 
 Wed, 03 Mar 2021 17:37:33 +0800 (CST)
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
X-Inumbo-ID: 66fa1b46-4540-4129-b0ea-d0bbcdc0e417
X-MAIL-GRAY:0
X-MAIL-DELIVERY:1
X-ADDR-CHECKED4:1
X-ANTISPAM-LEVEL:2
X-SKE-CHECKED:1
X-ABS-CHECKED:1
X-IP-DOMAINF:1
X-UNIQUE-TAG:<b4176e65daab9c3aa7672fa01554f338>
X-RL-SENDER:maqianga@uniontech.com
X-SENDER:maqianga@uniontech.com
X-LOGIN-NAME:maqianga@uniontech.com
X-FST-TO:boris.ostrovsky@oracle.com
X-SENDER-IP:124.126.19.250
X-ATTACHMENT-NUM:0
X-System-Flag:0
From: maqiang <maqianga@uniontech.com>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	maqiang <maqianga@uniontech.com>
Subject: [PATCH] efi: x86/xen: fix -Wmissing-prototypes warning
Date: Wed,  3 Mar 2021 17:36:51 +0800
Message-Id: <20210303093651.6801-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We get 1 warning when building kernel with W=1:
arch/x86/xen/efi.c:130:13: warning:
 no previous prototype for ‘xen_efi_init’ [-Wmissing-prototypes]
 void __init xen_efi_init(struct boot_params *boot_params)

In fact, this function is declared as a static inline function
in header file, but is not decorated as a static inline function
in source file.
So this patch marks this function with 'static inline'.

Signed-off-by: maqiang <maqianga@uniontech.com>
---
 arch/x86/xen/efi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/efi.c b/arch/x86/xen/efi.c
index 7d7ffb9c826a..cf2e9ff3866d 100644
--- a/arch/x86/xen/efi.c
+++ b/arch/x86/xen/efi.c
@@ -127,7 +127,7 @@ static enum efi_secureboot_mode xen_efi_get_secureboot(void)
 	return efi_secureboot_mode_enabled;
 }
 
-void __init xen_efi_init(struct boot_params *boot_params)
+static inline void __init xen_efi_init(struct boot_params *boot_params)
 {
 	efi_system_table_t *efi_systab_xen;
 
-- 
2.20.1




