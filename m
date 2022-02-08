Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F15D4AD5D8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268140.461933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHO6a-00061W-3l; Tue, 08 Feb 2022 10:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268140.461933; Tue, 08 Feb 2022 10:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHO6Z-0005ye-Vy; Tue, 08 Feb 2022 10:52:15 +0000
Received: by outflank-mailman (input) for mailman id 268140;
 Tue, 08 Feb 2022 10:52:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nHO6Y-0005yP-LD
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:52:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHO6Y-0005e9-IJ; Tue, 08 Feb 2022 10:52:14 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHO6Y-0006a4-A7; Tue, 08 Feb 2022 10:52:14 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=FxGkKIgDk3gxIXLFThwrFZY1HTiAnaiBqRB9nXCxkNc=; b=wETh9V
	e7wINGYZboxUpaRAA7STrxo4K7RjcJoIr5e5hAOuEJ9U+dEII0kq1D7ZHTYNYwlNFCkWuOGbZI+Ub
	2w2YRvuB01Kc+VIc7D63Y/QU6uxwVGVDhb9+nq6OEfBi0uhtqDoul+LHbFSnYfb2c6yTdfvrN7hYw
	rw0oqdc3Vyk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen/efi: Use PrintErrMsg() rather than printk() in efi_exit_boot()
Date: Tue,  8 Feb 2022 10:52:11 +0000
Message-Id: <20220208105211.96727-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The function efi_exit_boot() will be called within the UEFI stub. This
means printk() is not available will actually result to a crash when
called (at least on Arm).

Replace the call to printk() with PrintErrMsg().

Fixes: 49450415d6 ("efi: optionally call SetVirtualAddressMap()")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/common/efi/boot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 2bc38ae40fff..4ef75e472d29 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1181,8 +1181,8 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
                                           mdesc_ver, efi_memmap);
     if ( status != EFI_SUCCESS )
     {
-        printk(XENLOG_ERR "EFI: SetVirtualAddressMap() failed (%#lx), disabling runtime services\n",
-               status);
+        PrintErrMesg(L"EFI: SetVirtualAddressMap() failed, disabling runtime services",
+                     status);
         __clear_bit(EFI_RS, &efi_flags);
     }
 #endif
-- 
2.32.0


