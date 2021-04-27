Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E28C36CAC5
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 20:01:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118792.225083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS0t-0002DJ-RN; Tue, 27 Apr 2021 18:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118792.225083; Tue, 27 Apr 2021 18:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS0t-0002Be-Ee; Tue, 27 Apr 2021 18:00:47 +0000
Received: by outflank-mailman (input) for mailman id 118792;
 Tue, 27 Apr 2021 18:00:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0r-000290-7P
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0r-0004pr-6A
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:45 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0r-0001mZ-5C
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:45 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lbS0p-0003ln-Ap; Tue, 27 Apr 2021 19:00:43 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=GPsVEgG49IbvxwSgXeOfWoV57FVaGCeJs+NVaTRdMcg=; b=MwcKLUDWBID14rZBNy1FTln4Wl
	0V4UlsEqWjOkSIMETEXYMNjP/8lQFUQmGybeylmLKAhtTDhZR/SgAUpLjD7RyyIepLscF7RSrLo7L
	833hUryWkOInZAN2UVnF0FmQpH4Jjdptv80sE4i45SBl8ymAHGKZYZFiSfkW96EwhTIU=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 4/7] mg-schema-test-database: GetOpt compat: work around arg bundling bug
Date: Tue, 27 Apr 2021 19:00:30 +0100
Message-Id: <20210427180033.9439-5-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210427180033.9439-1-iwj@xenproject.org>
References: <20210427180033.9439-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With -qff it now complains, daftly, that -q doesn't take a value.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-schema-test-database | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mg-schema-test-database b/mg-schema-test-database
index b5906d70..26e35c5b 100755
--- a/mg-schema-test-database
+++ b/mg-schema-test-database
@@ -419,7 +419,7 @@ END
 END
 	withtest ./mg-schema-create -q --no-updates
 
-	withtest ./mg-schema-update -qff apply $wantupdates
+	withtest ./mg-schema-update -q -f -f apply $wantupdates
 
         printf " (seqs)"
         seq_alters=""
-- 
2.20.1


