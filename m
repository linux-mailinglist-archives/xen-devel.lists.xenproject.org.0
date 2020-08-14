Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A0A244D9C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTd-0004RE-PY; Fri, 14 Aug 2020 17:26:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQF-00024Q-Gb
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:19 +0000
X-Inumbo-ID: 43930bea-aa8c-4fa9-83a8-e5fa9563c9f2
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43930bea-aa8c-4fa9-83a8-e5fa9563c9f2;
 Fri, 14 Aug 2020 17:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=MglmACUtUxOLGTuI7w9qwbU/ZWU0cGEyX3Hyd2Jcx3I=;
 b=d5GTOiKIfRsY3TRj5A7DmrR9DxiRB+AWySNU1enYld9sLyWSgfxcSl9A
 EWj7MEMQgQJ9xbt0tDgSlKCE+/ynQE3dDmXW0D1k7MgxmVstgppdpwCWO
 Hc12Tz42bbimIjKPPX8PS58QVAGID0sbyAZXVDImfsI8Nqa2oGLnq2yRG c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: c+HtNVfBRqiEuS7oPCcV+A5GgAx4Melnt4EpEKEP6BqPLAPx09xcs3kNdbSCGHAVPVf+IdX4UO
 fgVU/EUhnHq7HDQCkrp8i6GcLPdbTYj+GS9G9XC5CHVY9JW6Q/ljlbp0tOVnyu7bzED4ZoQ6t1
 pEABwFd1hl0rpP4mQDtjLClo/XQXOhHOD62xVYTU+EAI47veStj2bf3VI6yp2c8fOtmt7fXvBL
 luJ/yRg+foH1J6njqR6f5tRnQXipxTFOT0uEMWl3LUKQumQDCYA/jKuawmDkcXvoz/NLoWqCMg
 BwQ=
X-SBRS: 2.7
X-MesageID: 24900379
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24900379"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 43/60] sg-report-job-history (nfc): Query hosts
 runvars in one go
Date: Fri, 14 Aug 2020 18:21:48 +0100
Message-ID: <20200814172205.9624-44-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
References: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rather than doing one query for each entry in @hostvarcols, do one
query for all the relevant runvars.  This is quite a bit faster and
will enable us to use the cache.

This is correct because @hostvarcols was the union of all the host
runvars, so this produces the same answers as the individual queries.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index fb2930a9..5d913b96 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -167,16 +167,19 @@ END
     }
 
     my $hostq= db_prepare(<<END);
-        SELECT val FROM runvars WHERE flight=? AND job=? AND name=?
+        SELECT name, val
+          FROM runvars
+         WHERE flight=?
+           AND job=?
+           AND (name = 'host' OR name LIKE '%\\_host')
 END
 
     while (my $f= $flightsq->fetchrow_hashref()) {
         my $ri= report_run_getinfo($f);
 
 	$ri->{Hosts} = { };
-	foreach my $hostvar (@hostvarcols) {
-	    $hostq->execute($f->{flight}, $f->{job}, $hostvar);
-	    my ($host) = $hostq->fetchrow_array();
+	$hostq->execute($f->{flight}, $f->{job});
+	while (my ($hostvar,$host) = $hostq->fetchrow_array()) {
 	    $ri->{Hosts}{$hostvar} = $host;
 	}
 
-- 
2.11.0


