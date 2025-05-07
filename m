Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E117CAADBB5
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 11:43:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978417.1365221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCbJ3-0006If-38; Wed, 07 May 2025 09:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978417.1365221; Wed, 07 May 2025 09:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCbJ3-0006GF-07; Wed, 07 May 2025 09:43:13 +0000
Received: by outflank-mailman (input) for mailman id 978417;
 Wed, 07 May 2025 09:43:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zCvR=XX=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1uCbJ1-00062U-7Z
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 09:43:11 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af60407f-2b27-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 11:43:09 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a0b135d18eso777822f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 02:43:09 -0700 (PDT)
Received: from localhost.localdomain (172.74.6.51.dyn.plus.net. [51.6.74.172])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b16f00sm16051290f8f.84.2025.05.07.02.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 02:43:08 -0700 (PDT)
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
X-Inumbo-ID: af60407f-2b27-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746610989; x=1747215789; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8Y83zKrsmgv8ZOMTDE8RmHuDTLf5jyr/esqnFH6tRs=;
        b=GhkmmV1dXqOFpSej9FTnu88VIvy79fMJ/RhGfd60Hvz4zmB5XKsNSRBr8tNlF048iG
         m2iLBSaKIfQtoXJWvjY3Qtka+pTIqYod7zbnZu+ilnjjHrn5HV1ShQvgzDnHBahDZGP+
         hiOvTfxqL6PO3aLeojFpzE95nJ68X3kIaN78bxDP308VsXZcJMhetmsqTv63xWbX4+10
         8hNFXaOvBWptEPC//Dd01Rh1EtdDHnpXHUVlROk2MEEjSSGeW4JO/W23C2wbfbFOVALW
         naSjzuqPm6AtZCdwbBSrwltVXPUGUCTmHWuS2z3ttqjHZKjlNg3mLRGFEueJPQqpz1LP
         PNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746610989; x=1747215789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8Y83zKrsmgv8ZOMTDE8RmHuDTLf5jyr/esqnFH6tRs=;
        b=sZPJJOqGLPsLKffVAgVhotEqbIw6uwoDo8ZdZrvZhx4ZIwXK+XGTonWIV3j/I2nYeq
         8o+065Yomc/fbTusmMSFfYfHu62HEmWb0YbkA/AcgJDmXOeYcDWr08tGqauXwEbE4TdX
         BtoX7cm3ySYjTzO4mlgR0/2oCTJf4idWZZwzRyEvceSNQVtlE8MDskboHRyU4JcX72/4
         7H2GwKbsHPf1ixEPlAV/nTJIaKjiuQ36LhSMiVklD5MBhTMQHyiC9u5zP2RA/SocSIeJ
         +rd7gdAabqM/zSD7YQqw51TfNvwNVe4o+pabzH/vTduC4HFX8d9PwDq85d5aavKf9xk0
         AKsA==
X-Gm-Message-State: AOJu0YweIQLgBTEaJYWNu7Ge1R5xogfG79Tr+rggT4m55CgSmfEKRr4U
	Qowmrkr9oNZ2YcURH3oofNl26tYBkctP4ewQ59liosvCpPZvasuw2H86rHFrnNg=
X-Gm-Gg: ASbGncuSGaSiu5sbPo1PoomVy+fjP1fl27jzux0b5XFqg8MLZu9zKNnvKcdUyqYUcDR
	NFsqdVi5MpVFpz8wgoNodu8KnXs7I9AIau/CUSWgHO7eMveDvJLVrGn6a4+WNL0t0XVQxTjmIXX
	q5k8o07X4d62aEXIOUQShyQa0F9FPoNtcq0tLyjzXvVlXYbl3vQGpGyZromyNUaQG2yphm1qX7l
	x3cRRv4LhiUw2e6ZFjdq3FB0hyRXZoQqlKIxKMf1T8l21hlUR5ugs7ZDp70zc3IAM88jXWHYxPp
	Oh6t0Gw+gcR52Be4bUoYoL7VzCEHq9ZRdps7EJpyuLQX93BsEsDA31OBRwho5CGcnICUOfiW
