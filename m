Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 783982F63A1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:04:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67075.119424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04At-0005Es-F2; Thu, 14 Jan 2021 15:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67075.119424; Thu, 14 Jan 2021 15:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04At-0005ER-BO; Thu, 14 Jan 2021 15:04:35 +0000
Received: by outflank-mailman (input) for mailman id 67075;
 Thu, 14 Jan 2021 15:04:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04Ar-0005EA-VK
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:04:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5f85c02-ac6b-4d41-a782-aec0bacb498c;
 Thu, 14 Jan 2021 15:04:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9F26AC63;
 Thu, 14 Jan 2021 15:04:31 +0000 (UTC)
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
X-Inumbo-ID: d5f85c02-ac6b-4d41-a782-aec0bacb498c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610636671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kEOD8ziAyq6w4RKqlPNi4uvVoOz1zCU2GR0j65fmrVk=;
	b=FKgxmfXXpvKVgKcqnsS9MzyjTUc465QCmJ5LYILDr0d6af32du0u3HVoSCztvVE9yf2Pys
	OX0mIhaALZmeb/agVLnZpKS+/jftXq2p5USWrT7vH1+y39HvPNKXKIM3iKx1GvQQCf57tm
	sAQKGCocMBBYbAdUdqlZti6UeLvKSSQ=
Subject: [PATCH 03/17] x86: split __copy_{from,to}_user() into "guest" and
 "unsafe" variants
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Message-ID: <b8112628-a2e3-2fdc-9847-1fa684283135@suse.com>
Date: Thu, 14 Jan 2021 16:04:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The "guest" variants are intended to work with (potentially) fully guest
controlled addresses, while the "unsafe" variants are not. Subsequently
we will want them to have different behavior, so as first step identify
which one is which. For now, both groups of constructs alias one another.

Double underscore prefixes are retained only on
__copy_{from,to}_guest_pv(), to allow still distinguishing them from
their "checking" counterparts once they also get renamed (to
copy_{from,to}_guest_pv()).

Add previously missing __user at some call sites.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Instead of __copy_{from,to}_guest_pv(), perhaps name them just
__copy_{from,to}_pv()?

