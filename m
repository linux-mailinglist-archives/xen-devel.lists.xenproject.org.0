Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE250A6177D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:25:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914868.1320502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8mz-0003r8-BJ; Fri, 14 Mar 2025 17:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914868.1320502; Fri, 14 Mar 2025 17:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8mz-0003oT-76; Fri, 14 Mar 2025 17:25:41 +0000
Received: by outflank-mailman (input) for mailman id 914868;
 Fri, 14 Mar 2025 17:25:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsSs=WB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tt8mx-0003IK-MO
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:25:39 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5921db99-00f9-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:25:39 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5e5b572e45cso4245438a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:25:39 -0700 (PDT)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aeb24sm250677566b.9.2025.03.14.10.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:25:37 -0700 (PDT)
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
X-Inumbo-ID: 5921db99-00f9-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741973138; x=1742577938; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=351bdlLIbuxgol8ZF7V3o8BgsGOssbbNlMWXgCJ2hCs=;
        b=RC+bo7JKTvEZtae3Gr3izzQhXKVIBhrGVXgHQFrY/ou41vZ2AbDK/3Gh/uAp24N5pe
         SWp2MILYFC5DL7kBfN7YRkR5oMZAm25XservpB6NiBza1CZA8I6nml4s6zP+SRUCtKkd
         zX5ugudvxdE6Kvxrhc3864UqTQBXg9/1XjdmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973138; x=1742577938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=351bdlLIbuxgol8ZF7V3o8BgsGOssbbNlMWXgCJ2hCs=;
        b=H0etzQr1tMBIXvxxf+/lQRLrY5HYeZv0aduhraZOpY8e0aXwawBThtwqm9JkKsvsp1
         ECWEIvPRMKCgjyUmvsGxqC4XbjW1hhuwuaPora/ITh9HWn9AfwtOvhC1htse+sRo9vUB
         pjTLKgoFRg2odSM3pCusN9vOdhFlTHhrabxsPJ6iu6y0LDcWhmqy0DXL3mrfMUp/IJxG
         XSEQOFrz4Ee6xPvAb26Xtu09LP1ptGcjKs3nmbCUUdbbicqXCaODinHnR2V/NlPyFx78
         wBB7BDYN4U7FHrGH50RJMx/DGr5O8HcwuzUhOZon/rQaz8qJvFWXFAUermAogDqbrPSS
         bbmA==
X-Gm-Message-State: AOJu0YyXZHCcuxQq54/mWnBs/533BCCX8OcjOPkFRyWhQlZGN9O+26pf
	OizBU6RbXbfXiUSOmingQW4OOz08XEsmnDBeBDq02qZkxkGHCcgM4VnEg79w3nR6AbBl9tSZ+dw
	K
X-Gm-Gg: ASbGnctxVM9/lPjSYATIafV4/lwpSIgho1dCmUzq0W4hNnyTzQY5NpYoZeRU1aoyjBW
	hJu3frP/f6GZygE+jsdB/JAS6HUieWe9tS1a6EvEIcbNU/KiG3jna3uoOOP2Cdgcp3YqW1XLoPc
	lnc7QN5YZoGnXNih+k4WUtQ0p1yt9wLDPvVEmMChBuLvi3I+Tt2SjFcUqnvFicPw4zg01MJhS2g
	eKVwc2fyp63ETml+OAyAHQOqR3/A3tRvnLqkb96jCPRg7GvQzfile+S0FGgTaz4sGVFQtMB7RNo
	nroz0mRWpDikg9ML5iHYfAKHoc6DeJeeAhec8L3SVN5sq/dnJkI5/EIjKNT6rLhPhtA=
X-Google-Smtp-Source: AGHT+IFI/fvEfzg2jBcAL1WJKOGW6aGgqd1AEB2qnpko0+wGODBcJlNhhdY5u2rgrYI9d4Vgxr2unA==
X-Received: by 2002:a17:907:60d5:b0:ac1:df33:25b9 with SMTP id a640c23a62f3a-ac3303ab8f3mr447537466b.40.1741973138357;
        Fri, 14 Mar 2025 10:25:38 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 02/11] xen/page_alloc: Remove `claim` from domain_set_outstanding_pages()
Date: Fri, 14 Mar 2025 17:24:53 +0000
Message-ID: <20250314172502.53498-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With a single global count for the claims it's easy to substract
domain_tot_pages() from the claim so the number given in the hypercall
is the real reservation of the domain. This is the current behaviour.

However, a later patch introduces exact-node claims and those interact
very poorly with such a scheme. Since accounting domain_tot_pages() in
one case but not the other seems strictly worse than not accounting them
at all (which is at least consistent), this patch stops substracting
tot_pages from the claim and instead checks that claimed memory +
allocated memory don't exceed max_mem.

Arguably it's also clearer for the caller to align the amount of claimed
memory with that of the requested claim.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/common/page_alloc.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index bd4538c28d82..49c3258169db 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -523,7 +523,7 @@ out:
 int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
 {
     int ret = -ENOMEM;
-    unsigned long claim, avail_pages;
+    unsigned long avail_pages;
 
     /*
      * take the domain's page_alloc_lock, else all d->tot_page adjustments
@@ -549,28 +549,21 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
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
2.48.1


