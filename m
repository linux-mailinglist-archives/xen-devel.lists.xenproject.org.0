Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F349D23A8
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 11:35:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839921.1255727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLZS-0001Do-Lj; Tue, 19 Nov 2024 10:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839921.1255727; Tue, 19 Nov 2024 10:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLZS-00017z-Ff; Tue, 19 Nov 2024 10:34:58 +0000
Received: by outflank-mailman (input) for mailman id 839921;
 Tue, 19 Nov 2024 10:34:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Xh=SO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDLZR-0000aC-Dw
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 10:34:57 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9dbee06-a661-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 11:34:53 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5cfbeed072dso3287561a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 02:34:53 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cfe84f8207sm120958a12.32.2024.11.19.02.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 02:34:52 -0800 (PST)
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
X-Inumbo-ID: e9dbee06-a661-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmQiLCJoZWxvIjoibWFpbC1lZDEteDUyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU5ZGJlZTA2LWE2NjEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDEyNDkzLjk0MTY3NCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732012493; x=1732617293; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cO1IumWlbaoJe1bK8+bYKC2sAvhfBGmW90G8QQAFdCE=;
        b=eVgFuNuK4zOZMEcIX90/IN/srdA65LubPwAi2RyzbY0Ouu8BgiEwMpJwGasNglgJjq
         1GeNjtjQvUZFNwtMMOl5GKKfLqk8aGbpJa9b1DW2ll+htD7SlG3duccsKpj6gF/l8dwH
         Yt/Chvuicw+FIw1OFBcVE20sNqYwMUvUxuIRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732012493; x=1732617293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cO1IumWlbaoJe1bK8+bYKC2sAvhfBGmW90G8QQAFdCE=;
        b=qFZ4CjIbdRy97FKdEogBJsbOzg0KeaHN/RnfIiJGt08btM5QP8BnAQwb2jayTw/P8Q
         flBkb7PWvDb/oLBFWK84fskKLfiU5oqwTY6ew3qIy0wHF/t/hsilILW6WAP0gozv51pJ
         H3qelQ3hyA1IZ2F+zlYBqLB52YJLtN8iO9fzrzQINUXuheaAX1vY+tN8ZEZdKLq6LRk+
         HQRDt/9yTzGnA1qEF2P4pEWMgOo/mA0KF2mFiE+3yuXNcdcpml8tS/Gxjc19kw83rb2R
         5YGlUs3Q/YO49wNI9Bb9l1MXuSO4aYf9cidWgzco2tttHclSnEaoCqu8BvyDnbonIVmm
         L/Vg==
X-Gm-Message-State: AOJu0Ywz6qZVoKkhOiTDsUlwsGt7Vcj3LCe/32b0hYiaLvETfHff72ZE
	KoiDorRsyRyy7Fn1dJrq0nbYgcaCZ2ZRXqPTHkAnHS0CQN3yY7E+iC/T9xjC6+gpaRHWau6dwjj
	E
X-Google-Smtp-Source: AGHT+IEhPCo9rL4nHhlIZCkWsxczkP0p++tT+Ie2gGjDMV6Jni4r8Vf8Mn4MsSSBp/skTYhP5PNbbw==
X-Received: by 2002:a17:906:6a07:b0:a9e:471e:ce4a with SMTP id a640c23a62f3a-aa4833e8cfbmr1510445266b.11.1732012493031;
        Tue, 19 Nov 2024 02:34:53 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 3/4] x86/uaccess: rework user access speculative harden guards
Date: Tue, 19 Nov 2024 11:34:43 +0100
Message-ID: <20241119103444.23296-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241119103444.23296-1-roger.pau@citrix.com>
References: <20241119103444.23296-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current guards to select whether user accesses should be speculative
hardened violate Misra rule 20.7, as the UA_KEEP() macro doesn't (and can't)
parenthesize the 'args' argument.

Change the logic so the guard is implemented inside the assembly block using
the .if assembly directive.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
The guard check could be moved inside of the guest_access_mask_ptr macro, but
given it's limited usages it's clearer to keep the check in the callers IMO.
---
 xen/arch/x86/include/asm/uaccess.h | 45 +++++++++++++++---------------
 xen/arch/x86/usercopy.c            | 26 ++++++++---------
 2 files changed, 35 insertions(+), 36 deletions(-)

diff --git a/xen/arch/x86/include/asm/uaccess.h b/xen/arch/x86/include/asm/uaccess.h
index 2d01669b9610..6b8150ac221a 100644
--- a/xen/arch/x86/include/asm/uaccess.h
+++ b/xen/arch/x86/include/asm/uaccess.h
@@ -24,9 +24,6 @@ unsigned int copy_from_unsafe_ll(void *to, const void *from, unsigned int n);
 void noreturn __get_user_bad(void);
 void noreturn __put_user_bad(void);
 
