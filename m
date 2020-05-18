Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BE21D6E83
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 03:16:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaUO6-0000ys-8u; Mon, 18 May 2020 01:16:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaUO3-0000wK-UF
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 01:16:11 +0000
X-Inumbo-ID: 0b78a354-98a5-11ea-b07b-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b78a354-98a5-11ea-b07b-bc764e2007e4;
 Mon, 18 May 2020 01:15:21 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id 4so6859085qtb.4
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 18:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ecdUSLx0EkiAamNbQS5sqG5ss0VDCxifhfvPg5x2Guk=;
 b=VrTYroypDCzEoAzWrvBenNTRDz191WXxnoEdPPieqTWm22xBGc37Y6RiZYRQVm9Yus
 kUJSCEh90WgNcgAl2FhQE3TVNiCXBE/giYQpALiaVMgUQ7YvWQrNPPYHCOpz4PFeJ3X+
 M8+a1z0R/r6zPttm3Xz3+VUTv8LifqbGrNnVkJpAjGvoAV8LL+/qfR46ULbW7INe5VFL
 RARdPwfgNMlf0Tm7/WvrAKVcs8AJpLt+hvi0XjVWfPq1i4pwiUReYG6ZIWwfqV7Px/Lt
 zGdYiOn+7SKxCKJAHBy7VN9CO/6JsQa7AETneMYISRBBm2IoCoP0nYR0Xq0u6eXwcoI4
 p9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ecdUSLx0EkiAamNbQS5sqG5ss0VDCxifhfvPg5x2Guk=;
 b=q6BgcUtGKkvFqlg2FWMNEvhHSdlatZhPS+h+u8s9f6tZKtI/20TllsgGlHvAhtD0FQ
 ADoT7c8NM2QKKAcWz0jl+dkDBRvlPKhNLn6JVaim5Rner9Pvf91kXOYrc9eR8DHOOLDr
 pNDynlKJ8542J0k/NI6TJh5TN7uGiplQAqd04b914jaIUrtwPOqWblkgPkyBa69SAQw9
 yAcGoDnlXG2eQvR0F2rOWSFY5BL5JmaAJcb7Gam94/WArWCIijrUqh5oYldnn3JV/nu9
 Ig6eE53MchguepKM/vPxPIozoR7EQkj5wDyZMQKc/GDY+Z4sI8lnUYUgzjhNQ9bPljeL
 +YvQ==
X-Gm-Message-State: AOAM532qAjW1CtEw9HZQ0zZFBCfSPbJnD9Gll4u49d5C7aU+p/ZqqsDf
 u9jplSCgZvcsoVqR8YBN/JX7jeaK
X-Google-Smtp-Source: ABdhPJyF9a8HZCeyrTGOYZghXrrZsAytIyAZoVEMeeHS+bILTEshZd06m0cilmYOf2s0lNKs0XhpLA==
X-Received: by 2002:ac8:554c:: with SMTP id o12mr13445021qtr.89.1589764521229; 
 Sun, 17 May 2020 18:15:21 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:ec68:c92e:af5a:2d3a])
 by smtp.gmail.com with ESMTPSA id l2sm7072864qkd.57.2020.05.17.18.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 18:15:20 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 18/18] libxl: Check stubdomain kernel & ramdisk presence
Date: Sun, 17 May 2020 21:13:53 -0400
Message-Id: <20200518011353.326287-19-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200518011353.326287-1-jandryuk@gmail.com>
References: <20200518011353.326287-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Just out of context is the following comment for libxl__domain_make:
/* fixme: this function can leak the stubdom if it fails */

When the stubdomain kernel or ramdisk is not present, the domid and
stubdomain name will indeed be leaked.  Avoid the leak by checking the
file presence and erroring out when absent.  It doesn't fix all cases,
but it avoids a big one when using a linux device model stubdomain.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

---
Changes in v6:
 - Add Acked-by: Ian Jackson
---
 tools/libxl/libxl_dm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index 098dc49ecb..997c4815e0 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -2336,6 +2336,22 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
         dm_config->num_vkbs = 1;
     }
 
+    if (guest_config->b_info.stubdomain_kernel &&
+        access(guest_config->b_info.stubdomain_kernel, R_OK) != 0) {
+        LOGED(ERROR, guest_domid, "could not access stubdomain kernel %s",
+              guest_config->b_info.stubdomain_kernel);
+        ret = ERROR_INVAL;
+        goto out;
+    }
+
+    if (guest_config->b_info.stubdomain_ramdisk &&
+        access(guest_config->b_info.stubdomain_ramdisk, R_OK) != 0) {
+        LOGED(ERROR, guest_domid, "could not access stubdomain ramdisk %s",
+              guest_config->b_info.stubdomain_ramdisk);
+        ret = ERROR_INVAL;
+        goto out;
+    }
+
     stubdom_state->pv_kernel.path = guest_config->b_info.stubdomain_kernel;
     stubdom_state->pv_ramdisk.path = guest_config->b_info.stubdomain_ramdisk;
 
-- 
2.25.1


