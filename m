Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26639AA938A
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 14:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976096.1363333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBvDf-0004qd-Ql; Mon, 05 May 2025 12:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976096.1363333; Mon, 05 May 2025 12:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBvDf-0004oF-O4; Mon, 05 May 2025 12:46:51 +0000
Received: by outflank-mailman (input) for mailman id 976096;
 Mon, 05 May 2025 12:46:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6xZV=XV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uBvDe-0004o9-10
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 12:46:50 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02884c22-29af-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 14:46:48 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39c1ef4ae3aso2551342f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 05:46:48 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae79d8sm10137329f8f.42.2025.05.05.05.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 05:46:47 -0700 (PDT)
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
X-Inumbo-ID: 02884c22-29af-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746449208; x=1747054008; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P+VL0wqxMqE1quEoDvljUttyjHUDK003gdW4PwSJ+m8=;
        b=qJ2fjmS1JTUeH0kKyZOkyAD4gMHwIPSTuQJdi0Qb0hCe6LAnAp+qegZulrxHbGaFea
         RKJJnHeb3b2acB1UWAXOiEl49S+86+fznuNUtyHQHZxQWhDCoVE3iI1+U5hsioSRzq9O
         nV4NYJ/fJvOG8ftC84fGmVSHHxXiYZsKhjdvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746449208; x=1747054008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+VL0wqxMqE1quEoDvljUttyjHUDK003gdW4PwSJ+m8=;
        b=cosly43sICDw22605ny9asthTJBvh3B0030goA9k5o0Wu9B1Xoag27gvSatyIQ23sY
         dN8PrZWmPUwVFpWdv2IUyrPDFW+4idc6Z7LuL3pNei4Up4VYY0IXN6G7EwaLvvQMLYOL
         iCdZqct9UJyY5pjKZsWJh0a3Pi2D6u1C2GlkvblFq4u/PwT2badSmuwJdcTNZeKLkue4
         O6gVdrwR29M51jGLXAfexCXQMcxHnowvFbPrrtVS947p7gp5TiJ0SXqV2WdIKCR/lmeM
         UobehU36WrEk1eEauHj1CEw7Ae5clSzlzhDi9obX0H/27UbLo3lUlM9WoucSa7hRBvpl
         9NbA==
X-Gm-Message-State: AOJu0YzHE9j24vFXQSr7eyKLYgw+7qQ4iZ/iDcuDm+XahY/bOs9W4l/b
	B4hV8cCBtrKd9GJvbUsmvfneb+LWqbyzTI5orltyoX7BdY/5Klzr+Z0CDsoEc9Dm/3Vfc5KTuOc
	/DdI=
X-Gm-Gg: ASbGnctELXVO8tl24wSdqDkVAoMTJhw7sFtmrgtFQWkDRLlNgBueaNSAS1WAkFaz05G
	K7WYHAFxqZ4kkpI2OZ4ShtN5sHeY7yR2OzI8KmRiaMRde8jf546n+5rJrrVH+mA/lNkScP+ugHH
	c8yxkT5UcVgdmpF7BvzjOnQooMyAzcZBy0DdcaSQ5yUcDlQcY7qjEldROkt+NQHvN/JCfr0Znx+
	WiSfGGC6I2+BZdxxM+IFf9E4jMI4nv4bjoUT3aju+Jm/e3FLtE/gGGz66WODFaOo7PqoJhR4BC7
	Ve04xLPjE/4KmDjpXLKQJd7yvdQ3PI4gWuH6xNiQo7VqGznr8TGTJTjXfo/Mgs7rSgDrslXWLdo
	Op8RONv8jNMDM1g==
X-Google-Smtp-Source: AGHT+IFzb+Lb4Udr3dz0EmFhJodPqS3NWucS8PSc99lV2WQTX6ulqVzK4K9TJrViknXbfQKD64sOGw==
X-Received: by 2002:a5d:588a:0:b0:38d:dc03:a3d6 with SMTP id ffacd0b85a97d-3a09402ca18mr11846814f8f.4.1746449208050;
        Mon, 05 May 2025 05:46:48 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH] xen: Use __auto_type
Date: Mon,  5 May 2025 13:46:46 +0100
Message-Id: <20250505124646.1569767-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In macros it is common to declare local variables using typeof(param) in order
to ensure that side effects are only evaluated once.  A consequence of this is
double textural expansion of the parameter, which can get out of hand very
quickly with nested macros.

A GCC extension, __auto_type, is now avaialble in the new toolchain baseline
and avoids the double textural expansion.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>

The resulting build is identical.

RFC.  This requires a MISRA change, as it currently manifests as a R1.1
violation.  Nevertheless, I think we want to start using in places where we
currently use typeof(expression of <initilaiser>).

Eclair run on this patch (expecting a failure):
  https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1800631949

Min toolchain check:
  https://godbolt.org/z/f9WjooPYj

GCC Manual:
  https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Auto-Type.html
---
 xen/include/xen/macros.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
index cd528fbdb127..b5e5ff4b1c2f 100644
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -71,18 +71,18 @@
 /* Hide a value from the optimiser. */
 #define HIDE(x)                                 \
     ({                                          \
-        typeof(x) _x = (x);                     \
+        __auto_type _x = (x);                   \
         asm volatile ( "" : "+r" (_x) );        \
         _x;                                     \
     })
 
 #define ABS(x) ({                              \
-    typeof(x) x_ = (x);                        \
+    __auto_type x_ = (x);                      \
     (x_ < 0) ? -x_ : x_;                       \
 })
 
 #define SWAP(a, b) \
-   do { typeof(a) t_ = (a); (a) = (b); (b) = t_; } while ( 0 )
+   do { __auto_type t_ = (a); (a) = (b); (b) = t_; } while ( 0 )
 
 #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]) + __must_be_array(x))
 
@@ -110,15 +110,15 @@
  */
 #define min(x, y)                               \
     ({                                          \
-        const typeof(x) _x = (x);               \
-        const typeof(y) _y = (y);               \
+        const __auto_type _x = (x);             \
+        const __auto_type _y = (y);             \
         (void)(&_x == &_y); /* typecheck */     \
         _x < _y ? _x : _y;                      \
     })
 #define max(x, y)                               \
     ({                                          \
-        const typeof(x) _x = (x);               \
-        const typeof(y) _y = (y);               \
+        const __auto_type _x = (x);             \
+        const __auto_type _y = (y);             \
         (void)(&_x == &_y); /* typecheck */     \
         _x > _y ? _x : _y;                      \
     })

base-commit: 78ce2be733b1e45e2e190c1765fe31da318d435f
-- 
2.39.5


