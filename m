Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F569D949C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 10:36:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843436.1259060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFryx-00061J-1B; Tue, 26 Nov 2024 09:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843436.1259060; Tue, 26 Nov 2024 09:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFryw-0005zZ-Sn; Tue, 26 Nov 2024 09:35:42 +0000
Received: by outflank-mailman (input) for mailman id 843436;
 Tue, 26 Nov 2024 09:35:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lwvg=SV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tFryv-0005lM-1k
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 09:35:41 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cab2e401-abd9-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 10:35:37 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53dd0cb9ce3so4947743e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 01:35:37 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa54afde284sm286548966b.17.2024.11.26.01.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 01:35:35 -0800 (PST)
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
X-Inumbo-ID: cab2e401-abd9-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmUiLCJoZWxvIjoibWFpbC1sZjEteDEyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNhYjJlNDAxLWFiZDktMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjEzNzM3LjEzNTU4OSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732613736; x=1733218536; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muGJeaCKCspLmDwONC81uUfp5RFpWNLMAClB1gqff50=;
        b=XKJXR4S+uifOCG9LIiI05zQOTkI7k6fAaEHAnsncd9gdxuAgdgpsSP2Sl3wHggB4Y6
         pYpy92081J9aWk4/RtvBoECGZgQTOGs4UcqsszHC0jL7amH3rpmijqLxAmwShxVPIkRf
         Rh6xc/HrkDNqhYHA/3hbKy34JGvQXoKzFKA3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732613736; x=1733218536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muGJeaCKCspLmDwONC81uUfp5RFpWNLMAClB1gqff50=;
        b=EaBqCmuPl4O91eCziIVvSz/2B/Zq1IwW1MQ2HDVucMTMtSC0h9byiKlZCk7qLNcBjg
         ai8D5hFVLsMwVpDWLkIyg3tMuqMdGTcUXb6P68CHSWtV5pRW8GTANgxncZG7yjK7JPzc
         FJqCnIRSe6aKFJkQU9QXqtngRHWhR7EzExJ8vGG6mf3TGpTRS28/tqzZ8F3KTNDHoT3O
         ZfnpKqpg6rS9HK8OsgOvpF1hDmXznzARYVCixL6iO9xzmi6Hy+SklK6gUupVC4eoR6QB
         KmeYD4CK4bbwzRcNg2nYNxaKBAVXR+Olsmu/DR3PNFTSdL6NE3dKAgX4Z5d7GS4+gijx
         JJHA==
X-Gm-Message-State: AOJu0YxytF4PgYrJnanhGN1Mz094tJyiwl33Q/n6cH3fIzPEHed63BEO
	x36CccbNFyyCb1yEOZB6KX1oZxa0kLSlcZ0EQYGVHGO1P+i5l8L2Oz5mn0QwwPs7vSXrHrYXSue
	P
X-Gm-Gg: ASbGncuBELUXN+YQ7L8vw9O72ggu5jihg4/4xP43EPn4hQUZeSmctVmrMHXsXieZmw5
	kCebWLntfgq4Frx3laJm44HQYJT81jmtb2710As7i5ozqwRFOou1dsX/8fYy/uXr8++L0aE6MIV
	bBBrWZXFqMs3YvS5v1fomlnxmOuTLOj7hidwoMu5z8j330kJygEApfzSmeBsoHeENNfycfPIXoH
	at5su8wENOGCK8v0nUOlXbDz6L4b7qQLsh/4WEbzUeysFeq0B6SoQDw7gg=
X-Google-Smtp-Source: AGHT+IGN3y98ax/Soil2scVQ7Chur5GO+KPqpKDx+8hRZVTbnceGh74b+4w32KUjritKca2vDV+fCg==
X-Received: by 2002:a05:6512:1303:b0:53d:cb7e:225a with SMTP id 2adb3069b0e04-53dd36aa62cmr8377122e87.24.1732613735572;
        Tue, 26 Nov 2024 01:35:35 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 1/2] x86/uaccess: rework user access speculative harden guards
Date: Tue, 26 Nov 2024 10:35:07 +0100
Message-ID: <20241126093508.6966-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241126093508.6966-1-roger.pau@citrix.com>
References: <20241126093508.6966-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current guards to select whether user accesses should be speculative
hardened violate Misra rule 20.7, as the UA_KEEP() macro doesn't (and can't)
parenthesize the 'args' argument.

Change the logic so the guard is implemented inside the assembly block using
the .if assembly directive.  This results in some register spilling if the
guest_access_mask_ptr assembly macro is removed from the final assembly.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes xince v1:
 - Drop unneeded __maybe_unused.
 - Add comment in GUARD definitions.
 - Mention register spilling in the comment message.
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
index 7ab2009efe4c..286080f68f7e 100644
--- a/xen/arch/x86/usercopy.c
+++ b/xen/arch/x86/usercopy.c
@@ -11,23 +11,23 @@
 #include <asm/uaccess.h>
 
 #ifndef GUARD
-# define GUARD UA_KEEP
+# define GUARD 1 /* Keep speculative harden guards. */
 #endif
 
 unsigned int copy_to_guest_ll(void __user *to, const void *from, unsigned int n)
 {
-    GUARD(unsigned dummy);
+    unsigned dummy;
 
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
+# define GUARD 0 /* Drop speculative harden guards. */
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


