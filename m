Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A627F71F9C2
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 07:50:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542926.847382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4xfN-0005Cb-Un; Fri, 02 Jun 2023 05:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542926.847382; Fri, 02 Jun 2023 05:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4xfN-0005Aj-R9; Fri, 02 Jun 2023 05:49:37 +0000
Received: by outflank-mailman (input) for mailman id 542926;
 Fri, 02 Jun 2023 05:49:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dv8B=BW=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1q4xfM-0004uv-Qz
 for xen-devel@lists.xen.org; Fri, 02 Jun 2023 05:49:36 +0000
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [2607:f8b0:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ecb3489-0109-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 07:49:32 +0200 (CEST)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6af6df7f93aso1577128a34.0
 for <xen-devel@lists.xen.org>; Thu, 01 Jun 2023 22:49:32 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 r14-20020a62e40e000000b0063b7a0b9cc5sm202964pfh.186.2023.06.01.22.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 22:49:30 -0700 (PDT)
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
X-Inumbo-ID: 3ecb3489-0109-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685684971; x=1688276971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+pJJng5fx4kFKejzKmDNFo2NgoyulchHXsMzQ/yQ64=;
        b=GeoQ7drCwRTbT9YQXikTijbbCD21G4p5krtLy9rertAbvNElam6icECXzLQAMPNc7u
         2gbzDbe5LySEEf7M2NMey1MFdwYnAAw/GC24PKEJqC/DCKOBcaXC1uAORwChLGrT3lBc
         ivXFS9t/y8RLf/IbYCkozIevnHHzUT+Fcj/hPwbHW7l5qmEMyBuOJVHCvYReNhMyTKKe
         efC7E4nOL/xL2nltdLfwqp75ZZ4FO0Oe8BuZ7dH8nygR1JcacJJtAMoCSxUfIzNQwdg+
         XcRZp/CCNcuEUUXmXNcM+NtTePP94ekZrH6V4BNoSYeEbkTCxqmJBVBpleNXQDjI288h
         hdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685684971; x=1688276971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+pJJng5fx4kFKejzKmDNFo2NgoyulchHXsMzQ/yQ64=;
        b=UA2d92D/x2WLFXF1M5NS4KHiU62n+P8DhBm5GhiIG23AtTILZtuZzJSHtCT6hT8dwq
         zQaOi6W5MSYZ4Djc6qj0bpLzeNdcghdhLaCAUF6rbXulsB/Q0whc8Q/TT3YbkGMwR0ub
         UyYkX9hqQjixR3SsmKpGFE/QYtwyEh0UCP3W3AK5tw2dRk9W5BHaVtGEzGEWJHYpr6Jq
         pbNQpV3/azNpYw3NMyZ5ivLQgtq/jPpngj/VB76QrbtlQ+327iT8H5uCCSzfhrI6/2Ox
         XZusFl4AzQISklTD2+AEavovjeZUtxUoExBtZ8eC5B8veQMCOcMCG3WsQMPTrEIOv8Ba
         X6cw==
X-Gm-Message-State: AC+VfDwiF86VP/JHtKwtC4VrcdYcEpQBQhq+K+hik7QX8sTtr+P3dHed
	+bwITWPWYuL/JbaocwN4x70EW+UcNW18NTu8f+0=
X-Google-Smtp-Source: ACHHUZ4ugx2VyoJYBxh6uY8zyuOFk/yvO4vMH2g4Zrzo6rhpAQk/BVCNJXcg9q+OlOuAXFll5Q5Bqw==
X-Received: by 2002:a9d:77c5:0:b0:6a6:6121:dc60 with SMTP id w5-20020a9d77c5000000b006a66121dc60mr1478045otl.10.1685684971046;
        Thu, 01 Jun 2023 22:49:31 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: [PATCH V3 1/3] libxl: virtio: Remove unused frontend nodes
Date: Fri,  2 Jun 2023 11:19:07 +0530
Message-Id: <fef3d3ca5b2c78eaf85e907f03561e82a05fdeb6.1685684586.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1685684586.git.viresh.kumar@linaro.org>
References: <cover.1685684586.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only the VirtIO backend will watch xenstore to find out when a new
instance needs to be created for a guest, and read the parameters from
there. VirtIO frontend are only virtio, so they will not do anything
with the xenstore nodes. They can be removed.

While at it, also add a comment to the libxl_virtio.c file.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_virtio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
index faada49e184e..f8a78e22d156 100644
--- a/tools/libs/light/libxl_virtio.c
+++ b/tools/libs/light/libxl_virtio.c
@@ -1,4 +1,9 @@
 /*
+ * Setup VirtIO backend. This is intended to interact with a VirtIO
+ * backend that is watching xenstore, and create new VirtIO devices
+ * with the parameter found in xenstore (VirtIO frontend don't
+ * interact with xenstore.)
+ *
  * Copyright (C) 2022 Linaro Ltd.
  *
  * This program is free software; you can redistribute it and/or modify
@@ -49,11 +54,6 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,
     flexarray_append_pair(back, "type", GCSPRINTF("%s", virtio->type));
     flexarray_append_pair(back, "transport", GCSPRINTF("%s", transport));
 
-    flexarray_append_pair(front, "irq", GCSPRINTF("%u", virtio->irq));
-    flexarray_append_pair(front, "base", GCSPRINTF("%#"PRIx64, virtio->base));
-    flexarray_append_pair(front, "type", GCSPRINTF("%s", virtio->type));
-    flexarray_append_pair(front, "transport", GCSPRINTF("%s", transport));
-
     return 0;
 }
 
-- 
2.31.1.272.g89b43f80a514


