Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DCCA50E90
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 23:26:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902811.1310772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpxBV-0002IA-AG; Wed, 05 Mar 2025 22:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902811.1310772; Wed, 05 Mar 2025 22:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpxBV-0002FP-6F; Wed, 05 Mar 2025 22:25:49 +0000
Received: by outflank-mailman (input) for mailman id 902811;
 Wed, 05 Mar 2025 22:25:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pOX7=VY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpxBT-00024R-FR
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 22:25:47 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c862679f-fa10-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 23:25:46 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaedd529ba1so4914066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 14:25:46 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac1e152fdd4sm473867766b.176.2025.03.05.14.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 14:25:44 -0800 (PST)
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
X-Inumbo-ID: c862679f-fa10-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741213545; x=1741818345; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=McDKkH1/jF76pltYd4jyBlFJcmo4P/DuMqxlYLD0OPg=;
        b=FqBx1tf4A6G3NKyG0aQ3ayHwuUOJI2ULSHduVbr/B3mPtMmUGuDZybUMBUJ0VzE/15
         mbVs+ivxEXuu836lPSO6WAM9TMBFVQVFOj/4NXYq92vitGm4wZARsvMybbj3TTCX9K7Z
         PrT0324/LiA9W+/4xkeRxCtqcKPmyS6R2Xxp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741213545; x=1741818345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=McDKkH1/jF76pltYd4jyBlFJcmo4P/DuMqxlYLD0OPg=;
        b=k2CWcTodMqEGkNfRATPkyQPv7IJN5FWai8EQVIC/MjoHseH6Y3f0rbvHKyFiN6h2Si
         hJ9kj4k4X2v/OxWgo9u58R5Bu4DHAzhUxQXvCfiJGtzWpWCQR4UugVqAfbS/HugT/iMU
         YPfh6qdvp4rqoDjKsfGpf/f5AKtd/qc9cCg0eRojgTk1CBs6VrOf+YkWDPVADPw5+owB
         p9EjVaglLCKYXuldE+MSdEZxHQU3q4RjYi3UK5xYCz6YvyQ52YA3XBrStRtMmW3dWCJ+
         dS5/zlw50dhKqXHOk/3GObIY0rK3XXB5otEy61ugKigGOUqoE2AD38Q1w50P+sHD/jM7
         7vDA==
X-Gm-Message-State: AOJu0Yy+cgIpZVrHwvGAdtEkTgT05LJ52m2QrgsDDyx59+7WqeVoE+pV
	s/n12rO9ovWI9guwxzRWH+C59Dji/16TIv6Wt942up/r/8c3QN+3X28gBPXPYyFWSA/DiDeN2Lk
	/
X-Gm-Gg: ASbGncvbbk9tROl4Z+u3qA3ai3N6gNu+eBAGjjwj2MdqnyWANYZJrfijUXMsGm69IUP
	HfPKWk9/d1qEH1/RGhifz4FGsQukNVjycei3cXMfTgZFtg0OCvl3WkjbEva9SGmkch+ajqS7Umy
	wF7bePhK7pNWjAXHResyMXPJqbw4eWmqVaR6z4hQjun/nLVKKWkPn16KgIFkuKQiQctM9gRGSp5
	oxHBDEDI44WRoKxJ3d3QPB5VdlOvsF83/kliolmRJ1xbyyD1pxx6AxSvL8tCGeNjMscVkH/9CGj
	ozVZ8VZcxt9iaf2aYiqdKgB4TdONgjLfGmsYa4E34D7qhVioOzhwOlYHWw5asz7wm/LL5NsKJBm
	qLmVB6Jm4ejWghtuyQ338BVKm
X-Google-Smtp-Source: AGHT+IGmFjGSqtjbYLGpeN00qCc9zJtUjy+DPtbTm7PnwBltB7kkFjwZmaHLI6kIC46gAMbIWvjeAg==
X-Received: by 2002:a05:6402:2114:b0:5de:a6a8:5ec6 with SMTP id 4fb4d7f45d1cf-5e59f3d3780mr10313073a12.10.1741213545303;
        Wed, 05 Mar 2025 14:25:45 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] Xen: CI fixes from XSN-2
