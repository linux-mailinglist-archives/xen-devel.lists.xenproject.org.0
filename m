Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D24A42092
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 14:28:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895167.1303763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmYVA-0003l5-7Y; Mon, 24 Feb 2025 13:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895167.1303763; Mon, 24 Feb 2025 13:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmYVA-0003hz-4W; Mon, 24 Feb 2025 13:28:04 +0000
Received: by outflank-mailman (input) for mailman id 895167;
 Mon, 24 Feb 2025 13:28:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cK+3=VP=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tmYV9-0003ht-ES
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 13:28:03 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24da1940-f2b3-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 14:27:50 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-439a2780b44so27052815e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 05:27:50 -0800 (PST)
Received: from localhost.localdomain ([46.149.103.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02ce4e9sm108152615e9.4.2025.02.24.05.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 05:27:49 -0800 (PST)
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
X-Inumbo-ID: 24da1940-f2b3-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1740403670; x=1741008470; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7P/cS8oSOM/LMYrEsD4qqZrWHpboW1Gg3vTkQBJA88o=;
        b=YePfe0UN4Gu7V5Bm3JXagTjNEkRiPJnhUVp9I3Zds2JIkIGVaX+ihQpI17Oan3aq3O
         ftdYzu/WHsyc0ZNCNL3VDGiaKAt4yCS7ts4N83FQRLjNmVWgB2eRmjaE49XhuL8ra+By
         0U8W5CfivMq4jKMLwE9Ks9viO3DDzQZa/3w5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740403670; x=1741008470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7P/cS8oSOM/LMYrEsD4qqZrWHpboW1Gg3vTkQBJA88o=;
        b=KxljAYExstoe/gAQgqEjyZ/rghh07VLqVk669CyARLXkhzOUKFzfJBvdT3/NmKw3Xl
         LvGh1tXYuEkjUSsp2/xYKUKHdn4re4q3lLiHLqg73ZnEjY3iVS1OjnsrJ6bHIy7NT/1y
         AC0NvOtFH5y7tT/CF9VlkuWPI6ZmTGPBn/2fxNb7obNF1cJ/dSfv2LUTkFH02FmjqdZi
         /Bw7J/TUxpayVJZngNBzbb5Po6PSHx+sMX4UjpXcI7QeWJ3ru+cK2/d731N8g/FcDotO
         /lLQ3PAgxu0ai/ZZ9jS0MDQItIYiIPQJoJWIrw2qslMW9qPUyPTpPXFXuDvIjraZF6fY
         6GpA==
X-Gm-Message-State: AOJu0YwXwUaUMCtBibA0hVv1nTv/dnydzXwoqYchBrpgkoA6m/9UyKoX
	eejL/vN4+/AbNpicsTosVSdVIGn6d9mniTMvuI66f+hZTdxsbJGxp4yw1x9JupC/zQidYkZPXfI
	v
X-Gm-Gg: ASbGncvSUkS9ADRMicz8Mmzm5Hyus1EKcA0WNBbyQ68YJUr4p7wrkgzdfD/OmbOFQaD
	jgJw5tep2OtiQNPuaFt/FTtIgxnQuHYck8epEpy6/YPcDWGHQgkRBVSULGq11PDTMFPbnf1DoWP
	2xNkT78SQ865xm2eIVLJaQAjiv04ZjEkpZ67TbHcaEmsZLHlnWCClXD9ZE69OqEUoifOSPJoPWI
	2jt5kNWTZhcwPXec3vqBzafUDe9YMTt0SBE8cn6TX7PCno7uEX+0+b5p9UT/9Rlrzxk1f6FnZS9
	+ZGEAuPeKfsDYc6wFlb7mA697xqowDzBv5OScUw4cG71veUj
X-Google-Smtp-Source: AGHT+IG4ju/Y8TghJZOL9LE+Z13/Xi9dXzJDoPAt0YIccOHBF0ANYJpPvVJs9DFxROj6P4bZaaTurg==
X-Received: by 2002:a05:600c:3b8e:b0:439:873a:111b with SMTP id 5b1f17b1804b1-439ba9cf786mr66286985e9.12.1740403669624;
        Mon, 24 Feb 2025 05:27:49 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
Date: Mon, 24 Feb 2025 13:27:24 +0000
Message-ID: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The logic has too many levels of indirection and it's very hard to
understand it its current form. Split it between the corner case where
the adjustment is bigger than the current claim and the rest to avoid 5
auxiliary variables.

While at it, fix incorrect field name in nearby comment.

Not a functional change (although by its nature it might not seem
immediately obvious at first).

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/common/page_alloc.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1bf070c8c5df..4306753f0bd2 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -490,13 +490,11 @@ static long outstanding_claims; /* total outstanding claims by all domains */
 
 unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
 {
-    long dom_before, dom_after, dom_claimed, sys_before, sys_after;
-
     ASSERT(rspin_is_locked(&d->page_alloc_lock));
     d->tot_pages += pages;
 
     /*
-     * can test d->claimed_pages race-free because it can only change
+     * can test d->outstanding_pages race-free because it can only change
      * if d->page_alloc_lock and heap_lock are both held, see also
      * domain_set_outstanding_pages below
      */
@@ -504,17 +502,16 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
         goto out;
 
     spin_lock(&heap_lock);
-    /* adjust domain outstanding pages; may not go negative */
-    dom_before = d->outstanding_pages;
-    dom_after = dom_before - pages;
-    BUG_ON(dom_before < 0);
-    dom_claimed = dom_after < 0 ? 0 : dom_after;
-    d->outstanding_pages = dom_claimed;
-    /* flag accounting bug if system outstanding_claims would go negative */
-    sys_before = outstanding_claims;
-    sys_after = sys_before - (dom_before - dom_claimed);
-    BUG_ON(sys_after < 0);
-    outstanding_claims = sys_after;
+    BUG_ON(outstanding_claims < d->outstanding_pages);
+    if ( pages > 0 && d->outstanding_pages < pages )
+    {
+        /* `pages` exceeds the domain's outstanding count. Zero it out. */
+        outstanding_claims -= d->outstanding_pages;
+        d->outstanding_pages = 0;
+    } else {
+        outstanding_claims -= pages;
+        d->outstanding_pages -= pages;
+    }
     spin_unlock(&heap_lock);
 
 out:
-- 
2.48.1


