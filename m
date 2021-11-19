Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBE445750A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 18:09:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228141.394691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo7O4-0000Wt-W6; Fri, 19 Nov 2021 17:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228141.394691; Fri, 19 Nov 2021 17:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo7O4-0000Un-Sd; Fri, 19 Nov 2021 17:09:20 +0000
Received: by outflank-mailman (input) for mailman id 228141;
 Fri, 19 Nov 2021 17:09:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mo7O3-0000Uh-N6
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 17:09:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mo7O3-0004Eb-B6
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 17:09:19 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mo7O3-0006t0-A7
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 17:09:19 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mo7Nz-00069e-7w; Fri, 19 Nov 2021 17:09:15 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=3JWVt85Np0TdEmjHBmi3IIx6MA/D5qyyG6+ILg7S4JU=; b=E0z+yS0jCxF33/izfTykrExxnd
	hfRA6HUi0MOrT4po2JIvR91ugN3eexg4couLm094yFTq4rDUq0ue0XFPd+esk3+U9VXPUcwnNR99P
	8h823yS6yEdcWp4p/Vvzkkda3+p67eAaTPbbVX+a6YA7mAHo9zU/wiBpFYpd5AiS6QSs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24983.55866.708476.70068@mariner.uk.xensource.com>
Date: Fri, 19 Nov 2021 17:09:14 +0000
To: Andrew Cooper <amc96@srcf.net>
Cc: xen-devel@lists.xenproject.org,
    Roger Pau Monne <roger.pau@citrix.com>,
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.16 v3] efi: fix alignment of function parameters in
 compat mode
In-Reply-To: <40b1a70a-12ed-e059-3bbd-a93b85a96f1d@srcf.net>
References: <20211119152403.12069-1-iwj@xenproject.org>
	<40b1a70a-12ed-e059-3bbd-a93b85a96f1d@srcf.net>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH for-4.16 v3] efi: fix alignment of function parameters in compat mode"):
> Some hardtabs appear to have slipped in.

Thanks.  Fixed.

> Jan gave a conditional R-by which permitted a change along these lines,
> but he's left the office now too, so you'll have to take him up on that
> offer if you want this committing before Monday.

Right.

FTAOD I think I have done what Jan approved, and Andy double checked
that.  So I am about to push this.  For the record, final version
below.

Ian.

From be12fcca8b784e456df3adedbffe657d753c5ff9 Mon Sep 17 00:00:00 2001
From: Roger Pau Monne <roger.pau@citrix.com>
Date: Thu, 18 Nov 2021 09:28:06 +0100
Subject: [PATCH for-4.16 v3] efi: fix alignment of function parameters in
 compat mode
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Andrew Cooper <amc96@srcf.net>

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
Reviewed-by: Jan Beulich <jbeulich@suse.com>

---
Changes since v3:
 - Remove hard tabs.  Apply Jan's r-b as authorised in email.
Changes since v2:
 - Adjust the commentary as per discussion.
Changes since v1:
 - Copy back the results.
---
 xen/common/efi/runtime.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 375b94229e..d2fdc28df3 100644
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
+         *
+         * Note that while the function parameters are OUT only, copy the
+         * values here anyway just in case. This is done regardless of whether
+         * called from the compat handler or not, as it's not worth the extra
+         * logic to differentiate.
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


