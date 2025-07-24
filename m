Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CFDB10F99
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 18:23:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056344.1424584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueyiz-0008Bf-02; Thu, 24 Jul 2025 16:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056344.1424584; Thu, 24 Jul 2025 16:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueyiy-0008A6-PN; Thu, 24 Jul 2025 16:23:16 +0000
Received: by outflank-mailman (input) for mailman id 1056344;
 Thu, 24 Jul 2025 16:23:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSid=2F=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ueyix-0007fj-9x
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 16:23:15 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f35e6ec-68aa-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 18:23:13 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4563a57f947so11696865e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 09:23:13 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fcc2bc8sm2615965f8f.72.2025.07.24.09.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 09:23:12 -0700 (PDT)
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
X-Inumbo-ID: 7f35e6ec-68aa-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753374193; x=1753978993; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HG+dhXpKLeqmkCTO1timAoyHNCnQT3feUEIMbEV+Nk=;
        b=U+zZ6Tx8a5i+WwnRwPYWLoFzFB45J1WO/2p5wEbYLjaruPM/9zpMGBsM6Uzp100ua3
         49+32eJ1BiIMCF3J+cGfFTUhnsFaAM6Z0uNgqXt+fWCEoV+Kt2fUJ4c2/B8y6a/bATN1
         i6XeguhzuVQfaLasgn5t73VbKXp4QXnBD3v8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753374193; x=1753978993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HG+dhXpKLeqmkCTO1timAoyHNCnQT3feUEIMbEV+Nk=;
        b=ZnZxP6lTbBpVaAJSrUgzVYvVZ0uvNrrKg3FQ9Lk6MC1tuuxBW6cTmxm5bEX9H4c6cA
         hx1Wy6xrFpl8jgdFi9CUtPHcIo1CXIhHV7SCqzL7+Mmq8gAgC5zxSXD1cbxD5pLkisBx
         IwgY+xNgmEwwpGdDbqo3JvyAwDtLN+SZi5VmHFk/IDnkRJNZMLM7+2ygzYX5NwCnvdd4
         YgvX5Ho4y92Yw1hOQwnPtPlyIaFplAtaIiT7q136A75bmJIGoWkDec7uoLWOQNcfXyOd
         Py3xLhG8kZiPdupqanAy0xsUgdV9WsCQBe9L2SOvUgpkGIXi1hA0oX9AH8jK6hRa/xL9
         CwSQ==
X-Gm-Message-State: AOJu0YxdFFdcYyUjXdrE4qPb3NiGV1D67tWQMptkgozjVSJhTfYuz9te
	Pr1uKuwggMeI3kvukN4OKXtpbQQ6wg4CYlmsfDmrvRQ0ejbSHNBWKk4cladHGn8rWh7Kd4eQYV7
	LKoecx6PVKQ==
X-Gm-Gg: ASbGncvUoJWKaE0hHJy78AbklYAHGWyNv9mg/8vp8Zd+vGWiJb0a6izzXTgozYVbE7e
	D6ey60/SQD9M/o30Bhbbf7pDoYVa4aotElyxdnnf2yxk2dmg0z/hJ2FuKJATv4xnUkI3156PlF1
	krR5Owo0DhagKBFIaY5ZK5icj6KZuPvthb4nJv4nG9JplYE1C97/caR8eRSWOcWepaZ64J0BzkY
	x7KQVevwXW7sGXoL1tSwPDxrydzNBkhvgqsqZpaTyL+swlu4Sdsw++vT4hP71SOtriYV7A6WYKM
	L/vZrGT/xsGojdUHYkqQtrweNj/Y3ffYUIFoHwCnLhHuBatUF7qwgEaPduy5eMFxEcharsjlLc7
	O6im9gkb7dMfsKc2F2jBFkaYMaIU2vT2rE0jRMT/na+v3+i+3pCM/M5Lvkn6hmPj8NCvgShhTaF
	S2
X-Google-Smtp-Source: AGHT+IFkH0dPDvGPZYZsXrRAd8OOgZNi/vLLlDp+pTgDNXq5BKNMu4GQ5rBymf5bCmSvUp2qMdbjLA==
X-Received: by 2002:a5d:6d50:0:b0:3a3:7117:1bba with SMTP id ffacd0b85a97d-3b771374f67mr1785678f8f.24.1753374192767;
        Thu, 24 Jul 2025 09:23:12 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH 2/4] xen/cache-col: Fix freeing of colouring information
Date: Thu, 24 Jul 2025 17:23:04 +0100
Message-Id: <20250724162306.2978741-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250724162306.2978741-1-andrew.cooper3@citrix.com>
References: <20250724162306.2978741-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

domain_destroy() is the wrong position to be freeing colouring information.

The comment in context identifies how domain_destroy() can be called multiple
times on the same domain, leading to a double free of d->llc_colors as it's
the wrong side of the atomic_cmpxchg() to be made safe.

Furthermore, by freeing d->llc_colors but leaving d->num_llc_colors nonzero,
alloc_color_heap_page() can in principle use after free.

Make domain_llc_coloring_free() idempotent, zeroing d->num_llc_colors and
NULL-ing d->llc_colors after freeing, and call it from domain_teardown().

Fixes: 6985aa5e0c3c ("xen: extend domctl interface for cache coloring")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Carlo Nonato <carlo.nonato@minervasys.tech>
CC: Marco Solieri <marco.solieri@minervasys.tech>

Cache colouring is experimental, which is why no XSA is being allocated for
these bugs.
---
 xen/common/domain.c       | 5 +++--
 xen/common/llc-coloring.c | 4 +++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 303c338ef293..4f79ba39878c 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -626,6 +626,9 @@ static int domain_teardown(struct domain *d)
     case PROG_none:
         BUILD_BUG_ON(PROG_none != 0);
 
+        /* Trivial teardown, not long-running enough to need a preemption check. */
+        domain_llc_coloring_free(d);
+
     PROGRESS(gnttab_mappings):
         rc = gnttab_release_mappings(d);
         if ( rc )
@@ -1447,8 +1450,6 @@ void domain_destroy(struct domain *d)
 {
     BUG_ON(!d->is_dying);
 
-    domain_llc_coloring_free(d);
-
     /* May be already destroyed, or get_domain() can race us. */
     if ( atomic_cmpxchg(&d->refcnt, 0, DOMAIN_DESTROYED) != 0 )
         return;
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index bd1f634f0bb8..ea3e0ca07017 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -309,8 +309,10 @@ int domain_set_llc_colors(struct domain *d,
 
 void domain_llc_coloring_free(struct domain *d)
 {
+    d->num_llc_colors = 0;
+
     if ( d->llc_colors != default_colors )
-        xfree(d->llc_colors);
+        XFREE(d->llc_colors);
 }
 
 int __init domain_set_llc_colors_from_str(struct domain *d, const char *str)
-- 
2.39.5


