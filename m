Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C488574004F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 18:07:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556196.868520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEBDk-00064Y-L2; Tue, 27 Jun 2023 16:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556196.868520; Tue, 27 Jun 2023 16:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEBDk-00061E-Hw; Tue, 27 Jun 2023 16:07:12 +0000
Received: by outflank-mailman (input) for mailman id 556196;
 Tue, 27 Jun 2023 16:01:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G3wH=CP=exostellar.io=kevin@srs-se1.protection.inumbo.net>)
 id 1qEB8T-0005ww-0p
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 16:01:45 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e615fb41-1503-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 18:01:39 +0200 (CEST)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-635dccdf17dso21313446d6.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 09:01:39 -0700 (PDT)
Received: from localhost.localdomain
 (2603-7081-7e3f-df30-170b-5a28-3b3f-767c.res6.spectrum.com.
 [2603:7081:7e3f:df30:170b:5a28:3b3f:767c])
 by smtp.gmail.com with ESMTPSA id
 q5-20020ad45ca5000000b00623950fbe48sm4692135qvh.41.2023.06.27.09.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 09:01:36 -0700 (PDT)
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
X-Inumbo-ID: e615fb41-1503-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exostellar.io; s=google; t=1687881697; x=1690473697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B5ddogz6ssKMprKcwC91sbBtEGvoKYSyZ4oIHsEh4mw=;
        b=HN0SiQ1xHT6WpiINAd3P1pCHNKxxIlYRjbfsERYjn2n2xaXW1ILaCv6OGTMoRAeUcb
         BzZyXOcB/o2e9C7Aljgr8zdZjv1DWrfxVjW3Uf+79aonXfZes0WhITisie8qjdwbjIRH
         uTcLHjo7m2KgjIejQ8YQ1SRFO4wwV6B4Mf/a1BuWbvkE+D/QbOwq7MpeOGCgn6IyG/ov
         +++WbF4ieeeDPQvWl7Ngfg0ZmsCrfRYTx4lC3Md/Zl4fwO6ORM/3MM2GtRprnGogi2Gn
         m/jEXjEZnYVIjf/GybIog/nl6N5DgY8ABDoEG0Qv7HUOnDN0eSpOzQ7WRXRdIWj2rC9b
         3SDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687881697; x=1690473697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5ddogz6ssKMprKcwC91sbBtEGvoKYSyZ4oIHsEh4mw=;
        b=KqTbJUvSXPSiaA2JbRRUCfUD/x5p27LimaUvs13/ZVvEAhEfpo1eWmu1Pi5TbsXc+G
         625KO5JtSQBC6ixEtYNYUkVexNAG6Q0/guayHhwsow18BeXr0LBq+GVW/OI1gwqW+Kk3
         ZA+5xEo+CXhTSzJdUrnSebKmPmL0fwtVydr4I596zISj7hBWYv2muUjpRWfvVedS4CKX
         IdGOjf3P9fiMc0sW9Dd4LxhVjQQtIJml++lHi366zmQB/NiEvvKt9iMdGzWYomLjCzxU
         q4OZBU0HAc6spPc+OneiTpiEesotopfr61KDkpXNjkQ5QZ1+sBku0HnkCRIXjcvnGKvk
         zPcA==
X-Gm-Message-State: AC+VfDw2UatXE2YP+XUL+LUHl6AtGLUGJ5MjDrgU6EVBwuaJ4UPtnSEf
	WOUypWQcT3EOAZR76Ytwn211UL7wgUA25i4rYRuw/zbZ
X-Google-Smtp-Source: ACHHUZ6ZRrlWRX6vSh1OFUzWjcypD0RZqkkCTJ9vabGBr4B5qwQ7XYWKdBoLb2ZEBIr1pSF77sD8iw==
X-Received: by 2002:a05:6214:2409:b0:62f:effe:3dca with SMTP id fv9-20020a056214240900b0062feffe3dcamr41454649qvb.2.1687881696648;
        Tue, 27 Jun 2023 09:01:36 -0700 (PDT)
From: Kevin Alarcon Negy <kevin@exostellar.io>
To: xen-devel@lists.xenproject.org
Cc: Kevin Alarcon Negy <kevin@exostellar.io>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libxl: Make domain build xc_domain_setmaxmem() call use max_memkb
Date: Tue, 27 Jun 2023 11:59:34 -0400
Message-Id: <e7ab0b64b8dce1ca5b71b3f75f7bce6d4824d2ed.1687881417.git.kevin@exostellar.io>
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


