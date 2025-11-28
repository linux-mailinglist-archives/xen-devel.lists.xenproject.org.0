Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23977C92EF0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 19:49:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175089.1500013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP3Vp-0007DA-3p; Fri, 28 Nov 2025 18:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175089.1500013; Fri, 28 Nov 2025 18:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP3Vp-0007Am-0E; Fri, 28 Nov 2025 18:48:09 +0000
Received: by outflank-mailman (input) for mailman id 1175089;
 Fri, 28 Nov 2025 18:48:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vP3Vo-0006rr-8i
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 18:48:08 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5399310-cc8a-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 19:48:03 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47778b23f64so12615955e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 10:48:03 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47903c7360fsm102534325e9.0.2025.11.28.10.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 10:48:01 -0800 (PST)
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
X-Inumbo-ID: c5399310-cc8a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764355683; x=1764960483; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AG6MYW2ts+qmKiceaP2reK+W5LS3b/4VvnJvBEvZlPo=;
        b=R+Rb8+d/lXufoPzzRKxQ9uwLjeD7KTQE7wnrOVVcbZ7HE3/6NTzQ2TOeNCb3RdtsFP
         40hXB3kTerdvRGQhfchtOxl8RqPkBJZDNeFv9f67kFBuBrhXVIeTh6a7cBImEgguEEWD
         994Ou6Gh0ziCqc55vOiXsazquYYqvx7Cy7I4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764355683; x=1764960483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AG6MYW2ts+qmKiceaP2reK+W5LS3b/4VvnJvBEvZlPo=;
        b=j4s1vftz3VBVUWR0aeDUi3rRENbtvGY6Qj0KFXW2Xq6mX3kWraboq+sLWbj7m/wTrC
         VYzB7WYpy95cGOhqQ3QSjW8VLyGY4Cktlk8mEvdLbYnhRriuEW9qoMbQKy4vvL4W14eO
         zNWhT6Z6iDAirsIUGxMS8S1qUgcDzTV/0EBgVV7kxnZdOjqifmySc25/NFxvPoduc/gw
         aOFtfP5zc8QDcrkHIu/JqgR4hYHzVhUyVbOSw5ANIXtIZsOdyhKMrF/DD/bsTkuniW/u
         yha40fFKyzBprpzObXm2BN3TLLzO3HjaljqmK+m7FDNAaoENACt7rJZVC4CTPgXALDMU
         Gzcg==
X-Gm-Message-State: AOJu0YwcS8wVXrgEs3ayATUeBWb4d9YK238KbpEESTefx8ZlDztojBvj
	BX9eJgwMdKWcWHWHMPEvp9gSzIpceOxS8MRCldvB9cJAuigI57eHX+Hssytv2oWYO03QXfnAcRI
	Z6/FA
X-Gm-Gg: ASbGncv9wZemiuQFs5j5SrzD0RCjK0xVDKpe3jC4GPzVmKTgNk/XaANzgOekTlakcJL
	rlK4VZ63v5sO3H3m8eKlk/JP3Tb1RKZwxndPSJ7ageRKlxo2EpHkTemEeBV6pUAtxtq61wwYdfD
	mKkxxQVpqMJFKXQxEeuvvpOjs+mzwQkUnPSn0w+so+x7QI5cNA/OETVViWcS0sYdjwW132MZXEZ
	t6wTzT1ZIFPialIDM8Rf/Y2nIKo+JykBiViCOL1krEfohP4faeCrF7ybx7mO+zVkMPnTgtD/4Nd
	mB6BsVXSurWB+uPx/T1GHQ83KkekiH5qiYdR1KL31Ud4AI6DZpaFIn7CZJVWSaILkHWo/z2K7bw
	JFy4dGcZRhMIFaHDbntEKFa0VTQsa4Znp3m1GUKU4Js/rmNYuarqd4G3/W5coWp7zemR4YOoiCe
	A0ySmSCzmdAtR64W6mG391CVtOk/mpB3MAdozTYyEKJvpgJ5uAltOQwpo76j6sVg==
