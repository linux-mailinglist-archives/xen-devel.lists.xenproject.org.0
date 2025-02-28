Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D30AA4A5C1
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 23:15:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899239.1307661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to8ce-0000IT-MC; Fri, 28 Feb 2025 22:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899239.1307661; Fri, 28 Feb 2025 22:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to8ce-0000FB-HX; Fri, 28 Feb 2025 22:14:20 +0000
Received: by outflank-mailman (input) for mailman id 899239;
 Fri, 28 Feb 2025 22:14:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LTn8=VT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1to8cc-0000F5-SK
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 22:14:18 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59d4f52a-f621-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 23:14:17 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5deb1266031so4523819a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 14:14:17 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c3b70112sm3054224a12.31.2025.02.28.14.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 14:14:15 -0800 (PST)
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
X-Inumbo-ID: 59d4f52a-f621-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740780856; x=1741385656; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e34h++GkHjwM9pyGB6Bou20OACOM4Rp5jCKkZsQzXm0=;
        b=ovXzMc+bDVvU5/x9A8AM0WFrh0ne7Sj9qxBxvCy4sS6+LnCn1vu80B7w+33Qt9BKQJ
         7GHFVa8U1SbcYk/nMZfQqUT+Fo4fZFcB18AB3rmjUZddCYqKvvNpdICmuHN1mnSBsH1q
         JTTTDCnG5uDAM68UNbh/2oAUwMqR/ojAjesb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740780856; x=1741385656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e34h++GkHjwM9pyGB6Bou20OACOM4Rp5jCKkZsQzXm0=;
        b=tVGOf+xo4ptEpZRB8+JoxfDy5+fISB2LVpICCz1yPvPugFYFTjBvV06rUockIXFaYl
         Wjd92MX5RE23INqV1S5w6Q1UITX6Q2dDU7rCnqzbPHt2Q3lLDRRBVhAGUrMwKvJkvB7B
         d+8xg6C52T4c8s7phS3jsujM7fkdI/n/TxCU7RktVbN5OaZQ1XXJzgYFasmqLaDR42JU
         EcFrTmuA3Lzp6Q3l18n4+eugISvuXjOwFZw09o5qaFZsxiNRFj7bN+Mdd1rDjV6reEHu
         944MqF8jc75uajKtpFTzqx1a/OeL63RaNX1grGkgNMmhPIbU+RH1drFD7z1r5/FVN4hA
         Pmpw==
X-Gm-Message-State: AOJu0YxS+Lj132Z7wfFx6OX6r1GQTFx75ffL93kt0X8MIc10odq78HN6
	uErFRpQmH7k+J9TFIlCQ8HxQBU2b+OD0QilJA0Bh0vvLrMR0sz9cDxFuTLa/H0VPWa1Fz5EE70d
	J
X-Gm-Gg: ASbGnctK6240LIZML3hwXBar/aPHsDBBl+lqdv/vrgH2nRlAdlPtPYKWSgEhK6zeZHj
	A4QaxWFBU3IpJxbSr7/BNiD8gUXxD0cYJHZ77NPgONNRIFB+651yO5nEJ+WgxL7URWZ2A5FHb/Z
	MynlJ7VMCFCMSWimGau6p1/JwHO48bW34BMq8ROgngcxi41WvM8P3vFVttB4lGVwLNg96JNenW1
	cSfQpnUOfUFoL/yCyYVltTWKNED9yyFwPrV8nz0fD7JcDwwI9ilmog63llf0+MArFQs5bNCzCNZ
	DPTtHtAspR8WgPhmGUQSkMSYgwKKq5MLa0iJN1MMsKmj0Y1HzNeXCmpElaBUst2n0h5OzY/cm+N
	Y4abq6rikJVMYzQPlI/8c+Y2O
X-Google-Smtp-Source: AGHT+IHyKxm9RGCGCOcJV941XKG3xpXNUhW1H5nsxBlRtkFIxL+HlntNzf03DSoa/2zcp+YnWxIcJQ==
X-Received: by 2002:a05:6402:350f:b0:5e4:9348:72b4 with SMTP id 4fb4d7f45d1cf-5e4d6921bd4mr4494924a12.0.1740780856484;
        Fri, 28 Feb 2025 14:14:16 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/asm: Remove semicolon from LOCK prefix
Date: Fri, 28 Feb 2025 22:12:13 +0000
Message-Id: <20250228221213.2033895-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Most of Xen's LOCK prefixes are already without semicolon, but we have a few
still remaining in the tree.