-#define UA_KEEP(args...) args
-#define UA_DROP(args...)
-
 /**
  * get_guest: - Get a simple variable from guest space.
  * @x:   Variable to store result.
@@ -104,7 +101,7 @@ void noreturn __put_user_bad(void);
 #define put_unsafe(x, ptr)						\
 ({									\
 	int err_; 							\
-	put_unsafe_size(x, ptr, sizeof(*(ptr)), UA_DROP, err_, -EFAULT);\
+	put_unsafe_size(x, ptr, sizeof(*(ptr)), 0, err_, -EFAULT);      \
 	err_;								\
 })
 
@@ -126,7 +123,7 @@ void noreturn __put_user_bad(void);
 #define get_unsafe(x, ptr)						\
 ({									\
 	int err_; 							\
-	get_unsafe_size(x, ptr, sizeof(*(ptr)), UA_DROP, err_, -EFAULT);\
+	get_unsafe_size(x, ptr, sizeof(*(ptr)), 0, err_, -EFAULT);	\
 	err_;								\
 })
 
@@ -155,9 +152,9 @@ struct __large_struct { unsigned long buf[100]; };
  */
 #define put_unsafe_asm(x, addr, GUARD, err, itype, rtype, ltype, errret) \
 	__asm__ __volatile__(						\
-		GUARD(							\
+		".if " STR(GUARD) "\n"					\
 		"	guest_access_mask_ptr %[ptr], %[scr1], %[scr2]\n" \
-		)							\
+		".endif\n"						\
 		"1:	mov"itype" %"rtype"[val], (%[ptr])\n"		\
 		"2:\n"							\
 		".section .fixup,\"ax\"\n"				\
@@ -165,16 +162,16 @@ struct __large_struct { unsigned long buf[100]; };
 		"	jmp 2b\n"					\
 		".previous\n"						\
 		_ASM_EXTABLE(1b, 3b)					\
-		: [ret] "+r" (err), [ptr] "=&r" (dummy_)		\
-		  GUARD(, [scr1] "=&r" (dummy_), [scr2] "=&r" (dummy_))	\
+		: [ret] "+r" (err), [ptr] "=&r" (dummy_),		\
+		  [scr1] "=&r" (dummy_), [scr2] "=&r" (dummy_)		\
 		: [val] ltype (x), "m" (__m(addr)),			\
 		  "[ptr]" (addr), [errno] "i" (errret))
 
 #define get_unsafe_asm(x, addr, GUARD, err, rtype, ltype, errret)	\
 	__asm__ __volatile__(						\
-		GUARD(							\
+		".if " STR(GUARD) "\n"					\
 		"	guest_access_mask_ptr %[ptr], %[scr1], %[scr2]\n" \
-		)							\
+		".endif\n"						\
 		"1:	mov (%[ptr]), %"rtype"[val]\n"			\
 		"2:\n"							\
 		".section .fixup,\"ax\"\n"				\
@@ -184,14 +181,15 @@ struct __large_struct { unsigned long buf[100]; };
 		".previous\n"						\
 		_ASM_EXTABLE(1b, 3b)					\
 		: [ret] "+r" (err), [val] ltype (x),			\
-		  [ptr] "=&r" (dummy_)					\
-		  GUARD(, [scr1] "=&r" (dummy_), [scr2] "=&r" (dummy_))	\
+		  [ptr] "=&r" (dummy_),					\
+		  [scr1] "=&r" (dummy_), [scr2] "=&r" (dummy_)		\
 		: "m" (__m(addr)), "[ptr]" (addr),			\
 		  [errno] "i" (errret))
 
 #define put_unsafe_size(x, ptr, size, grd, retval, errret)                 \
 do {                                                                       \
     retval = 0;                                                            \
+    BUILD_BUG_ON((grd) != 0 && (grd) != 1);                                \
     stac();                                                                \
     switch ( size )                                                        \
     {                                                                      \
@@ -214,11 +212,12 @@ do {                                                                       \
 } while ( false )
 
 #define put_guest_size(x, ptr, size, retval, errret) \
-    put_unsafe_size(x, ptr, size, UA_KEEP, retval, errret)
+    put_unsafe_size(x, ptr, size, 1, retval, errret)
 
 #define get_unsafe_size(x, ptr, size, grd, retval, errret)                 \
 do {                                                                       \
     retval = 0;                                                            \
+    BUILD_BUG_ON((grd) != 0 && (grd) != 1);                                \
     stac();                                                                \
     switch ( size )                                                        \
     {                                                                      \
@@ -233,7 +232,7 @@ do {                                                                       \
 } while ( false )
 
 #define get_guest_size(x, ptr, size, retval, errret)                       \
-    get_unsafe_size(x, ptr, size, UA_KEEP, retval, errret)
+    get_unsafe_size(x, ptr, size, 1, retval, errret)
 
 /**
  * __copy_to_guest_pv: - Copy a block of data into guest space, with less
@@ -333,16 +332,16 @@ copy_to_unsafe(void __user *to, const void *from, unsigned int n)
 
         switch (n) {
         case 1:
-            put_unsafe_size(*(const uint8_t *)from, to, 1, UA_DROP, ret, 1);
+            put_unsafe_size(*(const uint8_t *)from, to, 1, 0, ret, 1);
             return ret;
         case 2:
-            put_unsafe_size(*(const uint16_t *)from, to, 2, UA_DROP, ret, 2);
+            put_unsafe_size(*(const uint16_t *)from, to, 2, 0, ret, 2);
             return ret;
         case 4:
-            put_unsafe_size(*(const uint32_t *)from, to, 4, UA_DROP, ret, 4);
+            put_unsafe_size(*(const uint32_t *)from, to, 4, 0, ret, 4);
             return ret;
         case 8:
-            put_unsafe_size(*(const uint64_t *)from, to, 8, UA_DROP, ret, 8);
+            put_unsafe_size(*(const uint64_t *)from, to, 8, 0, ret, 8);
             return ret;
         }
     }
@@ -374,16 +373,16 @@ copy_from_unsafe(void *to, const void __user *from, unsigned int n)
         switch ( n )
         {
         case 1:
-            get_unsafe_size(*(uint8_t *)to, from, 1, UA_DROP, ret, 1);
+            get_unsafe_size(*(uint8_t *)to, from, 1, 0, ret, 1);
             return ret;
         case 2:
-            get_unsafe_size(*(uint16_t *)to, from, 2, UA_DROP, ret, 2);
+            get_unsafe_size(*(uint16_t *)to, from, 2, 0, ret, 2);
             return ret;
         case 4:
-            get_unsafe_size(*(uint32_t *)to, from, 4, UA_DROP, ret, 4);
+            get_unsafe_size(*(uint32_t *)to, from, 4, 0, ret, 4);
             return ret;
         case 8:
-            get_unsafe_size(*(uint64_t *)to, from, 8, UA_DROP, ret, 8);
+            get_unsafe_size(*(uint64_t *)to, from, 8, 0, ret, 8);
             return ret;
         }
     }
diff --git a/xen/arch/x86/usercopy.c b/xen/arch/x86/usercopy.c
index 7ab2009efe4c..d66beecc5507 100644
--- a/xen/arch/x86/usercopy.c
+++ b/xen/arch/x86/usercopy.c
@@ -11,23 +11,23 @@
 #include <asm/uaccess.h>
 
 #ifndef GUARD
-# define GUARD UA_KEEP
+# define GUARD 1
 #endif
 
 unsigned int copy_to_guest_ll(void __user *to, const void *from, unsigned int n)
 {
-    GUARD(unsigned dummy);
+    unsigned __maybe_unused dummy;
 
     stac();
     asm volatile (
-        GUARD(
+        ".if " STR(GUARD) "\n"
         "    guest_access_mask_ptr %[to], %q[scratch1], %q[scratch2]\n"
-        )
+        ".endif\n"
         "1:  rep movsb\n"
         "2:\n"
         _ASM_EXTABLE(1b, 2b)
-        : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from)
-          GUARD(, [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy))
+        : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from),
+          [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy)
         :: "memory" );
     clac();
 
@@ -40,9 +40,9 @@ unsigned int copy_from_guest_ll(void *to, const void __user *from, unsigned int
 
     stac();
     asm volatile (
-        GUARD(
+        ".if " STR(GUARD) "\n"
         "    guest_access_mask_ptr %[from], %q[scratch1], %q[scratch2]\n"
-        )
+        ".endif\n"
         "1:  rep movsb\n"
         "2:\n"
         ".section .fixup,\"ax\"\n"
@@ -56,15 +56,15 @@ unsigned int copy_from_guest_ll(void *to, const void __user *from, unsigned int
         ".previous\n"
         _ASM_EXTABLE(1b, 6b)
         : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from),
-          [aux] "=&r" (dummy)
-          GUARD(, [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy))
+          [aux] "=&r" (dummy),
+          [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy)
         :: "memory" );
     clac();
 
     return n;
 }
 
-#if GUARD(1) + 0
+#if GUARD
 
 /**
  * copy_to_guest_pv: - Copy a block of data into PV guest space.
@@ -140,14 +140,14 @@ unsigned int copy_from_guest_pv(void *to, const void __user *from,
 }
 
 # undef GUARD
-# define GUARD UA_DROP
+# define GUARD 0
 # define copy_to_guest_ll copy_to_unsafe_ll
 # define copy_from_guest_ll copy_from_unsafe_ll
 # undef __user
 # define __user
 # include __FILE__
 
-#endif /* GUARD(1) */
+#endif /* GUARD */
 
 /*
  * Local variables:
-- 
2.46.0


