Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E289324A3B7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 18:02:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8QXZ-00077E-CK; Wed, 19 Aug 2020 16:02:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7ZT=B5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k8QXY-0006xV-64
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 16:02:16 +0000
X-Inumbo-ID: ecb68983-4e28-4c7e-bf0a-35f14a563bf6
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecb68983-4e28-4c7e-bf0a-35f14a563bf6;
 Wed, 19 Aug 2020 16:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597852923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=p7mP1vtVn+OU33mr73pbYK282VyBZ/DreNKLS9hTU+0=;
 b=SJ6dw3hE9BFNgkGRLBmbF6UgjXb/WshyAjk8IVFKdCMrjq2S5nfv9pUs
 zypsR8G5ACDHfmXyT5tqWy+Qa+JYv/Xrrx0TPhxPyMXgdL0CcSBZ2oRTP
 vtjof+27AaZm/DOqO1DsfSMR9gwH0BrTLh2MmjWvCW5PDeaknFeRhEyHX E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Hi7luPsYY2MTYMITLuDPYOiEvVCM4nubTIq6/jQSBQA+IwwA2WKXOLhfYzAnjxlGI6c3qBm0vB
 E+HsiBTgSPIanwKl1rI2qnCTAQdXNDJdaRdLi4YJffF9B68oWDBFFck3VPE8aDtuai1EyUSfqR
 yIMytJ4Zuy/bgzno2A7QPcSZenN/+epoAEFDOHnkyoPsSTf2v4oDjVbSP2o+e91iZeSI6dS8AF
 LKNmNLzekQSnjv2CFzHJtH2hSI/g0wWg1YjE+bo4Bg5RiIqEEtqy4yd3fbqXqR+fAH7K2Jj5Sm
 wmk=
X-SBRS: 2.7
X-MesageID: 24885411
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,331,1592884800"; d="scan'208";a="24885411"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 7/7] schema: Provide index on flights by start time
Date: Wed, 19 Aug 2020 17:01:43 +0100
Message-ID: <20200819160143.11178-8-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200819160143.11178-1-ian.jackson@eu.citrix.com>
References: <20200819160143.11178-1-ian.jackson@eu.citrix.com>
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

We often use flight number as a proxy for ordering, but this is not
always appropriate and not always done (and sometimes it's a bit of a
bodge).

Provide an index to find flights by start time.  This significantly
speeds up the host allocation $equivstatusq query, and the duration
estimator.

(I have tested this by creating a trial index in the production
database.  That index can be dropped again, preferably after this
commit makes it to production.)

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 schema/flights-started-index.sql | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 schema/flights-started-index.sql

diff --git a/schema/flights-started-index.sql b/schema/flights-started-index.sql
new file mode 100644
index 00000000..c230d9d8
--- /dev/null
+++ b/schema/flights-started-index.sql
@@ -0,0 +1,7 @@
+-- ##OSSTEST## 011 Harmless
+--
+-- This index helps ts-hosts-allocate-Executive find recent instances
+-- of the same job.  It may be useful for other things too.
+
+CREATE INDEX flights_blessing_started_idx
+    ON flights (blessing, started);
-- 
2.11.0


