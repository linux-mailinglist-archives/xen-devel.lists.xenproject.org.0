Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2066646661F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 16:06:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236700.410576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msneN-0004eD-Kt; Thu, 02 Dec 2021 15:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236700.410576; Thu, 02 Dec 2021 15:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msneN-0004cQ-Hv; Thu, 02 Dec 2021 15:05:31 +0000
Received: by outflank-mailman (input) for mailman id 236700;
 Thu, 02 Dec 2021 15:05:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zjRX=QT=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1msneM-0004cH-Bz
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 15:05:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 48bde4e8-5381-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 16:05:28 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90442142F;
 Thu,  2 Dec 2021 07:05:27 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FDF33F73B;
 Thu,  2 Dec 2021 07:05:26 -0800 (PST)
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
X-Inumbo-ID: 48bde4e8-5381-11ec-976b-d102b41d0961
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] docs/efi: Fix wrong compatible in dts example
Date: Thu,  2 Dec 2021 15:05:17 +0000
Message-Id: <20211202150517.53029-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

The example in section "UEFI boot and dom0less on ARM" has
a wrong compatible for the DTB passthrough, it is "ramdisk"
instead of "device-tree".
This patch fixes the example.

Fixes: a1743fc3a9 ("arm/efi: Use dom0less configuration when using EFI boot")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Question: Does it makes sense to backport it to 4.16?
---
 docs/misc/efi.pandoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
index 4abbb5bb82..abafb34527 100644
--- a/docs/misc/efi.pandoc
+++ b/docs/misc/efi.pandoc
@@ -222,7 +222,7 @@ domU1 {
 		xen,uefi-binary = "initrd-3.0.31-0.4-xen";
 	};
 	module@3 {
-		compatible = "multiboot,ramdisk", "multiboot,module";
+		compatible = "multiboot,device-tree", "multiboot,module";
 		xen,uefi-binary = "passthrough.dtb";
 	};
 };
-- 
2.17.1


