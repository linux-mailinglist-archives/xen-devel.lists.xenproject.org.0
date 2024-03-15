Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D493487CBC4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 12:00:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693756.1082284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Hx-0002bI-7a; Fri, 15 Mar 2024 10:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693756.1082284; Fri, 15 Mar 2024 10:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Hw-0002W1-R0; Fri, 15 Mar 2024 10:59:48 +0000
Received: by outflank-mailman (input) for mailman id 693756;
 Fri, 15 Mar 2024 10:59:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnwS=KV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rl5Hu-0000aQ-W2
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 10:59:47 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22750349-e2bb-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 11:59:46 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-512f892500cso2178590e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 03:59:46 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 en6-20020a17090728c600b00a465a012cf1sm1621493ejc.18.2024.03.15.03.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 03:59:44 -0700 (PDT)
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
X-Inumbo-ID: 22750349-e2bb-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1710500385; x=1711105185; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYc2fjm39MgqSAD7cglykxE3vKSQ8RsibFkKXHp3q6E=;
        b=O0rmustzajsoCV/424Og3NT9yw7pkVsqCzJSgcVIQ7M4qMN1vRke/fa3zY0OcQ1Bz5
         cl3DZhhrS8tXMVAVjEU/x8QUHIXS55DhtsJPmqPbbUL6+8N9dqxr7Ut3k++bEC8Oks4F
         Ktwkpnrjpyzbs3LKAModiTN8ymaJ00ftl7MMrGaAcJ9UbkA8CqdAHs3xhcNCBNbvLc+A
         tRa2XLOxy2mcpvL9HGa0YnXSV8mz1i4jE5VE0DcFScmUhxgRgDbIB2SI7jsjXDgssgDE
         b3rwg9V02ZBzYTY81g6LV0wdNRorH4jWBY7FrvCqXMdMMVg4C8c4M0v4jZzdgtPZcdEg
         W/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710500385; x=1711105185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYc2fjm39MgqSAD7cglykxE3vKSQ8RsibFkKXHp3q6E=;
        b=HNsobFylwUc0DoW21SEk/1YVcOghNL1i4eKUPPzJdGhYbPIpk9Ay3aOD5nXAYu9WWr
         Ypeyd25ukqdNB6Hz/NW4WQoxK5xoaN5rHbiC70OwMaBWCPYkrkC6Sxehs56I085TERlV
         GuY7c7GnH8ZHKL9t+92jIJcdb7Tfd9hMvhgOfsBi3IYgeMilMcoFjOE3nlyIbIOKtSmc
         bvGVcPlguNLT6rPPStawta5QLBAhJKSeWZ8G8+GpObVTAFmF8wVA7F/8payYbhleF67w
         iGQqRY4a6a1CJJ4yVP2CDv/sW84fRhg73tzZmdg7EdLe75XOzPcLMExzGxjsWGDcO4Me
         8CPA==
X-Gm-Message-State: AOJu0Yx+0wfIXdWFzcy3Z7TdyNsb/DSbkpgYGt5rs7nqGhu2s3nIAbcK
	aixH+J1tBwH0DZBO8/S4pgHXxMbJa1s9dY/D7FSSTvknw8hUbpNMk9l6UpZo4+YQlEB4vyAYS9p
	VZl8=
X-Google-Smtp-Source: AGHT+IEQP+6WDfiheoSz5yXjt+PCwXQ2A8A+Q0SD4r64xEVv8nX/DG7p5uhgn0dD+s4xfjmMgOhj/g==
X-Received: by 2002:a19:5f5a:0:b0:513:cff2:967f with SMTP id a26-20020a195f5a000000b00513cff2967fmr2230732lfj.18.1710500385215;
        Fri, 15 Mar 2024 03:59:45 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 09/14] xen/page_alloc: introduce page flag to stop buddy merging
Date: Fri, 15 Mar 2024 11:58:57 +0100
Message-Id: <20240315105902.160047-10-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new PGC_no_buddy_merge flag that prevents the buddy algorithm in
free_heap_pages() from merging pages that have it set. As of now, only
PGC_static has this feature, but future work can extend it easier than
before.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
v7:
- new patch
---
 xen/common/page_alloc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 6a98d9013f..3adea713b7 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -159,6 +159,7 @@
 #endif
 
 #define PGC_preserved (PGC_extra | PGC_static)
+#define PGC_no_buddy_merge PGC_static
 
 #ifndef PGT_TYPE_INFO_INITIALIZER
 #define PGT_TYPE_INFO_INITIALIZER 0
@@ -1504,7 +1505,7 @@ static void free_heap_pages(
             /* Merge with predecessor block? */
             if ( !mfn_valid(page_to_mfn(predecessor)) ||
                  !page_state_is(predecessor, free) ||
-                 (predecessor->count_info & PGC_static) ||
+                 (predecessor->count_info & PGC_no_buddy_merge) ||
                  (PFN_ORDER(predecessor) != order) ||
                  (page_to_nid(predecessor) != node) )
                 break;
@@ -1528,7 +1529,7 @@ static void free_heap_pages(
             /* Merge with successor block? */
             if ( !mfn_valid(page_to_mfn(successor)) ||
                  !page_state_is(successor, free) ||
-                 (successor->count_info & PGC_static) ||
+                 (successor->count_info & PGC_no_buddy_merge) ||
                  (PFN_ORDER(successor) != order) ||
                  (page_to_nid(successor) != node) )
                 break;
-- 
2.34.1


