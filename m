Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798612F63A3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:05:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67084.119449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04Bj-0005TZ-5Z; Thu, 14 Jan 2021 15:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67084.119449; Thu, 14 Jan 2021 15:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04Bj-0005T6-1Y; Thu, 14 Jan 2021 15:05:27 +0000
Received: by outflank-mailman (input) for mailman id 67084;
 Thu, 14 Jan 2021 15:05:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04Bh-0005Sq-7V
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:05:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 483ed273-0f93-4ac6-b176-0503b2879029;
 Thu, 14 Jan 2021 15:05:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5A738AC5B;
 Thu, 14 Jan 2021 15:05:23 +0000 (UTC)
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
X-Inumbo-ID: 483ed273-0f93-4ac6-b176-0503b2879029
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610636723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PKCI8/ExLlhFmX+oxuow12nmgg61oDI6flUEFtcNiaU=;
	b=ZMb3mnA49xATiEEgFGFLnYJWyKqYszsJjhhY+hxYbvyhYNp36yok2facYVHe9AhXn9uB+K
	Lb81vfsARCfou1PWnXBtYyj95Ia3ycFXbqqwRbtMVX8Wydh4ux787SBX55PZISN5tFkMfj
	V5mi65zvQAOuqRVVaIrA/jSLsX3NZAE=
Subject: [PATCH 05/17] x86: rename {get,put}_user() to {get,put}_guest()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Message-ID: <f0508e90-5187-8a44-b11a-705f60ab60f8@suse.com>
Date: Thu, 14 Jan 2021 16:05:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Bring them (back) in line with __{get,put}_guest().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1626,19 +1626,19 @@ static void load_segments(struct vcpu *n
 
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
@@ -1667,17 +1667,17 @@ static void load_segments(struct vcpu *n
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
@@ -27,14 +27,12 @@ extern void __put_user_bad(void);
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
@@ -43,18 +41,15 @@ extern void __put_user_bad(void);
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
@@ -62,8 +57,8 @@ extern void __put_user_bad(void);
  *
  * Returns zero on success, or -EFAULT on error.
  */
-#define put_user(x,ptr)							\
-  __put_user_check((__typeof__(*(ptr)))(x),(ptr),sizeof(*(ptr)))
+#define put_guest(x, ptr) \
+    put_guest_check((__typeof__(*(ptr)))(x), ptr, sizeof(*(ptr)))
 
 /**
  * __get_guest: - Get a simple variable from guest space, with less checking.
@@ -119,7 +114,7 @@ extern void __put_user_bad(void);
 	err_;								\
 })
 
-#define __put_user_check(x, ptr, size)					\
+#define put_guest_check(x, ptr, size)					\
 ({									\
 	__typeof__(*(ptr)) __user *ptr_ = (ptr);			\
 	__typeof__(size) size_ = (size);				\
@@ -141,7 +136,7 @@ extern void __put_user_bad(void);
 	err_;								\
 })
 
-#define __get_user_check(x, ptr, size)					\
+#define get_guest_check(x, ptr, size)					\
 ({									\
 	__typeof__(*(ptr)) __user *ptr_ = (ptr);			\
 	__typeof__(size) size_ = (size);				\


