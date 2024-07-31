Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CDD943725
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 22:34:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769073.1179965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZG1M-0003SZ-E3; Wed, 31 Jul 2024 20:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769073.1179965; Wed, 31 Jul 2024 20:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZG1M-0003Pt-BS; Wed, 31 Jul 2024 20:34:04 +0000
Received: by outflank-mailman (input) for mailman id 769073;
 Wed, 31 Jul 2024 20:34:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/qb=O7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sZG1L-0003Pn-3B
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 20:34:03 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 375f8396-4f7c-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 22:33:59 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7a83a968ddso859901066b.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 13:33:59 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab4ddb4sm804820366b.69.2024.07.31.13.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 13:33:58 -0700 (PDT)
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
X-Inumbo-ID: 375f8396-4f7c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722458039; x=1723062839; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qZAgm+BEE4HVbbBTkzbht3GB6CaD8+68+119ANrOrXI=;
        b=lvin6LvhF/4jIYlTIvHuaZ79JncdsRgHbGHEd88tgsJ/RQCoruIi0CvJGly8wEyQT+
         /tur7uZOGjr3DJRB8pLjDxSJnecn9dPMe43lnHd2WZiY8ajgVu7pNL/I6HS3/6WPgTma
         Tz3aMNK27sOxHpGHhsWmqaUQjCJ91i3Ucgoo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722458039; x=1723062839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZAgm+BEE4HVbbBTkzbht3GB6CaD8+68+119ANrOrXI=;
        b=RIrjK4TsXaxc+Mkmk2UobfwRHagh6/cEKE/upHUpTMYA5ogo9FmBZ0412sMezFCvtM
         sh9OFsPh94YmsHE5vxCMc7QSOdXRXRHybWc+ZUU9/1+h+Nf1OKKYZXjsRnvplvkK34D3
         gucHCq5H/eZ4kTaeIFSGnkKXPLSjCwnp91HzuoFUkXnQuGwP5JwbKgb7VQdOG0uyddil
         fwxWjH0QshX72TAQvZU0qWi8BMK9ZrQ0lCcTmR9aJi00xALlgRI8RgRevE/DlGnKP80W
         KzQ0pfMj7/QFeDI4+ZLkcK/PI2n7mkLwK1LPPBGsRtt9AlsqWH7ZdnbhGGLg9hqlfLM3
         2AbQ==
X-Gm-Message-State: AOJu0YxGzMos1e+b+o8DJibygq10I6JYOYXondsKa8NL9QJmhw+aw/M1
	1i9KM9Rx3Hu+EZoaZztW9pkVinF4SU+Qhr/gaW3u6HWXhb81pzpvkxoYjDX5hy5AmH1YT13MhVC
	i
X-Google-Smtp-Source: AGHT+IFFr3GKYehPbPQj3wP+jhqOSAVHkt8HMfV1NSK5khxISP7/pRSqWiwh0xwzJyrux3PaVk+6Ig==
X-Received: by 2002:a17:907:7e8a:b0:a7a:9144:e23a with SMTP id a640c23a62f3a-a7daf659c0cmr23077866b.43.1722458038561;
        Wed, 31 Jul 2024 13:33:58 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] x86/domain: Fix domlist_insert() updating the domain hash
Date: Wed, 31 Jul 2024 21:33:55 +0100
Message-Id: <20240731203355.3652182-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A last minute review request was to dedup the expression calculating the
domain hash bucket.

While the code reads correctly, it is buggy because rcu_assign_pointer() is a
criminally stupid API assigning by name not value, and - contrary to it's name
- does not hide an indirection.

Therefore, rcu_assign_pointer(bucket, d); updates the local bucket variable on
the stack, not domain_hash[], causing all subsequent domid lookups to fail.

Rework the logic to use pd in the same way that domlist_remove() does.

Fixes: 19995bc70cc6 ("xen/domain: Factor domlist_{insert,remove}() out of domain_{create,destroy}()")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1395978459
---
 xen/common/domain.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8d8f40ccb245..92263a4fbdc5 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -70,7 +70,7 @@ struct domain *domain_list;
  */
 static void domlist_insert(struct domain *d)
 {
-    struct domain **pd, *bucket;
+    struct domain **pd;
 
     spin_lock(&domlist_update_lock);
 
@@ -79,12 +79,12 @@ static void domlist_insert(struct domain *d)
         if ( (*pd)->domain_id > d->domain_id )
             break;
 
-    bucket = domain_hash[DOMAIN_HASH(d->domain_id)];
-
     d->next_in_list = *pd;
-    d->next_in_hashbucket = bucket;
     rcu_assign_pointer(*pd, d);
-    rcu_assign_pointer(bucket, d);
+
+    pd = &domain_hash[DOMAIN_HASH(d->domain_id)];
+    d->next_in_hashbucket = *pd;
+    rcu_assign_pointer(*pd, d);
 
     spin_unlock(&domlist_update_lock);
 }
-- 
2.39.2