Date: Wed,  5 Mar 2025 22:23:43 +0000
Message-Id: <20250305222343.2874591-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

 * Add cf_check annotation to cmp_patch_id() used by bsearch().
 * Add U suffix to the K[] table to fix MISRA Rule 7.2 violations.

Fixes: 372af524411f ("xen/lib: Introduce SHA2-256")
Fixes: 630e8875ab36 ("x86/ucode: Perform extra SHA2 checks on AMD Fam17h/19h microcode")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>

TODO: Make a working CI pipline the security team can use.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1701963907
---
 xen/arch/x86/cpu/microcode/amd.c |  2 +-
 xen/lib/sha2-256.c               | 32 ++++++++++++++++----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 27caed102818..ee7de5282b2a 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -99,7 +99,7 @@ static const struct patch_digest {
 #include "amd-patch-digests.c"
 };
 
-static int cmp_patch_id(const void *key, const void *elem)
+static int cf_check cmp_patch_id(const void *key, const void *elem)
 {
     const struct patch_digest *pd = elem;
     uint32_t patch_id = *(uint32_t *)key;
diff --git a/xen/lib/sha2-256.c b/xen/lib/sha2-256.c
index 4aeb8aa20490..19e8252188f7 100644
--- a/xen/lib/sha2-256.c
+++ b/xen/lib/sha2-256.c
@@ -56,22 +56,22 @@ static uint32_t blend(uint32_t W[16], unsigned int i)
 }
 
 static const uint32_t K[] = {
-    0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5,
-    0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
-    0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
-    0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
-    0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc,
-    0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
-    0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
-    0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
-    0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
-    0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
-    0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3,
-    0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
-    0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5,
-    0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
-    0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
-    0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
+    0x428a2f98U, 0x71374491U, 0xb5c0fbcfU, 0xe9b5dba5U,
+    0x3956c25bU, 0x59f111f1U, 0x923f82a4U, 0xab1c5ed5U,
+    0xd807aa98U, 0x12835b01U, 0x243185beU, 0x550c7dc3U,
+    0x72be5d74U, 0x80deb1feU, 0x9bdc06a7U, 0xc19bf174U,
+    0xe49b69c1U, 0xefbe4786U, 0x0fc19dc6U, 0x240ca1ccU,
+    0x2de92c6fU, 0x4a7484aaU, 0x5cb0a9dcU, 0x76f988daU,
+    0x983e5152U, 0xa831c66dU, 0xb00327c8U, 0xbf597fc7U,
+    0xc6e00bf3U, 0xd5a79147U, 0x06ca6351U, 0x14292967U,
+    0x27b70a85U, 0x2e1b2138U, 0x4d2c6dfcU, 0x53380d13U,
+    0x650a7354U, 0x766a0abbU, 0x81c2c92eU, 0x92722c85U,
+    0xa2bfe8a1U, 0xa81a664bU, 0xc24b8b70U, 0xc76c51a3U,
+    0xd192e819U, 0xd6990624U, 0xf40e3585U, 0x106aa070U,
+    0x19a4c116U, 0x1e376c08U, 0x2748774cU, 0x34b0bcb5U,
+    0x391c0cb3U, 0x4ed8aa4aU, 0x5b9cca4fU, 0x682e6ff3U,
+    0x748f82eeU, 0x78a5636fU, 0x84c87814U, 0x8cc70208U,
+    0x90befffaU, 0xa4506cebU, 0xbef9a3f7U, 0xc67178f2U,
 };
 
 static void sha2_256_transform(uint32_t *state, const void *_input)

base-commit: 630e8875ab368b97cc7231aaf3809e3d7d5687e1
-- 
2.39.5


