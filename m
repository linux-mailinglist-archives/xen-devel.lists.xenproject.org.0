Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D5E5A7568
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 07:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395191.635070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFvG-000229-2O; Wed, 31 Aug 2022 05:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395191.635070; Wed, 31 Aug 2022 05:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFvF-0001fz-2t; Wed, 31 Aug 2022 05:05:53 +0000
Received: by outflank-mailman (input) for mailman id 395191;
 Tue, 30 Aug 2022 21:50:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MUuR=ZC=flex--surenb.bounces.google.com=3CIYOYwYKCW0dfcPYMRZZRWP.NZXiPY-OPgPWWTded.iPYacZUPNe.ZcR@srs-se1.protection.inumbo.net>)
 id 1oT97S-0008CX-Jb
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 21:50:02 +0000
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [2607:f8b0:4864:20::b49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2cd68e0-28ad-11ed-a60c-1f1ba7de4fb0;
 Tue, 30 Aug 2022 23:50:02 +0200 (CEST)
Received: by mail-yb1-xb49.google.com with SMTP id
 s15-20020a5b044f000000b00680c4eb89f1so711409ybp.7
 for <xen-devel@lists.xenproject.org>; Tue, 30 Aug 2022 14:50:01 -0700 (PDT)
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
X-Inumbo-ID: b2cd68e0-28ad-11ed-a60c-1f1ba7de4fb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=gY+PdoFf3bNnEB0W9Vd0woPoFdt9hhtegjhiPtTj+AE=;
        b=pP4c3oP+YdesowZgNPs4eE1Xp1hWxAr9Ov2IDGBfglQ7uK9BWLrmzhDJ/utRpkPDJK
         tLMoERW1+3/smlLhO5G46VfqVywVDMABKHAv9jnhzz9ZshpBvX9ODCL7lsQaaZS0MLOk
         moKmQwwsOGjNod+M4t/tjA/+LNyP1VXOc5752+/a3Um/WwaPBzNEpe5l2cE7BDo787CF
         /PWmu6igP2xWBoiVtEHlimVT5AWdWMQxPlHvsqYO1szpGDqcGUPThIrLg/hGXqOCKmhM
         XRoOlsQx66oUshjUnxZWYY0qi/lYffvprIXZMUGryr7KjlXRCtsueZ1FZIWTKefulhTk
         stEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=gY+PdoFf3bNnEB0W9Vd0woPoFdt9hhtegjhiPtTj+AE=;
        b=rBRLT4gtRQ/DmJopniIIKhyek6uKH6CJ2T+LV6bkf435zrSzFLfyaMn/2qygFqLt0D
         b6gytOKM36I/rVm8zZJ6oocF0zMUSJ/2KL782mmDajElKEQYeUg12chPXO3GOh2/UZZb
         h8pzXbbx9Un803tZ6ct0sDfInCmGHDSgTFLJbSwuVgXfK9Fo1igtxi4Z7hUcERAvSG07
         TIqfolcwRqRSiOd3ac21CHXBIzlnozn5xeEq+dTdjsZy5gQYozX3NI0L5D9VkPq4HHIc
         71XgRqZ4mgCkzGPXjHYuxzn57TlOPg5cTBED1P7j9Y6bFzsMOyyrICqwXqsoUKvAG/ds
         daTA==
X-Gm-Message-State: ACgBeo0j+81YFsxk/4KuzlR+/AE02+k+M+mUXNlgLnnQGZDEEc6H1r5s
	sXu+rhibwooqUETlpMsZnmUYEWaC3as=
X-Google-Smtp-Source: AA6agR7WLdIMrAR0FWfuROzkHWzqEUxzLPyMUzXzjD/46yfJpgch8NK3VM+VyOZeNwYsSnGIQ5TrqCRxJvQ=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:a005:55b3:6c26:b3e4])
 (user=surenb job=sendgmr) by 2002:a25:ba91:0:b0:683:ebc2:7114 with SMTP id
 s17-20020a25ba91000000b00683ebc27114mr13866830ybg.319.1661896200808; Tue, 30
 Aug 2022 14:50:00 -0700 (PDT)
Date: Tue, 30 Aug 2022 14:49:03 -0700
In-Reply-To: <20220830214919.53220-1-surenb@google.com>
Mime-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220830214919.53220-15-surenb@google.com>
Subject: [RFC PATCH 14/30] mm: prevent slabobj_ext allocations for slabobj_ext
 and kmem_cache objects
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

Use __GFP_NO_OBJ_EXT to prevent recursions when allocating slabobj_ext
objects. Also prevent slabobj_ext allocations for kmem_cache objects.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/memcontrol.c | 2 ++
 mm/slab.h       | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 3f407ef2f3f1..dabb451dc364 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2809,6 +2809,8 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
 	void *vec;
 
 	gfp &= ~OBJCGS_CLEAR_MASK;
+	/* Prevent recursive extension vector allocation */
+	gfp |= __GFP_NO_OBJ_EXT;
 	vec = kcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
 			   slab_nid(slab));
 	if (!vec)
diff --git a/mm/slab.h b/mm/slab.h
index c767ce3f0fe2..d93b22b8bbe2 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -475,6 +475,12 @@ static inline void prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags,
 	if (is_kmem_only_obj_ext())
 		return;
 
+	if (s->flags & SLAB_NO_OBJ_EXT)
+		return;
+
+	if (flags & __GFP_NO_OBJ_EXT)
+		return;
+
 	slab = virt_to_slab(p);
 	if (!slab_obj_exts(slab))
 		WARN(alloc_slab_obj_exts(slab, s, flags, false),
-- 
2.37.2.672.g94769d06f0-goog


