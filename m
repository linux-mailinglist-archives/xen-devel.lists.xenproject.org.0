Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F19EC92EF3
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 19:49:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175088.1500003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP3Vm-0006yq-S2; Fri, 28 Nov 2025 18:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175088.1500003; Fri, 28 Nov 2025 18:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP3Vm-0006ws-PF; Fri, 28 Nov 2025 18:48:06 +0000
Received: by outflank-mailman (input) for mailman id 1175088;
 Fri, 28 Nov 2025 18:48:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vP3Vl-0006j2-Ot
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 18:48:05 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5ca4e3f-cc8a-11f0-9d18-b5c5bf9af7f9;
 Fri, 28 Nov 2025 19:48:04 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso14951995e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 10:48:05 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47903c7360fsm102534325e9.0.2025.11.28.10.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 10:48:03 -0800 (PST)
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
X-Inumbo-ID: c5ca4e3f-cc8a-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764355684; x=1764960484; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5iN5oCUV2c9KWI51YUJ6xwnAH3DNseJ0SKRiMxlo8k=;
        b=riTVPxRSsBFk+Xi2sSowCoamYDfwiXif08pxjvtwUlLQVB2FuTMvgTDUb1wirgoso8
         FOOKGJ5PmvRFXtcsp35AHrD2I8s95v8/389YJmLylNrtPNYotTbrFFWDO0gLyYHHSXyw
         085/TLLU2IDCd4SgmuEVMp3zNbyamehtdq7w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764355684; x=1764960484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U5iN5oCUV2c9KWI51YUJ6xwnAH3DNseJ0SKRiMxlo8k=;
        b=OsllQSbtpZMov3WYn6TCpQnFhtUCyQ7hA0831v0HKGAVa6Z9bzxpfQEv6Ti+msGoei
         eYxRNzwaTzagl+mFd9eFVzdZ39Gs0pi4jVggt9Aenp9PQx5RQDUZQCyAa09uy0GRjstM
         WBuK9ke7n5bTLNFNA7c4cizZRK8itYCGaRiJhm0qyf7PC5R9vVI/YYlgx6GW9/JaZqwa
         Lr/ls40AZq7l0bRCsSq/lYHs3ElSykYDyclPwp9RBiFq6CAscbI/NA2jaD2Fj1duVH4t
         wTnNdZkunyku0IgpuEASl7QW9kOQ0Y/EObD8+hDmMeO8+TM/ViOxlGCVPU7i8yjVO6xC
         J11Q==
X-Gm-Message-State: AOJu0Yyo1ZIEqC/1ttvOGSV7He1cDufjcl4LRQ5tSDk1N8f5x8RbnhEm
	8+DXwaoPa+8zfbPK9nx/MaHg13m5tJ2ENL1xNKJiHxUZLTow+MQxyEDq0bfq9qfeuY/sndL74kx
	LiFpg
X-Gm-Gg: ASbGncsoGvyY70A+nHC9piojj7uWW58cyBgm6lUULN55WzEK9lOZF617NaDVk7/bSdR
	Xr+PB3MIWgdpfJHywVkIYHM6dvbgNLpfymaUL99OU5MUdOc8/55w5HwMlxHXp9e94l4VCJf+zSq
	ZftkKwicd7mKg7YPPpqyLFsND5kxyrTN6sHQJv4xdVrLVwL5V1P/ZARtyqB7CUr/ojOhcfVKlH4
	wSQTzw6qWTgn5ejowkffVYMicOO5zsXK1KxmpmKT4HDNG4lL6oYNelmyfUQ4GjweBYmASCXLIoU
	GnCDF7FtPXvAAgrvMvz7DnxRQL/A2+dHqEQgQ+T6NuXCf98lIh4xUcqbo/1bWCwr2eEFsnRmhTR
	8HJ5zUU4FPdqYV3bwCDA+jIYKtkXAAnKZ9ybGD4qMO7Uq2AiewSGjqzvsKjJ9M/hsnHkz64noMu
	adqr33r+DK59hTt3b09WyYh0V/RhZhc9QV1jn+GtPOBOHyEiiuiLLXmen1NHw/jg==
X-Google-Smtp-Source: AGHT+IFrMtAdXOyGD52+Szr1Tqi5CBsCanS1Vxe+gywHvBkWDilkMFglrehP0IMrwmo8fJw0qL0AEA==
X-Received: by 2002:a05:600c:1993:b0:477:9392:8557 with SMTP id 5b1f17b1804b1-477c01b495amr282532355e9.18.1764355684197;
        Fri, 28 Nov 2025 10:48:04 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Krystian Hebel <krystian.hebel@3mdeb.com>,
	Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/2] xen/lib: Introduce SHA-1
