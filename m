Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812D731D683
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 09:23:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86156.161432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCI6X-0002vT-MY; Wed, 17 Feb 2021 08:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86156.161432; Wed, 17 Feb 2021 08:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCI6X-0002v4-JO; Wed, 17 Feb 2021 08:22:37 +0000
Received: by outflank-mailman (input) for mailman id 86156;
 Wed, 17 Feb 2021 08:22:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCI6V-0002up-62
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 08:22:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f628108d-e73d-42dc-8205-5d6795168574;
 Wed, 17 Feb 2021 08:22:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4B379B923;
 Wed, 17 Feb 2021 08:22:33 +0000 (UTC)
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
X-Inumbo-ID: f628108d-e73d-42dc-8205-5d6795168574
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613550153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PqIHI9Fdsb5Eyg+96N6bfOyORZFtSfdfSsVAnEtdCGg=;
	b=O1fAS4TW5yxmzbIzQt4k6x8gcZSRp65JcaxTSNbgq5oEMMjRM8CEnW7S2/eOi5FrOiZvt+
	i/uorsRoOcsBGMsOEzHQuddvunLhrEL5TSYMIOWQVI5pFdAllb6ZBhV0MZ/oWrrZgA3k8a
	5r6F8TuWU8eebNdGsOcR7zxKohMgdHo=
Subject: [PATCH v2 6/8] x86: rename copy_{from,to}_user() to
 copy_{from,to}_guest_pv()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
Message-ID: <5104a32f-e2a1-06a5-a637-9702e4562b81@suse.com>
Date: Wed, 17 Feb 2021 09:22:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Bring them (back) in line with __copy_{from,to}_guest_pv(). Since it
falls in the same group, also convert clear_user(). Instead of adjusting
__raw_clear_guest(), drop it - it's unused and would require a non-
checking __clear_guest_pv() which we don't have.

