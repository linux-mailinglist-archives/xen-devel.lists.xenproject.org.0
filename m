Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD97A96FEF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962778.1353981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FDh-0002k7-GF; Tue, 22 Apr 2025 15:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962778.1353981; Tue, 22 Apr 2025 15:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FDh-0002hC-CL; Tue, 22 Apr 2025 15:07:33 +0000
Received: by outflank-mailman (input) for mailman id 962778;
 Tue, 22 Apr 2025 15:07:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiSK=XI=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7FDf-0000lQ-GT
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:07:31 +0000
Received: from 16.mo583.mail-out.ovh.net (16.mo583.mail-out.ovh.net
 [87.98.174.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 825c7e38-1f8b-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 17:07:30 +0200 (CEST)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.148.21])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4Zhlw11xj6z1gwT
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 15:07:29 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-6tjtj (unknown [10.110.178.32])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 518011FEC4;
 Tue, 22 Apr 2025 15:07:28 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-6tjtj with ESMTPSA
 id XczlBbCwB2gtAQEAHtJGkA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 22 Apr 2025 15:07:28 +0000
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
X-Inumbo-ID: 825c7e38-1f8b-11f0-9eb0-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-113S007e787a2bd-89e1-430c-a228-f3b8fb6ac07a,
                    7E508E014E7E7C169EB13C6E22C3C4EBF1F0FDD7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH 09/21] lib/sha1.c: add file
Date: Tue, 22 Apr 2025 18:06:43 +0300
Message-ID: <8dec423182ed60e2233ed87d98066fed6dc20caf.1745172094.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12731957624680330396
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiteejtdffveekuddtgfegteffkefhgedujeehfeefveekvdevveevteeufeevteenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekfegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=WDJT0W+j5imcAWnKzPI6gEyLmrSG03CfujuYBuS2VuQ=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745334449; v=1;
 b=UM7ZURbYhRRjQiFbl+pHtxZI+t5eXVeafpdrNRYGif+JnCVnauX1q3w+R+agFXTXvTxycoY8
 K/zkiFFYN+IEs1tMSWwMDKWIdSOTUPMizO22JcWzReXz3SkWwWrPgQuQsDsr3Hn3oTKYlXuBH/P
 MCPhTu+8SjWRWZsxauiCXM5/1xHufeTEr2f2SnjHaVhSPo95NeehkjHVHhZuCOTYIe4q40uays0
 Of5g6Ipa7VPRkBZVNoH3YoKnbNZAY4G19p1WOCELba3wkpbyhfYbf2uSS+VCSNFG1CTUvCtpOIA
 BSl83zhAYMUvpKcoQZcK8KcjmIztsMhnvPWmncXmmjOlQ==

From: Krystian Hebel <krystian.hebel@3mdeb.com>

The code comes from [1] and is licensed under GPL-2.0 license.
It's a combination of:
 - include/crypto/sha1.h
 - include/crypto/sha1_base.h
 - lib/crypto/sha1.c
 - crypto/sha1_generic.c

Changes:
 - includes
 - formatting
 - renames and splicing of some trivial functions that are called once
 - dropping of `int` return values (only zero was ever returned)
 - getting rid of references to `struct shash_desc`

[1]: https://github.com/torvalds/linux/tree/afdab700f65e14070d8ab92175544b1c62b8bf03

Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
---
 xen/include/xen/sha1.h |  12 +++
 xen/lib/Makefile       |   1 +
 xen/lib/sha1.c         | 240 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 253 insertions(+)
 create mode 100644 xen/include/xen/sha1.h
 create mode 100644 xen/lib/sha1.c

diff --git a/xen/include/xen/sha1.h b/xen/include/xen/sha1.h
new file mode 100644
index 0000000000..752dfdf827
--- /dev/null
+++ b/xen/include/xen/sha1.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __XEN_SHA1_H
+#define __XEN_SHA1_H
+
+#include <xen/inttypes.h>
+
+#define SHA1_DIGEST_SIZE  20
+
+void sha1_hash(const u8 *data, unsigned int len, u8 *out);
+
+#endif /* !__XEN_SHA1_H */
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 76dc86fab0..0d5774b8d7 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -38,6 +38,7 @@ lib-y += strtoll.o
 lib-y += strtoul.o
 lib-y += strtoull.o
 lib-$(CONFIG_X86) += x86-generic-hweightl.o
+lib-$(CONFIG_X86) += sha1.o
 lib-$(CONFIG_X86) += xxhash32.o
 lib-$(CONFIG_X86) += xxhash64.o
 
