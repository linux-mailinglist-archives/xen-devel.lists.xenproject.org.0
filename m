Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F5B234504
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:01:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1TiV-0001M3-Fz; Fri, 31 Jul 2020 12:00:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1TiU-0001Jk-KF
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:00:50 +0000
X-Inumbo-ID: 78ce6d3e-d325-11ea-8e2b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78ce6d3e-d325-11ea-8e2b-bc764e2007e4;
 Fri, 31 Jul 2020 12:00:48 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TMt-0001W4-O5; Fri, 31 Jul 2020 12:38:31 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 15/41] duration_estimator: Explicitly provide null
 in general host q
Date: Fri, 31 Jul 2020 12:37:54 +0100
Message-Id: <20200731113820.5765-16-ian.jackson@eu.citrix.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Our spec. says we return nulls for started and status if we don't find
a job matching the host spec.

The way this works right now is that we look up the nonexistent
entries in $refs->[0].  This is not really brilliant and is going to
be troublesome as we continue to refactor.

Provide these values explicitly.  No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index 4cb22cc9..d45d6557 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -1169,6 +1169,8 @@ END
 
     my $duration_anyref_qtxt= <<END;
             SELECT f.flight AS flight,
+                   NULL as started,
+                   NULL as status,
                    max(s.finished) AS max_finished
 		      FROM steps s JOIN flights f
 		        ON s.flight=f.flight
-- 
2.20.1


