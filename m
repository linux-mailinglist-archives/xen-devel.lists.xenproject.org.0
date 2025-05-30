Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0419AC8FBC
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:19:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000951.1381189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzdo-0003el-Gr; Fri, 30 May 2025 13:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000951.1381189; Fri, 30 May 2025 13:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzdo-0003cn-D1; Fri, 30 May 2025 13:19:20 +0000
Received: by outflank-mailman (input) for mailman id 1000951;
 Fri, 30 May 2025 13:19:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDQw=YO=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uKzdn-0003ZU-26
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:19:19 +0000
Received: from 10.mo582.mail-out.ovh.net (10.mo582.mail-out.ovh.net
 [87.98.157.236]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4170f4e-3d58-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 15:18:56 +0200 (CEST)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.140.35])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4b83jD4Vjdz1SmT
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 13:18:56 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-9nq6m (unknown [10.108.42.28])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 66338C0276;
 Fri, 30 May 2025 13:18:55 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
 by ghost-submission-5b5ff79f4f-9nq6m with ESMTPSA
 id w09eBz+wOWgo8QAAj53byA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 30 May 2025 13:18:55 +0000
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
X-Inumbo-ID: a4170f4e-3d58-11f0-b894-0df219b8e170
Authentication-Results:garm.ovh; auth=pass (GARM-110S004e213af52-45b3-49a3-b1b6-7b97c322dceb,
                    A4E380CC922F0B59227EC5DCC46884561651840B) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
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
Subject: [PATCH v3 09/22] xen/lib: add implementation of SHA-1
Date: Fri, 30 May 2025 16:17:51 +0300
Message-ID: <a63da5121827a25189db4704326addd8dc10aad6.1748611041.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12700150950728086684
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -110
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleduudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddquddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvedvgfeukeehhfevuddvheetudekkefggfeiveehvefhgfehgfffhffgvefhudejnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpnhhishhtrdhgohhvnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekvdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=K3Dew7MrO0ilxuikP+BcmF7QZioZCbjXXYgwGcnqPdk=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748611136; v=1;
 b=PdZw+hQFIYx7PC+k/ctBqeINiD2mnpzbA1VGm6XEnnkFD1DSWdx+OLK7cPak4cye9xCHjy6V
 +6XvolUAOl1tfjKtITbQ2b3cfdvd9AnrfqF33F9jLU0tIbi6h3Rk4GhgD6fm0fp7/JTyp+/2HfR
 PCRXJPFAda9x0wOGO9NbWogP6WhKUep0f6FClfzLLizSiE0ymMy61DOFpdQXsR/zN/K7sg2aJec
 o3ZKpREmvB51N3TfXQLA0AiF6LZWc4f2wCUYd6lFYGhABQQ9y3FwnlbL51oeIDHy9Rc43FMPc1n
 GAAvjH9rHZYB0o92fMSWA5duwB7oPMbDAckHVz/RXnZXg==

From: Krystian Hebel <krystian.hebel@3mdeb.com>

The code comes from [1] and is licensed under GPL-2.0 license.
The initial version was a combination of:
 - include/crypto/sha1.h
 - include/crypto/sha1_base.h
 - lib/crypto/sha1.c
 - crypto/sha1_generic.c

Changes:
 - includes, formatting, naming
 - renames and splicing of some trivial functions that are called once
 - dropping of `int` return values (only zero was ever returned)
 - getting rid of references to `struct shash_desc`
 - getting rid of macros
 - getting rid of unnecessary function pointers
 - removing workaround for some old version of GCC

[1]: https://github.com/torvalds/linux/tree/afdab700f65e14070d8ab92175544b1c62b8bf03

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/include/xen/sha1.h |  14 +++
 xen/lib/Makefile       |   1 +
 xen/lib/sha1.c         | 190 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 205 insertions(+)
 create mode 100644 xen/include/xen/sha1.h
 create mode 100644 xen/lib/sha1.c

