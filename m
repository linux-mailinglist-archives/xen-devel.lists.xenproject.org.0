Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D1E31D675
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 09:20:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86148.161397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCI4h-0002Xy-Jz; Wed, 17 Feb 2021 08:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86148.161397; Wed, 17 Feb 2021 08:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCI4h-0002XZ-Gg; Wed, 17 Feb 2021 08:20:43 +0000
Received: by outflank-mailman (input) for mailman id 86148;
 Wed, 17 Feb 2021 08:20:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCI4g-0002XP-5s
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 08:20:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 362f80be-5f20-478f-9872-21791666509f;
 Wed, 17 Feb 2021 08:20:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D93AB018;
 Wed, 17 Feb 2021 08:20:38 +0000 (UTC)
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
X-Inumbo-ID: 362f80be-5f20-478f-9872-21791666509f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613550038; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1IZ8g9n5ogU05h+YXNeRGMJ3ZPl5ClDvsrVFXSKMzx8=;
	b=DVapiHp7OScD0KAm6Rk7W5nVKdedKh47c3q7IYxBMcyTJ8yR85WZkwz/66EdilQcR7veLf
	umYxLlNa42rULEbWPtxffWRXd09nqy0VlmAA9ILJcNLgKiZPOEH771lKux+E6OtCeVfIZT
	8MgecPW0flbUOVg6Wqdq8vsYIxm29xY=
Subject: [PATCH v2 3/8] x86/PV: harden guest memory accesses against
 speculative abuse
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
Message-ID: <ad99a113-ecc5-2548-c91e-81fa4fe6154a@suse.com>
Date: Wed, 17 Feb 2021 09:20:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Inspired by
https://lore.kernel.org/lkml/f12e7d3cecf41b2c29734ea45a393be21d4a8058.1597848273.git.jpoimboe@redhat.com/
and prior work in that area of x86 Linux, suppress speculation with
guest specified pointer values by suitably masking the addresses to
non-canonical space in case they fall into Xen's virtual address range.

Introduce a new Kconfig control.

Note that it is necessary in such code to avoid using "m" kind operands:
If we didn't, there would be no guarantee that the register passed to
guest_access_mask_ptr is also the (base) one used for the memory access.

As a minor unrelated change in get_unsafe_asm() the unnecessary "itype"
parameter gets dropped and the XOR on the fixup path gets changed to be
a 32-bit one in all cases: This way we avoid pointless REX.W or operand
size overrides, or writes to partial registers.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v2: Add comment to assembler macro.
---
The insn sequence chosen is certainly up for discussion; I've picked
this one despite the RCR because alternatives I could come up with,
like

	mov	$(HYPERVISOR_VIRT_END), %rax
	mov	$~0, %rdx
	mov	$0x7fffffffffffffff, %rcx
	cmp	%rax, %rdi
	cmovb	%rcx, %rdx
	and	%rdx, %rdi

weren't necessarily better: Either, as above, they are longer and
require a 3rd scratch register, or they also utilize the carry flag in
some similar way.
---
Judging from the comment ahead of put_unsafe_asm() we might as well not
tell gcc at all anymore about the memory access there, now that there's
no use of the operand anymore in the assembly code.

--- a/xen/arch/x86/usercopy.c
+++ b/xen/arch/x86/usercopy.c
@@ -10,12 +10,19 @@
 #include <xen/sched.h>
 #include <asm/uaccess.h>
 
