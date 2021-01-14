Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC522F639F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67071.119411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04Aa-00058v-1z; Thu, 14 Jan 2021 15:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67071.119411; Thu, 14 Jan 2021 15:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04AZ-00058Z-UZ; Thu, 14 Jan 2021 15:04:15 +0000
Received: by outflank-mailman (input) for mailman id 67071;
 Thu, 14 Jan 2021 15:04:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04AX-00058E-KH
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:04:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 131d842a-63aa-4986-bf59-7144e53a5032;
 Thu, 14 Jan 2021 15:04:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF08BAC63;
 Thu, 14 Jan 2021 15:04:10 +0000 (UTC)
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
X-Inumbo-ID: 131d842a-63aa-4986-bf59-7144e53a5032
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610636651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E6cgTDDmsYBHikcxuCjozMEbdRkwMNEgGlD2Q1ohd0Y=;
	b=plMD9HXBOdEUNp9sZ/twJU6Ae7608qlZaQRif/i/7Vjqud6qDK2SJFL6cqH4SJEs5MRyto
	ErjI1TT+zslepr6oAII4z4FzbCzC6HOG+WtSr2aBf4Sbh7ByQTalHB3+QG1mX32RyJB/S7
	Yy5XFcXjfIo1WmLJiP5B0Ge02sO2gVk=
Subject: [PATCH 02/17] x86: split __{get,put}_user() into "guest" and "unsafe"
 variants
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Message-ID: <13d1d621-21db-0e59-6603-2b22b6a9d180@suse.com>
Date: Thu, 14 Jan 2021 16:04:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The "guest" variants are intended to work with (potentially) fully guest
controlled addresses, while the "unsafe" variants are not. (For
descriptor table accesses the low bits of the addresses may still be
guest controlled, but this still won't allow speculation to "escape"
into unwanted areas.) Subsequently we will want them to have different
behavior, so as first step identify which one is which. For now, both
groups of constructs alias one another.

Double underscore prefixes are retained only on __{get,put}_guest(), to
allow still distinguishing them from their "checking" counterparts once
they also get renamed (to {get,put}_guest()).

