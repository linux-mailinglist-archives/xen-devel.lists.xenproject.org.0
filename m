Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7B4AB5AD6
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 19:11:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983308.1369685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEtA9-0004gE-0g; Tue, 13 May 2025 17:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983308.1369685; Tue, 13 May 2025 17:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEtA8-0004e4-UA; Tue, 13 May 2025 17:11:28 +0000
Received: by outflank-mailman (input) for mailman id 983308;
 Tue, 13 May 2025 17:11:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvFL=X5=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uEt5d-0003Mm-VH
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 17:06:49 +0000
Received: from 6.mo560.mail-out.ovh.net (6.mo560.mail-out.ovh.net
 [87.98.165.38]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8270440-301c-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 19:06:48 +0200 (CEST)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.17.234])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4ZxjZ03VpVz2Cc3
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 17:06:48 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-mdgms (unknown [10.110.164.75])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 854AD1FE7E;
 Tue, 13 May 2025 17:06:47 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.112])
 by ghost-submission-5b5ff79f4f-mdgms with ESMTPSA
 id rx7EDCd8I2iuSwEARrC/kw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 13 May 2025 17:06:47 +0000
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
X-Inumbo-ID: a8270440-301c-11f0-9eb6-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-112S006a94099e6-0d7e-4faf-ac48-888d34d6b9b3,
                    0F27B6D195039ACFBDF5EC7F2AC12BEA7E98F15C) smtp.auth=sergii.dmytruk@3mdeb.com
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
Subject: [PATCH v2 09/22] xen/lib: add implementation of SHA-1
Date: Tue, 13 May 2025 20:05:46 +0300
Message-ID: <7fcab16c3efbc0eb28e0f8ec0d9c9d3188881ad4.1747155790.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8946400661588718748
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiteejtdffveekuddtgfegteffkefhgedujeehfeefveekvdevveevteeufeevteenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrdduuddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheeitdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=ZTbfrxWs6ho/dNB851C3HFgLhh1CDi/0mFBdC72nYUQ=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747156008; v=1;
 b=MbJZuSPhvmeNTxtSVsjL9waWcfb+Z7hwFZ7ytCSwJhD8aSTY5NNh9MLQ8jDS0/U8wq5wJPp/
 UnHZEMED35xFKs7dFe6hboWE6zQOIJy3RffPEMZzbeptmheshKfyS56LyNnAOWVgVs8sz1Rc9pr
 vmkyb21nMgrIWuhaH+EP8VokpiGi3e34rzEeAZbQvlDr3q5FwFbAPrmOJcs84Xx0Y1k0ZBXMmCn
 sXTYywj6l7Tk8FVED/njUXpC37h60lqrAUXQU1uvw9kR0D5/vNN38ZB+uQ+iyrPaVyXmgvo/p+7
 E7LgEygjtzyR17Pg0IZiMqnSBjuMvP9k4rwHVFGGoDT5A==

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

[1]: https://github.com/torvalds/linux/tree/afdab700f65e14070d8ab92175544b1c62b8bf03

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/include/xen/sha1.h |  12 +++
 xen/lib/Makefile       |   1 +
 xen/lib/sha1.c         | 218 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 231 insertions(+)
 create mode 100644 xen/include/xen/sha1.h
 create mode 100644 xen/lib/sha1.c