diff --git a/xen/lib/sha1.c b/xen/lib/sha1.c
new file mode 100644
index 0000000000..a11822519d
--- /dev/null
+++ b/xen/lib/sha1.c
@@ -0,0 +1,240 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * SHA1 routine optimized to do word accesses rather than byte accesses,
+ * and to avoid unnecessary copies into the context array.
+ *
+ * This was based on the git SHA1 implementation.
+ */
+
+#include <xen/bitops.h>
+#include <xen/types.h>
+#include <xen/sha1.h>
+#include <xen/unaligned.h>
+
+/*
+ * If you have 32 registers or more, the compiler can (and should)
+ * try to change the array[] accesses into registers. However, on
+ * machines with less than ~25 registers, that won't really work,
+ * and at least gcc will make an unholy mess of it.
+ *
+ * So to avoid that mess which just slows things down, we force
+ * the stores to memory to actually happen (we might be better off
+ * with a 'W(t)=(val);asm("":"+m" (W(t))' there instead, as
+ * suggested by Artur Skawina - that will also make gcc unable to
+ * try to do the silly "optimize away loads" part because it won't
+ * see what the value will be).
+ *
+ * Ben Herrenschmidt reports that on PPC, the C version comes close
+ * to the optimized asm with this (ie on PPC you don't want that
+ * 'volatile', since there are lots of registers).
+ *
+ * On ARM we get the best code generation by forcing a full memory barrier
+ * between each SHA_ROUND, otherwise gcc happily get wild with spilling and
+ * the stack frame size simply explode and performance goes down the drain.
+ */
+
+#ifdef CONFIG_X86
+  #define setW(x, val) (*(volatile uint32_t *)&W(x) = (val))
+#elif defined(CONFIG_ARM)
+  #define setW(x, val) do { W(x) = (val); __asm__("":::"memory"); } while ( 0 )
+#else
+  #define setW(x, val) (W(x) = (val))
+#endif
+
+/* This "rolls" over the 512-bit array */
+#define W(x) (array[(x) & 15])
+
+/*
+ * Where do we get the source from? The first 16 iterations get it from
+ * the input data, the next mix it from the 512-bit array.
+ */
+#define SHA_SRC(t) get_unaligned_be32((uint32_t *)data + t)
+#define SHA_MIX(t) rol32(W(t + 13) ^ W(t + 8) ^ W(t + 2) ^ W(t), 1)
+
+#define SHA_ROUND(t, input, fn, constant, A, B, C, D, E) do { \
+        uint32_t TEMP = input(t); setW(t, TEMP);              \
+        E += TEMP + rol32(A, 5) + (fn) + (constant);          \
+        B = ror32(B, 2);                                      \
+        TEMP = E; E = D; D = C; C = B; B = A; A = TEMP;       \
+    } while ( 0 )
+
+#define T_0_15(t, A, B, C, D, E)  \
+        SHA_ROUND(t, SHA_SRC, (((C ^ D) & B) ^ D), 0x5a827999, A, B, C, D, E)
+#define T_16_19(t, A, B, C, D, E) \
+        SHA_ROUND(t, SHA_MIX, (((C ^ D) & B) ^ D), 0x5a827999, A, B, C, D, E)
+#define T_20_39(t, A, B, C, D, E) \
+        SHA_ROUND(t, SHA_MIX, (B ^ C ^ D), 0x6ed9eba1, A, B, C, D, E)
+#define T_40_59(t, A, B, C, D, E)                                             \
+        SHA_ROUND(t, SHA_MIX, ((B & C) + (D & (B ^ C))), 0x8f1bbcdc, A, B, C, \
+                  D, E)
+#define T_60_79(t, A, B, C, D, E) \
+        SHA_ROUND(t, SHA_MIX, (B ^ C ^ D), 0xca62c1d6, A, B, C, D, E)
+
+#define SHA1_BLOCK_SIZE         64
+#define SHA1_WORKSPACE_WORDS    16
+
+struct sha1_state {
+    uint32_t state[SHA1_DIGEST_SIZE / 4];
+    uint64_t count;
+    uint8_t buffer[SHA1_BLOCK_SIZE];
+};
+
+typedef void sha1_block_fn(struct sha1_state *sst, const uint8_t *src, int blocks);
+
+/**
+ * sha1_transform - single block SHA1 transform (deprecated)
+ *
+ * @digest: 160 bit digest to update
+ * @data:   512 bits of data to hash
+ * @array:  16 words of workspace (see note)
+ *
+ * This function executes SHA-1's internal compression function.  It updates the
+ * 160-bit internal state (@digest) with a single 512-bit data block (@data).
+ *
+ * Don't use this function.  SHA-1 is no longer considered secure.  And even if
+ * you do have to use SHA-1, this isn't the correct way to hash something with
+ * SHA-1 as this doesn't handle padding and finalization.
+ *
+ * Note: If the hash is security sensitive, the caller should be sure
+ * to clear the workspace. This is left to the caller to avoid
+ * unnecessary clears between chained hashing operations.
+ */
+void sha1_transform(uint32_t *digest, const uint8_t *data, uint32_t *array)
+{
+    uint32_t A, B, C, D, E;
+    unsigned int i = 0;
+
+    A = digest[0];
+    B = digest[1];
+    C = digest[2];
+    D = digest[3];
+    E = digest[4];
+
+    /* Round 1 - iterations 0-16 take their input from 'data' */
+    for ( ; i < 16; ++i )
+        T_0_15(i, A, B, C, D, E);
+
+    /* Round 1 - tail. Input from 512-bit mixing array */
+    for ( ; i < 20; ++i )
+        T_16_19(i, A, B, C, D, E);
+
+    /* Round 2 */
+    for ( ; i < 40; ++i )
+        T_20_39(i, A, B, C, D, E);
+
+    /* Round 3 */
+    for ( ; i < 60; ++i )
+        T_40_59(i, A, B, C, D, E);
+
+    /* Round 4 */
+    for ( ; i < 80; ++i )
+        T_60_79(i, A, B, C, D, E);
+
+    digest[0] += A;
+    digest[1] += B;
+    digest[2] += C;
+    digest[3] += D;
+    digest[4] += E;
+}
+
+static void sha1_init(struct sha1_state *sctx)
+{
+    sctx->state[0] = 0x67452301UL;
+    sctx->state[1] = 0xefcdab89UL;
+    sctx->state[2] = 0x98badcfeUL;
+    sctx->state[3] = 0x10325476UL;
+    sctx->state[4] = 0xc3d2e1f0UL;
+    sctx->count = 0;
+}
+
+static void sha1_do_update(struct sha1_state *sctx,
+                           const uint8_t *data,
+                           unsigned int len,
+                           sha1_block_fn *block_fn)
+{
+    unsigned int partial = sctx->count % SHA1_BLOCK_SIZE;
+
+    sctx->count += len;
+
+    if ( unlikely((partial + len) >= SHA1_BLOCK_SIZE) )
+    {
+        int blocks;
+
+        if ( partial )
+        {
+            int p = SHA1_BLOCK_SIZE - partial;
+
+            memcpy(sctx->buffer + partial, data, p);
+            data += p;
+            len -= p;
+
+            block_fn(sctx, sctx->buffer, 1);
+        }
+
+        blocks = len / SHA1_BLOCK_SIZE;
+        len %= SHA1_BLOCK_SIZE;
+
+        if ( blocks )
+        {
+            block_fn(sctx, data, blocks);
+            data += blocks * SHA1_BLOCK_SIZE;
+        }
+        partial = 0;
+    }
+    if ( len )
+        memcpy(sctx->buffer + partial, data, len);
+}
+
+static void sha1_do_finalize(struct sha1_state *sctx, sha1_block_fn *block_fn)
+{
+    const int bit_offset = SHA1_BLOCK_SIZE - sizeof(__be64);
+    __be64 *bits = (__be64 *)(sctx->buffer + bit_offset);
+    unsigned int partial = sctx->count % SHA1_BLOCK_SIZE;
+
+    sctx->buffer[partial++] = 0x80;
+    if ( partial > bit_offset )
+    {
+        memset(sctx->buffer + partial, 0x0, SHA1_BLOCK_SIZE - partial);
+        partial = 0;
+
+        block_fn(sctx, sctx->buffer, 1);
+    }
+
+    memset(sctx->buffer + partial, 0x0, bit_offset - partial);
+    *bits = cpu_to_be64(sctx->count << 3);
+    block_fn(sctx, sctx->buffer, 1);
+}
+
+static void sha1_finish(struct sha1_state *sctx, uint8_t *out)
+{
+    __be32 *digest = (__be32 *)out;
+    int i;
+
+    for ( i = 0; i < SHA1_DIGEST_SIZE / sizeof(__be32); i++ )
+        put_unaligned_be32(sctx->state[i], digest++);
+
+    memset(sctx, 0, sizeof(*sctx));
+}
+
+static void sha1_generic_block_fn(struct sha1_state *sctx, const uint8_t *src,
+                                  int blocks)
+{
+    uint32_t temp[SHA1_WORKSPACE_WORDS];
+
+    while ( blocks-- )
+    {
+        sha1_transform(sctx->state, src, temp);
+        src += SHA1_BLOCK_SIZE;
+    }
+    memset(temp, 0, sizeof(temp));
+}
+
+void sha1_hash(const uint8_t *data, unsigned int len, uint8_t *out)
+{
+    struct sha1_state sctx;
+
+    sha1_init(&sctx);
+    sha1_do_update(&sctx, data, len, sha1_generic_block_fn);
+    sha1_do_finalize(&sctx, sha1_generic_block_fn);
+    sha1_finish(&sctx, out);
+}
-- 
2.49.0


