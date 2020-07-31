Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEFE234502
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:00:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1TiL-0001Jt-V6; Fri, 31 Jul 2020 12:00:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1TiK-0001Jk-L8
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:00:40 +0000
X-Inumbo-ID: 737bffed-d325-11ea-8e2b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 737bffed-d325-11ea-8e2b-bc764e2007e4;
 Fri, 31 Jul 2020 12:00:40 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TN1-0001W4-UH; Fri, 31 Jul 2020 12:38:40 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 31/41] schema: Add index to help cs-bisection-step
Date: Fri, 31 Jul 2020 12:38:10 +0100
Message-Id: <20200731113820.5765-32-ian.jackson@eu.citrix.com>
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

cs-bisection step basis search involves looking for recent flights
that weren't broken.  A flight is broken if it has broken steps.
Make an index for this to save it scanning the steps table.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 schema/steps-broken-index.sql | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 schema/steps-broken-index.sql

diff --git a/schema/steps-broken-index.sql b/schema/steps-broken-index.sql
new file mode 100644
index 00000000..770747cc
--- /dev/null
+++ b/schema/steps-broken-index.sql
@@ -0,0 +1,7 @@
+-- ##OSSTEST## 010 Harmless
+--
+-- This index helps cs-bisection-flight check if flighss are broken.
+
+CREATE INDEX steps_broken_idx
+    ON steps (flight)
+ WHERE status='broken';
-- 
2.20.1


