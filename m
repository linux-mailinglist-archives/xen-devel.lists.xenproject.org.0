Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677FE6FED24
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 09:52:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533153.829569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px154-0007RN-Op; Thu, 11 May 2023 07:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533153.829569; Thu, 11 May 2023 07:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px154-0007O3-Lt; Thu, 11 May 2023 07:51:18 +0000
Received: by outflank-mailman (input) for mailman id 533153;
 Thu, 11 May 2023 07:51:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sau0=BA=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1px153-0007Nw-9Z
 for xen-devel@lists.xen.org; Thu, 11 May 2023 07:51:17 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99036cba-efd0-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 09:51:12 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1aaff9c93a5so57386245ad.2
 for <xen-devel@lists.xen.org>; Thu, 11 May 2023 00:51:12 -0700 (PDT)
Received: from localhost ([122.172.82.60]) by smtp.gmail.com with ESMTPSA id
 j2-20020a170902758200b001ac896ff65fsm5144181pll.129.2023.05.11.00.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 00:51:09 -0700 (PDT)
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
X-Inumbo-ID: 99036cba-efd0-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683791471; x=1686383471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aWX/tOsVsEtkoqeLFA/4H0fxG7drSPfnFrsi/yft9nk=;
        b=uSVL3Py0aLkaNBTw9FHgYM7y5E84S4h/p1nFqlFGXVMkENI/OnV2RIm/h6frcuZvHR
         pXNc/Qd0BuEj8CrWythHO7l/EEfux9SuPz6pYgXXjm96VxisbaWQ5ncIfo8FkBX4b6Ur
         FrjAq/rbdmiftXxGnO+IIhF/zNJrO6Sxn9bmdY6ZiWO6EvY9J68xqCSVC9CFIoRHpARZ
         jfGbCBK0j/zMfP9Nb6mY9VobrQe5gk+wgnVF8qxSjnLSRdHVOpCE3FQXMUirtoy5fM5L
         fZII/A2Oo2XkndmpfMIQd/YCQunfjAi0LpFKX/o/2b0KjpWMlPD4VWALIf5Ql2cXipeA
         PgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683791471; x=1686383471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWX/tOsVsEtkoqeLFA/4H0fxG7drSPfnFrsi/yft9nk=;
        b=BiTOu3kBDc4jjgUGskBYu1ym/blxBbuvdMMEsq+BX61Wk7edMj1tVKGMRdv8ySKgIr
         oQVeRrmx80ISbmLwmao429hMGcs4N3tZGXFKjJu8W8sNfdMBIV3T6SGMwD1DzHD3GNd8
         3AsXqioC23/XMSYCC5ei8cbHV4GjKmDrxKMrxmhcBF6SlWq5yW/dsZ33RpYpawR8SyEm
         kwX3EMSvZCYss4UVgzCFZP2I4CsClz6FxYIkkhsvfrBgli7ZS10YOem0T6vZqMfaxqCQ
         xXNH7P5uRY+syVL0a5gihW1DAln4Hn8C8ud9Y41EpLl2sZwWGtpyA+Lr94edQMAE8xPZ
         9uJQ==
X-Gm-Message-State: AC+VfDwWbrK4tg6HkRjFRYSi/mr/eT4iQ7O+GZnGFQIMj4Hht7fh0NNG
	rTgB8G8J7DACrSahffjLdFF+jRzbVCP/DCIPBh0=
X-Google-Smtp-Source: ACHHUZ78ILZjWhXb/mHUt3PGSf2iMh04Zwf75sm+x2jw+gjomsP7xSJ+oO63Kzf69q6bjBDdUJ00eQ==
X-Received: by 2002:a17:902:d509:b0:1a6:51a6:ca76 with SMTP id b9-20020a170902d50900b001a651a6ca76mr25596760plg.11.1683791471177;
        Thu, 11 May 2023 00:51:11 -0700 (PDT)
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
Subject: [PATCH V2 1/2] libxl: virtio: Remove unused frontend nodes
Date: Thu, 11 May 2023 13:20:42 +0530
Message-Id: <782a7b3f54c36a3930a031647f6778e8dd02131d.1683791298.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The libxl_virtio file works for only PV devices and the nodes under the
frontend path are not used by anyone. Remove them.

While at it, also add a comment to the file describing what devices this
file is used for.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2: New patch.

 tools/libs/light/libxl_virtio.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
index faada49e184e..eadcb7124c3f 100644
--- a/tools/libs/light/libxl_virtio.c
+++ b/tools/libs/light/libxl_virtio.c
@@ -10,6 +10,9 @@
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU Lesser General Public License for more details.
+ *
+ * This is used for PV (paravirtualized) devices only and the frontend isn't
+ * aware of the xenstore.
  */
 
 #include "libxl_internal.h"
@@ -49,11 +52,6 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,
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


