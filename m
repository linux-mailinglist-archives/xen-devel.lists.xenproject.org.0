Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FC4A68ED5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 15:20:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920770.1324839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuuHJ-00008e-EQ; Wed, 19 Mar 2025 14:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920770.1324839; Wed, 19 Mar 2025 14:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuuHJ-000061-Ay; Wed, 19 Mar 2025 14:20:17 +0000
Received: by outflank-mailman (input) for mailman id 920770;
 Wed, 19 Mar 2025 14:20:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zx04=WG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuuHI-00005u-Cn
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 14:20:16 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4649611d-04cd-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 15:20:14 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43948021a45so46765045e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 07:20:14 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975d65sm21447498f8f.56.2025.03.19.07.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:20:13 -0700 (PDT)
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
X-Inumbo-ID: 4649611d-04cd-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742394013; x=1742998813; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k5VQt4TTAhReF/aDl6NDQTaWB1uAxS1E5Bh8ibv0maM=;
        b=Y5rP97KRJzKo3C2fqPDU6HMMn17RNJaeQthJ5VVUx8hB7rHXsIiGlfC+tpWZGGT7h3
         UguO7qv7BQAQPqL8q5rotumoY3d6p+WQhK41fIQBY8HTK0SZ+aXodbfI5aHlA687Mimt
         SVgRIRsp7qh4ZML06lGxp12srKlRYpoeSwHAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742394013; x=1742998813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5VQt4TTAhReF/aDl6NDQTaWB1uAxS1E5Bh8ibv0maM=;
        b=TkuN6ilKkkoj4DZgB73kTAcMkmDeX14Vlg5sUPy6oLRWn7Dtl/siU5QBChUkjGyMwc
         tBfJO5Vy7RqtiI51XNFvs+QGY95Z9P8c4B+mckRhXdj6OfMROzyLgirMVZhRieq9dh54
         ZQl1liX5tDiqtTHnKeAKcjOtna5v0YTE8RRkBCPpd3co0pYvR+v2yAhMoMg2nc4+gXg9
         Wr04hHBPbgcWiPZzw5bvJ8auWRb7ajdQWNFxq/GweT+b9WPSKmshcW8efJnxL4fdC9hv
         f9V2Z7s1SQrUFkiPSyy7qFQEqNrbZRYcBvZOgEjrex0uNQeIPlEDA2MpBwkLUNhyZ7hO
         KEtA==
X-Gm-Message-State: AOJu0YycudRc2kJH7czXkr/VxEd3M5lzPk4OaB9uSDmsZE2PKHEp2wN/
	tE6RezrFlGuhpUB4m6Z1HluU2ByXahJ7EtP1cFcUk4nqYZcZiUNuQr13ZFt2u49m/4SKGxaB6No
	3
X-Gm-Gg: ASbGncvZjNiKgZjCy/f02osezZxyA3R+YVNe7Toc3k2XpPw942JkaSPt+rerymSZ1OA
	NTjtrAuTlN5zfk9BAabz+CcQfasGsUGovQTRqEV7AsUbscjt35GfSCCJVU6wXsYwkUbYBYemWfK
	FyBEwH2/udt2nL28fVwyVK07ihYFpNxsvCNTu3s/q20qBgFx6bld9dPzPANAQeC0t1yeihD49v6
	x/FRzrhzsAGWMKPdBdEo5/Jo08bdqmObDw7ftzTVO3ClISzvmGoXFp3Jbqu+huMZVpp6HIwsQHL
	whF1i8aaU91BS1ltfJ73486CWhU384q2saFfMZDzb8l4olEJnk4WrcolJih/IjNb6wePOrI51rH
	VlDtrcNeMbwJkwh5nihcehi2yKULy
X-Google-Smtp-Source: AGHT+IFwFmcMHUGn7gnfLLlw1gjXuPD4HkDHDh7dmOyJ3FzB+gApzgKzfUsSxabQmrO0yo+Rk0BB5w==
X-Received: by 2002:a5d:598d:0:b0:391:3291:e416 with SMTP id ffacd0b85a97d-399739c5a72mr2901332f8f.19.1742394013450;
        Wed, 19 Mar 2025 07:20:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/mm: Fix IS_ALIGNED() check in IS_LnE_ALIGNED()
Date: Wed, 19 Mar 2025 14:20:11 +0000
Message-Id: <20250319142011.138250-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current CI failures happen to be a latent bug triggered by a narrow set of
properties of the initrd, which CI encountered by chance.

One step during boot involves constructing directmap mappings for modules.
With some probing at the point of creation, it is observed that there's a 4k
mapping missing towards the end of the initrd.

  (XEN) === Mapped Mod1 [0000000394001000, 00000003be1ff6dc] to Directmap
  (XEN) Probing paddr 394001000, va ffff830394001000
  (XEN) Probing paddr 3be1ff6db, va ffff8303be1ff6db
  (XEN) Probing paddr 3bdffffff, va ffff8303bdffffff
  (XEN) Probing paddr 3be001000, va ffff8303be001000
  (XEN) Probing paddr 3be000000, va ffff8303be000000
  (XEN) Early fatal page fault at e008:ffff82d04032014c (cr2=ffff8303be000000, ec=0000)

The conditions for this bug appear to be map_pages_to_xen() call with a non-2M
aligned start address, some number of full 2M pages, then a tail needing 4k
pages.

Anyway, the condition for spotting superpage boundaries in map_pages_to_xen()
is wrong.  The IS_ALIGNED() macro expects a power of two for the alignment
argument, and subtracts 1 itself.

Fixing this causes the failing case to now boot.

Fixes: 97fb6fcf26e8 ("x86/mm: introduce helpers to detect super page alignment")
Debugged-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Judging by how IS_ALIGNED() is wrong, I think the pre-condition might be
exactly 4k past a 2M boundary, not just simply a non-2M boundary.
---
 xen/arch/x86/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 03b8319f7a9d..e0793ad3462b 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5505,7 +5505,7 @@ int map_pages_to_xen(
                                                                 \
     ASSERT(!mfn_eq(m_, INVALID_MFN));                           \
     IS_ALIGNED(PFN_DOWN(v) | mfn_x(m_),                         \
-               (1UL << (PAGETABLE_ORDER * ((n) - 1))) - 1);     \
+               (1UL << (PAGETABLE_ORDER * ((n) - 1))));         \
 })
 #define IS_L2E_ALIGNED(v, m) IS_LnE_ALIGNED(v, m, 2)
 #define IS_L3E_ALIGNED(v, m) IS_LnE_ALIGNED(v, m, 3)

base-commit: 77be740e8182fa6b31291a8ae983d253187e9b50
-- 
2.39.5


