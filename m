Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652E3244D91
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTG-0003vk-KL; Fri, 14 Aug 2020 17:26:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dRX-00024Q-J0
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:24:39 +0000
X-Inumbo-ID: ae87fef9-d58f-4359-9043-9c9673ed5038
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae87fef9-d58f-4359-9043-9c9673ed5038;
 Fri, 14 Aug 2020 17:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=PY1/CXlgsiMePo4mO4fgMVytfc+lxDhand1L2bBROQs=;
 b=HPJobP6ZUeEYm94IoQDkSES+8J1Fc/luYOxjnEgMPHHb/LK+YK+RIMoI
 F6PsnDijKOk3VW4ER7ygCJ5z8Adr6aB8Cq6aus4+O+SQq0SOz2HbITDFU
 KZ1zKkfMAz2ApN71MnB4/jLyF86Nzv4X8ArWtr3RIEw4SOuN1a/E1FdtX 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7ezcx7x4srd1zeCAkn0zObS+aQXFWeJkpcnYSbEvKrACqJXXyQgttJnGnVtsJ8cn4bvrcQHsJk
 6jMVpr67Y+3gu1DrpxqDMFsGWsCmEow3xvhkNvxfYopxRpFUJQTzATY2WoF+CnWyzlyHlsAtSB
 6S2JtmytY04WZ0io3dNteeEGLmXYG+Uz51EGsz0KpTSgv0VV5YKI9BYNgsovxMWYa8ev0khE5S
 ABi5SCz+IULYYyfrMmmmeB67GmknN+9tAlUQCNvf22W3BJtK4qCExs7h9n/GSHNv5X6s0dV+6G
 fpo=
X-SBRS: 2.7
X-MesageID: 24576918
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24576918"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 23/60] history reporting (nfc): Documentation for the
 new module
Date: Fri, 14 Aug 2020 18:21:28 +0100
Message-ID: <20200814172205.9624-24-ian.jackson@eu.citrix.com>
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

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/HistoryReport.pm | 27 +++++++++++++++++++++++++++
 sg-report-host-history   |  6 +-----
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/Osstest/HistoryReport.pm b/Osstest/HistoryReport.pm
index cb8c6ca1..6e5ed6ec 100644
--- a/Osstest/HistoryReport.pm
+++ b/Osstest/HistoryReport.pm
@@ -51,6 +51,33 @@ our $rows_previous = 0;
 our $rows_today = 0;
 our $rows_hit = 0;
 
+
+# History report query and processing cache
+#
+# Basic principle:
+#
+# Each HTML output file corresponds to the rows of one
+# primary query.  That primary query yields rows containing
+# (at least) the columns passed to cache_set_key_cols.
+#
+# The HTML files contain caches of per-primary-row queries and
+# computations.  Each such subcomputation is identified by a
+# $cachekey, which is assigned by the calling code (but should be
+# alphanumeric).  The memoisation is keyed off the key columns and
+# $cachekey, so the subcomputation should not depend on anything else.
+#
+# The API is based on a %$jr.
+#
+# %$jr contains one entry for each for each key columns.
+#
+# It also contains one entry for each cached subcomputation.
+# The keys for these entries are "\%$cachekey".
+
+# These routines all expect the file handle ::DEBUG
+# They are not reentrant and can only be used for one HTML
+# output file in one program run.
+
+
 sub cache_set_key_cols { @key_cols = @_; }
 
 sub key ($) {
diff --git a/sg-report-host-history b/sg-report-host-history
index a195bb21..e281986d 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -204,11 +204,7 @@ END
     my $inrows = $hosts{$hostname};
     print DEBUG "FOUND ", (scalar @$inrows), " ROWS for $hostname\n";
 
-    # Each entry in @$inrows is a $jr, which is a hash
-    # It has keys for the result columns in mainquery
-    # It also has keys '%<letter>' (yes, with a literal '%')
-    # which are the results of per-job queries.
-    # The contents of $jr for each job is cached across runs.
+    # Each entry in @$inrows is a HistoryReport $jr
 
     my @rows;
     foreach my $jr (@$inrows) {
-- 
2.11.0


