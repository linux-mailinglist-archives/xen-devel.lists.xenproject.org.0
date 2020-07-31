Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE632344A5
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 13:39:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1TNJ-0005vS-Kc; Fri, 31 Jul 2020 11:38:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1TNI-0005kZ-0W
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 11:38:56 +0000
X-Inumbo-ID: 5aa0cf12-d322-11ea-8e26-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5aa0cf12-d322-11ea-8e26-bc764e2007e4;
 Fri, 31 Jul 2020 11:38:29 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TMq-0001W4-Ki; Fri, 31 Jul 2020 12:38:28 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 06/41] sg-report-flight: Sort failures by job name
 as last resort
Date: Fri, 31 Jul 2020 12:37:45 +0100
Message-Id: <20200731113820.5765-7-ian.jackson@eu.citrix.com>
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

This removes some nondeterminism from the output.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-flight | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sg-report-flight b/sg-report-flight
index fc439495..7f2790ce 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -813,6 +813,7 @@ END
 	# they finished in the same second, we pick the lower-numbered
 	# step, which is the earlier one (if they are sequential at
 	# all).
+	or $a->{Job} cmp $b->{Job}
     }
         @failures;
 
-- 
2.20.1


