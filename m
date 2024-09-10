Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFF5973580
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795384.1204745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snyRu-00064i-Qe; Tue, 10 Sep 2024 10:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795384.1204745; Tue, 10 Sep 2024 10:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snyRu-0005xo-N1; Tue, 10 Sep 2024 10:50:18 +0000
Received: by outflank-mailman (input) for mailman id 795384;
 Tue, 10 Sep 2024 10:50:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1snyRt-0005fZ-4q
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:50:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 762f38ed-6f62-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 12:50:15 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id CFBBF4EE07C1;
 Tue, 10 Sep 2024 12:50:14 +0200 (CEST)
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
X-Inumbo-ID: 762f38ed-6f62-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725965415; bh=0ZGnWAy4OCBAC2wBwOqDOV4lU1P+EdH3+Hv5w4eAI60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qYSlSMBRn3Xrj7KrwDqipee9gy4NoJ8F1OswG+80DKPQnxvd9NwCzf+dpnkon5dqo
	 6XiviMgbpiYk4uaOHo+IleWkiI33Y9cbdZqpnpT7yJLKCaZ5dpaiTWpRUu1t9Ps0cL
	 aE4shdjqNYENJN5qsju4f648BY5zPuT7kgq7DC8OMZZYHiJ10eOC58SCW39EVJRL16
	 +cr+V+ORsEzNJ0uuvqiRsKA6qP+qA26ltMU3j03bluMy/ATmdKZAtMm9JHVc0EFFEa
	 gf0g22Vz38FqJzKoepMUDLi/Wej2Xg8ekPJdoCBaAxV1iU2IGhSJuooWwyAKBYZFa2
	 wlfuxDC6e+x/Q==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 2/2] xen/bitmap: remove redundant deviations
Date: Tue, 10 Sep 2024 12:50:07 +0200
Message-Id: <fd221f9c591844e1f684de45981a4f65ca49c72c.1725963889.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725963889.git.federico.serafini@bugseng.com>
References: <cover.1725963889.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove comment-based deviations since a project wide deviation that
cover such cases is present.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes from v1:
- split modifications in two patches.
---
 xen/include/xen/bitmap.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index 5d668053b0..4b642cd420 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -103,13 +103,10 @@ extern int bitmap_allocate_region(unsigned long *bitmap, int pos, int order);
 #define bitmap_switch(nbits, zero, small, large)			  \
 	unsigned int n__ = (nbits);					  \
 	if (__builtin_constant_p(nbits) && !n__) {			  \
-		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
 		zero;							  \
 	} else if (__builtin_constant_p(nbits) && n__ <= BITS_PER_LONG) { \
-		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
 		small;							  \
 	} else {							  \
-		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
 		large;							  \
 	}
 
-- 
2.34.1


