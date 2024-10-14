Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB1B99CFD2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 16:58:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818718.1231997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0MVZ-0004RW-Nv; Mon, 14 Oct 2024 14:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818718.1231997; Mon, 14 Oct 2024 14:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0MVZ-0004Py-L7; Mon, 14 Oct 2024 14:57:17 +0000
Received: by outflank-mailman (input) for mailman id 818718;
 Mon, 14 Oct 2024 14:57:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QJ8R=RK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t0MVY-0004Ps-9f
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 14:57:16 +0000
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [2a00:1450:4864:20::641])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98fcf4ff-8a3c-11ef-99a2-01e77a169b0f;
 Mon, 14 Oct 2024 16:57:14 +0200 (CEST)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-a9a0c40849cso168038766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 07:57:14 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a13f42e8bsm125819366b.58.2024.10.14.07.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 07:57:12 -0700 (PDT)
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
X-Inumbo-ID: 98fcf4ff-8a3c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728917833; x=1729522633; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dMZIQjsP5fHzlaQ6yg7Tp1+F+fv6I6NAeH/6zSGualY=;
        b=CZac8+MlrGQBWhBzBr5+oFyfYlVb3E1Wtr+6iodv+YaTQHxDuTNdZrUdGHIjohL1O7
         GOYFm13jUFGZ3UjoYZDEkKe0Xw/jsb+IqW8RCvsvduLlK7XSkvZZ4OJ7taQ+A5Y4QXRk
         IlEpO9t4RHxIIoWkNgiUfWzGrSfFNQJ0iBw80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728917833; x=1729522633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dMZIQjsP5fHzlaQ6yg7Tp1+F+fv6I6NAeH/6zSGualY=;
        b=JDrZhCU1eP+n776KqrvdcRI91JLKdSBcznRETCxoVa/lY+QdlfB72giZwOKXo0sIW2
         GdoZEZ2GVfJ1gDJZhIMIjP35fnL4SwFJ0+/XzkNLrKBbuUUJ1um0LlhwOr7G5dfGE1my
         8506HUy6IceucX75tG0DmUPsT+5vkP24qjLWErmSff6kZskbSrV+zNk2a2qO4YJ8lN+0
         r8cHLmTIosM4R2XodGGSOnZf5jXlaNb+DwfKhWxbIJX/dkbDwo8q/r5E8au01mBocywR
         MuxrJqJj6mxZ6MJGV1O7smhafMX043w0A8Hn9D/On3gg1veprAGIsS+Eq6ICcWuqK88v
         yPpg==
X-Gm-Message-State: AOJu0YztLOXLcl/Vxs472SmHkCTsmNE6RVuA5XO0SiCGcv8+mU/+wHvo
	i386xqq87IE0QTh2luCV0ps2WRdceiWEdkpVTv/loZ/Z5w6p8Y0qLvair02OtmpQXxmkp84tCZT
	VFJAnfg==
X-Google-Smtp-Source: AGHT+IExYFkTEebe4Hwhe5Ai6UWab2+C3aQ0za22TXZEX8lpCZupatRlstndF9Ag8oOAjZ2S4aYVrA==
X-Received: by 2002:a17:907:9693:b0:a9a:1cbd:257e with SMTP id a640c23a62f3a-a9a1cbd2a10mr142202866b.29.1728917833160;
        Mon, 14 Oct 2024 07:57:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] xen/spinlock: Fix UBSAN "load of address with insufficient space" in lock_prof_init()
Date: Mon, 14 Oct 2024 15:57:10 +0100
Message-Id: <20241014145710.3295232-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

UBSAN complains:

  (XEN) ================================================================================
  (XEN) UBSAN: Undefined behaviour in common/spinlock.c:794:10
  (XEN) load of address ffff82d040ae24c8 with insufficient space
  (XEN) for an object of type 'struct lock_profile *'
  (XEN) ----[ Xen-4.20-unstable  x86_64  debug=y ubsan=y  Tainted:   C    ]----

This shows up with GCC-14, but not with GCC-12.  I have not bisected further.

Either way, the types for __lock_profile_{start,end} are incorrect.

They are an array of struct lock_profile pointers.  Correct the extern's
types, and adjust the loop to match.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Found as collatoral damage in
https://github.com/QubesOS/qubes-issues/issues/9501 but it's not related to
the main bug being repoted.

A reported-by tag TBC.
---
 xen/common/spinlock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 0b877384451d..38caa10a2ea2 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -608,9 +608,6 @@ struct lock_profile_anc {
 typedef void lock_profile_subfunc(struct lock_profile *data, int32_t type,
     int32_t idx, void *par);
 
-extern struct lock_profile *__lock_profile_start;
-extern struct lock_profile *__lock_profile_end;
-
 static s_time_t lock_profile_start;
 static struct lock_profile_anc lock_profile_ancs[] = {
     [LOCKPROF_TYPE_GLOBAL] = { .name = "Global" },
@@ -780,13 +777,16 @@ void _lock_profile_deregister_struct(
     spin_unlock(&lock_profile_lock);
 }
 
+extern struct lock_profile *__lock_profile_start[];
+extern struct lock_profile *__lock_profile_end[];
+
 static int __init cf_check lock_prof_init(void)
 {
     struct lock_profile **q;
 
     BUILD_BUG_ON(ARRAY_SIZE(lock_profile_ancs) != LOCKPROF_TYPE_N);
 
-    for ( q = &__lock_profile_start; q < &__lock_profile_end; q++ )
+    for ( q = __lock_profile_start; q < __lock_profile_end; q++ )
     {
         (*q)->next = lock_profile_glb_q.elem_q;
         lock_profile_glb_q.elem_q = *q;
-- 
2.39.5