Since for them it's almost a full re-write, move what becomes
{get,put}_unsafe_size() into the "common" uaccess.h (x86_64/*.h should
disappear at some point anyway).

In __copy_to_user() one of the two casts in each put_guest_size()
invocation gets dropped. They're not needed and did break symmetry with
__copy_from_user().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -776,9 +776,9 @@ shadow_write_entries(void *d, void *s, i
     /* Because we mirror access rights at all levels in the shadow, an
      * l2 (or higher) entry with the RW bit cleared will leave us with
      * no write access through the linear map.
-     * We detect that by writing to the shadow with __put_user() and
+     * We detect that by writing to the shadow with put_unsafe() and
      * using map_domain_page() to get a writeable mapping if we need to. */
-    if ( __put_user(*dst, dst) )
+    if ( put_unsafe(*dst, dst) )
     {
         perfc_incr(shadow_linear_map_failed);
         map = map_domain_page(mfn);
--- a/xen/arch/x86/pv/emul-gate-op.c
+++ b/xen/arch/x86/pv/emul-gate-op.c
@@ -40,7 +40,7 @@ static int read_gate_descriptor(unsigned
          ((gate_sel >> 3) + !is_pv_32bit_vcpu(v) >=
           (gate_sel & 4 ? v->arch.pv.ldt_ents
                         : v->arch.pv.gdt_ents)) ||
-         __get_user(desc, pdesc) )
+         get_unsafe(desc, pdesc) )
         return 0;
 
     *sel = (desc.a >> 16) & 0x0000fffc;
@@ -59,7 +59,7 @@ static int read_gate_descriptor(unsigned
     {
         if ( (*ar & 0x1f00) != 0x0c00 ||
              /* Limit check done above already. */
-             __get_user(desc, pdesc + 1) ||
+             get_unsafe(desc, pdesc + 1) ||
              (desc.b & 0x1f00) )
             return 0;
 
@@ -294,7 +294,7 @@ void pv_emulate_gate_op(struct cpu_user_
         { \
             --stkp; \
             esp -= 4; \
-            rc = __put_user(item, stkp); \
+            rc = __put_guest(item, stkp); \
             if ( rc ) \
             { \
                 pv_inject_page_fault(PFEC_write_access, \
@@ -362,7 +362,7 @@ void pv_emulate_gate_op(struct cpu_user_
                     unsigned int parm;
 
                     --ustkp;
-                    rc = __get_user(parm, ustkp);
+                    rc = __get_guest(parm, ustkp);
                     if ( rc )
                     {
                         pv_inject_page_fault(0, (unsigned long)(ustkp + 1) - rc);
--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -34,13 +34,13 @@ int pv_emul_read_descriptor(unsigned int
     if ( sel < 4 ||
          /*
           * Don't apply the GDT limit here, as the selector may be a Xen
-          * provided one. __get_user() will fail (without taking further
+          * provided one. get_unsafe() will fail (without taking further
           * action) for ones falling in the gap between guest populated
           * and Xen ones.
           */
          ((sel & 4) && (sel >> 3) >= v->arch.pv.ldt_ents) )
         desc.b = desc.a = 0;
-    else if ( __get_user(desc, gdt_ldt_desc_ptr(sel)) )
+    else if ( get_unsafe(desc, gdt_ldt_desc_ptr(sel)) )
         return 0;
     if ( !insn_fetch )
         desc.b &= ~_SEGMENT_L;
--- a/xen/arch/x86/pv/iret.c
+++ b/xen/arch/x86/pv/iret.c
@@ -114,15 +114,15 @@ unsigned int compat_iret(void)
     regs->rsp = (u32)regs->rsp;
 
     /* Restore EAX (clobbered by hypercall). */
-    if ( unlikely(__get_user(regs->eax, (u32 *)regs->rsp)) )
+    if ( unlikely(__get_guest(regs->eax, (u32 *)regs->rsp)) )
     {
         domain_crash(v->domain);
         return 0;
     }
 
     /* Restore CS and EIP. */
-    if ( unlikely(__get_user(regs->eip, (u32 *)regs->rsp + 1)) ||
-        unlikely(__get_user(regs->cs, (u32 *)regs->rsp + 2)) )
+    if ( unlikely(__get_guest(regs->eip, (u32 *)regs->rsp + 1)) ||
+        unlikely(__get_guest(regs->cs, (u32 *)regs->rsp + 2)) )
     {
         domain_crash(v->domain);
         return 0;
@@ -132,7 +132,7 @@ unsigned int compat_iret(void)
      * Fix up and restore EFLAGS. We fix up in a local staging area
      * to avoid firing the BUG_ON(IOPL) check in arch_get_info_guest.
      */
-    if ( unlikely(__get_user(eflags, (u32 *)regs->rsp + 3)) )
+    if ( unlikely(__get_guest(eflags, (u32 *)regs->rsp + 3)) )
     {
         domain_crash(v->domain);
         return 0;
@@ -164,16 +164,16 @@ unsigned int compat_iret(void)
         {
             for (i = 1; i < 10; ++i)
             {
-                rc |= __get_user(x, (u32 *)regs->rsp + i);
-                rc |= __put_user(x, (u32 *)(unsigned long)ksp + i);
+                rc |= __get_guest(x, (u32 *)regs->rsp + i);
+                rc |= __put_guest(x, (u32 *)(unsigned long)ksp + i);
             }
         }
         else if ( ksp > regs->esp )
         {
             for ( i = 9; i > 0; --i )
             {
-                rc |= __get_user(x, (u32 *)regs->rsp + i);
-                rc |= __put_user(x, (u32 *)(unsigned long)ksp + i);
+                rc |= __get_guest(x, (u32 *)regs->rsp + i);
+                rc |= __put_guest(x, (u32 *)(unsigned long)ksp + i);
             }
         }
         if ( rc )
@@ -189,7 +189,7 @@ unsigned int compat_iret(void)
             eflags &= ~X86_EFLAGS_IF;
         regs->eflags &= ~(X86_EFLAGS_VM|X86_EFLAGS_RF|
                           X86_EFLAGS_NT|X86_EFLAGS_TF);
-        if ( unlikely(__put_user(0, (u32 *)regs->rsp)) )
+        if ( unlikely(__put_guest(0, (u32 *)regs->rsp)) )
         {
             domain_crash(v->domain);
             return 0;
@@ -205,8 +205,8 @@ unsigned int compat_iret(void)
     else if ( ring_1(regs) )
         regs->esp += 16;
     /* Return to ring 2/3: restore ESP and SS. */
-    else if ( __get_user(regs->ss, (u32 *)regs->rsp + 5) ||
-              __get_user(regs->esp, (u32 *)regs->rsp + 4) )
+    else if ( __get_guest(regs->ss, (u32 *)regs->rsp + 5) ||
+              __get_guest(regs->esp, (u32 *)regs->rsp + 4) )
     {
         domain_crash(v->domain);
         return 0;
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -274,7 +274,7 @@ static void compat_show_guest_stack(stru
     {
         if ( (((long)stack - 1) ^ ((long)(stack + 1) - 1)) & mask )
             break;
-        if ( __get_user(addr, stack) )
+        if ( get_unsafe(addr, stack) )
         {
             if ( i != 0 )
                 printk("\n    ");
@@ -343,7 +343,7 @@ static void show_guest_stack(struct vcpu
     {
         if ( (((long)stack - 1) ^ ((long)(stack + 1) - 1)) & mask )
             break;
-        if ( __get_user(addr, stack) )
+        if ( get_unsafe(addr, stack) )
         {
             if ( i != 0 )
                 printk("\n    ");
--- a/xen/include/asm-x86/uaccess.h
+++ b/xen/include/asm-x86/uaccess.h
@@ -60,13 +60,11 @@ extern void __put_user_bad(void);
   __put_user_check((__typeof__(*(ptr)))(x),(ptr),sizeof(*(ptr)))
 
 /**
- * __get_user: - Get a simple variable from user space, with less checking.
+ * __get_guest: - Get a simple variable from guest space, with less checking.
  * @x:   Variable to store result.
- * @ptr: Source address, in user space.
+ * @ptr: Source address, in guest space.
  *
- * Context: User context only.  This function may sleep.
- *
- * This macro copies a single simple variable from user space to kernel
+ * This macro copies a single simple variable from guest space to hypervisor
  * space.  It supports simple types like char and int, but not larger
  * data types like structures or arrays.
  *
@@ -79,17 +77,15 @@ extern void __put_user_bad(void);
  * Returns zero on success, or -EFAULT on error.
  * On error, the variable @x is set to zero.
  */
-#define __get_user(x,ptr) \
-  __get_user_nocheck((x),(ptr),sizeof(*(ptr)))
+#define __get_guest(x, ptr) get_guest_nocheck(x, ptr, sizeof(*(ptr)))
+#define get_unsafe __get_guest
 
 /**
- * __put_user: - Write a simple value into user space, with less checking.
- * @x:   Value to copy to user space.
- * @ptr: Destination address, in user space.
+ * __put_guest: - Write a simple value into guest space, with less checking.
+ * @x:   Value to store in guest space.
+ * @ptr: Destination address, in guest space.
  *
- * Context: User context only.  This function may sleep.
- *
- * This macro copies a single simple value from kernel space to user
+ * This macro copies a single simple value from hypervisor space to guest
  * space.  It supports simple types like char and int, but not larger
  * data types like structures or arrays.
  *
@@ -101,13 +97,14 @@ extern void __put_user_bad(void);
  *
  * Returns zero on success, or -EFAULT on error.
  */
-#define __put_user(x,ptr) \
-  __put_user_nocheck((__typeof__(*(ptr)))(x),(ptr),sizeof(*(ptr)))
+#define __put_guest(x, ptr) \
+    put_guest_nocheck((__typeof__(*(ptr)))(x), ptr, sizeof(*(ptr)))
+#define put_unsafe __put_guest
 
-#define __put_user_nocheck(x, ptr, size)				\
+#define put_guest_nocheck(x, ptr, size)					\
 ({									\
 	int err_; 							\
-	__put_user_size(x, ptr, size, err_, -EFAULT);			\
+	put_guest_size(x, ptr, size, err_, -EFAULT);			\
 	err_;								\
 })
 
@@ -115,14 +112,14 @@ extern void __put_user_bad(void);
 ({									\
 	__typeof__(*(ptr)) __user *ptr_ = (ptr);			\
 	__typeof__(size) size_ = (size);				\
-	access_ok(ptr_, size_) ? __put_user_nocheck(x, ptr_, size_)	\
+	access_ok(ptr_, size_) ? put_guest_nocheck(x, ptr_, size_)	\
 			       : -EFAULT;				\
 })
 
-#define __get_user_nocheck(x, ptr, size)				\
+#define get_guest_nocheck(x, ptr, size)					\
 ({									\
 	int err_; 							\
-	__get_user_size(x, ptr, size, err_, -EFAULT);			\
+	get_guest_size(x, ptr, size, err_, -EFAULT);			\
 	err_;								\
 })
 
@@ -130,7 +127,7 @@ extern void __put_user_bad(void);
 ({									\
 	__typeof__(*(ptr)) __user *ptr_ = (ptr);			\
 	__typeof__(size) size_ = (size);				\
-	access_ok(ptr_, size_) ? __get_user_nocheck(x, ptr_, size_)	\
+	access_ok(ptr_, size_) ? get_guest_nocheck(x, ptr_, size_)	\
 			       : -EFAULT;				\
 })
 
@@ -142,7 +139,7 @@ struct __large_struct { unsigned long bu
  * we do not write to any memory gcc knows about, so there are no
  * aliasing issues.
  */
-#define __put_user_asm(x, addr, err, itype, rtype, ltype, errret)	\
+#define put_unsafe_asm(x, addr, err, itype, rtype, ltype, errret)	\
 	stac();								\
 	__asm__ __volatile__(						\
 		"1:	mov"itype" %"rtype"1,%2\n"			\
@@ -156,7 +153,7 @@ struct __large_struct { unsigned long bu
 		: ltype (x), "m"(__m(addr)), "i"(errret), "0"(err));	\
 	clac()
 
-#define __get_user_asm(x, addr, err, itype, rtype, ltype, errret)	\
+#define get_unsafe_asm(x, addr, err, itype, rtype, ltype, errret)	\
 	stac();								\
 	__asm__ __volatile__(						\
 		"1:	mov"itype" %2,%"rtype"1\n"			\
@@ -171,6 +168,34 @@ struct __large_struct { unsigned long bu
 		: "m"(__m(addr)), "i"(errret), "0"(err));		\
 	clac()
 
+#define put_unsafe_size(x, ptr, size, retval, errret)                      \
+do {                                                                       \
+    retval = 0;                                                            \
+    switch ( size )                                                        \
+    {                                                                      \
+    case 1: put_unsafe_asm(x, ptr, retval, "b", "b", "iq", errret); break; \
+    case 2: put_unsafe_asm(x, ptr, retval, "w", "w", "ir", errret); break; \
+    case 4: put_unsafe_asm(x, ptr, retval, "l", "k", "ir", errret); break; \
+    case 8: put_unsafe_asm(x, ptr, retval, "q",  "", "ir", errret); break; \
+    default: __put_user_bad();                                             \
+    }                                                                      \
+} while ( false )
+#define put_guest_size put_unsafe_size
+
+#define get_unsafe_size(x, ptr, size, retval, errret)                      \
+do {                                                                       \
+    retval = 0;                                                            \
+    switch ( size )                                                        \
+    {                                                                      \
+    case 1: get_unsafe_asm(x, ptr, retval, "b", "b", "=q", errret); break; \
+    case 2: get_unsafe_asm(x, ptr, retval, "w", "w", "=r", errret); break; \
+    case 4: get_unsafe_asm(x, ptr, retval, "l", "k", "=r", errret); break; \
+    case 8: get_unsafe_asm(x, ptr, retval, "q",  "", "=r", errret); break; \
+    default: __get_user_bad();                                             \
+    }                                                                      \
+} while ( false )
+#define get_guest_size get_unsafe_size
+
 /**
  * __copy_to_user: - Copy a block of data into user space, with less checking
  * @to:   Destination address, in user space.
@@ -193,16 +218,16 @@ __copy_to_user(void __user *to, const vo
 
         switch (n) {
         case 1:
-            __put_user_size(*(const u8 *)from, (u8 __user *)to, 1, ret, 1);
+            put_guest_size(*(const uint8_t *)from, to, 1, ret, 1);
             return ret;
         case 2:
-            __put_user_size(*(const u16 *)from, (u16 __user *)to, 2, ret, 2);
+            put_guest_size(*(const uint16_t *)from, to, 2, ret, 2);
             return ret;
         case 4:
-            __put_user_size(*(const u32 *)from, (u32 __user *)to, 4, ret, 4);
+            put_guest_size(*(const uint32_t *)from, to, 4, ret, 4);
             return ret;
         case 8:
-            __put_user_size(*(const u64 *)from, (u64 __user *)to, 8, ret, 8);
+            put_guest_size(*(const uint64_t *)from, to, 8, ret, 8);
             return ret;
         }
     }
@@ -234,16 +259,16 @@ __copy_from_user(void *to, const void __
 
         switch (n) {
         case 1:
-            __get_user_size(*(u8 *)to, from, 1, ret, 1);
+            get_guest_size(*(uint8_t *)to, from, 1, ret, 1);
             return ret;
         case 2:
-            __get_user_size(*(u16 *)to, from, 2, ret, 2);
+            get_guest_size(*(uint16_t *)to, from, 2, ret, 2);
             return ret;
         case 4:
-            __get_user_size(*(u32 *)to, from, 4, ret, 4);
+            get_guest_size(*(uint32_t *)to, from, 4, ret, 4);
             return ret;
         case 8:
-            __get_user_size(*(u64*)to, from, 8, ret, 8);
+            get_guest_size(*(uint64_t *)to, from, 8, ret, 8);
             return ret;
         }
     }
--- a/xen/include/asm-x86/x86_64/uaccess.h
+++ b/xen/include/asm-x86/x86_64/uaccess.h
@@ -57,28 +57,4 @@ extern void *xlat_malloc(unsigned long *
     (likely((count) < (~0U / (size))) && \
      compat_access_ok(addr, 0 + (count) * (size)))
 
-#define __put_user_size(x,ptr,size,retval,errret)			\
-do {									\
-	retval = 0;							\
-	switch (size) {							\
-	case 1: __put_user_asm(x,ptr,retval,"b","b","iq",errret);break;	\
-	case 2: __put_user_asm(x,ptr,retval,"w","w","ir",errret);break; \
-	case 4: __put_user_asm(x,ptr,retval,"l","k","ir",errret);break;	\
-	case 8: __put_user_asm(x,ptr,retval,"q","","ir",errret);break;	\
-	default: __put_user_bad();					\
-	}								\
-} while (0)
-
-#define __get_user_size(x,ptr,size,retval,errret)			\
-do {									\
-	retval = 0;							\
-	switch (size) {							\
-	case 1: __get_user_asm(x,ptr,retval,"b","b","=q",errret);break;	\
-	case 2: __get_user_asm(x,ptr,retval,"w","w","=r",errret);break;	\
-	case 4: __get_user_asm(x,ptr,retval,"l","k","=r",errret);break;	\
-	case 8: __get_user_asm(x,ptr,retval,"q","","=r",errret); break;	\
-	default: __get_user_bad();					\
-	}								\
-} while (0)
-
 #endif /* __X86_64_UACCESS_H */
--- a/xen/test/livepatch/xen_hello_world_func.c
+++ b/xen/test/livepatch/xen_hello_world_func.c
@@ -26,7 +26,7 @@ const char *xen_hello_world(void)
      * Any BUG, or WARN_ON will contain symbol and payload name. Furthermore
      * exceptions will be caught and processed properly.
      */
-    rc = __get_user(tmp, non_canonical_addr);
+    rc = get_unsafe(tmp, non_canonical_addr);
     BUG_ON(rc != -EFAULT);
 #endif
 #if defined(CONFIG_ARM)


