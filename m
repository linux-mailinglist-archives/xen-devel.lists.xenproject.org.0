Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4822344E0
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 13:56:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Tdg-0008QM-U4; Fri, 31 Jul 2020 11:55:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1Tdf-0008Q8-CS
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 11:55:51 +0000
X-Inumbo-ID: c723ccb4-d324-11ea-8e29-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c723ccb4-d324-11ea-8e29-bc764e2007e4;
 Fri, 31 Jul 2020 11:55:50 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TMv-0001W4-Qw; Fri, 31 Jul 2020 12:38:34 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 20/41] schema: Add index for quick lookup by host
Date: Fri, 31 Jul 2020 12:37:59 +0100
Message-Id: <20200731113820.5765-21-ian.jackson@eu.citrix.com>
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

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
v2: Use proper \ escaping for underscores in LIKE
---
 schema/runvars-host-index.sql | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 schema/runvars-host-index.sql

diff --git a/schema/runvars-host-index.sql b/schema/runvars-host-index.sql
new file mode 100644
index 00000000..222a0a30
--- /dev/null
+++ b/schema/runvars-host-index.sql
@@ -0,0 +1,8 @@
+-- ##OSSTEST## 009 Preparatory
+--
+-- This index helps sg-report-host-history find relevant flights.
+
+CREATE INDEX runvars_host_idx
+    ON runvars (val, flight)
+ WHERE name ='host'
+    OR name LIKE '%\_host';
-- 
2.20.1


