Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D66D7732E2
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 00:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578964.906705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT8ZA-0004Sz-Pl; Mon, 07 Aug 2023 22:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578964.906705; Mon, 07 Aug 2023 22:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT8ZA-0004Rb-MP; Mon, 07 Aug 2023 22:19:08 +0000
Received: by outflank-mailman (input) for mailman id 578964;
 Mon, 07 Aug 2023 22:19:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5n3t=DY=exostellar.io=kevin@srs-se1.protection.inumbo.net>)
 id 1qT8Z9-0004RV-6k
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 22:19:07 +0000
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [2607:f8b0:4864:20::f34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b71ed87-3570-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 00:19:05 +0200 (CEST)
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-63cfd68086dso28200326d6.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 15:19:05 -0700 (PDT)
Received: from kevinnegy-MS-7B85.home
 (2603-7081-7e3f-df30-ac18-f9bd-4af9-8893.res6.spectrum.com.
 [2603:7081:7e3f:df30:ac18:f9bd:4af9:8893])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a0c9a44000000b006300e92ea02sm3230906qvd.121.2023.08.07.15.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 15:19:02 -0700 (PDT)
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
X-Inumbo-ID: 6b71ed87-3570-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exostellar.io; s=google; t=1691446744; x=1692051544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B5ddogz6ssKMprKcwC91sbBtEGvoKYSyZ4oIHsEh4mw=;
        b=cKjCQ7f4JoSJKyQusI8TZiu6fHU9zW8df5m/ibDZJPVZC334HFJDs1v6xqE60+x+DC
         PK4HfOpskRZaL4RSYrr5ocwi2epEbU5H+DexlwwBVyt7vJnSg2gCYCHg9FUwGP+fW0zH
         l/L6fKZCJUraHlxYoweP2m31dHrBSQ9zAxlu3tr/yjRCZJDVyiDVQaY5x4qoEyzw2zza
         zSmrdtXeqFvw7AAavaHJaLx/yj8xvgQ77Bd5XCXmXWq6+ejrEQWDgzIEnKRJo/m1cecQ
         zLHELV1b+oW670MyO7T+AsgujIUr2R/d1I0SgdcO9UHSZX0g+LKJWvCqIBAuYcuTije1
         wjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691446744; x=1692051544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5ddogz6ssKMprKcwC91sbBtEGvoKYSyZ4oIHsEh4mw=;
        b=bAAzA2Fu1EkaiZwXcpG7j476y1gQti+JcyDZZuVisYG54zwwri0PV7sEBL+AyIygqr
         LccgVGhNZ5jOgY5xrVz5EUQAoNYLY+9qdS55amzxpGb2LrfOTyHNbQ7WmkA90Tx7G34E
         wrDtmCsJ2lYCgFuEhpVmRlfb3rS6TuutZY6r3sPE8fos+k1zgw3KDP5MDC8fcTBc5wjQ
         q1LBmvKuAD7xKDvSm9jz81Z5Iq/VR8lnRPnC1NgrTIFT/lMXqJDKJGn3hSzUavYlChRd
         2zmXd51ROfQSIG1idUrxyIs0acgGMImwea8/5wCcP52OgrK9ScwM4P5/h+r66YtpCynh
         P+VA==
X-Gm-Message-State: AOJu0Yx05LySNxQlN8RTS2X76BgV9qObeuRgaVG0/8WFVElOBhHW5Pd7
	5piGS4KRLW4x8DOqvEhXgKnKGdhyogu0iX03UPEYLdWx
X-Google-Smtp-Source: AGHT+IFAwmFoA8RdUNOlqqGfSxJVgXRlmAojWIbMmWVZLFCbiV6pJYC9V/5ee+kYdfKjeJPA4iXp+g==
X-Received: by 2002:a0c:df8f:0:b0:63d:318c:7e0d with SMTP id w15-20020a0cdf8f000000b0063d318c7e0dmr10300369qvl.45.1691446743781;
        Mon, 07 Aug 2023 15:19:03 -0700 (PDT)
From: Kevin Alarcon Negy <kevin@exostellar.io>
To: xen-devel@lists.xenproject.org
Cc: Kevin Alarcon Negy <kevin@exostellar.io>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH RESEND] libxl: Make domain build xc_domain_setmaxmem() call use max_memkb
Date: Mon,  7 Aug 2023 18:16:10 -0400
Message-Id: <e7ab0b64b8dce1ca5b71b3f75f7bce6d4824d2ed.1691446380.git.kevin@exostellar.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building a domain, xc_domain_setmaxmem() is called with target_memkb (memory in domain config file).
If a config specifies maxmem > memory, any attempts to increase the domain memory size to its max,
outside of xl mem-set or xl mem-max, which already call xc_domain_setmaxmem() properly, will fail.
Changed xc_domain_setmaxmem() call inside libxl__build_pre() to use max_memkb.

Signed-off-by: Kevin Alarcon Negy <kevin@exostellar.io>
---
 tools/libs/light/libxl_dom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 94fef37401..16aa255aad 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -355,7 +355,7 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
         return ERROR_FAIL;
     }
 
-    if (xc_domain_setmaxmem(ctx->xch, domid, info->target_memkb + size) < 0) {
+    if (xc_domain_setmaxmem(ctx->xch, domid, info->max_memkb + size) < 0) {
         LOGE(ERROR, "Couldn't set max memory");
         return ERROR_FAIL;
     }
-- 
2.25.1