-unsigned __copy_to_user_ll(void __user *to, const void *from, unsigned n)
+#ifndef GUARD
+# define GUARD UA_KEEP
+#endif
+
+unsigned int copy_to_guest_ll(void __user *to, const void *from, unsigned int n)
 {
     unsigned dummy;
 
     stac();
     asm volatile (
+        GUARD(
+        "    guest_access_mask_ptr %[to], %q[scratch1], %q[scratch2]\n"
+        )
         "    cmp  $"STR(2*BYTES_PER_LONG-1)", %[cnt]\n"
         "    jbe  1f\n"
         "    mov  %k[to], %[cnt]\n"
@@ -42,6 +49,7 @@ unsigned __copy_to_user_ll(void __user *
         _ASM_EXTABLE(1b, 2b)
         : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from),
           [aux] "=&r" (dummy)
+          GUARD(, [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy))
         : "[aux]" (n)
         : "memory" );
     clac();
@@ -49,12 +57,15 @@ unsigned __copy_to_user_ll(void __user *
     return n;
 }
 
-unsigned __copy_from_user_ll(void *to, const void __user *from, unsigned n)
+unsigned int copy_from_guest_ll(void *to, const void __user *from, unsigned int n)
 {
     unsigned dummy;
 
     stac();
     asm volatile (
+        GUARD(
+        "    guest_access_mask_ptr %[from], %q[scratch1], %q[scratch2]\n"
+        )
         "    cmp  $"STR(2*BYTES_PER_LONG-1)", %[cnt]\n"
         "    jbe  1f\n"
         "    mov  %k[to], %[cnt]\n"
@@ -87,6 +98,7 @@ unsigned __copy_from_user_ll(void *to, c
         _ASM_EXTABLE(1b, 6b)
         : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from),
           [aux] "=&r" (dummy)
+          GUARD(, [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy))
         : "[aux]" (n)
         : "memory" );
     clac();
@@ -94,6 +106,8 @@ unsigned __copy_from_user_ll(void *to, c
     return n;
 }
 
+#if GUARD(1) + 0
+
 /**
  * copy_to_user: - Copy a block of data into user space.
  * @to:   Destination address, in user space.
@@ -128,8 +142,11 @@ unsigned clear_user(void __user *to, uns
 {
     if ( access_ok(to, n) )
     {
+        long dummy;
+
         stac();
         asm volatile (
+            "    guest_access_mask_ptr %[to], %[scratch1], %[scratch2]\n"
             "0:  rep stos"__OS"\n"
             "    mov  %[bytes], %[cnt]\n"
             "1:  rep stosb\n"
@@ -140,7 +157,8 @@ unsigned clear_user(void __user *to, uns
             ".previous\n"
             _ASM_EXTABLE(0b,3b)
             _ASM_EXTABLE(1b,2b)
-            : [cnt] "=&c" (n), [to] "+D" (to)
+            : [cnt] "=&c" (n), [to] "+D" (to), [scratch1] "=&r" (dummy),
+              [scratch2] "=&r" (dummy)
             : [bytes] "r" (n & (BYTES_PER_LONG - 1)),
               [longs] "0" (n / BYTES_PER_LONG), "a" (0) );
         clac();
@@ -174,6 +192,16 @@ unsigned copy_from_user(void *to, const
     return n;
 }
 
+# undef GUARD
+# define GUARD UA_DROP
+# define copy_to_guest_ll copy_to_unsafe_ll
+# define copy_from_guest_ll copy_from_unsafe_ll
+# undef __user
+# define __user
+# include __FILE__
+
+#endif /* GUARD(1) */
+
 /*
  * Local variables:
  * mode: C
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -458,6 +458,8 @@ UNLIKELY_START(g, create_bounce_frame_ba
         jmp   asm_domain_crash_synchronous  /* Does not return */
 __UNLIKELY_END(create_bounce_frame_bad_sp)
 
+        guest_access_mask_ptr %rsi, %rax, %rcx
+
 #define STORE_GUEST_STACK(reg, n) \
 0:      movq  %reg,(n)*8(%rsi); \
         _ASM_EXTABLE(0b, domain_crash_page_fault_ ## n ## x8)
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -111,6 +111,24 @@ config SPECULATIVE_HARDEN_BRANCH
 
 	  If unsure, say Y.
 
+config SPECULATIVE_HARDEN_GUEST_ACCESS
+	bool "Speculative PV Guest Memory Access Hardening"
+	default y
+	depends on PV
+	help
+	  Contemporary processors may use speculative execution as a
+	  performance optimisation, but this can potentially be abused by an
+	  attacker to leak data via speculative sidechannels.
+
+	  One source of data leakage is via speculative accesses to hypervisor
+	  memory through guest controlled values used to access guest memory.
+
+	  When enabled, code paths accessing PV guest memory will have guest
+	  controlled addresses massaged such that memory accesses through them
+	  won't touch hypervisor address space.
+
+	  If unsure, say Y.
+
 endmenu
 
 config HYPFS
--- a/xen/include/asm-x86/asm-defns.h
+++ b/xen/include/asm-x86/asm-defns.h
@@ -56,3 +56,23 @@
 .macro INDIRECT_JMP arg:req
     INDIRECT_BRANCH jmp \arg
 .endm
+
+.macro guest_access_mask_ptr ptr:req, scratch1:req, scratch2:req
+#if defined(CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS)
+    /*
+     * Here we want
+     *
+     * ptr &= ~0ull >> (ptr < HYPERVISOR_VIRT_END);
+     *
+     * but guaranteed without any conditional branches (hence in assembly).
+     */
+    mov $(HYPERVISOR_VIRT_END - 1), \scratch1
+    mov $~0, \scratch2
+    cmp \ptr, \scratch1
+    rcr $1, \scratch2
+    and \scratch2, \ptr
+#elif defined(CONFIG_DEBUG) && defined(CONFIG_PV)
+    xor $~\@, \scratch1
+    xor $~\@, \scratch2
+#endif
+.endm
--- a/xen/include/asm-x86/uaccess.h
+++ b/xen/include/asm-x86/uaccess.h
@@ -12,13 +12,19 @@
 unsigned copy_to_user(void *to, const void *from, unsigned len);
 unsigned clear_user(void *to, unsigned len);
 unsigned copy_from_user(void *to, const void *from, unsigned len);
+
 /* Handles exceptions in both to and from, but doesn't do access_ok */
-unsigned __copy_to_user_ll(void __user*to, const void *from, unsigned n);
-unsigned __copy_from_user_ll(void *to, const void __user *from, unsigned n);
+unsigned int copy_to_guest_ll(void __user*to, const void *from, unsigned int n);
+unsigned int copy_from_guest_ll(void *to, const void __user *from, unsigned int n);
+unsigned int copy_to_unsafe_ll(void *to, const void *from, unsigned int n);
+unsigned int copy_from_unsafe_ll(void *to, const void *from, unsigned int n);
 
 extern long __get_user_bad(void);
 extern void __put_user_bad(void);
 
+#define UA_KEEP(args...) args
+#define UA_DROP(args...)
+
 /**
  * get_user: - Get a simple variable from user space.
  * @x:   Variable to store result.
@@ -77,7 +83,6 @@ extern void __put_user_bad(void);
  * On error, the variable @x is set to zero.
  */
 #define __get_guest(x, ptr) get_guest_nocheck(x, ptr, sizeof(*(ptr)))
-#define get_unsafe __get_guest
 
 /**
  * __put_guest: - Write a simple value into guest space, with less checking.
@@ -98,7 +103,13 @@ extern void __put_user_bad(void);
  */
 #define __put_guest(x, ptr) \
     put_guest_nocheck((__typeof__(*(ptr)))(x), ptr, sizeof(*(ptr)))
-#define put_unsafe __put_guest
+
+#define put_unsafe(x, ptr)						\
+({									\
+	int err_; 							\
+	put_unsafe_size(x, ptr, sizeof(*(ptr)), UA_DROP, err_, -EFAULT);\
+	err_;								\
+})
 
 #define put_guest_nocheck(x, ptr, size)					\
 ({									\
@@ -115,6 +126,13 @@ extern void __put_user_bad(void);
 			       : -EFAULT;				\
 })
 
+#define get_unsafe(x, ptr)						\
+({									\
+	int err_; 							\
+	get_unsafe_size(x, ptr, sizeof(*(ptr)), UA_DROP, err_, -EFAULT);\
+	err_;								\
+})
+
 #define get_guest_nocheck(x, ptr, size)					\
 ({									\
 	int err_; 							\
@@ -138,62 +156,87 @@ struct __large_struct { unsigned long bu
  * we do not write to any memory gcc knows about, so there are no
  * aliasing issues.
  */
-#define put_unsafe_asm(x, addr, err, itype, rtype, ltype, errret)	\
+#define put_unsafe_asm(x, addr, GUARD, err, itype, rtype, ltype, errret) \
 	stac();								\
 	__asm__ __volatile__(						\
-		"1:	mov"itype" %"rtype"1,%2\n"			\
+		GUARD(							\
+		"	guest_access_mask_ptr %[ptr], %[scr1], %[scr2]\n" \
+		)							\
+		"1:	mov"itype" %"rtype"[val], (%[ptr])\n"		\
 		"2:\n"							\
 		".section .fixup,\"ax\"\n"				\
-		"3:	mov %3,%0\n"					\
+		"3:	mov %[errno], %[ret]\n"				\
 		"	jmp 2b\n"					\
 		".previous\n"						\
 		_ASM_EXTABLE(1b, 3b)					\
-		: "=r"(err)						\
-		: ltype (x), "m"(__m(addr)), "i"(errret), "0"(err));	\
+		: [ret] "+r" (err), [ptr] "=&r" (dummy_)		\
+		  GUARD(, [scr1] "=&r" (dummy_), [scr2] "=&r" (dummy_))	\
+		: [val] ltype (x), "m" (__m(addr)),			\
+		  "[ptr]" (addr), [errno] "i" (errret));		\
 	clac()
 
-#define get_unsafe_asm(x, addr, err, itype, rtype, ltype, errret)	\
+#define get_unsafe_asm(x, addr, GUARD, err, rtype, ltype, errret)	\
 	stac();								\
 	__asm__ __volatile__(						\
-		"1:	mov"itype" %2,%"rtype"1\n"			\
+		GUARD(							\
+		"	guest_access_mask_ptr %[ptr], %[scr1], %[scr2]\n" \
+		)							\
+		"1:	mov (%[ptr]), %"rtype"[val]\n"			\
 		"2:\n"							\
 		".section .fixup,\"ax\"\n"				\
-		"3:	mov %3,%0\n"					\
-		"	xor"itype" %"rtype"1,%"rtype"1\n"		\
+		"3:	mov %[errno], %[ret]\n"				\
+		"	xor %k[val], %k[val]\n"				\
 		"	jmp 2b\n"					\
 		".previous\n"						\
 		_ASM_EXTABLE(1b, 3b)					\
-		: "=r"(err), ltype (x)					\
-		: "m"(__m(addr)), "i"(errret), "0"(err));		\
+		: [ret] "+r" (err), [val] ltype (x),			\
+		  [ptr] "=&r" (dummy_)					\
+		  GUARD(, [scr1] "=&r" (dummy_), [scr2] "=&r" (dummy_))	\
+		: "m" (__m(addr)), "[ptr]" (addr),			\
+		  [errno] "i" (errret));				\
 	clac()
 
-#define put_unsafe_size(x, ptr, size, retval, errret)                      \
+#define put_unsafe_size(x, ptr, size, grd, retval, errret)                 \
 do {                                                                       \
     retval = 0;                                                            \
     switch ( size )                                                        \
     {                                                                      \
-    case 1: put_unsafe_asm(x, ptr, retval, "b", "b", "iq", errret); break; \
-    case 2: put_unsafe_asm(x, ptr, retval, "w", "w", "ir", errret); break; \
-    case 4: put_unsafe_asm(x, ptr, retval, "l", "k", "ir", errret); break; \
-    case 8: put_unsafe_asm(x, ptr, retval, "q",  "", "ir", errret); break; \
+    long dummy_;                                                           \
+    case 1:                                                                \
+        put_unsafe_asm(x, ptr, grd, retval, "b", "b", "iq", errret);       \
+        break;                                                             \
+    case 2:                                                                \
+        put_unsafe_asm(x, ptr, grd, retval, "w", "w", "ir", errret);       \
+        break;                                                             \
+    case 4:                                                                \
+        put_unsafe_asm(x, ptr, grd, retval, "l", "k", "ir", errret);       \
+        break;                                                             \
+    case 8:                                                                \
+        put_unsafe_asm(x, ptr, grd, retval, "q",  "", "ir", errret);       \
+        break;                                                             \
     default: __put_user_bad();                                             \
     }                                                                      \
 } while ( false )
-#define put_guest_size put_unsafe_size
 
-#define get_unsafe_size(x, ptr, size, retval, errret)                      \
+#define put_guest_size(x, ptr, size, retval, errret) \
+    put_unsafe_size(x, ptr, size, UA_KEEP, retval, errret)
+
+#define get_unsafe_size(x, ptr, size, grd, retval, errret)                 \
 do {                                                                       \
     retval = 0;                                                            \
     switch ( size )                                                        \
     {                                                                      \
-    case 1: get_unsafe_asm(x, ptr, retval, "b", "b", "=q", errret); break; \
-    case 2: get_unsafe_asm(x, ptr, retval, "w", "w", "=r", errret); break; \
-    case 4: get_unsafe_asm(x, ptr, retval, "l", "k", "=r", errret); break; \
-    case 8: get_unsafe_asm(x, ptr, retval, "q",  "", "=r", errret); break; \
+    long dummy_;                                                           \
+    case 1: get_unsafe_asm(x, ptr, grd, retval, "b", "=q", errret); break; \
+    case 2: get_unsafe_asm(x, ptr, grd, retval, "w", "=r", errret); break; \
+    case 4: get_unsafe_asm(x, ptr, grd, retval, "k", "=r", errret); break; \
+    case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
     default: __get_user_bad();                                             \
     }                                                                      \
 } while ( false )
-#define get_guest_size get_unsafe_size
+
+#define get_guest_size(x, ptr, size, retval, errret)                       \
+    get_unsafe_size(x, ptr, size, UA_KEEP, retval, errret)
 
 /**
  * __copy_to_guest_pv: - Copy a block of data into guest space, with less
@@ -229,9 +272,8 @@ __copy_to_guest_pv(void __user *to, cons
             return ret;
         }
     }
-    return __copy_to_user_ll(to, from, n);
+    return copy_to_guest_ll(to, from, n);
 }
-#define copy_to_unsafe __copy_to_guest_pv
 
 /**
  * __copy_from_guest_pv: - Copy a block of data from guest space, with less
@@ -270,9 +312,87 @@ __copy_from_guest_pv(void *to, const voi
             return ret;
         }
     }
-    return __copy_from_user_ll(to, from, n);
+    return copy_from_guest_ll(to, from, n);
+}
+
+/**
+ * copy_to_unsafe: - Copy a block of data to unsafe space, with exception
+ *                   checking
+ * @to:   Unsafe destination address.
+ * @from: Safe source address, in hypervisor space.
+ * @n:    Number of bytes to copy.
+ *
+ * Copy data from hypervisor space to a potentially unmapped area.
+ *
+ * Returns number of bytes that could not be copied.
+ * On success, this will be zero.
+ */
+static always_inline unsigned int
+copy_to_unsafe(void __user *to, const void *from, unsigned int n)
+{
+    if (__builtin_constant_p(n)) {
+        unsigned long ret;
+
+        switch (n) {
+        case 1:
+            put_unsafe_size(*(const uint8_t *)from, to, 1, UA_DROP, ret, 1);
+            return ret;
+        case 2:
+            put_unsafe_size(*(const uint16_t *)from, to, 2, UA_DROP, ret, 2);
+            return ret;
+        case 4:
+            put_unsafe_size(*(const uint32_t *)from, to, 4, UA_DROP, ret, 4);
+            return ret;
+        case 8:
+            put_unsafe_size(*(const uint64_t *)from, to, 8, UA_DROP, ret, 8);
+            return ret;
+        }
+    }
+
+    return copy_to_unsafe_ll(to, from, n);
+}
+
+/**
+ * copy_from_unsafe: - Copy a block of data from unsafe space, with exception
+ *                     checking
+ * @to:   Safe destination address, in hypervisor space.
+ * @from: Unsafe source address.
+ * @n:    Number of bytes to copy.
+ *
+ * Copy data from a potentially unmapped area space to hypervisor space.
+ *
+ * Returns number of bytes that could not be copied.
+ * On success, this will be zero.
+ *
+ * If some data could not be copied, this function will pad the copied
+ * data to the requested size using zero bytes.
+ */
+static always_inline unsigned int
+copy_from_unsafe(void *to, const void __user *from, unsigned int n)
+{
+    if ( __builtin_constant_p(n) )
+    {
+        unsigned long ret;
+
+        switch ( n )
+        {
+        case 1:
+            get_unsafe_size(*(uint8_t *)to, from, 1, UA_DROP, ret, 1);
+            return ret;
+        case 2:
+            get_unsafe_size(*(uint16_t *)to, from, 2, UA_DROP, ret, 2);
+            return ret;
+        case 4:
+            get_unsafe_size(*(uint32_t *)to, from, 4, UA_DROP, ret, 4);
+            return ret;
+        case 8:
+            get_unsafe_size(*(uint64_t *)to, from, 8, UA_DROP, ret, 8);
+            return ret;
+        }
+    }
+
+    return copy_from_unsafe_ll(to, from, n);
 }
-#define copy_from_unsafe __copy_from_guest_pv
 
 /*
  * The exception table consists of pairs of addresses: the first is the


