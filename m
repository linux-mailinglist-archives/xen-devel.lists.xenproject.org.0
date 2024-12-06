Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 508349E7929
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 20:41:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850460.1264886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJeBi-0003Hm-MZ; Fri, 06 Dec 2024 19:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850460.1264886; Fri, 06 Dec 2024 19:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJeBi-0003BV-JR; Fri, 06 Dec 2024 19:40:30 +0000
Received: by outflank-mailman (input) for mailman id 850460;
 Fri, 06 Dec 2024 19:40:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tJeBh-00039x-F5
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 19:40:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tJeBh-007AQk-06;
 Fri, 06 Dec 2024 19:40:29 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tJeBh-0034Np-08;
 Fri, 06 Dec 2024 19:40:29 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=OjhukXx7pWSIpn/U/kPGOQl9prDmsqkVlAfieaq68CM=; b=SZdik9db4AkCvzUuGYbtArpJS9
	31zucKnWQNfy3KhcIm7D1NxIvkT4bLjHHLaYchuzP8fDbmLneymfr0HOwlLleomcrjreQEdWp0eaU
	lMBXvW5GgNm3EjdploGVqa071PITbgx3K96wsQx50K96sbr7Zk7vnGJxMr32ofnjA+F4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.20 1/2] docs/process: branching-checklist: Update the steps to generate the docs
Date: Fri,  6 Dec 2024 19:40:24 +0000
Message-Id: <20241206194025.31662-2-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241206194025.31662-1-julien@xen.org>
References: <20241206194025.31662-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The loop in xenbits-docs-all.sh has been rewritten to use a range rather
than listing all the branch one by one. So update the steps accordingly.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 docs/process/branching-checklist.txt | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
index 3dfa8ec2570b..372d7268d20a 100644
--- a/docs/process/branching-checklist.txt
+++ b/docs/process/branching-checklist.txt
@@ -35,12 +35,11 @@ ov=4.0
 #            xenbits-docs-all.sh in the obvious way. git commit
     ssh xendocs@xenbits.xen.org
     cd cronjobs
-    ed xenbits-docs-all.sh
-    /for branch
-    s/$/ 4.6-testing
+    open xenbits-docs-all.sh with your favorite editor
+    Update the range on the line:
+    for branch in unstable-staging unstable 4.{18..15}-testing
     # ^ OR SIMILAR
-    w
-    q
+    save the file and exit the editor
     git add -p
     git commit -m "Branch for $v"
 
-- 
2.40.1