diff --git a/xen/include/xen/sha1.h b/xen/include/xen/sha1.h
new file mode 100644
index 0000000000..909ca25a50
--- /dev/null
+++ b/xen/include/xen/sha1.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SHA1: https://csrc.nist.gov/pubs/fips/180-4/upd1/final
+ */
+#ifndef XEN_SHA1_H
+#define XEN_SHA1_H
+
+#include <xen/types.h>
+
+#define SHA1_DIGEST_SIZE  20
+
+void sha1_hash(uint8_t digest[SHA1_DIGEST_SIZE], const void *msg, size_t len);
+
+#endif /* XEN_SHA1_H */
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 5ccb1e5241..fd4b9ece63 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -17,6 +17,7 @@ lib-y += memset.o
 lib-y += muldiv64.o
 lib-y += parse-size.o
 lib-y += rbtree.o
+lib-$(CONFIG_X86) += sha1.o
 lib-$(CONFIG_X86) += sha2-256.o
 lib-y += sort.o
 lib-y += strcasecmp.o
diff --git a/xen/lib/sha1.c b/xen/lib/sha1.c
new file mode 100644
index 0000000000..c25f0b9309
--- /dev/null
+++ b/xen/lib/sha1.c
@@ -0,0 +1,190 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SHA1 routine optimized to do word accesses rather than byte accesses,
+ * and to avoid unnecessary copies into the context array.
+ *
+ * This was based on the git SHA1 implementation.
+ */
+
+#include <xen/bitops.h>
+#include <xen/sha1.h>
+#include <xen/string.h>
+#include <xen/types.h>
+#include <xen/unaligned.h>
+
+#define SHA1_BLOCK_SIZE         64
+#define SHA1_WORKSPACE_WORDS    16
+#define SHA1_WORKSPACE_MASK     (SHA1_WORKSPACE_WORDS - 1)
+
+struct sha1_state {
+    uint64_t count;
+    uint32_t state[SHA1_DIGEST_SIZE / 4];
+    uint8_t buffer[SHA1_BLOCK_SIZE];
+};
+
+/* This "rolls" over the 512-bit array named w */
+#define W(i) w[(i) & SHA1_WORKSPACE_MASK]
+
+static uint32_t blend(const uint32_t w[SHA1_WORKSPACE_WORDS], size_t i)
+{
+    return rol32(W(i + 13) ^ W(i + 8) ^ W(i + 2) ^ W(i), 1);
+}
+
+/**
+ * sha1_transform - single block SHA1 transform
+ *
+ * @digest: 160 bit digest to update
+ * @data:   512 bits of data to hash
+ *
+ * This function executes SHA-1's internal compression function.  It updates the
+ * 160-bit internal state (@digest) with a single 512-bit data block (@data).
+ */
+static void sha1_transform(uint32_t *digest, const uint8_t *data)
+{
+    uint32_t a, b, c, d, e, t;
+    uint32_t w[SHA1_WORKSPACE_WORDS];
+    unsigned int i = 0;
+
+    a = digest[0];
+    b = digest[1];
+    c = digest[2];
+    d = digest[3];
+    e = digest[4];
+
+    /* Round 1 - iterations 0-16 take their input from 'data' */
+    for ( ; i < 16; ++i )
+    {
+        t = get_unaligned_be32((uint32_t *)data + i);
+        W(i) = t;
+        e += t + rol32(a, 5) + (((c ^ d) & b) ^ d) + 0x5a827999U;
+        b = ror32(b, 2);
+        t = e; e = d; d = c; c = b; b = a; a = t;
+    }
+
+    /* Round 1 - tail. Input from 512-bit mixing array */
+    for ( ; i < 20; ++i )
+    {
+        t = blend(w, i);
+        W(i) = t;
+        e += t + rol32(a, 5) + (((c ^ d) & b) ^ d) + 0x5a827999U;
+        b = ror32(b, 2);
+        t = e; e = d; d = c; c = b; b = a; a = t;
+    }
+
+    /* Round 2 */
+    for ( ; i < 40; ++i )
+    {
+        t = blend(w, i);
+        W(i) = t;
+        e += t + rol32(a, 5) + (b ^ c ^ d) + 0x6ed9eba1U;
+        b = ror32(b, 2);
+        t = e; e = d; d = c; c = b; b = a; a = t;
+    }
+
+    /* Round 3 */
+    for ( ; i < 60; ++i )
+    {
+        t = blend(w, i);
+        W(i) = t;
+        e += t + rol32(a, 5) + ((b & c) + (d & (b ^ c))) + 0x8f1bbcdcU;
+        b = ror32(b, 2);
+        t = e; e = d; d = c; c = b; b = a; a = t;
+    }
+
+    /* Round 4 */
+    for ( ; i < 80; ++i )
+    {
+        t = blend(w, i);
+        W(i) = t;
+        e += t + rol32(a, 5) + (b ^ c ^ d) + 0xca62c1d6U;
+        b = ror32(b, 2);
+        t = e; e = d; d = c; c = b; b = a; a = t;
+    }
+
+    digest[0] += a;
+    digest[1] += b;
+    digest[2] += c;
+    digest[3] += d;
+    digest[4] += e;
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
+static void sha1_update(struct sha1_state *sctx, const uint8_t *msg, size_t len)
+{
+    unsigned int partial = sctx->count % SHA1_BLOCK_SIZE;
+
+    sctx->count += len;
+
+    if ( (partial + len) >= SHA1_BLOCK_SIZE )
+    {
+        if ( partial )
+        {
+            unsigned int rem = SHA1_BLOCK_SIZE - partial;
+
+            /* Fill the partial block. */
+            memcpy(sctx->buffer + partial, msg, rem);
+            msg += rem;
+            len -= rem;
+
+            sha1_transform(sctx->state, sctx->buffer);
+        }
+
+        for ( ; len >= SHA1_BLOCK_SIZE; len -= SHA1_BLOCK_SIZE )
+        {
+            sha1_transform(sctx->state, msg);
+            msg += SHA1_BLOCK_SIZE;
+        }
+        partial = 0;
+    }
+
+    /* Remaining data becomes partial. */
+    memcpy(sctx->buffer + partial, msg, len);
+}
+
+static void sha1_final(struct sha1_state *sctx, uint8_t out[SHA1_DIGEST_SIZE])
+{
+    const int bit_offset = SHA1_BLOCK_SIZE - sizeof(__be64);
+    unsigned int partial = sctx->count % SHA1_BLOCK_SIZE;
+
+    __be32 *digest = (__be32 *)out;
+    unsigned int i;
+
+    /* Start padding */
+    sctx->buffer[partial++] = 0x80;
+
+    if ( partial > bit_offset )
+    {
+        /* Need one extra block, so properly pad this one with zeroes */
+        memset(sctx->buffer + partial, 0x0, SHA1_BLOCK_SIZE - partial);
+        sha1_transform(sctx->state, sctx->buffer);
+        partial = 0;
+    }
+    /* Pad up to the location of the bit count */
+    memset(sctx->buffer + partial, 0x0, bit_offset - partial);
+
+    /* Append the bit count */
+    put_unaligned_be64(sctx->count << 3, &sctx->buffer[bit_offset]);
+    sha1_transform(sctx->state, sctx->buffer);
+
+    /* Store state in digest */
+    for ( i = 0; i < SHA1_DIGEST_SIZE / sizeof(__be32); i++ )
+        put_unaligned_be32(sctx->state[i], &digest[i]);
+}
+
+void sha1_hash(uint8_t digest[SHA1_DIGEST_SIZE], const void *msg, size_t len)
+{
+    struct sha1_state sctx;
+
+    sha1_init(&sctx);
+    sha1_update(&sctx, msg, len);
+    sha1_final(&sctx, digest);
+}
-- 
2.49.0