diff --git a/xen/include/xen/sha1.h b/xen/include/xen/sha1.h
new file mode 100644
index 0000000000..085f750a6a
--- /dev/null
+++ b/xen/include/xen/sha1.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef XEN__SHA1_H
+#define XEN__SHA1_H
+
+#include <xen/inttypes.h>
+
+#define SHA1_DIGEST_SIZE  20
+
+void sha1_hash(uint8_t digest[SHA1_DIGEST_SIZE], const void *msg, size_t len);
+
+#endif /* XEN__SHA1_H */
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
index 0000000000..c7a464e2cf
--- /dev/null
+++ b/xen/lib/sha1.c
@@ -0,0 +1,218 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
+/*
+ * If you have 32 registers or more, the compiler can (and should)
+ * try to change the array[] accesses into registers. However, on
+ * machines with less than ~25 registers, that won't really work,
+ * and at least GCC will make an unholy mess of it.
+ *
+ * So to avoid that mess which just slows things down, we force
+ * the stores to memory to actually happen (we might be better off
+ * with a 'W(t)=(val);asm("":"+m" (W(t))' there instead, as
+ * suggested by Artur Skawina - that will also make GCC unable to
+ * try to do the silly "optimize away loads" part because it won't
+ * see what the value will be).
+ *
+ * Ben Herrenschmidt reports that on PPC, the C version comes close
+ * to the optimized asm with this (ie on PPC you don't want that
+ * 'volatile', since there are lots of registers).
+ *
+ * On ARM we get the best code generation by forcing a full memory barrier
+ * between each SHA round, otherwise GCC happily gets wild with spilling and
+ * the stack frame size simply explode and performance goes down the drain.
+ */
+
+#define SHA1_BLOCK_SIZE         64
+#define SHA1_WORKSPACE_WORDS    16
+#define SHA1_WORKSPACE_MASK     (SHA1_WORKSPACE_WORDS - 1)
+
+struct sha1_state {
+    uint32_t state[SHA1_DIGEST_SIZE / 4];
+    uint64_t count;
+    uint8_t buffer[SHA1_BLOCK_SIZE];
+};
+
+/* This "rolls" over the 512-bit array */
+static void set_w(uint32_t w[SHA1_WORKSPACE_WORDS], size_t i, uint32_t val)
+{
+#ifdef CONFIG_X86
+    *(volatile uint32_t *)&w[i & SHA1_WORKSPACE_MASK] = val;
+#else
+    w[i & SHA1_WORKSPACE_MASK] = val;
+# ifdef CONFIG_ARM
+    barrier();
+# endif
+#endif
+}
+
+static uint32_t blend(const uint32_t w[SHA1_WORKSPACE_WORDS], size_t i)
+{
+/* This "rolls" over the 512-bit array */
+#define w(i) w[(i) & SHA1_WORKSPACE_MASK]
+
+    return rol32(w(i + 13) ^ w(i + 8) ^ w(i + 2) ^ w(i), 1);
+
+#undef w
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
+    uint32_t workspace[SHA1_WORKSPACE_WORDS];
+    unsigned int i = 0;
+
+    a = digest[0];
+    b = digest[1];
+    c = digest[2];
+    d = digest[3];
+    e = digest[4];
+
+    /* Round 1 - iterations 0-16 take their input from 'data' */
+    for ( ; i < 16; ++i ) {
+        t = get_unaligned_be32((uint32_t *)data + i);
+        set_w(workspace, i, t);
+        e += t + rol32(a, 5) + (((c ^ d) & b) ^ d) + 0x5a827999U;
+        b = ror32(b, 2);
+        t = e; e = d; d = c; c = b; b = a; a = t;
+    }
+
+    /* Round 1 - tail. Input from 512-bit mixing array */
+    for ( ; i < 20; ++i ) {
+        t = blend(workspace, i);
+        set_w(workspace, i, t);
+        e += t + rol32(a, 5) + (((c ^ d) & b) ^ d) + 0x5a827999U;
+        b = ror32(b, 2);
+        t = e; e = d; d = c; c = b; b = a; a = t;
+    }
+
+    /* Round 2 */
+    for ( ; i < 40; ++i ) {
+        t = blend(workspace, i);
+        set_w(workspace, i, t);
+        e += t + rol32(a, 5) + (b ^ c ^ d) + 0x6ed9eba1U;
+        b = ror32(b, 2);
+        t = e; e = d; d = c; c = b; b = a; a = t;
+    }
+
+    /* Round 3 */
+    for ( ; i < 60; ++i ) {
+        t = blend(workspace, i);
+        set_w(workspace, i, t);
+        e += t + rol32(a, 5) + ((b & c) + (d & (b ^ c))) + 0x8f1bbcdcU;
+        b = ror32(b, 2);
+        t = e; e = d; d = c; c = b; b = a; a = t;
+    }
+
+    /* Round 4 */
+    for ( ; i < 80; ++i ) {
+        t = blend(workspace, i);
+        set_w(workspace, i, t);
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
+            int rem = SHA1_BLOCK_SIZE - partial;
+
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
+static void sha1_final(struct sha1_state *sctx, void *out)
+{
+    const int bit_offset = SHA1_BLOCK_SIZE - sizeof(__be64);
+    __be64 *bits = (__be64 *)(sctx->buffer + bit_offset);
+    unsigned int partial = sctx->count % SHA1_BLOCK_SIZE;
+
+    __be32 *digest = out;
+    unsigned int i;
+
+    sctx->buffer[partial++] = 0x80;
+    if ( partial > bit_offset )
+    {
+        memset(sctx->buffer + partial, 0x0, SHA1_BLOCK_SIZE - partial);
+        partial = 0;
+
+        sha1_transform(sctx->state, sctx->buffer);
+    }
+
+    memset(sctx->buffer + partial, 0x0, bit_offset - partial);
+    *bits = cpu_to_be64(sctx->count << 3);
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


