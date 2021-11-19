Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF294457192
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 16:24:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228087.394600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo5kW-00038L-Bx; Fri, 19 Nov 2021 15:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228087.394600; Fri, 19 Nov 2021 15:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo5kW-00036K-8I; Fri, 19 Nov 2021 15:24:24 +0000
Received: by outflank-mailman (input) for mailman id 228087;
 Fri, 19 Nov 2021 15:24:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mo5kU-00036E-Cn
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 15:24:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mo5kU-0001xe-5j
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 15:24:22 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mo5kU-0004P8-4Z
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 15:24:22 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mo5kI-0005r3-Bm; Fri, 19 Nov 2021 15:24:10 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From;
	bh=MeDObHg4WlpI4WwECEIFz0i5IyCX3lFHt4bSsUKE/WU=; b=584+YM4a0GK4hq4mYODPbk5txb
	SO0nmVvTLs2jYZRI+eqhFcdVAXwix83Dv1m5wfOj6nmbwPHqr02gRZ40wXMT73/iqtHIzu27xtab4
	wC3wj7B2PhHN2MX/y3dGRa2d9hQn695NM9oxuuPkadOMlruEB9m6gQcdf2xhkIrWZnqM=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <amc96@srcf.net>
Subject: [PATCH for-4.16 v3] efi: fix alignment of function parameters in compat mode
Date: Fri, 19 Nov 2021 15:24:03 +0000
Message-Id: <20211119152403.12069-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monne <roger.pau@citrix.com>

Currently the max_store_size, remain_store_size and max_size in
compat_pf_efi_runtime_call are 4 byte aligned, which makes clang
13.0.0 complain with:

In file included from compat.c:30:
./runtime.c:646:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 2 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
            &op->u.query_variable_info.max_store_size,
            ^
./runtime.c:647:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 3 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
            &op->u.query_variable_info.remain_store_size,
            ^
./runtime.c:648:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 4 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
            &op->u.query_variable_info.max_size);
            ^
Fix this by bouncing the variables on the stack in order for them to
be 8 byte aligned.

Note this could be done in a more selective manner to only apply to
compat code calls, but given the overhead of making an EFI call doing
an extra copy of 3 variables doesn't seem to warrant the special
casing.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
Reviewed-by: Ian Jackson <iwj@xenproject.org>
Signed-off-by: Ian Jackson <iwj@xenproject.org>

---
Changes since v2:
 - Adjust the commentary as per discussion.
Changes since v1:
 - Copy back the results.
---
 xen/common/efi/runtime.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 375b94229e..089bb0eb1b 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -607,6 +607,9 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
     break;
 
     case XEN_EFI_query_variable_info:
+    {
+        uint64_t max_store_size, remain_store_size, max_size;
+
         if ( op->misc & ~XEN_EFI_VARINFO_BOOT_SNAPSHOT )
             return -EINVAL;
 
@@ -638,16 +641,36 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
 
         if ( !efi_enabled(EFI_RS) || (efi_rs->Hdr.Revision >> 16) < 2 )
             return -EOPNOTSUPP;
+
+        /*
+         * Bounce the variables onto the stack to make them 8 byte aligned when
+         * called from the compat handler, as their placement in
+         * compat_pf_efi_runtime_call will make them 4 byte aligned instead and
+         * and compilers may validly complain.
+	 *
+	 * Note that while the function parameters are OUT only, copy the
+	 * values here anyway just in case. This is done regardless of whether
+	 * called from the compat handler or not, as it's not worth the extra
+	 * logic to differentiate.
+         */
+        max_store_size = op->u.query_variable_info.max_store_size;
+        remain_store_size = op->u.query_variable_info.remain_store_size;
+        max_size = op->u.query_variable_info.max_size;
+
         state = efi_rs_enter();
         if ( !state.cr3 )
             return -EOPNOTSUPP;
         status = efi_rs->QueryVariableInfo(
-            op->u.query_variable_info.attr,
-            &op->u.query_variable_info.max_store_size,
-            &op->u.query_variable_info.remain_store_size,
-            &op->u.query_variable_info.max_size);
+            op->u.query_variable_info.attr, &max_store_size, &remain_store_size,
+            &max_size);
         efi_rs_leave(&state);
+
+        op->u.query_variable_info.max_store_size = max_store_size;
+        op->u.query_variable_info.remain_store_size = remain_store_size;
+        op->u.query_variable_info.max_size = max_size;
+
         break;
+    }
 
     case XEN_EFI_query_capsule_capabilities:
     case XEN_EFI_update_capsule:
-- 
2.20.1


