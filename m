Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FA85510E6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:03:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352426.579245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRV-0003TB-RR; Mon, 20 Jun 2022 07:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352426.579245; Mon, 20 Jun 2022 07:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRV-0003Oi-KK; Mon, 20 Jun 2022 07:03:25 +0000
Received: by outflank-mailman (input) for mailman id 352426;
 Mon, 20 Jun 2022 07:03:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k7+S=W3=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o3BRU-0001Yr-6p
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:03:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 12f97d18-f067-11ec-bd2d-47488cf2e6aa;
 Mon, 20 Jun 2022 09:03:23 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E7DE113E;
 Mon, 20 Jun 2022 00:03:23 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.35.125])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 981AB3F5A1;
 Mon, 20 Jun 2022 00:03:21 -0700 (PDT)
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
X-Inumbo-ID: 12f97d18-f067-11ec-bd2d-47488cf2e6aa
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 6/9] xsm/flask: Use explicitly specified types
Date: Mon, 20 Jun 2022 09:02:42 +0200
Message-Id: <20220620070245.77979-7-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620070245.77979-1-michal.orzel@arm.com>
References: <20220620070245.77979-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to MISRA C 2012 Rule 8.1, types shall be explicitly
specified. Fix all the findings reported by cppcheck with misra addon
by substituting implicit type 'unsigned' to explicit 'unsigned int'.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/xsm/flask/ss/avtab.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/xsm/flask/ss/avtab.c b/xen/xsm/flask/ss/avtab.c
index 017f5183de..9761d028d8 100644
--- a/xen/xsm/flask/ss/avtab.c
+++ b/xen/xsm/flask/ss/avtab.c
@@ -349,7 +349,7 @@ int avtab_read_item(struct avtab *a, void *fp, struct policydb *pol,
     struct avtab_key key;
     struct avtab_datum datum;
     int i, rc;
-    unsigned set;
+    unsigned int set;
 
     memset(&key, 0, sizeof(struct avtab_key));
     memset(&datum, 0, sizeof(struct avtab_datum));
-- 
2.25.1