As noted in the Linux patch, this adversly affects size/inlining decisions,
and prevents the assembler from diagnosing some classes of error.

No functional change.

Link: https://lore.kernel.org/lkml/20250228085149.2478245-1-ubizjak@gmail.com/
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

It really does change inlining decisions.  Bloat-o-meter reports:

  add/remove: 1/1 grow/shrink: 7/1 up/down: 691/-247 (444)
  Function                                     old     new   delta
  cpupool_do_sysctl                           1737    1945    +208
  kexec_do_unload.isra                           -     150    +150
  kexec_load_slot                              396     502    +106
  poll_timer_fn                                 37     104     +67
  cpupool_unassign_cpu_finish                  376     427     +51
  cpupool_create_pool                           82     130     +48
  cpupool_assign_cpu_locked                    346     394     +48
  panic                                        170     183     +13
  do_kexec_op_internal                        2117    2022     -95
  kexec_swap_images                            152       -    -152

e.g. poll_timer_fn() previously tailcalled vcpu_unblock(), but now takes a
copy of it.
---
 xen/arch/x86/include/asm/atomic.h   | 16 ++++++++--------
 xen/arch/x86/include/asm/bitops.h   | 12 ++++++------
 xen/arch/x86/include/asm/spinlock.h |  2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/include/asm/atomic.h b/xen/arch/x86/include/asm/atomic.h
index 16bd0ebfd763..ed4e09a50329 100644
--- a/xen/arch/x86/include/asm/atomic.h
+++ b/xen/arch/x86/include/asm/atomic.h
@@ -115,7 +115,7 @@ static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
 static inline void atomic_add(int i, atomic_t *v)
 {
     asm volatile (
-        "lock; addl %1,%0"
+        "lock addl %1,%0"
         : "=m" (*(volatile int *)&v->counter)
         : "ir" (i), "m" (*(volatile int *)&v->counter) );
 }
@@ -128,7 +128,7 @@ static inline int atomic_add_return(int i, atomic_t *v)
 static inline void atomic_sub(int i, atomic_t *v)
 {
     asm volatile (
-        "lock; subl %1,%0"
+        "lock subl %1,%0"
         : "=m" (*(volatile int *)&v->counter)
         : "ir" (i), "m" (*(volatile int *)&v->counter) );
 }
