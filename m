Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CFCA4DBF5
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 12:10:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900950.1308938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpQAa-00033g-Av; Tue, 04 Mar 2025 11:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900950.1308938; Tue, 04 Mar 2025 11:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpQAa-00031E-7q; Tue, 04 Mar 2025 11:10:40 +0000
Received: by outflank-mailman (input) for mailman id 900950;
 Tue, 04 Mar 2025 11:10:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wukS=VX=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tpQAZ-000318-Hh
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 11:10:39 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d0a577e-f8e9-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 12:10:37 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5e04064af07so10256787a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 03:10:37 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf5fa63b4asm501266566b.33.2025.03.04.03.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 03:10:36 -0800 (PST)
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
X-Inumbo-ID: 4d0a577e-f8e9-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741086637; x=1741691437; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1q7cHLSOIMRjIoBETXU9XFNIXqbk7EvNLnQzJRrVfG0=;
        b=L+Vq6ac7gGpcaIHoNX8XYOOg7K7NWAguY87UBtiIcwJAuE+PmD5qMguIf47Mg+hkRC
         2S70jRzMvkwLX246CFxtib61MgVV0RLm7WhPUXwt3R5mXgqpCGZRAtqF3DRM1wnN3Lcn
         iropbtcs+hcKNlx17UsisjsauYwKG7++hGm7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741086637; x=1741691437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1q7cHLSOIMRjIoBETXU9XFNIXqbk7EvNLnQzJRrVfG0=;
        b=h7mmRlqKbzYYJk9l/VyHjE3i/tEjlSkF8+YXVOekVHM9HEqNboEyPoC8vJaw7npPpL
         hL6FuwKQzZiJj2lJ8T8eHhq9ef6wuBm7ILlQhT5dHsiiSyx3YPqBTg6TUXoOGJTuBXgk
         +m6bCPz4vftO4yKmasHibK8jcwSN2/Qv9XOsBPFz2Cf14gCZbpn+RXstESjJ/Gu0ctY2
         2inud6ukTEEajPuD0AiSDh3GI0WdMJDqHfvM81B8gGxu2Quc9VE6DJthKyTzTOBzrBDt
         CYRTzgto2n0VK5UkdJGw8irzSu5PmIgMJJ4+WaC0uwb/ucU+5dWpRBQ4Fi+Xxr+shroI
         YWrQ==
X-Gm-Message-State: AOJu0YxVfnpiQIdyMsDT6xZGvhWGbtC/OqYPwQe7jBtuY8WOQhjXqmBO
	04I/GjDNNRc0/JOzVATlLZDlW9LsfASParf0a99nTGs83rONPIVUP0KQQtspd/DifZuHEdUw8gt
	v
X-Gm-Gg: ASbGncseYJ+YRJZOz/ErKz2kPxIrtiItMswlJV5YhpDOxoKhrr357LDcUodWNb+sJMT
	3gt4/2iJX7WuauToQPepyDVsZYCvYYY4L6VYf72S6A9eRvqzI3TgTe24J2sqbG1c6n4kLGCnSex
	zL8ybPsOZEXS659XTjuW5DRjXFQWMAESY1h574V5Axd6kIZJ3ZQmdhF2gmpWlvi44JB6a8VELzV
	tzeVPc3bO6JMWNo8eVMKnSUmI4otfbD9XhTlhEks4cug/ND47B3b+kddp1VWpcrSecddGgm2EpT
	uzd807AkJteXla7byB4MTN5F5dIAmio79bsFlfezdtm8jA9QLBCV5QYW8mzX+nLkLltgwZYSwTc
	imqXGl5pAsZFPIb8=
X-Google-Smtp-Source: AGHT+IH00Q2kdrSI8+ADb7sbL3O2451bdaO/gACm7ngvjP4MHoPaJNh/wfUCKwyxIppwDVvYFkDMMQ==
X-Received: by 2002:a17:906:6a27:b0:ac1:f19a:c0b8 with SMTP id a640c23a62f3a-ac1f19af82dmr227550166b.24.1741086636777;
        Tue, 04 Mar 2025 03:10:36 -0800 (PST)
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
Subject: [PATCH v2] xen/page_alloc: Simplify domain_adjust_tot_pages
Date: Tue,  4 Mar 2025 11:10:00 +0000
Message-ID: <20250304111000.9252-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The logic has too many levels of indirection and it's very hard to
understand it its current form. Split it between the corner case where
the adjustment is bigger than the current claim and the rest to avoid 5
auxiliary variables.

Add a functional change to prevent negative adjustments from
re-increasing the claim. This has the nice side effect of avoiding
taking the heap lock here on every free.

While at it, fix incorrect field name in nearby comment.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v1->v2:
  * Functional change by preventing negative adjustments from increasing
    the claim. Exit early on pages <= 0.
  * Reflect said functional change in commit message.
---
 xen/common/page_alloc.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1bf070c8c5df..5f9c9305ef37 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -490,31 +490,30 @@ static long outstanding_claims; /* total outstanding claims by all domains */
 
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
-    if ( !d->outstanding_pages )
+    if ( !d->outstanding_pages || pages <= 0 )
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
+    if ( d->outstanding_pages < pages )
+    {
+        /* `pages` exceeds the domain's outstanding count. Zero it out. */
+        outstanding_claims -= d->outstanding_pages;
+        d->outstanding_pages = 0;
+    }
+    else
+    {
+        outstanding_claims -= pages;
+        d->outstanding_pages -= pages;
+    }
     spin_unlock(&heap_lock);
 
 out:
-- 
2.48.1


