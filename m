Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D529742FC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 21:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795995.1205522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so6Br-0006df-DM; Tue, 10 Sep 2024 19:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795995.1205522; Tue, 10 Sep 2024 19:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so6Br-0006bM-AZ; Tue, 10 Sep 2024 19:06:15 +0000
Received: by outflank-mailman (input) for mailman id 795995;
 Tue, 10 Sep 2024 19:06:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1so6Bp-0006Mx-Kg
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 19:06:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcef212e-6fa7-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 21:06:09 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 8D5634EE07CE;
 Tue, 10 Sep 2024 21:06:08 +0200 (CEST)
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
X-Inumbo-ID: bcef212e-6fa7-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725995168; bh=2hgBKwYohgvBFZOwcswNBiLDaYOqnK+3MTYLYQn89UY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MP9RpeK9lpYDz59Vg4QILJYM7ibJzYqqvouJUxMU1ai2gPfrqN3Vu6OOrrMVNio0S
	 9VbGgKR8ojkq8l/xEHW4jFxcm3WBYrZt2HEeZIv7dylgUJS6ElT57bvLvJ3KW0pOXw
	 dfOcymW5jDKBnl9sYFYCf4tFBL1BiRROp8nto+JHSLogJw8vphcLsRITJ9Rx4Nv8yY
	 zQgldko8dHtEZTqgkuQ5oelZPSfE1rdsJL8hOXcIw5MbnlKTEtX5DTlGeQKGSUwwll
	 ww6Wj4YmqgeHP3TYEMVqfVd0IOUlyPGUC3tOcZIEHdhZFIafvV2cGc7rdRkV9jo8zz
	 YjYx31kEXt1LA==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH 1/3] EFI: address violations of MISRA C Rule 13.6
Date: Tue, 10 Sep 2024 21:06:00 +0200
Message-Id: <2e893e6e83fdfb24c5f9c4d2da59114cba9a1df8.1725994633.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725994633.git.federico.serafini@bugseng.com>
References: <cover.1725994633.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the code to improve readability and address violations of
MISRA C:2012 Rule 13.6 ("The operand of the `sizeof' operator shall
not contain any expression which has potential side effect").

No functional change.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/common/efi/runtime.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index d03e5c90ce..acf08dcaa3 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -250,14 +250,20 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
         info->cfg.addr = __pa(efi_ct);
         info->cfg.nent = efi_num_ct;
         break;
+
     case XEN_FW_EFI_VENDOR:
+    {
+        XEN_GUEST_HANDLE_PARAM(CHAR16) vendor_name =
+            guest_handle_cast(info->vendor.name, CHAR16);
+
         if ( !efi_fw_vendor )
             return -EOPNOTSUPP;
+
         info->vendor.revision = efi_fw_revision;
         n = info->vendor.bufsz / sizeof(*efi_fw_vendor);
-        if ( !guest_handle_okay(guest_handle_cast(info->vendor.name,
-                                                  CHAR16), n) )
+        if ( !guest_handle_okay(vendor_name, n) )
             return -EFAULT;
+
         for ( i = 0; i < n; ++i )
         {
             if ( __copy_to_guest_offset(info->vendor.name, i,
@@ -267,6 +273,8 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
                 break;
         }
         break;
+    }
+
     case XEN_FW_EFI_MEM_INFO:
         for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
         {
-- 
2.34.1