X-Google-Smtp-Source: AGHT+IFhhwqpMg7mkzdITg7hOlHjYtF5diSqEe1z9DZDxr9p1ucctR1yTEwa6ZPLvMpyJoA6fJLfEQ==
X-Received: by 2002:a05:600c:1c82:b0:477:9650:3175 with SMTP id 5b1f17b1804b1-477c1057310mr342274145e9.0.1764355682812;
        Fri, 28 Nov 2025 10:48:02 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Krystian Hebel <krystian.hebel@3mdeb.com>,
	Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/2] xen/lib: Misc SHA2 cleanup
Date: Fri, 28 Nov 2025 18:47:56 +0000
Message-Id: <20251128184757.1243678-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251128184757.1243678-1-andrew.cooper3@citrix.com>
References: <20251128184757.1243678-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In sha2_256_transform(), make state be an array of 8 rather than a pointer,
which lets the compiler do slightly more checking.

For better or worse, the canonical API in Linux is just the algorithm name.
As we're intending to import more from Linux in this area, drop the digest
suffix before we gain more users.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c | 2 +-
 xen/include/xen/sha2.h           | 4 ++--
 xen/lib/sha2-256.c               | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index e7ae1e802353..adabe6e6e838 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -139,7 +139,7 @@ static bool check_digest(const struct container_microcode *mc)
         return false;
     }
 
-    sha2_256_digest(digest, patch, mc->len);
+    sha2_256(digest, patch, mc->len);
 
     if ( memcmp(digest, pd->digest, sizeof(digest)) )
     {
diff --git a/xen/include/xen/sha2.h b/xen/include/xen/sha2.h
index 09c69195a97d..7a99c1259d6e 100644
--- a/xen/include/xen/sha2.h
+++ b/xen/include/xen/sha2.h
@@ -9,8 +9,8 @@
 
 #define SHA2_256_DIGEST_SIZE 32
 
-void sha2_256_digest(uint8_t digest[SHA2_256_DIGEST_SIZE],
-                     const void *msg, size_t len);
+void sha2_256(uint8_t digest[SHA2_256_DIGEST_SIZE],
+              const void *msg, size_t len);
 
 struct sha2_256_state {
     uint32_t state[SHA2_256_DIGEST_SIZE / sizeof(uint32_t)];
diff --git a/xen/lib/sha2-256.c b/xen/lib/sha2-256.c
index d1b2c20b9812..ed585ac0d4c1 100644
--- a/xen/lib/sha2-256.c
+++ b/xen/lib/sha2-256.c
@@ -68,7 +68,7 @@ static const uint32_t K[] = {
     0x90befffaU, 0xa4506cebU, 0xbef9a3f7U, 0xc67178f2U,
 };
 
-static void sha2_256_transform(uint32_t *state, const void *_input)
+static void sha2_256_transform(uint32_t state[8], const void *_input)
 {
     const uint32_t *input = _input;
     uint32_t a, b, c, d, e, f, g, h, t1, t2;
@@ -197,8 +197,8 @@ void sha2_256_final(struct sha2_256_state *s, uint8_t digest[SHA2_256_DIGEST_SIZ
         put_unaligned_be32(s->state[i], &dst[i]);
 }
 
-void sha2_256_digest(uint8_t digest[SHA2_256_DIGEST_SIZE],
-                     const void *msg, size_t len)
+void sha2_256(uint8_t digest[SHA2_256_DIGEST_SIZE],
+              const void *msg, size_t len)
 {
     struct sha2_256_state s;
 
@@ -243,7 +243,7 @@ static void __init __constructor test_sha2_256(void)
         const struct test *t = &tests[i];
         uint8_t res[SHA2_256_DIGEST_SIZE] = {};
 
-        sha2_256_digest(res, t->msg, strlen(t->msg));
+        sha2_256(res, t->msg, strlen(t->msg));
 
         if ( memcmp(res, t->digest, sizeof(t->digest)) == 0 )
             continue;
-- 
2.39.5


