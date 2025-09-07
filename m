Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 320A1B47C5C
	for <lists+xen-devel@lfdr.de>; Sun,  7 Sep 2025 18:16:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114123.1461285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvI39-0008RI-1R; Sun, 07 Sep 2025 16:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114123.1461285; Sun, 07 Sep 2025 16:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvI38-0008Pi-Uh; Sun, 07 Sep 2025 16:15:30 +0000
Received: by outflank-mailman (input) for mailman id 1114123;
 Sun, 07 Sep 2025 16:15:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bCRb=3S=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1uvI37-0008Bo-Cg
 for xen-devel@lists.xenproject.org; Sun, 07 Sep 2025 16:15:29 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dec10a8d-8c05-11f0-9d13-b5c5bf9af7f9;
 Sun, 07 Sep 2025 18:15:29 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so539136666b.2
 for <xen-devel@lists.xenproject.org>; Sun, 07 Sep 2025 09:15:29 -0700 (PDT)
Received: from MinisforumBD795m.phoenix-carat.ts.net
 ([2a02:1748:f7df:8cb1:5474:d7c3:6edd:e683])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b047b61cf00sm908263766b.15.2025.09.07.09.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Sep 2025 09:15:27 -0700 (PDT)
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
X-Inumbo-ID: dec10a8d-8c05-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757261728; x=1757866528; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXFQDBB6LNVrlSbSbsw2cgbvIju27z1SvRMin6hDLRc=;
        b=V5OR4Hpa9L48OaH7msaicdAZ0GfBmbBpf7uQNSv4XR0OTyhF8MFSWrHcqC8f0rItdm
         AkllrfoAXiuidGEiHffOmxVMOFy1hZLNGT5QHUgCdjGscIlNhcDq8O+ca8B8OWy/3Aki
         lmkm1c9VvEqUHXjX63L+6O+Hfo+sBXFZmpuXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757261728; x=1757866528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXFQDBB6LNVrlSbSbsw2cgbvIju27z1SvRMin6hDLRc=;
        b=jVuJd35+PRqJLKc0pdhjmFG8teZH0MGcYzYH3okqi4MfbX2Kja5yVywGqxgTKDY97x
         mfQ9H7Gbv6b40od/qq4XlXpxuJHnY+0opH3yzwBQ+N8rX8oBN7yvWAI8Wxk3ru5VlGHE
         4pSvjFpIcZu0m8Ks3Ott3mudSM30x0zcN22J+qsFfCo3vkCSI6RCx8/G5DRWz5wcdOV6
         UanCRC2YrI8ZgFLm3enrsTmRiIVrSaILo0QCjrnMBm/x7dzQIYRvG5+9EEiJeZolCEdi
         Jxv2rH1SQt/Np4+KJCG/BkDwYVuCrcxQOK1D/8OMVFuNmAbJB1SbpKBPVFs+kwjKuIwb
         iE/Q==
X-Gm-Message-State: AOJu0YzE7NgBxFqrgjBQMaOPaMI3UK4W1YJ+FbLLbL3D1IEwKCllEkuP
	XErlwzzA8gzY4Ygk9v215yuezaELrjIoIYC+3QFBQl443e02/XVZsBtaC1z3KcGW3pbDvTtZfI8
	tAay7WBo=
X-Gm-Gg: ASbGncuybRQ3dlzsKy0c3rdW3UlpvvUmq/8mMKFUybXFKgMTtyXIzvWUs7/jigsWLAk
	JEyWeELBPaoyGjQpPQCrOnMW5/GeAkyx4qm57JbVbLL4v+adRGSuTWwGcnpFtJ7uGxS7RR9OjBH
	cXwgIj2W4oWps6Xsa5BnPApxjlxz7oO/LQC8ov3Y9+kQ5XOPSx8gSbLuOhe6jXgzvYwiVaKvtKQ
	HSSDkiJXX0u+g/bF70L9FZDbo8qK1KbdYjTEEW5qNJXHa9gYdi8WFeYa9CGc0ZWz6l5GUu9em1t
	i/BPFUeA/oHwNtBhv+BRJmWvrcxN+FbGAbP3mU7W1fpoBGjflTkCVF6pBUwxQcXgtSw5Jkd6riW
	Iydr6pt7aHVGd838R8U2X0tdUcXFsctifOt6/G0Rakj77HCQwAs6c709aJ8CdTuQvX0+vNlZPuY
	DrGA==
X-Google-Smtp-Source: AGHT+IHuGGshBE11UswiTAVCGXRupZTuoOG9Ht4DWbahk+TZ+ISigvCdYg80rgu+VSa57mx1WUdvqg==
X-Received: by 2002:a17:907:3f21:b0:afc:cc64:86da with SMTP id a640c23a62f3a-b04b14f5015mr511931166b.26.1757261728217;
        Sun, 07 Sep 2025 09:15:28 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 3/7] xen/page_alloc: Add and track per_node(avail_pages)
Date: Sun,  7 Sep 2025 18:15:18 +0200
Message-ID: <b9f618a2209b105a1d55418fa3dfb7c270f97b80.1757261045.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757261045.git.bernhard.kaindl@cloud.com>
References: <cover.1757261045.git.bernhard.kaindl@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

The static per-NUMA-node count of free pages is the sum of free memory
in all zones of a node. It's an optimisation to avoid doing that operation
frequently in the following patches that introduce per-NUMA-node claims.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>

---
Changes in v2:
- Added ASSERT(per_node(avail_pages, node) >= request) as requested
  during review by Roger: Comment by me: As we have

  ASSERT(avail[node][zone] >= request);

  directly before it, the request is already valid, so this checks
  that per_node(avail_pages, node) is not mis-accounted too low.

Changes in v3:
- Converted from static array to use per_node(avail_pages, node)
---
 xen/common/page_alloc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index e056624583..b8acb500da 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -486,6 +486,10 @@ static unsigned long node_need_scrub[MAX_NUMNODES];
 static unsigned long *avail[MAX_NUMNODES];
 static long total_avail_pages;
 
+/* Per-NUMA-node counts of free pages */
+DECLARE_PER_NODE(unsigned long, avail_pages);
+DEFINE_PER_NODE(unsigned long, avail_pages);
+
 static DEFINE_SPINLOCK(heap_lock);
 static long outstanding_claims; /* total outstanding claims by all domains */
 
@@ -1074,6 +1078,8 @@ static struct page_info *alloc_heap_pages(
 
     ASSERT(avail[node][zone] >= request);
     avail[node][zone] -= request;
+    ASSERT(per_node(avail_pages, node) >= request);
+    per_node(avail_pages, node) -= request;
     total_avail_pages -= request;
     ASSERT(total_avail_pages >= 0);
 
@@ -1234,6 +1240,8 @@ static int reserve_offlined_page(struct page_info *head)
             continue;
 
         avail[node][zone]--;
+        ASSERT(per_node(avail_pages, node) > 0);
+        per_node(avail_pages, node)--;
         total_avail_pages--;
         ASSERT(total_avail_pages >= 0);
 
@@ -1558,6 +1566,7 @@ static void free_heap_pages(
     }
 
     avail[node][zone] += 1 << order;
+    per_node(avail_pages, node) += 1 << order;
     total_avail_pages += 1 << order;
     if ( need_scrub )
     {
-- 
2.43.0