Add previously missing __user at some call sites and in the function
declarations.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/emul-inv-op.c
+++ b/xen/arch/x86/pv/emul-inv-op.c
@@ -33,7 +33,7 @@ static int emulate_forced_invalid_op(str
     eip = regs->rip;
 
     /* Check for forced emulation signature: ud2 ; .ascii "xen". */
-    if ( (rc = copy_from_user(sig, (char *)eip, sizeof(sig))) != 0 )
+    if ( (rc = copy_from_guest_pv(sig, (char __user *)eip, sizeof(sig))) != 0 )
     {
         pv_inject_page_fault(0, eip + sizeof(sig) - rc);
         return EXCRET_fault_fixed;
@@ -43,7 +43,8 @@ static int emulate_forced_invalid_op(str
     eip += sizeof(sig);
 
     /* We only emulate CPUID. */
-    if ( ( rc = copy_from_user(instr, (char *)eip, sizeof(instr))) != 0 )
+    if ( (rc = copy_from_guest_pv(instr, (char __user *)eip,
+                                  sizeof(instr))) != 0 )
     {
         pv_inject_page_fault(0, eip + sizeof(instr) - rc);
         return EXCRET_fault_fixed;
--- a/xen/arch/x86/pv/iret.c
+++ b/xen/arch/x86/pv/iret.c
@@ -54,8 +54,8 @@ unsigned long do_iret(void)
     struct iret_context iret_saved;
     struct vcpu *v = current;
 
-    if ( unlikely(copy_from_user(&iret_saved, (void *)regs->rsp,
-                                 sizeof(iret_saved))) )
+    if ( unlikely(copy_from_guest_pv(&iret_saved, (void __user *)regs->rsp,
+                                     sizeof(iret_saved))) )
     {
         gprintk(XENLOG_ERR,
                 "Fault while reading IRET context from guest stack\n");
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -90,7 +90,8 @@ static int ptwr_emulated_update(unsigned
 
         /* Align address; read full word. */
         addr &= ~(sizeof(full) - 1);
-        if ( (rc = copy_from_user(&full, (void *)addr, sizeof(full))) != 0 )
+        if ( (rc = copy_from_guest_pv(&full, (void __user *)addr,
+                                      sizeof(full))) != 0 )
         {
             x86_emul_pagefault(0, /* Read fault. */
                                addr + sizeof(full) - rc,
--- a/xen/arch/x86/usercopy.c
+++ b/xen/arch/x86/usercopy.c
@@ -109,19 +109,17 @@ unsigned int copy_from_guest_ll(void *to
 #if GUARD(1) + 0
 
 /**
- * copy_to_user: - Copy a block of data into user space.
- * @to:   Destination address, in user space.
- * @from: Source address, in kernel space.
+ * copy_to_guest_pv: - Copy a block of data into guest space.
+ * @to:   Destination address, in guest space.
+ * @from: Source address, in hypervisor space.
  * @n:    Number of bytes to copy.
  *
- * Context: User context only.  This function may sleep.
- *
- * Copy data from kernel space to user space.
+ * Copy data from hypervisor space to guest space.
  *
  * Returns number of bytes that could not be copied.
  * On success, this will be zero.
  */
-unsigned copy_to_user(void __user *to, const void *from, unsigned n)
+unsigned int copy_to_guest_pv(void __user *to, const void *from, unsigned int n)
 {
     if ( access_ok(to, n) )
         n = __copy_to_guest_pv(to, from, n);
@@ -129,16 +127,16 @@ unsigned copy_to_user(void __user *to, c
 }
 
 /**
- * clear_user: - Zero a block of memory in user space.
- * @to:   Destination address, in user space.
+ * clear_guest_pv: - Zero a block of memory in guest space.
+ * @to:   Destination address, in guest space.
  * @n:    Number of bytes to zero.
  *
- * Zero a block of memory in user space.
+ * Zero a block of memory in guest space.
  *
  * Returns number of bytes that could not be cleared.
  * On success, this will be zero.
  */
-unsigned clear_user(void __user *to, unsigned n)
+unsigned int clear_guest_pv(void __user *to, unsigned int n)
 {
     if ( access_ok(to, n) )
     {
@@ -168,14 +166,12 @@ unsigned clear_user(void __user *to, uns
 }
 
 /**
- * copy_from_user: - Copy a block of data from user space.
- * @to:   Destination address, in kernel space.
- * @from: Source address, in user space.
+ * copy_from_guest_pv: - Copy a block of data from guest space.
+ * @to:   Destination address, in hypervisor space.
+ * @from: Source address, in guest space.
  * @n:    Number of bytes to copy.
  *
- * Context: User context only.  This function may sleep.
- *
- * Copy data from user space to kernel space.
+ * Copy data from guest space to hypervisor space.
  *
  * Returns number of bytes that could not be copied.
  * On success, this will be zero.
@@ -183,7 +179,8 @@ unsigned clear_user(void __user *to, uns
  * If some data could not be copied, this function will pad the copied
  * data to the requested size using zero bytes.
  */
-unsigned copy_from_user(void *to, const void __user *from, unsigned n)
+unsigned int copy_from_guest_pv(void *to, const void __user *from,
+                                unsigned int n)
 {
     if ( access_ok(from, n) )
         n = __copy_from_guest_pv(to, from, n);
--- a/xen/include/asm-x86/guest_access.h
+++ b/xen/include/asm-x86/guest_access.h
@@ -16,15 +16,15 @@
 #define raw_copy_to_guest(dst, src, len)        \
     (is_hvm_vcpu(current) ?                     \
      copy_to_user_hvm((dst), (src), (len)) :    \
-     copy_to_user((dst), (src), (len)))
+     copy_to_guest_pv(dst, src, len))
 #define raw_copy_from_guest(dst, src, len)      \
     (is_hvm_vcpu(current) ?                     \
      copy_from_user_hvm((dst), (src), (len)) :  \
-     copy_from_user((dst), (src), (len)))
+     copy_from_guest_pv(dst, src, len))
 #define raw_clear_guest(dst,  len)              \
     (is_hvm_vcpu(current) ?                     \
      clear_user_hvm((dst), (len)) :             \
-     clear_user((dst), (len)))
+     clear_guest_pv(dst, len))
 #define __raw_copy_to_guest(dst, src, len)      \
     (is_hvm_vcpu(current) ?                     \
      copy_to_user_hvm((dst), (src), (len)) :    \
@@ -33,10 +33,6 @@
     (is_hvm_vcpu(current) ?                     \
      copy_from_user_hvm((dst), (src), (len)) :  \
      __copy_from_guest_pv(dst, src, len))
-#define __raw_clear_guest(dst,  len)            \
-    (is_hvm_vcpu(current) ?                     \
-     clear_user_hvm((dst), (len)) :             \
-     clear_user((dst), (len)))
 
 /*
  * Pre-validate a guest handle.
--- a/xen/include/asm-x86/uaccess.h
+++ b/xen/include/asm-x86/uaccess.h
@@ -9,9 +9,11 @@
 
 #include <asm/x86_64/uaccess.h>
 
-unsigned copy_to_user(void *to, const void *from, unsigned len);
-unsigned clear_user(void *to, unsigned len);
-unsigned copy_from_user(void *to, const void *from, unsigned len);
+unsigned int copy_to_guest_pv(void __user *to, const void *from,
+                              unsigned int len);
+unsigned int clear_guest_pv(void __user *to, unsigned int len);
+unsigned int copy_from_guest_pv(void *to, const void __user *from,
+                                unsigned int len);
 
 /* Handles exceptions in both to and from, but doesn't do access_ok */
 unsigned int copy_to_guest_ll(void __user*to, const void *from, unsigned int n);


