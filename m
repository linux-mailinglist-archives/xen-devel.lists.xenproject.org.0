Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF0D98A376
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 14:50:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807348.1218746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svFqa-0005iw-20; Mon, 30 Sep 2024 12:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807348.1218746; Mon, 30 Sep 2024 12:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svFqZ-0005gI-Ui; Mon, 30 Sep 2024 12:49:51 +0000
Received: by outflank-mailman (input) for mailman id 807348;
 Mon, 30 Sep 2024 12:49:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LvNS=Q4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1svFqX-0005M5-Vk
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 12:49:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7aa7dad5-7f2a-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 14:49:49 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.161.44.57])
 by support.bugseng.com (Postfix) with ESMTPSA id 86F224EE0746;
 Mon, 30 Sep 2024 14:49:47 +0200 (CEST)
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
X-Inumbo-ID: 7aa7dad5-7f2a-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1727700589; bh=QeRq5WatM5/gynhxqWft0r5yBBUgCUUQ3Qn003k14R0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F2S5X2u1gO2RIoVnDJLQE2s1VuP3OmT57wAOwC51Lbs5wJ2TwvrrlmuDBAaxR7ypG
	 LHQnkUq0vQqmulVdxcox1DXj8M32lActpeOB9RoJT4Bmc2ianwWVn6+iRbu+9jvvKK
	 BODpWPz8C9zigzTwJak1zE9YHOgQIsfPtw3EzjOLuxHsIX7jbcEzv1JbejDNkmMnpg
	 5TVD0xVp3KBxQt2H5aXbbGLvzr2KL6JmmO4XtRuCbooYgDLjRPBJWMrG8MpYaMXM9K
	 W9EXToQhI3fUrprZ2tScNMK9eOTgOAV0hkf+F1KRvJe9aA8BITrdZtaDp2Uf87AUxV
	 AapPGP0Usim8A==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v2 1/3] EFI: address a violation of MISRA C Rule 13.6
Date: Mon, 30 Sep 2024 14:49:15 +0200
Message-ID: <c447f9faf0283bc6b83bbfbf05acd7acca00762d.1727690180.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1727690180.git.federico.serafini@bugseng.com>
References: <cover.1727690180.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

guest_handle_ok()'s expansion contains a sizeof() involving its
first argument which is guest_handle_cast().
The expansion of the latter, in turn, contains a variable
initialization.

Since MISRA considers the initialization (even of a local variable)
a side effect, the chain of expansions mentioned above violates
MISRA C:2012 Rule 13.6 (The operand of the `sizeof' operator shall not
contain any expression which has potential side effect).

Refactor the code to address the rule violation.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- better description.
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
2.43.0


