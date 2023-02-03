Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2211368A2A5
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 20:10:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489350.757719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pO1RC-00049o-7Z; Fri, 03 Feb 2023 19:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489350.757719; Fri, 03 Feb 2023 19:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pO1RC-00047h-4R; Fri, 03 Feb 2023 19:09:30 +0000
Received: by outflank-mailman (input) for mailman id 489350;
 Fri, 03 Feb 2023 19:09:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S4sJ=57=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pO1RA-0003dr-E0
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 19:09:28 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45a10fd6-a3f6-11ed-93b5-47a8fe42b414;
 Fri, 03 Feb 2023 20:09:24 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id fi26so6132805edb.7
 for <xen-devel@lists.xenproject.org>; Fri, 03 Feb 2023 11:09:24 -0800 (PST)
Received: from uni.router.wind (adsl-160.109.242.226.tellas.gr.
 [109.242.226.160]) by smtp.googlemail.com with ESMTPSA id
 q24-20020aa7cc18000000b0049e19136c22sm1517393edt.95.2023.02.03.11.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 11:09:23 -0800 (PST)
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
X-Inumbo-ID: 45a10fd6-a3f6-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nf5jDFa5dOtO540IqofRXSKEY5a9ibf50gjNmqYzwIY=;
        b=QbS8zg5lOalxJw1+0MhIyWOGsMVXvNY6/YzdygKPF1a7uZsFzpYYrwSEQPd+y3uGxf
         bu7paLwDkoMCv6Leq0WGdl0GHu6qq0lnyncDrwRE9dWgSVioIle0JCvCSdfMbOJRwxUm
         X8UGuF2NcaGqD5svJHGibr3z26ciQJ94hdrLwtCiKCf0fPxb55AJMo6crTN4oDwsWCth
         0uzJUoJCU15ILyYqXnnFK+e33/bIu4janN34aTpZdD0IIf6h81LMLQMYIXuUQuqmCp/3
         gqE84p5sJUo44k3AgXBoIm14O4vsXqLXr83EDceLeR2kH4T0t3c+3RkgHDan3UFo9EE1
         H1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nf5jDFa5dOtO540IqofRXSKEY5a9ibf50gjNmqYzwIY=;
        b=qGYmcbxZkccNLoCQn7fTSoVqvvraNkBhL3dfJTzY5PUusX6VtawVdkF8dzogK6dki9
         xxnlGCEvvznbfasKBwjyNhZKe+WKUa1+MwyKyf4pxNhHlnov4jz5xEaCUjyZCVsueDVT
         JN5E2Qt5iGCu+jh9UKlqmj0xNiWlU59nJut0x1HpqjG4A3f6ccv9TtZrCCKJbtXZbXOj
         L8TagfGeWT0+n2AKdVUqCIV5p0DvxRsU7XFfsPZsH82YtEgLWgmaf/daPdkp9ttLXTJa
         afwgDRxCg6qVYZEUcOqxw6i56vNDYprNkRc6RJOjVXWvU6OOKQ4fnaL37ttZi7C+UuDJ
         +fgA==
X-Gm-Message-State: AO0yUKXHT6oalDV8e9XvVCcEWIeS6UpvD5MDCyWNL4odEfbtH13ZQkAO
	Z2sfeTurM5oUV7b8zWC+5QHo2ZnEe10=
X-Google-Smtp-Source: AK7set8vZpdvQrfLeDqthMRygbp3lHm+1RJvh2Ij9g1JHs/lBRUhGNC4WAH5UNtiHjteRytANu9K1A==
X-Received: by 2002:a05:6402:520e:b0:4a0:8ea1:cce with SMTP id s14-20020a056402520e00b004a08ea10ccemr14476060edd.25.1675451364002;
        Fri, 03 Feb 2023 11:09:24 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v3 1/2] xen/device_tree: fix Eclair findings for MISRA C 2012 Rule 20.7
Date: Fri,  3 Feb 2023 21:09:07 +0200
Message-Id: <20230203190908.211541-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230203190908.211541-1-burzalodowa@gmail.com>
References: <20230203190908.211541-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - the fixes are based solely to Eclair findings (the tool has been
    adjusted to report only those violations that can result to a bug)
  - reflect this in the commit title

 xen/include/xen/device_tree.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index a28937d12ae8..7839a199e311 100644
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
@@ -226,13 +226,13 @@ dt_find_interrupt_controller(const struct dt_device_match *matches);
 #define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
 
 #define dt_for_each_property_node(dn, pp)                   \
-    for ( pp = dn->properties; pp != NULL; pp = pp->next )
+    for ( pp = (dn)->properties; (pp) != NULL; pp = (pp)->next )
 
 #define dt_for_each_device_node(dt, dn)                     \
-    for ( dn = dt; dn != NULL; dn = dn->allnext )
+    for ( dn = dt; (dn) != NULL; dn = (dn)->allnext )
 
 #define dt_for_each_child_node(dt, dn)                      \
-    for ( dn = dt->child; dn != NULL; dn = dn->sibling )
+    for ( dn = (dt)->child; (dn) != NULL; dn = (dn)->sibling )
 
 /* Helper to read a big number; size is in cells (not bytes) */
 static inline u64 dt_read_number(const __be32 *cell, int size)
-- 
2.37.2


