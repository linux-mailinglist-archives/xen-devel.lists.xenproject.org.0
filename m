Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1F6A8470A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 16:57:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945823.1343962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tL0-00070G-MT; Thu, 10 Apr 2025 14:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945823.1343962; Thu, 10 Apr 2025 14:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tL0-0006yW-J0; Thu, 10 Apr 2025 14:57:06 +0000
Received: by outflank-mailman (input) for mailman id 945823;
 Thu, 10 Apr 2025 14:47:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nn6J=W4=gmail.com=alex.pentagrid@srs-se1.protection.inumbo.net>)
 id 1u2tBH-0002gy-5x
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 14:47:03 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9269100-161a-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 16:47:01 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-30bee1cb370so7246421fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 07:47:01 -0700 (PDT)
Received: from localhost.localdomain ([79.134.198.58])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f465f77f0sm5397991fa.94.2025.04.10.07.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 07:46:59 -0700 (PDT)
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
X-Inumbo-ID: a9269100-161a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744296421; x=1744901221; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=feZuaxrFBmW/7qEu/+5shM64Px/4u1yOOiSmxUSEtqg=;
        b=J47DkdVUsMqRQ+sec2xapJ2nPzaBDTcGbfA0Lqg+7d1RMHLSoGGmrSwMgsR4szWg2e
         qB1lZRXPo1SOo9zGg6SMbVZwBk5mf5grEgDbmN90dYRt5e3Oan2SGZudgBDzmfoJiGn0
         FPm33b/nzAHVyvjeMyS/tXbfirIXy2a4VX46Pq2fOwPyPlDWuSK+6yiMrEtmurKGlM4p
         x2kHQNPNwBbY6s6wgJhjb/SS+EHhPdkNYw6+zZ4Ae4ZOm9kSHvM/tLzvlzY/KuGPSXoA
         uBu0H4ja96YF+LrFOpPF6x6WlVtc/Nk5HbulA3imA3C5HZPS1Hpr7idXW5UoeMmZ9D7+
         6FCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744296421; x=1744901221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=feZuaxrFBmW/7qEu/+5shM64Px/4u1yOOiSmxUSEtqg=;
        b=HOuK+0VpYIgbkgbCOSKL+1hysxQcZbas7i/kCKsXxQXM8/xeXwxXWHB3kMeqbiEAjL
         l3xNw8WoAd2PpE5tNhaU2rYD9sKQ2g18+ho1UyLEFD5bvtAOXMfgzu19wLSKsWMlnboT
         P4K5Ykhot3z8Zjp1TXuYWLvjlz4DTlPPw+5skD7RYaQAhx0A7prcF/E9Xu550Tbtzi3A
         SrmpvRABlR9iW7TsbiIS1phgD847P0ZTMOgWsJaZ4IYHtgHvsD1HLwSSAzsBQ/Swls1y
         G5rhhtQByII60VKUoxlJSERoJPRTf8qN7Q5kQuBgD06s2r0gIzqE1FRbr0ZA6JwVY2I5
         zWyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVihXI45YxcyhcPMI1qVZ/uACDXJvI+uRwZ/kptcLcmKtkr5buCpGuVGfb0czo0TSL/o09xwgPK/UI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+V5lYteK6WHg3yz1hzyslvB5hfgnP1rAQIsKOI7BL+GtqQYZY
	FOgyimXu/cSzBxYFCUnDcioAAT9EWZ2AV1PAeiVquWwKITRPrBZd
X-Gm-Gg: ASbGncvwSFYGan9+4jhiJ3TScwZQFQWQyxYUy+XEFbprNXXrY7IxT+XroAgyCE8Yb1+
	h85FZjfByxzDxCE21k2WdOxsiZk7aV64ljSaA7NNx/CrVtja/Z0BEVEbN2uFpn9SXxq7IPCsohl
	F6jpiJAIAA+4DD9HopUnh6qp+V2MrvhaCu/x1sZ+DZP3DNadtvrnKdx5vV2PncQPoFDWK0f34yv
	6xMJcm3S9IGaDxT6aEJbBsiHqYkA6q3nkVbY+YDIrgacLTvPAdy1OFjWIm2rpFu2L3bb9uN2RIV
	g0weuq77acH7aBcvd6dNzEd9fGRyFb1Bb1nkaEAhAJIYP/rbDSV4lSZXVqlIQbT6jI3Glw==
X-Google-Smtp-Source: AGHT+IHps2ex7WUHYRh1F6pfalqAS+t3xoH5n99yd6RdsrQzd/R4jAa7Rvgik+13jW6mwMSpuV3Rdg==
X-Received: by 2002:a2e:a98c:0:b0:30d:62a6:4431 with SMTP id 38308e7fff4ca-3103ea9cad7mr8840891fa.9.1744296420337;
        Thu, 10 Apr 2025 07:47:00 -0700 (PDT)
From: Aleksandr Partanen <alex.pentagrid@gmail.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Aleksandr Partanen <alex.pentagrid@gmail.com>
Subject: [PATCH] xen: mapcache: Fix finding matching entry
Date: Thu, 10 Apr 2025 17:46:04 +0300
Message-Id: <20250410144604.214977-1-alex.pentagrid@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we have request without lock and hit unlocked or invalid
entry during the search, we remap it immediately,
even if we have matching entry in next entries in bucket.
This leads to duplication of mappings of the same size,
and to possibility of selecting the wrong element
during invalidation and underflow it's entry->lock counter

Signed-off-by: Aleksandr Partanen <alex.pentagrid@gmail.com>
---
 hw/xen/xen-mapcache.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 698b5c53ed..2c8f861fdb 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -376,12 +376,12 @@ tryagain:
 
     entry = &mc->entry[address_index % mc->nr_buckets];
 
-    while (entry && (lock || entry->lock) && entry->vaddr_base &&
-            (entry->paddr_index != address_index || entry->size != cache_size ||
+    while (entry && (!entry->vaddr_base ||
+            entry->paddr_index != address_index || entry->size != cache_size ||
              !test_bits(address_offset >> XC_PAGE_SHIFT,
                  test_bit_size >> XC_PAGE_SHIFT,
                  entry->valid_mapping))) {
-        if (!free_entry && !entry->lock) {
+        if (!free_entry && (!entry->lock || !entry->vaddr_base)) {
             free_entry = entry;
             free_pentry = pentry;
         }
-- 
2.39.5