Date: Fri, 28 Nov 2025 18:47:57 +0000
Message-Id: <20251128184757.1243678-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251128184757.1243678-1-andrew.cooper3@citrix.com>
References: <20251128184757.1243678-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Krystian Hebel <krystian.hebel@3mdeb.com>

Future work will need to interact with the TPM, which requires calculating
digests for all active hash banks.  Introduce an implementation in lib/,
partially derived from Trenchboot which itself is derived from Linux.

In order to be useful to other architectures, it is careful with endianness
and misaligned accesses as well as being more MISRA friendly, but is only
wired up for x86 in the short term.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

 * Split out of Trenchboot series.
 * Add selftests, adjust types
---
 xen/include/xen/sha1.h |  14 +++
 xen/lib/Makefile       |   1 +
 xen/lib/sha1.c         | 215 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 230 insertions(+)
 create mode 100644 xen/include/xen/sha1.h
 create mode 100644 xen/lib/sha1.c

diff --git a/xen/include/xen/sha1.h b/xen/include/xen/sha1.h
new file mode 100644
index 000000000000..d649da8ebd97
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
+void sha1(uint8_t digest[SHA1_DIGEST_SIZE], const void *msg, size_t len);
+
+#endif /* XEN_SHA1_H */
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 5ccb1e5241c5..fd4b9ece63fb 100644
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
index 000000000000..eac2bdd4dfb3
--- /dev/null
+++ b/xen/lib/sha1.c
@@ -0,0 +1,215 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SHA1: https://csrc.nist.gov/pubs/fips/180-4/upd1/final
+ *
+ * Originally derived from Linux.  Modified substantially to optimise for size
+ * and Xen's expected usecases.
+ */
+#include <xen/bitops.h>
+#include <xen/sha1.h>
+#include <xen/string.h>
+#include <xen/unaligned.h>
+
+struct sha1_state {
+    size_t count; /* Byte Count. */
+    uint32_t state[SHA1_DIGEST_SIZE / sizeof(uint32_t)];
+    uint8_t buf[64];
+};
+
+static uint32_t blend(uint32_t w[16], unsigned int i)
+{
+#define W(i) w[(i) & 15]
+
+    return W(i) = rol32(W(i + 13) ^ W(i + 8) ^ W(i + 2) ^ W(i), 1);
+
+#undef W
+}
+
+static void sha1_transform(uint32_t state[5], const void *_input)
+{
+    const uint32_t *input = _input;
+    uint32_t a, b, c, d, e, t;
+    uint32_t w[16];
+    unsigned int i = 0;
+
+    a = state[0];
+    b = state[1];
+    c = state[2];
+    d = state[3];
+    e = state[4];
+
+    /* Round 1 - iterations 0-16 take their input from 'input' */
+    for ( ; i < 16; ++i )
+    {
+        t = get_unaligned_be32(&input[i]);
+        w[i] = t;
+        e += t + rol32(a, 5) + (((c ^ d) & b) ^ d) + 0x5a827999U;
+        b = ror32(b, 2);
+        t = e; e = d; d = c; c = b; b = a; a = t;
+    }
+
+    /* Round 1 tail. Input from 512-bit mixing array */
+    for ( ; i < 20; ++i )
+    {
+        t = blend(w, i);
+        e += t + rol32(a, 5) + (((c ^ d) & b) ^ d) + 0x5a827999U;
+        b = ror32(b, 2);
+        t = e; e = d; d = c; c = b; b = a; a = t;
+    }
+
+    /* Round 2 */
+    for ( ; i < 40; ++i )
+    {
+        t = blend(w, i);
+        e += t + rol32(a, 5) + (b ^ c ^ d) + 0x6ed9eba1U;
+        b = ror32(b, 2);
+        t = e; e = d; d = c; c = b; b = a; a = t;
+    }
+
+    /* Round 3 */
+    for ( ; i < 60; ++i )
+    {
+        t = blend(w, i);
+        e += t + rol32(a, 5) + ((b & c) + (d & (b ^ c))) + 0x8f1bbcdcU;
+        b = ror32(b, 2);
+        t = e; e = d; d = c; c = b; b = a; a = t;
+    }
+
+    /* Round 4 */
+    for ( ; i < 80; ++i )
+    {
+        t = blend(w, i);
+        e += t + rol32(a, 5) + (b ^ c ^ d) + 0xca62c1d6U;
+        b = ror32(b, 2);
+        t = e; e = d; d = c; c = b; b = a; a = t;
+    }
+
+    state[0] += a;
+    state[1] += b;
+    state[2] += c;
+    state[3] += d;
+    state[4] += e;
+}
+
+static void sha1_init(struct sha1_state *s)
+{
+    *s = (struct sha1_state){
+        .state = {
+            0x67452301U,
+            0xefcdab89U,
+            0x98badcfeU,
+            0x10325476U,
+            0xc3d2e1f0U,
+        },
+    };
+}
+
+static void sha1_update(struct sha1_state *s, const void *msg, size_t len)
+{
+    unsigned int partial = s->count & 63;
+
+    s->count += len;
+
+    if ( (partial + len) >= 64 )
+    {
+        if ( partial )
+        {
+            unsigned int rem = 64 - partial;
+
+            /* Fill the partial block. */
+            memcpy(s->buf + partial, msg, rem);
+            msg += rem;
+            len -= rem;
+
+            sha1_transform(s->state, s->buf);
+            partial = 0;
+        }
+
+        for ( ; len >= 64; msg += 64, len -= 64 )
+            sha1_transform(s->state, msg);
+    }
+
+    /* Remaining data becomes partial. */
+    memcpy(s->buf + partial, msg, len);
+}
+
+static void sha1_final(struct sha1_state *s, uint8_t digest[SHA1_DIGEST_SIZE])
+{
+    uint32_t *dst = (uint32_t *)digest;
+    unsigned int i, partial = s->count & 63;
+
+    /* Start padding */
+    s->buf[partial++] = 0x80;
+
+    if ( partial > 56 )
+    {
+        /* Need one extra block - pad to 64 */
+        memset(s->buf + partial, 0, 64 - partial);
+        sha1_transform(s->state, s->buf);
+        partial = 0;
+    }
+    /* Pad to 56 */
+    memset(s->buf + partial, 0x0, 56 - partial);
+
+    /* Append the bit count */
+    put_unaligned_be64((uint64_t)s->count << 3, &s->buf[56]);
+    sha1_transform(s->state, s->buf);
+
+    /* Store state in digest */
+    for ( i = 0; i < 5; i++ )
+        put_unaligned_be32(s->state[i], &dst[i]);
+}
+
+void sha1(uint8_t digest[SHA1_DIGEST_SIZE], const void *msg, size_t len)
+{
+    struct sha1_state s;
+
+    sha1_init(&s);
+    sha1_update(&s, msg, len);
+    sha1_final(&s, digest);
+}
+
+#ifdef CONFIG_SELF_TESTS
+
+#include <xen/init.h>
+#include <xen/lib.h>
+
+static const struct test {
+    const char *msg;
+    uint8_t digest[SHA1_DIGEST_SIZE];
+} tests[] __initconst = {
+    {
+        .msg = "abc",
+        .digest = {
+            0xa9, 0x99, 0x3e, 0x36, 0x47, 0x06, 0x81, 0x6a, 0xba, 0x3e,
+            0x25, 0x71, 0x78, 0x50, 0xc2, 0x6c, 0x9c, 0xd0, 0xd8, 0x9d,
+        },
+    },
+    {
+        .msg = "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq",
+        .digest = {
+            0x84, 0x98, 0x3e, 0x44, 0x1c, 0x3b, 0xd2, 0x6e, 0xba, 0xae,
+            0x4a, 0xa1, 0xf9, 0x51, 0x29, 0xe5, 0xe5, 0x46, 0x70, 0xf1,
+        },
+    },
+};
+
+static void __init __constructor test_sha1(void)
+{
+    for ( unsigned int i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+        uint8_t res[SHA1_DIGEST_SIZE] = {};
+
+        sha1(res, t->msg, strlen(t->msg));
+
+        if ( memcmp(res, t->digest, sizeof(t->digest)) == 0 )
+            continue;
+
+        panic("%s() msg '%s' failed\n"
+              "  expected %" STR(SHA1_DIGEST_SIZE) "phN\n"
+              "       got %" STR(SHA1_DIGEST_SIZE) "phN\n",
+              __func__, t->msg, t->digest, res);
+    }
+}
+#endif /* CONFIG_SELF_TESTS */
-- 
2.39.5


