Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3656EB47C5D
	for <lists+xen-devel@lfdr.de>; Sun,  7 Sep 2025 18:16:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114125.1461302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvI3B-0000NX-Mc; Sun, 07 Sep 2025 16:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114125.1461302; Sun, 07 Sep 2025 16:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvI3B-0000HI-HG; Sun, 07 Sep 2025 16:15:33 +0000
Received: by outflank-mailman (input) for mailman id 1114125;
 Sun, 07 Sep 2025 16:15:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bCRb=3S=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1uvI39-00009z-WC
 for xen-devel@lists.xenproject.org; Sun, 07 Sep 2025 16:15:32 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de1eaa83-8c05-11f0-9809-7dc792cee155;
 Sun, 07 Sep 2025 18:15:27 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b04b869abb9so149718866b.1
 for <xen-devel@lists.xenproject.org>; Sun, 07 Sep 2025 09:15:27 -0700 (PDT)
Received: from MinisforumBD795m.phoenix-carat.ts.net
 ([2a02:1748:f7df:8cb1:5474:d7c3:6edd:e683])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b047b61cf00sm908263766b.15.2025.09.07.09.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Sep 2025 09:15:26 -0700 (PDT)
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
X-Inumbo-ID: de1eaa83-8c05-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757261727; x=1757866527; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTaeCc0jJZ6v4SiJ+F55XnFvKWiZFrzoLZItww1E4jk=;
        b=PLN5XU9236vTRSXxf7AxvIsH1VkzJekntmRLSYgdMzlznr/lrxrb80EFEJXDdzhenk
         E/kXwI0bEbUQ/n6669oUhU6OCrHfM2oMs+bxD2WOzg6p/UZoB7q39ta0lCFfq9DNq0uZ
         3X54wqcL6JdqvbxBI+tib5bSyaACGO3zVConY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757261727; x=1757866527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTaeCc0jJZ6v4SiJ+F55XnFvKWiZFrzoLZItww1E4jk=;
        b=OcxMg/4cMolaInqKr2DFPwnAN2pRsLcFO0ps0stJwWutwMLvmbHSvsJfBoHYWT9oiF
         in83eABDiXtbLkQVK72ZTpXtHraszwpO5u8K44WXFMTSov6e400T2yRM5AW30O5tUjJV
         zz1iU/oYRGt3X2tqy2UtIK7SDGPtbdpQejRByT7VmgShAgqDvvZ/I7vFW81Ijn97odOK
         ii1R0v8Ahl7WWYtfhCvPgXW3pcvM2BxXLhy8OuWFUXMFdNHrEDsrjdiEuTwOwJKvmcrb
         OWW2FDq948FdxqG0Jj25LKJrl0xnkPFID9XQAE7813B86UBvJCRIBxMutNRMCCiRTb65
         VB/Q==
X-Gm-Message-State: AOJu0YyyHjrxkGWJjWMUAHUomUB08fal8dw+iLBkiAstKLDErhF89pqG
	vhwxUzjmjm3aFSiaF4J2XNuy/74z9GwuKWd1FdaKp2HBb1N6TADyIKdj3m/vqB6N1TD01kTDWt6
	aYLkTivE=
X-Gm-Gg: ASbGncssaNeR0KuoroW7tfBb4xTqo0jz2XffUjWHrWLwuniwuktsXVX+qyBUAbbFvGZ
	Iva+2KCZGe4BFlpSlY/5nm74IQALnIeko1/tXN6KqtqwxLEL7q3QubagPhMTrtkZaGOmh2Eh1xk
	NivjA4aNoFfDDSgT5l7xHF6Guo6oUMMQdpUYU4pp3x/QcKkR+7qWNAPPRO4BsiMGllK3GKfR2Ca
	X3SzEtjvq0q8jNyEXQ7zI0TCosbqIRJGvd5FilRSLhy5CaKIiV7nQgG07sdp5R2/jy+js+LFMHx
	wk2kLxk4D1xwP0pyHm/apmdAASwFAxUs1qshtyYCmvNvD3M8OjKa7U53aPEJOS4CBPlT1dMRBHF
	VopplWXvaN5HNWAEatJ6RjSTiDhxWYaqZ9amxjwonUccWHE7fbTw7VGzVxhOC7MTFutI=
X-Google-Smtp-Source: AGHT+IGQR9/J0pflFoZP8fpXWuEulGdjHQl4gGCXU4y13Rc3B7e+E6dWfnhdFZpDe8pf22mP59uS4g==
X-Received: by 2002:a17:906:99c5:b0:b04:848f:a0b7 with SMTP id a640c23a62f3a-b04b1663cb3mr468611066b.41.1757261727086;
        Sun, 07 Sep 2025 09:15:27 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 2/7] xen/page_alloc: Simplify domain_adjust_tot_pages() further
Date: Sun,  7 Sep 2025 18:15:17 +0200
Message-ID: <15ae395c6933e74da0cdd8f9d71d349a7bfad3f3.1757261045.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757261045.git.bernhard.kaindl@cloud.com>
References: <cover.1757261045.git.bernhard.kaindl@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When domain memory is allocated, domain_adjust_tot_pages(),
also reduces the outstanding claim.

Replace the checks to not over-reduce the claim beyond 0
by using min() which prevents the claim to become negative
(and also not be over-conumed for the node and globally)

Cc: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>

---
Changes:
- Was added as 2/7 in v2, the review by Jan Beulich is applied.
---
 xen/common/page_alloc.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1f67b88a89..e056624583 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -510,8 +510,15 @@ static unsigned long avail_heap_pages(
     return free_pages;
 }
 
+/*
+ * Update the total number of pages and outstanding claims of a domain.
+ * - When pages were freed, we do not increase outstanding claims.
+ * - On a domain's claims update, global outstanding_claims are updated as well.
+ */
 unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
 {
+    unsigned long adjustment;
+
     ASSERT(rspin_is_locked(&d->page_alloc_lock));
     d->tot_pages += pages;
 
@@ -519,23 +526,22 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
      * can test d->outstanding_pages race-free because it can only change
      * if d->page_alloc_lock and heap_lock are both held, see also
      * domain_set_outstanding_pages below
+     *
+     * If the domain has no outstanding claims (or we freed pages instead),
+     * we don't update outstanding claims and skip the claims adjustment.
      */
     if ( !d->outstanding_pages || pages <= 0 )
         goto out;
 
     spin_lock(&heap_lock);
     BUG_ON(outstanding_claims < d->outstanding_pages);
-    if ( d->outstanding_pages < pages )
-    {
-        /* `pages` exceeds the domain's outstanding count. Zero it out. */
-        outstanding_claims -= d->outstanding_pages;
-        d->outstanding_pages = 0;
-    }
-    else
-    {
-        outstanding_claims -= pages;
-        d->outstanding_pages -= pages;
-    }
+    /*
+     * Reduce claims by outstanding claims or pages (whichever is smaller):
+     * If allocated > outstanding, reduce the claims only by outstanding pages.
+     */
+    adjustment = min(d->outstanding_pages + 0UL, pages + 0UL);
+    d->outstanding_pages -= adjustment;
+    outstanding_claims -= adjustment;
     spin_unlock(&heap_lock);
 
 out:
-- 
2.43.0


