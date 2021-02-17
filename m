Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 795B231D676
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 09:21:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86151.161409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCI57-0002e1-Tx; Wed, 17 Feb 2021 08:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86151.161409; Wed, 17 Feb 2021 08:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCI57-0002db-QM; Wed, 17 Feb 2021 08:21:09 +0000
Received: by outflank-mailman (input) for mailman id 86151;
 Wed, 17 Feb 2021 08:21:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCI56-0002dG-Br
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 08:21:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id afef7590-768b-42c9-85ef-2e49d1957938;
 Wed, 17 Feb 2021 08:21:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 87787B923;
 Wed, 17 Feb 2021 08:21:06 +0000 (UTC)
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
X-Inumbo-ID: afef7590-768b-42c9-85ef-2e49d1957938
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613550066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3edcQpzCvtggucCwlX/TE5E+DYPVVTCrsewvr6Dlet4=;
	b=dkGdA3tJG+aPkmuo+k6QFgN/dEnqd2ZCh0vGibhGhvDsSFMIErrY//eNUWGjYe/FPR4XiU
	0eyLqH2eeV3S7tqvy+unl44I3LgjRNmMP+CdBZzAg806Q/6W1N4Ln60wgbRSSNHHVpCxO1
	ch20dNVPzH7FIbsqoAFKndpPChCEh78=
Subject: [PATCH v2 4/8] x86: rename {get,put}_user() to {get,put}_guest()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
Message-ID: <369ae5ec-ee2a-78d4-438f-b18d04c81c4c@suse.com>
Date: Wed, 17 Feb 2021 09:21:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Bring them (back) in line with __{get,put}_guest().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1649,19 +1649,19 @@ static void load_segments(struct vcpu *n
 
             if ( !ring_1(regs) )
             {
-                ret  = put_user(regs->ss,       esp-1);
-                ret |= put_user(regs->esp,      esp-2);
+                ret  = put_guest(regs->ss,  esp - 1);
+                ret |= put_guest(regs->esp, esp - 2);
                 esp -= 2;
             }
 
             if ( ret |
-                 put_user(rflags,              esp-1) |
-                 put_user(cs_and_mask,         esp-2) |
-                 put_user(regs->eip,           esp-3) |
-                 put_user(uregs->gs,           esp-4) |
-                 put_user(uregs->fs,           esp-5) |
-                 put_user(uregs->es,           esp-6) |
-                 put_user(uregs->ds,           esp-7) )
+                 put_guest(rflags,      esp - 1) |
+                 put_guest(cs_and_mask, esp - 2) |
+                 put_guest(regs->eip,   esp - 3) |
+                 put_guest(uregs->gs,   esp - 4) |
+                 put_guest(uregs->fs,   esp - 5) |
+                 put_guest(uregs->es,   esp - 6) |
+                 put_guest(uregs->ds,   esp - 7) )
             {
                 gprintk(XENLOG_ERR,
                         "error while creating compat failsafe callback frame\n");
@@ -1690,17 +1690,17 @@ static void load_segments(struct vcpu *n
         cs_and_mask = (unsigned long)regs->cs |
             ((unsigned long)vcpu_info(n, evtchn_upcall_mask) << 32);
 
-        if ( put_user(regs->ss,            rsp- 1) |
-             put_user(regs->rsp,           rsp- 2) |
-             put_user(rflags,              rsp- 3) |
-             put_user(cs_and_mask,         rsp- 4) |
-             put_user(regs->rip,           rsp- 5) |
-             put_user(uregs->gs,           rsp- 6) |
-             put_user(uregs->fs,           rsp- 7) |
-             put_user(uregs->es,           rsp- 8) |
-             put_user(uregs->ds,           rsp- 9) |
-             put_user(regs->r11,           rsp-10) |
-             put_user(regs->rcx,           rsp-11) )
+        if ( put_guest(regs->ss,    rsp -  1) |
+             put_guest(regs->rsp,   rsp -  2) |
+             put_guest(rflags,      rsp -  3) |
+             put_guest(cs_and_mask, rsp -  4) |
+             put_guest(regs->rip,   rsp -  5) |
+             put_guest(uregs->gs,   rsp -  6) |
+             put_guest(uregs->fs,   rsp -  7) |
+             put_guest(uregs->es,   rsp -  8) |
+             put_guest(uregs->ds,   rsp -  9) |
+             put_guest(regs->r11,   rsp - 10) |
+             put_guest(regs->rcx,   rsp - 11) )
         {
             gprintk(XENLOG_ERR,
                     "error while creating failsafe callback frame\n");
--- a/xen/include/asm-x86/uaccess.h
+++ b/xen/include/asm-x86/uaccess.h
@@ -26,14 +26,12 @@ extern void __put_user_bad(void);
 #define UA_DROP(args...)
 
 /**
- * get_user: - Get a simple variable from user space.
+ * get_guest: - Get a simple variable from guest space.
  * @x:   Variable to store result.
- * @ptr: Source address, in user space.
- *
- * Context: User context only.  This function may sleep.
+ * @ptr: Source address, in guest space.
  *
- * This macro copies a single simple variable from user space to kernel
- * space.  It supports simple types like char and int, but not larger
+ * This macro load a single simple variable from guest space.
+ * It supports simple types like char and int, but not larger
  * data types like structures or arrays.
  *
  * @ptr must have pointer-to-simple-variable type, and the result of
@@ -42,18 +40,15 @@ extern void __put_user_bad(void);
  * Returns zero on success, or -EFAULT on error.
  * On error, the variable @x is set to zero.
  */
-#define get_user(x,ptr)	\
-  __get_user_check((x),(ptr),sizeof(*(ptr)))
+#define get_guest(x, ptr) get_guest_check(x, ptr, sizeof(*(ptr)))
 
 /**
- * put_user: - Write a simple value into user space.
- * @x:   Value to copy to user space.
- * @ptr: Destination address, in user space.
- *
- * Context: User context only.  This function may sleep.
+ * put_guest: - Write a simple value into guest space.
+ * @x:   Value to store in guest space.
+ * @ptr: Destination address, in guest space.
  *
- * This macro copies a single simple value from kernel space to user
- * space.  It supports simple types like char and int, but not larger
+ * This macro stores a single simple value from to guest space.
+ * It supports simple types like char and int, but not larger
  * data types like structures or arrays.
  *
  * @ptr must have pointer-to-simple-variable type, and @x must be assignable
@@ -61,8 +56,8 @@ extern void __put_user_bad(void);
  *
  * Returns zero on success, or -EFAULT on error.
  */
-#define put_user(x,ptr)							\
-  __put_user_check((__typeof__(*(ptr)))(x),(ptr),sizeof(*(ptr)))
+#define put_guest(x, ptr) \
+    put_guest_check((__typeof__(*(ptr)))(x), ptr, sizeof(*(ptr)))
 
 /**
  * __get_guest: - Get a simple variable from guest space, with less checking.
@@ -118,7 +113,7 @@ extern void __put_user_bad(void);
 	err_;								\
 })
 
-#define __put_user_check(x, ptr, size)					\
+#define put_guest_check(x, ptr, size)					\
 ({									\
 	__typeof__(*(ptr)) __user *ptr_ = (ptr);			\
 	__typeof__(size) size_ = (size);				\
@@ -140,7 +135,7 @@ extern void __put_user_bad(void);
 	err_;								\
 })
 
-#define __get_user_check(x, ptr, size)					\
+#define get_guest_check(x, ptr, size)					\
 ({									\
 	__typeof__(*(ptr)) __user *ptr_ = (ptr);			\
 	__typeof__(size) size_ = (size);				\


