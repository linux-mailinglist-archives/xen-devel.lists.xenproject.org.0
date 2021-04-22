Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 715343682DA
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 16:57:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115573.220555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZalT-0006bu-5N; Thu, 22 Apr 2021 14:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115573.220555; Thu, 22 Apr 2021 14:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZalT-0006bK-1K; Thu, 22 Apr 2021 14:57:11 +0000
Received: by outflank-mailman (input) for mailman id 115573;
 Thu, 22 Apr 2021 14:57:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZalR-0006aj-CT
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:57:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18ce7d23-7784-47a5-9f97-26855f358af4;
 Thu, 22 Apr 2021 14:57:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D7905B183;
 Thu, 22 Apr 2021 14:57:05 +0000 (UTC)
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
X-Inumbo-ID: 18ce7d23-7784-47a5-9f97-26855f358af4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619103426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BnZJW8q+Psi2deBa+/DuTOElAH40rilmihBn23jtynU=;
	b=ufjUMTNSr5s1+ifoE88XzvrprycIhaeXF1PQfQPeI0SvDNYxjrSmNUmr0DAZcyD/FwrscJ
	PhirbSwZaeW2eJZ7RWyalbXuFHdOk90qji0C+/OIL1gGchNjiBcdU7/1I7gYytDCY4ONAS
	a5WQBcid15oAvZC75eJmOt8YyCthMjw=
Subject: [PATCH v3 21/22] x86emul: test AMX insns
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Message-ID: <19925d83-ae92-cdda-f5be-193cfb05c775@suse.com>
Date: Thu, 22 Apr 2021 16:57:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Carry out some basic matrix operations on 2x2, 3x3, and 4x4 matrixes.

To also have a use of a non-square matrix, also transpose ones of said
square formats via linearization and multiplication by the respective
transposition permutation matrix. To generate the latter, introduce a
small helper tool. This is mainly to avoid creating / populating a
rather large matrix (up to 16x16) in a stack variable.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -25,6 +25,12 @@ SHA := sse4-sha avx-sha avx512f-sha
 GF := sse2-gf avx2-gf avx512bw-gf
 TESTCASES := blowfish $(SIMD) $(FMA) $(SG) $(AES) $(CLMUL) $(SHA) $(GF)
 
+MATRIX := amx-bf16 amx-int8
+
+ifeq ($(XEN_COMPILE_ARCH),x86_64)
+TESTCASES += $(MATRIX)
+endif
+
 OPMASK := avx512f avx512dq avx512bw
 
 ifeq ($(origin XEN_COMPILE_ARCH),override)
@@ -96,6 +102,13 @@ avx512f-opmask-vecs := 2
 avx512dq-opmask-vecs := 1 2
 avx512bw-opmask-vecs := 4 8
 
+amx-bf16-dims := 2 3 4
+amx-bf16-ints :=
+amx-bf16-flts := 2
+amx-int8-dims := 2 3 4
+amx-int8-ints := 1
+amx-int8-flts :=
+
 # Suppress building by default of the harness if the compiler can't deal
 # with some of the extensions used.  Don't alter the "run" target dependencies
 # though, as this target needs to be specified manually, and things may work
@@ -170,6 +183,18 @@ endef
 define opmask-defs
 $(1)-opmask-cflags := $(foreach vec,$($(1)-opmask-vecs), "-D_$(vec) -m$(1) -Os -DSIZE=$(vec)")
 endef
+amx-cflags-common = $(CFLAGS_xeninclude) -Os -DN=$(1) -DTPM_H=tpm-$(1)x$(1).h
+define matrix-defs
+$(1).h: $(foreach dim,$($(1)-dims),tpm-$(dim)x$(dim).h)
+$(1)-cflags :=
+$(1)-cflags-x86_64 := \
+	$(foreach dim,$($(1)-dims), \
+	  $(foreach flt,$($(1)-flts), \
+	    "-D_$(dim)x$(dim) -DFLOAT_SIZE=$(flt) $(call amx-cflags-common,$(dim))") \
+	  $(foreach int,$($(1)-ints), \
+	    "-Di_$(dim)x$(dim) -DINT_SIZE=$(int) $(call amx-cflags-common,$(dim))" \
+	    "-Du_$(dim)x$(dim) -DUINT_SIZE=$(int) $(call amx-cflags-common,$(dim))"))
+endef
 
 $(foreach flavor,$(SIMD) $(FMA),$(eval $(call simd-defs,$(flavor))))
 $(foreach flavor,$(SG),$(eval $(call simd-sg-defs,$(flavor))))
