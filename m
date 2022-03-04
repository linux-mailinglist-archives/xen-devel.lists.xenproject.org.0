Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200944CDC04
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284418.483731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCU9-0003cQ-EY; Fri, 04 Mar 2022 18:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284418.483731; Fri, 04 Mar 2022 18:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCU8-0003KH-Rl; Fri, 04 Mar 2022 18:17:00 +0000
Received: by outflank-mailman (input) for mailman id 284418;
 Fri, 04 Mar 2022 17:48:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC26-0005R5-L6
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:02 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a9a258e-9be3-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 18:47:58 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC22-0008QK-5S; Fri, 04 Mar 2022 18:47:58 +0100
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
X-Inumbo-ID: 3a9a258e-9be3-11ec-8539-5f4723681683
From: Marco Solieri <marco.solieri@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Marco Solieri <marco.solieri@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@unimore.it>,
	Andrea Bastoni <andrea.bastoni@minervasys.tech>,
	Luca Miccio <lucmiccio@gmail.com>
Subject: [PATCH 07/36] xen/arm: add coloring data to domains
Date: Fri,  4 Mar 2022 18:46:32 +0100
Message-Id: <20220304174701.1453977-8-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

We want to be able to associate an assignment of cache colors to each
domain.  Add a configurable-length array containing a set of color
indices in the domain data.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/include/xen/sched.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 10ea969c7a..bfbe72b3ea 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -388,6 +388,10 @@ struct domain
     atomic_t         shr_pages;         /* shared pages */
     atomic_t         paged_pages;       /* paged-out pages */
 
+    /* Coloring. */
+    uint32_t        *colors;
+    uint32_t        max_colors;
+
     /* Scheduling. */
     void            *sched_priv;    /* scheduler-specific data */
     struct sched_unit *sched_unit_list;
-- 
2.30.2


