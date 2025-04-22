Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32952A97019
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:11:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962927.1354102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FHp-0003DG-KA; Tue, 22 Apr 2025 15:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962927.1354102; Tue, 22 Apr 2025 15:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FHp-00039a-FT; Tue, 22 Apr 2025 15:11:49 +0000
Received: by outflank-mailman (input) for mailman id 962927;
 Tue, 22 Apr 2025 15:11:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiSK=XI=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7FDh-0000lQ-Gd
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:07:33 +0000
Received: from 10.mo550.mail-out.ovh.net (10.mo550.mail-out.ovh.net
 [178.32.96.102]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8423ef29-1f8b-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 17:07:32 +0200 (CEST)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.2.23])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4Zhlw428byz1Xrw
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 15:07:32 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-f9k6v (unknown [10.110.118.84])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 69FDB1FD44;
 Tue, 22 Apr 2025 15:07:31 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.104])
 by ghost-submission-5b5ff79f4f-f9k6v with ESMTPSA
 id rxlND7OwB2hWRgEAxaKnhg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 22 Apr 2025 15:07:31 +0000
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
X-Inumbo-ID: 8423ef29-1f8b-11f0-9eb0-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-104R00542a86e06-f440-4221-95ca-16fc201bff01,
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
Subject: [PATCH 10/21] lib/sha256.c: add file
Date: Tue, 22 Apr 2025 18:06:44 +0300
Message-ID: <92b461c8d5981a523293341346274b6cc1b76d9b.1745172094.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12732802049230353564
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -105
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlqdehmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvedvgfeukeehhfevuddvheetudekkefggfeiveehvefhgfehgfffhffgvefhudejnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpnhhishhtrdhgohhvnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=cpM4QmeM8xWvrjEkqxDqzsZbZ3g224BrNjdlnp8nQ/I=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745334452; v=1;
 b=LE9iVO/+PznrQo2udORusIQdcf0bKmGUAd4jA8Eo1BR+HmyxpHzggY9ZMLdnkwEp9pdwbPRb
 EI2KJINBdDu6fFBwmQIje9ajHi7/eHzOlHTqqEeceHzwDZaipnNUc4XYfwt0TCJy1v8QrehKJvR
 2g0twC6fZSvdDhlyktFja1KStZIepnop32DPDj04pmi6c9IQF85uPnnO0bi4bPaeV5JRGg4UD2e
 bIM/otbqekD4+1bOZuuKDxCUhvGuF7zdiex7xNJnTal/W+ffN6yfJQtyH0GYQFnEFhx1hp7nBfS
 mNg7paDZJfTok8C26E1M4R9b9+dwfZCo1K/37gMB2Bp2w==

The code comes from [1] and is licensed under GPL-2.0 or later version
of the license.  It's a combination of:
 - include/crypto/sha2.h
 - include/crypto/sha256_base.h
 - lib/crypto/sha256.c
 - crypto/sha256_generic.c

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
 xen/include/xen/sha256.h |  12 ++
 xen/lib/Makefile         |   1 +
 xen/lib/sha256.c         | 238 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 251 insertions(+)
 create mode 100644 xen/include/xen/sha256.h
 create mode 100644 xen/lib/sha256.c

diff --git a/xen/include/xen/sha256.h b/xen/include/xen/sha256.h
new file mode 100644
index 0000000000..703eddc198
--- /dev/null
+++ b/xen/include/xen/sha256.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __XEN_SHA256_H
+#define __XEN_SHA256_H
+
+#include <xen/inttypes.h>
+
+#define SHA256_DIGEST_SIZE  32
+
+void sha256_hash(const u8 *data, unsigned int len, u8 *out);
+
+#endif /* !__XEN_SHA256_H */
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 0d5774b8d7..c7a8d1bb02 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -39,6 +39,7 @@ lib-y += strtoul.o
 lib-y += strtoull.o
 lib-$(CONFIG_X86) += x86-generic-hweightl.o
 lib-$(CONFIG_X86) += sha1.o
+lib-$(CONFIG_X86) += sha256.o
 lib-$(CONFIG_X86) += xxhash32.o
 lib-$(CONFIG_X86) += xxhash64.o
 
