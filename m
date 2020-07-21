Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1856422886E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 20:42:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxxDg-0001z7-Sp; Tue, 21 Jul 2020 18:42:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8efX=BA=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jxxDe-0001xV-ME
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 18:42:26 +0000
X-Inumbo-ID: e8816efc-cb81-11ea-85a2-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8816efc-cb81-11ea-85a2-bc764e2007e4;
 Tue, 21 Jul 2020 18:42:20 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jxxDX-0001u7-IL; Tue, 21 Jul 2020 19:42:19 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 02/14] sg-report-flight: Sort failures by job name as
 last resort
Date: Tue, 21 Jul 2020 19:41:53 +0100
Message-Id: <20200721184205.15232-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
References: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
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
index 927ea37d..70def778 100755
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


