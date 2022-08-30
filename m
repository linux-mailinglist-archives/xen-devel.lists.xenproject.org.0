Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E1A5A755D
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 07:06:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395186.635047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFvD-0001No-G0; Wed, 31 Aug 2022 05:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395186.635047; Wed, 31 Aug 2022 05:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFvC-00018u-Ik; Wed, 31 Aug 2022 05:05:50 +0000
Received: by outflank-mailman (input) for mailman id 395186;
 Tue, 30 Aug 2022 21:49:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GzUx=ZC=flex--surenb.bounces.google.com=3A4YOYwYKCWgYaXKTHMUUMRK.IUSdKT-JKbKRROYZY.dKTVXUPKIZ.UXM@srs-se1.protection.inumbo.net>)
 id 1oT97N-0008CX-2L
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 21:49:57 +0000
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [2607:f8b0:4864:20::b49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af85246f-28ad-11ed-a60c-1f1ba7de4fb0;
 Tue, 30 Aug 2022 23:49:56 +0200 (CEST)
Received: by mail-yb1-xb49.google.com with SMTP id
 p8-20020a258188000000b0069ca52d9f68so712448ybk.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Aug 2022 14:49:56 -0700 (PDT)
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
X-Inumbo-ID: af85246f-28ad-11ed-a60c-1f1ba7de4fb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=+dBCH/ZYeXKPl1XZC0y8jtwH0hgKGXE3JjJWq8gRM44=;
        b=AFaSMy8jXac7TuC+3zPxWUGJEoV6Xwt0zQp9MqDmFFlT9mWJtIdF7dkyLAZ2dlc2YA
         b9Gf5k0v2Zvts/DmzzZ5pyBGK4PvMyQtpd/jCDUfU7pbPfnKneDUuVfIqoh8xzC2EEXM
         ggO+9/ET/L3N7vFPV9TWkym8O3GXfgaPKOHQOvjujiuqNd9k0qGNIcoGl/dBIZk4zlFa
         QTsb0Fx654oBfwlYyCvPgpIbUnjCokKwOPL7A775wrhi+ShDtrR1D6bLCXYg9BBaYtDw
         bc4QILCqScR/90fRkJQtLt8mPydrXHAQRmui3zER0ZDrlUBSto4jKF/epnVV4Tt3A9sc
         lVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=+dBCH/ZYeXKPl1XZC0y8jtwH0hgKGXE3JjJWq8gRM44=;
        b=L8xjTa/wSHJmHSZFYg34SzMLFWAJdZnHQiTSFRJ4u2d6emDajBogvZYUsHXqseSSPs
         APofAI5oVtJuh7wwhSX+HqfSTma+tvCUxPoaeyuJYV3Ups+eW0dHMcyeJs7CtEttEbnN
         uHSICSDcLDgC7yzSfCjcO7zqssbir1QMQ0lYFBQsmIIJLcruw4RcNEq06wdg3MOMcNlJ
         pLyCCOIkEoBYga7y5v9GoCD6PYT8dNlMDVQ4HFD8O9xXw+IEc67XMVFyErq41Rw4gIj8
         YTbQ728uTF+C7hFriWvCwg6S4DGXpga1EV1m+69QUfxKO0Nn2Uq32B/1EryMgQXpY2nN
         qEyw==
X-Gm-Message-State: ACgBeo0S1Cay2MSpDbB5CgUkvGYiqSYaqZKA6WRyNdIf31MwDPGu5uxp
	MhzvsMrKgMr63T/gIA2lPfLo6G3ctfQ=
X-Google-Smtp-Source: AA6agR5IHyLOVpCYPsGCTl1WAh1PLHzSkOgAmQAkkvI/LDvSxkU9pCXJyMghFPF7B9PD/jn9WBQElFJpekI=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:a005:55b3:6c26:b3e4])
 (user=surenb job=sendgmr) by 2002:a25:94b:0:b0:68f:4e05:e8f0 with SMTP id
 u11-20020a25094b000000b0068f4e05e8f0mr13319593ybm.115.1661896195289; Tue, 30
 Aug 2022 14:49:55 -0700 (PDT)
Date: Tue, 30 Aug 2022 14:49:01 -0700
In-Reply-To: <20220830214919.53220-1-surenb@google.com>
Mime-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220830214919.53220-13-surenb@google.com>
Subject: [RFC PATCH 12/30] mm: introduce __GFP_NO_OBJ_EXT flag to selectively
 prevent slabobj_ext creation
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com, 
	ldufour@linux.ibm.com, peterx@redhat.com, david@redhat.com, axboe@kernel.dk, 
	mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	changbin.du@intel.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, arnd@arndb.de, jbaron@akamai.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	surenb@google.com, kernel-team@android.com, linux-mm@kvack.org, 
	iommu@lists.linux.dev, kasan-dev@googlegroups.com, io-uring@vger.kernel.org, 
	linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Introduce __GFP_NO_OBJ_EXT flag in order to prevent recursive allocations
when allocating slabobj_ext on a slab.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/gfp_types.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
index d88c46ca82e1..a2cba1d20b86 100644
--- a/include/linux/gfp_types.h
+++ b/include/linux/gfp_types.h
@@ -55,8 +55,13 @@ typedef unsigned int __bitwise gfp_t;
 #define ___GFP_SKIP_KASAN_UNPOISON	0
 #define ___GFP_SKIP_KASAN_POISON	0
 #endif
+#ifdef CONFIG_SLAB_OBJ_EXT
+#define ___GFP_NO_OBJ_EXT       0x8000000u
+#else
+#define ___GFP_NO_OBJ_EXT       0
+#endif
 #ifdef CONFIG_LOCKDEP
-#define ___GFP_NOLOCKDEP	0x8000000u
+#define ___GFP_NOLOCKDEP	0x10000000u
 #else
 #define ___GFP_NOLOCKDEP	0
 #endif
@@ -101,12 +106,15 @@ typedef unsigned int __bitwise gfp_t;
  * node with no fallbacks or placement policy enforcements.
  *
  * %__GFP_ACCOUNT causes the allocation to be accounted to kmemcg.
+ *
+ * %__GFP_NO_OBJ_EXT causes slab allocation to have no object extension.
  */
 #define __GFP_RECLAIMABLE ((__force gfp_t)___GFP_RECLAIMABLE)
 #define __GFP_WRITE	((__force gfp_t)___GFP_WRITE)
 #define __GFP_HARDWALL   ((__force gfp_t)___GFP_HARDWALL)
 #define __GFP_THISNODE	((__force gfp_t)___GFP_THISNODE)
 #define __GFP_ACCOUNT	((__force gfp_t)___GFP_ACCOUNT)
+#define __GFP_NO_OBJ_EXT   ((__force gfp_t)___GFP_NO_OBJ_EXT)
 
 /**
  * DOC: Watermark modifiers
@@ -256,7 +264,7 @@ typedef unsigned int __bitwise gfp_t;
 #define __GFP_NOLOCKDEP ((__force gfp_t)___GFP_NOLOCKDEP)
 
 /* Room for N __GFP_FOO bits */
-#define __GFP_BITS_SHIFT (27 + IS_ENABLED(CONFIG_LOCKDEP))
+#define __GFP_BITS_SHIFT (28 + IS_ENABLED(CONFIG_LOCKDEP))
 #define __GFP_BITS_MASK ((__force gfp_t)((1 << __GFP_BITS_SHIFT) - 1))
 
 /**
-- 
2.37.2.672.g94769d06f0-goog