diff --git a/xen/lib/sha256.c b/xen/lib/sha256.c
new file mode 100644
index 0000000000..369a52af80
--- /dev/null
+++ b/xen/lib/sha256.c
@@ -0,0 +1,238 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * SHA-256, as specified in
+ * http://csrc.nist.gov/groups/STM/cavp/documents/shs/sha256-384-512.pdf
+ *
+ * SHA-256 code by Jean-Luc Cooke <jlcooke@certainkey.com>.
+ *
+ * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
+ * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
+ * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
+ * Copyright (c) 2014 Red Hat Inc.
+ */
+
+#include <xen/bitops.h>
+#include <xen/sha256.h>
+#include <xen/unaligned.h>
+
+#define SHA256_BLOCK_SIZE 64
+
+struct sha256_state {
+    uint32_t state[SHA256_DIGEST_SIZE / 4];
+    uint64_t count;
+    uint8_t buf[SHA256_BLOCK_SIZE];
+};
+
+typedef void sha256_block_fn(struct sha256_state *sst, uint8_t const *src,
+                             int blocks);
+
+static const uint32_t SHA256_K[] = {
+    0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5,
+    0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
+    0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
+    0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
+    0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc,
+    0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
+    0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
+    0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
+    0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
+    0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
+    0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3,
+    0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
+    0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5,
+    0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
+    0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
+    0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
+};
+
+static uint32_t Ch(uint32_t x, uint32_t y, uint32_t z)
+{
+    return z ^ (x & (y ^ z));
+}
+
+static uint32_t Maj(uint32_t x, uint32_t y, uint32_t z)
+{
+    return (x & y) | (z & (x | y));
+}
+
+#define e0(x)       (ror32(x, 2) ^ ror32(x, 13) ^ ror32(x, 22))
+#define e1(x)       (ror32(x, 6) ^ ror32(x, 11) ^ ror32(x, 25))
+#define s0(x)       (ror32(x, 7) ^ ror32(x, 18) ^ (x >> 3))
+#define s1(x)       (ror32(x, 17) ^ ror32(x, 19) ^ (x >> 10))
+
+static void LOAD_OP(int I, uint32_t *W, const uint8_t *input)
+{
+    W[I] = get_unaligned_be32((uint32_t *)input + I);
+}
+
+static void BLEND_OP(int I, uint32_t *W)
+{
+    W[I] = s1(W[I - 2]) + W[I - 7] + s0(W[I - 15]) + W[I - 16];
+}
+
+#define SHA256_ROUND(i, a, b, c, d, e, f, g, h) do {       \
+        uint32_t t1, t2;                                   \
+        t1 = h + e1(e) + Ch(e, f, g) + SHA256_K[i] + W[i]; \
+        t2 = e0(a) + Maj(a, b, c);                         \
+        d += t1;                                           \
+        h = t1 + t2;                                       \
+    } while ( 0 )
+
+static void sha256_init(struct sha256_state *sctx)
+{
+    sctx->state[0] = 0x6a09e667UL;
+    sctx->state[1] = 0xbb67ae85UL;
+    sctx->state[2] = 0x3c6ef372UL;
+    sctx->state[3] = 0xa54ff53aUL;
+    sctx->state[4] = 0x510e527fUL;
+    sctx->state[5] = 0x9b05688cUL;
+    sctx->state[6] = 0x1f83d9abUL;
+    sctx->state[7] = 0x5be0cd19UL;
+    sctx->count = 0;
+}
+
+static void sha256_do_update(struct sha256_state *sctx,
+                             const uint8_t *data,
+                             unsigned int len,
+                             sha256_block_fn *block_fn)
+{
+    unsigned int partial = sctx->count % SHA256_BLOCK_SIZE;
+
+    sctx->count += len;
+
+    if ( unlikely((partial + len) >= SHA256_BLOCK_SIZE) )
+    {
+        int blocks;
+
+        if ( partial )
+        {
+            int p = SHA256_BLOCK_SIZE - partial;
+
+            memcpy(sctx->buf + partial, data, p);
+            data += p;
+            len -= p;
+
+            block_fn(sctx, sctx->buf, 1);
+        }
+
+        blocks = len / SHA256_BLOCK_SIZE;
+        len %= SHA256_BLOCK_SIZE;
+
+        if ( blocks )
+        {
+            block_fn(sctx, data, blocks);
+            data += blocks * SHA256_BLOCK_SIZE;
+        }
+        partial = 0;
+    }
+    if ( len )
+        memcpy(sctx->buf + partial, data, len);
+}
+
+static void sha256_do_finalize(struct sha256_state *sctx,
+                               sha256_block_fn *block_fn)
+{
+    const int bit_offset = SHA256_BLOCK_SIZE - sizeof(__be64);
+    __be64 *bits = (__be64 *)(sctx->buf + bit_offset);
+    unsigned int partial = sctx->count % SHA256_BLOCK_SIZE;
+
+    sctx->buf[partial++] = 0x80;
+    if ( partial > bit_offset )
+    {
+        memset(sctx->buf + partial, 0x0, SHA256_BLOCK_SIZE - partial);
+        partial = 0;
+
+        block_fn(sctx, sctx->buf, 1);
+    }
+
+    memset(sctx->buf + partial, 0x0, bit_offset - partial);
+    *bits = cpu_to_be64(sctx->count << 3);
+    block_fn(sctx, sctx->buf, 1);
+}
+
+static void sha256_finish(struct sha256_state *sctx, uint8_t *out,
+                          unsigned int digest_size)
+{
+    __be32 *digest = (__be32 *)out;
+    int i;
+
+    for ( i = 0; digest_size > 0; i++, digest_size -= sizeof(__be32) )
+        put_unaligned_be32(sctx->state[i], digest++);
+
+    memset(sctx, 0, sizeof(*sctx));
+}
+
+static void sha256_transform(uint32_t *state, const uint8_t *input, uint32_t *W)
+{
+    uint32_t a, b, c, d, e, f, g, h;
+    int i;
+
+    /* load the input */
+    for ( i = 0; i < 16; i += 8 )
+    {
+        LOAD_OP(i + 0, W, input);
+        LOAD_OP(i + 1, W, input);
+        LOAD_OP(i + 2, W, input);
+        LOAD_OP(i + 3, W, input);
+        LOAD_OP(i + 4, W, input);
+        LOAD_OP(i + 5, W, input);
+        LOAD_OP(i + 6, W, input);
+        LOAD_OP(i + 7, W, input);
+    }
+
+    /* now blend */
+    for ( i = 16; i < 64; i += 8 )
+    {
+        BLEND_OP(i + 0, W);
+        BLEND_OP(i + 1, W);
+        BLEND_OP(i + 2, W);
+        BLEND_OP(i + 3, W);
+        BLEND_OP(i + 4, W);
+        BLEND_OP(i + 5, W);
+        BLEND_OP(i + 6, W);
+        BLEND_OP(i + 7, W);
+    }
+
+    /* load the state into our registers */
+    a = state[0]; b = state[1]; c = state[2]; d = state[3];
+    e = state[4]; f = state[5]; g = state[6]; h = state[7];
+
+    /* now iterate */
+    for ( i = 0; i < 64; i += 8 )
+    {
+        SHA256_ROUND(i + 0, a, b, c, d, e, f, g, h);
+        SHA256_ROUND(i + 1, h, a, b, c, d, e, f, g);
+        SHA256_ROUND(i + 2, g, h, a, b, c, d, e, f);
+        SHA256_ROUND(i + 3, f, g, h, a, b, c, d, e);
+        SHA256_ROUND(i + 4, e, f, g, h, a, b, c, d);
+        SHA256_ROUND(i + 5, d, e, f, g, h, a, b, c);
+        SHA256_ROUND(i + 6, c, d, e, f, g, h, a, b);
+        SHA256_ROUND(i + 7, b, c, d, e, f, g, h, a);
+    }
+
+    state[0] += a; state[1] += b; state[2] += c; state[3] += d;
+    state[4] += e; state[5] += f; state[6] += g; state[7] += h;
+}
+
+static void sha256_transform_blocks(struct sha256_state *sctx,
+                                    const uint8_t *input, int blocks)
+{
+    uint32_t W[64];
+
+    do {
+        sha256_transform(sctx->state, input, W);
+        input += SHA256_BLOCK_SIZE;
+    } while ( --blocks );
+
+    memset(W, 0, sizeof(W));
+}
+
+void sha256_hash(const uint8_t *data, unsigned int len, uint8_t *out)
+{
+    struct sha256_state sctx;
+
+    sha256_init(&sctx);
+    sha256_do_update(&sctx, data, len, sha256_transform_blocks);
+    sha256_do_finalize(&sctx, sha256_transform_blocks);
+    sha256_finish(&sctx, out, SHA256_DIGEST_SIZE);
+}
-- 
2.49.0


