Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE702299D8
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 16:13:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyFUa-00070o-6x; Wed, 22 Jul 2020 14:13:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JiSV=BB=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jyFUY-00070j-Im
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 14:13:06 +0000
X-Inumbo-ID: 75ddec3c-cc25-11ea-8662-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75ddec3c-cc25-11ea-8662-bc764e2007e4;
 Wed, 22 Jul 2020 14:13:05 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jyFUW-000585-NJ; Wed, 22 Jul 2020 15:13:04 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 15/14] Executive: Drop redundant AND clause
Date: Wed, 22 Jul 2020 15:13:02 +0100
Message-Id: <20200722141302.21345-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
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
index 66c93ab9..33de3708 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -433,7 +433,6 @@ END
 		   WHERE name=?
                      AND name LIKE 'revision_%'
 		     AND val=?
-		     AND r.flight=f.flight
                      AND ${\ main_revision_job_cond('r.job') }
 END
             push @params, "revision_$tree", $revision;
-- 
2.20.1


