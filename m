Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F7B59A6AD
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 21:45:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390443.627938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP7v3-0006aP-MI; Fri, 19 Aug 2022 19:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390443.627938; Fri, 19 Aug 2022 19:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP7v3-0006SM-9Q; Fri, 19 Aug 2022 19:44:37 +0000
Received: by outflank-mailman (input) for mailman id 390443;
 Fri, 19 Aug 2022 19:44:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yp9C=YX=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oP7v2-0004jK-1v
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 19:44:36 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a7a5940-1ff7-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 21:44:35 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id j8so10624606ejx.9
 for <xen-devel@lists.xenproject.org>; Fri, 19 Aug 2022 12:44:35 -0700 (PDT)
Received: from uni.. (adsl-47.176.58.181.tellas.gr. [176.58.181.47])
 by smtp.googlemail.com with ESMTPSA id
 r17-20020a1709061bb100b00731745a7e62sm2695059ejg.28.2022.08.19.12.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 12:44:34 -0700 (PDT)
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
X-Inumbo-ID: 5a7a5940-1ff7-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=zr3W75+rbEgAY973OCuXKMwBZmftg9FAYuo83VpG87U=;
        b=MYnAcV536pEaEaP0C6uceSAbrybRsXc9/E4l5wAvvDYBaL6BbePOnwFLMQeZPDwdga
         OzzOJGfX/7CpmiX26pcuUCQTTp5mvHIwc5czAiasUxHB9lY7dlXQkGAExPvsaNBQ5/K0
         kmr1gF80EcA82jxzlUw+yS4pnMKcotbCe+34c1waapot3zGWpUUhMVLUmaLLbZvq4k/m
         AImjiFFdXDp9g8pCRl2YkxwzahRZ4NqtlOooisZT4Ue0ufW1gmZBpTR1R6kGslW54mXt
         da7I5VW+/Y+ly/v16RaEMz4t2GAqLkpYIoqyJ3FyBr09+LH+yRBWUddErWImQeQAVeEy
         ivfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=zr3W75+rbEgAY973OCuXKMwBZmftg9FAYuo83VpG87U=;
        b=VY8d6sUEihLgl6KLFMHwLYtg0ZBlvI77NBGxpX+1BUOYXbeGtDZTUKN2iJNDeugZa6
         FDU1kTa29QatbNFKLF5BhP6jAb6gA+1AWrRes3xq6QhLjNtzXxSqYIIR4YVHIs00uw9X
         YipQaehsLg75PTs/Bpcr4xQbzcQHcOMRlIb1QR2MSpaQwRyRsHTUcjAUlqxjmYPmjp95
         f/Tscbh4XVnp0XUvn0H1Fah2BWQI2ZdPQCoiiP5E2WnRq9dLiS1tB574nlWu6Ayv8qNl
         CqshKttmZwEm1+vigMUMCmXpA/EIPfahhTE11X/FctvkzKSGC20CW4RYZK8UmP6Oeor0
         y7eg==
X-Gm-Message-State: ACgBeo3MUs6NDf3TEcHGgU+HIqLOUGQ60bLGDdDdlj18XzXH7cqURC+4
	vj4HF2elRz/gAlnGxNpIig3bZq32ukQ=
X-Google-Smtp-Source: AA6agR47Pk7lxiJRD6PZ1L4Ihi7zuJngGMMqd4+Jq8z+75Wg1oy3/iLdambiobOITRK3GnkFklNIaQ==
X-Received: by 2002:a17:906:84f0:b0:731:8572:80ab with SMTP id zp16-20020a17090684f000b00731857280abmr5769836ejb.254.1660938274860;
        Fri, 19 Aug 2022 12:44:34 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 7/7] xen/device_tree: Fix MISRA C 2012 Rule 20.7 violations
Date: Fri, 19 Aug 2022 22:43:59 +0300
Message-Id: <20220819194359.1196539-8-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819194359.1196539-1-burzalodowa@gmail.com>
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In macros dt_for_each_property_node(), dt_for_each_device_node() and
dt_for_each_child_node(), add parentheses around the macro parameters that
have the arrow operator applied, to prevent against unintended expansions.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/include/xen/device_tree.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 430a1ef445..6e4391c126 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -222,13 +222,13 @@ dt_find_interrupt_controller(const struct dt_device_match *matches);
 #define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
 
 #define dt_for_each_property_node(dn, pp)                   \
-    for ( pp = dn->properties; pp != NULL; pp = pp->next )
+    for ( pp = (dn)->properties; pp != NULL; pp = (pp)->next )
 
 #define dt_for_each_device_node(dt, dn)                     \
-    for ( dn = dt; dn != NULL; dn = dn->allnext )
+    for ( dn = dt; dn != NULL; dn = (dn)->allnext )
 
 #define dt_for_each_child_node(dt, dn)                      \
-    for ( dn = dt->child; dn != NULL; dn = dn->sibling )
+    for ( dn = (dt)->child; dn != NULL; dn = (dn)->sibling )
 
 /* Helper to read a big number; size is in cells (not bytes) */
 static inline u64 dt_read_number(const __be32 *cell, int size)
-- 
2.34.1


