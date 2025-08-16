Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F06D1B28D5B
	for <lists+xen-devel@lfdr.de>; Sat, 16 Aug 2025 13:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084461.1443607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unEyY-0006wT-N3; Sat, 16 Aug 2025 11:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084461.1443607; Sat, 16 Aug 2025 11:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unEyY-0006us-Jq; Sat, 16 Aug 2025 11:21:30 +0000
Received: by outflank-mailman (input) for mailman id 1084461;
 Sat, 16 Aug 2025 11:21:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO4R=24=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1unEyX-0006Jf-2O
 for xen-devel@lists.xenproject.org; Sat, 16 Aug 2025 11:21:29 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27346c8e-7a93-11f0-a328-13f23c93f187;
 Sat, 16 Aug 2025 13:21:28 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45a1b004a31so17014015e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 16 Aug 2025 04:21:28 -0700 (PDT)
Received: from MinisforumBD795m.citrite.net
 ([2a02:1748:f7df:8cb1:3992:b1e9:da8a:3f30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a27ec6b71sm13852325e9.10.2025.08.16.04.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 04:21:27 -0700 (PDT)
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
X-Inumbo-ID: 27346c8e-7a93-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1755343288; x=1755948088; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqLgWRTfSlSShI6W9CQEOmln3SxcjiGyydtrE7lJ0Xc=;
        b=iuSi+WBNoGCyrzKsXH7w+Dj28YWN+kRyNfTt1uUI+LfCzbNIoCpZjlrPnEn+eozYB7
         cf2uX8lOVxvLeriHSgYY0gti2N6K/ghCf0tPm6ktIerHx6K5XCu1AeDqG45bWZto5l/t
         3xoNlybI+UKeaiGJfGbIqZy+SaLlBrM/qtF5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755343288; x=1755948088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqLgWRTfSlSShI6W9CQEOmln3SxcjiGyydtrE7lJ0Xc=;
        b=jCxiPEAO3L/ZSuwUrTF+ES/IBd1MaFZr25r5urWWzoJqjHyCbIlYXsUwpQvjBUeM0m
         KX4U6TNFSH/8zgsiNX3g+5HDvDb4Vsy9TjB830YpoDKDTuj4VN5y67WmwvCl2u7hIW7c
         IWERYrSGxlgSVPRP/4RmHP2vEXbLZ+HW4lKKL62LDJWHWSp2UesAgziCfFu4EqQjfO+7
         /DKSYgm7N75x4DL6pqNgtGlQFPtgw1ki8wvzagB9ZHjdAXQIX7KXUuamikDzHO0c75Ht
         6eANI2LUUhaNJnPrYv0Px36svWqnNUHC64u4PMuD8uVz0BJNesoNzVmnfs3wr/BSfE47
         DCMQ==
X-Gm-Message-State: AOJu0YwnZwvGdzaa0ObZE/cdkIIoiAQB6IVm7l9ltjthzZpZPHroJqWu
	PGHpsYIRcg5GOxA8+mldL9FGqIoNTIj1Fwhvu0CyJ8fRHuE1jvMe9CWsV9UMbWmHwvO3Rao+zji
	bc4gCPXU=
X-Gm-Gg: ASbGnctxcXXUV1dBJs0TZxr4iKgDdqJOIvXOpn8L2Phkfbv2XUSgBQ7BDcENhIG2KtH
	+3U04co1vgVavHkalf54/eNs7QZxVAOFk0UYMEQdjnXhMe2w0jryBVfYy3dEc9zhEjBRHtdYxVK
	L+ZWJspMasMTydqTa9J+K8mR3Rkx1anolp9sUCkAgeZh4vFbTrXKBIUBGTBYcEvsv0LmOZ+THyu
	pXuZ6U0NxJdYq/GB/AqsiCgJHsvufbj92/R27rdIUvRVIq7fjrF+D24j++IA6hbXHb5416WsB4W
	2MYGGNvRwtOLedvSnA3s/PDOIZW+RCELAPn6jiBUBiWu1+nE3gWSVYYKq6X0fiGniJP91E540Gx
	YITs8U3ZWbe4tXuL9NjvHxeFpwWlT3owaTcT3gXsjYEveX3u29kaugE0=
X-Google-Smtp-Source: AGHT+IEvBr5RnjHc3muBzso6mPDrnMFo7IOsVkET3qV1DzWggzJ+Lw/himDguhJV2TPdNORgbLRSIQ==
X-Received: by 2002:a05:600c:4ed3:b0:459:dc92:b95f with SMTP id 5b1f17b1804b1-45a23323e44mr38796815e9.5.1755343287774;
        Sat, 16 Aug 2025 04:21:27 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: [PATCH v2 2/7] xen/page_alloc: Remove `claim` from domain_set_outstanding_pages()
Date: Sat, 16 Aug 2025 13:19:28 +0200
Message-ID: <73dc08d9ec628823309acc40a2603e9138bdd4b1.1755341947.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755341947.git.bernhard.kaindl@cloud.com>
References: <cover.1755341947.git.bernhard.kaindl@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With a single global count for the claims it is easy to substract
domain_tot_pages() from the claim so the number given in the hypercall
is the real reservation of the domain. This is the current behaviour.

However, a later patch introduces node-specific claims and those interact
very poorly with such a scheme. Since accounting domain_tot_pages() in
one case but not the other seems strictly worse than not accounting them
at all (which is at least consistent), this patch stops substracting
tot_pages from the claim and instead checks that claimed memory +
allocated memory don't exceed max_mem.

Arguably it's also clearer for the caller to align the amount of claimed
memory with that of the requested claim. xl/libxenguest code never updated
an existing claim: It stakes a claim, allocates all domain memory, cancels
a possible leftover claim, finishes building the domain and unpauses it.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/common/page_alloc.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index e1ac22b9ed..7e90b9cc1e 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -550,7 +550,7 @@ out:
 int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
 {
     int ret = -ENOMEM;
-    unsigned long claim, avail_pages;
+    unsigned long avail_pages;
 
     /*
      * take the domain's page_alloc_lock, else all d->tot_page adjustments
@@ -576,28 +576,21 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
         goto out;
     }
 
-    /* disallow a claim not exceeding domain_tot_pages() or above max_pages */
-    if ( (pages <= domain_tot_pages(d)) || (pages > d->max_pages) )
+    /* Don't claim past max_pages */
+    if ( (domain_tot_pages(d) + pages) > d->max_pages )
     {
         ret = -EINVAL;
         goto out;
     }
 
     /* how much memory is available? */
-    avail_pages = total_avail_pages;
+    avail_pages = total_avail_pages - outstanding_claims;
 
-    avail_pages -= outstanding_claims;
-
-    /*
-     * Note, if domain has already allocated memory before making a claim
-     * then the claim must take domain_tot_pages() into account
-     */
-    claim = pages - domain_tot_pages(d);
-    if ( claim > avail_pages )
+    if ( pages > avail_pages )
         goto out;
 
     /* yay, claim fits in available memory, stake the claim, success! */
-    d->outstanding_pages = claim;
+    d->outstanding_pages = pages;
     outstanding_claims += d->outstanding_pages;
     ret = 0;
 
-- 
2.43.0