@@ -178,6 +203,7 @@ $(foreach flavor,$(CLMUL),$(eval $(call
 $(foreach flavor,$(SHA),$(eval $(call simd-sha-defs,$(flavor))))
 $(foreach flavor,$(GF),$(eval $(call simd-gf-defs,$(flavor))))
 $(foreach flavor,$(OPMASK),$(eval $(call opmask-defs,$(flavor))))
+$(foreach flavor,$(MATRIX),$(eval $(call matrix-defs,$(flavor))))
 
 first-string = $(shell for s in $(1); do echo "$$s"; break; done)
 
@@ -248,6 +274,9 @@ $(addsuffix .h,$(SIMD) $(FMA) $(SG) $(AE
 
 xop.h avx512f.h: simd-fma.c
 
+$(addsuffix .c,$(MATRIX)):
+	ln -sf matrix.c $@
+
 endif # 32-bit override
 
 $(TARGET): x86-emulate.o cpuid.o test_x86_emulator.o evex-disp8.o predicates.o wrappers.o
@@ -295,6 +324,12 @@ x86-emulate.o cpuid.o test_x86_emulator.
 x86-emulate.o: x86_emulate/x86_emulate.c
 x86-emulate.o: HOSTCFLAGS += -D__XEN_TOOLS__
 
+tpm-%.h: mktpm Makefile
+	set -x; ./$< $(subst x,$(space),$*) >$@
+
+mktpm: mktpm.c
+	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
+
 # In order for our custom .type assembler directives to reliably land after
 # gcc's, we need to keep it from re-ordering top-level constructs.
 $(call cc-option-add,HOSTCFLAGS-toplevel,HOSTCC,-fno-toplevel-reorder)
--- /dev/null
+++ b/tools/tests/x86_emulator/matrix.c
@@ -0,0 +1,229 @@
+#include <stdbool.h>
+
+typedef unsigned int __attribute__((mode(QI))) uint8_t;
+typedef unsigned int __attribute__((mode(HI))) uint16_t;
+
+#define stringify_(x...) #x
+#define stringify(x...)  stringify_(x)
+
+#include <xen/asm/x86-types.h>
+
+asm ( "\t.text\n"
+      "\t.globl _start\n"
+      "_start:\n"
+      "\tjmp matrix_test" );
+
+/*
+ * For the purposes here we consider the 32-bit elements to hold just a single
+ * value, with the other slots zero-filled. This way the 2- or 4-way dot
+ * products really end up as simple multiplications, allowing us to treat the
+ * underlying insns as simple matrix multiply-and-accumulate ones. With
+ * suitably in-range numbers, this also allows us to have the compiler deal
+ * with, in particular, the bf16 fields without it actually knowing of such a
+ * type.
+ *
+ * Notation in comments:
+ * I  - identity matrix (all ones on the main diagonal)
+ * AI - all ones on the antidiagonal
+ */
+
+typedef union {
+#ifdef FLOAT_SIZE
+# define MACC "tdpbf16ps"
+    float val;
+    float res;
+    struct {
+        unsigned int zero:16;
+        unsigned int bf16:16;
+    };
+#else
+# ifdef INT_SIZE
+#  define SIGNED signed
+#  define MACC "tdpbssd"
+# else
+#  define MACC "tdpbuud"
+#  define SIGNED unsigned
+# endif
+    SIGNED int res;
+    struct {
+        SIGNED   int val :8;
+        unsigned int zero:24;
+    };
+#endif
+} elem_t;
+
+typedef elem_t tile_t[N][N];
+
+static void ldtilecfg(const struct x86_tilecfg *cfg)
+{
+    asm volatile ( "ldtilecfg %0" :: "m" (*cfg) );
+}
+
+#define load_diag(r, v) ({ \
+    struct { \
+        elem_t arr[2 * N - 1]; \
+    } in = { .arr[N - 1].val = (v) }; \
+    asm volatile ( "tileloadd -%c[scale](%[base],%[stride],%c[scale]), %%" #r \
+                   :: [base] "r" (&in.arr[N]), \
+                      [stride] "r" (-1L), \
+                      [scale] "i" (sizeof(elem_t)), \
+                      "m" (in) ); \
+})
+
+#define load_antidiag(r, v) ({ \
+    struct { \
+        elem_t arr[2 * N - 1]; \
+    } in = { .arr[N - 1].val = (v) }; \
+    asm volatile ( "tileloadd (%[base],%[stride]), %%" #r \
+                   :: [base] "r" (&in.arr), \
+                      [stride] "r" (sizeof(elem_t)), \
+                      "m" (in) ); \
+})
+
+#define load_linear(r, t) ({ \
+    (void)((t) == (const tile_t *)0); \
+    asm volatile ( "tileloadd (%[base]), %%" #r \
+                   :: [base] "r" (t), \
+                      "m" (*(t)) ); \
+})
+
+static const elem_t tpm[N * N][N * N] = {
+#include stringify(TPM_H)
+};
+
+#define load_tpm(r) \
+    asm volatile ( "tileloadd (%[base],%[stride],%c[scale]), %%" #r \
+                   :: [base] "r" (&tpm), \
+                      [stride] "r" (N * N * 1L), \
+                      [scale] "i" (sizeof(elem_t)), \
+                      "m" (tpm) ); \
+
+#define store(t, r) ({ \
+    (void)((t) == (tile_t *)0); \
+    asm volatile ( "tilestored %%" #r ", (%[base],%[stride],%c[scale])" \
+                   /* "+m" to keep the compiler from eliminating fill(). */ \
+                   : "+m" (*(t)) \
+                   : [base] "r" (t), \
+                     [stride] "r" (N * 1L), \
+                     [scale] "i" (sizeof(elem_t)) ); \
+})
+
+#define macc(srcdst, src1, src2) \
+    asm volatile ( MACC " %" #src2 ", %" #src1 ", %" #srcdst )
+
+#define mul(dst, src1, src2) ({ \
+    asm volatile ( "tilezero %" #dst ); \
+    macc(dst, src1, src2); \
+})
+
+#define add(dst, src1, src2, scratch) ({ \
+    load_diag(scratch, 1); \
+    mul(dst, src1, scratch); \
+    macc(dst, scratch, src2); \
+})
+
+static inline void fill(tile_t *t)
+{
+    unsigned int cnt = N * N;
+
+    asm ( "repe stosl"
+          : "=m" (*t), "+D" (t), "+c" (cnt)
+          : "a" (~0) );
+}
+
+static inline bool zero(const tile_t *t)
+{
+    unsigned int cnt = N * N;
+    bool zf;
+
+    asm ( "repe scasl"
+          : "=@ccz" (zf), "+D" (t), "+c" (cnt)
+          : "m" (*t), "a" (0) );
+
+    return zf;
+}
+
+#define C(cols) ((cols) * sizeof(elem_t))
+#define R(rows) (rows)
+
+int matrix_test(void)
+{
+    struct x86_tilecfg cfg = {
+        .palette = 1,
+        .colsb   = { C(N), C(N), C(N), C(N), 0, C(N * N), C(N * N), C(N * N) },
+        .rows    = { R(N), R(N), R(N), R(N), 0, R(1),     R(1),     R(N * N) },
+    };
+    tile_t x;
+    unsigned int i, j;
+
+    ldtilecfg(&cfg);
+
+    fill(&x);
+    store(&x, tmm0);
+    if ( !zero(&x) ) return __LINE__;
+
+    /* Load and store I. */
+    fill(&x);
+    load_diag(tmm0, 1);
+    store(&x, tmm0);
+    for ( i = 0; i < N; ++i )
+        for ( j = 0; j < N; ++j )
+            if ( x[i][j].res != (i == j) )
+                return __LINE__;
+
+    /* I + AI */
+    fill(&x);
+    load_antidiag(tmm1, 1);
+    add(tmm2, tmm0, tmm1, tmm3);
+    store(&x, tmm2);
+    for ( i = 0; i < N; ++i )
+        for ( j = 0; j < N; ++j )
+            if ( i == j && i + j == N - 1 )
+            {
+                if ( x[i][j].res != 2 )
+                    return __LINE__;
+            }
+            else if ( i == j || i + j == N - 1 )
+            {
+                if ( x[i][j].res != 1 )
+                    return __LINE__;
+            }
+            else if ( x[i][j].res )
+                return __LINE__;
+
+#ifndef UINT_SIZE
+    /* I + AI * -AI == 0 */
+    fill(&x);
+    load_antidiag(tmm2, -1);
+    macc(tmm0, tmm1, tmm2);
+    store(&x, tmm0);
+    if ( !zero(&x) ) return __LINE__;
+#endif
+
+    /*
+     * Transpose a matrix via linearization and multiplication by the
+     * respective transpostion permutation matrix. Note that linearization
+     * merely requires a different tile layout (see the initializer of cfg
+     * above).
+     */
+#ifdef UINT_SIZE
+# define VAL(r, c) ((c) < (r) ? (c) : (r) + (c) )
+#else
+# define VAL(r, c) ((c) < (r) ? -(r) : (r) + (c) )
+#endif
+    for ( i = 0; i < N; ++i )
+        for (j = 0; j < N; ++j )
+            x[i][j].val = VAL(i, j);
+    load_linear(tmm6, &x);
+    load_tpm(tmm7);
+    mul(tmm5, tmm6, tmm7);
+    /* There's just a single row, so re-use plain store() here. */
+    store(&x, tmm5);
+    for ( i = 0; i < N; ++i )
+        for (j = 0; j < N; ++j )
+            if ( x[i][j].res != VAL(j, i) )
+                return __LINE__;
+#undef VAL
+
+    return 0;
+}
--- /dev/null
+++ b/tools/tests/x86_emulator/mktpm.c
@@ -0,0 +1,41 @@
+/* make Transposition Permutation Matrix */
+
+#include <stdio.h>
+#include <stdlib.h>
+
+static void line(unsigned one, unsigned cols)
+{
+    unsigned i;
+
+    printf("    { ");
+    for ( i = 0; i < cols - 1; ++i )
+        printf("{ %d }, ", i == one);
+    printf("{ %d } },\n", i == one);
+}
+
+int main(int argc, char*argv[])
+{
+    unsigned i, j, m, n;
+
+    switch ( argc )
+    {
+    default:
+        fprintf(stderr, "Usage: %s <rows> [<cols>]\n", argv[0]);
+        return argc != 1;
+
+    case 3:
+        n = strtoul(argv[2], NULL, 0);
+        /* fall-through */
+    case 2:
+        m = strtoul(argv[1], NULL, 0);
+        if ( argc == 2 )
+            n = m;
+        break;
+    }
+
+    for ( i = 0; i < m * n; )
+        for ( j = i / n; j < m * n; j += m, ++i )
+            line(j, m * n);
+
+    return 0;
+}
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -44,6 +44,11 @@ asm ( ".pushsection .test, \"ax\", @prog
 #include "avx512vbmi.h"
 #include "avx512vbmi2-vpclmulqdq.h"
 
+#ifdef __x86_64__
+#include "amx-bf16.h"
+#include "amx-int8.h"
+#endif
+
 #define verbose false /* Switch to true for far more logging. */
 
 static void blowfish_set_regs(struct cpu_user_regs *regs)
@@ -263,6 +268,33 @@ static bool simd_check_regs(const struct
     return false;
 }
 
+#ifdef __x86_64__
+
+static bool amx_check_bf16(void)
+{
+    return cp.feat.amx_bf16;
+}
+
+static bool amx_check_int8(void)
+{
+    return cp.feat.amx_int8;
+}
+
+static void amx_set_regs(struct cpu_user_regs *regs)
+{
+}
+
+static bool amx_check_regs(const struct cpu_user_regs *regs)
+{
+    asm volatile ( ".byte 0xc4, 0xe2, 0x78, 0x49, 0xc0" ); /* tilerelease */
+    if ( !regs->eax )
+        return true;
+    printf("[line %u] ", (unsigned int)regs->eax);
+    return false;
+}
+
+#endif
+
 static const struct {
     const void *code;
     size_t size;
@@ -534,6 +566,25 @@ static const struct {
 #undef AVX512VL
 #undef SIMD_
 #undef SIMD
+#ifdef __x86_64__
+# define AMX(desc, feat, t, dim)                                              \
+    { .code = amx_ ## feat ## _x86_64_D ## t ## _ ## dim ## x ## dim,         \
+      .size = sizeof(amx_ ## feat ## _x86_64_D ## t ## _ ## dim ## x ## dim), \
+      .bitness = 64, .name = "AMX-" #desc " (" #t #dim "x" #dim ")",          \
+      .check_cpu = amx_check_ ## feat,                                        \
+      .set_regs = amx_set_regs,                                               \
+      .check_regs = amx_check_regs }
+    AMX(BF16, bf16, , 2),
+    AMX(BF16, bf16, , 3),
+    AMX(BF16, bf16, , 4),
+    AMX(INT8, int8, i, 2),
+    AMX(INT8, int8, i, 3),
+    AMX(INT8, int8, i, 4),
+    AMX(INT8, int8, u, 2),
+    AMX(INT8, int8, u, 3),
+    AMX(INT8, int8, u, 4),
+# undef AMX
+#endif
 };
 
 static unsigned int bytes_read;


