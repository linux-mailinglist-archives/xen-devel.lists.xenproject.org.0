Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ECE244DA9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:27:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTw-00058o-6K; Fri, 14 Aug 2020 17:27:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPy-00024H-Vu
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:03 +0000
X-Inumbo-ID: 1a97b68a-1fac-48d5-b900-1590fcf21c23
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a97b68a-1fac-48d5-b900-1590fcf21c23;
 Fri, 14 Aug 2020 17:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Ru+heD2HjQltYB6F/ucoRh/qmhxY142dsaLXCiB1GEM=;
 b=gqU8NqjwBSvoogZmruDEoILtUOU4Gsst44nSAAxyA6wyYtjI9H7hFpvL
 g4lXOtQ44HHD3jUDi5kZs7HmPCpf3WjVJSRnAbDnMKpqvMkRi29CG4Es5
 CkzLG95UP+MLkA+x6PdbuWtOTQOidx5aCMCiwNzSsuRv66TfeD+TXf+zT 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NjqGCwA9ksvPDY9ql7sXZW7qW8BmVHOqf7FG1Yi8IAvOcKLBGe1fvWu13JYA2SxKBKXLviNmbe
 KjhYuWqfGohvJMHj5JKPbQxckaIIP/RWmztxOk8f2oc4UbFTHjrYN1EBq3zmeKKQEltzZa/2Yy
 08V9+92rKj+gInWRM7LycnPTrw1J4MOTbrNYK27xLSs9/QQpZDjMXgMZvcT8ax2U4uQAtaZFmi
 Vfd8ESPXD1rMpbkF8KqlQLqjiLsYr8JFEetn/fXj0/5dIcrV5cl3Wd7HLPwCReFg7ZHFzM1sN7
 4Ng=
X-SBRS: 2.7
X-MesageID: 24545454
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24545454"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 19/60] history reporting (nfc): Introduce empty
 HistoryReport module
Date: Fri, 14 Aug 2020 18:21:24 +0100
Message-ID: <20200814172205.9624-20-ian.jackson@eu.citrix.com>
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

This is the boilerplate.  Code will appear in it in a moment.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/HistoryReport.pm | 43 +++++++++++++++++++++++++++++++++++++++++++
 sg-report-host-history   |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 Osstest/HistoryReport.pm

diff --git a/Osstest/HistoryReport.pm b/Osstest/HistoryReport.pm
new file mode 100644
index 00000000..c5e7e226
--- /dev/null
+++ b/Osstest/HistoryReport.pm
@@ -0,0 +1,43 @@
+# This is part of "osstest", an automated testing framework for Xen.
+# Copyright (C) 2009-2020 Citrix Inc.
+# 
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU Affero General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+# 
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU Affero General Public License for more details.
+# 
+# You should have received a copy of the GNU Affero General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
+package Osstest::HistoryReport;
+
+use strict;
+use warnings;
+
+BEGIN {
+    use Exporter ();
+    our ($VERSION, @ISA, @EXPORT, @EXPORT_OK, %EXPORT_TAGS);
+    $VERSION     = 1.00;
+    @ISA         = qw(Exporter);
+    @EXPORT      = qw(
+			 cache_set_key_cols
+			 cache_read_previous
+			 cache_row_lookup_prep
+			 cacheable_query
+			 cacheable_fn
+			 cache_write_entry
+			 cache_report_stats
+		    );
+    %EXPORT_TAGS = ();
+
+    @EXPORT_OK   = qw();
+}
+
+use POSIX;
+
+1;
diff --git a/sg-report-host-history b/sg-report-host-history
index 1b4566aa..05a2dfe0 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -27,6 +27,7 @@ use HTML::Entities;
 use POSIX;
 
 use Osstest::Executive qw(:DEFAULT :colours);
+use Osstest::HistoryReport;
 
 our $limit= 2000;
 our $timelimit= 86400 * (366 + 14);
-- 
2.11.0