@@ -142,7 +142,7 @@ static inline int atomic_sub_and_test(int i, atomic_t *v)
 {
     bool c;
 
-    asm volatile ( "lock; subl %[i], %[counter]\n\t"
+    asm volatile ( "lock subl %[i], %[counter]\n\t"
                    ASM_FLAG_OUT(, "setz %[zf]\n\t")
                    : [counter] "+m" (*(volatile int *)&v->counter),
                      [zf] ASM_FLAG_OUT("=@ccz", "=qm") (c)
@@ -154,7 +154,7 @@ static inline int atomic_sub_and_test(int i, atomic_t *v)
 static inline void atomic_inc(atomic_t *v)
 {
     asm volatile (
-        "lock; incl %0"
+        "lock incl %0"
         : "=m" (*(volatile int *)&v->counter)
         : "m" (*(volatile int *)&v->counter) );
 }
@@ -168,7 +168,7 @@ static inline int atomic_inc_and_test(atomic_t *v)
 {
     bool c;
 
-    asm volatile ( "lock; incl %[counter]\n\t"
+    asm volatile ( "lock incl %[counter]\n\t"
                    ASM_FLAG_OUT(, "setz %[zf]\n\t")
                    : [counter] "+m" (*(volatile int *)&v->counter),
                      [zf] ASM_FLAG_OUT("=@ccz", "=qm") (c)
@@ -180,7 +180,7 @@ static inline int atomic_inc_and_test(atomic_t *v)
 static inline void atomic_dec(atomic_t *v)
 {
     asm volatile (
-        "lock; decl %0"
+        "lock decl %0"
         : "=m" (*(volatile int *)&v->counter)
         : "m" (*(volatile int *)&v->counter) );
 }
@@ -194,7 +194,7 @@ static inline int atomic_dec_and_test(atomic_t *v)
 {
     bool c;
 
-    asm volatile ( "lock; decl %[counter]\n\t"
+    asm volatile ( "lock decl %[counter]\n\t"
                    ASM_FLAG_OUT(, "setz %[zf]\n\t")
                    : [counter] "+m" (*(volatile int *)&v->counter),
                      [zf] ASM_FLAG_OUT("=@ccz", "=qm") (c)
@@ -207,7 +207,7 @@ static inline int atomic_add_negative(int i, atomic_t *v)
 {
     bool c;
 
-    asm volatile ( "lock; addl %[i], %[counter]\n\t"
+    asm volatile ( "lock addl %[i], %[counter]\n\t"
                    ASM_FLAG_OUT(, "sets %[sf]\n\t")
                    : [counter] "+m" (*(volatile int *)&v->counter),
                      [sf] ASM_FLAG_OUT("=@ccs", "=qm") (c)
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 39e37f1cbe55..bb9d75646023 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -32,7 +32,7 @@
  */
 static inline void set_bit(int nr, volatile void *addr)
 {
-    asm volatile ( "lock; btsl %1,%0"
+    asm volatile ( "lock btsl %1,%0"
                    : "+m" (ADDR) : "Ir" (nr) : "memory");
 }
 #define set_bit(nr, addr) ({                            \
@@ -73,7 +73,7 @@ static inline void constant_set_bit(int nr, void *addr)
  */
 static inline void clear_bit(int nr, volatile void *addr)
 {
-    asm volatile ( "lock; btrl %1,%0"
+    asm volatile ( "lock btrl %1,%0"
                    : "+m" (ADDR) : "Ir" (nr) : "memory");
 }
 #define clear_bit(nr, addr) ({                          \
@@ -140,7 +140,7 @@ static inline void constant_change_bit(int nr, void *addr)
  */
 static inline void change_bit(int nr, volatile void *addr)
 {
-    asm volatile ( "lock; btcl %1,%0"
+    asm volatile ( "lock btcl %1,%0"
                     : "+m" (ADDR) : "Ir" (nr) : "memory");
 }
 #define change_bit(nr, addr) ({                         \
@@ -160,7 +160,7 @@ static inline int test_and_set_bit(int nr, volatile void *addr)
 {
     int oldbit;
 
-    asm volatile ( "lock; btsl %[nr], %[addr]\n\t"
+    asm volatile ( "lock btsl %[nr], %[addr]\n\t"
                    ASM_FLAG_OUT(, "sbbl %[old], %[old]\n\t")
                    : [old] ASM_FLAG_OUT("=@ccc", "=r") (oldbit),
                      [addr] "+m" (ADDR) : [nr] "Ir" (nr) : "memory" );
@@ -206,7 +206,7 @@ static inline int test_and_clear_bit(int nr, volatile void *addr)
 {
     int oldbit;
 
-    asm volatile ( "lock; btrl %[nr], %[addr]\n\t"
+    asm volatile ( "lock btrl %[nr], %[addr]\n\t"
                    ASM_FLAG_OUT(, "sbbl %[old], %[old]\n\t")
                    : [old] ASM_FLAG_OUT("=@ccc", "=r") (oldbit),
                      [addr] "+m" (ADDR) : [nr] "Ir" (nr) : "memory" );
@@ -266,7 +266,7 @@ static inline int test_and_change_bit(int nr, volatile void *addr)
 {
     int oldbit;
 
-    asm volatile ( "lock; btcl %[nr], %[addr]\n\t"
+    asm volatile ( "lock btcl %[nr], %[addr]\n\t"
                    ASM_FLAG_OUT(, "sbbl %[old], %[old]\n\t")
                    : [old] ASM_FLAG_OUT("=@ccc", "=r") (oldbit),
                      [addr] "+m" (ADDR) : [nr] "Ir" (nr) : "memory" );
diff --git a/xen/arch/x86/include/asm/spinlock.h b/xen/arch/x86/include/asm/spinlock.h
index 56f60957522a..834e8c580ebd 100644
--- a/xen/arch/x86/include/asm/spinlock.h
+++ b/xen/arch/x86/include/asm/spinlock.h
@@ -3,7 +3,7 @@
 
 #define _raw_read_unlock(l) \
     BUILD_BUG_ON(sizeof((l)->lock) != 4); /* Clang doesn't support %z in asm. */ \
-    asm volatile ( "lock; decl %0" : "+m" ((l)->lock) :: "memory" )
+    asm volatile ( "lock decl %0" : "+m" ((l)->lock) :: "memory" )
 
 /*
  * On x86 the only reordering is of reads with older writes.  In the

base-commit: e95dc03717b8ae00de2a0b41b88905af6170b210
-- 
2.39.5


