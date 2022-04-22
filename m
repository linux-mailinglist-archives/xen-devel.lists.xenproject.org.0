Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98DB50BFF8
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 20:53:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311187.528278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhyOn-0002Os-8s; Fri, 22 Apr 2022 18:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311187.528278; Fri, 22 Apr 2022 18:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhyOn-0002N5-5j; Fri, 22 Apr 2022 18:52:57 +0000
Received: by outflank-mailman (input) for mailman id 311187;
 Fri, 22 Apr 2022 18:52:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ojHi=VA=gmail.com=p4ranlee@srs-se1.protection.inumbo.net>)
 id 1nhyOl-0002Mx-Vz
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 18:52:56 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ace17eb-c26d-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 20:52:55 +0200 (CEST)
Received: by mail-pl1-x62c.google.com with SMTP id d15so12753266pll.10
 for <xen-devel@lists.xenproject.org>; Fri, 22 Apr 2022 11:52:54 -0700 (PDT)
Received: from localhost ([118.33.58.98]) by smtp.gmail.com with ESMTPSA id
 t9-20020a17090ad50900b001cd4989feecsm6645161pju.56.2022.04.22.11.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 11:52:53 -0700 (PDT)
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
X-Inumbo-ID: 6ace17eb-c26d-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=MzQpyWVGd6/oj99QHSaMNGw4bNEHQuphO4N+La1lNXc=;
        b=pFKtqZ49r5qs8C1gaNPeURj/UJk2+IJc6qFTyVxesaqzLOIfAu8bAhiuqTptbqr4IO
         Zkp/Oy4P0zdMrAp7MlF9tYcxrVDwZayGy5MeRjnYxo8ER2BJceqW+IPxqZ+IvWvmFoz6
         eILK2+hqB569neFwydPKIrRoWsPwDx3u6+JKz2/imLxIa+j1sifsG+71LCOk0cwxx7U4
         e5MURCz0NNHcg7wKWnYLH5mRcUS/vc9IIAbN5BkBrVtxj51UVFPAGnkgEk8SOiQmC8ZW
         PivSvkLvrQxLXzOy4ARofjxN5LLJK8LKxh0tycsZyjOAWnYUKlLC+U8HpMMlqjea01Dv
         2w/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=MzQpyWVGd6/oj99QHSaMNGw4bNEHQuphO4N+La1lNXc=;
        b=yN+w6459F716/9OHXVopw5M28ZnNA2IZsIJCtUrA0myhwHeIoIPKsNQUB1Hk+im1s+
         VjaG0UfrpcZem5cQpKC7K6CxH+hLWuGQN8Jk10Z60uIGQfdOhfwSnywvTkiZSnF2fyKA
         c26pAd/7xCnF5WQ7fs2M2wiLhBMyBtP8Hhfaf+Thf4Wm/LLZuoUFrLCb/uunRG3O3Qn3
         XY/bMsSgAal9J/3Miq3xjiFy4SlmDgURSmOFq8dBE6OT05aKsY8v4vIf1M3wr1Lcp125
         lSQXLrys54ej1hLmkO7C9I8XIVchow1vi3loIEESYkbkSZCGKiZGSagL40cqHxzjWYP4
         VZiw==
X-Gm-Message-State: AOAM5335eKp+Kv3PW8f/+q7rssR6nh9vM3GPvdmoE7oemjSkcAVpAzKu
	FYRKqBnv3JT99iCUClWgHXo=
X-Google-Smtp-Source: ABdhPJzmQq+ytJJZZiySqbM4zWDZvMnW+Qy8paUr8NflAfoC+EJg8LPTKGbSwFuRFL7xwxeU8LemQw==
X-Received: by 2002:a17:902:9001:b0:156:a567:2683 with SMTP id a1-20020a170902900100b00156a5672683mr5953430plp.164.1650653573442;
        Fri, 22 Apr 2022 11:52:53 -0700 (PDT)
Date: Sat, 23 Apr 2022 03:52:51 +0900
From: Paran Lee <p4ranlee@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Austin Kim <austindh.kim@gmail.com>, xen-devel@lists.xenproject.org
Subject: [PATCH] xen/arm: fdt fix duplicated ternary operator, shift
 operations
Message-ID: <20220422185251.GA7124@DESKTOP-NK4TH6S.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

It doesn't seem necessary to do duplicate ternary operation and calculation
of order shift using fdt32_to_cpu macro.

Signed-off-by: Paran Lee <p4ranlee@gmail.com>
---
 xen/arch/arm/bootfdt.c  | 12 ++++++++++--
 xen/common/libfdt/fdt.c | 10 +++++-----
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index e318ef9603..e5b885a7f2 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -159,8 +159,16 @@ int __init device_tree_for_each_node(const void *fdt, int node,
             continue;
         }
 
-        as = depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
-        ss = depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
+        if ( depth > 0 )
+        {
+            as = address_cells[depth-1];
+            ss = size_cells[depth-1];
+        }
+        else
+        {
+            as = DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
+            ss = DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
+        }
 
         address_cells[depth] = device_tree_get_u32(fdt, node,
                                                    "#address-cells", as);
diff --git a/xen/common/libfdt/fdt.c b/xen/common/libfdt/fdt.c
index 9fe7cf4b74..a507169d29 100644
--- a/xen/common/libfdt/fdt.c
+++ b/xen/common/libfdt/fdt.c
@@ -165,7 +165,7 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
 uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 {
 	const fdt32_t *tagp, *lenp;
-	uint32_t tag;
+	uint32_t tag, len;
 	int offset = startoffset;
 	const char *p;
 
@@ -192,11 +192,11 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 		if (!can_assume(VALID_DTB) && !lenp)
 			return FDT_END; /* premature end */
 		/* skip-name offset, length and value */
-		offset += sizeof(struct fdt_property) - FDT_TAGSIZE
-			+ fdt32_to_cpu(*lenp);
+		len = fdt32_to_cpu(*lenp);
+		offset += sizeof(struct fdt_property) - FDT_TAGSIZE + len;
 		if (!can_assume(LATEST) &&
-		    fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >= 8 &&
-		    ((offset - fdt32_to_cpu(*lenp)) % 8) != 0)
+		    fdt_version(fdt) < 0x10 && len >= 8 &&
+		    ((offset - len) % 8) != 0)
 			offset += 4;
 		break;
 
-- 
2.25.1


