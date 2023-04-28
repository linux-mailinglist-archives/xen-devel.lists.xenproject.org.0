Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F946F15E1
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 12:41:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527254.819688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psLXs-0003GX-4t; Fri, 28 Apr 2023 10:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527254.819688; Fri, 28 Apr 2023 10:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psLXs-0003Dz-1l; Fri, 28 Apr 2023 10:41:44 +0000
Received: by outflank-mailman (input) for mailman id 527254;
 Fri, 28 Apr 2023 10:41:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19My=AT=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1psLXq-0002tZ-Jf
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 10:41:42 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42a65b98-e5b1-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 12:41:41 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f19ab99540so72951255e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Apr 2023 03:41:41 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5246000000b002e71156b0fcsm20930378wrc.6.2023.04.28.03.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 03:41:39 -0700 (PDT)
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
X-Inumbo-ID: 42a65b98-e5b1-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682678500; x=1685270500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOzH/Me/kjor0auj5RRaJFlmWnO3/lLM0su8aCzstvk=;
        b=NHaNEcfqmhBB0K7GuSC9Ddm33qSow+5NVzw8VxsQR8/bNACoaK60FKoMk/zqilpjUw
         DlUTFZHePTkE/J3qQtaXJXc8U3vWhWS/6eAIuVgT6P6a5bVghUv8buhL7e8Wguisqm3d
         sg6U4Kc/diktbkSax4XkwCzQN0DdCJuE+V5b8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682678500; x=1685270500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOzH/Me/kjor0auj5RRaJFlmWnO3/lLM0su8aCzstvk=;
        b=b0SQkHBBJtBUk52f2BIgfTzYywU0PquHTBeWM0qetgZfWFpJ967Gtu2sehg6rNtgUs
         mzMDVzQQNPcHJn03iaKRAUkIkABDeOCBNBtbSH4wEDDBdGz02PSaNEI60Px4RxgC3cRM
         4hi5MvgDUi+Vw18c/tM7wOqPTrBCdYIDYutrHU0+K701GxSio5CsXJl/dtr6yG07+wXS
         5Lyn8uXgCMuL3ZJU85CXM2N4GHEknHxB6fcPK3BJXY2G4igifs9TXGoXyrlhq9mC7ZG0
         3j3JCfR6at0lqcErYKcULJgytl1BPSq85LVTKtGY/xQbpn0sc05m1v/Xq4gciJ3qltTu
         KvsA==
X-Gm-Message-State: AC+VfDzqGgM7T9BLbTHhzUUrd1HNLVVSe2pUiLu4bCozkkBrqTUkyBJ3
	0GfU3k6pwnD2cgvUcwb9fJ3h5l5oyYXXIG15Rps=
X-Google-Smtp-Source: ACHHUZ7T9It8+eIvsRC61MTZIGXGbVOGfPIJ8eeWPp+1eUO3RxQkCwYc4oL4qaOxLg5L5AMyeGJBIQ==
X-Received: by 2002:a5d:58d2:0:b0:2f4:215a:98c5 with SMTP id o18-20020a5d58d2000000b002f4215a98c5mr3211610wrf.70.1682678500025;
        Fri, 28 Apr 2023 03:41:40 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.org>
Subject: [PATCH v2 4/7] tools: Make init-xenstore-domain use xc_domain_getinfolist()
Date: Fri, 28 Apr 2023 11:41:21 +0100
Message-Id: <20230428104124.1044-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
References: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It currently relies on xc_domain_getinfo() returning the next available
domain past "first_domid", which is a feature that will disappear in a
future patch.

Furthermore and while at it, make it so the hypercall tries to fetch information
about more than one domain per hypercall so we can (hopefully) get away with a
single hypercall in a typical system.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Juergen Gross <jgross@suse.org>
---
 tools/helpers/init-xenstore-domain.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 0950ba7dc5..e210a2677e 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -13,6 +13,7 @@
 #include <xentoollog.h>
 #include <libxl.h>
 #include <xen/sys/xenbus_dev.h>
+#include <xen-tools/common-macros.h>
 #include <xen-xsm/flask/flask.h>
 #include <xen/io/xenbus.h>
 
@@ -322,16 +323,19 @@ err:
 
 static int check_domain(xc_interface *xch)
 {
-    xc_dominfo_t info;
+    xc_domaininfo_t info[8];
     uint32_t dom;
     int ret;
 
     dom = 1;
-    while ( (ret = xc_domain_getinfo(xch, dom, 1, &info)) == 1 )
+    while ( (ret = xc_domain_getinfolist(xch, dom, ARRAY_SIZE(info), info)) > 0 )
     {
-        if ( info.xenstore )
-            return 1;
-        dom = info.domid + 1;
+        for ( size_t i = 0; i < ret; i++ )
+        {
+            if ( info[i].flags & XEN_DOMINF_xs_domain )
+                return 1;
+        }
+        dom = info[ret - 1].domain + 1;
     }
     if ( ret < 0 && errno != ESRCH )
     {
-- 
2.34.1