--- a/xen/arch/x86/gdbstub.c
+++ b/xen/arch/x86/gdbstub.c
@@ -33,13 +33,13 @@ gdb_arch_signal_num(struct cpu_user_regs
 unsigned int
 gdb_arch_copy_from_user(void *dest, const void *src, unsigned len)
 {
-    return __copy_from_user(dest, src, len);
+    return copy_from_unsafe(dest, src, len);
 }
 
 unsigned int 
 gdb_arch_copy_to_user(void *dest, const void *src, unsigned len)
 {
-    return __copy_to_user(dest, src, len);
+    return copy_to_unsafe(dest, src, len);
 }
 
 void
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2614,7 +2614,7 @@ static int sh_page_fault(struct vcpu *v,
         {
             shadow_l2e_t sl2e;
             mfn_t gl1mfn;
-            if ( (__copy_from_user(&sl2e,
+            if ( (copy_from_unsafe(&sl2e,
                                    (sh_linear_l2_table(v)
                                     + shadow_l2_linear_offset(va)),
                                    sizeof(sl2e)) != 0)
@@ -2633,7 +2633,7 @@ static int sh_page_fault(struct vcpu *v,
 #endif /* SHOPT_OUT_OF_SYNC */
         /* The only reasons for reserved bits to be set in shadow entries
          * are the two "magic" shadow_l1e entries. */
-        if ( likely((__copy_from_user(&sl1e,
+        if ( likely((copy_from_unsafe(&sl1e,
                                       (sh_linear_l1_table(v)
                                        + shadow_l1_linear_offset(va)),
                                       sizeof(sl1e)) == 0)
@@ -3308,10 +3308,10 @@ static bool sh_invlpg(struct vcpu *v, un
                    sh_linear_l4_table(v)[shadow_l4_linear_offset(linear)])
                & _PAGE_PRESENT) )
             return false;
-        /* This must still be a copy-from-user because we don't have the
+        /* This must still be a copy-from-unsafe because we don't have the
          * paging lock, and the higher-level shadows might disappear
          * under our feet. */
-        if ( __copy_from_user(&sl3e, (sh_linear_l3_table(v)
+        if ( copy_from_unsafe(&sl3e, (sh_linear_l3_table(v)
                                       + shadow_l3_linear_offset(linear)),
                               sizeof (sl3e)) != 0 )
         {
@@ -3330,9 +3330,9 @@ static bool sh_invlpg(struct vcpu *v, un
         return false;
 #endif
 
-    /* This must still be a copy-from-user because we don't have the shadow
+    /* This must still be a copy-from-unsafe because we don't have the shadow
      * lock, and the higher-level shadows might disappear under our feet. */
-    if ( __copy_from_user(&sl2e,
+    if ( copy_from_unsafe(&sl2e,
                           sh_linear_l2_table(v) + shadow_l2_linear_offset(linear),
                           sizeof (sl2e)) != 0 )
     {
@@ -3371,11 +3371,11 @@ static bool sh_invlpg(struct vcpu *v, un
              * hold the paging lock yet.  Check again with the lock held. */
             paging_lock(d);
 
-            /* This must still be a copy-from-user because we didn't
+            /* This must still be a copy-from-unsafe because we didn't
              * have the paging lock last time we checked, and the
              * higher-level shadows might have disappeared under our
              * feet. */
-            if ( __copy_from_user(&sl2e,
+            if ( copy_from_unsafe(&sl2e,
                                   sh_linear_l2_table(v)
                                   + shadow_l2_linear_offset(linear),
                                   sizeof (sl2e)) != 0 )
--- a/xen/arch/x86/pv/emul-gate-op.c
+++ b/xen/arch/x86/pv/emul-gate-op.c
@@ -149,12 +149,12 @@ static int read_mem(enum x86_segment seg
 
     addr = (uint32_t)addr;
 
-    if ( (rc = __copy_from_user(p_data, (void *)addr, bytes)) )
+    if ( (rc = __copy_from_guest_pv(p_data, (void __user *)addr, bytes)) )
     {
         /*
          * TODO: This should report PFEC_insn_fetch when goc->insn_fetch &&
          * cpu_has_nx, but we'd then need a "fetch" variant of
-         * __copy_from_user() respecting NX, SMEP, and protection keys.
+         * __copy_from_guest_pv() respecting NX, SMEP, and protection keys.
          */
         x86_emul_pagefault(0, addr + bytes - rc, ctxt);
         return X86EMUL_EXCEPTION;
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -649,7 +649,8 @@ static int rep_ins(uint16_t port,
         if ( rc != X86EMUL_OKAY )
             return rc;
 
-        if ( (rc = __copy_to_user((void *)addr, &data, bytes_per_rep)) != 0 )
+        if ( (rc = __copy_to_guest_pv((void __user *)addr, &data,
+                                      bytes_per_rep)) != 0 )
         {
             x86_emul_pagefault(PFEC_write_access,
                                addr + bytes_per_rep - rc, ctxt);
@@ -716,7 +717,8 @@ static int rep_outs(enum x86_segment seg
         if ( rc != X86EMUL_OKAY )
             return rc;
 
-        if ( (rc = __copy_from_user(&data, (void *)addr, bytes_per_rep)) != 0 )
+        if ( (rc = __copy_from_guest_pv(&data, (void __user *)addr,
+                                        bytes_per_rep)) != 0 )
         {
             x86_emul_pagefault(0, addr + bytes_per_rep - rc, ctxt);
             return X86EMUL_EXCEPTION;
@@ -1253,12 +1255,12 @@ static int insn_fetch(enum x86_segment s
     if ( rc != X86EMUL_OKAY )
         return rc;
 
-    if ( (rc = __copy_from_user(p_data, (void *)addr, bytes)) != 0 )
+    if ( (rc = __copy_from_guest_pv(p_data, (void __user *)addr, bytes)) != 0 )
     {
         /*
          * TODO: This should report PFEC_insn_fetch when goc->insn_fetch &&
          * cpu_has_nx, but we'd then need a "fetch" variant of
-         * __copy_from_user() respecting NX, SMEP, and protection keys.
+         * __copy_from_guest_pv() respecting NX, SMEP, and protection keys.
          */
         x86_emul_pagefault(0, addr + bytes - rc, ctxt);
         return X86EMUL_EXCEPTION;
--- a/xen/arch/x86/pv/mm.c
+++ b/xen/arch/x86/pv/mm.c
@@ -41,7 +41,7 @@ l1_pgentry_t *map_guest_l1e(unsigned lon
         return NULL;
 
     /* Find this l1e and its enclosing l1mfn in the linear map. */
-    if ( __copy_from_user(&l2e,
+    if ( copy_from_unsafe(&l2e,
                           &__linear_l2_table[l2_linear_offset(linear)],
                           sizeof(l2_pgentry_t)) )
         return NULL;
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -22,7 +22,7 @@ static inline l1_pgentry_t guest_get_eff
         toggle_guest_pt(curr);
 
     if ( unlikely(!__addr_ok(linear)) ||
-         __copy_from_user(&l1e,
+         copy_from_unsafe(&l1e,
                           &__linear_l1_table[l1_linear_offset(linear)],
                           sizeof(l1_pgentry_t)) )
         l1e = l1e_empty();
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -43,7 +43,7 @@ static int ptwr_emulated_read(enum x86_s
     unsigned long addr = offset;
 
     if ( !__addr_ok(addr) ||
-         (rc = __copy_from_user(p_data, (void *)addr, bytes)) )
+         (rc = __copy_from_guest_pv(p_data, (void *)addr, bytes)) )
     {
         x86_emul_pagefault(0, addr + bytes - rc, ctxt);  /* Read fault. */
         return X86EMUL_EXCEPTION;
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1097,7 +1097,7 @@ void do_invalid_op(struct cpu_user_regs
     }
 
     if ( !is_active_kernel_text(regs->rip) ||
-         __copy_from_user(bug_insn, eip, sizeof(bug_insn)) ||
+         copy_from_unsafe(bug_insn, eip, sizeof(bug_insn)) ||
          memcmp(bug_insn, "\xf\xb", sizeof(bug_insn)) )
         goto die;
 
--- a/xen/arch/x86/usercopy.c
+++ b/xen/arch/x86/usercopy.c
@@ -110,7 +110,7 @@ unsigned __copy_from_user_ll(void *to, c
 unsigned copy_to_user(void __user *to, const void *from, unsigned n)
 {
     if ( access_ok(to, n) )
-        n = __copy_to_user(to, from, n);
+        n = __copy_to_guest_pv(to, from, n);
     return n;
 }
 
@@ -168,7 +168,7 @@ unsigned clear_user(void __user *to, uns
 unsigned copy_from_user(void *to, const void __user *from, unsigned n)
 {
     if ( access_ok(from, n) )
-        n = __copy_from_user(to, from, n);
+        n = __copy_from_guest_pv(to, from, n);
     else
         memset(to, 0, n);
     return n;
--- a/xen/include/asm-x86/guest_access.h
+++ b/xen/include/asm-x86/guest_access.h
@@ -28,11 +28,11 @@
 #define __raw_copy_to_guest(dst, src, len)      \
     (is_hvm_vcpu(current) ?                     \
      copy_to_user_hvm((dst), (src), (len)) :    \
-     __copy_to_user((dst), (src), (len)))
+     __copy_to_guest_pv(dst, src, len))
 #define __raw_copy_from_guest(dst, src, len)    \
     (is_hvm_vcpu(current) ?                     \
      copy_from_user_hvm((dst), (src), (len)) :  \
-     __copy_from_user((dst), (src), (len)))
+     __copy_from_guest_pv(dst, src, len))
 #define __raw_clear_guest(dst,  len)            \
     (is_hvm_vcpu(current) ?                     \
      clear_user_hvm((dst), (len)) :             \
--- a/xen/include/asm-x86/uaccess.h
+++ b/xen/include/asm-x86/uaccess.h
@@ -197,21 +197,20 @@ do {
 #define get_guest_size get_unsafe_size
 
 /**
- * __copy_to_user: - Copy a block of data into user space, with less checking
- * @to:   Destination address, in user space.
- * @from: Source address, in kernel space.
+ * __copy_to_guest_pv: - Copy a block of data into guest space, with less
+ *                       checking
+ * @to:   Destination address, in guest space.
+ * @from: Source address, in hypervisor space.
  * @n:    Number of bytes to copy.
  *
- * Context: User context only.  This function may sleep.
- *
- * Copy data from kernel space to user space.  Caller must check
+ * Copy data from hypervisor space to guest space.  Caller must check
  * the specified block with access_ok() before calling this function.
  *
  * Returns number of bytes that could not be copied.
  * On success, this will be zero.
  */
 static always_inline unsigned long
-__copy_to_user(void __user *to, const void *from, unsigned long n)
+__copy_to_guest_pv(void __user *to, const void *from, unsigned long n)
 {
     if (__builtin_constant_p(n)) {
         unsigned long ret;
@@ -233,16 +232,16 @@ __copy_to_user(void __user *to, const vo
     }
     return __copy_to_user_ll(to, from, n);
 }
+#define copy_to_unsafe __copy_to_guest_pv
 
 /**
- * __copy_from_user: - Copy a block of data from user space, with less checking
- * @to:   Destination address, in kernel space.
- * @from: Source address, in user space.
+ * __copy_from_guest_pv: - Copy a block of data from guest space, with less
+ *                         checking
+ * @to:   Destination address, in hypervisor space.
+ * @from: Source address, in guest space.
  * @n:    Number of bytes to copy.
  *
- * Context: User context only.  This function may sleep.
- *
- * Copy data from user space to kernel space.  Caller must check
+ * Copy data from guest space to hypervisor space.  Caller must check
  * the specified block with access_ok() before calling this function.
  *
  * Returns number of bytes that could not be copied.
@@ -252,7 +251,7 @@ __copy_to_user(void __user *to, const vo
  * data to the requested size using zero bytes.
  */
 static always_inline unsigned long
-__copy_from_user(void *to, const void __user *from, unsigned long n)
+__copy_from_guest_pv(void *to, const void __user *from, unsigned long n)
 {
     if (__builtin_constant_p(n)) {
         unsigned long ret;
@@ -274,6 +273,7 @@ __copy_from_user(void *to, const void __
     }
     return __copy_from_user_ll(to, from, n);
 }
+#define copy_from_unsafe __copy_from_guest_pv
 
 /*
  * The exception table consists of pairs of addresses: the first is the


