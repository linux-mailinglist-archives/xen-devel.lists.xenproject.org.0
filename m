Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F35BC1E838F
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 18:22:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jehmO-00067W-Rr; Fri, 29 May 2020 16:22:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U2UY=7L=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jehmN-00067R-Lf
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 16:22:43 +0000
X-Inumbo-ID: 9f941326-a1c8-11ea-8993-bc764e2007e4
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f941326-a1c8-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 16:22:43 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id w4so3090107oia.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2020 09:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3Fg0rrM7+ln+XqJgJiVqac7czaLMntvGuEOYTNHktkI=;
 b=ZhavIuKTFVV6ev207J3C345uY8iNeT4+Sr6NNp4U+FDt+DL8ea660azh03fumFDCOq
 4nIrNIIJhoSeYwgLzcuHClSRTefBGPwhEita1r+08/LTdJ9+fJWS38LPX/0KlK9QnPbF
 Z4ONcl4Iiqfy9ti+Q/lIGPbeJWvIHN6qx4iZ27+Ml8ltzYTHbS5qNdSdp7vZvp847+ne
 BVVmADmWb2I6AyA70hcwCY8jYIxO7qQgK0ZxdObyayCzqAqJjrfcWl2JT7nl/0PD0UZH
 XliT6HA6HuOr1mGAjrL9OQ2/klsho8nPwr6FL/OGuFjK8J/hHxyZCsRDMXlQGgf8h7tJ
 wfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3Fg0rrM7+ln+XqJgJiVqac7czaLMntvGuEOYTNHktkI=;
 b=Ptt/hsuuXmTqs8n+KsuF+hHCGYk6QCCFmrZewl21CXfj8aFRMixlB7oUgb8ptTL548
 Rxt+8opqg2yijdV93TmoA0MgXwBKo8nb7VLcjdIv/fzQJyiQDjMy09a+7T/s83Hha25a
 rVDgnob2tanAvZUKc9DfbhAl5/jZ4YieHjIgl8BW1TakvWNJOMg3jcl2mK3TErY0f+rZ
 bfx7xbMz4oPJU1HHP3dxWmbQozDTm7Elox787+G8DZ1apFqDS6P7YtQNwcuJPel7ESfj
 mTWw5Cj17MNc93OwVkl2fQ7AbxqrgJr1UVesj8oqiK8XU5UUeww1yM+YIW+hyQpMWI97
 Uccw==
X-Gm-Message-State: AOAM532c/EGY9v8qyOMH4IrG7rN1xsO4BLvPETHCSLheWD0Z34/sMrJj
 2L4JfGFSp2sS/VSSFnrkfjgNb09ou8k=
X-Google-Smtp-Source: ABdhPJywU00eYjcmhRsCu/lkigi4LaEqjW2ZrgqQ0Q+Ct/rP1p9cVAZmXdDdb9l0vGGeuZ/FhIjqGQ==
X-Received: by 2002:aca:b585:: with SMTP id e127mr622601oif.52.1590769357368; 
 Fri, 29 May 2020 09:22:37 -0700 (PDT)
Received: from localhost (c-71-205-12-124.hsd1.co.comcast.net. [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id 89sm2599596oth.9.2020.05.29.09.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 09:22:36 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 for-4.14] tools/libxl: fix setting altp2m param broken by
 1e9bc407cf0
Date: Fri, 29 May 2020 10:22:34 -0600
Message-Id: <20200529162234.16824-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.26.2
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The patch 1e9bc407cf0 mistakenly converted the altp2m config option to a
boolean. This is incorrect and breaks external-only usecases of altp2m that
is set with a value of 2.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
v2: just convert bool to unsigned int
---
 tools/libxl/libxl_x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libxl/libxl_x86.c b/tools/libxl/libxl_x86.c
index f8bc828e62..e57f63282e 100644
--- a/tools/libxl/libxl_x86.c
+++ b/tools/libxl/libxl_x86.c
@@ -391,7 +391,7 @@ static int hvm_set_conf_params(libxl__gc *gc, uint32_t domid,
     libxl_ctx *ctx = libxl__gc_owner(gc);
     xc_interface *xch = ctx->xch;
     int ret = ERROR_FAIL;
-    bool altp2m = info->altp2m;
+    unsigned int altp2m = info->altp2m;
 
     switch(info->type) {
     case LIBXL_DOMAIN_TYPE_HVM:
-- 
2.26.2


