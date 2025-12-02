Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B236C9B081
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 11:11:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176056.1500609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQNKy-0001on-Qh; Tue, 02 Dec 2025 10:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176056.1500609; Tue, 02 Dec 2025 10:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQNKy-0001mg-NX; Tue, 02 Dec 2025 10:10:24 +0000
Received: by outflank-mailman (input) for mailman id 1176056;
 Tue, 02 Dec 2025 10:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GrWF=6I=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vQNFN-0000il-0U
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 10:04:37 +0000
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [2a00:1450:4864:20::641])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bcb8017-cf66-11f0-980a-7dc792cee155;
 Tue, 02 Dec 2025 11:04:31 +0100 (CET)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-b79af62d36bso316036766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Dec 2025 02:04:31 -0800 (PST)
Received: from tbernhardk-x-u.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f5a4a652sm1501590066b.65.2025.12.02.02.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 02:04:29 -0800 (PST)
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
X-Inumbo-ID: 4bcb8017-cf66-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764669871; x=1765274671; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sRghr6u8t7LZWLGIMGwRWafYIQtc04eqnIv5UNUe8E8=;
        b=J06P0CO88RCodqVp0/JcrupaoYSjqN9CTK254RaL7+s5lo0JCLSJItEyo7duEaJXte
         RdC9R9dMOpFPXU/BgMZpRVWPQzSM1iGunos1vw7E1+zgLsQ0rmGfeV0bPTEWM2iFjHNg
         zh/dwP6a3Lxiu2SoqEBpoFHjXt05eOA1NVKPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764669871; x=1765274671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRghr6u8t7LZWLGIMGwRWafYIQtc04eqnIv5UNUe8E8=;
        b=jnpzug0lDU2zcULXb3YayWUsCEk0ApDLWpY7mnq5pZgjvis+GNhB6xzSvageYoUEXT
         2IwAslUGQsYE7T7ipEyal6VWn1D64/sP5UkVkdSIqvARFZSTdYWkdCBYrJ813XiZf63B
         8/EwxpWyUO6Da9PpvxUHWRSlMHbEIL/lDQ3cA9xw4CwwP809giLM4698ewsUEtoy2XI/
         c04cb19kuLkDp787qcatQybaxHp9JdJNhYQHba3q6LMjTv21DRKsz5Bhet6UDdTB3L8M
         xLH3DvfluMd6D7Hq5ZdTfzm0jTNz+Gve7l98GA8tnsx6f8BluQg2il19oPLp9TBEtIiL
         EjXg==
X-Gm-Message-State: AOJu0YyCOjjf8Fd0Ph29SYeb4j6cPIzKBxuagblW0FyhMVbQ+79OGoR8
	uh7u5/1OWFN7v0GF9GLHF3hTesMaQY0NkZmq3U8kVlQvu7yJbwMNOaia/SYB9q7NwcLBGoGE2Pu
	Go77bFNy2Wr8JbqE=
X-Gm-Gg: ASbGncuoHLNkwwQCqx5V+a5xDZqu2p1OmkQ/sbO/lWhi6+8cOQl79q0bIPtfNBm9Rw1
	LdsE9Zq+IEWjaHGl3Ncr20lxxAGoTBDwP788Nemg8NKuuquiaIheRVl3suQgFFz+acoSFxhHXj+
	uLlEWeDKSwLckNSHBGRtDmvS31RmGWPFjJFoJ4rQzBYTENQBE/dR1GwdmZOhA6wd9GkjenODyCn
	9SDlFfqxL7MewO5hlYIxs5rwOssdRnO4znJY4qta7MYH9CJPXzBMApyJNA9bIpndfFHVaxljlUF
	Ea+e9CoZkEpPjCiDqOMUmWXZ3CGNE9WffpVNlXjtKXd4ReYril5483w+UdxjEFQEBFt9YNZhmtm
	T+gSdYmDZ0JyXldSYxeaCpkYUSW7I6LiEOFIai1vrHF7iEQ8bCjgM/qJaMfTXMY08u5mPd/I9/7
	Tqbj7G0IUEV7VnKIywA8Ky40rrOTGEB9te+zS8
X-Google-Smtp-Source: AGHT+IGot6vEvPPguBDxq3OYexLjA9/V/O8mWyyrxOAKqk22OTHGJdJCH5E0zXvXsB1ELOPdaHJPyg==
X-Received: by 2002:a17:907:c09:b0:b79:cb08:30e with SMTP id a640c23a62f3a-b79cb0803b6mr10985066b.58.1764669870711;
        Tue, 02 Dec 2025 02:04:30 -0800 (PST)
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
X-Google-Original-From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/page_alloc: Much more concise domain_adjust_tot_pages()
Date: Tue,  2 Dec 2025 11:02:37 +0100
Message-Id: <a5adbc25d18c34eb6d46120989d379862cd721bd.1764669686.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Non-functional change to make consuming claims more concise:

When we limit the consumption of claims to the remaining claims
of the domain, we can make the code more concise by limiting the
adjustment to it instead of carrying a special case for it.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Co-authored-by: Roger Pau Monné <roger.pau@citrix.com>

---
Changes
- Use min_t(unsigned long, a, b) as the tool of the trade (Roger Pau Monné)
- Reviewed by Andrew Cooper and Roger Pau Monné(Excluding comments, commit message)
- Regression-tested and included as part of te NUMA work for XenServer 9
- Improved comments and the commit message (non-functional change, comment cleanup)

Previous reviews
----------------

Review with the requested changes to the commit message:
- https://patchew.org/Xen/cover.1757261045.git.bernhard.kaindl@cloud.com/15ae395c6933e74da0cdd8f9d71d349a7bfad3f3.1757261045.git.bernhard.kaindl@cloud.com/

Obsoleted review:
- https://patchew.org/Xen/cover.1755341947.git.bernhard.kaindl@cloud.com/5f417fea5ca8e4da0d4b9679103c3eff4bc92900.1755341947.git.bernhard.kaindl@cloud.com/
---
 xen/common/page_alloc.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1f67b88a89..ae2a560e0a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -510,8 +510,11 @@ static unsigned long avail_heap_pages(
     return free_pages;
 }
 
+/* Adjust the tot_pages and remaining outstanding claims of the domain. */
 unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
 {
+    unsigned long adjustment;
+
     ASSERT(rspin_is_locked(&d->page_alloc_lock));
     d->tot_pages += pages;
 
@@ -519,23 +522,19 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
      * can test d->outstanding_pages race-free because it can only change
      * if d->page_alloc_lock and heap_lock are both held, see also
      * domain_set_outstanding_pages below
+     *
+     * skip claims adjustment when the domain has no outstanding claims
+     * or we unassigned pages from it.
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
+    /* consume claims until the domain's outstanding_claims are exhausted */
+    adjustment = min_t(unsigned long, d->outstanding_pages, pages);
+    d->outstanding_pages -= adjustment;
+    outstanding_claims -= adjustment;
     spin_unlock(&heap_lock);
 
 out:
-- 
2.34.1


