Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7A991A73F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 15:02:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750077.1158339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMoku-0000nP-2N; Thu, 27 Jun 2024 13:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750077.1158339; Thu, 27 Jun 2024 13:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMokt-0000ky-Vn; Thu, 27 Jun 2024 13:01:39 +0000
Received: by outflank-mailman (input) for mailman id 750077;
 Thu, 27 Jun 2024 13:01:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mtIW=N5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sMoks-0000ks-Eb
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 13:01:38 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 634e4cd6-3485-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 15:01:37 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57a30dbdb7fso1901412a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 06:01:37 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d7c957esm57170966b.197.2024.06.27.06.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 06:01:35 -0700 (PDT)
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
X-Inumbo-ID: 634e4cd6-3485-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719493296; x=1720098096; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a+kItBAO12x8RhBAOJkTNenPSO8QMIo1tK5fVas/ZLI=;
        b=J3UskVdH/TUiwAefh8Upkeclh6YxAaGNuTijZXbhRG+XMJTKdOkhN462kO/VZWN4jL
         ySTygvoupLif2Ot691GhFa5SVU9QLI3WVVhXEuFte3H9KahfmiNpp7QRAL+qVPRIO8UH
         zy/RndJST0eRygxt9+uKB+wOUNmTD0HxEHBrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719493296; x=1720098096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+kItBAO12x8RhBAOJkTNenPSO8QMIo1tK5fVas/ZLI=;
        b=LuxHVCGgXFqCmoGEIDHg3l1167/bME0P6OslTU5YYD4CJHZ6qB3zusNgKuAOWtKaHV
         /8boMagdbGb7ndy0h0si03nxPPzTuyrLpscZVkZMR3PId9fNfg24ADoga0YkkrX3kEF5
         hxLAbOrbOew6oVkQju3IlSx13ykrozH+awOCv+wKsQ3J0RpY8UQow+rdl1qGRT5WRAjA
         HBBltnps0nIlbT+ezqT1ra0pQIhfvMAJxahftznACOFYBzfiPbFUdS4rTgamISH7TpZz
         UU9Ovv4HmzHgtFXGvDQAPOt4HOJa7r4j0QQ7zYEWN+Y3MPb4X04A3Lm1dt+ZaoKU77y+
         UH8g==
X-Gm-Message-State: AOJu0Yxp6h6efBJrPrvL4qH0/VuQn2OdzA1KI62+3bTYFDxXAa4H0V0O
	6nOIu6gDJfDN/mKaNcea6Bww1mxjx7SuYuUdaC2jqU4LGM3Nj7ZmfEETIjBjvMvwHhSWMEHKZTV
	e5Dw=
X-Google-Smtp-Source: AGHT+IGooD6wGGQl3UGCys3ZS9wxE2ty/uX483AoPy48a58JnD9AzLZ7ghUdBjZnC/PwO/ZBhAhOGA==
X-Received: by 2002:a17:906:c243:b0:a6f:569b:3ff0 with SMTP id a640c23a62f3a-a7242c39c0cmr908875166b.26.1719493296278;
        Thu, 27 Jun 2024 06:01:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19] tools/dombuilder: Correct the length calculation in xc_dom_alloc_segment()
Date: Thu, 27 Jun 2024 14:01:34 +0100
Message-Id: <20240627130134.1006059-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xc_dom_alloc_segment() is passed a size in bytes, calculates a size in pages
from it, then fills in the new segment information with a bytes value
re-calculated from the number of pages.

This causes the module information given to the guest (MB, or PVH) to have
incorrect sizes; specifically, sizes rounded up to the next page.

This in turn is problematic for Xen.  When Xen finds a gzipped module, it
peeks at the end metadata to judge the decompressed size, which is a -4
backreference from the reported end of the module.

Fill in seg->vend using the correct number of bytes.

Fixes: ea7c8a3d0e82 ("libxc: reorganize domain builder guest memory allocator")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony@xenproject.org>
CC: Juergen Gross <jgross@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For 4.19: This was discovered when trying to test Daniel's gzip cleanup for
Hyperlaunch.  It's a subtle bug, hidden inside a second bug which isn't
appropriate content for 4.20.
---
 tools/libs/guest/xg_dom_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/guest/xg_dom_core.c b/tools/libs/guest/xg_dom_core.c
index c4f4e7f3e27a..f5521d528be1 100644
--- a/tools/libs/guest/xg_dom_core.c
+++ b/tools/libs/guest/xg_dom_core.c
@@ -601,7 +601,7 @@ int xc_dom_alloc_segment(struct xc_dom_image *dom,
     memset(ptr, 0, pages * page_size);
 
     seg->vstart = start;
-    seg->vend = dom->virt_alloc_end;
+    seg->vend = start + size;
 
     DOMPRINTF("%-20s:   %-12s : 0x%" PRIx64 " -> 0x%" PRIx64
               "  (pfn 0x%" PRIpfn " + 0x%" PRIpfn " pages)",
-- 
2.39.2