X-Google-Smtp-Source: AGHT+IGCSM81Wqk/bepwSce6eX56XNmXveWuiq4VMa3x/g4flpfQF2He/n7rzyqGSoi4dGTtSTqLVQ==
X-Received: by 2002:a05:6000:401f:b0:391:10c5:d1a9 with SMTP id ffacd0b85a97d-3a0b4a18f10mr2203929f8f.31.1746610988677;
        Wed, 07 May 2025 02:43:08 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/4] xen/lib: Export additional sha256 functions
Date: Wed,  7 May 2025 10:42:46 +0100
Message-ID: <20250507094253.10395-2-freddy77@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507094253.10395-1-freddy77@gmail.com>
References: <20250507094253.10395-1-freddy77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Lagerwall <ross.lagerwall@citrix.com>

In future, some code needs to generate a digest over several separate buffers
so export the necessary functions to do so.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/include/xen/sha2.h | 12 ++++++++++++
 xen/lib/sha2-256.c     | 17 ++++++-----------
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/xen/include/xen/sha2.h b/xen/include/xen/sha2.h
index 47d97fbf01..cb30e8f8d7 100644
--- a/xen/include/xen/sha2.h
+++ b/xen/include/xen/sha2.h
@@ -12,4 +12,16 @@
 void sha2_256_digest(uint8_t digest[SHA2_256_DIGEST_SIZE],
                      const void *msg, size_t len);
 
+struct sha2_256_state {
+    uint32_t state[SHA2_256_DIGEST_SIZE / sizeof(uint32_t)];
+    uint8_t buf[64];
+    size_t count; /* Byte count. */
+};
+
+void sha2_256_init(struct sha2_256_state *s);
+void sha2_256_update(struct sha2_256_state *s, const void *msg,
+                     size_t len);
+void sha2_256_final(struct sha2_256_state *s,
+                    uint8_t digest[SHA2_256_DIGEST_SIZE]);
+
 #endif /* XEN_SHA2_H */
diff --git a/xen/lib/sha2-256.c b/xen/lib/sha2-256.c
index 19e8252188..e55e297eff 100644
--- a/xen/lib/sha2-256.c
+++ b/xen/lib/sha2-256.c
@@ -10,12 +10,6 @@
 #include <xen/string.h>
 #include <xen/unaligned.h>
 
-struct sha2_256_state {
-    uint32_t state[SHA2_256_DIGEST_SIZE / sizeof(uint32_t)];
-    uint8_t buf[64];
-    size_t count; /* Byte count. */
-};
-
 static uint32_t choose(uint32_t x, uint32_t y, uint32_t z)
 {
     return z ^ (x & (y ^ z));
@@ -131,7 +125,7 @@ static void sha2_256_transform(uint32_t *state, const void *_input)
     state[4] += e; state[5] += f; state[6] += g; state[7] += h;
 }
 
-static void sha2_256_init(struct sha2_256_state *s)
+void sha2_256_init(struct sha2_256_state *s)
 {
     *s = (struct sha2_256_state){
         .state = {
@@ -147,8 +141,8 @@ static void sha2_256_init(struct sha2_256_state *s)
     };
 }
 
-static void sha2_256_update(struct sha2_256_state *s, const void *msg,
-                            size_t len)
+void sha2_256_update(struct sha2_256_state *s, const void *msg,
+                     size_t len)
 {
     unsigned int partial = s->count & 63;
 
@@ -177,9 +171,10 @@ static void sha2_256_update(struct sha2_256_state *s, const void *msg,
     memcpy(s->buf + partial, msg, len);
 }
 
-static void sha2_256_final(struct sha2_256_state *s, void *_dst)
+void sha2_256_final(struct sha2_256_state *s,
+                    uint8_t digest[SHA2_256_DIGEST_SIZE])
 {
-    uint32_t *dst = _dst;
+    uint32_t *dst = (uint32_t *)digest;
     unsigned int i, partial = s->count & 63;
 
     /* Start padding */
-- 
2.43.0


