Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 282695A6EA6
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 22:48:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395156.634745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oT89s-0002FB-KK; Tue, 30 Aug 2022 20:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395156.634745; Tue, 30 Aug 2022 20:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oT89s-0002Ci-Fp; Tue, 30 Aug 2022 20:48:28 +0000
Received: by outflank-mailman (input) for mailman id 395156;
 Tue, 30 Aug 2022 20:48:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6c5l=ZC=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oT89q-0002Cc-OJ
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 20:48:26 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1803c121-28a5-11ed-a60c-1f1ba7de4fb0;
 Tue, 30 Aug 2022 22:48:25 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id qh18so4329994ejb.7
 for <xen-devel@lists.xenproject.org>; Tue, 30 Aug 2022 13:48:25 -0700 (PDT)
Received: from uni.. (adsl-47.176.58.181.tellas.gr. [176.58.181.47])
 by smtp.googlemail.com with ESMTPSA id
 j17-20020a17090623f100b0074182109623sm3594527ejg.39.2022.08.30.13.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 13:48:24 -0700 (PDT)
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
X-Inumbo-ID: 1803c121-28a5-11ed-a60c-1f1ba7de4fb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=QlxW8fxVxO+DakXYQ5ScpHK2jDTcDSsFw0JIb0kLB2g=;
        b=RYKuBA/L4kTdkOMKoagUGEzUbqT8LDfmIcL4xCfdJ5yBbuf9aazz3UwPCxMe8TO1fO
         dDtzJnDliA+j5vm6IQzhWWymKDIboyK6v3GoGUkTjA5MJcKuglgcyGeGzQlbNCdchNFT
         YZtFEySi02X2xDPudnYZ2yreGk2w6q9GoY4UpMkxGPSnH7lmcxwUMfAD57UNF/EUvAwF
         ucpdy2xnaOgHN96gtY6m/9FaKoSlg2vdPG4rzc1GoGxE28Gg2+ZRRd4IygFJI/FZzSHJ
         +ec/zo7frJ7SkbgjhV6I1Zv9y+aeMYepYQy+i23L1VDc+Wvnle1Qcg6U810WRDlUzSOT
         Hi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=QlxW8fxVxO+DakXYQ5ScpHK2jDTcDSsFw0JIb0kLB2g=;
        b=uoRFmA30bp4SZEzE627hIIvRkJBWFv0zchRCsZq2s6cGLQ6YXkcxm+/jaMUcl5j2Xt
         aEE4NsqJCO4kARUplKOCYUwzSWQsGomJbBlFy8fXyTHyPD+1A4w5WAH7e3H0YFmZJ8wd
         0brUG/ve7cEDSq3cMQja+91EV6j81kbm53l5cBaqBAmQmJcZGd8j+5hchTpgU46rg0oP
         8yI0+EdHPPZu37k7o75pb69oBAGoJCYC9pzmR+EM3mImRewqNnE08urPLdNatPBAy/fv
         LI+VlRWyXwrliv2njgAuGLrl5fo4wrWXavCSxL4vrJpUH4lSLKRhCggun/BrrTm46ii3
         /a3w==
X-Gm-Message-State: ACgBeo3Re3+68apwsj6qv8yJ43wSciECpf9oQsJDgs9N6Ssy3kt2lbGm
	zTAV3Ab+Y85onWkC3uNmrOK0mIEbDyM=
X-Google-Smtp-Source: AA6agR5rf3UuGZBEchVthOgkTUUc10jQ7Fa3Gp2209wD4YCC5/XU1cEqVOORpYYpLx2yT1mZXcP9UQ==
X-Received: by 2002:a17:906:8b81:b0:733:183b:988e with SMTP id nr1-20020a1709068b8100b00733183b988emr17995652ejc.457.1661892505105;
        Tue, 30 Aug 2022 13:48:25 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v2] xen/device_tree: Fix MISRA C 2012 Rule 20.7 violations
Date: Tue, 30 Aug 2022 23:48:18 +0300
Message-Id: <20220830204818.1374930-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add parentheses around the macro parameters that are used as expressions
to prevent against unintended expansions during macro substitution.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
- apply rule 20.7 as is, without deviating from it
- adjust commit message accordingly

Also, in this file, the macro dt_irq(irq) has not been defined properly but
since it is not used, the bug has not been uncovered yet.
I can either fix it or remove it along with macro dt_irq_flags(irq) under
rule 2.5 "A project should not contain unused macro declarations" (advisory)

 xen/include/xen/device_tree.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 430a1ef445..6e253f5763 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -37,11 +37,11 @@ struct dt_device_match {
     const void *data;
 };
 
-#define __DT_MATCH_PATH(p)              .path = p
-#define __DT_MATCH_TYPE(typ)            .type = typ
-#define __DT_MATCH_COMPATIBLE(compat)   .compatible = compat
+#define __DT_MATCH_PATH(p)              .path = (p)
+#define __DT_MATCH_TYPE(typ)            .type = (typ)
+#define __DT_MATCH_COMPATIBLE(compat)   .compatible = (compat)
 #define __DT_MATCH_NOT_AVAILABLE()      .not_available = 1
-#define __DT_MATCH_PROP(p)              .prop = p
+#define __DT_MATCH_PROP(p)              .prop = (p)
 
 #define DT_MATCH_PATH(p)                { __DT_MATCH_PATH(p) }
 #define DT_MATCH_TYPE(typ)              { __DT_MATCH_TYPE(typ) }
@@ -222,13 +222,13 @@ dt_find_interrupt_controller(const struct dt_device_match *matches);
 #define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
 
 #define dt_for_each_property_node(dn, pp)                   \
-    for ( pp = dn->properties; pp != NULL; pp = pp->next )
+    for ( (pp) = (dn)->properties; (pp) != NULL; (pp) = (pp)->next )
 
 #define dt_for_each_device_node(dt, dn)                     \
-    for ( dn = dt; dn != NULL; dn = dn->allnext )
+    for ( (dn) = (dt); (dn) != NULL; (dn) = (dn)->allnext )
 
 #define dt_for_each_child_node(dt, dn)                      \
-    for ( dn = dt->child; dn != NULL; dn = dn->sibling )
+    for ( (dn) = (dt)->child; (dn) != NULL; (dn) = (dn)->sibling )
 
 /* Helper to read a big number; size is in cells (not bytes) */
 static inline u64 dt_read_number(const __be32 *cell, int size)
-- 
2.34.1


