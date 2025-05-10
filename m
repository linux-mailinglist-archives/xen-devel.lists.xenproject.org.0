Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD406AB23E9
	for <lists+xen-devel@lfdr.de>; Sat, 10 May 2025 15:13:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980653.1367275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDk0f-0004P5-4t; Sat, 10 May 2025 13:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980653.1367275; Sat, 10 May 2025 13:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDk0e-0004ME-Vl; Sat, 10 May 2025 13:12:56 +0000
Received: by outflank-mailman (input) for mailman id 980653;
 Sat, 10 May 2025 13:12:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Vxe=X2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uDk0d-0004M7-3Z
 for xen-devel@lists.xenproject.org; Sat, 10 May 2025 13:12:55 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78772278-2da0-11f0-9eb5-5ba50f476ded;
 Sat, 10 May 2025 15:12:48 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so20325585e9.2
 for <xen-devel@lists.xenproject.org>; Sat, 10 May 2025 06:12:48 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58ec98dsm6300589f8f.25.2025.05.10.06.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 May 2025 06:12:47 -0700 (PDT)
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
X-Inumbo-ID: 78772278-2da0-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746882768; x=1747487568; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uClM/AYIN3dAwhC3WC9ieVOoIB+XXfbidPOvm+A7PpY=;
        b=tFIeWCIx4ZwvaIoSfEriyn2mOrFIozZSplkNRw2o7Rt+xeb7narOa+ad1UVzeoTw1y
         RbtYS4lh9+2dOst7COnnlMIthJHOHZj0F6NaWqjsA6asg9hvrWVuO+zi0gf+Qfx52qLK
         gEGw4kQ6oXy0ZQkB64NFKJCNq6WZrxMq/v6jM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746882768; x=1747487568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uClM/AYIN3dAwhC3WC9ieVOoIB+XXfbidPOvm+A7PpY=;
        b=CDRthvb1LwiiX4LamHpXz/C09Z6orZQWlh/xgE2zFybkoep1x6NB1Pg0xiy52uGhNq
         Ccb1LtK/1r250SU3duXSWZ94bBTpC6gIg0N5XOIi+VY1JjhJD1c/R3l8LqXmF9BCWjId
         619lHauxd43255IY9q5x2UdrtkvnkN3r401XA1mvAfTBjoIUmkR8h+ZkfEJquLYs+AMQ
         LFViWn2M2wXBgXboIiDiINwpytk2n4EjRce1O+LNdBun+RYfQn0UqRavax49R72hCEM1
         /LT0PHoaDmwX9o78vkME3VCRyXqprkEY78dZIcNbYGMeLlZfEzbD6ZDmEx5Cxn/b9+KE
         v0qA==
X-Gm-Message-State: AOJu0YysVU3eh+0DDIw0nRWo88eg575ObyfsYeeVLWTU3oG9RzlLFwtR
	o9SNpOWlFTDGmngaI7flGlT9YC39caV58CJBAs5dDW7oKC7ZstuNWNc7J4hMR/aiJpIrmlmdPuI
	j
X-Gm-Gg: ASbGnctM5zDsPKgjfxHSXufX7muiIVgFmrTeAUPpJB512GFD2oTacx0jN0c7rayeKZU
	4wpw4CAsG1mz+ZzcYgouMSnmFKdOajXNp6j/PD4LMd4Bu1XNMmKn3GvwH/SztXb4/C7bKSoVIi5
	fy6cYvAjGh1m3qFKfj/zVbIWUGZ5q8YpS0MjE3/eBTuHfULGEwVR8OELbol2FzdYAc/k0C0WwrT
	6d13K1uj61FzuAUdCGJBgn/Ssm02mO2WObyEcvZRwlUPsHezpvndPR4WI5vuBwd4GwfodN/cM8f
	GmDWCw3Afr5mKBeLJfOvRqi6jR2kR5oUWwOfb2aPzZuAUYaQ7he1vguHr2HbPbFdWTmITEBn364
	slCjCPjYcYu7G3i1Hcxvo4s4U
