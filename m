Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2B52344DF
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 13:56:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Tda-0008Po-LS; Fri, 31 Jul 2020 11:55:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1TdY-0008Pj-VK
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 11:55:44 +0000
X-Inumbo-ID: c25a5cad-d324-11ea-8e29-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c25a5cad-d324-11ea-8e29-bc764e2007e4;
 Fri, 31 Jul 2020 11:55:43 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TMv-0001W4-F1; Fri, 31 Jul 2020 12:38:33 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 19/41] Executive: Drop redundant AND clause
Date: Fri, 31 Jul 2020 12:37:58 +0100
Message-Id: <20200731113820.5765-20-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
References: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In "Executive: Use index for report__find_test" we changed an EXISTS
subquery into a JOIN.

Now, the condition r.flight=f.flight is redundant because this is the
join column (from USING).

No functional change.

CC: George Dunlap <George.Dunlap@citrix.com>
Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index 684cafc3..2f81e89d 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -433,7 +433,6 @@ END
 		   WHERE name=?
                      AND name LIKE 'revision\_%'
 		     AND val=?
-		     AND r.flight=f.flight
                      AND ${\ main_revision_job_cond('r.job') }
 END
             push @params, "revision_$tree", $revision;
-- 
2.20.1


