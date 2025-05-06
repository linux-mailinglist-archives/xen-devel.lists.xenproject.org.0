Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2FFAABD53
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 10:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976751.1363936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDlO-0005GW-Fb; Tue, 06 May 2025 08:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976751.1363936; Tue, 06 May 2025 08:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDlO-0005DP-Ba; Tue, 06 May 2025 08:34:54 +0000
Received: by outflank-mailman (input) for mailman id 976751;
 Tue, 06 May 2025 08:34:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCDlM-00048v-7Q
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 08:34:52 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa5497cd-2a54-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 10:34:51 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so29529405e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 01:34:51 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441b2b20b36sm207541225e9.25.2025.05.06.01.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 01:34:50 -0700 (PDT)
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
X-Inumbo-ID: fa5497cd-2a54-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746520491; x=1747125291; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgghoeas14+y+/fNB0eokRVfIB1w/ZzOUGRan/5YZkA=;
        b=PlC5a2Y5PlpVAQwWiv0r0U/TDy/bZtUJRfwTKGNhnvC1jRMnOoaWZcVGhBVPYmo8sl
         OuMAsNpnjJg7YHKu08OhT5UaSW1+kycz3gr7H0vPkK2kvHaGC0YLZbsmdJq5Su4RXDQI
         a8ChVLK63iTullXW5ZwVSv67pLBPyerbGgoKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746520491; x=1747125291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgghoeas14+y+/fNB0eokRVfIB1w/ZzOUGRan/5YZkA=;
        b=iP6iRIF5xDMFp0exGxq8CyH/ov7Mm9yweGKtb5lNQzQL0m+tJPK6S9VKq+d0RJlgLo
         Yfj6PwcqHtt7gSqOGeFhCoOtjzLMWdfnC/fYQhpxR9ANHY/c/KnleJRT6TVNfphe6lw9
         fJici6B4vvJABnZaMS1MFyGaGg4BlhJcT34l2rrxcGCDihA3M2/IelAdMjGMoNGILjXF
         48l2rxBCcjs3k9WH01PfL76fjHGVUOc9s53AfoxFFLM9OII0ta8lJe500zZHK+hROk1v
         C8n0iIMq5zQuNUK8u14CCw1aC+x2V2P297FN5acK00pjETmiZkvpDl82BI/pwsC+lzfT
         tefg==
X-Gm-Message-State: AOJu0Yzzb1AkR0U4HyfAFebJfmNWOvU6eSVg1f1+ucMNJc8DpSKRPCqE
	Fetk3PDU8cFlis9sKAsGYD7LLrLgacuZoL9Sk2c1ACAjFS9kyOXp4mljKQaVzcThlAofH3WbpYk
	L
X-Gm-Gg: ASbGncsjUBEcCgHWNykAr46pkVYihymmuZbn0RTRQ183BDwQAW9BTxDHK1q2q3kuey8
	5kJPOu87wJgF6zcaZNyC3LMq947nElLVhJaX8roULJ3YftgjnQgMLzyIIm9wVXwnW9RsiAZ3mOh
	zs4+9EmnlzhWFSVcO5ITEmeSHNMPs8u5y6jV3rBZllqkcw3vSVbzsMpccyvv7uYFNJcNX2OM5KS
	xzk7PZcafzdtvQvl8GgjSysMOIPMBbdFuKepbaqemTXqjtWDdjzjjdrZZwAgUxrILLIarNSFocX
	nEakoQLtNwTWpRiK/XhXcc5VUQMfUJVshCVEKFQ5/al+xg==
X-Google-Smtp-Source: AGHT+IFy3ozUxsGi2jitSr9ubKsaPbVL8wW6yqXgzNmoNPsoSYOYTdbpTX/VTHQ8XuEd/keRVE0rUQ==
X-Received: by 2002:a05:600c:5010:b0:43d:526:e0ce with SMTP id 5b1f17b1804b1-441d100b3c5mr16425255e9.21.1746520490691;
        Tue, 06 May 2025 01:34:50 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 6/9] x86/p2m: limit cache flush in memory_type_changed()
Date: Tue,  6 May 2025 10:31:45 +0200
Message-ID: <20250506083148.34963-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506083148.34963-1-roger.pau@citrix.com>
References: <20250506083148.34963-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Only do the cache flush when there's a p2m type change to propagate,
otherwise there's no change in the p2m effective caching attributes.

If the p2m memory_type_changed hook is not set p2m_memory_type_changed() is
a no-op, no recalculation of caching attributes is needed, nor flushing of
the previous cache contents.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/mtrr.c        |  3 +--
 xen/arch/x86/include/asm/p2m.h |  2 +-
 xen/arch/x86/mm/p2m.c          | 13 ++++++++++++-
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index b88e81eb44b1..e7acfb6e8dc4 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -767,9 +767,8 @@ HVM_REGISTER_SAVE_RESTORE(MTRR, hvm_save_mtrr_msr, NULL, hvm_load_mtrr_msr, 1,
 void memory_type_changed(struct domain *d)
 {
     if ( (is_iommu_enabled(d) || cache_flush_permitted(d)) &&
-         d->vcpu && d->vcpu[0] )
+         d->vcpu && d->vcpu[0] && p2m_memory_type_changed(d) )
     {
-        p2m_memory_type_changed(d);
         flush_all(FLUSH_CACHE);
     }
 }
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index b9ce7d8705ba..4358cc15a2a1 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -700,7 +700,7 @@ void p2m_pod_dump_data(struct domain *d);
 #ifdef CONFIG_HVM
 
 /* Report a change affecting memory types. */
-void p2m_memory_type_changed(struct domain *d);
+bool p2m_memory_type_changed(struct domain *d);
 
 /* Called by p2m code when demand-populating a PoD page */
 bool
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 3a39b5d1246b..b9a7c2dc5302 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -126,12 +126,21 @@ static void _memory_type_changed(struct p2m_domain *p2m)
 {
     if ( p2m->memory_type_changed )
         p2m->memory_type_changed(p2m);
+    else
+        ASSERT_UNREACHABLE();
 }
 
-void p2m_memory_type_changed(struct domain *d)
+bool p2m_memory_type_changed(struct domain *d)
 {
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
 
+    /*
+     * The p2m memory_type_changed hook will be the same for the host p2m or
+     * the altp2ms, do the check early and return if not set.
+     */
+    if ( !hostp2m->memory_type_changed )
+        return false;
+
     p2m_lock(hostp2m);
 
     _memory_type_changed(hostp2m);
@@ -154,6 +163,8 @@ void p2m_memory_type_changed(struct domain *d)
     }
 
     p2m_unlock(hostp2m);
+
+    return true;
 }
 
 int p2m_set_ioreq_server(struct domain *d,
-- 
2.48.1