X-Google-Smtp-Source: AGHT+IGbsP5ut1PKHLOsau2UBH2PFiNxAdsbXV8uaQX5DoaOmgqlbYAQD6lXSN1m/Rqa/XT8HUbBDw==
X-Received: by 2002:a05:6000:1a8c:b0:3a0:ad33:c1b3 with SMTP id ffacd0b85a97d-3a1f6422047mr5810515f8f.3.1746882768068;
        Sat, 10 May 2025 06:12:48 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/bitmap: Drop unused headers
Date: Sat, 10 May 2025 14:12:45 +0100
Message-Id: <20250510131245.3062123-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Nothing in bitmap.h uses lib.h.  Reduce to just macros.h and string.h.  Drop
types.h while at it, as it comes in through bitops.h

cpumask.h and nodemask.h only include kernel.h to get container_of().  Move it
into macros.h where it belongs.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1810741296

v2:
 * Rebase by a year.
 * Move container_of() too.
---
 xen/include/xen/bitmap.h   |  4 ++--
 xen/include/xen/cpumask.h  |  1 -
 xen/include/xen/kernel.h   | 12 ------------
 xen/include/xen/macros.h   | 13 +++++++++++++
 xen/include/xen/nodemask.h |  1 -
 5 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index b5e9cdd3db86..79b2cd171595 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -3,9 +3,9 @@
 
 #ifndef __ASSEMBLY__
 
-#include <xen/lib.h>
-#include <xen/types.h>
 #include <xen/bitops.h>
+#include <xen/macros.h>
+#include <xen/string.h>
 
 /*
  * bitmaps provide bit arrays that consume one or more unsigned
diff --git a/xen/include/xen/cpumask.h b/xen/include/xen/cpumask.h
index b713bb69a9cb..a7715dfa0308 100644
--- a/xen/include/xen/cpumask.h
+++ b/xen/include/xen/cpumask.h
@@ -57,7 +57,6 @@
 
 #include <xen/bitmap.h>
 #include <xen/bug.h>
-#include <xen/kernel.h>
 #include <xen/random.h>
 
 typedef struct cpumask{ DECLARE_BITMAP(bits, NR_CPUS); } cpumask_t;
diff --git a/xen/include/xen/kernel.h b/xen/include/xen/kernel.h
index c5b6cc977772..378f21c247a6 100644
--- a/xen/include/xen/kernel.h
+++ b/xen/include/xen/kernel.h
@@ -8,18 +8,6 @@
 #include <xen/macros.h>
 #include <xen/types.h>
 
-/**
- * container_of - cast a member of a structure out to the containing structure
- *
- * @ptr:	the pointer to the member.
- * @type:	the type of the container struct this is embedded in.
- * @member:	the name of the member within the struct.
- *
- */
-#define container_of(ptr, type, member) ({                      \
-        typeof_field(type, member) *__mptr = (ptr);             \
-        (type *)( (char *)__mptr - offsetof(type,member) );})
-
 /**
  * __struct_group() - Create a mirrored named and anonyomous struct
  *
diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
index cd528fbdb127..58affb1588c5 100644
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -102,6 +102,19 @@
  */
 #define sizeof_field(type, member) sizeof(((type *)NULL)->member)
 
+/**
+ * container_of - cast a member of a structure out to the containing structure
+ *
+ * @ptr:	the pointer to the member.
+ * @type:	the type of the container struct this is embedded in.
+ * @member:	the name of the member within the struct.
+ */
+#define container_of(ptr, type, member)                         \
+    ({                                                          \
+        typeof_field(type, member) *__mptr = (ptr);             \
+        (type *)((void *)__mptr - offsetof(type, member));      \
+    })
+
 /* Cast an arbitrary integer to a pointer. */
 #define _p(x) ((void *)(unsigned long)(x))
 
diff --git a/xen/include/xen/nodemask.h b/xen/include/xen/nodemask.h
index 1dd6c7458e77..60d6455feb8b 100644
--- a/xen/include/xen/nodemask.h
+++ b/xen/include/xen/nodemask.h
@@ -53,7 +53,6 @@
  * for_each_online_node(node)		for-loop node over node_online_map
  */
 
-#include <xen/kernel.h>
 #include <xen/bitmap.h>
 #include <xen/numa.h>
 
-- 
2.39.5


